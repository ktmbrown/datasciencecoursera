
home <-str_c("https://www.remax.com/realestatehomesforsale/sanantonio-tx-p001.html?query=listingtypeid-100,104#search/forcelatlong-False/location-San%20Antonio%2C%20TX/listingtypeid-100%2C104/sv-true/sortorder-newest/pagenumber-",1,"/tab-forsale/pagesize-24/Count-24/")

first_page <- read_html(home)



get_streets<- function(url) {
      page <- read_html(url)
      page %>% html_nodes(xpath = "//*[@hmsitemprop='Address']") %>%  
            html_text() %>% trimws()
}

get_zips <- function(url) {
      page <- read_html(url)
      page %>% html_nodes(xpath = "//*[@hmsitemprop='Zip']") %>%  
            html_text() %>% trimws()
}

get_beds <- function(url) {
      page <- read_html(url)
      page %>% html_nodes("[class='listing-pane-beds-val num']") %>%  
            html_text() %>% trimws()
}

get_baths <- function(url) {
      page <- read_html(url)
      page %>% html_nodes("[class= 'listing-pane-baths-val num']") %>%  
            html_text() %>% trimws()
}

get_list_prices <- function(url) {
      page <- read_html(url)
      page %>% html_nodes("[class= 'listing-pane-price-amount num']") %>%  
            html_text() %>% trimws() %>% gsub(',','',.) %>% as.numeric()
}

get_sqft <- function(url) {
      page <- read_html(url)
      page %>% html_nodes("[class= 'listing-pane-sqft list-delim-item hmeasure']") %>%  
            html_text() %>% trimws() %>% gsub(',','',.)
}

get_ids <- function(url) {
      page <- read_html(url)
      page %>% html_nodes(xpath = "//*[@hmsitemprop='ListingID']") %>%  
            html_text() %>% trimws() %>% gsub(',','',.) 
}

get_mls <- function(url) {
      page <- read_html(url)
      page %>% html_nodes(xpath = "//*[@hmsitemprop='MLSNumber']") %>%  
            html_text() %>% trimws() %>% gsub(',','',.) 
}

get_agent<- function(url) {
      page <- read_html(url)
      page %>% html_nodes("[class='listing-pane-lister fn']") %>%  
            html_text() %>% trimws() %>% gsub(',','',.) %>% gsub('Courtesy of ','',.)
}


streets <- get_streets(home)
zips <- get_zips(home)
bd <- get_beds(home)
ba <- get_baths(home)
price <- get_list_prices(home)
sqft <- get_sqft(home)
id <- get_ids(home)
mls <- get_mls(home)
agent <- get_agent(home)

combined_data <- tibble(Street_Adress <- streets,
                        Zip_Code = zips,
                        Bedrooms = bd,
                        Bathrooms = ba,
                        Listing_Price = price,
                        Square_Feet = sqft) 