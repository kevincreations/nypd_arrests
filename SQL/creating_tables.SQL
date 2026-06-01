/*creating a table with right data types*/
CREATE TABLE nypd_arrests (
        police_code INTEGER,
        arrest_date TEXT,
        police_description TEXT,
        key_code INTEGER,
        offense_description TEXT,
        law_code TEXT,
        lvl_of_offense TEXT,
        boro TEXT,
        precinct INTEGER,
        jurisdiction_code INTEGER,
        age TEXT,
        sex TEXT,
        race TEXT,
        x_coordinate INTEGER,
        y_coordinate INTEGER
);
/*inserting into main table from temporary table to prepare for cleaning*/
INSERT INTO nypd_arrests 
SELECT
        PD_CD,
        ARREST_DATE,
        PD_DESC,
        KY_CD,
        OFNS_DESC,
        LAW_CODE,
        LAW_CAT_CD,
        ARREST_BORO,
        ARREST_PRECINCT,
        JURISDICTION_CODE,
        AGE_GROUP,
        PERP_SEX,
        PERP_RACE,
        X_COORD_CD,
        Y_COORD_CD
FROM 
        nypd_arrest_logs;

