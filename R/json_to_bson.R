#' Converts JSON to mongo.bson
#'
#' @param J String holding JSON object
#' @return mongo.bson object
#' @export
json_to_bson <- function(J) {
  L <- json_to_list(J)
  B <- list_to_bson(L)
  return(B)
}