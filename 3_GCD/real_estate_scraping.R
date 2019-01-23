## xml
library(httr)
library(XML)


fileURL <- 'https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/?sortbyfield=proximity,asc&itemsper=50'
r = GET(fileURL)
doc <- htmlTreeParse(r, useInternal=TRUE)
propertyDet <- xpathSApply(doc, "//span[@class='propertyInfo']/dd",xmlValue)

# Replace all \n by spaces

street <- xpathSApply(doc, "//span[@itemprop='streetAddress']",xmlValue)
city <- xpathSApply(doc, "//span[@itemprop='addressLocality']",xmlValue)
state <- xpathSApply(doc, "//span[@itemprop='addressRegion']",xmlValue)
zip <- xpathSApply(doc, "//span[@itemprop='postalCode']",xmlValue)
price <- xpathSApply(doc, "//span[@class='propertyInfo']/dd[@class='price']",xmlValue)
bed <- propertyDet[seq(1,length(propertyDet),5)]
bath <- propertyDet[seq(2,length(propertyDet),5)]
sqft <- propertyDet[seq(3,length(propertyDet),5)]

property_df <- data.frame(cbind(street,city,state,zip,price,bed,bath,sqft))
                   