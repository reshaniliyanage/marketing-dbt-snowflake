with 

source as (

    select * from {{ source('marketing', 'stores') }}

),

renamed as (

    select
        store_id as retail_store_id,
        store_name,
        city,
        country

    from source

)

select * from renamed