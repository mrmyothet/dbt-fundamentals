with raw_customers as (
    select *
    from {{ ref('raw_customers') }}
)

select * from raw_customers
