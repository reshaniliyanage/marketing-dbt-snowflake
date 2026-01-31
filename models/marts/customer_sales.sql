with customer_receipts as (
    select
        customer_id,
        sum(total_amount) as total_spent,
        count(distinct receipt_id) as purchase_count
    from {{ ref('stg_marketing__receipts') }}
    group by customer_id
),

customer_info as (
    select
        customer_id,
        email,
        marketing_consent,
        signup_date
    from {{ ref('stg_marketing__customers') }}
)

select
    ci.customer_id,
    ci.email,
    ci.marketing_consent,
    ci.signup_date,
    coalesce(cr.total_spent, 0) as total_spent,
    coalesce(cr.purchase_count, 0) as purchase_count
from customer_info ci
left join customer_receipts cr on ci.customer_id = cr.customer_id
