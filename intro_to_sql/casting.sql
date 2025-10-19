select 
  avg(amount::numeric), 
  avg(cast(amount as numeric))
from `dbt-tutorial.stripe.payment`
