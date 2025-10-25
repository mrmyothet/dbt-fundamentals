select *
from dbt-tutorial.jaffle_shop.customers
  left join dbt-tutorial.jaffle_shop.orders
    on customers.id = orders.user_id
order by customers.id, orders.id

---

select *
from dbt-tutorial.jaffle_shop.customers
  left join dbt-tutorial.jaffle_shop.orders
    on customers.id = orders.user_id
where orders.user_id is null
order by customers.id, orders.id

---

select * 
from dbt-tutorial.jaffle_shop.orders
  left join dbt-tutorial.jaffle_shop.customers
  on orders.user_id = customers.id
where customers.id is null