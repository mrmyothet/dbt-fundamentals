select sum(amount)
from dbt-tutorial.stripe.payment
where status = 'success'

-------------------------------------------------------------------------

select count(raceid)
from raw.formula1.races
where time is not null 

select count(time)
from raw.formula1.races
where time is not null 

-------------------------------------------------------------------------
