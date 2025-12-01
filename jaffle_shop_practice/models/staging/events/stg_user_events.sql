{{ config(
    materialized='incremental',
    unique_key='event_id'
) }}


SELECT 
    event_id,
    user_id,
    event_type,
    event_timestamp
FROM {{ source('src_events', 'user_events') }}

{% if is_incremental() %}
  
  WHERE event_timestamp >= (SELECT COALESCE(MAX(event_timestamp),'1990-01-01') FROM {{ this }})
{% endif %}
