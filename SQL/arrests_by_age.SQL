/*This query creates a CTE for each borough to calculate arrests by age group, then joins the results together for side-by-side comparison.*/
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

/*arrests by age group citywide*/
SELECT
			age_group,
			count(*) AS 'arrests_by_age_group'
FROM
			nypd_arrests
GROUP BY 
			age_group
ORDER BY
			arrests_by_age_group DESC;
		
