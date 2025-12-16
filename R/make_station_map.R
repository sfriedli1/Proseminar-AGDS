library(tibble)
library(sf)
library(ggplot2)
library(ggrepel)
library(rnaturalearth)
library(rnaturalearthdata)

# 1) Stations
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

stations_sf <- st_as_sf(stations, coords = c("lon", "lat"), crs = 4326, remove = FALSE)

# 2) Countries basemap (no hires)
europe <- ne_countries(continent = "Europe", returnclass = "sf", scale = "medium")
ch     <- europe[europe$admin == "Switzerland", ]

# 3) Project to LV95 (nice looking, correct distances)
crs_ch <- 2056
europe      <- st_transform(europe, crs_ch)
ch          <- st_transform(ch, crs_ch)
stations_sf <- st_transform(stations_sf, crs_ch)

# 4) Bounding box: Schweiz + Rand (damit nichts abgeschnitten wird)
bbox <- st_bbox(st_buffer(ch, 30000))  # 30 km Rand

# 5) Plot (clean)
p <- ggplot() +
  geom_sf(data = europe, fill = "grey97", color = "grey90", linewidth = 0.2) +
  geom_sf(data = ch,     fill = "grey99", color = "grey30", linewidth = 0.7) +
  geom_sf(data = stations_sf, size = 2.4) +
  geom_text_repel(
    data = stations_sf,
    aes(label = site_name, geometry = geometry),
    stat = "sf_coordinates",
    size = 3.6,
    min.segment.length = 0,
    box.padding = 0.25,
    point.padding = 0.2,
    seed = 1
  ) +
  coord_sf(
    xlim = c(bbox["xmin"], bbox["xmax"]),
    ylim = c(bbox["ymin"], bbox["ymax"]),
    expand = FALSE
  ) +
  theme_void(base_size = 12) +
  theme(
    plot.background  = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    plot.margin      = margin(5, 5, 5, 5)
  )

# 6) Save
dir.create("figures", showWarnings = FALSE, recursive = TRUE)
ggsave("figures/stations_map.png", plot = p, width = 8, height = 6, dpi = 300, bg = "white")

