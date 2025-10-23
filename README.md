# Proseminar-AGDS

In this repository I will store all the relevant code, data and the report for the Proseminar AGDS

## Project Proposal

### 1. Topic Summary

The object of this project is to investigate how land cover modulates recent temperature changes and the diurnal temperature range (DTR) in Switzerland’s Swiss Plateau (Mittelland) over the last 20-25 years. Using Meteo Swiss stationary temperature data combined with satellite data for land-cover classifications and vegetation indices, I will quantify trends in mean temperature and especially DTR by land-cover class and variability in NDVI and assess the importance of terrain and surface properties for explaining DTR. In the end I want to tell a story with the data using informative graphics and provide policy-relevant insights.

### 2. Background and motivation

Urbanization and vegetation change modify surface climate via albedo, evapotranspiration and heat storage, potentially affecting both long-term warming rates and DTR. Prior studies by Scheitlin and Dixon as well as by Gogi et. al. have reported clear land-cover dependencies of DTR and surface temperature over North America and India respectively. However, Central Europe and particularly Switzerland’s Swiss Plateau remains unexplored. Given the high-quality national meteorological data and detailed land-cover products available, Switzerland is ideal to: (i) test whether warming and DTR trends diverge across different types of land-cover and (ii) evaluate if the NDVI can at least partly explain DTR variability. Results could be beneficial for future land-management strategies.

### 3. Objective

Primary objective is to quantify how (a) warming trends and (b) DTR trends over the last 20-25 years differ by land-cover class in the Swiss Plateau. As well as to identify potential further drivers of spatial/temporal variability of DTR. Key questions:

1.  How do mean warming trends and DTR trends differ among different land-cover classifications and depending on the NDVI?

2.  Are there other variables that contribute to DTR variance and what is there relevance compared to land-cover classification?

### 4. Implementation

*Data:*\
- Meteo Swiss Station Data, ideally stations that measure radiation as well.\
Data availability: Automated measurements since 1981\
- Land-cover: Arealstatistik/NOLC or swissTLM3D/TLMRegio\
Data availability: NOLC for 2004/2009; TLMRegio from 2020-2024 (I found information on swisstopo website, that it exists since 2003 but I could only find downloadable file for 2020-2024)\
- Vegetation: MODISTools and/or Landsat\
Data availability: MODISTools from 2000-2025; Landsat from 1972-2025 (spread over multiple missions)\
- Control variables: DEM (swissALTI3D) to derive elevation and aspect\
Data availability: Updated every 6 years split up into 3 regions

*Pre-processing:*\
- Project all layers to LV95\
- Define a working grid to have comparable data sets\
- Mask persistent snow/ice and lakes for DTR analyses

*Methods:*\
To analyze the effect of the land-cover type on the DTR I want to use a robust trend test per class. For this I will calculate the zen-slope (°C/decade) for each cell. With the help of the Mann-Kendall-p-value you can test if a trend is significant. After calculating the zen-slope for each cell I would want to plot this on a map to visualize the spatial distribution of DTR in dependence of the land-cover. To analyze the effect of the NDVI I will firstly estimate how “extra greenness” affects the diurnal temperature range (DTR) separately for each land-cover type. After removing the normal seasonal cycle, model DTR anomalies as a smooth function of NDVI anomalies with a class-specific curve. This reveals whether an unusual increase in greenness reduces or amplifies DTR and how the magnitude and shape of the effect differ across land-covers. In addition, to test whether long-term warming and DTR trends depend on typical greenness, we group grid cells by their mean summer NDVI into quantiles. For each group we compute robust trend estimates (Sen slope + Mann–Kendall test). Comparing trend slopes across NDVI groups shows if greener places warm differently or exhibit distinct DTR trends than less green places, providing an intuitive, scale-robust check on vegetation’s moderating role. These results I would like to display with graphics again. To evaluate which other values influence the DTR I would like to find out which other variables correlate using an KNN-Algorithm. Variables I would like to consider are for example season and present air mass (high/low pressure systems).

### 5. Responsibilities and timeline

Week 0: Finalize study design; set up repo; acquire relevant data sets\
Week 1: Full data ingestion & preprocessing\
Week 2-3: Data analysis focusing on land-cover and DTR\
Week 3-4: Data analysis focusing on NDVI and DTR\
Week 5: Focus on influence of additional/control variables on DTR\
Week 6: Refine graphics and Refactor Report\
Week 7: Polish report + final reproducibility test

### 6. Risks and contingency

One challenge will be the mismatch in spatial resolution of the used products. To address this I will try to find data with as similar of a spatial resolution as possible and then resample all of the data to the lowest spatial resolution. Another challenge considering the calculation of the NDVI is cloud contamination, especially for the autumn and winter months, because the Swiss Plateau is often covered with fog during this time period and the satellite recordings are only every 16 days for Landsat. To address this problem it is important to carefully filter the Landsat data prior to the land-cover classification. Finding station data for meteorological variables in a forest is might be tricky as well, because measurement stations are usually on open areas. Last but not least identifying other potential variables the influence DTR is probably going to be difficult. That is why I will need to read further literature on this topic to get a better understanding of the variables that influence DTR according to existing research.

### 7. Literature

Scheitlin and Dixon(2010) : Diurnal Temperature Range Variability due to Land Cover and Airmass Types in the Southeast\
Gogoi et. al.(2019) : Land use and land cover change effect on surface temperature over Eastern India
