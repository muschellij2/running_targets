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
  # imports = c("bigrquery"),
  # default is rds, which is OK.  qs is fast.  Auto usually works well
  # likely need to do install.packages("qs2")
  # format = "rds" # Optionally set the default storage format. qs is fast.
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# tar_source("other_functions.R") # Source other scripts as needed.

# Replace the target list below with your own:
list(
  tar_target(
    name = view_name,
    command = "pwn4-m3yp"
  ),
  tar_target(last_updated_date, get_last_updated_date(view_name)),
  tar_target(filename, paste0("data/", view_name, ".csv")),
  tar_target(download_output, {
    if (Sys.Date() < last_updated_date | !file.exists(filename)) {
      print("DOWNLOADING Data")
      print(filename)
      download_data_csv(view_name, destfile = filename)
    } else {
      filename
    }
  }),
  tar_target(file, filename, format = "file"),


  tar_target(
    data,
    {
      data = read_csv(file)
      stop_for_problems(data)
      # remove this line and see what data is (e.g. returned)
      data
    }),
  tar_targets()




)
