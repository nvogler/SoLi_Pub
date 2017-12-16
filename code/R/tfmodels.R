response <- function() "median_mpce"
features <- function(data) setdiff(colnames(data), response())

#'@name input_fn
#'@description
#'@param data
#'@param num_epochs
input_fun <- function(data,num_epochs = 1){
  input_fn(data,features = features(data), response = response(), num_epochs=num_epochs)
}

#'@name pred_input_fn
#'@description
#'@param data
#'@param num_epochs
pred_input_fun <- function(data,num_epochs = 1){
  input_fn(data,features = features(data), num_epochs=num_epochs)
}

#'@name model_fun
#'@description Customize the Estimator
#'@param features
#'@param labels
#'@param mode
#'@param params
#'@param config
#'@return Estimator specification.
model_fun <- function(features, labels, mode, params, config) {
  # Connect the first hidden layer to input layer
  first_hidden_layer <- tf$layers$dense(features, 3L, activation = tf$nn$relu)
  # Connect the second hidden layer to first hidden layer with relu
  second_hidden_layer <- tf$layers$dense(first_hidden_layer, 3L, activation = tf$nn$relu)
  # Connect the output layer to second hidden layer (no activation fn)
  output_layer <- tf$layers$dense(second_hidden_layer, 1L)
  # Reshape output layer to 1-dim Tensor to return predictions
  predictions <- tf$reshape(output_layer, list(-1L))
  # Provide an estimator spec for `mode_keys()$PREDICT`
  if (mode == mode_keys()$PREDICT) return(estimator_spec(mode = mode,
                                                         predictions=list(median_mpce=predictions)))
  # Calculate loss using mean squared error
  loss <- tf$losses$mean_squared_error(labels, predictions)
  eval_metric_ops <- list(rmse = tf$metrics$root_mean_squared_error(tf$cast(labels,tf$float64),
                                                                    predictions))
  optimizer <- tf$train$GradientDescentOptimizer(learning_rate = params$learning_rate)
  train_op <- optimizer$minimize(loss = loss, global_step = tf$train$get_global_step())
  # Provide an estimator spec for `model_keys()$EVAL` and `model_keys()$TRAIN` modes.
  return(estimator_spec(mode=mode,loss=loss,train_op=train_op,eval_metric_ops=eval_metric_ops))
}




#'@name build_custom_regressor
#'@description Build a customized Deep Neural Network.
#'@param data Contains training data.
#'@param response Feature which is chosen as response variable.
#'@param model_fn Customized Estimator.
#'@param num_epochs Number of Epochs.
#'@param learning_rate Learning Rate.
#'@param model_loc Default New Model. Best model at ./tmp/v211117
build_custom_regressor <- function(data,
                                   response = 'median_mpce',
                                   model_fn = model_fun,
                                   num_epochs = 300,
                                   learn_rate = 0.001,
                                   model_loc = './tmp/v211117'){
  data[is.na(data)] <- 0 # Convert NA into 0
  rex_idx <- which(is.na(data[,response]))
  # Cells which do not have EasyDay Stores today.
  # predicted.cells <- NULL
  # predict.cells <- data[rex_idx,-1] 
  # predict.cells <- data.frame(apply(predicted.cells,2,scale), stringsAsFactors = FALSE)
  if(length(rex_idx)>0){data <- data[-rex_idx,]}
  
  cex_idx <- which(colnames(data) %in% c('lat','lng'))
  if(length(cex_idx)>0){data <- data[,-cex_idx]}
  
  #SCALE DATA FOR ANALYSIS 
  data <- data.frame(apply(data,2,scale), stringsAsFactors = FALSE)
  #pca.x <- pca.data(data)
  #data <- data.frame(data$avg_sales, pca.x, stringsAsFactors = FALSE)
  #colnames(data) <- c('avg_sales',colnames(pca.x))
  partitions <- modelr::resample_partition(data, c(test = 0.2, train = 0.8))
  train.data <- as.data.frame(partitions$train)
  test.data  <- as.data.frame(partitions$test)
  #' We've defined our model function -- we can now use the `estimator()`
  #' function to create an instance of the estimator we've defined, using
  #' that model function.
  model <- estimator(model_fn,params=list(learning_rate = learn_rate),model_dir=model_loc)
  #' Now, we can train, evaluate, and predict using our estimator.
  train(model, input_fn = input_fun(train.data, num_epochs = num_epochs))
  eval <- evaluate(model, input_fn = input_fun(test.data))
  print(eval)
  tensorboard(log_dir=model_loc,launch_browser = TRUE)
  res <- predict(model, input_fn = input_fun(data))
  plot(unlist(res),data[,response], xlab = 'Estimated Predictions', ylab = 'Actual Response')
  print(summary(lm(unlist(res)~data[,response])))
  return(res)
}


build_regressor <- function(data,
                            response='median_mpce',
                            model_loc="./tf/dnn/tst2",
                            save_loc="./tf/dnn/model_tst2",
                            no_epochs = 200000L,
                            no_steps = 10000L,
                            checkpoint = NULL){
  library(tensorflow)
  library(tfestimators)
  library(modelr)
  partitions <- modelr::resample_partition(data, c(test = 0.2, train = 0.8))
  train.data <- as.data.frame(partitions$train)
  test.data  <- as.data.frame(partitions$test)
  
  # construct feature columns
  feature_columns <- feature_columns(column_numeric(setdiff(colnames(data),response)))
  neurons <- ncol(data) - 1
  model <- dnn_regressor(feature_columns=feature_columns,
                         hidden_units=c(neurons,neurons,neurons),
                         model_dir = model_loc)
  train(model, input_fn=input_fun(train.data, num_epochs = no_epochs),
        steps = no_steps)
  eval <- evaluate(model, input_fn = input_fun(test.data), steps = 10L)
  tensorboard(log_dir = model_loc, launch_browser = TRUE)
  print(eval)
  #tensorboard(log_dir = "./tmp/custom_reg", launch_browser = TRUE)
  res <- predict(model, input_fn = input_fun(data),checkpoint_path = checkpoint)
  print(summary(lm(unlist(res)~data[,response()])))
  export_savedmodel(model, save_loc)
  saveRDS(model,paste0('./tf/tf_model.Rds'))
  return(res)
}

#with tf.Session(graph=tf.Graph()) as sess:
# tf.saved_model.loader.load(sess, ["foo-tag"], export_dir)
tf_predict <- function(newdata,model_loc){
  # construct feature columns
  neurons <- ncol(newdata)
  feature_columns <- feature_columns(column_numeric(colnames(newdata)))
  model <- dnn_regressor(feature_columns=feature_columns,
                         hidden_units=c(neurons,neurons,neurons),model_dir = model_loc)
  res <- predict(model, input_fn = pred_input_fun(newdata))
  #res <- predict(input_fn = input_fun(data), checkpoint_path = model_loc)
  return(unlist(res))
}
