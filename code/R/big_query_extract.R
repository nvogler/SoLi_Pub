#Ref: http://thinktostart.com/using-google-bigquery-with-r/

#'@name get_table
#'@description Get table details from BigQuery
#'@param project
#'@param tablename Options: nss72: district_map, districtwise_mpce,
#'household_characteristics, household_expenditure
#'@return Dataframe of table data
#'@export
#'@import bigrquery
get_table <- function(tablename = 'nss72.districtwise_mpce',
                      project = 'peerless-robot-187203'){
  library(assertthat)
  library(bigrquery)
  #[peerless-robot-187203:nss72.districtwise_mpce]
  sql_str <- sprintf('SELECT * FROM [%s:%s]', project, tablename)
  data <- query_exec(query = sql_str, project = project)
  return(data)
  }

#' @name get_map
#' @description District map
#' @param 
#' @param 
get_map <- function(){return(get_table('nss72.district_map'))}
