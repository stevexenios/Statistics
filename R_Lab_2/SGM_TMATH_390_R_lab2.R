###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 2 R script
# October 13, 2019
###################################################################################################
#OBJECTIVES:
#1. Estimation in R 
###################################################################################################
#C1. Submit Your R Scipts to Canvas.
#Upload them directly to your assignment as *.R documents.
#--------------------------------------------------------------------------------------------------
#C2.
#Determine working directory with
getwd()
#Change working directory to: C:\Users\steve\Desktop\UWT\Fall Classes\TMATH 390\R Documents\R Assignments\R_Lab_2
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments/R_Lab_2")
#Read csv file of my data
data.df = read.csv("data.csv")
head(data.df)
#--------------------------------------------------------------------------------------------------
###################################################################################################
#Quantitative variable
#C3.
#Quantitative variable chosen: Net Worth
#Producing a summary of Quantitative Net worth column
summary(data.df$Net.worth)
#Producing a summary of Qualitative Gender column
summary(data.df$Gender)
#--------------------------------------------------------------------------------------------------
#C4.
#Quantitative variable chosen: Net Worth
#Producing a summary of Quantitative Net worth column
summary(data.df$Net.worth)
#--------------------------------------------------------------------------------------------------
#C5.
#Histogram of Net Worth Column
#Command creates a histogram of chosen column, in the dataframe data.df
#the xlab argument writes test to label the x-axis
# main argument gives it title
hist(data.df$Net.worth, xlab="Networth of 50 richest people in the world(in billions of dollars)", main="Networth distribution of top 50 Richest people")
#--------------------------------------------------------------------------------------------------
#C6. Described
#--------------------------------------------------------------------------------------------------
#C7. Boxplots
# Establishing a graphing window with 1 rows and 2 columns,
# and las = 1 sets axis labels to be horizontal
par(mfrow=c(1,2), las = 1)
#Creating a boxplot.
# ~ represents a relationship between two variable, with Y on left side, X on right side.
# Networth(quantitative) across Gender(Qualitative)
boxplot(data.df$Net.worth~data.df$Gender)
#--------------------------------------------------------------------------------------------------
#C9.
#Individual summary statistics
#Command to get individual summary statistics
#FEMALE
#For mean
mean(data.df$Net.worth[data.df$Gender=="Female"])
#For median
median(data.df$Net.worth[data.df$Gender=="Female"])
#Standard Dev.
sd(data.df$Net.worth[data.df$Gender=="Female"])
#MALE
#For mean
mean(data.df$Net.worth[data.df$Gender=="Male"])
#For median
median(data.df$Net.worth[data.df$Gender=="Male"])
#Standard Dev.
sd(data.df$Net.worth[data.df$Gender=="Male"])
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------