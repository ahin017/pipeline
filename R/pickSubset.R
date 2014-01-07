# author Brad Drayton
# date 4/12/2013
# purpose to extract a subset of data based on the which year/years to use.
# the options are to use the most recent year or a particular year.

mostRecentValue = function(data){
  return(data[data$year == max(data$year), c("value", "year")])
}     

yearValue = function(data, year){
  value = data[data$year == year, "value"]
  if(length(value) == 0){
    return(NA)
  }
  return(data.frame(value, rep(year, length(value))))
}

chooseYear = function(data, year){
  
  require(plyr)
  
  # use the year arg to relevant values.
  
  # by() automatically sort so I have sorted (alphabetacly) the country names too.
  
  if( year == "r"){
    values = data.frame(matrix(unlist(by(data, data$country, mostRecentValue)), ncol = 2, byrow = TRUE))
  } else {
    values = as.vector(by(data, data$country, yearValue, year))
  }
  
  countries = sort(as.character(unique(data$country))) 
  
  #we want to bind the countries and values together and sort on value largest to smallest
  
  return(arrange(data.frame(country = countries, value = values[ , 1], year = values[ , 2]), desc(value)))
  
}


# plotdata = chooseYear(data, year = "r")

