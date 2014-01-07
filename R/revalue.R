# author Brad Drayton
# date 13/12/13
# purpose: replace values in a data frame by value instead of index
# find and replace must be the same length

revalue = function(data, find, replace){
  l1 = length(find)
  l2 = length(replace)

  if(l1-l2!=0){
    stop("'find' must be the same length as 'replace'\n") 
  }

  for(i in 1:ncol(data)){
    for(j in 1:length(find)){
      data[,i] = gsub(find[j], replace[j], data[,i])
    }
    
  }
  data
}











