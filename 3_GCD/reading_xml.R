library(XML)

fileURL <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
doc <- xmlTreeParse(fileURL, useInternal = TRUE)

restaurant_name <- xpathSApply(doc,"//name",xmlValue)
restaurant_zip <- xpathSApply(doc, '//zipcode', xmlValue)
rest_df <- data.frame(cbind(restaurant_name, restaurant_zip))

sum(rest_df$restaurant_zip == '21231',na.rm = TRUE)
