make_df <- function(obj, name, value, type) {
  return(rbind(obj, data.frame(name = name, value = as.character(value), type = type)))
}