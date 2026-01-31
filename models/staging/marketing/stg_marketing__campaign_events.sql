with 

source as (

    select * from {{ source('marketing', 'campaign_events') }}

),

renamed as (

    select
        event_id,
        customer_id,
        campaign_name,
        channel,
        event_type,
        event_ts

    from source

)

select * from renamed