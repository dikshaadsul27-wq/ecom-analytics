# ecom_schema.md

## Section A — Table Inventory
(Grain, approx row count, purpose for each table)
[Inventory](https://github.com/dikshaadsul27-wq/ecom-analytics/blob/main/notes/Inventory.xlsx)
### 1.addresses
- Grain: 
- Approx row count: 16,000
- Purpose: 

### 2.attribution_campaigns
- Grain: bridge table
- Approx row count: 38,405
- Purpose: links marketing campaigns to attribution

### 3.attribution_touches
- Grain: 
- Approx row count: 1,00,000
- Purpose: 

### 4.brands
- Grain: 
- Approx row count: 120
- Purpose:

### 5.categories
- Grain: 
- Approx row count: 18
- Purpose:

### 6.collection_products
- Grain: 
- Approx row count: 0
- Purpose:

### 7.collections
- Grain: 
- Approx row count: 0
- Purpose:

### 8.consents
- Grain: 
- Approx row count: 0
- Purpose:

### 9.coupons
- Grain: 
- Approx row count: 50
- Purpose:

### 10.customer_addresses
- Grain: 
- Approx row count: 16,000
- Purpose:

### 11.customer_segments
- Grain: one segment
- Approx row count: 10
- Purpose: segment definitions

### 12.customers
- Grain: 
- Approx row count: 10,000
- Purpose:

### 13.devices
- Grain: 
- Approx row count: 85,168
- Purpose:

### 14.experiment_assignments
- Grain: 
- Approx row count: 40,670
- Purpose:

### 15.experiment_variants
- Grain: 
- Approx row count: 10
- Purpose:

### 16.experiments
- Grain: 
- Approx row count: 5
- Purpose:

### 17.inventory_items
- Grain: one SKU
- Approx row count: 2,000
- Purpose: inventory catalog

### 18.inventory_movements
- Grain: one movement
- Approx row count: 30,207
- Purpose: stock in/out tracking

### 19.loyalty_accounts
- Grain: one account
- Approx row count: 3,000
- Purpose: loyalty program membership

### 20.loyalty_transactions
- Grain: one transaction
- Approx row count: 21,475
- Purpose: loyalty points activity

### 21.marketing_campaigns
- Grain: one campaign
- Approx row count: 100
- Purpose: campaign metadata

### 22.notifications
- Grain: one notification send
- Approx row count: 6,856
- Purpose: outbound communication

### 23.order_items
- Grain: 
- Approx row count: 81,806
- Purpose:

### 24.order_refunds
- Grain: 
- Approx row count: 
- Purpose:

### 25.order_status_history
- Grain: 
- Approx row count: 1,58,414
- Purpose:

### 26.orders
- Grain: 
- Approx row count: 40,000
- Purpose:

### 27.payment_intents
- Grain: 
- Approx row count: 40,000
- Purpose:

### 28.payment_methods
- Grain: 
- Approx row count: 5
- Purpose:

### 29.payment_transactions
- Grain: 
- Approx row count: 40,034
- Purpose:

### 30.price_lists
- Grain: 
- Approx row count: 2
- Purpose:

### 31.prices
- Grain: 
- Approx row count: 24,180
- Purpose:

### 32.product_images
- Grain: one image
- Approx row count: 7,188
- Purpose: product visuals

### 33.product_reviews
- Grain: one review
- Approx row count: 8,000
- Purpose: customer feedback

### 34.product_variants
- Grain: 
- Approx row count: 12,090
- Purpose:

### 35.products
- Grain: 
- Approx row count: 4,000
- Purpose:

### 36.promotion_rules
- Grain: 
- Approx row count: 30
- Purpose:

### 37.promotions
- Grain: 
- Approx row count: 20
- Purpose:

### 38.refunds
- Grain: 
- Approx row count: 260
- Purpose:

### 39.return_items
- Grain: 
- Approx row count: 2,004
- Purpose:

### 40.return_reasons
- Grain: 
- Approx row count: 8
- Purpose:

### 41.return_requests
- Grain: 
- Approx row count: 1,603
- Purpose:

### 42.segment_memberships
- Grain: one membership
- Approx row count: 16,461
- Purpose: customer-to-segment mapping

### 43.session_channels
- Grain: 
- Approx row count: 
- Purpose:

### 44.session_events
- Grain: one event
- Approx row count: 2,92,903
- Purpose: instrumented event stream

### 45.sessions
- Grain: 
- Approx row count: 1,00,000
- Purpose:

### 46.shipments
- Grain: 
- Approx row count: 32,089
- Purpose:

### 47.shipping_carriers
- Grain: 
- Approx row count: 3
- Purpose:

### 48.shipping_methods
- Grain: 
- Approx row count: 3
- Purpose:


---

## Section B — Column Dictionary

Row counts:[Row counts](https://github.com/dikshaadsul27-wq/ecom-analytics/blob/main/notes/Row%20counts.xlsx)

## Section C — Foreign Keys

***need to check unable to run query***

## Section D — Categorical Distributions

Distinct value distributions on every categorical text column (status, payment_method, channel, country): [Distinct Value Distribution](https://github.com/dikshaadsul27-wq/ecom-analytics/blob/main/notes/Distinct%20Value%20Distribution.xlsx)

## Section E — Empty Table Check

collections → 0 rows
collection_products → 0 rows
consents → 0 rows

Note: Empty by design — do not assume data exists.
