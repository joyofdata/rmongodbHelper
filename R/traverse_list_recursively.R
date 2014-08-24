#' Traverse list recursively and apply function to nodes.
#'
#' @param l list() to be traversed
#' @param obj Initial object which is supposed to be returned
#' @param fun Function to be applied to nodes
#' @return An object of same type as obj made by fun
#' @examples
#' l <- list(a=1,b=list(c=2,d=3))
#' L <- json_to_list(l = l, obj = data.frame(), fun = make_df)
traverse_list_recursively <- function(l, obj, fun, tz="GMT") {
  if(length(l) >= 1) {
    
    names <- names(l)
    
    for(i in 1:length(l)) {
      
      if(is.null(names)) {
        name = as.character(i-1)
      } else {
        name = names[i]
      }
      
      if(name == ".ARR") next()
      
      if(is.list(l[[i]])) {
        if(is.null(names(l[[i]]))) {
          if(length(l[[i]]) == 0) {
            type = list(a = "{", b = "}")
          } else {
            type = list(a = "[", b = "]")
          }
        } else {
          if(!is.null(l[[i]][[".ARR"]])) {
            type = list(a = "[", b = "]")
          } else {
            type = list(a = "{", b = "}")
          }
        }
        obj <- fun(obj, name, "", type$a)
        obj <- traverse_list_recursively(l[[i]], obj, fun, tz)
        obj <- fun(obj, name, "", type$b)
      } else {
        value <- l[[i]]
        type <- class(l[[i]])
        
        if(type == "character") {
          if(substr(value,1,6) == "__time") {
            #7890123456789012345
            #2014-01-01 12:12:12
            value <- as.POSIXct(substr(value,8,17), tz=tz)
            type <- "date"
          } else if(substr(value,1,5) == "__int") {
            value <- as.numeric(gsub("[^0-9]","",value))
            type <- "integer"
          }
        }
        
        obj <- fun(obj, name, value, type)
      }
    }
  }
  
  return(obj)
}