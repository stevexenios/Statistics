###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 3 R script
# October 15, 2019
###################################################################################################
#OBJECTIVES:
#1.Continuing to use R for exploratory data analysis
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
#Read your dataset into the current R session. For demonstration this lab assumes you name your R data
#object data.df. Navigate to the directory in which your dataset is located using setwd, then read the
#dataset into R.
#Determine working directory with
getwd()
#Change working directory to: C:\Users\steve\Desktop\UWT\Fall Classes\TMATH 390\R Documents\R Assignments\R_Lab_3
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments/R_Lab_3")
#Read csv file of my data
data.df = read.csv("data.csv")
#--------------------------------------------------------------------------------------------------
#C2.
#Describe second quantitative variable including units of measurement. 
#--------------------------------------------------------------------------------------------------
#C3.
#Quantitative variable chosen: YTD Change
#Producing a summary of Quantitative YTD Change column
summary(data.df$YTD.Change)
#--------------------------------------------------------------------------------------------------
###################################################################################################
#C4.
#Creating Histogram with properly labelled axes and title.
#Command creates a histogram of chosen column, in the dataframe data.df
#the xlab argument writes test to label the x-axis
# main argument gives it title
hist(data.df$YTD.Change, xlab="YTD Change in networth of 50 richest people (in billions of dollars)", main="YTD Change for Networth of Wealthiest 50 people")
#--------------------------------------------------------------------------------------------------
#C6.
#Boxplot
# Establishing a graphing window with 1 rows and 2 columns,
# and las = 1 sets axis labels to be horizontal
par(mfrow=c(1,2), las = 1)
#Creating a boxplot.
# ~ represents a relationship between two variable, with Y on left side, X on right side.
# Networth(quantitative) across Gender(Qualitative)
boxplot(data.df$YTD.Change~data.df$Gender)
#--------------------------------------------------------------------------------------------------
#C8.
#Individual summary statistics
#Command to get individual summary statistics
#FEMALE
#For mean
mean(data.df$YTD.Change[data.df$Gender=="Female"])
#For median
median(data.df$YTD.Change[data.df$Gender=="Female"])
#Standard Dev.
sd(data.df$YTD.Change[data.df$Gender=="Female"])
#MALE
#For mean
mean(data.df$YTD.Change[data.df$Gender=="Male"])
#For median
median(data.df$YTD.Change[data.df$Gender=="Male"])
#Standard Dev.
sd(data.df$YTD.Change[data.df$Gender=="Male"])
#--------------------------------------------------------------------------------------------------
#C9.
# the quantile function returns values for the
# quantiles indicated by probs
# this example uses a data frame called data.df
# and calculates the quantiles for the column called YTD Change
# Here the seq command is used. This produces a sequence
# that starts at the first number, ends at the second
# number, at the increment indicated by the third number
# you can try running the seq command by itself to see the result.
quantile(data.df$YTD.Change, probs=seq(0.1,0.9,0.1))
#--------------------------------------------------------------------------------------------------
#C10.
# Chosen QUalitative Variable: Gender Column
#Producing summaries of qualitative data. 
#Data frame is called data.df, and
#the column for qualitative variable is Gender
table(data.df$Gender)
#--------------------------------------------------------------------------------------------------
#C11.
#Creating a bar graph of a qualitative variable using the R function barplot.
# the barchart command takes the results of the table
# command and creates a barplot from them
barplot(table(data.df$Gender),
        xlab="Gender")
# if you want to make a Pareto graph, you can sort your
# table then create a bar graph using that.
# here we create an object for the table
table1.tab=table(data.df$Gender)
# the sort function will rearrange this, and the decreasing
# argument tells the function to sort in descending order
table1a.tab=sort(table1.tab,decreasing=TRUE)
# Now create a Pareto graph using the sorted table object
barplot(table1a.tab,
        xlab="Gender")
#--------------------------------------------------------------------------------------------------
#C10.b
# Chosen QUalitative Variable: Industry Column
#Producing summaries of qualitative data. 
#Data frame is called data.df, and
#the column for qualitative variable is Industry
table(data.df$Industry)
#--------------------------------------------------------------------------------------------------
#C11.b
#Creating a bar graph of a qualitative variable using the R function barplot.
# the barchart command takes the results of the table
# command and creates a barplot from them
barplot(table(data.df$Industry),
        xlab="Industry")
# if you want to make a Pareto graph, you can sort your
# table then create a bar graph using that.
# here we create an object for the table
table1.tab=table(data.df$Industry)
# the sort function will rearrange this, and the decreasing
# argument tells the function to sort in descending order
table1a.tab=sort(table1.tab,decreasing=TRUE)
# Now create a Pareto graph using the sorted table object
barplot(table1a.tab,
        xlab="Industry")
#--------------------------------------------------------------------------------------------------
#C12.a
#YTD Change
#ANALYSIS distributions
hist(data.df$YTD.Change, xlab="YTD Change in networth of 50 richest people (in billions of dollars)", main="YTD Change for Networth of Wealthiest 50 people")
#--------------------------------------------------------------------------------------------------
#C12.b
#Net worth
#ANALYSIS distributions
hist(data.df$Net.worth, xlab="Networth of 50 richest people (in billions of dollars)", main="Networth of Wealthiest 50 people")
#--------------------------------------------------------------------------------------------------
#C12. c
# the quantile function returns values for the
# quantiles indicated by probs
# this example uses a data frame called data.df
# and calculates the quantiles for the column called YTD Change
# Here the seq command is used. This produces a sequence
# that starts at the first number, ends at the second
# number, at the increment indicated by the third number
# you can try running the seq command by itself to see the result.
quantile(data.df$Net.worth, probs=seq(0.1,0.9,0.1))
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------