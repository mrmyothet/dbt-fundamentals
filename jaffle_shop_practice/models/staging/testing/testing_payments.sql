select 
    payment_id, 
    order_id, 
    payment_method,
    amount, 
    {{ cents_to_dollars('amount') }} as amount_dollars
from {{ ref('stg_payments') }}