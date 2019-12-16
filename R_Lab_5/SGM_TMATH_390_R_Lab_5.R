###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 5 R script
# November 4, 2019
###################################################################################################
#OBJECTIVES:
#1. Use R to calculate probabilities for the Poisson and binomial distributions.
#2. Use R to explore how the shape of the Poisson and binomial distributions change with different
#   parameter values.
#3. Use R to draw random numbers from the Poisson and binomial distributions.
#   In this lab we will learn the R functionality for two of the thoeretical distributions we have learned in
#   class: Poisson and binomial. We will also construct some boxplots and histograms.
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
#Determine working directory with
getwd()
#No need to setwd
# 0:15 returns a vector of integers: (0,1,2,...,15). First we create an
# object (x.vals) that contains this vector
x.vals=0:15
# The function dpois evaluates the Poisson mass function at
# each value of x and returns a vector of probabilities
pois1.vec=dpois(x = x.vals,lambda = 4.5)
# And here we plot those values, with x.vals on the x-axis and
# the Poisson probabilities on the y-axis. The argument type="b"
# specifies that we want both points and lines.
plot(0:15,pois1.vec,type="b",pch=16)
#--------------------------------------------------------------------------------------------------
#C2. (1) Copy and paste the plot generated using the code above.
#--------------------------------------------------------------------------------------------------
#C3. (1) Use R to find P(x=5) for Pois(4.5). Return your R command and the result.
dpois(5, 4.5)
# You can evaluate dpois at multiple x simultaneously, and you can add them up using the sum function:
# Evaluates the Poisson distribution at x = {0,1,2}
dpois(0:2, 4.5)
## [1] 0.01110900 0.04999048 0.11247859
# Then sums the probabilities
sum(dpois((0:2),4.5))
## [1] 0.1735781
# Finds the cumulative probability associated with the Poisson 
ppois(2,4.5)
## [1] 0.1735781
#--------------------------------------------------------------------------------------------------
#C4. (2) Use this information to find P(x ??? 3) (there are at least 3 clams) and explain how you got it.
#Explanation: Get the difference between the overall probability and the probability that you caught 
#at most 2 clams (the complement of P(x=>3))
1-ppois(2, 4.5)
#--------------------------------------------------------------------------------------------------
#C5. (2) Create and include a plot that explores how the Poisson distribution changes with 
#different values of ????: {1,2,3,4,5,6,7,8}
# use x.vals again, defined as 0:15
x.vals=0:15
# use par to set up a 3x3 graphing window
par(mfrow=c(3,3))
# now create a graph for lambda=1
plot(x.vals,dpois(x.vals,1),type="b", col = "red", main = "Lambda 1")
# lambda=2
plot(x.vals,dpois(x.vals,2),type="b", col = "green", main = "Lambda 2")
# now repeat for the additional values of lambda
# lambda=3
plot(x.vals,dpois(x.vals,3),type="b", col = "blue", main = "Lambda 3")
# lambda=4
plot(x.vals,dpois(x.vals,4),type="b", col = "yellow", main = "Lambda 4")
# lambda=5
plot(x.vals,dpois(x.vals,5),type="b", col = "pink", main = "Lambda 5")
# lambda=6
plot(x.vals,dpois(x.vals,6),type="b", col = "orange", main = "Lambda 6")
# lambda=7
plot(x.vals,dpois(x.vals,7),type="b", col = "purple", main = "Lambda 7")
# lambda=8
plot(x.vals,dpois(x.vals,8),type="b", col = "brown", main = "Lambda 8")
#--------------------------------------------------------------------------------------------------
###################################################################################################
#Binomial distribution: 
#The relevant functions for the binomial distribution are dbinom pbinom. 
#They have the syntax: dbinom(x,size,prob), pbinom(q,size,prob)
#--------------------------------------------------------------------------------------------------
#C7. (1) What do "size" and "prob" represent in these function calls?
# Find out meaning of arguments using
help(dbinom)
help(pbinom)
#--------------------------------------------------------------------------------------------------
#C8. (1) Using R, determine the probability x ??? 3, where X~binom(100,0.005). 
#Hint: adapt the code from C4 above.
sum(dbinom(0:3, 100, 0.005))
#Get cumulative probability associated with the binomial upto 3 
pbinom(3, 100, 0.005)
#--------------------------------------------------------------------------------------------------
#We are often also interested in determining a normal distribution quantile associated with a given
#probability. We use the r function qnorm ("q" for quantile) to return the normal quantile associated with
#a given cumulative probability

#C7. (1) For the R command below, report the result (include the command in your report). 
#Compare the result to the quantile obtained using the standard normal table.
qnorm(0.25, mean=0, sd=1)
#--------------------------------------------------------------------------------------------------
#C8. (2) Now use R to determine the value that represents the 97th percentile standard normal
#distribution,...
qnorm(0.97, mean=0, sd=1)
#and the 97th percentile of a normal distribution with a mean of 5.8 and a standard
#deviation of 2.5 inches (distribution of January precipitation from lecture 7 practice problems). Return
#you R code and the solution.
qnorm(0.97, mean=5.8, sd=2.5)
#--------------------------------------------------------------------------------------------------
#C9. (2) Create and include a plot that explores how the binomial distribution changes with different
#vaues of ???? and n. Plot all of the distributions on one sheet for the following combinations of n and ????
#(with x = 0:20):
#set up a plotting area with 3 rows and 4 columns.
par(mfrow=c(3,4))
plot(dbinom(0:20,5,0.01),type="b", col = "cyan1", main = "n=5, pi=0.01")
plot(dbinom(0:20,5,0.1),type="b", col = "orange", main = "n=5, pi=0.1")
plot(dbinom(0:20,5,0.5),type="b", col = "green", main = "n=5, pi=0.5")
plot(dbinom(0:20,5,0.9),type="b", col = "red", main = "n=5, pi=0.9")
plot(dbinom(0:20,10,0.01),type="b", col = "cyan2", main="n=10, pi=0.01")
plot(dbinom(0:20,10,0.1),type="b", col = "orange", main = "n=10, pi=0.1")
plot(dbinom(0:20,10,0.5),type="b", col = "green", main = "n=10, pi=0.5")
plot(dbinom(0:20,10,0.9),type="b", col = "red", main = "n=10, pi=0.9")
plot(dbinom(0:20,20,0.01),type="b", col = "cyan3", main = "n=20, pi=0.01")
plot(dbinom(0:20,20,0.1),type="b", col = "orange", main = "n=20, pi=0.1")
plot(dbinom(0:20,20,0.5),type="b", col = "green", main = "n=20, pi=0.5")
plot(dbinom(0:20,20,0.9),type="b", col ="red", main ="n=20, pi=0.9")
# now complete the rows and columns with the remaining
# values of n and pi.
#--------------------------------------------------------------------------------------------------
#We can also produce random draws from our common distribution using the "r" version of each
#function (e.g., rnorm, rpois, rbinom), where "r" is for random. Look at the help files for each function
#and create histograms of 10000 random draws from the following distributions:
help(rnorm)
help(rpois)
help(rbinom)
#Here is some R code to get you started (repeated from Lab 1). Adapt this code for the remaining
#distributions
# reset the plotting window to include only one plot
par(mfrow=c(1,1))
# now create the histogram and perform the
# random draws in one line
hist(rnorm(10000,0,1),
     xlab ="rnorm(10000, 0, 1) data",
     xlim = c(-5, 5),
     ylim = c(0, 2500),
     main = "Normal Distribution Random Draws")
#--------------------------------------------------------------------------------------------------
#C11. (2) X~binom(50,0.5) (rbinom) (histogram)
hist(rbinom(10000,50,0.5),
     xlab ="rbinom(10000,50,0.5) data",
     xlim = c(0, 50),
     ylim = c(0, 2500),
     main = "10000 X~binom(50,0.5) Draws")
#--------------------------------------------------------------------------------------------------
#C12. (2) X~Pois(3.2) (rpois) (histogram)
hist(rpois(10000,3.2),
     xlim = c(0, 12),
     ylim = c(0, 2500),
     main = "10000 X~Pois(3.2) Draws")
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------