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
