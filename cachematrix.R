## This script contains two methods that will be used to create/store matrices that contain efficient storage/calculation
## of their inverses to minimise computation time for future calls for inverse
## Function names: makeCacheMatrix, cacheSolve

## This function will create a list object containing a placeholder for a matrix and the inverse
## Access/modification of data is through get and set methods contained in the list output

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setinverse <- function(inverse) {
    inv <<- inverse 
  }
  
  getinverse <- function() {
    inv
  }
  
  return (list(set = set, get = get,
               setinverse = setinverse,
               getinverse = getinverse)
          )
  
}


## This function will return the inverse of the supplied matrix.
## If it is not already calculated, it will calculate it, return it, and cache the value in the the matrix data object

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
  
  inverse <- x$getinverse()
  if (!is.null(inverse)) {  # Inverse has already been calculated
    
    message("Obtaining cached inverse matrix")
    return (inverse)
    
  } else {  # Inverse not already calculated
    
    d <- x$get()
    inverse <- solve(d)
    x$setinverse(inverse)
    return (inverse)
    
  }
  
}
