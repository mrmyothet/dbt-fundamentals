select
  id as order_id,
  user_id as customer_id,
  order_date,
  status as order_status
from `dbt-tutorial.jaffle_shop.orders`
where order_date > '2018-01-31';

---

select
  id as order_id,
  user_id as customer_id,
  order_date,
  status as order_status
from `dbt-tutorial.jaffle_shop.orders`
where order_status like 'r%'