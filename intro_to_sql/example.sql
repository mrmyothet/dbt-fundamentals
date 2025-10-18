select
	id, 
	orderid,
	paymentmethod,
	status,
	amount
from raw.stripe.payment
where 
	paymentmethod not in ('gift_card', 'coupon')
	and amount> 600 and amount <= 2000
order by 5 desc, 2