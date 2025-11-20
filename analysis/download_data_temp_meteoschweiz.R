library(purrr)

# List of the links to download the daily data from every station
station_urls <- c(
  Koppigen      = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/kop/ogd-smn_kop_d_historical.csv",
  Guettingen    = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/gut/ogd-smn_gut_d_historical.csv",
  Genf          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/gve/ogd-smn_gve_d_historical.csv",
  Nyon          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/cgi/ogd-smn_cgi_d_historical.csv",
  Sion          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/sio/ogd-smn_sio_d_historical.csv",
  Aquarossa     = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/com/ogd-smn_com_d_historical.csv",
  Mathod        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/mah/ogd-smn_mah_d_historical.csv",
  Luzern        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/luz/ogd-smn_luz_d_historical.csv",
  Giswil        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/gih/ogd-smn_gih_d_historical.csv",
  Ebnat_Kappel  = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/ebk/ogd-smn_ebk_d_historical.csv",
  Biere         = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/bie/ogd-smn_bie_d_historical.csv",
  Cressier      = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/crm/ogd-smn_crm_d_historical.csv",
  Schaffhausen  = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/sha/ogd-smn_sha_d_historical.csv",
  Goesgen       = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/goe/ogd-smn_goe_d_historical.csv",
  Mosen         = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/moa/ogd-smn_moa_d_historical.csv"
)

# Download all the csv-files and save them in the data_raw folder
iwalk(
  station_urls,
  ~ {
    station_name <- .y
    url          <- .x
    
    # Define file name and destination
    destfile <- file.path("data_raw", paste0(station_name, "_daily.csv"))
    
    message("Lade ", station_name, " von ", url)
    download.file(url, destfile = destfile, mode = "wb")
  }
)






