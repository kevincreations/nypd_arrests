/*Manipulating data with CASE statement to distinguish the violation letters*/
UPDATE		
			nypd_arrests
SET
			lvl_of_offense = CASE
					WHEN 
							lvl_of_offense = 'M' THEN 'Misdemeanor'
					WHEN	
							lvl_of_offense = 'F' THEN 'Felony'
					WHEN
							lvl_of_offense = 'V' THEN 'Violation'
					WHEN 
							lvl_of_offense = 'I' THEN 'Infraction'
					WHEN
							lvl_of_offense = '9' THEN 'Unknown'
					ELSE
							lvl_of_offense
					END;

/*Using he GROUP clause to group column values together to display every value once, it finds nulls and other strange entries*/
SELECT
		lvl_of_offense
FROM
		nypd_arrests
GROUP BY
		lvl_of_offense;

/*updating null in multiple columns at once with Unknown*/
UPDATE 
			nypd_arrests
SET
			lvl_of_offense = CASE
					WHEN 
						lvl_of_offense IS NULL THEN 'Unknown'
					WHEN
						lvl_of_offense = '(null)' THEN 'Unknown'
					WHEN 
						lvl_of_offense = '9' THEN 'Unknown'
					ELSE 					-- **very important to include ELSE or it will change the other boros to NULL
						lvl_of_offense		
					END,
			law_code = CASE
					WHEN 
						law_code IS NULL THEN 'Unknown'
					ELSE
						law_code
					END;

/*Manipulating the boro column by changing B to BX and K to BK to distinguish between the two borough abbreviations.*/ 
UPDATE
			nypd_arrests
SET			
			boro = CASE
					WHEN
							boro = 'K' THEN 'BK'
					WHEN 
							boro = 'B' THEN 'BX'
					ELSE				
							boro     
					END;
/*manipulating the 9 entry in lvl_of_offense column and turning into unknown*/
UPDATE 
		nypd_arrests
SET
		lvl_of_offense = 'Unknown'
WHERE
		lvl_of_offense = '9';
/*change (null) under the police_description column*/
UPDATE 
		nypd_arrests
SET
		police_description = 'Unknown'
WHERE
		police_description= '(null)’;

/*replacing NULL with Unknown under police_code column*/
UPDATE 
		nypd_arrests
SET
		police_code = 'Unknown'
WHERE
		police_code = NULL;
