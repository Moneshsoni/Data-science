rm(list = ls())
#load libraries
library(stringr)

library(tm)
library(wordcloud)
library(slam)
library(SentimentAnalysis)
#load post text data in R studio
post=read.csv("post_Dataset.csv",header = T)
View(post)
#Delete the leading spaces 
post$Post=str_trim(post$Post)
#select only text column
post=data.frame(post[1:2000,2])
names(post)="comments"
post$comments=as.character(post$comments)
#pre-processing Technique
#convert comments into corpus
postCorpus=Corpus(VectorSource(post$comments))
writeLines(as.character(postCorpus[[2]]))
#case folding 
postCorpus=tm_map(postCorpus, tolower)
#remove stopwords:
postCorpus=tm_map(postCorpus, removeWords ,stopwords('english'))
#remove punctuation marks 
postCorpus=tm_map(postCorpus,removePunctuation)
#remove numbers
postCorpus=tm_map(postCorpus,removeNumbers)

#remove unnecesary spaces:
postCorpus=tm_map(postCorpus, stripWhitespace)


#convert into plaintext
postCorpus=Corpus(VectorSource(postCorpus))
