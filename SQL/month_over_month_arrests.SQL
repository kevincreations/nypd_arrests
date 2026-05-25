/*finds total arrest in each month*/		
SELECT
			count(*) AS 'jan_total',
			(SELECT
				count(*)
			FROM
				nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-02-01' AND '2026-02-28') AS 'feb_total',
			(SELECT
				count(*)
			FROM
				nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-03-01' AND '2026-03-31') AS 'march_total'
FROM
		nypd_arrests		
WHERE 
			arrest_date BETWEEN '2026-01-01' AND '2026-01-31';
/*Used subqueries to calculate the month-over-month change in citywide arrests.*/
SELECT
			(SELECT
					count(*)
			FROM
					nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-02-01' AND '2026-02-28') -  	--finds the feb arrests
			(SELECT
					count(*)
			FROM
					nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-01-01' AND '2026-01-31') AS 'jan_to_feb_change', 
			(SELECT
					count(*)
			FROM
					nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-03-01' AND '2026-03-31') - 		--finds march arrest
			(SELECT
					count(*)
			FROM
					nypd_arrests
			WHERE
					arrest_date BETWEEN '2026-02-01' AND '2026-02-28')  AS 'feb_to_march_change';
					
