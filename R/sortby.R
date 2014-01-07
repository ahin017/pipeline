# author Brad Drayton
# date 9/12/2013
# purpose   order the data frame by a particular variable

sortBy = function(data, var, by, descending = TRUE){
  if(descending){
    return(eval(parse(text = eval(bquote(paste("transform(arrange(data, desc(", .(by),")), ",.(var), " = reorder(", .(var), ", -", .(by), "))", sep = ""))))))
  } else {
    return(eval(parse(text = eval(bquote(paste("transform(arrange(data, ", .(by),"), ",.(var), " = reorder(", .(var), ", ", .(by), "))", sep = ""))))))
  }
}



