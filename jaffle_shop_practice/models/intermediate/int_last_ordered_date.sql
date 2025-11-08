select *
from jaffle_shop.main.customers c 
join jaffle_shop.main.orders o 
on c.customer_id = o.customer_id 
order by o.order_date desc