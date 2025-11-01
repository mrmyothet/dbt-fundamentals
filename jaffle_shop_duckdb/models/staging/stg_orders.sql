with raw_orders as (
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from {{ ref('raw_orders') }}
)

select * from raw_orders
