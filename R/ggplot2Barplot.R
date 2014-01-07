# author Brad Drayton
# date 4/12/2013
# purpose: alternative plotting function for the data. ggplot2


ggplot2Barplot = function(data, main = "", ylab = ""){
require(ggplot2)

oldnames = names(data)
names(data) = tolower(names(data))



plot = ggplot(data, aes(x = country, y = value)) +
  ylab(ylab) +
  ggtitle(main) +
  geom_bar() +
  #geom_hline(yintercept = mean(data$Value)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

names(data) = oldnames

print(plot)
}
