#' Adds new item to mongo.bson.buffer
#'
#' @param obj Initial mongo.bson.buffer
#' @param name String holding name of node
#' @param value logical, numeric or string holding  value of node
#' @param type Identifier for type of node
#' @return mongo.bson.buffer with new item added
#' @export
make_bson <- function(obj, name, value, type) {
  name <- sub("_\\$","$",name)
  
  if(type == "{") {
    mongo.bson.buffer.start.object(obj, name)
  } else if(type == "[") {
    mongo.bson.buffer.start.array(obj, name)
  } else if(type == "numeric") {
    mongo.bson.buffer.append.double(obj, name, value)
  } else if(type == "character") {
    mongo.bson.buffer.append.string(obj, name, value)
  } else if(type == "logical") {
    mongo.bson.buffer.append.bool(obj, name, value)
  } else if(type == "}" || type == "]") {
    mongo.bson.buffer.finish.object(obj)
  } else if(type == "time") {
    mongo.bson.buffer.append.timestamp(obj, name, mongo.timestamp.create(value,1))
  } else {
    stop("unknown type.")
  }
  return(obj)
}