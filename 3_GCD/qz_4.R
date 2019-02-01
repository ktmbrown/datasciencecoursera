library(dplyr)
id_df <- read.csv('idaho_microdata.csv')

gdp_df <- read.csv('gdp.csv', skip = 4)
gdp_df$X.4 <- as.numeric(gsub(',','',gdp_df$X.4))

match('ASM',gdp_df$X)
mean(gdp_df$X.4[1:190], na.rm = TRUE)
names(gdp_df)
head(gdp_df)
grep("^United",gdp_df$X.3)
countryNames <- gdp_df$X.3
grep("^United",countryNames)

gdp_df1 <- gdp_df[1:190,c(1,2,4,5)]
mean(gdp_df1$X.4)

edu_df <- read.csv('edu.csv')
gdp_df <- rename(gdp_df1, CountryCode = X)
