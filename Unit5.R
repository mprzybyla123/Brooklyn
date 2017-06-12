require(gdata)
install.packages("gdata")
install.packages("plyr")
library(plyr)
library(gdata)
getwd()
setwd("/Users/MatthewPrzybyla/Downloads/DDS/")
bk <- read.xls("rollingsales_brooklyn.xls",pattern="BOROUGH")
bk <- read.csv("rollingsales_brooklyn.csv",skip=4,header=TRUE)
head(bk)
summary(bk)
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))
names(bk) <- tolower(names(bk))
#TODO 1
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$gross.sqft
#TODO 2 
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))
bk$land.sqft
bk$year.built < as.numeric(as.character(bk$year.built))
bk$year.built
attach(bk)
hist(sale.price.n)
detach(bk)
bk.sale <- bk[bk$sale.price.n!=0,]
bk.sale
plot(bk.sale$gross.sqft,bk.sale$sale.price.n)
plot(log10(bk.sale$gross.sqft),log10(bk.sale$sale.price.n))
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
#TODO 3
bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft,bk.sale$sale.price.n)
plot(log10(bk.sale$gross.sqft),log10(bk.sale$sale.price.n))
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))
summary(bk.homes[which(bk.homes$sale.price.n<100000),])

bk.homes$outliers <- (log10(bk.homes$sale.price.n) <=5) + 0
#TODO 4
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log10(bk.homes$gross.sqft),log10(bk.homes$sale.price.n))





                           