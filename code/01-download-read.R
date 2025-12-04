##############################################################################
# 01-download-read.R
# Purpose: Download BRFSS Nutrition/Obesity dataset via API and save
  # a clean copy for future rproducible analysis
##############################################################################

# Load required packages

# Only install once; comment out after initial run
# install.packages("remotes")
# remotes::install_github("Chicago/RSocrata")
library(RSocrata)  # For pulling via API
library(tidyverse) # For data manipulation
library(here)      #  For consistent project paths

# Defining file paths
  # Ensures folder exists relative to your current working director

  # Paths relative to project root
data_raw_path <- "C:/Users/Administrator/Desktop/brfss_raw.csv"
 # data_clean_path <- here("data/clean/brfss_clean.csv")

  # Ensure directories exist
if(!dir.exists("data/raw")) dir.create("data/raw", recursive = TRUE) 
if(!dir.exists("data/clean")) dir.create("data/clean", recursive = TRUE)

# Pulling dataset from CDC API
  # Note: $Limit should be set to the number of rows you want
  # The full dataset may need to be pulled in chunks for larger datasets
url <- "https://data.cdc.gov/resource/hn4x-zwk7.csv?$limit=106260"

# Download data
brfss_data <- read.socrata(url)

# Quick data inspection
glimpse(brfss_data)  # Check structure and types
summary(brfss_data)  # Basic summary of variables
dim(brfss_data)      # Number of rows and columns

# Save a raw copy of the dataset
  # This preserves an immutable raw dataset for reproducibility
write.csv(brfss_data, "C:/Users/Administrator/Desktop/brfss_raw.csv", row.names = FALSE)

