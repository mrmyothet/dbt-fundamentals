select 
  date_part('day', tpep_pickup_datetime) as day,
  count(*) as total_cc_riders
from taxi_rides_raw
where payment_type = 1
group by day
