#' Traverse list recursively and apply function to nodes.
#'
#' @param l list() to be traversed
#' @param obj Initial object which is supposed to be returned
#' @param fun Function to be applied to nodes
#' @return An object of same type as obj made by fun
#' @examples
#' l <- list(a=1,b=list(c=2,d=3))
#' L <- json_to_list(l = l, obj = data.frame(), fun = make_df)
traverse_list_recursively <- function(l, obj, fun) {
  if(length(l) >= 1) {
    
    names <- names(l)
    
    for(i in 1:length(l)) {
      
      if(is.null(names)) {
        name = as.character(i-1)
      } else {
        name = names[i]
      }
      
      if(is.list(l[[i]])) {
        if(is.null(names(l[[i]]))) {
          type = list(a = "[", b = "]")
        } else {
          type = list(a = "{", b = "}")
        }
        obj <- fun(obj, name, "", type$a)
        obj <- F(l[[i]], obj, fun)
        obj <- fun(obj, name, "", type$b)
      } else {
        obj <- fun(obj, name, l[[i]], class(l[[i]]))
      }
    }
  }
  
  return(obj)
}