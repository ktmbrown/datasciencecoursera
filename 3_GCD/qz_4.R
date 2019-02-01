library(dplyr)
id_df <- read.csv('idaho_microdata.csv')
gdp_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(gdp_url, destfile = 'gdp.csv',method='curl')
gdp_df <- read.csv('gdp.csv', skip = 4)
gdp_df$X.4 <- as.numeric(gsub(',','',gdp_df$X.4))
gdp_df1 <- gdp_df[1:190,c(1,2,4,5)]
mean(gdp_df1$X.4)

match('ASM',gdp_df$X)
mean(gdp_df$X.4[1:190], na.rm = TRUE)
names(gdp_df)
head(gdp_df)
grep("^United",gdp_df$X.3)
countryNames <- gdp_df$X.3
grep("^United",countryNames)



edu_df <- read.csv('edu.csv')
gdp_df <- rename(gdp_df1, CountryCode = X)
gdp_df <- rename(gdp_df1, Ranking = X.1)
gdp_df <- rename(gdp_df1, CountryName = X.3)
gdp_df <- rename(gdp_df1, gdpInMillions = X.4)

merge_data <- merge(gdp_df,edu_df,by.x="CountryCode")
sorted_data <- arrange(merge_data,desc(Ranking))

grep("Fiscal year end: June", merge_data$Special.Notes, value = TRUE)


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

table(grepl("2012", sampleTimes))
dates_2012 <- sampleTimes[grep("2012",sampleTimes)]
days <- format(dates_2012,"%a")
table(grepl("Mon",days))
