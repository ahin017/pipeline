# author Brad Drayton
# date 9/12/2013
# purpose: Change Units. eg from and odds ratio to a relative risk or absolute risk. From raw count to proportional count.
# 
# Inputs
# from
# to
# additional information such as base rates, other denominators

# to start with I will make a method for going from raw counts to relative ones.
# Input agruements:
# 
#  x = variable to be converted
#  denominator = /what?
#  population counts

convert = function(x, pop, den = 100000){
  p = x/as.numeric(pop)
  return(p*den)
}


# # example
# x = 7     # there are 7 people with disease
# 
# pop = 1000 # the population is 1000
# 
# den = 10000  # I want the incidence per 10,000
# 
# convert(x, pop, den)