{{ config(
    materialized='table',
    pre_hook=[
      "ATTACH 'data/another_jaffle_shop.duckdb' AS another_jaffle_shop"
    ]
) }}

select *
from another_jaffle_shop.main.raw_customers
