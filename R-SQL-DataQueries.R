#Question 1

install.packages("sqldf")

library(sqldf)

data("CO2")

result <- sqldf("SELECT Type, AVG(uptake) AS average_uptake FROM CO2 GROUP BY Type")

print(result)
View(result)

#Type average_uptake
#1 Mississippi       20.88333
#2      Quebec       33.54286

#Question 2

Died.At <- c(22,40,72,41)
Writer.At <- c(16, 18, 36, 36)
First.Name <- c("John", "Edgar", "Walt", "Jane")
Second.Name <- c("Doe", "Poe", "Whitman", "Austen")
Sex <- c("MALE", "MALE", "MALE", "FEMALE")
Date.Of.Death <- c("2015-05-10", "1849-10-07", "1892-03-26","1817-07-18")

df <- data.frame(Died.At, Writer.At, First.Name, Second.Name, Sex, Date.Of.Death)

df$Sex <- as.factor(df$Sex)

names(df) <- c("age_at_death", "age_as_writer", "first_name", "surname", "gender", "date_died")

df$date_died <- as.Date(df$date_died)

john_doe_birthdate <- df$date_died[df$first_name == "John"] - 
  as.numeric(df$age_at_death[df$first_name == "John"]) * 365.25

print(john_doe_birthdate)

#Result 
#[1] "1993-05-09"

#Question 3
install.packages("reshape2")
library(reshape2)

product <- c("A", "B")
height <- c(10, 20)
width <- c(5, 10)
weight <- c(2, NA)
observations_wide <- data.frame(product, height, width, weight)

observations_long <- melt(observations_wide, id.vars = "product", na.rm = TRUE)

print(observations_long)

#Results

#> print(observations_long)
#product variable value
#1       A   height    10
#2       B   height    20
#3       A    width     5
#4       B    width    10
#5       A   weight     2


# Question 4 
data(mtcars)

split_mtcars <- split(mtcars$mpg, mtcars$cyl)

average_mpg <- sapply(split_mtcars, mean)

print(average_mpg)

#Results
#print(average_mpg)
#4        6        8 
#26.66364 19.74286 15.10000 


#Question 5
data(mtcars)

avg_hp_4_cyl <- mean(mtcars$hp[mtcars$cyl == 4])

avg_hp_8_cyl <- mean(mtcars$hp[mtcars$cyl == 8])

abs_difference <- abs(avg_hp_4_cyl - avg_hp_8_cyl)

print(abs_difference)


#Results 
#> print(abs_difference)
#[1] 126.5779


#Question 6

data(airquality)

mean_temp_june <- mean(airquality$Temp[airquality$Month == 6], na.rm = TRUE)

print(mean_temp_june)

#Results
#[1] 79.1


#Question 7 

install.packages("dplyr")
library(dplyr)

result <- mtcars %>%
  group_by(am) %>%
  summarize(mean_mpg = mean(mpg, na.rm = TRUE)) %>%
  arrange(mean_mpg)

print(result)

#Results 
# A tibble: 2 × 2
#am mean_mpg
#<dbl>    <dbl>
#  1     0     17.1
#2     1     24.4

#Question 8 

install.packages("scatterplot3d")

# Load the scatterplot3d package
library(scatterplot3d)

scatterplot3d(x = mtcars$wt,        # X-axis corresponds to wt (weight)
              y = mtcars$disp,      # Y-axis corresponds to disp (displacement)
              z = mtcars$mpg,       # Z-axis corresponds to mpg (miles per gallon)
              pch = mtcars$am,      # Point character corresponds to am (transmission)
              main = "3D Scatterplot of Car Attributes", # Title of the plot
              xlab = "Weight (1000 lbs)",                # X-axis label with units
              ylab = "Displacement (cu.in.)",            # Y-axis label with units
              zlab = "Miles per Gallon (mpg)")           # Z-axis label with units


#Question 9 


install.packages("ggplot2")
library(ggplot2)


library(scatterplot3d)

scatterplot3d(x = mtcars$wt,        # X-axis corresponds to weight
              y = mtcars$disp,      # Y-axis corresponds to displacement
              z = mtcars$mpg,       # Z-axis corresponds to miles per gallon
              pch = mtcars$am,      # Point character corresponds to transmission
              main = "3D Scatterplot of Car Attributes", # Plot title
              xlab = "Weight (1000 lbs)",                # X-axis label
              ylab = "Displacement (cu.in.)",            # Y-axis label
              zlab = "Miles per Gallon (mpg)")           # Z-axis label


#Answer
#  > library(scatterplot3d)
#> 
 # > scatterplot3d(x = mtcars$wt,        # X-axis corresponds to weight
                  +               y = mtcars$disp,      # Y-axis corresponds to displacement
  #                +               z = mtcars$mpg,       # Z-axis corresponds to miles per gallon
 #                 +               pch = mtcars$am,      # Point character corresponds to transmission
 #                 +               main = "3D Scatterplot of Car Attributes", # Plot title
#                  +               xlab = "Weight (1000 lbs)",                # X-axis label
#                  +               ylab = "Displacement (cu.in.)",            # Y-axis label
    #              +               zlab = "Miles per Gallon (mpg)")           # Z-axis label

#Question 10 
install.packages("ggplot2")
library(ggplot2)

library(ggplot2)

mtcars$gear <- as.factor(mtcars$gear) 

counts <- table(mtcars$gear)

ggplot(mtcars, aes(x = gear, y = mpg, width = counts[gear])) +
  geom_boxplot(aes(width = counts[gear]), fill = "lightblue") +
  xlab("Number of Gears") +
  ylab("Miles Per Gallon") +
  ggtitle("Boxplot of MPG by Number of Gears with Width Proportional to Number of Observations") +
  theme_minimal()


