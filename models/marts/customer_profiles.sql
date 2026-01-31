with customer_receipts as (
    select
        customer_id,
        count(distinct receipt_id) as total_purchases,
        sum(total_amount) as total_spent,
        max(purchase_ts) as last_purchase_date,
        min(purchase_ts) as first_purchase_date
    from {{ ref('stg_marketing__receipts') }}
    group by customer_id
),

customer_campaigns as (
    select
        customer_id,
        coalesce(count(distinct campaign_name), 0) as campaigns_received,
        coalesce(count(case when event_type = 'open' then 1 end), 0) as campaigns_opened,
        coalesce(count(case when event_type = 'click' then 1 end), 0) as campaigns_clicked
    from {{ ref('stg_marketing__campaign_events') }}
    group by customer_id
),

customer_info as (
    select
        customer_id,
        email,
        marketing_consent,
        signup_date,
        country
    from {{ ref('stg_marketing__customers') }}
),

customer_ltv as (
    select
        customer_id,
        -- Prevent division by zero and null avg_daily_spent
        coalesce(total_spent / nullif(datediff('day', first_purchase_date, last_purchase_date), 0), 0) as avg_daily_spent
    from customer_receipts
)

select
    ci.customer_id,
    ci.email,
    ci.marketing_consent,
    ci.signup_date,
    ci.country,
    coalesce(cr.total_purchases, 0) as total_purchases,
    coalesce(cr.total_spent, 0) as total_spent,
    coalesce(cr.first_purchase_date, date('1900-01-01')) as first_purchase_date,
    coalesce(cr.last_purchase_date, date('1900-01-01')) as last_purchase_date,
    cl.avg_daily_spent,
    coalesce(cc.campaigns_received, 0) as campaigns_received,
    coalesce(cc.campaigns_opened, 0) as campaigns_opened,
    coalesce(cc.campaigns_clicked, 0) as campaigns_clicked,
    case
      when coalesce(cr.total_purchases, 0) = 0 then 'inactive'
      when cr.last_purchase_date < dateadd('month', -6, current_date) then 'at_risk'
      when coalesce(cr.total_purchases, 0) > 5 then 'loyal'
      else 'new'
    end as customer_segment

from customer_info ci
left join customer_receipts cr on ci.customer_id = cr.customer_id
left join customer_ltv cl on ci.customer_id = cl.customer_id
left join customer_campaigns cc on ci.customer_id = cc.customer_id
