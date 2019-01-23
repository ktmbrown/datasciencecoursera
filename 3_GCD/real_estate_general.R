https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/p-1/?sortbyfield=proximity,asc&itemsper=50
https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/p-2/?sortbyfield=featured,desc&itemsper=50
https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/p-3/?sortbyfield=featured,desc&itemsper=50

str1 <- 'https://www.realtytrac.com/mapsearch/real-estate/tx/bexar-county/p-'
str2 <- '/?sortbyfield=proximity,asc&itemsper=50'
final <- data.frame(matrix(ncol = 8, nrow = 0))
colnames(final) <- c('street','state','state','zip','price','bed','bath','sqft')
for(i in 1:5) {
      this.url <- paste(str1,i,str2,sep="")
      temp.df <- real_estate(this.url)
      final <- rbind(final,temp.df)
}
