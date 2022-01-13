# This is a single line comment in R

# For multiline comments highlight multiple lines and Use
# ctrl + shift + c

# To get the working directory use functon getwd().
getwd()
# To set working directory pass the path to the setwd()function.Paths are defined using forward-slash /.  

# To execute a specific line of code highlight it and click on run

# ----- First Example using SCATTERPLOTS -----

# Load player data
mlbPlayers = read.table(file = file.choose(),
                        #file.choose brings up a dialogue that enables you to choose a data file
                        header = T, 
                        #header. Does it have a header or not.
                        sep = " ", 
                        #sep how is the data going to be seperated: spaces
                        na.strings = "`",
                        #na.strings. use back-quote to represent missing values.
                        stringsAsFactors = F)
# Grab just RBIs and Avg for each player
# playerData is known as a data frame (Table of Data)
# We get the stats we want by passing that list in a vector
playerData = mlbPlayers[,c("RBI", "AVG")]

# create a png file on which the scatterplot is to be plotted.
png(file = "player_rbi_avg.png")
# plot function is responsible for plottiing a scatter plot.
# we assign columns to the X and Y axis by using following notation: table_name$column_name
# xlab and ylab represent x and y labels respectively.
# main for the title
plot(x = playerData$RBI, y = playerData$AVG,
     xlab= "RBI", ylab = "AVG", main = "RBIs and Average")

dev.off()#Used to create the plot on the png file.
# To create the scatter plot you have to run all pieces of code involved, so highlight and click on run.

# ----- ASSIGNMENT -----
# You can assign a value using = or <-
myNum = 5
myNum
#----- VARIABLES ----
# Variable names in R start with letters, thereafter they can contain other letter, numbers, underscores or dots
# Most languages use data types to define how much space to set asside in memory.
# Variables in R are assigned R Objects

# Types are dynamic which means a variable'S data type changes based on the data assigned to it.

#Types in R.
#class gets the data type and print displays it to the console.
#numeric
print(class(4))

# integer
print(class(4L))
# Why is "L" used as a suffix?
# Could be: 
# Because R handles complex numbers which may be specified using the suffix "i" and this would be too simillar to "I"
# Because R's integers are 32-bit long integers and "L" therefore appears to be sensible shorthand for referring to this data type.
# The value a long integer can take depends on the word size. R does not natively support integers with a word length of 64-bits. 
#Integers in R have a word length of 32 bits and are signed and therefore have a range of −2,147,483,648 to 2,147,483,647. Larger values are stored as double.

#logical(TRUE, FALSE, T, F)
print(class(TRUE))

#complex numbers
print(class(1 + 4i))

#character
print(class("Sample"))

# convertion to raw bytes
print(class(charToRaw("Sample")))

#Not a must to use print
class(4)
is.integer(4L)

# You can check an objects class with (Returns True or False)
# is.integer(), is.numeric(), is.matrix(), is.data.frame(),
# is.logical(), is.vector(), is.character()

# You can convert to different classes with
# as.integer(), as.numeric(),...
as.integer(4.9)
as.numeric(4.3)

# ----- ARITHMETIC OPERATORS -----
sprintf()
# returns a character vector containing a combination of formatted string and variable value.

sprintf("4+5 = %d", 4+5)
sprintf("4 - 5 = %d", 4 - 5)
sprintf("4 * 5 = %d", 4 * 5)
sprintf("4 / 5 = %1.3f", 4 / 5)
sprintf("4 / 5 = %1.2f %d", 4 / 5, 5*2)#two values formatted into string.
sprintf("5 %% 4 = %d", 5 %% 4)# Modulus or remainder of division
sprintf("4^2 = %d", 4^2)# Value raised to the exponent of the next

# ----- VECTORS -----
# Vectors store multiple values
# Create a vector
numbers = c(3, 2, 0, 1, 8)
numbers
# Get value by index.Remeber R uses one-based index
numbers[1]

# Get the number of items
length(numbers)

# Get the last value
numbers[length(numbers)]

# Get everything but an iindex
numbers[-2] #everything but 2
numbers[-3] #everything but 3

# Get the 1st 2 values
numbers[c(1,2)]

#Get any three values
numbers[c(1, 3, 5)]

# Get the first to the third value
numbers[1:3]

#Replace a value at position 5
numbers[5] = 12
numbers

# Replace the 4th and 5th with 2
numbers[c(4,5)] = 2
numbers

# Sort values (decreasing can be TRUE or FALSE)
sort(numbers, decreasing = TRUE)

# Generate a sequence from 1 to 10
oneTOTen = 1:10
oneTOTen

class(oneTOTen)

# Sequence from 3 to 27 adding 3 each time
add3 = seq(from = 3, to = 27, by = 3) #Generates regular sequences, by sets the interval btn numbers.
add3

# Create 10 evens from 2
evens = seq(from = 2, by = 2, length.out = 10 )#length.out sets the desired lenght of the sequence.
evens

#Find out if a value is in vector.
4 %in% evens

# rep() repeats a value/s x, a number of times 
rep(x = 2, times = 4)
rep(x = c(1,2,3), times = 2)

# each defines how many times to repeat each item in a vector
rep(x=c(1,2,3), times=2, each=2)

# ----- RELATIONAL OPERATORS -----

sprintf("4 == 5 : %s", 4 == 5)
sprintf("4 != 5 : %s", 4 != 5)
sprintf("4 > 5 : %s", 4 > 5)
sprintf("4 < 5 : %s", 4 < 5)
sprintf("4 >= 5 : %s", 4 >= 5)
sprintf("4 <= 5 : %s", 4 <= 5)

# Relational operator vector tricks
oneTo20 = c(1:20)# a vector containing values 1 to 20.
#Extract even numbers form this vector
oneTo20[oneTo20%%2 == 0] #for modulus operator we use two percentage signs.

# ----- LOGICAL OPERATORS -----
# && logical and || logical or
# cat() concatanates values
cat("TRUE && FALSE = ", T && F, "\n")
cat("TRUE || FALSE = ", T || F, "\n")

TRUE && FALSE
TRUE || FALSE

# ----- DECISION MAKING -----

#if, else and else if work like other languages

age = 17

if(age >= 18){
  print("You can drive and vote")
} else if(age >= 16){
  print("You can Drive")
}else{
  print("You have to Wait")
}

# ----- SWITCH -----
# Used when you have a limited set of possible values

grade = "A"

switch (grade,
  "A" = print('Great'),# strings can have both double and single quotes.
  "B" = print("Good"),
  "C" = print("Ok"),
  "D" = print("Terrible"),
  print("No such Grade"))

# ----- STRINGS -----
str1 = "This is a string"
str2 = 'This is also a string'

# get the length of the string
nchar(str1)

# You can compare strings, where first letters are considered
"bad" >"Ann"
'Boy' >'Cat'

# Combine strings and 
strComb = paste("Owl", "Bear")
strComb
# You can define seperator if needed
strComb2 = paste("Owl", "Bear", sep = " ")
strComb2

# Extract characters from string. For example Bear
substr(x=strComb2, start = 5, stop = 8 )
strComb2

# Substitute one string with another
sub(pattern = "Owl", replacement = "Hawk", x = strComb2)
# sub substitutes only the first match
sub(pattern = "Egg", replacement = "Chicken", x = "Egg Egg")

# Substitute all matches
gsub(pattern = "Egg", replacement = "Chicken", x = "Egg Egg")

# Split string into vector
strVect = strsplit("A dog ran fast", " ")#splits on spaces in the string
strVect

#---- FACTORS -----
# Factors are the data objects which are used to categorize the data and store it as levels. 
# They can store both strings and integers. They are useful in the columns which have a limited number of unique values. 
# Like "Male, "Female" and True, False etc. They are useful in data analysis for statistical modeling.
# Create a factor vector
direction = c("Up", "Down", "Left", "Right", "left", "Up")
direction
factorDir = factor(direction)
# Check if it's a Factor
is.factor(factorDir)

# A factor object contains levels which store all possible values
levels(x = factorDir)

# print the factor
print(factorDir)

# You can define your levels and their orders
dow = c("Monaday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
wDays = c("Tuesday", "Thursday", "Monday")
wdFact = factor(x = wDays, levels = dow, ordered = T)
wdFact

# ----- DATA FRAMES -----
# A Data Frame is a table which contains any type of data and an equal amount of data in each column
# Each row is called a record and each column a varaible

# Create customer data frame
custData = data.frame(name = c("Tom", "Sally", "Sue"), age = c(43, 28, 35), stringsAsFactors = F)
# On creating any data frame with a column of text data, 
# R treats the text column as categorical data and creates factors on it. We can prevent this by using stringAsFactors
custData

# Get data in row 1 column 1. datafarame[row, column]
custData[1, 1]

# Get all data in 1st row
custData[1, 1:2]

# Get all ages
custData[1:3, 2]

# Get dimensions. In terms of number of rows and columns
dim(custData)

#Add another record
recordMark = data.frame(name = "Mark", age = 33)
custData = rbind(custData, recordMark)#row bind
custData

# Add another column called debt
debt = c(0, 25.50, 36, 48.19)
custData = cbind(custData, debt)
custData

# Check if money is owed(using comparison operators)
custData$debt > 0

# Get the records with owe money(We filter on the condition)
owesMoney = custData[custData$debt > 0, ]
owesMoney

#----- LOOPING -----
# Repeat until a condition is met
num = 1
repeat{# loops
  print(num)
  num = num + 1
  if(num > 5){# the condition to meet
    # Jumps out of loop
    break
  }
}

# Repeat while condition is true
num = 0
while (num < 10) {
  print(num)
  num = num + 1
}

# next, skips the rest of the loop and jumps back to the top.
# print only odd numbers
num = 0
while (num < 10){
  num = num + 1
  if(num %% 2==0){
    next
  }
  print(num)
}

# For loop is used to cycle through a vector
oneToFive = 1:5
for(i in oneToFive){
  print(i)
}

#----- Matrices -----
# A Matrix stores values in rows and columns(2 dimensional array)

# Create a matrix with a single column
matrix1 = matrix(data = c(1,2,3,4))
matrix1

# Create a matrix with defined rows and columns
matrix2 = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2)#define number of rows and columns the matrix should have
matrix2

# You can also fill by row in stead of column.
matrix3 = matrix(data = c(1,2,3,4), nrow = 2, ncol = 2, byrow = T)
matrix3

# Get a Matrix's dimension in terms of no of rows and columns it has.
dim(matrix3)

# Get a value at row, column
matrix3[1,2]

# Get a whole row
matrix3[1,]

# Get a whole column
matrix3[,2]

# Combine vectors(One dimesional arrays)to make a Matrix
matrix4 = rbind(c(1,2,3), c(4,5,6), c(7,8,9))
matrix4
#or
matrix4 = rbind(1:3, 4:6, 7:9)
matrix4

# Get multiple rows.
matrix4[2:3,]
#or
matrix4[c(2,3),]

# Omit a certain row
matrix4[-1]

# change row value
matrix4[1,] = c(9,8,3)
matrix4

# ----- MULTI-DIMENSIONAL ARRAYS -----
# You can also create Matrices in layers

# Create a MDA with 2 rows, columns and layers
array1 = array(data=1:8, dim=c(2,2,2))
array1

# Get a value
array1[1,2,2]#array[row, colum, layer]

# Experiment grabbing values like we did with the Matrix
# Everything is the same

# ----- FUNCTIONS -----
# A function is R is an object that performs operations on passed attributes and then returns results
# or simply control back

# Function definition

getSum = function(num1, num2){
  return(num1+num2)#return is a function that returns the resulys from a function operation.
}

getSum(10,9)

# If there is no return the last expression is returned
# You can define default attribute value, which are used when you don't pass any values to the function.

getDifference = function(num1 = 1, num2 = 1){
  num1 - num2
}

getDifference()# Functions must have paranthesis, if not you will be callng a variable.

# Handling missing arguments
missFunc = function(x){
  if(missing(x)){# missing evaluates to True or False depending on availabilty of the arguement.
    return("Missing Argument")
  }else {
    return(x+x)
  }
}

missFunc(5)

# Excepting variable number of arguments with ellipses
getSumMore = function(...){
  numList =  list(...)# functions that creates list
  
  sum = 0
  for(i in numList){
    sum = sum + i
  }
  sum
}

getSumMore(1,2,3,4,5,6,7,8,9)

# Lambda/Disposable/Anonymous Functions are great for quick operations like doubling everything in a list.
numList = 1:10
dblList = (function(x)x * 2)(numList)
dblList

# Closures are functions created by functions


power = function(exp){#This is the first function to recieve a values, sets the exponent
  function(x){#This is the second function to recieve a value receives the value to be cubed.
    x ^ exp
  }
}

cubed = power(3)
cubed(2)

# Functions can be stored in lists
funcList = list(add2 = function(x)x+2, 
                add3 = function(x)x+3)

#select and execute a function
funcList$add2(2)

# ----- EXCEPTION HANDLING -----
# An exception is an anomalous or exceptional conditions requiring special processing – during the execution of a program.Examples errors.
# Used to gracefully handle errors
# Exception handling a division by string error

divide = function(num1, num2){
  tryCatch(# provides a mechanism for handling unusual conditions including error and warnings.
    num1 / num2,
    error = function(e){#e is a reference to the instance of the Exception 
      if(is.character(num1) || is.character(num2)){
        print("Can't Divide with Strings")
      }
    }
  )
}

divide(10, "5")

# ----- READING WRITING FILES -----
# Create a text file with headers fname lname sex and the data in a txt file Use `for missing values.
# Save in the same directory as your R file

# Create a dataframe
myFamily = data.frame(fname = c("Ernest", "Anthony", "Jackline", "Dismas"), lname = c("Muisyo", "Mbithi", "Mueni", "Musyoki"), age = c(25, 34, 58, 58))

# Write to text file
write.table(x = myFamily, 
            file = file.choose(), 
            sep = " ", na = "`", 
            quote = F, row.names = F)

#Read data from file
myPeople = read.table(file = file.choose(), 
                      header = T,
                      sep = " ",
                      na.strings = "`",
                      stringsAsFactors = F)# stringAsFactors make the string columns factors thus makes it complicated to update 

myPeople

# add another record

donnaRecord = data.frame(fname = "Donna",
                         lname = "Heyward",
                         age = 24)

myPeople = rbind(myPeople, donnaRecord)
myPeople

# Get the first 3 records
head(myPeople, 3)

# Get the last 2 records
tail(myPeople, 2)

# Update a field
myPeople[5,1] = 'Marjorie'

myPeople

# Basic Plotting
# R provides grear plotting tools
# Plotting x y coordinates from a matrix.
xy1 = matrix(data = c(1,2,3,4,5,1,2,3,4,5), nrow=5, ncol=5)#nrow and ncol are used to shape the vector to a matrix.
xy1

plot(xy1)#Basic plot is a scatter plot.

# Draw a line
x2 = c(1,2,3,4,5)
y2 = c(1,2,3,4,5)
plot(x2, y2, type = "l")

#points and lines
plot(x2, y2, type = "b")

#Points and lines with no space around points, labels, a blue line (find more with colors())
plot(x2, y2, type = "o", main = "My plot", xlab = "X axis", ylab = "Y axis", col = "steelblue")

# pch (1-25) defines different points styles
# lty (1-6) defines different lines styles
# xlim defines the max and min x plotting region
# ylim defines the max and min y plotting region
plot(x2, y2, type="b", pch=3, lty=2,
     xlim=c(-8,8), ylim=c(-8,8))

# Multiple plots
plot(x2, y2, type="b")
# Adds straight lines at 2 and 4 coordinates
abline(h=c(2,4), col="red",lty=2)
# Draw a 2 segmented lines with starting and ending x
# and y points
segments(x0=c(2,4), y0=c(2,2), x1=c(2,4), y1=c(4,4),
         col="red",lty=6)# lty sets the dashed lines.
# Draw an arrow
arrows(x0=1.5, y0=4.55, x1=2.7, y1=3.3, col="blue")
# Print Text
text(x=1.25, y=4.75, labels="Center")

# Load a built in data.frame and plot a scatter plot.
plot(faithful)
# Highlight eruptions with a waiting time greater then 4
eruptions4 = with(faithful, faithful[eruptions > 4,])
# Draw specific points
points(eruptions4, col="red", pch=3)

# ----- MATH FUNCTIONS -----

sqrt(x = 100)

# Get the power you raise the base to get x
log(x=1000, base=10)

# Euler's number 2.718 to the power of x
exp(x=2) # ln N = X is equal to N = e^x, so here we are finding N.

# Sum of all vector values
sum(c(1,2,3,4))

# Find the mean(or average)
mean(c(1,5, 6, 3,8,3))

# median
median(c(1,5, 6, 3,8,3))

randD1 = c(1,5, 6, 3,8,3)
# Minimum value
min(randD1)

# Maximum value
max(randD1)

# Min and max value
range(randD1)

# Rounding
ceiling(4.3) #rounds to the next whole number
floor(4.5)# rounds to the previous whole number

# Cumulatives
cumsum(c(1,2,3))
cumprod(c(1,2,3))
cummax(c(7:9, 4:6, 1:3))
cummin(c(4:6, 1:3, 7:9))

# Generating Random samples
# Flipping a coin 10 times and weigh the probability of the next flip based on the previous

sample(0:1, 10, replace = T)#Generates random whole values in between the random range.

sample(1:20, 10, replace = T)# replace = T, ditates that the function should select values with replacement, that is at all tiimes it is picking from 10 values.
#This means one value can appear multiple times.


# ----- PIE CHARTS -----
# List percentages
foodPref = c(15, 35, 10, 25, 15)

# Labels associated with percentages
foodLabels = c("Spaghetti", "Pizza", "Mac n' Cheese",
               "Chicken Nuggets", "Tacos")

# Where to save the image
png(file="child_food_pref.png")

# Colors used for each option
colors = rainbow(length(foodPref))#Color palettes. Creates a vector of n contiguous colors. 

# Create the chart
pie(foodPref, foodLabels, main="Food Prefs",
    col=colors)

# Print legend and cex shrinks the size
legend("topright", c("Spaghetti", "Pizza", "Mac n' Cheese",
                     "Chicken", "Tacos"), cex=0.8,
       fill=colors)

# Save the chart
dev.off() #These functions provide control over multiple graphics devices.

# 3D Pie Chart
# Download package in console install.packages("plotrix")
# Get the library
library(plotrix)#import the library

# Name the chart file
png(file="3d_child_food_pref.png")

# Create the chart
pie3D(foodPref, labels=foodLabels, explode=0.1,
      start=pi/2, main="Food Prefs", labelcex=0.8)

# Save the chart
dev.off()

# ----- BAR CHARTS -----
# Define the bar chart file
png(file="food_pref_bar_chart.png")

# Plot the chart
barplot(foodPref, names.arg=foodLabels, xlab="Votes",
        ylab="Food Options", col=colors, 
        main="Food Prefs")

# Save File
dev.off()

# ----- REGRESSION ANALYSIS -----
# Used to study a relationship between 2 separate 
# pieces of data (What is the relation between batting
# average and RBIS)

# Create relationship model between AVG and RBIs
relation = lm(playerData$RBI~playerData$AVG)
relation
# Create file 
png(file="RBI_AVG_Regression.png")
# Plot the chart
plot(playerData$AVG, playerData$RBI, 
     main="AVG & RBI Regression", 
     abline(lm(playerData$RBI~playerData$AVG)),
     xlab="AVG", ylab="RBIs")

# Save chart
dev.off()

# ----- MULTIPLE REGRESSION -----
# Used to study the impact on one variable from numerous 
# others
# Estimate RBIs based on other player stats
playerData2 = mlbPlayers[,c("RBI","AVG","HR","OBP",
                            "SLG","OPS")]
# Create the relationship model btn RBI and other attributes
relation2 = lm(playerData2$RBI ~ playerData2$AVG + 
                 playerData2$HR + playerData2$OBP +
                 playerData2$SLG + playerData2$OPS)

relation2
sprintf("Intercept : %f1.4", coef(relation2)[1])
# coef is a generic function which extracts model coefficients from objects returned by modeling functions. coefficients is an alias for it.
# Remember correlation coefficient this is what coef is calculating
coef

# How the different stats effect RBIs
sprintf("AVG : %f1.4", coef(relation2)[2])
sprintf("HR : %f1.4", coef(relation2)[3])
sprintf("OBP : %f1.4", coef(relation2)[4])
sprintf("SLG : %f1.4", coef(relation2)[5])
sprintf("OPS : %f1.4", coef(relation2)[6])

# Calculate expected RBIs based on stats
# Evan Longoria
# RBIs   AVG   HR   OBP   SLG   OPS
# 86     .261  20  .313  .424  .737
RBIGuess = -5.05 + (372.96 * .261) + (2.56 * 20) +
  (-5.41 * .313) + (-167.37 * .424)
RBIGuess