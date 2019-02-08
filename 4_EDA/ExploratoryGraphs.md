Exploratory Data Analysis: Graphs
================
Katie M Brown
February 6, 2019

### Formulate your Question

A *sharp* question of hypothesis can serve as a dimension reduction tool that can eliminate variables that are not relevant to the question.

We will be looking at an air pollution dataset from the U.S. EPA. The data can be downloaded from here: [data](https://github.com/rdpeng/courses/blob/master/04_ExploratoryAnalysis/exploratoryGraphs/PM25data.zip?raw=true)

A **general** question one could ask about this data is:

> Are air pollution levels higher on the east coast than on the west coast?

A more **specific** question might be:

> Are hourly ozone levels on average higher in New York City than they are in Los Angeles?

Both may be of interest, neither is right or wrong. For this chapter, we will focus on:

> Which counties in the US have the highest levels of ambient ozone pollution?

Side note: ask yourself "Do I have the right data to answer this question?"

### Read in your data

``` r
library(readr)
fileurl <- 'https://aqs.epa.gov/aqsweb/airdata/hourly_44201_2014.zip'
filename <- './Untracked/PM25data.zip'

if (!file.exists(filename)){
      download.file(fileurl,destfile = filename, mode="wb")
}  
if (!file.exists("PM25data")) { 
      unzip(filename,exdir = './Untracked') 
}

ozone <- read_csv('Untracked/hourly_44201_2014.csv',col_types = 'ccccinnccccccncnnccccccc')
```

Make a few adjustments to the column names for later convenience:

``` r
names(ozone) <- make.names(names(ozone))
```

### Take a look at your data

Take a look at your dataset with the nrow, ncol and str()

``` r
nrow(ozone)
```

    ## [1] 9060698

``` r
ncol(ozone)
```

    ## [1] 24

``` r
str(ozone)
```

    ## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame': 9060698 obs. of  24 variables:
    ##  $ State.Code         : chr  "01" "01" "01" "01" ...
    ##  $ County.Code        : chr  "003" "003" "003" "003" ...
    ##  $ Site.Num           : chr  "0010" "0010" "0010" "0010" ...
    ##  $ Parameter.Code     : chr  "44201" "44201" "44201" "44201" ...
    ##  $ POC                : int  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ Latitude           : num  30.5 30.5 30.5 30.5 30.5 ...
    ##  $ Longitude          : num  -87.9 -87.9 -87.9 -87.9 -87.9 ...
    ##  $ Datum              : chr  "NAD83" "NAD83" "NAD83" "NAD83" ...
    ##  $ Parameter.Name     : chr  "Ozone" "Ozone" "Ozone" "Ozone" ...
    ##  $ Date.Local         : chr  "2014-03-01" "2014-03-01" "2014-03-01" "2014-03-01" ...
    ##  $ Time.Local         : chr  "01:00" "02:00" "03:00" "04:00" ...
    ##  $ Date.GMT           : chr  "2014-03-01" "2014-03-01" "2014-03-01" "2014-03-01" ...
    ##  $ Time.GMT           : chr  "07:00" "08:00" "09:00" "10:00" ...
    ##  $ Sample.Measurement : num  0.047 0.047 0.043 0.038 0.035 0.035 0.034 0.037 0.044 0.046 ...
    ##  $ Units.of.Measure   : chr  "Parts per million" "Parts per million" "Parts per million" "Parts per million" ...
    ##  $ MDL                : num  0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 0.005 ...
    ##  $ Uncertainty        : num  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ Qualifier          : chr  NA NA NA NA ...
    ##  $ Method.Type        : chr  "FEM" "FEM" "FEM" "FEM" ...
    ##  $ Method.Code        : chr  "047" "047" "047" "047" ...
    ##  $ Method.Name        : chr  "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" "INSTRUMENTAL - ULTRA VIOLET" ...
    ##  $ State.Name         : chr  "Alabama" "Alabama" "Alabama" "Alabama" ...
    ##  $ County.Name        : chr  "Baldwin" "Baldwin" "Baldwin" "Baldwin" ...
    ##  $ Date.of.Last.Change: chr  "2014-06-30" "2014-06-30" "2014-06-30" "2014-06-30" ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   `State Code` = col_character(),
    ##   ..   `County Code` = col_character(),
    ##   ..   `Site Num` = col_character(),
    ##   ..   `Parameter Code` = col_character(),
    ##   ..   POC = col_integer(),
    ##   ..   Latitude = col_number(),
    ##   ..   Longitude = col_number(),
    ##   ..   Datum = col_character(),
    ##   ..   `Parameter Name` = col_character(),
    ##   ..   `Date Local` = col_character(),
    ##   ..   `Time Local` = col_character(),
    ##   ..   `Date GMT` = col_character(),
    ##   ..   `Time GMT` = col_character(),
    ##   ..   `Sample Measurement` = col_number(),
    ##   ..   `Units of Measure` = col_character(),
    ##   ..   MDL = col_number(),
    ##   ..   Uncertainty = col_number(),
    ##   ..   Qualifier = col_character(),
    ##   ..   `Method Type` = col_character(),
    ##   ..   `Method Code` = col_character(),
    ##   ..   `Method Name` = col_character(),
    ##   ..   `State Name` = col_character(),
    ##   ..   `County Name` = col_character(),
    ##   ..   `Date of Last Change` = col_character()
    ##   .. )

Lets look at some pieces of the dataset. The first 6 rows and a few columns are here

``` r
head(ozone[,c(6:7,10)])
```

    ## # A tibble: 6 x 3
    ##   Latitude Longitude Date.Local
    ##      <dbl>     <dbl> <chr>     
    ## 1     30.5     -87.9 2014-03-01
    ## 2     30.5     -87.9 2014-03-01
    ## 3     30.5     -87.9 2014-03-01
    ## 4     30.5     -87.9 2014-03-01
    ## 5     30.5     -87.9 2014-03-01
    ## 6     30.5     -87.9 2014-03-01

And the last 6 rows with the same columns:

``` r
tail(ozone[,c(6:7,10)])
```

    ## # A tibble: 6 x 3
    ##   Latitude Longitude Date.Local
    ##      <dbl>     <dbl> <chr>     
    ## 1     31.7     -106. 2014-08-31
    ## 2     31.7     -106. 2014-08-31
    ## 3     31.7     -106. 2014-08-31
    ## 4     31.7     -106. 2014-08-31
    ## 5     31.7     -106. 2014-08-31
    ## 6     31.7     -106. 2014-08-31

### Check your n's.

Counting things is a good way to figure out if anything is wrong. If you're expecting 1,000 observations but there are only 20, something is wrong.

Identify landmarks that can be used to check against your data. If you know how many people are in your study, that's something you should check.

In this example, we have *hourly* data for the *entire country*: 2 landmarks for comparison.

Hourly ozone data that comes from monitors across the country. All hours should be represented. Look at Time.Local to see what time measurements are being taken:

``` r
table(ozone$Time.Local)
```

    ## 
    ##  00:00  01:00  02:00  03:00  04:00  05:00  06:00  07:00  08:00  09:00 
    ## 368841 370155 359686 353440 357595 383825 383497 382023 379248 377419 
    ##  10:00  11:00  12:00  13:00  14:00  15:00  16:00  17:00  18:00  19:00 
    ## 377227 378468 378759 380754 382618 384250 385354 385871 385794 386315 
    ##  20:00  21:00  22:00  23:00 
    ## 386259 385033 375050 373217

Another thing we can look at are the states that are being represented.

``` r
library(dplyr)
select(ozone, State.Name) %>% unique %>% nrow
```

    ## [1] 53

To see why our number of states is greater than 50, we can view the unique State.Names:

``` r
unique(ozone$State.Name)
```

    ##  [1] "Alabama"              "Alaska"               "Arizona"             
    ##  [4] "Arkansas"             "California"           "Colorado"            
    ##  [7] "Connecticut"          "Delaware"             "District Of Columbia"
    ## [10] "Florida"              "Georgia"              "Hawaii"              
    ## [13] "Idaho"                "Illinois"             "Indiana"             
    ## [16] "Iowa"                 "Kansas"               "Kentucky"            
    ## [19] "Louisiana"            "Maine"                "Maryland"            
    ## [22] "Massachusetts"        "Michigan"             "Minnesota"           
    ## [25] "Mississippi"          "Missouri"             "Montana"             
    ## [28] "Nebraska"             "Nevada"               "New Hampshire"       
    ## [31] "New Jersey"           "New Mexico"           "New York"            
    ## [34] "North Carolina"       "North Dakota"         "Ohio"                
    ## [37] "Oklahoma"             "Oregon"               "Pennsylvania"        
    ## [40] "Rhode Island"         "South Carolina"       "South Dakota"        
    ## [43] "Tennessee"            "Texas"                "Utah"                
    ## [46] "Vermont"              "Virginia"             "Washington"          
    ## [49] "West Virginia"        "Wisconsin"            "Wyoming"             
    ## [52] "Puerto Rico"          "Country Of Mexico"

Washington D.C., Puerto Rico and Country of Mexico are all represented in this dataset.

### Validation: 1 external source

Match with something outside the dataset. The U.S. standard set in 2008 is 0.075 ppm. The 8-hour average concentration should not be too much higher than 0.075 ppm:

``` r
summary(ozone$Sample.Measurement)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ## -0.00500  0.01900  0.03000  0.03027  0.04100  0.21300

From the summary we an see that the maximum hourly concentration is quite high (0.213 ppm) but in general, the bulk of the distribution is far below 0.075 ppm. Let's get more detail by looking at the quantiles:

``` r
quantile(ozone$Sample.Measurement,seq(0,1,.1))
```

    ##     0%    10%    20%    30%    40%    50%    60%    70%    80%    90% 
    ## -0.005  0.009  0.016  0.022  0.026  0.030  0.035  0.039  0.043  0.050 
    ##   100% 
    ##  0.213

### Try an easy solution

Answer the original question as best you can.

> Which countries in the US have the highest levels of ambient ozone pollution?

``` r
ranking <- group_by(ozone, State.Name, County.Name) %>% summarize(ozone = mean(Sample.Measurement)) %>% as.data.frame %>% arrange(desc(ozone))
```

Look at the top 10:

``` r
head(ranking, 10)
```

    ##    State.Name County.Name      ozone
    ## 1    Colorado Clear Creek 0.05022088
    ## 2  California    Mariposa 0.04849011
    ## 3  California      Nevada 0.04821713
    ## 4    Colorado        Park 0.04799988
    ## 5     Wyoming      Albany 0.04740057
    ## 6    Colorado     Chaffee 0.04732017
    ## 7  California        Inyo 0.04469113
    ## 8        Utah    San Juan 0.04435075
    ## 9  California   El Dorado 0.04363719
    ## 10     Nevada        Elko 0.04346459

Now look at the 10 lowest counties as a comparison:

``` r
tail(ranking,10)
```

    ##      State.Name          County.Name       ozone
    ## 788     Georgia               DeKalb 0.020478241
    ## 789  New Jersey               Warren 0.020137471
    ## 790   Louisiana     West Baton Rouge 0.020091025
    ## 791  Washington              Whatcom 0.020079729
    ## 792      Oregon           Washington 0.019582854
    ## 793    Oklahoma                Caddo 0.017519115
    ## 794 Puerto Rico               Juncos 0.013462225
    ## 795      Alaska Fairbanks North Star 0.013273003
    ## 796 Puerto Rico              Bayamon 0.008517895
    ## 797 Puerto Rico               Catano 0.004490545

Looking at the number of measurements in Mariposa County CA:

``` r
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow
```

    ## [1] 12130

We can look at how ozone varies through the year by looking at monthly averages. First we convert to Date class:

``` r
ozone <- mutate(ozone, Date.Local = as.Date(Date.Local))
```

And now we spit the date by month to look at the average hourly levels

``` r
filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% mutate(month = factor(months(Date.Local), levels = month.name)) %>% group_by(month) %>% summarize(ozone = mean(Sample.Measurement))
```

    ## # A tibble: 12 x 2
    ##    month      ozone
    ##    <fct>      <dbl>
    ##  1 January   0.0408
    ##  2 February  0.0388
    ##  3 March     0.0455
    ##  4 April     0.0498
    ##  5 May       0.0505
    ##  6 June      0.0564
    ##  7 July      0.0522
    ##  8 August    0.0554
    ##  9 September 0.0525
    ## 10 October   0.0489
    ## 11 November  0.0354
    ## 12 December  0.0347

Ozone appears to be higher in summer months AND Nov. and Dec. are missing. Let's do the same for Caddo County, OK

``` r
filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>% mutate(month = factor(months(Date.Local), levels = month.name)) %>% group_by(month) %>% summarize(ozone = mean(Sample.Measurement))
```

    ## # A tibble: 12 x 2
    ##    month       ozone
    ##    <fct>       <dbl>
    ##  1 January   0.0187 
    ##  2 February  0.00156
    ##  3 March     0.00173
    ##  4 April     0.0262 
    ##  5 May       0.0242 
    ##  6 June      0.0203 
    ##  7 July      0.0192 
    ##  8 August    0.0235 
    ##  9 September 0.0194 
    ## 10 October   0.0211 
    ## 11 November  0.0205 
    ## 12 December  0.0128
