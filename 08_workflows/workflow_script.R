################################################################################
### ENVS 410/510                                                             ###
### TRANSFORM: Grouping and piping                                           ### 
################################################################################

## OBJECTIVES:
## To learn how to plan a workflow.
## To implement a workflow using the pipeline.
## To this end we'll be using the dplyr package.


library(tidyverse)
library(lubridate)

### Let's pick back up where we left on on Wednesday:

wtemp <- read.csv("CalispellCreekandTributaryTemperatures.csv", stringsAsFactors = FALSE) %>%
  as_tibble()
names(wtemp) <- c ("date", "time", "calispell_temp", "smalle_temp", "winchester_temp")
wtemp <- mutate(wtemp, date2 = mdy(date), month = month(date2), year = year(date2))


###################################
## 6) dplyr tool number 6: group_by
###################################

## I'm more interested in how temperature changes with month or year.
## If we add the group_by function, summarize will give us the requested value FOR EACH GROUP.

## First, let's create a new dataframe table that is equal to to wtemp2 but includes two grouping variables: month and year
wtemp_by_monthyear <- group_by(wtemp, month, year)
## QUESTION: Print wtemp and wtemp_by_month. Can you see how they differ?

## Use summarize again, but this time on wtemp_by_month.
summarize(wtemp_by_monthyear, avg_temp_calispell= mean(calispell_temp, na.rm=TRUE))

## Let's take this a step further, and look at the mean and standard error.
## First, run this code to store a function that calculates SE
calcSE<-function(x){
  x <- x[!is.na(x)]
  sd(x)/sqrt(length(x))
}

## Then, let's summarize Calispell Creek temperatures both by mean and se and store it as a new dataframe:
wtemp_calispell_summary<- summarize(wtemp_by_monthyear, 
                                    avg_temp_calispell= mean(calispell_temp, na.rm=TRUE),  
                                    se_temp_calispell= calcSE(calispell_temp))

## Notice how this gets our data into great shape for plotting. Just for fun, let's plot mean temp by month and include se
ggplot(wtemp_calispell_summary, aes(x=month, y=avg_temp_calispell)) +
  geom_bar(stat="identity", fill="grey") + 
  geom_errorbar(aes(ymax = avg_temp_calispell + se_temp_calispell, 
                    ymin = avg_temp_calispell - se_temp_calispell), width=.1) + 
  xlab("Month") + ylab("Mean temperature at Calispell Creek (degrees C)") + 
  facet_wrap(~year) 


## One last note on group_by: If you group a dataframe table and then create a new variable with mutate, the value for that variable 
## will be repeated for each member of the group. For example:
mutate(wtemp_by_monthyear, avg_temp_calispell=mean(calispell_temp, na.rm=TRUE))

## QUESTION: Can you think of a scenario in which this is what would want to do?


#############################################
## 7) dplyr tool number 7: %>% (the pipeline)
#############################################

## It took us a lot of steps to get from the raw data to that graph!
## We had to: 
## 0) turn the dataframe into a dataframe table
## 1) select the date, time and Calispell temperature variable
## 2) filter out the missing values from the temperature variable
## 3) arrange by temperature (well, we didn't haaave to, but it was nice)
## 4) mutate a whole lot! we created the date2 column (a date-time object) and used it to create a month and a year column
## 5) group_by month and year
## 6) summarize temperature by mean and se
## 7) THEN graph

## This is a "workflow" - and dplyr has a handy tool to make this process clear and easy.
## It is called the "pipeline". Everytime a function is followed by the %>%,  it indicates that more work will be done on the object.
## To illustrate, here is the pipeline to create a graphical object stored as "Calispell_monthlytemp" from the initial wtemp dataframe 

Calispell_monthtemp <- wtemp %>%
  as_tibble() %>%
  select(date, time, calispell_temp) %>%
  filter(!is.na(calispell_temp)) %>%
  arrange(calispell_temp) %>%  
  mutate(date2 = mdy(date), 
         month = month(date2), 
         year = year(date2)) %>%
  group_by(month, year) %>%
  summarize(avg_temp_calispell = mean(calispell_temp),  
            se_temp_calispell = calcSE(calispell_temp)) %>%
  ggplot(aes(x = month, y = avg_temp_calispell)) + 
  geom_bar(stat="identity", fill="grey") + 
  geom_errorbar(aes(ymax = avg_temp_calispell + se_temp_calispell, 
                    ymin = avg_temp_calispell-se_temp_calispell), width=.1) + 
  xlab("Month") + ylab("Mean temperature at Calispell Creek (degrees C)") +
  facet_wrap(~year) 

##  Nice!! Let's look at what we created:
Calispell_monthtemp

## QUESTION: Where is (are) the dataset specified in the pipeline?


################################################################################
#####                            YOUR TURN                              ########
################################################################################

################################################################################
##### 1) SPECIES RICHNESS WITH N-DEPOSITION                                  ###
################################################################################

## Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
## What did Clark and Tilman 2008 find? See text and Figure 1
## Q: What pattern did they observe between species richness and nitrogen treatment?
## Q: What years and treatments did they include in Figure 1?

## WORKFLOW: Mimic Figure 1 (except on the y-axis just plot species richness).
## Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
## With a partner, write out the workflow you will use in English and put up a green sticky when done.
    # What QAQC will you do beforehand? 
    # How will you manipulate the data once you are happy with it?
## After we have discussed as a class, write out and run the workflow in tidyverse R.

## Here's the data import to get you going:
cdrplant <- read.csv("e001_Plant aboveground biomass data.csv", stringsAsFactors = F, skip = 726) %>%
  as.tibble()


################################################################################
##### 2) C:N RATIO WITH N-DEPOSITION                                         ###
################################################################################

## Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
## What did Wedin and Tilman 1996 find? See text and Figure 7

## WORKFLOW: Mimic a panel in Figure 7 for C:N ratio of above ground biomass with nitrogen addition level
## Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?nbe001
## With a partner, write out the workflow you will use in English and put up a green sticky when you are done.
   # What QAQC will you do beforehand? 
   # How will you manipulate the data once you are happy with it?
## After we have discussed as a class, write out and run the workflow in tidyverse R.
## BONUS: Make a panel graph of C:N by nitrogen addition for each species.

## Here's the data import to get you going:
cdrCN <- read.csv("e001_Plant aboveground biomass carbon and nitrogen.csv", stringsAsFactors = F, skip = 491) %>%
  as.tibble()


################################################################################
##### 3) TOTAL BIOMASS WITH OVER TIME AND WITH RICHNESS AND NITROGEN        ###
################################################################################

## Check out  http://www.cedarcreek.umn.edu/research/experiments/e001
## What did Haddad et al. 2002 find? See text and Figure 6
## Q: What pattern did they observe between species richness and nitrogen treatment?
## Q: What years and treatments did they include in Figure 1?

## WORKFLOW A: Mimic Figure 6a 
## Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
## With a partner, write out the workflow you will use in English and put up a green sticky when done.
# What QAQC will you do beforehand? 
# How will you manipulate the data once you are happy with it?
## After we have discussed as a class, write out and run the workflow in tidyverse R.


## WORKFLOW B: How do you hypothesize that biomass will change with nitrogen and species richness?
## Metadata here: http://www.cedarcreek.umn.edu/research/data/dataset?ple001
## With a partner, write out the workflow you will use in English and put up a green sticky when done.
# What QAQC will you do beforehand? 
# How will you manipulate the data once you are happy with it?
## After we have discussed as a class, write out and run the workflow in tidyverse R.

