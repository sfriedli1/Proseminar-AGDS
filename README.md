# Proseminar-AGDS

In this repository I will store all the relevant code, data and the report for the Proseminar AGDS

## Project Proposal

### 1. Topic Summary

The object of this project is to investigate how land cover (rural vs. non-rural) modulates the diurnal temperature range (DTR) in Switzerland’s Swiss Plateau (Mittelland). Using Meteo Swiss stationary temperature data and measurements of the University of Bern in the City of Bern and potentially combining it with satellite data for land-cover classifications and vegetation indices, I will quantify the difference in DTR by land-cover class and variability in NDVI and assess the importance of terrain and surface properties for explaining DTR. In the end I want to tell a story with the data using informative graphics and provide policy-relevant insights.

### 2. Background and motivation

Urbanization and vegetation change modify surface climate via albedo, evapotranspiration and heat storage, potentially affecting DTR. Prior studies by Scheitlin and Dixon as well as by Gogi et. al. have reported clear land-cover dependencies of DTR and surface temperature over North America and India respectively. However, Central Europe and particularly Switzerland’s Swiss Plateau remains unexplored. Given the high-quality national meteorological data and detailed land-cover products available, Switzerland is ideal to: (i) test whether DTR diverge between rural and non-rural areas and (ii) evaluate if the NDVI can at least partly explain DTR variability. Results could be beneficial for future land-management strategies.

### 3. Objective

Primary objective is to quantify how DTR is different in rural vs. non-rural areas in the Swiss Plateau. As well as to identify potential further drivers of spatial/temporal variability of DTR. Key questions:

1.  How does DTR differ between rural and non-rural areas also in dependence on the NDVI?

2.  Are there other variables that contribute to DTR variance and what is there relevance compared to land-cover classification?

### 4. Implementation

*Data:*\
- Meteo Swiss Station Data, ideally stations that measure radiation as well.\
Data availability: Automated measurements since 1981\
- Station Data from Bern by University of Bern\
Data availability: 2018-2022 from Mai to September\
- Land-cover: Arealstatistik/NOLC or swissTLM3D/TLMRegio\
Data availability: NOLC for 2004/2009; TLMRegio from 2020-2024 (I found information on swisstopo website, that it exists since 2003 but I could only find downloadable file for 2020-2024)\
- Vegetation: MODISTools and/or Landsat\
Data availability: MODISTools from 2000-2025; Landsat from 1972-2025 (spread over multiple missions)\
- Control variables: DEM (swissALTI3D) to derive elevation and aspect\
Data availability: Updated every 6 years split up into 3 regions

*Pre-processing:*\
- Project all layers to LV95\
- Define a working grid and timespan to have comparable data sets\
- Categorize each Station (rural vs. non-rural)

*Methods:*\
To analyze the effect of the land-cover type on the DTR I want to calculate the DTR for each station. For further investigation I will analyse the results for this calculations, to determine if all the stations per category show similar patterns. Then I want to aggregate for each category and calculate the average DTR over all the stations for each day. For further investigation I want to split it up for each month to be able to analyze if the land cover class has a different influence depending on the month. With the help of ModisTools and the coordinates of the stations determine if the NDVI also has an influence on the DTR. In the end I would like to visualize the difference in DTR in rural vs. non-rural areas.

### 5. Responsibilities and timeline

Week 0: Finalize study design; set up repo; acquire relevant data sets\
Week 1: Full data ingestion & preprocessing\
Week 2-3: Data analysis focusing on rural data and DTR\
Week 3-4: Data analysis focusing on non-rural data and DTR\
Week 5: Focus on the differences between rural and non-rural areas\
Week 6: Refine graphics and Refactor Report\
Week 7: Polish report + final reproducibility test

### 6. Risks and contingency

One challenge will be to accuratly determine whether a station of Meteo Swiss is in a non-rural area and therefore useful for my analysis. Because certain stations, like the station in Lucerne, are in rural area, but in a park. In addition it will be a challenge that the stations in Bern only provide data from May to September. So the difference in DTR can only be determined for end of spring until the beginning of autumn. Visualizing the differences in DTR geographically could also become a defiance. But I think one option would be to integrate a map, for example Google Earth, to support geographical visualization.

### 7. Demonstration of Data

In the vignettes folder in the Test_Data.Rmd file I implemented a comparison of the DTR for rural vs. non-rural areas for one week in June. At the end I plotted a simple line diagram to visualize the difference in DTR for rural and non-rural areas.

### 8. Literature

Scheitlin and Dixon(2010) : Diurnal Temperature Range Variability due to Land Cover and Airmass Types in the Southeast\
Gogoi et. al.(2019) : Land use and land cover change effect on surface temperature over Eastern India
