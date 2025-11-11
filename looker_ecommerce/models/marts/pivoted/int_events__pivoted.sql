{% set traffic_source_values = ['Adwords', 'Email', 'Facebook', 'Organic', 'YouTube'] %}
{% set browser_values = ['Chrome', 'Firefox', 'Safari', 'IE', 'Other'] %}

SELECT 
    user_id,
    COUNT(DISTINCT session_id) AS num_web_sessions,
        
    {%- for traffic_source in traffic_source_values %}
    COUNT(DISTINCT CASE WHEN traffic_source = '{{ traffic_source }}' THEN user_id END) AS num_traffic_source_{{ traffic_source }},
    {%- endfor %}
      
    {%- for browser in browser_values %}
    COUNT(DISTINCT CASE WHEN browser = '{{ browser }}' THEN user_id END) AS num_browser_{{ browser }}
    {%- if not loop.last -%}
        ,
    {%- endif -%}
    {%- endfor %}

FROM {{ ref('stg_looker__events') }}
GROUP BY 1