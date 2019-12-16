###################################################################################################
# Steve G. Mwangi
# TMATH 390, Fall 2019
# Lab 7 R script
# November 17, 2019
###################################################################################################
#OBJECTIVES:
#1.Using simulated data to explore sampling distributions.
###################################################################################################
#C1.
#Submitted R Script.
#--------------------------------------------------------------------------------------------------
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments/R_Lab_7")
#--------------------------------------------------------------------------------------------------
#Clean environment setup
rm(list=ls())
#Creating population size
N = 100000
#Create exp distribution population with mean rate of 2/hr
pop.exp = rexp(N, rate = 2)
#Recording population parameters
pop.exp.mu = mean(pop.exp)
pop.exp.med = median(pop.exp)
pop.exp.var = var(pop.exp)
pop.exp.sigma = sqrt(pop.exp.var)
#Binomial distribution with 4 independent bernoulli trials, pi = 0.3
pop.binom = rbinom(N, size = 4, prob = 0.3)
#Record population parameters for this distribution
pop.binom.mu = mean(pop.binom)
pop.binom.median = median(pop.binom)
pop.binom.var = var(pop.binom)
pop.binom.sigma = sqrt(pop.binom.var)
#Histograms for the two populations
summary(pop.exp)
summary(pop.binom)
par(mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0),mfrow=c(1,2))
# xlim=c(lower,upper) is the flag used to customize the
# x-axis limits. Substitute ylim=c(lower,upper) for the y-axis
hist(pop.exp, col = "blue", xlim=c(0,6), ylim=c(0,70000), main="Exponential distributed population")
hist(pop.binom, col = "red", xlim=c(0,6), ylim=c(0,70000), main="Binomial distributed population")
#Taking samples
#The sample function takes as arguments
#the objects from which we're sampling
sample1 = sample(pop.exp, size = 5)
#Here is the sample
sample1
mean(sample1)
median(sample1)
var(sample1)
sd(sample1)
#Reapeating 1000 times
#Create empty data frames for 5, 10 and size 30
samp.exp5 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
samp.exp10 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
samp.exp30 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
#Loop the sampling
for(i in 1:1000)
{
  #draw the random sample
  tmp5.samp = sample(pop.exp, size = 5)
  tmp10.samp = sample(pop.exp, size = 10)
  tmp30.samp = sample(pop.exp, size = 30)
  #and enter the value for the summary statistics in the data frame
  #samp5
  samp.exp5$mean[i]=mean(tmp5.samp)
  samp.exp5$median[i]=median(tmp5.samp)
  samp.exp5$var[i]=var(tmp5.samp)
  samp.exp5$sd[i]=sd(tmp5.samp)
  #samp10
  samp.exp10$mean[i]=mean(tmp10.samp)
  samp.exp10$median[i]=median(tmp10.samp)
  samp.exp10$var[i]=var(tmp10.samp)
  samp.exp10$sd[i]=sd(tmp10.samp)
  #samp30
  samp.exp30$mean[i]=mean(tmp30.samp)
  samp.exp30$median[i]=median(tmp30.samp)
  samp.exp30$var[i]=var(tmp30.samp)
  samp.exp30$sd[i]=sd(tmp30.samp)
}
# Mean
# note: mfcol tells R to fill in the panels column
# by column rather than by row
par(mfcol=c(2,4),mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0))
hist(samp.exp5$mean, col = "orange",xlab="Sample mean",main="Exponential population, n=5",
     xlim=c(0,2), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.exp.mu,lwd=2)
qqnorm(samp.exp5$mean, col = "orange", xlim = c(-4, 4), ylim = c(0, 2), main="Exponential pop, n=5")
qqline(samp.exp5$mean)
### Now for samples of size 10
hist(samp.exp10$mean, col = "purple",xlab="Sample mean",main="Exponential pop, n=10",
     xlim=c(0,2), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.exp.mu,lwd=2)
qqnorm(samp.exp10$mean, col = "purple", xlim = c(-4, 4), ylim = c(0, 2),main="Exponential pop, n=10")
qqline(samp.exp10$mean)
### Now for samples of size 30
hist(samp.exp30$mean, col = "green",xlab="Sample mean",main="Exponential pop, n=30",
     xlim=c(0,2), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.exp.mu,lwd=2)
# now a qq plot
qqnorm(samp.exp30$mean, col = "green", xlim = c(-4, 4), ylim = c(0, 2),main="Exponential pop, n=30")
qqline(samp.exp30$mean)
# Now a boxplot to compare all three distributions side by side
boxplot(samp.exp5$mean,samp.exp10$mean,samp.exp30$mean,
        ylab="Sample mean",xlab="Sample size",names=c("5","10","30"), col = c("orange", "purple", "green"),
        main="Exponential population",ylim=c(0,2))
#Variance
# note: mfcol tells R to fill in the panels column
# by column rather than by row
par(mfcol=c(2,4),mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0))
hist(samp.exp5$var, col = "orange",xlab="Sample Variance",main="Exponential population, n=5",
     xlim=c(0,3), ylim = c(0, 700))
# draw a vertical line at the true value
abline(v=pop.exp.var,lwd=2)
qqnorm(samp.exp5$var, col = "orange", xlim = c(-4, 4), ylim = c(0, 3), main="Exponential pop, n=5")
qqline(samp.exp5$var)
### Now for samples of size 10
hist(samp.exp10$var, col = "purple",xlab="Sample Variance",main="Exponential pop, n=10",
     xlim=c(0,3), ylim = c(0, 700))
# draw a vertical line at the true value
abline(v=pop.exp.var,lwd=2)
qqnorm(samp.exp10$var, col = "purple", xlim = c(-4, 4), ylim = c(0, 3),main="Exponential pop, n=10")
qqline(samp.exp10$var)
### Now for samples of size 30
hist(samp.exp30$var, col = "green",xlab="Sample Variance",main="Exponential pop, n=30",
     xlim=c(0,3), ylim = c(0, 700))
# draw a vertical line at the true value
abline(v=pop.exp.var,lwd=2)
# now a qq plot
qqnorm(samp.exp30$var, col = "green", xlim = c(-4, 4), ylim = c(0, 3),main="Exponential pop, n=30")
qqline(samp.exp30$var)
# Now a boxplot to compare all three distributions side by side
boxplot(samp.exp5$var,samp.exp10$var,samp.exp30$var,
        ylab="Sample Variance",xlab="Sample size",names=c("5","10","30"), col = c("orange", "purple", "green"),
        main="Exponential population",ylim=c(0,3))
###################################################################################################
#Binomial
###################################################################################################
#Reapeating 1000 times
#Create empty data frames for 5, 10 and size 30
samp.binom5 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
samp.binom10 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
samp.binom30 = data.frame(mean = rep(NA, 1000),median=rep(NA, 1000), var = rep(NA, 1000), sd=rep(NA,1000))
#Loop the sampling
for(i in 1:1000)
{
  #draw the random sample
  tmpb5.samp = sample(pop.binom, size = 5)
  tmpb10.samp = sample(pop.binom, size = 10)
  tmpb30.samp = sample(pop.binom, size = 30)
  #and enter the value for the summary statistics in the data frame
  #samp5
  samp.binom5$mean[i]=mean(tmpb5.samp)
  samp.binom5$median[i]=median(tmpb5.samp)
  samp.binom5$var[i]=var(tmpb5.samp)
  samp.binom5$sd[i]=sd(tmpb5.samp)
  #samp10
  samp.binom10$mean[i]=mean(tmpb10.samp)
  samp.binom10$median[i]=median(tmpb10.samp)
  samp.binom10$var[i]=var(tmpb10.samp)
  samp.binom10$sd[i]=sd(tmpb10.samp)
  #samp30
  samp.binom30$mean[i]=mean(tmpb30.samp)
  samp.binom30$median[i]=median(tmpb30.samp)
  samp.binom30$var[i]=var(tmpb30.samp)
  samp.binom30$sd[i]=sd(tmpb30.samp)
}
###################################################################################################
#Binomial Mean
###################################################################################################
# note: mfcol tells R to fill in the panels column
# by column rather than by row
par(mfcol=c(2,4),mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0))
hist(samp.binom5$mean, col = "red",xlab="Sample mean",main="Binomial population, n=5",
     xlim=c(0,4), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.binom.mu,lwd=2)
qqnorm(samp.binom5$mean, col = "red", xlim = c(-4, 4), ylim = c(0, 4), main="Binomial pop, n=5")
qqline(samp.binom5$mean)
### Now for samples of size 10
hist(samp.binom10$mean, col = "pink",xlab="Sample mean",main="Binomial pop, n=10",
     xlim=c(0,4), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.binom.mu,lwd=2)
qqnorm(samp.binom10$mean, col = "pink", xlim = c(-4, 4), ylim = c(0, 4),main="Binomial pop, n=10")
qqline(samp.binom10$mean)
### Now for samples of size 30
hist(samp.binom30$mean, col = "blue",xlab="Sample mean",main="Binomial pop, n=30",
     xlim=c(0,4), ylim = c(0, 300))
# draw a vertical line at the true value
abline(v=pop.binom.mu,lwd=2)
# now a qq plot
qqnorm(samp.binom30$mean, col = "blue", xlim = c(-4, 4), ylim = c(0, 4),main="Binomial pop, n=30")
qqline(samp.binom30$mean)
# Now a boxplot to compare all three distributions side by side
boxplot(samp.binom5$mean,samp.binom10$mean,samp.binom30$mean,
        ylab="Sample mean",xlab="Sample size",names=c("5","10","30"), col = c("red", "pink", "blue"),
        main="Binomial population",ylim=c(0,4))
###################################################################################################
#Binomial Variance
###################################################################################################
# note: mfcol tells R to fill in the panels column
# by column rather than by row
par(mfcol=c(2,4),mar=c(3.5,3.5,1.5,0.5),mgp=c(2.5,0.5,0))
hist(samp.binom5$var, col = "red",xlab="Sample Variance",main="Binomial population, n=5",
     xlim=c(0,4), ylim = c(0, 400))
# draw a vertical line at the true value
abline(v=pop.binom.var,lwd=2)
qqnorm(samp.binom5$var, col = "red", xlim = c(-4, 4), ylim = c(0, 4), main="Binomial pop, n=5")
qqline(samp.binom5$var)
### Now for samples of size 10
hist(samp.binom10$var, col = "pink",xlab="Sample Variance",main="Binomial pop, n=10",
     xlim=c(0,4), ylim = c(0, 400))
# draw a vertical line at the true value
abline(v=pop.binom.var,lwd=2)
qqnorm(samp.binom10$var, col = "pink", xlim = c(-4, 4), ylim = c(0, 4),main="Binomial pop, n=10")
qqline(samp.binom10$var)
### Now for samples of size 30
hist(samp.binom30$var, col = "blue",xlab="Sample Variance",main="Binomial pop, n=30",
     xlim=c(0,4), ylim = c(0, 400))
# draw a vertical line at the true value
abline(v=pop.binom.var,lwd=2)
# now a qq plot
qqnorm(samp.binom30$var, col = "blue", xlim = c(-4, 4), ylim = c(0, 4),main="Binomial pop, n=30")
qqline(samp.binom30$var)
# Now a boxplot to compare all three distributions side by side
boxplot(samp.binom5$var,samp.binom10$var,samp.binom30$var,
        ylab="Sample Variance",xlab="Sample size",names=c("5","10","30"), col = c("red", "pink", "blue"),
        main="Binomial population",ylim=c(0,4))

