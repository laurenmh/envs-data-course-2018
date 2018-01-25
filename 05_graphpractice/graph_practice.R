################################################################################
### ENVS 410/510                                                             ###
### Visualization: Practice with graphs                                      ### 
################################################################################

## Goals: To become practice determining what graphic to use for the data
## To practice reading about data 
## To practice implementing graphics in R

## Load in ggplot2 and other useful packages
library(tidyverse)


################################################################################
### 1: CO2 TRENDS                                                    ###
################################################################################

## First we'll read in the data and get it ready to use
## You can find the data and read more about it here: https://climate.nasa.gov/vital-signs/carbon-dioxide/
## In particular, the metadata is at the top of the txt file  if you click on the Download Data button

## Let's import the data directly from the web
## This requires the package data.table
## It may not be on your computer, in which case install it
## And if installation takes too long, either download from NASA or from Canvas
install.packages("data.table")
library(data.table)

## Let's skip down to the data, which starts at line 61
CO2data <- fread('ftp://aftp.cmdl.noaa.gov/products/trends/co2/co2_mm_mlo.txt', skip = 60)

## If installing data.table takes too long, load from the .csv file from Canvas
CO2data <- read.table("NOAA_ESRL_CO2data.txt", skip = 72)

## give descriptive but short names
names(CO2data) <- c("year", "month", "decimalDate", "averageCO2", "interpolatedCO2", "trendCO2", "numberDays")


#########################
## Read about the data ##
#########################
## Why are there three different columns for CO2? 
## Where do the data come from?
## What does numberDays refer to? 
## What does -99.99 in the average column and -1 in the number of days column mean?



########################
## Visualize the data ##
########################
## How do atmospheric CO2 concentrations change over the time series?
## What category of graph will you use?
## What statistical transformation will you use?
## Does the underlying data differ if you use the interpolated or trend columns? 
## Does the statistical transformation differ if you use the interpolated or trend columns?



########################
## Visualize the data ##
########################
## Which months are the CO2 values at the maximum? Minimum? Why is this?
## What category of graph will you use?
## What statistical transformation will you use? 



################################################################################
### 2: TEMPERATURE TRENDS                                                    ###
################################################################################

## First we'll read in the data and get it ready to use
## You can find the data and read about it here: https://climate.nasa.gov/vital-signs/global-temperature/

tempdata <- fread('http://climate.nasa.gov/system/internal_resources/details/original/647_Global_Temperature_Data_File.txt')

## If installing data.table takes too long, load from the .csv file from Canvas
tempdata <- read.table("NASA_temperature.txt")

#########################
## Read about the data ##
#########################
## What information is in each of the three columns?
## Where do the data come from?
## Using the names() function to give tempdata descriptive column headings



########################
## Visualize the data ##
########################
## Recreate the graph on the website using all three columns
## Recreate the graph on the website using two columns and a statistical transformation



################################################################################
### 3: INVASIVE SPECIES MANAGEMENT                                           ###
################################################################################

## Bommer Canyon is a Nature Conservancy reserve near Irvine, CA managed by the Irvine Ranch Conservancy
## The Conservancy is concerned about the invasion of exotic species and loss of native species at my site
## They worked with my colleagues to assess potential management practices to increase natives and decrease exotics

## Planting native tarweed was planted in with the aim that it could outcompete exotic plants
## Adding mulch was done with the aim of reducing nitrogen availability to favor native plants

## Read in the data
tnc_data <- read.csv("TNC_BommerCanyon_data.csv")

## Have a look at the columns and structure of the data


########################
## Visualize the data ##
########################
## How does native cover change with exotic cover? 
## How about richness? 
## What category of graph will you use?
## What statistical transformation will you use? 



########################
## Visualize the data ##
########################
## How do native cover and richness change with the treatments? 
## What category of graph will you use?
## What statistical transformation will you use? 





################################################################################
### 4: SMALL MAMMAL POPULATIONS                                              ###
################################################################################

## First we'll read in the data and get it ready to use
## You can find the data and read about it here: https://github.com/weecology/PortalData
## And we'll be using the teaching dataset from here: https://figshare.com/articles/Portal_Project_Teaching_Database/1314459
## Please download the teaching dataset and set your working directory to the Portal data folder
## How were these data collected? 
## Have a look at the columns and structure of the data

## Read in the species key
portalspecies <- read.csv("species.csv", na.strings = "NA") %>%
  tbl_df()

########################
## Visualize the data ##
########################
## Make a graph that summarize the number of species within each taxa


########################
## Visualize the data ##
########################
portaldata <- read.csv("combined.csv", na.strings = "NA") %>%
  tbl_df()

## Visualize composition as the number of individuals within each genus and plot_type
## Are the kangaroo rat exclosures effective?

## Relate weight and hindfoot length
## Include in this visual any other factors that might affect the relationship






