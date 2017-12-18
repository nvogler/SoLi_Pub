# Analytics Layer: Machine Learning using Tensorflow
The analytics layer has been written in R to showcase the ability of seamless integration of multiple languages in a project.

1. **Start Virtual Machine rstudio**: gcloud compute instances start rstudio --zone us-west1-a
2. **SSH to Virtual Machine**: gcloud compute ssh rstudio --zone us-west1-a

There are two ways to run the code:
1. **Shell**: Go to the following folder: cd /home/soli/w205_final_project/code/R
    1. **Run script main:** >Rscript main_script.R
        1. train_flag: Whether the model needs to be trained? TRUE OR FALSE (DEFAULT: FALSE)
        2. predict_all: Whether predictions have to made on all or latest period images? (DEFAULT: FALSE)
    2. **Script command:** > Rscript --vanilla main_script.R <train_flag> <predict_all>
    2. **For training and predicting latest image:** > Rscript --vanilla main_script.R TRUE FALSE
    3. **For only predicting:** > Rscript --vanilla main_script.R FALSE FALSE
    
2. **RStudio**: Installed in an virtual machine from port 8787
    1. **Open RStudio:** http://<VM IP ADDRESS>:8787
    2. **Run the following script:** main_fn(train_flag = FALSE, predict_all = FALSE)

TIFF Files are outputted and stored in Google Cloud Storage (soli_ee_data/earthengine/Transformed_assets)
