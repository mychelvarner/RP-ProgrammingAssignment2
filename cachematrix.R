## Put comments here that give an overall description of what your
## functions do
## mev Two functions are created.
## mev The first creates a list that sets the data, gets the data, 
## mev sets the inverse, gets the invervse.  This is used by:
## mev **example from Alan E. Berger**
## mev > m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
## mev > myMatrix_object <- makeCacheMatrix(m1)
## mev The second calculates or retrives the cached inverse
## mev **example from Alan E. Berger**
## mev > cacheSolve(myMatrix_object)

## Write a short comment describing this function
## mev creates the list

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## mev determines the inverse of the matrix

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i}
