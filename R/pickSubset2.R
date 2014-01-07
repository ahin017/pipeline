# author Brad Drayton
# date 4/12/2013
# purpose:  choose OECD countries from aids data. More generically, choose a subset of countries.
# purpose: pick a particular year or years.

# In this case I only want data from the OECD countries.
pickCountries = function(data, countries){ 
  oldnames = names(data)
  names(data) = tolower(names(data))


  data = data[data$country %in% countries , ]
  data$country = as.character(factor(data$country))
  
  names(data) = oldnames
  
  return(data)
}

# #there is one OECD country that has a different name. Which one? Korea.
# OECDcountries[!OECDcountries %in% OECDdata$Estimated.HIV.Prevalence]

chooseYear2 = function(data, year){
   
}

