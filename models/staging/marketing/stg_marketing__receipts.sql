with 

source as (

    select * from {{ source('marketing', 'receipts') }}

),

renamed as (

    select
        receipt_id,
        customer_id,
        store_id as retail_store_id,
        purchase_ts,
        total_amount

    from source

)

select * from renamed