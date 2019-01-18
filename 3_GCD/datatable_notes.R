library(data.table)

DF <- data.frame(x=rnorm(9),y=rep(c('a','b','c'),each=3),z=rnorm(9))

DT <- data.table(x=rnorm(9),y=rep(c('a','b','c'),each=3),z=rnorm(9))

DF[2,]
DT[2,]
DT[DT$y=="a",]

# no column here but it will subset on rows
DT[c(2,3)]

# subsetting columns
DT[,c(2,3)]

# passing functions
DT[,list(mean(x),sum(z))]

# new columns
DT[,w:=z^2]

# this is not a copy it is a pointer to the original DT. Thus when we alter
# DT, we are actually also alterning DT2 
DT2 <- DT

# CAREFUL!
DT[,y:=2] # col y is replaced with all 2s
DT <- DT2

