install.packages("readxl")
library("readxl")
install.packages("car")
library(car)
install.packages("RColorBrewer")
library(RColorBrewer)

# Dataset construction 
dataset = read_excel("IBD_data/IBD.xlsx", sheet= "Sheet2")
NonIBD<-dataset[1:8,]
CD<-dataset[9:16,]
UC<-dataset[17:23,]

# Correlation Plot Analysis 
NonIBDplot<-scatterplotMatrix(NonIBD)
CDplot<-scatterplotMatrix(CD)
UCplot<-scatterplotMatrix(UC)

# Data Profile Plot
names <- c("DPP4", "FAP", "DPP8", "DPP9", "DPP2")
makeProfilePlot(NonIBD,names)
