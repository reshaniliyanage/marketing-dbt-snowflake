with 

source as (

    select * from {{ source('marketing', 'receipt_items') }}

),

renamed as (

    select
        receipt_id,
        product_id,
        category,
        price

    from source

)

select * from renamed