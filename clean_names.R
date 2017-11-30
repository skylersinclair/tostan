clean_names <- function(data){
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
}