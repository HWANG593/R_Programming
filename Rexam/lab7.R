url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
html <- read_html(url)
html

node1 <- html_nodes(html, "h1") 
title1 <- html_text(node1)
title1


node2 <- html_nodes(html, "a") 
html_attr(node2,"href")


node3 <- html_nodes(html, "img") 
html_attr(node3,"src")


node4 <- html_nodes(html, "h2:nth-of-type(1)") 
title2 <- html_text(node4)
title2


node5 <- html_nodes(html, "ul > li:nth-of-type(3)")
node5 <- html_nodes(html, "ul > li[style$='green']")
node5
text1 <- html_text(node5)
text1

node6 <- html_nodes(html, "h2:nth-of-type(2)") 
title3 <- html_text(node6)
title3


node7 <- html_nodes(html, "ol>li")
node7
text2 <- html_text(node7)
text2


node8 <- html_nodes(html, "th ,td")
node8 <- html_nodes(html, "table *")
text3 <- html_text(node8)
text3


node9 <- html_nodes(html, ".name")
text4 <- html_text(node9)
text4


node10 <- html_nodes(html, "#target")
text5 <- html_text(node10)
text5