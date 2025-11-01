{% snapshot vehicle_list_snapshot %}

{{
    config(
      target_schema='main',
      unique_key='license_id',
      strategy='timestamp',
      updated_at='last_updated'
    )
}}

select * from {{ source('raw', 'vehicle_list') }}
{% endsnapshot %}
