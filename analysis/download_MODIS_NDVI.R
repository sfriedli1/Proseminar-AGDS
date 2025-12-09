library(MODISTools)
library(dplyr)
library(here)
library(readr)

# 1) Table with the coordinates for each station
stations <- tibble::tribble(
  ~site_name, ~lat, ~lon,
  "KOP", 47.11885, 7.605503,
  "AIG", 46.326647, 6.924472,
  "GVE", 46.247519, 6.127742,
  "CGI", 46.401053, 6.227722,
  "SIO", 46.21865, 7.330203,
  "STG", 47.425475, 9.398528,
  "PAY", 46.811581, 6.942469,
  "LUZ", 47.036439, 8.301022,
  "HLL", 47.697278, 8.470464,
  "EBK", 47.273389, 9.108494,
  "REH", 47.427694, 8.517953,
  "TAE", 47.479892, 8.904928,
  "SHA", 47.689842, 8.620142,
  "WAE", 47.220958, 8.677706,
  "GUT", 47.601733, 9.279428
)

# 2) Function for extracting the data for each station
download_one_station <- function(site, lat, lon,
                                 start = "2001-01-01",
                                 end   = "2024-12-31") {
  message("=== Station ", site, " (", start, " - ", end, ") ===")
  
  # create file
  out_file <- here::here(
    "data_raw",
    paste0("MOD13Q1_NDVI_", site, "_", start, "_", end, ".csv")
  )
  
  # skip if file already existsts
  if (file.exists(out_file)) {
    message("   -> File exists already ", out_file)
    return(invisible(NULL))
  }
  
  # Try download for the station
  res <- try(
    mt_subset(
      product = "MOD13Q1",
      band    = "250m_16_days_NDVI",
      lat     = lat,
      lon     = lon,
      start   = start,
      end     = end,
      km_lr   = 1,
      km_ab   = 1,
      site_name = site,
      internal  = TRUE,   # return data frame
      progress  = TRUE
    ),
    silent = TRUE
  )
  
  # Error handling
  if (inherits(res, "try-error") || is.null(res) || nrow(res) == 0) {
    message("Error or empty result at ", site)
    return(invisible(NULL))
  }
  
  # save CSV
  write_csv(res, out_file)
  message("saved: ", out_file)
  
  # little break to relax server
  Sys.sleep(1)
  
  invisible(NULL)
}

# 3) Loop over all stations
for (i in seq_len(nrow(stations))) {
  download_one_station(
    site = stations$site_name[i],
    lat  = stations$lat[i],
    lon  = stations$lon[i],
    start = "2001-01-01",
    end   = "2024-12-31"
  )
}


