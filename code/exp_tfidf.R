library(cluster)
library(fpc)
library(tm) 
library(SnowballC) 
library(RColorBrewer)
library(wordcloud) 


barsfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/Bars")
bars <- Corpus(DirSource(barsfile, recursive=TRUE),readerControl = list(reader=readPlain))

bars <- tm_map(bars, tolower)
bars <- tm_map(bars, removeWords, stopwords("english"))
bars <- tm_map(bars, stemDocument)
bars <- tm_map(bars, stripWhitespace) 
bars <- tm_map(bars , PlainTextDocument)

dtm <- DocumentTermMatrix(bars,control=list(wordLengths=c(4,Inf)))
tdm <- TermDocumentMatrix(bars, control=list(wordLengths=c(4,Inf))) #Term


rowTotals <- apply(dtm , 1, sum) 
dtm.new   <- dtm[rowTotals> 0, ]  

dtm_tfxidf<- weightTfIdf(dtm.new) 


sing <-svd(dtm_tfxidf)
u5<-as.matrix(sing$u[, 1:5])
v5<-as.matrix(sing$v[, 1:5])
d5<-as.matrix(diag(sing$d)[1:5, 1:5])
dtmt_5d <-as.matrix(u5%*%d5%*%t(v5),type='blue')

dtmt_5d_norm<-norm_eucl(dtmt_5d)

dtmt_5d_km5<-kmeans(dtmt_5d_norm, 5)

dtmt_5d_pca <-prcomp(dtmt_5d_norm)

clusplot(dtmt_5d_pca$x, dtmt_5d_km5$cluster, color=TRUE, shade=TRUE, labels=2, lines=0)

for(i in 1:5){
	sv = sort.list(abs(sing$v[, i]), decreasing = TRUE)
	print(dtm$dimnames$Terms[head(sv, 10)])
}

