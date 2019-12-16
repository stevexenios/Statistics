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
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments/R_Lab_9")
data.df =read.csv("data.csv")
#Qualitative: Industry(Levels: Diversified & Technology)
#Quantitative: Net Worth
#--------------------------------------------------------------------------------------------------
#C3.(2) Calculate a 95% confidence interval for the difference in population 
# Copy and paste the function lines into the R console and execute 
# This creates your own function to calculate Welch's corrected df. 
welch.fn=function(s1,s2,n1,n2) 
{   
        return(floor((s1^2/n1+s2^2/n2)^2/((s1^2/n1)^2/(n1-1)+(s2^2/n2)^2/(n2-1)))) 
} 
# Next you would assign the object s1 the value for the  
# sample standard deviation for your first sample, 
# s2 the value for the sample standard deviation for your 
# second sample, and n1 and n2 the sample sizes for your first 
# and second sample. 
#Quantitative Mean of Networth
qMean = round(mean(data.df$Net.worth), 4)
#Diversified measures of center
divMean = round(mean(data.df$Net.worth[data.df$Industry == "Diversified"]), 4)
round(median(data.df$Net.worth[data.df$Industry == "Diversified"]), 4)
divSd = round(sd(data.df$Net.worth[data.df$Industry == "Diversified"]), 4)
#Technology Measures of center
techMean = round(mean(data.df$Net.worth[data.df$Industry == "Technology"]), 4)
round(median(data.df$Net.worth[data.df$Industry == "Technology"]), 4)
techSd = round(sd(data.df$Net.worth[data.df$Industry == "Technology"]), 4)
#size of samples
divN = length(data.df$Net.worth[data.df$Industry == "Diversified"])
techN = length(data.df$Net.worth[data.df$Industry == "Technology"])
# And here is how your run the function: 
#welch.fn(s1,s2,n1,n2)
df = welch.fn(divSd,techSd,divN,techN)
?t.test
t.test(data.df$Net.worth[data.df$Industry == "Diversified"], alternative ="two.sided", mu = divMean)
t.test(data.df$Net.worth[data.df$Industry == "Technology"], alternative ="two.sided", mu = techMean)
lowerT = qt(0.025, df)
lowerT
upperT = qt(0.975, df)
upperT
# Degrees of Freedom
df
#size of samples
divN
techN
diffSd = sqrt((divSd*divSd/divN)+(techSd*techSd/techN))
# Confidence Interval
lowerLimit = techMean-divMean - upperT*diffSd
upperLimit = techMean-divMean + upperT*diffSd
lowerLimit
upperLimit
# Degrees Of Freedom
df
#--------------------------------------------------------------------------------------------------
#INFERENCE IMBALANCE DESIGN
#C4 (3) You want to test whether the population mean of your quantitative...
#Pooled Variance is used when var.equal = TRUE, otherwise welchs
?prop.test
techMean
divMean
t.test(data.df$Net.worth[data.df$Industry == "Technology"], data.df$Net.worth[data.df$Industry == "Diversified"], 
       alternative ="two.sided",
       var.equal = TRUE,
       mu = 0)
#var.equal = FALSE, welchs
# Two independent samples with unequal variances
t.test(data.df$Net.worth[data.df$Industry == "Technology"], data.df$Net.worth[data.df$Industry == "Diversified"], 
       alternative ="two.sided",
       var.equal = FALSE,
       mu = 0)
#--------------------------------------------------------------------------------------------------
#C5 (2) Conduct the t-test...
#Done
#--------------------------------------------------------------------------------------------------
#C6 (3) Describe any possible limitations there are...
#Done
#--------------------------------------------------------------------------------------------------
#C7 (4) Use full sentences to interpret the results of your analysis...
#T-test version using tdf and tobs...
#t-value
Tdf = qt(0.975, df)
Tdf
# differences between the means
difference = techMean - divMean
difference
#Assuming equal Variances
spSquared = ((techN-1)*techSd*techSd+(divN-1)*divSd*divSd)/(techN+divN-2)
Tobs_EqualVar = difference/sqrt(spSquared*((1/techN)+(1/divN)))
Tobs_EqualVar
#Unequal Variances
Tobs_UnEqualVar = difference/((techSd*techSd/techN)+(divSd*divSd/divN))
Tobs_UnEqualVar
#Reject Null if Tobs >= Tdf
Tdf <= Tobs_EqualVar
Tdf <= Tobs_UnEqualVar
#Equal Variances
2*pt(Tdf, techN+divN-2)>=2*pt(Tobs_EqualVar,techN+divN-2)
2*pt(Tdf, df)>=2*pt(Tobs_UnEqualVar,df)
#--------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------

