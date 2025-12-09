# Proseminar-AGDS

In this repository I will store all the relevant code, data and the report for the Proseminar AGDS

## Project Proposal

### 1. Topic Summary

The object of this project is to investigate how the diurnal temperature range (DTR) has evolved at selected stations on the Swiss Plateau (Mittelland) between 1981 and 2024, and to what extent differences in surrounding vegetation can help explain this evolution. Using daily temperature data from 15 stations of the Meteo Swiss automatic network and satellite-derived vegetation indices (NDVI and if necessary EVI) from MODIS, I will quantify long-term DTR trends and assess whether these trends are related to the vegetation in a 500m radius around the stations. The overarching aim is to tell a coherent story with informative graphics and to derive insights that are relevant for understanding how land surface may modulate local climate.

### 2. Background and motivation

Urbanization, land-use and vegetation dynamics modify surface energy balance via albedo, evapotranspiration and heat storage, potentially affecting DTR. Prior studies (e.g. Scheitlin and Dixon; Gogi et. al.) have reported clear land-cover dependencies of DTR and surface temperature over North America and India respectively. However, Central Europe and particularly Switzerland’s Swiss Plateau remains less explored regarding long-term DTR evolution and its link to land-cover and vegetation dynamics. Given the high-quality national meteorological data and well-established satalite products for vegetation (e.g MODIS NDVI), Switzerland is ideal to: (i) quantify multi-decadal DTR trends and (ii) examine whether the vegetation surrounding a station is linked to different DTR trends. Such insight may help to better understand the role of vegetation buffering or amplifying local climate signals and could be relevant for future land-management and adaptation strategies.

### 3. Objective

Primary objective is to quantify how diurnal temperature range has changed between 1981 and 2024 at 15 selected weather stations from Meteo Swiss on the Swiss Plateau and to evaluate whether these change are related to vegetation conditions in the immediate surroundings of the stations.

**Key questions:**

1.  Have DTR values increased, decreased or remained stable over the period 1981-2024?

2.  Can differences in DTR trends between stations be linked to differences in vegetation, as measured by NDVI within a radius of 500m around each station?

### 4. Implementation

*Data:*\
- Meteo Swiss Station Data, ideally stations that measure radiation as well.\
Data availability: Automated measurements since 1981\
Instruction to download the raw data used in this analysis, see "8. Download the raw data" in this README.\
- Vegetation: MODISTools and/or Landsat\
Data availability: MODISTools from 2000-2025; Landsat from 1972-2025 (spread over multiple missions)

*Pre-processing:*\
- Ensure that all spatial data sets use the coordinate system LV95\
- Select 15 stations with as long and as continuous daily Tmin and Tmax records from 1981-2024.\
- Compute DTR for each station and day.

*Methods:*\
Derive annual and seasonal mean DTR time series for each station. Then analyse the long-term trends using simple statistical models and if appropriate, non-parametric trend tests (e.g. Mann-Kendall) to test for significance. After that visualize these trends. For each station calculate seasonal mean NDVI within 500m buffer and characterize them. Link DTR trends to vegetation by relating DTR metrics to vegetation metrics across stations. Use a correlation and regression analyses to assess whether stations with similar NDVI (e.g. make intervals of NDVI and assign the stations to an interval). Visualize these relationships with graphics and suitable maps.

### 5. Responsibilities and timeline

Week 0: Finalize study design; set up repo; acquire relevant data sets\
Week 1: Full data ingestion & preprocessing\
Week 2-3: DTR analysis and trend estimation for all stations\
Week 3-4: Download and process MODIS NDVI data; extract vegetation indices for 500m buffers around stations\
Week 5: Joint analysis of DTR vs. NDVI; exploration of relationships and development of key figures\
Week 6: Refine graphics and Refactor Report\
Week 7: Polish report + final reproducibility test

### 6. Risks and contingency

One challenge is the limited temporal coverage of MODIS vegetation products, because they typically start around the year 2000. Another challenge concerns the spatial resolution and data quality of MODIS. The 500m buffer around each station will likely cover only few pixels and cloud cover or data gaps could effect certain years (especially during winter months).

### 7. Demonstration of Data

In the vignettes folder in the Test_Data.Rmd file I implemented a comparison of the DTR for rural vs. non-rural areas for one week in June. At the end I plotted a simple line diagram to visualize the difference in DTR for rural and non-rural areas.

### 8. Download the raw data

The raw data can be downloaded by running the "download_data_temp_meteoschweiz.R" script in the analysis folder. Before running the script you will have to create a folder data_raw. The script then downloads the daily temperature data for the 15 selected stations (covering 1981-2024, where available). To find detailed information on the data and the stations from Meteo Swiss please refer to ogd-smn_meta_parameters.csv and ogd-smn_meta_stations.csv\
The MODIS data for NDVI can be downloaded with the script download_MODIS_NDVI.R from the analysis folder.

### 9. Literature

Scheitlin and Dixon(2010) : Diurnal Temperature Range Variability due to Land Cover and Airmass Types in the Southeast\
Gogoi et. al.(2019) : Land use and land cover change effect on surface temperature over Eastern India
