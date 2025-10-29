select
    id as customer_id,
    first_name,
    last_name

from {{ source('external_jaffle_shop', 'raw_customers') }}
