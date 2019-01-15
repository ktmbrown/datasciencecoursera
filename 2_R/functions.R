add2 <- function(x, y) {
      x + y
}

above10 <- function(x) {
      use <- x > 10
      x[use]
}

above <- function(x, n=10) {
      use <- x > n
      x[use]
}

columnmeans <- function(df,remove_na = TRUE) {
      nc <- ncol(df)
      means <- numeric(nc)
      for(i in 1:nc) {
            means[i] <- mean(df[,i],na.rm = remove_na)
      }
      means
}

myplot <- function(x, y, type = "l", ...) {
      plot(x,y,type = type, ...)
}

f <- function(x,y) { x^2 + y / z} # z will be looked for in the 
                                  # global environment as that is the 
                                  # env. in which the function was defined

make.power <- function(n) {
      pow <- function(x) {
            x^n
      }
      pow
}

f <- function(x) {
      y <- 2
      y^2 + g(x)
}

g <- function(x) {
      a <- 3
      x + a + y
}

cube <- function(x, n) {
        x^3
}