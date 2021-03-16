library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)

btn1css <- "#TWO_TO_ONE"
btn1Page <- remDr$findElements(using='css selector',btn1css)
sapply(btn1Page,function(x){x$clickElement()})
Sys.sleep(3)

eventgoodsname <- NULL; eventgoodsprice <- NULL;
repeat{

  eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  list_eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
  v_eventgoodsname <- unlist(list_eventgoodsname)
  eventgoodsname <- c(eventgoodsname,v_eventgoodsname)
  
  eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  list_eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
  v_eventgoodsprice <- unlist(list_eventgoodsprice)
  eventgoodsprice <- c(eventgoodsprice,v_eventgoodsprice)
  
  pageLink <- remDr$findElements(using='css selector',"#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next")
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)

  nextPage <- remDr$findElement(using='css selector', 'div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  if(length(nextPage$getElementAttribute("onclick"))==0){
    cat("종료\n")
    break
  }
}

gs25_twotoone <- data.frame(goodsname = eventgoodsname, goodsprice = eventgoodsprice)
View(gs25_twotoone)
write.csv(gs25_twotoone, file="output/gs25_twotoone.csv")