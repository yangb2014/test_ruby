
## section 1 : vector
print ("vector: ")

height <- c(58, 59, 60, 61)
print (height)

a <- seq(0, 100, by=10)
print (a)

v <- 1:10
print ( length(v) )

v <- seq(0, 100, by=25)
print (v)
print (v[2])
print (v[2:4])
print (v[ c(2,4) ])


## section 2 : list
print ("list: ")

peter <- list(name = 'Peter', age = 30, glasses = TRUE)
print (peter)
print (peter[1])
print (peter$name)
print (peter[['name']])
print (peter[['na']])
print (peter[['na', exact=FALSE]])


## section 3 : matrix
print ("matrix: ")

m <- matrix(1:20, nrow = 5, ncol = 4)
print (m)

m <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE)
print (m)

print (m[10])
print (m[3, 4])
print (m[3:5])
print (m[3:5, 2:3])

dimnames(m) <- list(c('a', 'b', 'c', 'd', 'e'), c('p', 'q', 'r', 's'))
print (m)


## section 4 : array
print ("array: ")

a <- array(1:24, c(2, 3, 4))
print (a)
print (a[10])
print (a[2, 3,])
print (a[1, 2, 3])
print (a[, 2, 3])
print (a[, , 3])
print (a[, 2, ])


## section 5 : factor
print ("factor: ")

colors <- c('green', 'red', 'blue')
factor(colors)
results <- c('poor', 'average', 'good')
factor(results)

print (colors)
print (results)

factor (results, order = TRUE, levels = results)


