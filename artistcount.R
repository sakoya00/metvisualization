library(dplyr)

#setwd("D:/Met Objects")
#getwd()

#calculates artists with most Met artworks in descending order
met <- read.csv("metobjects.csv", header= TRUE, na.strings=c("", "NA"))
artname <- met[,17]
artname <- na.omit(artname)
artistcount <- count(artname, sort = TRUE)


