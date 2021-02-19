with payments as (

    select
        id as order_id,
        paymentmethod,
        status,
        amount/100 amount

    from {{source('stripe','payment')}}

)select * from payments