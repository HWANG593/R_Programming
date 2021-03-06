remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

pageLink <- remDr$findElement(using='css selector',"body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
remDr$executeScript("arguments[0].click();",pageLink)
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)
Sys.sleep(3)

pageLink <- NULL
reple <- NULL

repeat{
  doms <- remDr$findElements(using = "css selector", ".review_ta.ng-scope > ul > li > div.review_desc > p")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- remDr$findElements(using='css selector',"body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)
  
  
  if (sapply(pageLink, function(x) {x$getElementAttribute("class")}) == "direction next disabled"){
    break
  }
}

write(reple,"output/naverhotel.txt")