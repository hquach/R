# Sample rvest

# use Selector Gadget tool to find html elements

library(rvest)
read_html("") %>%
 html_nodes("h1 a") %>%
 html_text()
