###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 10 R script
# December 09, 2019
###################################################################################################
#OBJECTIVES:
#1. Correlation and linear regression 
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
# C6.
# Part 2: Linear regression on your own data 
# (2) Describe the two quantitative variables in the data set you obtained for HW 1. 
# Choose one to be the response variable (Y), and one to be the predictor variable (X). 
# Explain your choice. Do you think these variables might be related? Why or why not?
# Read csv file of my data
data.df = read.csv("data.csv")
#--------------------------------------------------------------------------------------------------
# C7. (1) Produce a publication-quality scatterplot with your 
# response-variable on the y-axis and your...
# first set up the plotting window. 
# mfrow creates a 1x1 window 
# mar sets the margin sizes (bottom, left, top, right) 
# mgp sets the axis (scale, ticks, line) 
# las orients the axis scale (here we set it to horizontal) 
par(mfrow=c(1,1),mar=c(3.75,3.75,0.5,0.5),mgp=c(2.75,0.5,0),las=1) 
# now we create the scatterplot. xlab gives the label for the x-axis, 
# ylab the label for the y-axis. Make sure to update these with your own 
# variables. pch gives the point type (16=solid points) 
# see ?points for options. col gives the color for the points (?colors) 
?points
plot(data.df$YTD.Change,
     data.df$Net.worth,
     xlab="YTD Change in Net-worth (in Billions of $)",
     ylab="Net worth of Individual (in Billions of $)",
     pch=16,
     col="blue") 
#--------------------------------------------------------------------------------------------------
# C9 Using the cor function in R to calculate the correlation between X and Y 
# substitute the name of your dataframe and the appropriate column names 
cor(data.df$YTD.Change,data.df$Net.worth) # =  0.1776805
#--------------------------------------------------------------------------------------------------
# C11. (1) Now we will estimate the least-squares regression line,...
# lm uses the same formula syntax that boxplot does. 
# this code estimates the linear relationship between Y and X 
# for the dataframe data.df. Replace with the column names for your 
# Y and X variables, and your own dataset. 
my.lm=lm(Net.worth~YTD.Change,data=data.df) 
# the my.lm object contains a description of the linear model, 
# including the estimated coefficients. To retrieve the coefficients: 
my.lm$coefficients 
summary(my.lm)
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------

