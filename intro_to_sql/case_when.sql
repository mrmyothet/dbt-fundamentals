select 
  paymentmethod, 
  case when paymentmethod in ('coupon', 'gift_card') 
    then 'promotion'
    else paymentmethod
  end as method_category,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by 1, 2

-------------------------------------------------------------------------

select 
  paymentmethod, 
  case when paymentmethod in ('coupon', 'gift_card') 
    then 'promotion'
    when paymentmethod = 'bank_transfer'
    then 'wire_payment'
    else paymentmethod
  end as method_category,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by 1, 2

-------------------------------------------------------------------------

select 
  case when paymentmethod in ('coupon', 'gift_card') 
    then 'promotion'
    when paymentmethod = 'bank_transfer'
    then 'wire_payment'
    else paymentmethod
  end as method_category,
  sum(amount) as total_amount
from `dbt-tutorial.stripe.payment`
group by 1