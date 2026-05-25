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

/*joining 3 views together to display monthly arrests side by side*/
SELECT
    m.boro,
    COALESCE(january_murder_arrests, 0) AS 'jan_murder_arrests', --COALESCE avoids nulls and repalces them with 0
    COALESCE(f.feb_murder_arrests, 0)  AS 'feb_murder_arrests',
    COALESCE(m.march_murder_arrests, 0) AS 'march_murder_arrests'
FROM
    v_jan_murder_arrests j
RIGHT OUTER JOIN			--right outer join combines all record from the right table onto the lef table
    v_feb_murder_arrests f
        ON j.boro = f.boro
RIGHT OUTER JOIN
    v_march_murder_arrests m
        ON f.boro = m.boro;

/*month-over-month murder arrests changes*/
SELECT
    m.boro,
    COALESCE(f.feb_murder_arrests,0) - COALESCE(january_murder_arrests, 0) AS 'jan_to_feb_murder_arrest_chanages',
    COALESCE(m.march_murder_arrests, 0) - COALESCE(f.feb_murder_arrests, 0)  AS 'feb_to_march_murder_arrest_changes'
FROM
    v_jan_murder_arrests j
RIGHT OUTER JOIN			
    v_feb_murder_arrests f
        ON j.boro = f.boro
RIGHT OUTER JOIN
    v_march_murder_arrests m
        ON f.boro = m.boro;




