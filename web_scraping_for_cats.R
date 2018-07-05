library('rvest')
library('igraph')

intitial_page = 'Cat'
initial_link = paste('https://en.wikipedia.org/wiki/', intitial_page)
webpage = read_html(initial_link)

text_data_html = html_nodes(webpage, '.mw-parser-output p')
child = html_children(text_data_html)
child = as.character(child)

links = array('')
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
    }
    count = count + 1
  }
}

