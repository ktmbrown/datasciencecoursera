Editing Text Variables
================
Katie M Brown
January 30, 2019

Camera Data
===========

Getting the data from the baltimore city website:

``` r
if(!file.exists("./data")){dir.creat("./data")}
fileUrl <- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'
download.file(fileUrl, destfile = './data/cameras.csv',method = 'curl')
cameraData <- read.csv('./data/cameras.csv')
names(cameraData)
```

    ## [1] "address"      "direction"    "street"       "crossStreet" 
    ## [5] "intersection" "Location.1"

Changing names to all lower case

``` r
tolower(names(cameraData))
```

    ## [1] "address"      "direction"    "street"       "crossstreet" 
    ## [5] "intersection" "location.1"

``` r
names(cameraData)
```

    ## [1] "address"      "direction"    "street"       "crossStreet" 
    ## [5] "intersection" "Location.1"

strsplit()
----------

Good for auto splitting variable names parameters are: x = vector, split = character vector to use for splitting

``` r
splitNames <- strsplit(names(cameraData),'\\.')
splitNames[[5]]
```

    ## [1] "intersection"

``` r
splitNames[[6]][2]
```

    ## [1] "1"

List review
-----------

Sidenote on lists

``` r
myList <- list(letters = c("a","b","c"),numbers = 1:3, matrix(1:25,ncol=5))
head(myList)
```

    ## $letters
    ## [1] "a" "b" "c"
    ## 
    ## $numbers
    ## [1] 1 2 3
    ## 
    ## [[3]]
    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]    1    6   11   16   21
    ## [2,]    2    7   12   17   22
    ## [3,]    3    8   13   18   23
    ## [4,]    4    9   14   19   24
    ## [5,]    5   10   15   20   25

``` r
myList[1]
```

    ## $letters
    ## [1] "a" "b" "c"

``` r
myList$letters
```

    ## [1] "a" "b" "c"

``` r
myList[[1]]
```

    ## [1] "a" "b" "c"

Fixing character Vectors
------------------------

sapply() applies a function to each element in a vector or list important parameters: x = data, fun = function to be applied

``` r
splitNames[[6]][1]
```

    ## [1] "Location"

``` r
firstElement <- function(x){x[1]}
# this returns a vector instead of a list because we are looking at the first element
# in each item in the list
sapply(splitNames,firstElement)
```

    ## [1] "address"      "direction"    "street"       "crossStreet" 
    ## [5] "intersection" "Location"

``` r
# whereas before, we would get a list when we printed splitNames
splitNames
```

    ## [[1]]
    ## [1] "address"
    ## 
    ## [[2]]
    ## [1] "direction"
    ## 
    ## [[3]]
    ## [1] "street"
    ## 
    ## [[4]]
    ## [1] "crossStreet"
    ## 
    ## [[5]]
    ## [1] "intersection"
    ## 
    ## [[6]]
    ## [1] "Location" "1"

------------------------------------------------------------------------------
==============================================================================

Peer review data
================

Getting the data

``` r
fileUrl1 <- 'https://raw.githubusercontent.com/jtleek/modules/master/03_GettingData/04_01_editingTextVariables/data/reviews.csv'
fileUrl2 <- 'https://raw.githubusercontent.com/jtleek/modules/master/03_GettingData/04_01_editingTextVariables/data/solutions.csv'
download.file(fileUrl1, destfile='./data/reviews.csv',method = 'curl')
download.file(fileUrl2, destfile = './data/solutions.csv', method = 'curl')
reviews <- read.csv('./data/reviews.csv')
solutions <- read.csv('./data/solutions.csv')
head(reviews,2)
```

    ##   id solution_id reviewer_id      start       stop time_left accept
    ## 1  1           3          27 1304095698 1304095758      1754      1
    ## 2  2           4          22 1304095188 1304095206      2306      1

``` r
head(solutions,2)
```

    ##   id problem_id subject_id      start       stop time_left answer
    ## 1  1        156         29 1304095119 1304095169      2343      B
    ## 2  2        269         25 1304095119 1304095183      2329      C

sub()
-----

Removing underscore(\_) from names:

``` r
names(reviews) <- sub("_","",names(reviews))
names(reviews)
```

    ## [1] "id"         "solutionid" "reviewerid" "start"      "stop"      
    ## [6] "timeleft"   "accept"

``` r
names(solutions) <- sub("_","",names(solutions))
names(solutions)
```

    ## [1] "id"        "problemid" "subjectid" "start"     "stop"      "timeleft" 
    ## [7] "answer"

gsub()
------

sub removes FIRST character

``` r
testname <- 'this_is_a_test'
sub("_","",testname)
```

    ## [1] "thisis_a_test"

gsub does all

``` r
gsub("_","",testname)
```

    ## [1] "thisisatest"

grep()
------

grep: returns a vector of the indices of the elements of x that yielded a match

``` r
grep("Alameda", cameraData$intersection)
```

    ## [1]  4  5 36

returns integer(0) when match not found

``` r
grep("JeffStreet", cameraData$intersection)
```

    ## integer(0)

grepl: returns a logical vector (match or not for each element of x).

``` r
table(grepl("Alameda", cameraData$intersection))
```

    ## 
    ## FALSE  TRUE 
    ##    77     3

grep with value=TRUE returns a vector of the values of the elements of x that yield a match

``` r
grep("Alameda", cameraData$intersection, value = TRUE)
```

    ## [1] "The Alameda  & 33rd St"   "E 33rd  & The Alameda"   
    ## [3] "Harford \n & The Alameda"

stringr package
===============

``` r
library(stringr)
```

    ## Warning: package 'stringr' was built under R version 3.5.2

``` r
nchar("Jeffrey Leek")
```

    ## [1] 12

``` r
substr("Jeffrey Leek", 1, 7)
```

    ## [1] "Jeffrey"

``` r
paste("Jeffrey","Leek")
```

    ## [1] "Jeffrey Leek"

``` r
paste0("Jeffrey","Leek")
```

    ## [1] "JeffreyLeek"

``` r
str_trim("Jeff                  ")
```

    ## [1] "Jeff"

``` r
str_trim("           Jeff          ")
```

    ## [1] "Jeff"

``` r
str_trim("     Jeff     Leek    ") #doesn't trim inner spaces
```

    ## [1] "Jeff     Leek"

``` r
str_trim("\tJeff Leek \t") #whitespace is trimmed
```

    ## [1] "Jeff Leek"

``` r
str_trim("\rJeff Leek \r") #whitespace is trimmed
```

    ## [1] "Jeff Leek"

``` r
str_trim("\nJeff Leek \n") #whitespace is trimmed
```

    ## [1] "Jeff Leek"

------------------------------------------------------------------------------
==============================================================================

Additional Notes
================

-   Names of variables should be:
    -   All lower case when possible
    -   Descriptive (Diagnosis vs Dx)
    -   not duplicated
    -   Not have underscores or dots or white spaces
-   Variable with character values
    -   Should usually be made into factor variables
    -   Should be descriptive (use TRUE/FALSE instead of 0/1 and Male/Female instead of M/F)
