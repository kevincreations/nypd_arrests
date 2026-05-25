# nypd_arrests
This project investigates arrest data in NYC during the first quarter of 2026 (January–March).

## Project Background
The purpose of this project is to investigate the NYPD arrest data throughout NYC which includes all five boroughs: Manhattan, Queens, The Bronx, Brooklyn, and Staten Island. Each row in the dataset contains an arrest by the NYPD and includes information about the type of crime, the date and coordinates of enforcement, and demographics related to the suspect. This project stood out because the dataset contained a wider variety of qualitative data, making the analysis more unique. Data is extracted form the NYC open data. 

## Data Cleaning 
The dataset required significant amount of preparation before analysis. It contained a variety of NULL values, inconsistencies, and unknown entries. Many column names and values were warranted for further research for better understanding. The lvl_of_offense column contained a value of 9 that could not be identified after further research. Since it still represented an arrest without a known offense classification, the value was categorized as 'Unknown' alongside other null entries.  
- Column names were standardized for clarity.
- Manipulated data with CASE statements to standardize categorical values, replace abbreviations with descriptive labels, and handle missing data (NULL and '(null)' values).
- Dates were standardized.
