
# Read in csv, first making sure NA is read as NA and doesn't turn the column into a string!
data <- read.csv("Watson/Tostan/Forms.csv", na.strings = '---', check.names=FALSE)

# Rename variable names. We need to only take what comes after the last period.
# I should print out a list of the old/new variable names and compare?
# \\. means literal ., * means everything, . means and
names(data) <-  sub(".*\\.", "", names(data))

#write.csv(data, file = "r-prettified.csv")
library(xlsx)
write.xlsx(x = data, file = "r-prettified-excel.xlsx", sheetName = "TestSheet", row.names = FALSE)


# write out text datafile and
# an SPSS program to read it
library(foreign)
write.foreign(data, "r-data.txt", "r-data.sps",   package="SPSS")