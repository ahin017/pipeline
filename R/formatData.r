# author Brad Drayton
# date 4/12/2013
# purpose:  generic method for handling data from various sources. Format to be useable for any of the graphing methods
# Need: country, value, year
# additionally: unit, disease

# start with country, if each country is listed only once, this is necessary for col/year format.
# alternatively there could be one year of data.

# I need another condition....

# if there is only one year of data, there will be a variable called year or similar.

# so using the two conditions:
# 1) there is a column called year / Year / YEAR, possibly appended with other text.
# 2) 'country' has all unique values

# I can deduce the format of the data.
# the OECD aids data set is used for initial testing
formatData = function(data) {
  #convert everything to character strings to make life easier.
  data = apply(data, c(1, 2), as.character)
  
  yearColumnIndex = grep('[Yy][Ee][Aa][Rr](.*|)',colnames(data)) # find the year column, if there is one.
  
  # there could be many year columns so I i will pick one based on the type of data in there.
  # needs to be 4 numbers
  
  validColumns = grep('[0-9]{4}', data[1,yearColumnIndex])
  
  # if there are several valid year columns, they probably have the same data; take one
  
  yearColumnIndex = yearColumnIndex[validColumns[1]]   
  
  # If there isn't a valid year column things will be done differently... and later, cos its hard.
  
  # I want to find the country column. essentially the same as above.

  countryColumnIndex = grep('[Cc][Oo][Uu][Nn][Tt][Rr][Yy](.*|)',colnames(data))
  # valid columns start with a Capital letter and are followed by any number of lower case letters or spaces
  validColumns = grep('[A-Z][a-z](.*|)', data[1, countryColumnIndex])
  countryColumnIndex = countryColumnIndex[validColumns[1]]   

  # Now I need to get the values for each year/ value combo....
  valueColumnIndex = grep('(.*|)[Vv][Aa][Ll][Uu][Ee](.*|)',colnames(data))
  #Values may have spaces, be followed by a bracketed confidence interval, or be ?
  #this will find any of those things.
  validColumns = grep("([0-9](\\[|\\.[0-9]|)|?)",data[1, valueColumnIndex]) 
  valueColumnIndex = valueColumnIndex[validColumns[1]]
  
  
  #if the values do have a confidence interval, I want to split it into value, upper and lower.
  #this just drops the CI. 
  if(grepl("\\[",data[1,valueColumnIndex])){
    # remove spaces
      data[,valueColumnIndex] = gsub(" ","", data[ ,valueColumnIndex])
    # drop interval  substring(testv, 0, regexpr("\\[",testv)-1)
      data[,valueColumnIndex] = substring(data[ ,valueColumnIndex], 0, regexpr("\\[", data[ ,valueColumnIndex])-1)
  }
  #I want to remove the greater than/less than symbols too.
  data[,valueColumnIndex] = gsub("<", "", data[ ,valueColumnIndex])
  
  
  # I can put it all together now in a dataframe.
  outputdata = data.frame(country = data[ ,countryColumnIndex],
                          year = as.numeric(data[ ,yearColumnIndex]),
                          value = as.numeric(data[ ,valueColumnIndex]))
  
  return(outputdata)
}

