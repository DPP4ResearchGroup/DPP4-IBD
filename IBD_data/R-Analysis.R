install.packages("readxl")
library("readxl")
install.packages("car")
library(car)
install.packages("RColorBrewer")
library(RColorBrewer)
install.packages("mclust")
library(mclust)
install.packages("ggplot2")
library("ggplot2")
source("IBD_data/Stats-Functions.R") 


# Dataset construction 
dataset = read_excel("IBD_data/IBD.xlsx", sheet= "Sheet3")
NonIBD<-dataset[1:8,]
CD<-dataset[9:16,]
UC<-dataset[17:23,]

# Data Statistics
NonIBDmean=sapply(NonIBD, mean)
CDmean=sapply(CD, mean)
UCmean=sapply(UC, mean)
DataMean<-rbind(NonIBDmean, CDmean, UCmean)
DataMean.table<-as.table(DataSummary)
NonIBDcor=mosthighlycorrelated(NonIBD,10)
CDcor=mosthighlycorrelated(CD,10)
UCcor=mosthighlycorrelated(UC,10)

# OR 
dataset2 = read_excel("IBD_data/IBD.xlsx", sheet= "Sheet2")
GroupStates=printMeanAndSdByGroup(as.matrix(dataset2[2:6]), as.matrix(dataset2[1]))

# Correlation Plot Analysis 
NonIBDplot<-scatterplotMatrix(NonIBD)
CDplot<-scatterplotMatrix(CD)
UCplot<-scatterplotMatrix(UC)

# Data Profile Plot
names <- c("DPP4", "FAP", "DPP8", "DPP9", "DPP2")
makeProfilePlot(NonIBD,names)

# Data clustering 
par(mfrow=c(3,2))
d<-dist(NonIBD$DPP4, method = "euclidean")
fitDPP4 <- hclust(d, method="ward.D")
plot(fitDPP4, main="NonIBD DPP4 Clustering")
d<-dist(NonIBD$FAP, method = "euclidean")
fitFAP <- hclust(d, method="ward.D")
plot(fitFAP, main="NonIBD FAP Clustering")
d<-dist(NonIBD$DPP8, method = "euclidean")
fitDPP8 <- hclust(d, method="ward.D")
plot(fitDPP8, main="NonIBD DPP8 Clustering")
d<-dist(NonIBD$DPP9, method = "euclidean")
fitDPP9 <- hclust(d, method="ward.D")
plot(fitDPP9, main="NonIBD DPP9 Clustering")
d<-dist(NonIBD$DPP2, method = "euclidean")
fitDPP2 <- hclust(d, method="ward.D")
plot(fitDPP2, main="NonIBD DPP2 Clustering")