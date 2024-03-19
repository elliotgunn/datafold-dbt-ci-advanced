with source as (

    select * from {{ ref('payments') }}

),

staging as (

    select
        id as id,
        orderid as order_id,
        paymentmethod	as payment_method,
        status as status,
        amount as amount,
        created as created

    from source

)

select * from staging
