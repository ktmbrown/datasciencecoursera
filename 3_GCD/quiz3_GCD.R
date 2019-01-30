url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(url,destfile = 'idaho_microdata.csv',method = 'curl')

id_df <- read.csv('idaho_microdata.csv')
head(id_df)
id_df$ACR == 3 && id_df$AGS == 6
agricultureLogical <- id_df$ACR == 3 & id_df$AGS == 6
head(id_df[which(agricultureLogical),],3)

library(jpeg)
img_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(img_url, destfile = 'jeff.jpg')
img <- readJPEG('jeff.jpg', native = TRUE)
quantile(img, c(.30,.80))

gdp_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(gdp_url, destfile = 'gdp.csv',method='curl')

edu_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(edu_url, destfile = 'edu.csv', method='curl')

gdp_df <- read.csv('gdp.csv', stringsAsFactors = FALSE)
edu_df <- read.csv('edu.csv')
head(gdp_df)
head(edu_df)

names(gdp_df)
names(edu_df)

library(dplyr)

gdp_df <- rename(gdp_df, CountryCode = X)
names(gdp_df)

merge_data <- merge(gdp_df,edu_df,by.x="CountryCode")
sorted_data <- arrange(merge_data,desc(Ranking))


# finding average GPD ranking among different income groups
income.groups <- group_by(sorted_data,Income.Group)
summarize(income.groups,Ranking = mean(Ranking, na.rm = TRUE))

# cutting GDP ranking into 5 separate quantile groups
restData$zipGroups <- cut(restData$zipCode,breaks=quantile(restData$zipCode))
table(restData$zipGroups)
merge_data$gdp_groups <- cut(merge_data$Ranking, breaks=5)
table(merge_data$gdp_groups,merge_data$Income.Group)

