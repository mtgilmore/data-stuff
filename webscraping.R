install.packages('rvest')
library('rvest')

url = 'https://www.imdb.com/search/title?year=2018&title_type=feature&'
webpage = read_html(url)

rank_data_html = html_nodes(webpage,'.text-primary')
rank_data = as.numeric(html_text(rank_data_html))

title_data_html = html_nodes(webpage,'.lister-item-header a')
title_data = html_text(title_data_html)

score_data_html = html_nodes(webpage,'.mixed')
score_data = html_text(score_data_html)

#for (i in c()) {
#  a = score_data[1:(i-1)]
#  b = score_data[i:length(score_data)]
#  score_data = append(a, list('NA'))
#  score_data = append(score_data, b)
#}

genre_data_html = html_nodes(webpage,'.genre')
genre_data = html_text(genre_data_html)
genre_data = gsub('\n','',genre_data)

movies_df = data.frame(Rank=rank_data,Title=title_data,Genre=genre_data,Score=score_data)
