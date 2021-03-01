# Title: R Intro

# OBJECTIVE:
## To explore the basic building blocks of the R programming language.
## To become comfortable running and writing R code and working together.
## We will practice the concepts of 'function' and 'argument', 
## and learn some basic functions in R. 
## Create a resource to refer back to.

#_____________________________________________________________________________________________________#
# Setting up your R project
#_____________________________________________________________________________________________________#
## Go over folders and paths outside 

## R will default to look for a file in your "working directory"
## You can see your working with:
getwd()

## You can manually change your working directory by entering a file path in setwwd(), but it is
## generally better to set up and R project to start in the correct folder 

## More on file paths when we import data later!

#_____________________________________________________________________________________________________#
# Working with objects in R
#_____________________________________________________________________________________________________#
# 1) In it's simplest form, R can be used as an interactive calculator.

## Type this in the console; note the use of the operator '+' 
2 + 3

## Now run the same code but this time run it from the script 
## Instead of copying 2 + 3 into the console, click on or highlight the line and run cmd-R or cntl-R 
## Or, in a pinch, click on the line and click the run icon to the right in RStudio above the script
2 + 3 

## Now try running the lines preceded by hashtags
## What happens? Why might this be useful?

## TASK: Use the other basic algebraic operators: '-', '*', '/' and '^' to 
## subtract, multiply, etc. the values 2 and 3.


## Google "R mathematical operators" to see more (e.g., https://www.datamentor.io/r-programming/operator/)

## Like any good interactive calculator, 
## R follows the standard mathematical order of operations. 
## Run:
3+2/8

#Now run:
(3+2)/8

## QUESTION: Why are the results different?

## TASK: What is the result of: multiplying 5 by 11, then dividing that value by 3, 
## adding 6 to it, and rising that result to 2? Write this operation as a 
## single line of code.


## RETURN TO SLIDES BEFORE MOVING ON TO FUNCTIONS

#_____________________________________________________________________________________________________#
# Functions 
#_____________________________________________________________________________________________________#
# 2) Functions can replace basic algebraic operators.

## Type this into the console:
sum(2, 3)

## QUESTION: What is 'sum'? 

#Now type:
Sum(2, 3)

# The above command should give you an error. This is because R distinguishes 
# lower case from UPPER case. The function 'sum' is not the same 
# as 'Sum', and in this case 'Sum' does not exist.

# 3) Results can be stored and reused as objects.
## In addition to the common arithmetic operators +, -, / and ^, other useful operators are
## mean() for the mean, sqrt() to take the square root, and abs() for the absolute value

## We've summed 2 and 3 a lot! This time let's just save the results for future use.
## RETURN TO SLIDES FOR NOTES ABOUT NAMING CONVENTIONS


## This can be read as "x gets 2 plus 3". Notice that R did not print the result 5 this time.
## To view the contents of the variable x, jut type x and press Enter


## Now store the results of x/8 in a new variable y


##QUESTION: What is the value of y?

#4) A collection of values can be stored as a vector.

## The easiest way to create a vector is with the c() function, 
## which stands for 'concatenate' or 'combine'. 
## Let's store a vector of 1.1, 9 and 3.14 in a variable called z


## Type z to view its contents:


## QUESTION: What do you notice about z?
## TASK: How long is z? Use the function length() to confirm the length of this vector.


## You can combine vectors to make a new vector. 
## TASK: Create a new vector that contains z, 555,then z again in that order.


## Numeric vectors can be used in arthimetic expressions. 
## Type:
z*2 + 100

## Create a new vector my_sqrt:
my_sqrt <- sqrt(z-1)

## QUESTION: Before you look at it, what do you think my_sqrt contains?

#5) Vectors can be created as sequences of numbers.

## The simplest way to create a sequence is by using the ':' operator.
1:20

## QUESTION: What happens if we instead type 20:1?


## The seq() function gives us more control over the sequence


## This gives the same output as 1:20. But let's say we want the numbers to range from
## 0 to 10 but at 0.5 increments. 


## Or maybe we don't care about the increment, we just want 30 numbers between 5 and 10.


## QUESTION: What is my_seq?

## TASK: Confirm that my_seq has length 30.


## Maybe we want to create a vector that contains 40 0s. 


## Or maybe we want to create a vector that contains 10 repetitions of the vector (0,1,2)


## Finally, let's imagine that instead of repeating the vector (0,1,2) over and over,
## we want 10 zeros, then 10 ones, then 10 twos. We can do this with the each argument.


##TASK: Can you generate the same vector by integrating the seq() and rep() functions?


#6) Values can be characters as well as numbers.

## What are your favorite fruits?
## Mine are pineapple, mango and passion fruit
## Let's make a vector with those fruits called "jessicas_favorite"


## View that vector. But typing jessicas_favorite takes a looong time. 
## To save time, type j then press tab. What happens?


## TASK: Use the function length to confirm the length of this vector.

## Create your own vector of fruits called student_favorite

## TASK: Use the function length to confirm the length of the student_favorite vector.


## TASK: Concatenate c() your favorite fruits and mine (jessicas_favorite) 
## in a vector called our_favorites.


## You can use an "index" to see one or several elements of your vector
## Print the full vector our_favorites


## To select the third element, type


## To see the second through fourth, type


#7) Vectors can be combined into matrices and data frames  
## Let's start with matrices. These are similar to vectors in that all of the 
## data must be of the same type (e.g., numbers), but matrices have 2 dimensions 
## (rows x columns). Matrices (e.g., for correlation and covariance coefficients)
## are common in statistics and in population biology, where population 
## projection matrices are used.

## We'll first create a simple vector containing the number 1 through 24. 
## The colon : operator can be used to create a sequence.


## TASK: view the vector that you just created.


## The dim() function gives us the dimensions of an object.
## QUESTION: What's the result of the dim(firstvector)?

## Oops! dim() only retrieves the dimensions of a matrix, array or dataframe. Why do you think this is?
## But we can use length() to determine a vector's length.

## TASK: Use length() to find the length of firstvector.


## Take a look at the dim help file


## According to ?dim, the dim() function can be used to both retrieve or SET the dimensions of an object.
## Let's use it to set the dimensions of firstvector.


## QUESTION: What are the dimensions of firstvector now? Use dim() to find out

## QUESTION: What is the class of firstvector now? Use the class() function to find out.


## Congratulations, you've changed a 24-element into a 4 row by 6 column matrix!
## To reflect this change, let's assign our new matrix to an object called "firstmatrix"
firstmatrix <- firstvector

## We can also create a similar matrix as follows:
secondmatrix <- matrix(1:24, nrow=4, ncol=6)

## We can check to see if the matrices are the same using the identical() function.
identical(firstmatrix, secondmatrix)  #Did we succeed?

## Suppose that firstmatrix represents the happiness levels over time for some
## students of the class. Each row represents a student and each
## column represents happiness level taken at 6 times during this session.
## It would be useful to label the rows so that we know who the students are.
## We'll add a column to the matrix to do this.

students <- c("Alexana", "Markus", "Jon", "Guiliana")

## Now we'll use the cbind() function to combine participants and firstmatrix.
# cbind indicates "column bind" - it to binds columns together. 
# rbind is the corresponding function for rows.


## QUESTION: what attributes of the matrix change when we do this?

## Remember that a matrix can only contain one type of data! 
## We added a character vector to a numeric matrix!
## And what did R do in response? Forced all of the numbers into character values. 

## QUESTION: What data structure allows columns with different data types?

## Let's create a dataframe called "happydata" by binding students and first matrix


## TASK: View the contents of happydata.


## TASK: Find the class and dimension of happydata.


## One last problem, the names of the columns are not descriptive. So we'll fix that.

## TASK: Create a vector called cnames containing "student", "time1", "time2", "time3", "time4", "time5", "time6"
## Hint: you could copy those names from above. Don't forget to concatenate using c()!


## TASK: Use the names() function to set the column names attribute for our data frame. 
## This will be similar to our use of dim() to set the dimension of a vector.

## TASK: View the final data frame.

## We will look at more ways to explore and summarize a data frame when we import data later

#8) Anatomy of a function
## Let's take a closer look at functions
## Functions have 5 different properties
## 1) the name, 2) the body, 3) the arguments, 4) the default values, 5) the last line of code

## Below is Grolemund's "roll two dice" function
roll2 <- function(bones = 1:6){
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

## roll2 is the name of the function. What are the other components of the function?

## What happens if you run roll2 without supplying any arguments?


## TASK: Create your own function where you see the outcome of rolling three dice


## There are many built in functions in R (sometimes referred to as "base R functions")
## Some useful ones are: mean(), min(), max(), plot() and hist()
## You can look up the arguments to these functions by typing ?mean, etc. in the console

## TASK: Try out these functions using the following fake data
xdata <- sample(1:100, 50)
ydata <- sample(1:100, 50)


#_____________________________________________________________________________________________________#
# Packages and libraries
#_____________________________________________________________________________________________________#
## Installing and Loading Packages
## A package in R is a set of functions (and sometimes also data and images). You can find lots of packages that users built
## by searching online. You can install a package by using the function "install.packages()". For example, 
## there is a package called "cowsay", which will print out a picture of an animal saying whatever you specify.


## Once a package is installed, you don't have to install it again, but you do need to load the package each time you 
## open a new R session with the function library()


## This package only contains one function, the function "say". 


## You can view more options by looking at the help (including how to change the text color and character color). 


## TASK: Try changing the say character, what the character says and the color of the character/words
## You can view color name options here: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#_____________________________________________________________________________________________________#
# Importing data
#_____________________________________________________________________________________________________#
## Now we are going to import the CITES data we previously downloaded using the function read.csv()


## You can view your data frame by clicking on it in the "Environment" window to the right
## Or you can use the View function


## To see part of the data frame, you can use the function head()


## Many times, it isn't very useful to view the whole data frame. Instead, we may want to summarize
## different aspects of the data frame. Here are a few useful functions for exploring your data frame:

## Summarize the contents of the columns with str()


## Note that this gives you the number of columns/rows, the column names, and the data type 
## Characters or factors should be used for categorical or text information 
## Integers or numeric should be used for numeric values
## You can change data types with as.numeric, as.character, etc. 
## There are some important considerations for working with factors, but we will deal with those later

## See the column names with colnames()


## See the unique values of a column
## To access a single column, use the operator $


## You can also print this column or save this column to another object


# TASK: Plot PM10 versus Mortality


#_____________________________________________________________________________________________________#
# In class exercise
#_____________________________________________________________________________________________________#
## If time, work on the following steps/questions in small groups

## 1) Install the package "palmerpenguins"

## 2) This package has a data frame within it called "penguins". View this data frame and use str() 
## to summarize what is in it. 

## 3) What penguin species are represented in this data set? Which islands? 

## 4) What is the mean body mass? Note: look at the help if you initially get an error.

## 5) Plot the bill length versus bill depth.

## 6) If you still have time, check out the plot function options to change the point color, 
## symbol, axis names and figure title. 


