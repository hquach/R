#function to assign Treatment/Control status
#lets first make up a fake list of  IDS from 1 to 1000 and 1000 random variables drawn from a normal distribution
df = data.frame("ID"=seq(1,1000), "randomvariable"=rnorm(1000))
#lets now make a function to do the work - you can copy paste this function into your own scripts
# it needs to be given a dataframe and a list of naming options
# Options might be "treatment" and "control", or if there are more than 2 options then it might be "Control", "treatment1", "treatment2", or just "LayoutA", "LayoutB"

RCT_random = function(dataframey, values_to_add){
  
  set.seed(111)
  dataframey$values_to_add[sample(1:nrow(dataframey), nrow(dataframey), FALSE)] <- rep(values_to_add)
  colnames(dataframey)[which(colnames(dataframey)=="values_to_add")] = "Status"
  return(dataframey) }

# so this will take the dataframe called "df" and randomly assign each ROW to "Treatment" or "control"
df_new = RCT_random(df, c("Treatment","Control"))
