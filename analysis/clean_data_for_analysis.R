library(dplyr)
library(lubridate)

# Load all files in from data_raw folder
raw_files <- list.files("data_raw", pattern = "\\.csv$", full.names = TRUE)

# Helpfunction to select the reference_time, the daily max and daily min between 1981 to 2024
process_file <- function(path_in) {
  df <- read_delim(path_in, delim = ";", show_col_types = FALSE)
  
  # Transform date column to actual data format
  df <- df |>
    mutate(reference_timestamp = dmy_hm(reference_timestamp)) |>
    rename(datetime = reference_timestamp) |>
    mutate(date = as.Date(datetime)) |>
    filter(
      between(date, as.Date("1981-01-01"), as.Date("2024-12-31"))
    ) |>
    select(date, tre200dn, tre200dx)
  
  df
}

# Go through all the files and save them as a csv file in the data folder
walk(
  raw_files,
  ~ {
    path_in  <- .x
    df_out   <- process_file(path_in)
    
    # Read in the file names
    base_name <- basename(path_in)  
    
    # Define the file name of the new file
    out_name  <- sub("_daily\\.csv$", "_1981-2024_dtr.csv", base_name)
    path_out  <- file.path("data", out_name)
    
    message("Speichere ", path_out)
    write_csv(df_out, path_out)
  }
)


