json_to_list <- function(json) {
  
  json <- gsub("\\{\\}","list()",json)
  json <- gsub("\\[\\]","list(.ARR=1)",json)
  json <- gsub("\\{","list(",json)
  json <- gsub("\\}",")",json)
  json <- gsub(":","=",json)
  json <- gsub("\\[","list(.ARR=1,",json)
  json <- gsub("\\]",")",json)
  
  return(eval(parse(text = json)))
}