################################################################################
### ENVS 410/510                                                             ###
### WORKFLOWS: FROM RAW DATA TO QUESTION ANSWERING                           ### 
################################################################################

## OBJECTIVES:
## To learn how to plan a workflow.
## To implement a workflow using the pipeline.
## To this end we'll be using the dplyr package.

## ASSIGNMENT: This finished script will function as PS 5
## Please write your answers to the in-English questions with hash-tagged text

################################################################################
##### 1) SPECIES RICHNESS WITH N-DEPOSITION                                  ###
################################################################################

# Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
# What did Clark and Tilman 2008 find? See text and Figure 1
# Q: What pattern did they observe between species richness and nitrogen treatment?
# Q: What years and treatments did they include in Figure 1?
# 
# WORKFLOW: Mimic Figure 1 (except on the y-axis just plot species richness).
# Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
# With a partner, write out the workflow you will use in English and put up a green sticky when done.
# What QAQC will you do beforehand?
# How will you manipulate the data once you are happy with it?
# After we have discussed as a class, write out and run the workflow in tidyverse R.

## Here's the data import to get you going:
cdrplant <- read.csv("e001_Plant aboveground biomass data.csv", stringsAsFactors = F, skip = 726) %>%
  as.tibble()


################################################################################
##### 2) C:N RATIO WITH N-DEPOSITION                                         ###
################################################################################

# Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
# What did Wedin and Tilman 1996 find? See text and Figure 7
# 
# WORKFLOW: Mimic a panel in Figure 7 for C:N ratio of above ground biomass with nitrogen addition level
# Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?nbe001
# With a partner, write out the workflow you will use in English and put up a green sticky when you are done.
# What QAQC will you do beforehand?
# How will you manipulate the data once you are happy with it?
# After we have discussed as a class, write out and run the workflow in tidyverse R.
# BONUS: Make a panel graph of C:N by nitrogen addition for each species.

## Here's the data import to get you going:
cdrCN <- read.csv("e001_Plant aboveground biomass carbon and nitrogen.csv", stringsAsFactors = F, skip = 491) %>%
  as.tibble()


################################################################################
##### 3) TOTAL BIOMASS WITH OVER TIME AND WITH RICHNESS AND NITROGEN        ###
################################################################################

# Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
# What did Haddad et al. 2002 find? See text and Figure 6
# Q: What pattern did they observe between species richness and nitrogen treatment?
# Q: What years and treatments did they include in Figure 1?
# 
# WORKFLOW A: Mimic Figure 6a
# Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
# With a partner, write out the workflow you will use in English and put up a green sticky when done.
# What QAQC will you do beforehand?
# How will you manipulate the data once you are happy with it?
# After we have discussed as a class, write out and run the workflow in tidyverse R.
# 
# 
# WORKFLOW B: How do you hypothesize that biomass will change with nitrogen and species richness?
# Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
# With a partner, write out the workflow you will use in English and put up a green sticky when done.
# What QAQC will you do beforehand?
# How will you manipulate the data once you are happy with it?
# After we have discussed as a class, write out and run the workflow in tidyverse R.

