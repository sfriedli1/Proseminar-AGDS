library(httr)
library(jsonlite)
library(readr)
library(dplyr)
library(ggplot2)

df <- read_delim(
  "https://data.geo.admin.ch/ch.meteoschweiz.ogd-smn/hai/ogd-smn_hai_m.csv",
  delim = ";"
  )

visdat::vis_miss(df)

df <- df |> 
  mutate(reference_timestamp = lubridate::dmy_hm(reference_timestamp)) |> 
  rename(date = reference_timestamp)

df |> 
  ggplot(aes(date, tre200m0)) +
  geom_line()
