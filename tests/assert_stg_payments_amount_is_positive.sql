with payments as (

    select * from {{ ref('stg_payments') }}

)

select
    order_id,
    sum(amount)

from payments
group by order_id
having sum(amount) < 0