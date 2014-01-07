# author Brad Drayton
# date 9/12/2013
# purpose to extract a subset of data based on the which year/years to use. 
# the options are to use the most recent year or a particular year.
# all variables will be selected

mostRecentValue = function(subdata){
  return(subdata[subdata$year == max(subdata$year[!is.na(subdata$value)],na.rm = TRUE), ])
}     

yearValue = function(subdata, year){
  value = subdata[subdata$year == year, ]
  if(nrow(value) == 0){
    value[1,] = rep(NA, ncol(subdata))
  }
  return(value)
}

chooseYear = function(data, year){
  require(plyr)
  oldnames = names(data)
  names(data) = tolower(names(data))
  
  if( year == "r"){
    data = ddply(.data = data, .(country), .fun = mostRecentValue)
  } else {
    data = ddply(.data = data, .(country), .fun = yearValue, year)
  }

  names(data) = oldnames
  return(data)
  
}







