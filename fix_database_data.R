
# Read in csv, first making sure NA is read as NA and doesn't turn the column into a string!
# Checknames is false because some of the var names in input are not valid var names in R, so 
# if you use checknames it turns the (,),| into periods and it looks weird plus messes with the variable
# name shortening below
data <- read.csv("Watson/Tostan/Forms.csv", na.strings = '---', check.names=FALSE)
old_names <- names(data)

# Need to fix the (), | before processing
names(data) <-  gsub("\\(", "", names(data))
names(data) <-  gsub("\\)", "", names(data))
names(data) <-  gsub("\\:", "_", names(data))
names(data) <-  gsub(" ", "", names(data))
names(data) <-  gsub("\\|", "_", names(data))
names(data) <- make.names(names(data))

# Rename variable names. We need to only take what comes after the last period.
# I should print out a list of the old/new variable names and compare?
# \\. means literal ., * means everything, . means and
names(data) <-  sub(".*\\.", "", names(data))

#write.csv(data, file = "r-prettified.csv")
library(xlsx)
write.xlsx(x = data, file = "Watson/Tostan/r-data-test-excel.xlsx", sheetName = "TestSheet", row.names = FALSE)
print("wrote to excel")

# Make a .sav file for SPSS
library(haven)
write_sav(data, "Watson/Tostan/r-data-test-spss.sav")

# What if I want to check and see if the variable names are the same/correct in the new version?
print("check variable names")
new_names <- names(data)
check_variable_names <- data.frame(old_names,new_names)

