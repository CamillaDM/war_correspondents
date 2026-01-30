CREATE VIEW view_career_chronology AS
SELECT 
    p.name AS journalist_name,
    p.gender,
    occ.name AS occupation_name,
    org.name AS organisation_name,
    COALESCE(pur.label, 'No Title') AS activity_title,
    -- On extrait l'année des colonnes avec espaces
    CAST(SUBSTR(pur."begin date", 1, 4) AS INTEGER) AS start_year,
    CAST(SUBSTR(pur."end date", 1, 4) AS INTEGER) AS end_year
FROM person p
JOIN pursuit pur ON p.pk_person = pur.fk_person
JOIN occupation occ ON pur.fk_occupation = occ.pk_occupation
LEFT JOIN organisation org ON pur.fk_organisation = org.pk_organisation;