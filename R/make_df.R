#' Adds new line to a data.frame()
#'
#' @param obj Initial data.frame()
#' @param name String holding name of node
#' @param value logical, numeric or string holding  value of node
#' @param type Identifier for type of node
#' @return obj with line added representing new node
#' @export
make_df <- function(obj, name, value, type) {
  return(rbind(obj, data.frame(name = name, value = as.character(value), type = type)))
}