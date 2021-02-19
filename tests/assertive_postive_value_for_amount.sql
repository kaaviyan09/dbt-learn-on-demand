select 
    order_id,
    sum(amount) tot_amt
    from {{ ref ('stg_payments') }}
    group by 1
    having not tot_amt > 0 