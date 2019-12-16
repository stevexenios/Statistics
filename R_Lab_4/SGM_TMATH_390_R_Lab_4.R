###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 4 R script
# October 27, 2019
###################################################################################################
#OBJECTIVES:
#1. Use R to calculate probabilities for the normal and exponential distributions.
#2. Use R to draw random numbers from the normal and exponential distributions.
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
## The function dnorm returns the height of the normal density
# function at a given value of x, for a normal distribution with
# a given mean and standard deviation (sd)
dnorm(x = 1,mean = 0, sd = 1)
#--------------------------------------------------------------------------------------------------
#C2. (1) For what special normal distribution does the above call return the value of the normal density
#function?
help(dnorm)
#--------------------------------------------------------------------------------------------------
#C3. (1) Report the result of the dnorm command as executed above, and compare it to the value
#obtained from a hand-calculation of the normal density function with the same mean and standard
#deviation.
#We can also use R to determine the cumulative area under the curve for the normal distribution using
#the pnorm ("p" for probability) function. This returns the value of the cumulative distribution function
#(cdf) for the normal distribution. This is especially helpful because we cannot evaluate the integral
#analytically, we have to solve it numerically. R does this for us.



#--------------------------------------------------------------------------------------------------
###################################################################################################
#C4.(1) Create a graph of the cumulative distribution function for the standard normal distribution. Use
#the code below to help you.
#Creating a sequence of x values for the graph
#starting at -4, to 4, by 0.1
x.vals=seq(-4,4,0.1)
# Creating a vector of the corresponding values for the cdf
y.vals=pnorm(x.vals,mean=0,sd=1)
#Making the graph
plot(x.vals,y.vals,xlab="Z",ylab="F(x)",main="cdf for the standard normal")
#--------------------------------------------------------------------------------------------------
#C5. (1) Describe the shape of the graph you created in C4.
#The lowest range is 0.0, and the highest is 1.0, corresponding to the probabilities defined by 
#cdf(zminimum=  -4) = 0 and cdf(zmaximum = 4) = 1.0	 
#--------------------------------------------------------------------------------------------------
#C6. (2) For each R command below, report the result (include the command in your report). Compare
#the result to the probability obtained using the standard normal table. 
#Command gets the area for the standard normal distribution, below z value = 2.37
#Or then rounds it to 5 decimal places
round(pnorm(2.37, mean=0, sd=1), 5)
#Command gets the area for the standard normal distribution, below z value = -0.5
#at default 7 decimal places
pnorm(-0.5, mean=0, sd=1)
#Command gets the area for the standard normal distribution, between z value = -0.5 and 2.37
#at default 7 decimal places
pnorm(2.37, mean=0, sd=1) - pnorm(-0.5, mean=0, sd=1)
#Command gets the area for the normal distribution, at x value < 18
#at default 7 decimal places
pnorm(18, mean=22, sd=4.5)
#Confirming with standard normal distribution
#Calculated z value from (x-mu)/sd
pnorm(-0.88888889, mean=0, sd=1)
#Command gets the area for the normal distribution, at x value < 18
#at default 7 decimal places
pnorm(23, mean=22, sd=4.5)
#Confirming with standard normal distribution
pnorm(0.222222222, mean=0, sd=1)
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
#We can also produce random draws from our common distributions using the "r" version of each
#function (e.g., rnorm), where "r" is for random. Look at the help file for this function and create a
#histogram of 10000 random draws from the standard normal distribution:
help(rnorm)
# reset the plotting window to include only one plot
par(mfrow=c(1,1))
#Creating 10000 random draws
#From a normal distribution with mean 0 
#And standard deviation sigma 1
#Assigning it to var x.random=rnorm(10000,0,1)
x.random = rnorm(10000, 0, 1)
#mgp specifies the lines in the margin at which the
#axis label, axis tick marks, and axis line are drawn
# las=1 ensures that axis numbers are aligned in the reading direction
# mar is for space round histogram
par(mar=c(5,5,5,0), mgp=c(3,1, 0),las=1)
#main argument writes a title
#xlab labels x-axis
#xlim sets the maximum and minimum values displayed on the x-axis
#ylim sets the max and min values to be diplayed on y-axis
#col sets the color
#xaxp sets the tick marks on the x-axis
hist(x.random,
     xlab ="10000 random x data",
     xlim = c(-4, 4),
     xaxp = c(-4, 4, 8),
     ylim = c(0, 2500),
     col="orange",
     main="10000 random draws from standard normal") 
#--------------------------------------------------------------------------------------------------
#C10. (1) Now produce a histogram of random draws from the distribution of January precipitation.
#X~N(5.8,2.5)
#Same command as above, same purpose.
par(mfrow=c(1,1), mar=c(5,5,5,0), mgp=c(3,1, 0),las=1)
#Creating 10000 random draws
#From a normal distribution with mean 5.8 
#And standard deviation sigma 2.5
#Assigning it to var x.prec=rnorm(10000,5.8,2.5)
#xaxp helps set tick marks of the histogram at 2.5
x.prec = rnorm(10000, 5.8, 2.5)
hist(x.prec,xlab ="rnorm(10000, 5.8, 2.5) data accounting for precipitation",
     xlim = c(-6, 17), 
     breaks = seq(-4.2,15.8, 2.5),
     xaxp = c(-4.2, 15.8, 8),
     ylim = c(0, 4000),
     col="blue",
     main="Precipitation distribution fof January 1950-1999 using rnorm(10000, 5.8, 2.5)") 
#--------------------------------------------------------------------------------------------------
#C11.(1) Use the function pexp to sketch the exponential distribution where ???? = 1/8500.
# create a sequence of x values starting from 0, ending at
# 10000, by 0.1
x.vals=seq(0,10000,0.1)
# now create a vector of y-values which is the exponential
# density function evaluated at those value of x
y.vals=dexp(x.vals,rate=1/8500)
# now graph:
plot(x.vals,y.vals,xlab="X",ylab="f(x)",main="X~exp(1/8500)")
#--------------------------------------------------------------------------------------------------
#C12. (1) Using R, what is the probability x<1000 where x~exp(1/8500)? Return the solution and your R
#code in your lab document. Hint: use pexp.
help(pexp)
pexp(1000, rate = 1/8500)
#--------------------------------------------------------------------------------------------------
#C13. (1) Using R, what is P(1000<x<10000) for this exponential distribution? Return the solution and
#your R code in your lab document.
pexp(10000, rate=1/8500) - pexp(1000, rate=1/8500)
#--------------------------------------------------------------------------------------------------
#C14. (1) Using R, produce a histogram of 10000 random draws of an exponential distribution with a
#mean of 1/8500 events per hour. Hint: use rexp.
#rexp(10000, rate=1/8500)
hist(rexp(10000, rate=1/8500),xlab ="rexp(10000, rate=1/8500) data values", xlim = c(0, 80000), ylim = c(0, 5000), main="Histogram distribution for rexp(10000, rate=1/8500)")
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------