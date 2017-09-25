install.packages("readxl")
library("readxl")
install.packages("car")
library(car)

# Dataset construction 
dataset = read_excel("IBD_data/IBD.xlsx", sheet= "Sheet2")
NonIBD<-dataset[1:8,]
CD<-dataset[9:16,]
UC<-dataset[17:23,]

# Analysis 
scatterplotMatrix(NonIBD)