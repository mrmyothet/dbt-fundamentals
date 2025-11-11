{%- set order_items_status = 'Complete' -%}
{%- set country = 'Australia' -%}

WITH customer_base AS (
    SELECT 
        id AS user_id,
        first_name AS customer_first_name,
        last_name AS customer_last_name,
        country AS customer_country,
        traffic_source AS customer_acquisition_channel
    FROM {{ ref('stg_looker__users') }}
    WHERE country = '{{ country }}'
)

, order_items AS (
    SELECT 
        user_id,
        SUM(sale_price) AS total_amount_spent,
        COUNT(DISTINCT id) AS total_items_purchased,
        MIN(created_at) AS first_order_completed_at,
        MAX(created_at) AS last_order_completed_at,
    FROM {{ ref('stg_looker__order_items') }}
    WHERE status = '{{ order_items_status }}'
    GROUP BY 1
)

, orders AS (
	SELECT 
        user_id,
        COUNT(DISTINCT order_id) AS num_orders,
        COUNT(DISTINCT CASE WHEN status = 'Shipped' THEN order_id END) AS num_orders_Shipped,
        COUNT(DISTINCT CASE WHEN status = 'Complete' THEN order_id END) AS num_orders_Complete,
        COUNT(DISTINCT CASE WHEN status = 'Processing' THEN order_id END) AS num_orders_Processing,
        COUNT(DISTINCT CASE WHEN status = 'Cancelled' THEN order_id END) AS num_orders_Cancelled,
        COUNT(DISTINCT CASE WHEN status = 'Returned' THEN order_id END) AS num_orders_Returned
  	FROM {{ ref('int_orders__pivoted') }}
)

, web_traffic AS (
    SELECT 
        user_id,
        COUNT(DISTINCT session_id) AS num_web_sessions,

        COUNT(DISTINCT CASE WHEN traffic_source = 'Adwords' THEN user_id END) AS num_traffic_source_Adwords,
        COUNT(DISTINCT CASE WHEN traffic_source = 'Email' THEN user_id END) AS num_traffic_source_Email,
        COUNT(DISTINCT CASE WHEN traffic_source = 'Facebook' THEN user_id END) AS num_traffic_source_Facebook,
        COUNT(DISTINCT CASE WHEN traffic_source = 'Organic' THEN user_id END) AS num_traffic_source_Organic,
        COUNT(DISTINCT CASE WHEN traffic_source = 'YouTube' THEN user_id END) AS num_traffic_source_YouTube,

        COUNT(DISTINCT CASE WHEN browser = 'Chrome' THEN user_id END) AS num_browser_Chrome,
        COUNT(DISTINCT CASE WHEN browser = 'Firefox' THEN user_id END) AS num_browser_Firefox,
        COUNT(DISTINCT CASE WHEN browser = 'Safari' THEN user_id END) AS num_browser_Safari,
        COUNT(DISTINCT CASE WHEN browser = 'IE' THEN user_id END) AS num_browser_IE,
        COUNT(DISTINCT CASE WHEN browser = 'Other' THEN user_id END) AS num_browser_Other      
        FROM {{ ref('stg_looker__events') }}
    GROUP BY 1
)

SELECT
    cb.user_id,
    -- dimensions
    cb.customer_first_name,
    cb.customer_last_name,
    cb.customer_country,
    cb.customer_acquisition_channel,
    -- facts 
    oi.total_amount_spent,
    oi.total_items_purchased,
    oi.first_order_completed_at,
    oi.last_order_completed_at,
    o.* EXCLUDE(user_id),
    wt.* EXCLUDE(user_id)
FROM customer_base cb
LEFT JOIN order_items oi 
    on cb.user_id = oi.user_id
LEFT JOIN orders o
    ON cb.user_id = o.user_id 
LEFT JOIN web_traffic wt 
    ON cb.user_id = wt.user_id
