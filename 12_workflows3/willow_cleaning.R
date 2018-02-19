################################################################################
### ENVS 410/510                                                             ###
### Wrangle: Tidying Data                                                    ### 
################################################################################


## OBJECTIVES:
## To practice identifying tidy versus unitdy data
## To practice tidying data in a way that is traceable and reproducible.
## To this end we'll be using the tidyr and dplyr packages.

## As a reminder:
## Tidy data are data that are easy to transform and visualize. 
## The key idea is that variables are stored in a consistent way.
## Each variable forms a column
## Each observation forms a row
## Each type of observational unit forms a table

## There are five common problems associated with messy data:
## 1) Column headers are values, not variable names
## 2) Multiple variables are stored in one column
## 3) Variables are stored in both rows and columns
## 4) Multiple types of observational units are stored in the same table
## 5) A single observational unit is stored in multiple tables

# Load the tidy verse

library(tidyverse)


## Read in the raw data
## Also have a look at the intial data file
rawdat <- read_csv("Niwot_Salix_2014_WillowSeedlingSurvey.csv", skip = 10)

## QUESTIONS:
## Where are the meta data for this file? 
## What is this format of data useful for?
## What is this format of data not useful for? 

##########################################
## Cleaning 1: Fill in missing variables #
##########################################

## From the book: Sometimes when a data source has primarily been used for data entry, 
## missing values indicate that the previous value should be carried forward:
## Compare filldat and rawdat
filldat <- rawdat %>%
  fill(block)


## TASK: Fill in the rest of the relevant columns of filldat


#################################################################### 
## Common problem 1: Column headers are values, not variable names #
####################################################################

## QUESTION: Does this problem exist in this dataset? If so, how would you change it?


## TASK: If necessary, create a new tibble called cleandat that starts with filldat and then solves this tidy data problem
## Plus: Go ahead and remove the "w_" from values in your new column

#################################################################### 
## Common problem 2: Multiple variables are stored in one column   #
####################################################################


## QUESTION: Does this problem exist in this dataset? If so, how would you change it?
## Note: there might be multiple examples of this. 
## Check the meta data on numeric versus alphabetical numbering

## TASK: If necessary, copy your cleandat workflow below and add code that addresses this problem

#################################################################### 
## Common problem 3: Variables are stored in both rows and columns #
####################################################################


## QUESTION: Does this problem exist in this dataset? If so, how would you change it?


## TASK: If necessary, copy your cleandat workflow below and add code that addresses this problem




######################################################################################### 
## Common problem 4: Multiple types of observational units are stored in the same table #
#########################################################################################


## QUESTION: Does this problem exist in this dataset? If so, how would you change it?


## TASK: If necessary, copy your cleandat workflow below and add code that addresses this problem
## Note: You may need to make separate tibbles



############################################################################### 
## Common problem 5: A single observational unit is stored in multiple tables #
###############################################################################


## QUESTION: Does this problem exist in this dataset? If so, how would you change it?


## TASK: If necessary, copy your workflow below and add code that addresses this problem



################################################################################################### 
## Put it together graphically: 
## How does snow addition, temperature and nitrogen affect willow seedling survival and growth? ###
###################################################################################################

