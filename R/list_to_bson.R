list_to_bson <- function(L) {
  B <- F(obj = mongo.bson.buffer.create(), L, fun=bsonify)
  B <- mongo.bson.from.buffer(B)
  return(B)
}