#' Converts list() to mongo.bson
#'
#' @param L list() to be converted
#' @return mongo.bson object
#' @export
list_to_bson <- function(L, tz="GMT") {
  B <- traverse_list_recursively(obj = mongo.bson.buffer.create(), L, fun=make_bson, tz)
  B <- mongo.bson.from.buffer(B)
  return(B)
}