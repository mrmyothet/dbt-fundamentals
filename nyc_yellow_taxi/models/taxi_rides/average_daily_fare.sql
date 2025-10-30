with avg_daily_fare as (
  select date_part('day', tpep_pickup_datetime) as day,
         avg(total_amount) as avg_amount
  from {{ ref('taxi_rides_raw') }}
  group by day
  order by day
)
select * from avg_daily_fare