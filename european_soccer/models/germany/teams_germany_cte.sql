WITH germany_country AS (
    SELECT id
    FROM {{ ref('raw_country') }}
    WHERE name = 'Germany'
),
germany_home_teams AS (
    SELECT DISTINCT hometeam_id
    FROM {{ ref('raw_match') }} AS m
    JOIN germany_country AS c ON m.country_id = c.id
)
SELECT t.*
FROM team AS t
JOIN germany_home_teams AS ght ON t.team_api_id = ght.hometeam_id