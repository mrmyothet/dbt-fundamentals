select
    id as payment_id,
    order_id,
    payment_method,
    amount
from raw.stripe.payments
