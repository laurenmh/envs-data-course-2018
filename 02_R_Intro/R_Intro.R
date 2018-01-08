################################################################################
### ENVS 410/510                                                             ###
### MODULE 1: Intro to R and RStudio                                         ### 
################################################################################

## OBJECTIVE:
## To explore the basic building blocks of the R programming language.
## We will practice the concepts of 'function' and 'argument', 
## and learn some basic functions in R. 


########################################################################
## 1) In it's simplest form, R can be used as an interactive calculator. 
########################################################################

## Type this in the console; note the use of the operator '+' 
2 + 3

## TASK: Use the other basic algebraic operators: '-', '*', '/' and '^' to 
## substract, multiply, etc. the values 2 and 3.
 
## Like any good interactive calculator, 
## R follows the standard mathematical order of operations. 
## Type:
3+2/8

#Now type:
(3+2)/8

## QUESTION: Why are the results different?

## TASK: What is the result of: multiplying 5 by 11, then dividing that value by 3, 
## adding 6 to it, and rising that result to 2? Write this operation as a 
## single line of code.
((5+2)+8)

######################################################
## 2) Functions can replace basic algebraic operators.
######################################################

## Type this into the console:
sum(2, 3)

## QUESTION: What is 'sum'? 

#Now type:
Sum(2, 3)

# The above command should give you an error. This is because R distinguishes 
# lower case from UPPER case. The function 'sum' is not the same 
# as 'Sum', and in this case 'Sum' does not exist.
# You can view the source code of sum by typing just the function name into the console.
sum

## In addition to the common arithmetic operators +, -, / and ^, other useful operators are
## mean() for the mean, sqrt() to take the square root, and abs() for the absolute value


################################################
##3) Results can be stored and reused as objects.
################################################

## We've summed 2 and 3 a lot! This time let's just save the results for future use.
## Type:
x <- sum(2,3)

## This can be read as "x gets 2 plus 3". Notice that R did not print the result 5 this time.
## To view the contents of the variable x, jut type x and press Enter:
x

## Now store the results of x/8 in a new variable y:
y <- x/8

##QUESTION: What is the value of y?


######################################################
##4) A collection of values can be stored as a vector.
######################################################

## The easiest way to create a vector is with the c() function, 
## which stands for 'concatenate' or 'combine'. 
## Let's store a vector of 1.1, 9 and 3.14 in a variable called z:
z <- c(1.1, 9, 3.14)

## Type z to view its contents:
z

## QUESTION: What do you notice about z?
## TASK: How long is z? Use the function length() to confirm the length of this vector.
length(z)

## You can combine vectors to make a new vector. 
## Create a new vector that contains z, 555,then z again in that order:
c(z, 555, z)

## Numeric vectors can be used in arthimetic expressions. 
## Type:
z *2 +100

## Create a new vector my_sqrt:
my_sqrt <- sqrt(z-1)

## QUESTION: Before you look at it, what do you think my_sqrt contains?
my_sqrt

###################################################
##5) Vectors can be created as sequences of numbers.
###################################################

## The simplest way to create a sequence is by using the ':' operator.
## Type:
1:20

## QUESTION: What happens if we instead type 20:1?

## The seq() function gives us more control over the sequence
## Type:
seq(1,20)

## This gives the same output as 1:20. But let's say we want the numbers to range from
## 0 to 10 but at 0.5 increments. Try it out:
seq(0,10, by=.5)

## Or maybe we don't care about the increment, we just want 30 numbers between 5 and 10.
## Try it out:
my_seq <- seq(5,10, length=30)
my_seq
length(my_seq)

## QUESTION: What is my_seq?
## TASK: Confirm that my_seq has length 30.

## Maybe we want to create a vector that contains 40 0s. 
## Type:
rep(0, times=40)

## Or maybe we want to create a vector that contains 10 repetitions of the vector (0,1,2)
## Type: 
rep(c(0,1,2), times=10)

## Finally, let's imagine that instead of repeating the vector (0,1,2) over and over,
## we want 10 zeros, then 10 ones, then 10 twos. We can do this with the each argument.
## Try it out:
rep(c(0,1,2), each=10)



##TASK: Can you generate the same vector by integrating the seq() and rep() functions?

#################################################
##6) Values can be characters as well as numbers.
#################################################

## What's your favorite species?
## Mine is Lasthenia californica (California goldfields!)
## To make sure we remember that, let's make a vector called "laurens_favorite":
laurens_favorite<-c("Lasthenia", "calfornica")

## View that vector. But typing laurens_favorite takes a looong time. 
## To save time, type l then press tab. What happens?

length(laurens_favorite)

## TASK: Use the function length to confirm the length of this vector.

## What if I want genus and species to be grouped for a vector of length one?
## Type:
laurens_favorite2 <- paste("Lasthenia", "californica")

## TASK: Use the function length to confirm the length of this vector.
## TASK: Use the function 'paste' to join together the genus and species of your 
## favorite species. 
## TASK: Concatenate c() your favorite species and mine (laurens_favorite2) 
## in a vector called our_favorites.

##################################
##7) Getting help as we go along.
#################################

## The arguments to each function are alway documented. 
## Let's look up the possible arguments for the paste function.
##Type: 
?paste

## TASK: Using the help for this function, identify what is the role of the 
## argument 'sep'.
## TASK: Does this argument have a predetermined value? What is that value?
## TASK: Use 'paste' to join together the genus and species names of your 
## favorite species using the character '_' to separate the two words.

