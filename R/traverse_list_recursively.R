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