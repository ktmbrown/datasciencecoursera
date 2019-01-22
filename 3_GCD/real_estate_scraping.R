## xml
library(httr)
library(XML)


fileURL <- 'https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/?sortbyfield=proximity,asc&itemsper=50'
r = GET(fileURL)
doc <- htmlTreeParse(r, useInternal=TRUE)


# Replace all \n by spaces


street <- xpathSApply(doc, "//span[@itemprop='streetAddress']",xmlValue)


