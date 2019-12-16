###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 8 R script
# November 24, 2019
###################################################################################################
#OBJECTIVES:
#1. Estimation in R 
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
#C2.
#Clean environment setup
rm(list=ls())
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments/R_Lab_8")
data.df =read.csv("data.csv")
#Qualitative: Industry(Levels: Diversified & Technology)
#Quantitative: Net Worth
#--------------------------------------------------------------------------------------------------
#C3. Boxplots
# Establishing a graphing window with 1 rows and 2 columns,
# and las = 1 sets axis labels to be horizontal
par(mfrow=c(1,2), las = 1)
#Creating a boxplot.
# ~ represents a relationship between two variable, with Y on left side, X on right side.
# Networth(quantitative) across Industry.Diversified(Qualitative)
# and Networth(quantitative) across Industry.Technology(Qualitative)
boxplot(data.df$Net.worth[data.df$Industry == "Diversified"],
        data.df$Net.worth[data.df$Industry == "Technology"],
        main="Networth across Industry levels",
        col = c("orange","blue"),
        names = c("Diversified","Technology"),
        ylab ="Networth in Billions of $",
        ylim =c(0, 120))
#--------------------------------------------------------------------------------------------------
#C5. QQ plots
#Div
qqnorm(data.df$Net.worth[data.df$Industry == "Diversified"],
       col = "orange",
       ylim = c(0,120),
       xlim = c(-4,4),
       main="Networth across Diversified")
qqline(data.df$Net.worth[data.df$Industry == "Diversified"])
#Tech
qqnorm(data.df$Net.worth[data.df$Industry == "Technology"],
       col = "blue",
       xlim = c(-4,4),
       ylim = c(0,120),
       main="Networth across Technology")
qqline(data.df$Net.worth[data.df$Industry == "Technology"])
#--------------------------------------------------------------------------------------------------
#C7 (2) Use R to compute 5 number summaries..
summary(data.df$Net.worth[data.df$Industry == "Diversified"])
summary(data.df$Net.worth[data.df$Industry == "Technology"])
#Diversified measures of center
divMean = round(mean(data.df$Net.worth[data.df$Industry == "Diversified"]), 2)
round(median(data.df$Net.worth[data.df$Industry == "Diversified"]), 2)
divSd = round(sd(data.df$Net.worth[data.df$Industry == "Diversified"]), 2)
#Technology Measures of center
techMean = round(mean(data.df$Net.worth[data.df$Industry == "Technology"]), 2)
round(median(data.df$Net.worth[data.df$Industry == "Technology"]), 2)
techSd = round(sd(data.df$Net.worth[data.df$Industry == "Technology"]), 2)
#size of samples
divN = length(data.df$Net.worth[data.df$Industry == "Diversified"])
techN = length(data.df$Net.worth[data.df$Industry == "Technology"])
#--------------------------------------------------------------------------------------------------
#C8 (2) Compute a 95% confidence interval for the population mean value..
#Diversified
#Calculate t-values using qt, then
divqt = qt(0.975, df = 14-1)
#Technology
techqt = qt(0.975, df = 15-1)
#Calc limits..
#Diversified
UpperDivMu = divMean + divqt*divSd/sqrt(divN)
LowerDivMu = divMean - divqt*divSd/sqrt(divN)
#Technology
UpperTechMu = techMean + techqt*techSd/sqrt(techN)
LowerTechMu = techMean - techqt*techSd/sqrt(techN)
#Diversified population limits calculated..
round(UpperDivMu,2)
round(LowerDivMu,2)
#Technology population limits calculated..
round(UpperTechMu,2)
round(LowerTechMu,2)
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------

