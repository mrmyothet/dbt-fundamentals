# dbt Fundamentals (VS Code)

## Understanding Sources

### [generate_source](https://github.com/dbt-labs/dbt-codegen/tree/0.14.0/?tab=readme-ov-file#generate_source-source)

for multiple arguments, use the dict syntax

```
dbt run-operation generate_source --args '{"schema_name": "jaffle_shop", "database_name": "jaffle_shop", "table_names":["customers", "orders"]}'
```

Output
```
version: 2

sources:
  - name: jaffle_shop
    tables:
      - name: customers
      - name: orders
```

### [generate-base-model](https://github.com/dbt-labs/dbt-codegen/tree/0.14.0/?tab=readme-ov-file#generate_base_model-source)
```
dbt run-operation generate_base_model --args '{"source_name": "jaffle_shop", "table_name": "customers"}'
```

Output 
```
with source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        customer_id,
        first_name,
        last_name,
        first_order,
        most_recent_order,
        number_of_orders,
        customer_lifetime_value

    from source

)

select * from renamed
```