# author Brad Drayton
# date 4/12/2013
# purpose: alternative plotting function for the data. ggplot2


ggplot2Barplot = function(data, main = "", ylab = ""){
require(ggplot2)

oldnames = names(data)
names(data) = tolower(names(data))

data <- transform(data, country=reorder(country, -value) ) 

ggplot(data, aes(x = country, y = value)) +
  ylab(ylab) +
  ggtitle(main) +
  geom_bar() +
  geom_hline(yintercept = mean(data$value)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


}


ggplot2Lineplot = function(data, main = "", ylab = ""){
  require(ggplot2)
  
  oldnames = names(data)
  names(data) = tolower(names(data))
  
  ggplot(data, aes(x = year, y = value)) +
    ylab(ylab) +
    ggtitle(main) +
    geom_line()
  
  
}