with

source as ( 

    select * from {{ ref('customers') }}

),

staged as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from staged
