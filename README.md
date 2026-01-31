# dbt Marketing Analytics Project

## Overview
This project demonstrates an end-to-end dbt analytics workflow using marketing and sales data.
It follows dbt best practices including staging models, marts, testing, and documentation.

## Data Sources
The project uses five source tables:
- customers
- receipts
- receipt_items
- campaign_events
- stores

## Project Structure
models/
- staging/
  - stg_marketing__customers
  - stg_marketing__receipts
  - stg_marketing__receipt_items
  - stg_marketing__campaign_events
  - stg_marketing__stores
- marts/
  - customer_sales
  - customer_profiles

## Mart Models
### customer_sales
Aggregated customer-level sales metrics including:
- total amount spent
- number of purchases
- customer attributes

### customer_profiles
Customer analytics model including:
- purchase behavior
- lifetime value metrics
- marketing engagement
- customer segmentation

## Data Quality
- not_null, unique, accepted_values, and relationships tests are implemented
- All tests pass successfully

## How to Run
dbt run
dbt test
dbt docs generate
