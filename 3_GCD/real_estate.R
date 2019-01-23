real_estate <- function(url) {
      r = GET(url)
      doc <- htmlTreeParse(r, useInternal=TRUE)
      
      # Replace all \n by spaces
      
      street <- xpathSApply(doc, "//span[@class='listing-street-address']",xmlValue)
      city <- xpathSApply(doc, "//span[@class='listing-city']",xmlValue)
      state <- xpathSApply(doc, "//span[@class='listing-region']",xmlValue)
      zip <- xpathSApply(doc, "//span[@class='listing-postal']",xmlValue)
      price <- xpathSApply(doc, "//span[@class='data-price']",xmlValue)
      bed <- xpathSApply(doc, "//li[@data-label='property-meta-beds']/span[@class='data-value meta-beds']",xmlValue)
      bath <- xpathSApply(doc, "//li[@data-label='property-meta-baths']/span[@class='data-value']",xmlValue)
      sqft <- xpathSApply(doc, "//li[@data-label='property-meta-sqft']/span[@class='data-value']",xmlValue)
      lotsize <- xpathSApply(doc, "//li[@data-label='property-meta-lotsize']/span[@class='data-value']",xmlValue)
      
      property_df <- data.frame(cbind(street,city,state,zip,price,bed,bath,sqft,lotsize))
      property_df
}