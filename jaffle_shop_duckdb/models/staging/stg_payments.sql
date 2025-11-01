with raw_payments as (
    select
        id as payment_id,
        order_id,
        payment_method,
        amount
    from {{ ref('raw_payments') }}
)

select * from raw_payments
