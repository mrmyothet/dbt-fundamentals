select
  id 
  user_id
  order_date,
  status as order_status
from `dbt-tutorial.jaffle_shop.orders`
where status = 'completed'
order by order_date desc, id

---

select
  id 
  user_id
  order_date,
  status as order_status
from `dbt-tutorial.jaffle_shop.orders`
where status = 'completed'
order by 3 desc, 1