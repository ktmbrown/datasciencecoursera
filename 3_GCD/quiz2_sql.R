
# If running multiple times, reset the data frame myBook_df

library(XML)
library(httr)
quiz_url <- "http://biostat.jhsph.edu/~jleek/contact.html"
quiz_html <- readLines(quiz_url)
nchar(quiz_html[c(10,20,30,100)])

fort_df <- read.fwf('getdata_wksst8110.for',c(12, 7, 4, 9, 4, 9, 4, 9, 4),skip=4)
