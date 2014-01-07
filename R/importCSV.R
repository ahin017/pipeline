# author Brad Drayton
# date 4/12/2013
# purpose This script imports a cvs file.
# It is passed the full address for a file and returns
# the file as a data frame


importCSV = function(fileName){
#possible check: make sure the file address is valid. change back slashes to forward slashes and so forth.
return(read.csv(fileName))
}



