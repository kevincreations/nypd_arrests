# nypd_arrests
This project investigates arrest data in NYC during the first quarter of 2026 (January–March).

## Project Background
The purpose of this project is to investigate the NYPD arrest data throughout NYC which includes all five boroughs: Manhattan, Queens, The Bronx, Brooklyn, and Staten Island. Each row in the dataset contains an arrest by the NYPD and includes information about the type of crime, the date and coordinates of enforcement, and demographics related to the suspect. This project stood out because the dataset contained a wider variety of qualitative data, making the analysis more unique. Data is extracted form the NYC open data. 

## Data Cleaning 
The dataset required significant amount of preparation before analysis. It contained a variety of NULL values, inconsistencies, and unknown entries. Many column names and values were warranted for further research for better understanding. The lvl_of_offense column contained a value of 9 that could not be identified after further research. Since it still represented an arrest without a known offense classification, the value was categorized as 'Unknown' alongside other null entries.  
- Column names were standardized for clarity.
- Manipulated data with CASE statements to standardize categorical values, replace abbreviations with descriptive labels, and handle missing data (NULL and '(null)' values).
- Dates were standardized.
## Borough Arrest Distribution Dashboard
<img width="550" height="490" alt="Screenshot 2026-05-28 at 1 33 46 PM" src="https://github.com/user-attachments/assets/a64e3d3b-3e60-4bdf-8db5-a6619c132af3" />

This Tableau dashboard analyzes arrest distribution across NYC boroughs and offense severity levels. The visualizations compare total arrest counts by borough while also breaking down arrests into felony, misdemeanor, violation, infraction, and unknown offense classifications. The 'Unknown' means there was no level of offense included in the dataset. 
## Key Takeaways
- Brookyln drives the arrest count citywide
- Misdemeanor charges drives the amount of arrests in each borough followed by felonies
- Arrest patterns remain consistent across all five boroughs
- Unknown offense classifications is very minimum meaning most arrests were categorized at the time of arrest
## Age Distribution Dashboard
<img width="550" height="490" alt="Screenshot 2026-05-28 at 12 40 24 PM" src="https://github.com/user-attachments/assets/a62e533d-3694-4665-bfae-8f0ab7992f8a" />

In this dashboard, age groups are visualized in the pie chart and bar charts. The pie chart displays the distribution of total arrests across different age groups. The Unknown means an age group wasn't reported during the time of the arrest, which accounts for a good portion of all arrests. The bar charts display arrest totals for each age group across the different boroughs.

## Key Takeaways
- Arrest totals increase across age groups up to the 25–44 demographic, where arrest activity reaches its peak
- In every borough, arrest activity is heavily concentrated among adults between 25 and 44 years old
- After the 25 - 44 age group, arrest totals decline with increasing age 
- Brooklyn consistently records the highest arrest totals across all age demographics

## Level of Offense Dashboard
<img width="550" height="490" alt="Screenshot 2026-05-28 at 1 51 47 PM" src="https://github.com/user-attachments/assets/4b127278-4b87-46cf-a682-261511ee8432" />

This dashboard provides a month-by-month view of citywide arrests by offense level. The top graph displays higher-level offenses such as felonies and misdemeanors, while the bottom graph highlights lower-level offenses including violations, infractions, and arrests with unknown offense classifications. The dashboard uses two separate charts to improve readability, as the larger y-axis scale of felony and misdemeanor arrests made trends in the smaller categories difficult to distinguish.

## Key Takeaways
- Violation arrests showed a steady decline month over month
- Arrest totals for both felonies and misdemeanors declined in February before increasing again in March
- The contrast in scale between major and minor offense categories highlights how heavily citywide arrests are concentrated within felony and misdemeanor classifications
