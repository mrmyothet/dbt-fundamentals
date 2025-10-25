select * 
from dbt-tutorial.jaffle_shop.orders
  right join dbt-tutorial.jaffle_shop.customers
  on orders.user_id = customers.id
where orders.user_id is null 

---

select *
from dbt-tutorial.jaffle_shop.customers
  left join dbt-tutorial.jaffle_shop.orders
    on customers.id = orders.user_id
where orders.user_id is null