---
title: "Effects of storms on population and economic health"
author: "Katie M Brown"
date: "February 27, 2019"
output: 
  html_document: 
    fig_caption: yes
    keep_md: yes
---
### Abstract
Storms and other severe weather events can cause both public health and economic problems for communities and municipalities. Many severe events can result in fatalities, injuries, and property damage, and preventing such outcomes to the extent possible is a key concern.

This analysis involves exploring the U.S. National Oceanic and Atmospheric Administration's (NOAA) storm database. This database tracks characteristics of major storms and weather events in the United States.

**RESULTS GO HERE**

### Data Processing
The following steps describe the how the data was processed.

1. Read the data from online source
2. Look over the data
3. Subset dataframe by selecting columns needed for analysis
4. Transform BGN_DATE variable from character to accurately reflect data type
5. Check for NAs in subsetted dataframe


```r
library(dplyr)
library(RColorBrewer)
library(ggplot2)

# Step 1:
if(!file.exists("./data")) {
      dir.create("./data")
}

if(!file.exists("./data/FStormData.csv.bz2")) {
      url <- 'https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2'
      download.file(url, destfile = './data/FStormData.csv.bz2',method='curl' )
}

fstorm_df <- read.csv('data/FStormData.csv.bz2', nrows=100)

# Step 2:
str(fstorm_df)
```

```
## 'data.frame':	100 obs. of  37 variables:
##  $ STATE__   : num  1 1 1 1 1 1 1 1 1 1 ...
##  $ BGN_DATE  : Factor w/ 51 levels "1/20/1953 0:00:00",..: 32 32 14 49 7 7 8 2 11 11 ...
##  $ BGN_TIME  : int  130 145 1600 900 1500 2000 100 900 2000 2000 ...
##  $ TIME_ZONE : Factor w/ 1 level "CST": 1 1 1 1 1 1 1 1 1 1 ...
##  $ COUNTY    : num  97 3 57 89 43 77 9 123 125 57 ...
##  $ COUNTYNAME: Factor w/ 40 levels "BALDWIN","BARBOUR",..: 29 1 17 27 13 24 4 37 38 17 ...
##  $ STATE     : Factor w/ 1 level "AL": 1 1 1 1 1 1 1 1 1 1 ...
##  $ EVTYPE    : Factor w/ 3 levels "HAIL","TORNADO",..: 2 2 2 2 2 2 2 2 2 2 ...
##  $ BGN_RANGE : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ BGN_AZI   : logi  NA NA NA NA NA NA ...
##  $ BGN_LOCATI: logi  NA NA NA NA NA NA ...
##  $ END_DATE  : logi  NA NA NA NA NA NA ...
##  $ END_TIME  : logi  NA NA NA NA NA NA ...
##  $ COUNTY_END: num  0 0 0 0 0 0 0 0 0 0 ...
##  $ COUNTYENDN: logi  NA NA NA NA NA NA ...
##  $ END_RANGE : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ END_AZI   : logi  NA NA NA NA NA NA ...
##  $ END_LOCATI: logi  NA NA NA NA NA NA ...
##  $ LENGTH    : num  14 2 0.1 0 0 1.5 1.5 0 3.3 2.3 ...
##  $ WIDTH     : num  100 150 123 100 150 177 33 33 100 100 ...
##  $ F         : int  3 2 2 2 2 2 2 1 3 3 ...
##  $ MAG       : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ FATALITIES: num  0 0 0 0 0 0 0 0 1 0 ...
##  $ INJURIES  : num  15 0 2 2 2 6 1 0 14 0 ...
##  $ PROPDMG   : num  25 2.5 25 2.5 2.5 2.5 2.5 2.5 25 25 ...
##  $ PROPDMGEXP: Factor w/ 3 levels "","K","M": 2 2 2 2 2 2 2 2 2 2 ...
##  $ CROPDMG   : num  0 0 0 0 0 0 0 0 0 0 ...
##  $ CROPDMGEXP: logi  NA NA NA NA NA NA ...
##  $ WFO       : logi  NA NA NA NA NA NA ...
##  $ STATEOFFIC: logi  NA NA NA NA NA NA ...
##  $ ZONENAMES : logi  NA NA NA NA NA NA ...
##  $ LATITUDE  : num  3040 3042 3340 3458 3412 ...
##  $ LONGITUDE : num  8812 8755 8742 8626 8642 ...
##  $ LATITUDE_E: num  3051 0 0 0 0 ...
##  $ LONGITUDE_: num  8806 0 0 0 0 ...
##  $ REMARKS   : logi  NA NA NA NA NA NA ...
##  $ REFNUM    : num  1 2 3 4 5 6 7 8 9 10 ...
```

```r
# Step 3: 
storm <- select(fstorm_df,c('BGN_DATE','EVTYPE','FATALITIES','PROPDMG','CROPDMG'))
head(storm)
```

```
##             BGN_DATE  EVTYPE FATALITIES PROPDMG CROPDMG
## 1  4/18/1950 0:00:00 TORNADO          0    25.0       0
## 2  4/18/1950 0:00:00 TORNADO          0     2.5       0
## 3  2/20/1951 0:00:00 TORNADO          0    25.0       0
## 4   6/8/1951 0:00:00 TORNADO          0     2.5       0
## 5 11/15/1951 0:00:00 TORNADO          0     2.5       0
## 6 11/15/1951 0:00:00 TORNADO          0     2.5       0
```

```r
# Step 4:
storm$BGN_DATE <- as.Date(storm$BGN_DATE,"%m/%d/%Y %H:%M:%S")
head(storm)
```

```
##     BGN_DATE  EVTYPE FATALITIES PROPDMG CROPDMG
## 1 1950-04-18 TORNADO          0    25.0       0
## 2 1950-04-18 TORNADO          0     2.5       0
## 3 1951-02-20 TORNADO          0    25.0       0
## 4 1951-06-08 TORNADO          0     2.5       0
## 5 1951-11-15 TORNADO          0     2.5       0
## 6 1951-11-15 TORNADO          0     2.5       0
```

```r
levels(storm$EVTYPE)
```

```
## [1] "HAIL"      "TORNADO"   "TSTM WIND"
```

```r
# Step 5:
c("NAs in data" = sum(is.na(storm)))
```

```
## NAs in data 
##           0
```

### Results
The following questions will be addressed in this analysis:

1. **Across the United States, which types of events are most harmful with respect to population health?** 
2. **Across the United States, which types of events have the greatest economic consequences? **


#### Question 1
To answer this question, we will look at the total sum of fatalities for each storm type and plot 


```r
df <- aggregate(storm["FATALITIES"], by=storm["EVTYPE"], sum)
df <- df[df$FATALITIES>0,]
df$CODE <- NA
df$CODE[grep("^[^SNOW]*ICE|ICY[^SNOW]*$",df$EVTYPE)] <- "ICE"
```
