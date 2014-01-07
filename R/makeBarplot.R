# author Brad Drayton
# date 4/12/2013
# purpose make a barplot of year vs incidence. user can specify which data to use with the "year" argument 

# The data has the disease name in col 1, the unit is col 2, the country in col 3, the year in col 4
# and the value in col 5, 
# whether the value is an estimate or not is indicated in col 6

# col 1 and 2 will be used in the main title.

# col 2 is the y axis label. 

# col 3 is the x axis names and the column title is the x axis title.

# I may use the col 6 info to produce asteri and a footnote....

# assume I have the data from the previous step....

# These are functions used in this script.

  


#this function gets the data and which year to use.
basicBarplot = function(data, disease){

  # make the bar plot
  par(mar = c(10, 5, 5, 5), mgp = c(4, 1, 0)) 
  with(data,  
  barplot(height = Value, 
          names.arg = Country,
          las = 3,
          xlab = "Country",
          ylab = "Incidence/100,000 people",
          main = paste("Incidence of", disease, "per 100,000 people in OECD countries")    
  ))
  
  # add the average line
  # first calculate the unweighted average
  avg = mean(data$Value)
  # then draw the line
  abline(h = avg)

}




     

  

