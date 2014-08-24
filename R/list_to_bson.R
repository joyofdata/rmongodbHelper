#' Converts list() to mongo.bson
#'
#' @param L list() to be converted
#' @return mongo.bson object
#' @export
list_to_bson <- function(L) {
  B <- traverse_list_recursively(obj = mongo.bson.buffer.create(), L, fun=make_bson)
  B <- mongo.bson.from.buffer(B)
  return(B)
}