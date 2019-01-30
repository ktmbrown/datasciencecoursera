url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(url,destfile = 'idaho_microdata.csv',method = 'curl')

id_df <- read.csv('idaho_microdata.csv')
head(id_df)
id_df$ACR == 3 && id_df$AGS == 6
agricultureLogical <- id_df$ACR == 3 & id_df$AGS == 6
id_df[which(agricultureLogical),]

library(jpeg)
img_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(img_url, destfile = 'jeff.jpg')
img <- readJPEG('jeff.jpg', native = TRUE)
quantile(img, c(.30,.80))

gdp_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(gdp_url, destfile = 'gdp.csv',method='curl')

edu_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(edu_url, destfile = 'edu.csv', method='curl')

gdp_df <- read.csv('gdp.csv')
edu_df <- read.csv('edu.csv')
head(gdp_df)
head(edu_df)

names(gdp_df)
names(edu_df)

library(plyr)

gdp_df <- rename(gdp_df, CountryCode = X)
names(gdp_df)

names(gdp_df)
names(edu_df)
edu_df$CountryCode
gdp_df$CountryCode

