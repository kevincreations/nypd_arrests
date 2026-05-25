/*creating view of amount of murder arrests in january in each boro*/
CREATE VIEW v_jan_murder_arrests AS			
		SELECT
        boro,
				count(*) AS 'january_murder_arrests'
		FROM
				nypd_arrests
		WHERE
				offense_description LIKE '%MURDER%' AND arrest_date BETWEEN '2026-01-01' AND '2026-01-31' 	
		GROUP BY
				boro;
/*creating view of amount of murder arrests in feb*/
CREATE VIEW v_feb_murder_arrests AS		
		SELECT
				boro,
				count(*) AS 'feb_murder_arrests'
		FROM
				nypd_arrests
		WHERE
				offense_description LIKE '%MURDER%' AND arrest_date BETWEEN '2026-02-01' AND '2026-02-28' 	
		GROUP BY
				boro;				
/*creating view of amunt of muder arrests in march*/			
CREATE VIEW v_march_murder_arrests AS					
		SELECT
				boro,
				count(*) AS 'march_murder_arrests'
		FROM
				nypd_arrests
		WHERE
				offense_description LIKE '%MURDER%' AND arrest_date BETWEEN '2026-03-01' AND '2026-03-31' 
		GROUP BY
				boro;
