################################################################################
# Turn your server csv files into .sav files for SPSS!
# Instructions:

# Type the name of your csv input file here:
input_filename = "~/Desktop/example_csv_file.csv"

# Type the name you want your .sav output file to have here:
output_filename = "~/Desktop/example_sav_output_file.sav"

# Select all of the code in the document by typing ctrl-a, then hit the run button.
# That's it!
################################################################################


# This script takes an input csv file downloaded from the server and turns it into a
# .sav file for SPSS. The two inputs for the script are:
# input_filename (string) the name of the input csv file
# output_filename (string) the name you want the output .sav file to have

# For example, if you have a file on your desktop 'data.csv' and you want to
# turn it into a .sav file called 'spss_data.sav' also on your desktop, then you can type
# make_sav('~/Desktop/data.csv','~/Desktop/spss_data.sav') into the R console.

# First, read in the data from the csv file.
# Here na.strings tells R that NA variables are represented by '---' in the csv
data <- read.csv(input_filename, na.strings = '---', check.names=FALSE)

# Unfortunately, our variable names have characters in them like (,),| that R doesn't like.
# Here, we're telling R to substitute those characters for underscores or "" to delete them
names(data) <-  gsub("\\(", "", names(data)) # Ex replaces ( with ""
names(data) <-  gsub("\\)", "", names(data))
names(data) <-  gsub(" ", "", names(data))
names(data) <-  gsub("\\:", "_", names(data)) # Ex replaces : with _
names(data) <-  gsub("\\|", "_", names(data))

# To make sure we haven't missed any other weird characters, make.names checks to see if all
# of the variable names are now readable
names(data) <- make.names(names(data))

# Now we can remove all of the unecessary words before the last period of each variable name
# Here .* means any number of characters and \\. means a period, so this says take all the characters
# before the last period and change them to "" (delete them)
names(data) <-  sub(".*\\.", "", names(data))

# Make a .sav file for SPSS, saved under output_filename
library(haven)
write_sav(data, output_filename)
