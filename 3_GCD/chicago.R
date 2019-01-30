# dplyr package

library(dplyr)

chicago <- readRDS('chicago_data.rds')
names(chicago)

# subset columns
select(chicago, city:dptp)
select(chicago, -(city:dptp))

# subset rows
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)

chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

# arrange/sort
chicago <- arrange(chicago, date)
head(chicago, 10)
tail(chicago, 10)

# descending
chicago <- arrange(chicago, desc(date))
head(chicago, 10)

# rename: renames a variable in R
names(chicago)
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago)

# mutate: create new variables
chicago <- mutate(chicago, pm25dewtrend = pm25-mean(pm25,na.rm = TRUE))
head(chicago)
head(select(chicago, pm25, pm25dewtrend))

# groupby: split a data frame by category
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold","hot")))
hotcold <- group_by(chicago, tempcat)
hotcold

summarize(hotcold, pm25 = mean(pm25, na.rm=TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
