with customers as (
    select * from {{ ref('stg_customers')}}
),

orders as (
    select * from {{ ref('stg_orders')}}
),

payments as (
    select * from {{ ref('stg_payments')}}
),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        orders.order_id,
        payments.amount,
        payments.status

    from customers

    left join orders using (customer_id)

    left join payments using (order_id)

)

select * from final
