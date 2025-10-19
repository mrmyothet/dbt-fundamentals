select 
  paymentmethod, 
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by paymentmethod

-------------------------------------------------------------------------

select 
  paymentmethod, 
  status,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by paymentmethod, status

-------------------------------------------------------------------------

select 
  paymentmethod, 
  status,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by 1, 2

-------------------------------------------------------------------------

select 
  paymentmethod, 
  status,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by 1, 2
order by 1, 2

-------------------------------------------------------------------------

select 
  paymentmethod, 
  status,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
where status = 'success'
group by 1, 2
order by 1, 2