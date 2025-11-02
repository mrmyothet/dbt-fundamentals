select *
from {{ source('another_jaffle_shop', 'raw_customers') }}
