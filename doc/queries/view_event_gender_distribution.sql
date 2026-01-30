CREATE VIEW view_event_gender_distribution AS
SELECT 
    t_child.name AS Event_Name,
    p.gender AS Gender,
    COUNT(pt.fk_pursuit) AS Total_Activities,
    COUNT(DISTINCT p.pk_person) AS Unique_Journalists
FROM tag t_child
JOIN tag t_parent ON t_child.fk_specializetag = t_parent.pk_tag
JOIN pursuit_tag pt ON t_child.pk_tag = pt.fk_tag
JOIN pursuit pur ON pt.fk_pursuit = pur.pk_pursuit
JOIN person p ON pur.fk_person = p.pk_person
WHERE t_parent.pk_tag = 2 -- Ton ID pour 'war'
GROUP BY t_child.name, p.gender
ORDER BY Event_Name ASC, Total_Activities DESC;