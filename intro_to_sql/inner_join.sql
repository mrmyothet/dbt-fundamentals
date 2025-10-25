select *
from dbt-tutorial.jaffle_shop.customers
  inner join dbt-tutorial.jaffle_shop.orders
    on customers.id = orders.user_id
order by customers.id, orders.id