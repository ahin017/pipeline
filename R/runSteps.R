# author Brad Drayton
# date 4/12/2013
# purpose This is the run script for the other bits I have made.



setwd("H:/2013/Summer_project/R_scripts")

# load all the functions

source("importCSV.R")
source("pickSubset.R")
source("pickSubset2.R")
source("genericDataSort.R")
source("makeBarplot.R")
source("makeBarplot2.R")
source("flip.R")
source("convert.R")
source("chooseYear.R")
# use them to produce the plot

fileName = "H:/2013/Summer_project/HEALTH_STAT_Data_9ecccd6e-7a62-46a9-945b-87181930910b.csv"
data = import(fileName)
plotdata = chooseYear(data, "r")
plotdata =sortby(plotdata, "Value")
basicBarplot(plotdata, disease = "AIDS")
ggplot2Barplot(plotdata)

# the first alternative:

fileName = "H:/2013/Summer_project/HEALTH_STAT_Data_9ecccd6e-7a62-46a9-945b-87181930910b.csv"
data = import(fileName)
plotdata = chooseYear(data, "r")
ggplot2Barplot(plotdata)

# next alternative: different data source; UN aids
fileName = "H:/2013/Summer_project/AIDSinfo Atlas export.csv"
data = import(fileName)
OECDdata = pickCountries(OECDcountries)
plotdata = chooseYear()



# next alternative: different data source; UN aids
fileName = "H:/2013/Summer_project/whoAIDS.csv"
data = import(fileName)
OECDdata = pickCountries(OECDcountries)
plotdata = chooseYear()


OECDcountries = as.character(unique(data$Country))
OECDcountries = append(OECDcountries, c("Korea, Republic of", "Slovakia", "United States of America"))
# generic data sorter. can take data from various sources.
fileName = "H:/2013/Summer_project/whoAIDS.csv"
data = import(fileName)
data = formatData(data)
OECDdata = pickCountries(data, OECDcountries)
plotdata = chooseYear(OECDdata, "r")

fileName = "H:/2013/Summer_project/datasets/poptotals.csv"
popData = import(fileName)
popData = flip(popData)
popData = chooseYear(popData, "r")
popData = pickCountries(popData, "New Zealand")
plotdata$value = convert(plotdata$value, popData$pop)

ggplot2Barplot(plotdata, main = "Incidence of AIDS in OECD countries", ylab = "Number of people with AIDS")



# lets say we want a line graph for NZ.
data = import("H:/2013/Summer_project/datasets/OECD_AIDS_incidence.csv")
data = pickCountries(data, "New Zealand")
ggplot2Lineplot(data, main = "Incidence of AIDS per 100,000 people in New Zealand", ylab = "cases/100,000")


# now lets look at using number and poplations
data = import("H:/2013/Summer_project/datasets/OECD_AIDS_number.csv")
data = pickCountries(data, "New Zealand")

fileName = "H:/2013/Summer_project/datasets/poptotals.csv"
popData = import(fileName)
popData = flip(popData)
popData = pickCountries(popData, "New Zealand")


data$Value = convert(data$Value, popData$pop[popData$year %in% 1983:2012])
ggplot2Lineplot(data, main = "Incidence of AIDS per 100,000 people in New Zealand", ylab = "cases/100,000")


#And using the WHO data instead
fileName = "H:/2013/Summer_project/whoAIDS.csv"
data = import(fileName)
data = formatData(data)
data = pickCountries(data, "New Zealand")


fileName = "H:/2013/Summer_project/datasets/poptotals.csv"
popData = import(fileName)
popData = flip(popData)
popData = pickCountries(popData, "New Zealand")

data$value = convert(data$value, popData$pop[popData$year %in% c(2001, 2006, 2011)])

ggplot2Lineplot(data, main = "Incidence of AIDS per 100,000 in New Zealand, WHO data", ylab = "Number of people with AIDS")











