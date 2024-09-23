# Data Visualization
rm(list = ls())
setwd("~/Desktop/R_Root/Teaching/")
data = read.csv("Data/obesity_data.csv")


ages = data$Age
m = mean(ages)
s = sd(ages)

hist(ages)
hist(data$Height, 50)
boxplot(data$Height)
median(data$Height)
quantile(data$Height)
max(data$Height)
min(data$Height)


female_h = data[data$Gender == "Female", "Height"]
male_h = data[data$Gender == "Male", "Height"]
boxplot(female_h, male_h, 
        ylab = "Height", xlab = "Gender")


boxplot(BMI ~ Gender, data)

##
# plot the BMI vs obesity (Home)



# scatter plot
color = rep("red", 1000)
color[data$Gender == "Male"] = "green"

plot(data$Height, 
     data$Weight, 
     pch = 20, 
     col = color,
     cex = .5)


















