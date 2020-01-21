###################################################################################################
# Steve
# Lab 1 R script
###################################################################################################
#OBJECTIVES:
#1.Learn the basics of using R and R Studio
#2.Learn basic R graphing commands 
###################################################################################################
#C1. Submit Your R Scipts to Canvas.
#Upload them directly to your assignment as *.R documents.
#--------------------------------------------------------------------------------------------------
#C2. From RIntro1.pdf lab, copy and paste the results of the head(anscombe1.df) 
#command (section 3.1).
# We set the current working directory:
setwd("C:/Users/steve/Desktop/UWT/Fall Classes/TMATH 390/R Documents/R Assignments")
#I select the file and read in the contents of the data file using read.csv.
> anscombe1.df=read.csv(file.choose())
# We can look at the new object to make sure we read it in correctly
# This command below Views the entire object
View(anscombe1.df)
# This returns the first 6 lines of the object
head(anscombe1.df)
#--------------------------------------------------------------------------------------------------
#C3. (2) From the RIntro1.pdf lab, copy and paste the results of the summary(anscombe1.df$X1) 
#command. (section 4.1).
#The 5-number summary of the first column
summary(anscombe1.df$X1)
#--------------------------------------------------------------------------------------------------
#C4. (4) From the RIntro1.pdf lab, copy and paste the histogram, boxplot, and scatter plot 
#(section 5.1)
#This command below returns a histogram of the data in anscombe1.df first's column
hist(anscombe1.df$X1)
#This command below returns a boxplot of the data in anscombe1.df first's column
boxplot(anscombe1.df$X1)
#This command below returns a scatterplot of the data in anscombe1.df with X1 on the x-axis
#and Y1 on the y-axis
plot(anscombe1.df$X1, anscombe1.df$Y1)
###################################################################################################
#For RIntro_Graphing.pdf
#Create a random set of 100 x variables 
#rnorm(n.mu.sigma) draws a random set of n (100 in this case)
#draws from a normal distribution with mean mu (10 in this case)
#and standard deviation sigma (2 in this case)
x.fake=rnorm(100,10,2)
#Now we create a set of fake y-values that have a linear
#relationship with the x-values, with a random error component 
y.fake=100-1.5*x.fake+rnorm(100,0,2)
###################################################################################################
#--------------------------------------------------------------------------------------------------
#C5. (3) From the RIntro_Graphing.pdf lab, submit vertical boxplots of your x.fake and y.fake 
#variables (section 1.1)
#first setup the plotting window using par
#mgp specifies the lines in the margin at which the
#axis label, axis tick marks, and axis line are drawn 
#las=1 ensures that axis numbers are aligned in the reading direction 
par(mfrow=c(1,2),mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1)
#this creates a vertical boxplot.
boxplot(x.fake,ylab ="Fake x data")
boxplot(y.fake,ylab="Fake y data")
#--------------------------------------------------------------------------------------------------
#C6. (3) From the RIntro_Graphing.pdf lab, submit histograms of your x.fake and y.fake 
#variables (section 2.1)
#We create a histogram of each variable.
#Note the number of lines for side 3 (top) are increased here
#This makes room for the plot title.
par(mfrow=c(1,2),mar=c(3,3,2,0.5),mgp=c(2,0.5,0),las=1)
#we use the main argument to write a title on each graph
hist(x.fake,xlab ="Fake x data",col="purple", main="These are fake data!")
hist(y.fake,xlab="Fake y data",col="magenta", main="These also are fake data!") 
#--------------------------------------------------------------------------------------------------
#C7. (2) From the RIntro_Graphing.pdf lab, submit the scatterplot with x.fake on the x-axis,
#y.fake on the y-axis, with the single triangular cyan point added and the legend (section 6.2).
####Creating a scatter plot with custom labels
par(mar=c(3,3,0.5,0.5),mgp=c(2,0.5,0),las=1)
#Creating the scatterplot
####pch defines the plot symbolswith the default pch=1 giving empty points
####pch=16 gives solid points.
####xlab defines the x-axis label
####ylab the y-axis label
plot(x.fake,y.fake,xlab ="Fake x data",ylab="Fake y data",pch=16)
#Add color with col argument
#Add title using main argument
#Increase the number of lines in the right margin if you want to make room for text 
par(mar=c(3,3,2,2),mgp=c(2,0.5,0),las=1)
plot(x.fake,y.fake,xlab ="Fake x data", ylab="Fake y data",pch=16,col="black", main="Still fake data") 
#Add points to the current plot at the
#specified coordinates. Change the point symbol and color
points(x=9,y=80,pch=17,col="cyan")
#Add legend using legend function with preset locations for the legend.
#Setting it to "topright".
legend(x="topright",legend=c("FakeData","OneFakePt"),pch=c(16,17),col=c("black","cyan"))
#--------------------------------------------------------------------------------------------------
###################################################################################################
###################################################################################################
###################################################################################################
#---------------------------------------------END--------------------------------------------------







