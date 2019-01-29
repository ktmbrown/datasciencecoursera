library(rhdf5)
created  = h5createFile('example.h5')

# creating groups
created = h5createGroup('example.h5', 'foo')
created = h5createGroup('example.h5', 'baa')
created = h5createGroup('example.h5', 'foo/foobaa')

# listing contents
h5ls('example.h5')

# write to the groups
A <- matrix(1:10, nrow = 5, ncol = 2)
h5write(A, 'example.h5','foo/A')
B <- array(seq(0.1,2.0,by=0.1),dim = c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, 'example.h5','foo/foobaa/B')

# listing contents
h5ls('example.h5')
