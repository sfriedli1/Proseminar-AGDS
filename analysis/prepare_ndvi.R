library(dplyr)
library(readr)
library(here)

# Define folder
in_dir  <- here("data_raw")
out_dir <- here("data")

# List with all MODIS data in data_raw folder
files <- list.files(
  path       = in_dir,
  pattern    = "^MOD13Q1_NDVI_.*\\.csv$",
  full.names = TRUE
)

for (f in files) {
  
  ndvi_raw <- read_csv(f, show_col_types = FALSE)
  
  ndvi_center <- ndvi_raw |>
    filter(pixel == 41) |>
    select(scale, site, calendar_date, pixel, value)
  
  # In case the file is empty
  if (nrow(ndvi_center) == 0L) {
    message("  -> no row with pixel = 41")
    next
  }
  
  # Extract station name
  site_name <- ndvi_center$site[1]
  
  # Create file
  out_file <- file.path(
    out_dir,
    paste0("NDVI_", site_name, "_2001-01-01_2024-12-31.csv")
  )
  
  write_csv(ndvi_center, out_file)
  message("  -> saved: ", out_file)
}