with source_data as (
    select 
      VendorID,
      tpep_pickup_datetime,
      tpep_dropoff_datetime,
      passenger_count,
      trip_distance,
      RatecodeID,
      store_and_fwd_flag,
      PULocationID,
      DOLocationID,
      payment_type,
      fare_amount,
      extra,
      mta_tax,
      tip_amount,
      tolls_amount,
      improvement_surcharge,
      total_amount,
      congestion_surcharge
    from {{ source('bigquery_source', 'yellow_tripdata_2023-01') }}
)

select * from source_data