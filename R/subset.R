# author: Brad Drayton
# date: 16 dec 2013
# purpose: generic function for subsetting data. Could replace chooseYear and pickCountries
# recieves a dataset and some subsetting parameters.
# objectives: can be given a variable and a vector of values to extract
# can divide a data frame by a variable then take part of it.
# will probably use subset{base} and plyr functions 

# pretend data for trialling
year = sample(2000:2012, 100, replace = TRUE)
value = runif(100, 0, 1)
entity = sample(c("animal", "mineral", "vegetable"), 100, TRUE)
data = data.frame(entity, value, year)



