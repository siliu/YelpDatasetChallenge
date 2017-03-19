library("NLP") 
library("tm") 
library("SnowballC") 
library("RColorBrewer")
library("wordcloud") 


#preprocess
catnames <- list.files("/Users/siliu/Desktop/yelp_challenge/restdata", full.names=FALSE)
filepath <- list.files("/Users/siliu/Desktop/yelp_challenge/restdata", full.names=TRUE)

dat<-c("/Users/siliu/Desktop/yelp_challenge/restdata")

ds <- Corpus(DirSource(dat, recursive=TRUE),readerControl = list(reader=readPlain))

ds <- tm_map(ds, tolower)
ds <- tm_map(ds, stemDocument)
my_stopwords <- c(stopwords("english"),"food", "drink","restaurant","business",
                  "service","staff", "great","location","place", "time","atmosphere", "best","store","price")
ds <- tm_map(ds, removeWords, my_stopwords )
ds <- tm_map(ds, removePunctuation)
ds <- tm_map(ds, stripWhitespace) 
ds <- tm_map(ds , PlainTextDocument)

dtm <- DocumentTermMatrix(ds,control=list(wordLengths=c(4,Inf)))
tdm <- TermDocumentMatrix(ds,control=list(wordLengths=c(4,Inf))) #Term

# rowTotals <- apply(dtm , 1, sum)
# as.data.frame(dtm[rowTotals = 0, ]) 
# dtm.new   <- dtm[rowTotals > 0, ]  

# dtm_tfxidf<- weightTfIdf(dtm) 

# dtm_tf_m <- as.matrix(dtm_tfxidf)

# sing <-svd(dtm_tfxidf)
sing <-svd(dtm)
u5<-as.matrix(sing$u[, 1:10])
v5<-as.matrix(sing$v[, 1:10])
d5<-as.matrix(diag(sing$d)[1:10, 1:10])

docm  <-as.matrix(u5%*%d5%*%t(v5),type='blue')
rownames(docm) <- catnames

#distance
dism <- dist(scale(docm))
res_fit <- hclust(dism, method="ward.D2")
res_fit$height=log(res_fit$height+1)

plot(res_fit, cex=0.9, hang = -1, main="Restaurant Cluster Dendrogram")

#cut tree
rect.hclust(res_fit, k = 5)