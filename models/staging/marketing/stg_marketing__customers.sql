with 

source as (

    select * from {{ source('marketing', 'customers') }}

),

renamed as (

    select
        customer_id,
        email,
        marketing_consent,
        signup_date,
        country

    from source

)

select * from renamed