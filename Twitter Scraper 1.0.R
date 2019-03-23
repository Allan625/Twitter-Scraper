install.packages(rvest)
library(rvest)

account <- 'realDonaldTrump'
base_url <- 'https://twitter.com/'
url <- paste(base_url, account, sep = '')
url

get_tweets <- function(account) {
  base_url <- 'https://twitter.com/'
  url <- paste(base_url, account, sep = '')
  
  twitter <-read_html(url)
  
  title <- twitter %>%
    html_nodes('title') %>%
    html_text()
  
  text <- twitter %>%
    html_nodes('.tweet-text') %>%
    html_text()
  
  tibble(
    title,
    text
  )
}

get_tweets('realDonaldTrump')

