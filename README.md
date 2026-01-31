# Marketing Analytics – dbt & Snowflake Project

## Project Summary

This project showcases an end-to-end analytics engineering workflow using dbt Cloud and Snowflake.  
It demonstrates how raw marketing data can be transformed into analytics-ready, tested, and documented models following modern data engineering best practices.

The focus of this project is on:  
- Data modeling  
- Data quality  
- Business-facing analytics  
- Clear documentation

---

## Tech Stack

- dbt Cloud  
- Snowflake  
- SQL  
- YAML  
- GitHub

---

## Key Skills Demonstrated

- Analytics Engineering best practices  
- Dimensional modeling (staging to marts)  
- Data quality testing and validation  
- Source configuration and freshness  
- Business-focused metric modeling  
- Documentation-driven development  
- dbt Cloud workflows  

---

## Data Architecture

This project follows a layered dbt architecture:

Raw Sources (Snowflake)  
        ↓  
Staging Models (clean and standardized)  
        ↓  
Mart Models (business-ready analytics)

---

## Model Layers

### Sources  
Raw marketing data ingested into Snowflake:  
- Customers  
- Receipts  
- Receipt items  
- Campaign events  
- Stores  

Sources are defined using dbt source() with column-level documentation and tests.

---

### Staging Models  

Staging models:  
- Standardize column names  
- Enforce consistent data types  
- Maintain row-level granularity  
- Act as a reliable foundation for analytics  

Examples:  
- stg_marketing__customers 
- stg_marketing__receipts 
- stg_marketing__receipt_items 
- stg_marketing__campaign_events 
- stg_marketing__stores


---

### Mart Models (Business Layer)  

customer_sales  
Customer-level sales summary.

Business value:  
- Enables revenue and purchase analysis  
- Supports customer value reporting  

Key metrics:  
- Total amount spent  
- Purchase count  
- Customer attributes  

---

customer_profiles  
Comprehensive customer analytics model combining:  
- Purchase behavior  
- Marketing engagement  
- Customer segmentation  

Key insights delivered:  
- Customer lifetime value indicators  
- Marketing campaign effectiveness  
- Customer segmentation (new, loyal, at_risk, inactive)  
- First and last purchase behavior  

---

## Data Quality and Testing  

Data quality is enforced using dbt tests:  

- not_null  
- unique  
- accepted_values  
- relationships  

All models are validated using:
dbt build
