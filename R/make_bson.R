make_bson <- function(obj, name, value, type) {
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
  } else {
    stop("unknown type.")
  }
  return(obj)
}