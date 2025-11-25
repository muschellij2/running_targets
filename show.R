# Created by use_targets().
library(targets)
library(tarchetypes) # Load other packages as needed.



tar_visnetwork()
tar_read(data)
data
tar_load(data)
data

my_data = tar_read(md_data)
my_data
# tar_load_everything()
