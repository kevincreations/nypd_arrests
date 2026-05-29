/*creating CTEs to display arrest by age group in each boro.This query allows to view the tables side by side*/
WITH bk_arrests AS (
						SELECT
								age_group,	
								count(*) AS 'brooklyn_arrest_count'
						FROM
								nypd_arrests
						WHERE 
									boro = 'BK'
						GROUP BY
								age_group),
bx_arrests AS (		
						SELECT
								age_group,
								count(*) AS 'bronx_arrest_count'
						FROM
								nypd_arrests
						WHERE 
								boro = 'BX'
						GROUP BY
								age_group),
staten_arrests AS (
						SELECT
								age_group,
								COUNT(*) AS 'staten_arrest_count'
						FROM
								nypd_arrests
						WHERE
								boro = 'S'
						GROUP BY
								age_group),
queens_arrests AS (
						SELECT
								age_group,
								COUNT(*) AS 'queens_arrest_count'
						FROM
								nypd_arrests
						WHERE
								boro = 'Q'
						GROUP BY
								age_group),
m_arrests AS (
						SELECT
								age_group,
								COUNT(*) AS 'manhattan_arrest_count'
						FROM
								nypd_arrests
						WHERE
								boro = 'M'
						GROUP BY
								age_group)						
SELECT 
		bk.age_group,
		bk.brooklyn_arrest_count,
		bx.bronx_arrest_count,
		s.staten_arrest_count,
		q.queens_arrest_count,
		m.manhattan_arrest_count
FROM 
		bk_arrests bk
JOIN 
		bx_arrests bx	
		ON
			bk.age_group = bx.age_group
JOIN 
		staten_arrests s
		ON
			bx.age_group = s.age_group
JOIN
		queens_arrests q
		ON
			s.age_group = q.age_group
JOIN
		m_arrests  m
		ON 
			q.age_group = m.age_group;

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

-----------/*Start of CTE to find amount of level of offenses in each boro and joining them to view side by side*/------------
WITH felony_counts_by_boro AS (
							SELECT
									boro,
									count(*) 'Felonies'
							FROM 
									nypd_arrests
							WHERE
									lvl_of_offense =  'Felony' 
							GROUP BY
									boro,
									lvl_of_offense),
/*finding the amount of misdeamanors in each boro*/	
misdemeanor_counts_by_boro AS (
								SELECT
										boro,
										count(*) 'Misdemeanors'
								FROM 
										nypd_arrests
								WHERE
										lvl_of_offense =  'Misdemeanor' 
								GROUP BY
										boro,
										lvl_of_offense),
/*amount of violations in each boro*/
violation_counts_by_boro AS (
								SELECT
										boro,
										count(*) 'Violations'
								FROM 
										nypd_arrests
								WHERE
										lvl_of_offense =  'Violation' 
								GROUP BY
										boro,
										lvl_of_offense),
/*amount of infractions in each boro*/	
infraction_counts_by_boro AS (
								SELECT
									boro,
									count(*) 'Infractions'
							FROM 
									nypd_arrests
							WHERE
									lvl_of_offense =  'Infraction' 
							GROUP BY
									boro,
									lvl_of_offense),
/*amount of level of offenses in each boro*/
unknown_counts_by_boro AS (
							SELECT
									boro,
									count(*) 'Unknown'
							FROM 
									nypd_arrests
							WHERE
									lvl_of_offense =  'Unknown' 
							GROUP BY
									boro,
									lvl_of_offense)
SELECT
		f.boro,
		f.Felonies,
		m.Misdemeanors,
		v.Violations,
		i.Infractions,
		u.Unknown
FROM
		felony_counts_by_boro f
JOIN
		misdemeanor_counts_by_boro m
		ON
			f.boro = m.boro
JOIN
		violation_counts_by_boro v
		ON 
			m.boro = v.boro 
JOIN
		infraction_counts_by_boro i
		ON 
			v.boro = i.boro
JOIN 
		unknown_counts_by_boro u
		ON
			i.boro = u.boro;

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

/*This query examines which misdemeanor charges occur most often throughout the dataset.*/

SELECT
	police_description,
	lvl_of_offense,
	COUNT(*) AS 'amount_reported'
FROM 
	nypd_arrests
WHERE 
	lvl_of_offense = 'Misdemeanor' 
GROUP BY 
	police_description
ORDER BY
	amount_reported DESC
LIMIT 10;

----------------------------------------/*START OF CTE*/-------------------------------------------
/*joining CTEs to view number of lvl of offense each month*/
WITH monthly_misdemeanors AS (
							SELECT
									SUBSTR(arrest_date, 1, 7) AS 'arrest_month',
									COUNT(*) AS 'misdemeanor_arrests'
							FROM
									nypd_arrests
							WHERE
									lvl_of_offense = 'Misdemeanor'
							GROUP BY
									SUBSTR(arrest_date, 1, 7)
							ORDER BY
									arrest_month),		
monthly_felonies AS (
							SELECT
									SUBSTR(arrest_date, 1, 7) AS 'arrest_month',
									COUNT(*) AS 'felony_arrests'
							FROM
									nypd_arrests
							WHERE
									lvl_of_offense = 'Felony'
							GROUP BY
									SUBSTR(arrest_date, 1, 7)
							ORDER BY
									arrest_month),		
/*number of violations each month*/
 monthly_violations AS (
							SELECT
									SUBSTR(arrest_date, 1, 7) AS 'arrest_month',
									COUNT(*) AS 'violation_arrests'
							FROM
									nypd_arrests
							WHERE
									lvl_of_offense = 'Violation'
							GROUP BY
									SUBSTR(arrest_date, 1, 7)
							ORDER BY
									arrest_month),
/*number of infractions each month*/		
monthly_infractions AS (
							SELECT
									SUBSTR(arrest_date, 1, 7) AS 'arrest_month',
									COUNT(*) AS 'infraction_arrests'
							FROM
									nypd_arrests
							WHERE
									lvl_of_offense = 'Infraction'
							GROUP BY
									SUBSTR(arrest_date, 1, 7)
							ORDER BY
									arrest_month),
/*number of unknown level offenses each month*/
monthly_unknowns AS (
							SELECT
									SUBSTR(arrest_date, 1, 7) AS 'arrest_month',
									COUNT(*) AS 'unknown_arrests'
							FROM
									nypd_arrests
							WHERE
									lvl_of_offense = 'Unknown'
							GROUP BY
									SUBSTR(arrest_date, 1, 7)
							ORDER BY
									arrest_month)	
SELECT
		m.arrest_month,
		m.misdemeanor_arrests,
		f.felony_arrests,
		v.violation_arrests,
		i.infraction_arrests,
		u.unknown_arrests
FROM
		monthly_misdemeanors m
JOIN 
		monthly_felonies f
		ON
			m.arrest_month = f.arrest_month
JOIN
		 monthly_violations v
		ON
			f.arrest_month = v.arrest_month
JOIN
		monthly_infractions i
		ON
			v.arrest_month = i.arrest_month
JOIN
		monthly_unknowns u
			ON 
				i.arrest_month = u.arrest_month;
					
