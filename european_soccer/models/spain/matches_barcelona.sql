SELECT *
FROM {{ ref('raw_match') }}
WHERE hometeam_id = 8634 -- FC Barcelona's team_api_id
UNION 
SELECT *
FROM {{ ref('raw_match') }}
WHERE awayteam_id = 8634 -- FC Barcelona's team_api_id