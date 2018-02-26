################################################################################
### ENVS 410/510                                                             ###
### Wrangle: Tidying Data                                                    ### 
################################################################################

## Objective: To practice integrating the skills we have learned (data tidying and manipulating, data visualization) in workflows.

###########################
## 1) Read in the data ####
###########################

# Read the data into R and store it as a tibble with strings as characters
# What packages will you use?
# What function(s) will you use? Do you need to specify any of the arguments?





################################
## 2) Initial data tidying  ####
################################

# Q: Are all the variables labeled usefully? If not, relabel.                                                         
# Q: Are the data in the correct data types? If not, adjust.                       




################################
## 3) Length distributions  ####
################################

# TASK: Plot distributions of the lengths of each species.
# Q: What geom will you use?
# Q: Are the data normal? Why or why not? 
# Please answer both by describing what aspects of the distribution are or aren't normal, and by taking a guess as to the ecological reasons why.






################################
## 4) Length and width      ####
################################

# TASK: Plot the relationship between length and weight for the most common species. 
# Q: How will you identify the most common species?
# Q: What geom will you use?







###################################
## 4) Species composition      ####
###################################

# Species (cols) x location (rows) matrices are commonly used for analyzing species diversity (think: the "wide" version of the Moorea dataset).
# For this dataframe, treat tributaries as locations.
# TASK: Create a species x location matrix where the entries are the number of individuals of that species observed in the location.
