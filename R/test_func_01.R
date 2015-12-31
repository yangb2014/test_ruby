
my_function <- function(x, y=5) {
  x + y
}

print ( my_function(1, 2) )
print ( my_function(1) )

r <- c(1, 2, 3, 4, 5)
print ( sapply(r, my_function) )

