SELECT *
FROM {{ ref('raw_match') }}
WHERE hometeam_id IN (
    SELECT team_api_id
    FROM {{ ref('teams_spain') }}
)