# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed.

# Set target options:
tar_option_set(
  # packages aren't tracked automatically, so list them here, but they
  # are run before each target
  packages = c("tidyverse"), # Packages that your targets need for their tasks.

  # track **all the objects and datasets** from this package as if they were part of the global environment.
  imports = c("bigrquery"),
  # default is rds, which is OK.  qs is fast.  Auto usually works well
  format = "auto", # Optionally set the default storage format. qs is fast.
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  tar_target(
    name = view_name,
    command = "vyfe-wj4k"
  ),
  tar_target(
    name = data,
    command = tibble(x = rnorm(100), y = rnorm(100))
    # format = "qs" # Efficient storage for general data objects.
  ),
  tar_target(
    name = model,
    command = coefficients(lm(y ~ x, data = data))
  )
)
