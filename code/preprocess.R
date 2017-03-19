library("tm") 
library("SnowballC") 
library("RColorBrewer")
library("wordcloud") 

#AmericanTraditional
atfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/AmericanTraditional")
at <- Corpus(DirSource(atfile, recursive=TRUE),readerControl = list(reader=readPlain))

at <- tm_map(at, tolower)
at <- tm_map(at, removeWords, stopwords("english"))
at <- tm_map(at, stemDocument)
at <- tm_map(at, stripWhitespace) 
at <- tm_map(at , PlainTextDocument)

dtm_at <- DocumentTermMatrix(at,control=list(wordLengths=c(4,Inf)))
tdm_at <- TermDocumentMatrix(at, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_at <- as.matrix(tdm_at)
v_at <- sort(rowSums(m_at), decreasing=TRUE)
d_at <- data.frame(word = names(v_at),freq=v_at)
head(d_at, 10) 
nrow(d_at)
#word cloud

dtms_at <- removeSparseTerms(dtm_at, 0.15) # Prepare the data 
freq_at <- colSums(as.matrix(dtm_at)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_at), freq_at, max.words=100, rot.per=0.2,colors=dark2)

#Bars
barsfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/Bars")
bars <- Corpus(DirSource(barsfile, recursive=TRUE),readerControl = list(reader=readPlain))

bars <- tm_map(bars, tolower)
bars <- tm_map(bars, removeWords, stopwords("english"))
bars <- tm_map(bars, stemDocument)
bars <- tm_map(bars, stripWhitespace) 
bars <- tm_map(bars , PlainTextDocument)

dtm_bars <- DocumentTermMatrix(bars,control=list(wordLengths=c(4,Inf)))
tdm_bars <- TermDocumentMatrix(bars, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_bars <- as.matrix(tdm_bars)
v_bars <- sort(rowSums(m_bars), decreasing=TRUE)
d_bars <- data.frame(word = names(v_bars),freq=v_bars)
head(d_bars, 10) 
nrow(d_bars)
#word cloud
dtms_bars <- removeSparseTerms(dtm_bars, 0.15) # Prepare the data 
freq_bars <- colSums(as.matrix(dtm_bars)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_bars), freq_bars, max.words=100, rot.per=0.2,colors=dark2)

#Mexican
mexfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/Mexican")
mex <- Corpus(DirSource(mexfile, recursive=TRUE),readerControl = list(reader=readPlain))

mex <- tm_map(mex, tolower)
mex <- tm_map(mex, removeWords, stopwords("english"))
mex <- tm_map(mex, stemDocument)
mex <- tm_map(mex, stripWhitespace) 
mex <- tm_map(mex , PlainTextDocument)

dtm_mex <- DocumentTermMatrix(mex,control=list(wordLengths=c(4,Inf)))
tdm_mex <- TermDocumentMatrix(mex, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_mex <- as.matrix(tdm_mex)
v_mex <- sort(rowSums(m_mex), decreasing=TRUE)
d_mex <- data.frame(word = names(v_mex),freq=v_mex)
head(d_mex, 10) 
nrow(d_mex)
#word cloud
dtms_mex <- removeSparseTerms(dtm_mex, 0.15) # Prepare the data 
freq_mex <- colSums(as.matrix(dtm_mex)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_mex), freq_mex, max.words=100, rot.per=0.2,colors=dark2)

#Chinese
chinfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/Chinese")
chin <- Corpus(DirSource(chinfile, recursive=TRUE),readerControl = list(reader=readPlain))

chin <- tm_map(chin, tolower)
chin <- tm_map(chin, removeWords, stopwords("english"))
chin <- tm_map(chin, stemDocument)
chin <- tm_map(chin, stripWhitespace) 
chin <- tm_map(chin , PlainTextDocument)

dtm_chin <- DocumentTermMatrix(chin,control=list(wordLengths=c(4,Inf)))
tdm_chin <- TermDocumentMatrix(chin, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_chin <- as.matrix(tdm_chin)
v_chin <- sort(rowSums(m_chin), decreasing=TRUE)
d_chin <- data.frame(word = names(v_chin),freq=v_chin)
head(d_chin, 10) 
nrow(d_chin)
#word cloud
dtms_chin <- removeSparseTerms(dtm_chin, 0.15) # Prepare the data 
freq_chin <- colSums(as.matrix(dtm_chin)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_chin), freq_chin, max.words=100, rot.per=0.2,colors=dark2)


#CoffeeTea
ctfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/CoffeeTea")
ct <- Corpus(DirSource(ctfile, recursive=TRUE),readerControl = list(reader=readPlain))

ct <- tm_map(ct, tolower)
ct <- tm_map(ct, removeWords, stopwords("english"))
ct <- tm_map(ct, stemDocument)
ct <- tm_map(ct, stripWhitespace) 
ct <- tm_map(ct , PlainTextDocument)

dtm_ct <- DocumentTermMatrix(ct,control=list(wordLengths=c(4,Inf)))
tdm_ct <- TermDocumentMatrix(ct, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_ct <- as.matrix(tdm_ct)
v_ct <- sort(rowSums(m_ct), decreasing=TRUE)
d_ct <- data.frame(word = names(v_ct),freq=v_ct)
head(d_ct, 10) 
nrow(d_ct)
#word cloud
dtms_ct <- removeSparseTerms(dtm_ct, 0.15) # Prepare the data 
freq_ct <- colSums(as.matrix(dtm_ct)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_ct), freq_ct, max.words=100, rot.per=0.2,colors=dark2)


#SpecialtyFood
sffile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/SpecialtyFood")
sf <- Corpus(DirSource(sffile, recursive=TRUE),readerControl = list(reader=readPlain))

sf <- tm_map(sf, tolower)
sf <- tm_map(sf, removeWords, stopwords("english"))
sf <- tm_map(sf, stemDocument)
sf <- tm_map(sf, stripWhitespace) 
sf <- tm_map(sf , PlainTextDocument)

dtm_sf <- DocumentTermMatrix(sf,control=list(wordLengths=c(4,Inf)))
tdm_sf <- TermDocumentMatrix(sf, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_sf <- as.matrix(tdm_sf)
v_sf <- sort(rowSums(m_sf), decreasing=TRUE)
d_sf <- data.frame(word = names(v_sf),freq=v_sf)
head(d_sf, 10) 
nrow(d_sf)
#word cloud
dtms_sf <- removeSparseTerms(dtm_sf, 0.15) # Prepare the data 
freq_sf <- colSums(as.matrix(dtm_sf)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_sf), freq_sf, max.words=100, rot.per=0.2,colors=dark2)


#Desserts
dsfile<-c("/Users/pinxiaye/Documents/MS-CS/522/project/extractdata/Desserts")
ds <- Corpus(DirSource(dsfile, recursive=TRUE),readerControl = list(reader=readPlain))

ds <- tm_map(ds, tolower)
ds <- tm_map(ds, removeWords, stopwords("english"))
ds <- tm_map(ds, stemDocument)
ds <- tm_map(ds, stripWhitespace) 
ds <- tm_map(ds , PlainTextDocument)

dtm_ds <- DocumentTermMatrix(ds,control=list(wordLengths=c(4,Inf)))
tdm_ds <- TermDocumentMatrix(ds, control=list(wordLengths=c(4,Inf))) #Term

#Verify Frequent Terms
m_ds <- as.matrix(tdm_ds)
v_ds <- sort(rowSums(m_ds), decreasing=TRUE)
d_ds <- data.frame(word = names(v_ds),freq=v_ds)
head(d_ds, 10) 
nrow(d_ds)
#word cloud
dtms_ds <- removeSparseTerms(dtm_ds, 0.15) # Prepare the data 
freq_ds <- colSums(as.matrix(dtm_ds)) # Find word frequencies
dark2 <- brewer.pal(6, "Dark2")
wordcloud(names(freq_ds), freq_ds, max.words=100, rot.per=0.2,colors=dark2)



















