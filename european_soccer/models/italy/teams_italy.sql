SELECT *
FROM {{ ref('raw_team') }}
WHERE team_api_id IN (
    SELECT DISTINCT hometeam_id
    FROM {{ ref('raw_match') }}
    WHERE country_id = (SELECT id FROM {{ ref('raw_country') }} WHERE name = 'Italy')
)