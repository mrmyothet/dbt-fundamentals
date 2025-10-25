select 
  orders.id as order_id, 
  orders.user_id as customer_id, 
  orders.status as order_status, 
  payment.status as payment_status, 
  paymentmethod, 
  order_date, 
  amount
from dbt-tutorial.jaffle_shop.orders
  inner join dbt-tutorial.jaffle_shop.customers
    on orders.user_id = customers.id
  inner join dbt-tutorial.stripe.payment
    on payment.orderid = orders.id
where paymentmethod = 'credit_card'
and amount > 1000
order by amount desc, order_date asc

----------
--Exemplar
----------

select 
    orders.id as order_id, 
    orders.user_id as customer_id, 
    orders.order_date, 
    orders.status as order_status,
    customers.first_name,
    customers.last_name,
    payment.paymentmethod,
    payment.status as payment_status,
    payment.amount 
from raw.jaffle_shop.orders 
    inner join raw.jaffle_shop.customers 
        on orders.user_id = customers.id 
    inner join raw.stripe.payment 
        on orders.id = payment.orderid
where paymentmethod = 'credit_card'
    and amount > 1000
    and orders.status <> 'returned'
order by amount desc, order_date