select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('external_jaffle_shop', 'raw_orders') }}
