select
    order_id,
    customer_id,
    order_date,
    status

from {{ source('external_jaffle_shop', 'raw_orders') }}
