# author: Brad Drayton
# date: 16 dec 2013
# purpose: generic function for subsetting data. Could replace chooseYear and pickCountries
# receives a dataset and some subsetting parameters.
# objectives: can be given a variable and a vector of values to extract
# can divide a data frame by a variable then take part of it.
# will probably use subset{base} and plyr functions 
# sorting happens for free if levels = NULL

# # pretend data for trialling
# year = sample(2000:2012, 100, replace = TRUE)
# value = runif(100, 0, 1)
# entity = sample(c("animal", "mineral", "vegetable"), 100, TRUE)
# data = data.frame(entity, value, year)

subsetBy = function(data, by, levels = NULL){
  
  require(plyr)
  
  if(is.null(levels)){
    tempdata = ddply(data, by)
  } else {
    templist = dlply(data, by)
    tempdata = ldply(templist[levels],data.frame)[-1]
  }
  
  tempdata
  
}  

