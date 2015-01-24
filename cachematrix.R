## Matrix inversion can be a very time consuming procedure, especially for large data-sets or when used repeateadly insead a for-loop
## The following two functions are used to cache the inverse of a Matrix, so that if we need it again we do not have to compute it again. 

## 

#The first function, makeCacheMatrix creates a  list containing a function to
#set the value of the matrix
#get the value of the matrix
#set the value of the inverse
#get the value of the inverse


makeCacheMatrix <- function(x = matrix()) {

    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}
  


## The cacheSolve function calculates the inverse of the matrix created with the above function. However, it first checks to see if the inverse has already been
# calculated. In that case it gets the inverse from the cache and skips the calculation. Otherwise it calculates the inverse of the matrix using the solve function
#and sets the value of the inverse in the cache via the setinverse function. 

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(X)
  x$setinverse(m)
  m
}



#


