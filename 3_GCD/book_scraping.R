# This R Script scrapes the website Books To Scrape and returns a dataframe 
# with the following columns:
# Title: Holds the title of the book
# PriceDollars: Price of book in USD *used exchange rate of 0.765102 from 1/24/19
# PricePounds: Price of book in GBP (scraped)
# Rating: Star rating (scraped)
# Rating.f: Factor variable created from rating
# Category: Category of book (scraped)

# If running multiple times, reset the data frame myBook_df

library(XML)
library(httr)

# getting html document from homepage
url <- 'http://books.toscrape.com/'
doc <- htmlTreeParse(url,useInternal=T)

# grabbing the categories from the side menu
categories <-xpathSApply(doc, "//a[@href]", xmlValue)
categories <- trimws(categories)
categories <- as.character(categories[4:53])

# creating a vector that holds the category code name to insert into the link. 
# i.e. Travel = travel_2, Myster = mystery_3
cat_nums <- character()
for(i in 1:length(categories)) {
      cat_nums[i] <- paste(tolower(categories[i]),'_',i+1,sep="")
}
cat_nums <- gsub(" ","-", cat_nums)

# creating a dataframe to hold the categories, the category code name and a list
# of links per category
category_df<- data.frame(Categories = as.character(categories), 
                         Numbers = as.character(cat_nums))
category_df <- data.frame(lapply(category_df, as.character), 
                          stringsAsFactors=FALSE)
category_df$Links <- vector(mode = "list",length=nrow(category_df))

# using generating_links function to create the list of working links per
# category and storing it in a list inside a column of the dataframe 
for(i in 1:nrow(category_df)) {
      category_df$Links[i] <- list(generating_links(category_df$Numbers[i]))
}

# creating a book dataframe that will hold all the scraped data
# and a column that calculates the USD from the GBP using the exchange rate
# of 0.765102*GBP = USD (see read_book function below)
myBook_df <- data.frame(matrix(,ncol=5,nrow=0))
names(myBook_df)<- c('Title','PriceDollars','PricePounds','Rating','Category')

# populating the myBook dataframe by iterating through each row in the category
# dataframe and each link in the Links column (column of lists of links)
for(r in 1:nrow(category_df)) {
      for(u in category_df$Links[[r]]) {
            temp_df <- read_book(u, category_df$Categories[[r]])
            myBook_df <- rbind(myBook_df, temp_df)
      }
}

# Creating factor variable
Rating.f <- factor(myBook_df$Rating)
final_myBook_df <- cbind(myBook_df[,1:4],Rating.f,myBook_df$Category)

generating_links <- function(category) {
      vect <- character()
      vect[1] <- paste('http://books.toscrape.com/catalogue/category/books/',category,'/index.html',sep="")
      for(i in 2:8) {
            this_url <- paste('http://books.toscrape.com/catalogue/category/books/',category,'/page-',i,'.html',sep="")
            if(!check_link(this_url)) {
                  return(vect)
            } else {
                  vect <- c(vect,this_url)
            }
      }
      vect
}

read_book <- function(url,cat) {
      doc <- htmlTreeParse(url,useInternal=T)
      stars <- xpathSApply(doc,"//article[@class='product_pod']/p/@class")
      names(stars) <- NULL
      
      title <- xpathSApply(doc, "//article[@class='product_pod']/div[@class='image_container']/a/img/@alt")
      names(title) <- NULL
      price <- xpathSApply(doc, "//p[@class = 'price_color']",xmlValue)
      keeps <- c(".")
      price <- gsub(paste0(".*?($|'|", paste(paste0("\\",keeps), collapse = "|"), "|[^[:punct:]]).*?"), "\\1", price)
      price_pounds <- as.numeric(as.character(price))
      price_dollars <- round(price_pounds*0.765102, digits = 2)
      stars <- gsub('star-rating ','',stars)
      category = c(rep(cat,length(stars)))
      book_df <- data.frame(Title = title, PriceDollars = price_dollars,PricePounds = price_pounds, Rating = stars, Category = category)
      book_df
}

check_link <- function(my_url) {
      req <- GET(my_url)
      if(req$status_code == 200) {
            TRUE
      } else {
            FALSE
      }
}
