-- Tank volume by Tank, Well, Route
SELECT
s.user_ref,
RTRIM(s.name + ' ' + ISNULL(s.number,' ')) AS 'Name',
t.name AS 'Tank Name',
r.name AS 'Route',
CONVERT(char(10),t.d_start,101) AS 'Start',
CONVERT(char(10),t.d_end,101) AS 'End',
t.volume As 'Calc Vol' ,
ISNULL(t.description,' ') AS 'Description',
ISNULL(t.notes, ' ') AS 'Addl. Notes'
FROM tank t
LEFT JOIN site s ON t.site_id = s.site_id
LEFT JOIN route r ON s.route_id = r.route_id
WHERE t.product_id IN
       (SELECT product_id FROM product
       WHERE [type] = 'OIL')
ORDER BY 1