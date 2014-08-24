#' Convert JSON string to a list().
#'
#' @param json String representing a JSON object
#' @return A list() representing the JSON object
#' @examples
#' L <- json_to_list("{a:1,b:["x","y","z"]}")
#' @export
json_to_list <- function(json) {
  
  json <- gsub("\n","",json)
  json <- gsub("\\{\\}","list()",json)
  json <- gsub("\\[\\]","list(.ARR=1)",json)
  json <- gsub("\\{","list(",json)
  json <- gsub("\\}",")",json)
  json <- gsub(":","=",json)
  json <- gsub("\\]",")",json)
  json <- gsub("true","TRUE",json)
  json <- gsub("false","FALSE",json)
  
  return(eval(parse(text = json)))
}