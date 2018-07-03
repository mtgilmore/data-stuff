library('rvest')

titles = array('Cat')

initial_link = 'https://en.wikipedia.org/wiki/Cat'
webpage = read_html(initial_link)

text_data_html = html_nodes(webpage, '.mw-parser-output p')
#text_data = html_text(text_data_html)
#name = html_name(text_data_html)
#attrs = html_attrs(text_data_html)
child = html_children(text_data_html)
child = as.character(child)

links = list("")
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