select 
	c.customer_id,
	sum(p.amount) as customer_spend
from jaffle_shop.main.stg_orders as o
	join jaffle_shop.main.stg_payments as p on o.order_id  = p.order_id 
	join jaffle_shop.main.stg_customers as c on o.customer_id = c.customer_id  
where o.status = 'completed'
group by c.customer_id 
order by customer_spend desc