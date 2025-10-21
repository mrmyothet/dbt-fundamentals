-- Using raw.stripe.payment as your table, create a new field called ‘amount_category’
-- Where if the amount is greater than 1900 call it ‘Large’, if amount is between 500 and 1900 call it ‘Medium’ otherwise the category is ‘Small’
-- Sum the amount, and count the number of payments that map to the ‘amount_category’

select 
  case when amount > 1900
    then 'Large'
    when amount >= 500 and amount <= 1900
    then 'Medium'
    else 'Small'
  end as amount_category,
  sum(amount) as total_amount,
  count(*) as payment_count
from `dbt-tutorial.stripe.payment`
group by 1
order by 1

-- ANSWER
select 
	case when amount >1900
		then 'Large'
		when amount between 500 and 1900
		then 'Medium'
		else 'Small'
	end as amount_category,
	sum(amount) as total_amount,
	count(id) as payment_count
from `dbt-tutorial.stripe.payment`
group by 1
order by 1

