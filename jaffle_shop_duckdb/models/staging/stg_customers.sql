with raw_customer as (
    select *
    from {{ ref('raw_customers') }}
)

select * from raw_customer