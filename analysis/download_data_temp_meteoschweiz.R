library(purrr)

# List of the links to download the daily data from every station
station_urls <- c(
  Koppigen      = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/kop/ogd-smn_kop_d_historical.csv",
  Aigle         = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/aig/ogd-smn_aig_d_historical.csv",
  Genf          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/gve/ogd-smn_gve_d_historical.csv",
  Nyon          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/cgi/ogd-smn_cgi_d_historical.csv",
  Sion          = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/sio/ogd-smn_sio_d_historical.csv",
  St.Gallen     = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/stg/ogd-smn_stg_d_historical.csv",
  Payerne       = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/pay/ogd-smn_pay_d_historical.csv",
  Luzern        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/luz/ogd-smn_luz_d_historical.csv",
  Hallau        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/hll/ogd-smn_hll_d_historical.csv",
  Ebnat_Kappel  = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/ebk/ogd-smn_ebk_d_historical.csv",
  Affoltern     = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/reh/ogd-smn_reh_d_historical.csv",
  Aadorf        = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/tae/ogd-smn_tae_d_historical.csv",
  Schaffhausen  = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/sha/ogd-smn_sha_d_historical.csv",
  Waedenswil    = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/wae/ogd-smn_wae_d_historical.csv",
  Guettingen    = "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/gut/ogd-smn_gut_d_historical.csv"
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






