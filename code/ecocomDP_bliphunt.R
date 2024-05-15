library(ecocomDP)
library(tidyverse)

searchresult <- ecocomDP::search_data(text = "plant")

# Get the first dataset in the search result
ds_i <- read_data(
  id = searchresult$id[7],
  #site = c('100', '110'), # sampling sites
  #startdate = "2017-01", # start year-month
  #enddate = "2019-12", # end year-month
  #token = Sys.getenv("NEON_TOKEN"),
  check.size = FALSE)

#Flatten dataset so we can filter
ds_if <- flatten_data(ds_i)
unique(ds_if$location_id)

# Make a plot of observations by location for the first
# ten sites in the dataset
ds_if %>% #filter(as.numeric(location_id) < 10) %>% 
  plot_sample_space_time(color_var='location_id')

# Make a plot of species richness over time for the first ten sites
# in the dataset
ds_if %>% #filter(as.numeric(location_id) < 10) %>% 
  plot_taxa_diversity(time_window='year', )
