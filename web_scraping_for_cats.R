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

for (i in 1:length(child)) {
  if (substr(child[i],1,15) == "<a href=\"/wiki/") {
    print(substr(child[i],16,25))
  }
}