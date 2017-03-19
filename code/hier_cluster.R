library("tm") 
library("SnowballC") 
library("RColorBrewer")
library("wordcloud") 


#preprocess
catnames <- list.files("/Users/pinxiaye/Documents/MS-CS/522/project/rdata", full.names=FALSE)
filepath <- list.files("/Users/pinxiaye/Documents/MS-CS/522/project/rdata", full.names=TRUE)

dat<-c("/Users/pinxiaye/Documents/MS-CS/522/project/rdata")

ds <- Corpus(DirSource(dat, recursive=TRUE),readerControl = list(reader=readPlain))

ds <- tm_map(ds, tolower)

ds <- tm_map(ds, removeWords, stopwords("english"))

ds <- tm_map(ds, stemDocument)
ds <- tm_map(ds, stripWhitespace) 
ds <- tm_map(ds , PlainTextDocument)

dtm <- DocumentTermMatrix(ds,control=list(wordLengths=c(4,Inf)))
tdm <- TermDocumentMatrix(ds, control=list(wordLengths=c(4,Inf))) #Term

rowTotals <- apply(dtm , 1, sum) 
dtm.new   <- dtm[rowTotals> 0, ]  

dtm_tfxidf<- weightTfIdf(dtm.new) 

dtm_tf_m <- as.matrix(dtm_tfxidf)

sing <-svd(dtm_tfxidf)
u5<-as.matrix(sing$u[, 1:5])
v5<-as.matrix(sing$v[, 1:5])
d5<-as.matrix(diag(sing$d)[1:5, 1:5])

docm  <-as.matrix(u5%*%d5%*%t(v5),type='blue')

#distance
dism <- dist(scale(docm))
res_fit <- hclust(dism, method="ward.D")

plot(res_fit, cex=0.9, hang = -1, main="Restaurant Cluster Dendrogram")

#cut tree
rect.hclust(res_fit, k = 5)