# nypd_arrests
This project investigates arrest data in NYC during the first quarter of 2026 (January–March). Data is extracted from the NYC open data.

## Project Background
The purpose of this project is to investigate the NYPD arrest data throughout NYC which includes all five boroughs: Manhattan, Queens, The Bronx, Brooklyn, and Staten Island. Each row in the dataset contains an arrest by the NYPD and includes information about the type of crime, the date and coordinates of enforcement, and demographics related to the suspect. The analysis is based on all arrests recorded across NYC during the first quarter of 2026. This project stood out because the dataset contained a wider variety of qualitative data, making the analysis more unique. 

## Data Cleaning 
The dataset required significant amount of preparation before analysis. It contained a variety of NULL values, inconsistencies, and unknown entries. Many column names and values were warranted for further research for better understanding. The lvl_of_offense column contained a value of 9 that could not be identified after further research. Since it still represented an arrest without a known offense classification, the value was categorized as 'Unknown' alongside other null entries.  
- Column names were standardized for clarity.
- Manipulated data with CASE statements to standardize categorical values, replace abbreviations with descriptive labels, and handle missing data (NULL and '(null)' values).
- Dates were standardized.
## Borough Arrests and Offense Distribution
<img width="550" height="510" alt="Screenshot 2026-05-29 at 11 41 02 AM" src="https://github.com/user-attachments/assets/6927347c-0474-4072-b526-9b1f49ceb06a" />

This dashboard investigates NYC arrest patterns by comparing total arrests across boroughs, analyzing offense classifications within each borough, and investigating further into the most common misdemeanor charges after identifying misdemeanors as the city's dominant offense category. The top left chart organizes arrests by offense classification, including felonies, misdemeanors, violations, infractions, and unknown offenses. Arrests with missing level of offense data were grouped into the "Unknown" category to ensure they remained represented in the analysis. Unknown offense classifications is very minimum meaning most arrests were categorized at the time of arrest

## Key Takeaways
- Arrest patterns remain consistent across all five boroughs
- Brookyln drives the arrest count citywide
- Misdemeanor charges drives the amount of arrests in each borough followed by felonies
- Assault in the Third Degree ranks as the leading misdemeanor charge in NYC followed closely by larceny 

## Age Distribution Dashboard
<img width="550" height="510" alt="Screenshot 2026-05-28 at 12 40 24 PM" src="https://github.com/user-attachments/assets/a62e533d-3694-4665-bfae-8f0ab7992f8a" />

In this dashboard, age groups are visualized in the pie chart and bar charts. The pie chart displays the distribution of total arrests across different age groups. The Unknown means an age group wasn't reported during the time of the arrest, which accounts for a good portion of all arrests. The bar charts display arrest totals for each age group across the different boroughs.

## Key Takeaways
- Arrest totals increase across age groups up to the 25–44 demographic, where arrest activity reaches its peak
- In every borough, arrest activity is heavily concentrated among adults between 25 and 44 years old
- After the 25 - 44 age group, arrest totals decline with increasing age 
- Brooklyn consistently records the highest arrest totals across all age demographics

## Level of Offense Dashboard
<img width="550" height="510" alt="Screenshot 2026-05-29 at 10 27 23 AM" src="https://github.com/user-attachments/assets/45a7b515-8bea-4005-9107-344ae4062d34" />


This dashboard provides a month-by-month view of citywide arrests by offense level. The top graph displays higher-level offenses such as felonies and misdemeanors, while the bottom graph highlights lower-level offenses including violations, infractions, and arrests with unknown offense classifications. The dashboard uses two separate charts to improve readability, as the larger y-axis scale of felony and misdemeanor arrests made trends in the smaller categories difficult to distinguish.

## Key Takeaways
- Violation arrests showed a steady decline month over month
- Arrest totals for both felonies and misdemeanors declined in February before increasing again in March
- The contrast in scale between major and minor offense categories highlights how heavily citywide arrests are concentrated within felony and misdemeanor classifications

## Additional Analysis
Several additional analyses were explored during the project, though they were ultimately not visualized.
- Monthly city-wide arrests
- Felonies in each borough
- Monthly murder arrests
