install.packages("readxl")
library("readxl")
install.packages("car")
library(car)
install.packages("RColorBrewer")
library(RColorBrewer)

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


