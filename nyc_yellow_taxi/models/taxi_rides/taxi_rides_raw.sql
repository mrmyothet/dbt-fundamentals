with source_data as (
  select * 
  from read_parquet('green_tripdata_2023-01.parquet')
)

select * from source_data