# author brad drayton
# date 9 12 2013
# purpose convert a matrix of countries * years into a two column dataframe.


flip = function(data){
  data = apply(data, c(1, 2), as.character)
  
  countryColumnIndex = grep('[Cc][Oo][Uu][Nn][Tt][Rr][Yy](.*|)', colnames(data))
  # valid columns start with a Capital letter and are followed by any number of lower case letters or spaces
  validColumns = grep('[A-Z][a-z](.*|)', data[1, countryColumnIndex])
  countryColumnIndex = countryColumnIndex[validColumns[1]] 
  
country = rep(data[ , countryColumnIndex], length(colnames(data)[grepl("[0-9]{4}", colnames(data))]))
# make an array of years using the column names(years)
year = rep(colnames(data)[grepl("[0-9]{4}", colnames(data))], each = nrow(data))
year = substring(year, gregexpr("[0-9]{4}", year))
x = numeric()
for(i in colnames(data)[grepl("[0-9]{4}", colnames(data))]){
  x = append(x, as.numeric(data[ ,i]))
}

data = data.frame(country = as.character(country) ,year = as.numeric(year), pop = as.numeric(x))
data
  
}


