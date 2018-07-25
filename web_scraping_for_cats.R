install.packages('rvest')
install.packages('qgraph')
library('rvest')
library('qgraph')

find_links <- function(page, depth, links) {
  if (depth == 0) {
    return
  }
  
  initial_link = paste0('https://en.wikipedia.org/wiki/', page)
  webpage = read_html(initial_link)
  
  text_data_html = html_nodes(webpage, '.mw-parser-output p')
  child = html_children(text_data_html)
  child = as.character(child)
  
  count = 1
  
  # search all tags from the page
  for (i in 1:length(child)) {
    
    # look for a wiki link
    if (substr(child[i],1,15) == "<a href=\"/wiki/") {
      
      # update list of all links
      append(links, "")
      
      # extract name of each page
      j = 16
      while (substr(child[i],j,j) != "\"") {
        links[count] = substr(child[i],16,j)
        j = j + 1
        find_links(substr(child[i],16,j), depth-1)
      }
      count = count + 1
    }
  }
}

initial_page = 'Cat'
depth = 3
links = array('')
find_links(initial_page, depth, links)