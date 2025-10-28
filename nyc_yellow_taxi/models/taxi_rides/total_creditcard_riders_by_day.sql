select 
  EXTRACT(DAY FROM tpep_pickup_datetime) as day,
  count(*) as total_cc_riders
from {{ ref('taxi_rides_raw') }}
where payment_type = 1
group by day
