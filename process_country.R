process_country <- function(file_name, country_name, period){
  source("clean_names.R")
  country_data <- read.csv(file_name, na.strings = '---', check.names=FALSE)
  names(country_data) <- clean_names(country_data)
  country_data$country_name <- country_name
  country_data$period <- period
  
  # add in the village type data
  dict <- read.csv("village_types.csv")
  country_data$village_type <- with(dict, village_type[match(country_data$village, village)])
  
  # Make sure everything is in factors not chars
  country_data$country <- as.factor(country_data$country)
  country_data$period <- as.factor(country_data$period)
  
  return(country_data)
}