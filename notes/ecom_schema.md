# ecom_schema.md

## Section A — Table Inventory
(Grain, approx row count, purpose for each table)

### 1.addresses
- Grain: One order placed by a customer
- Approx row count: 16,000
- Purpose: Stores order-level details including status, payment_method, channel, country

### 2.attribution_campaigns
- Grain: One registered customer
- Approx row count: 38,405
- Purpose: Customer profiles and attributes

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
- Grain: 
- Approx row count: 10
- Purpose:

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
- Grain: 
- Approx row count: 2,000
- Purpose:

### 18.inventory_movements
- Grain: 
- Approx row count: 30,207
- Purpose:

### 19.loyalty_accounts
- Grain: 
- Approx row count: 3,000
- Purpose:

### 20.loyalty_transactions
- Grain: 
- Approx row count: 21,475
- Purpose:

### 21.marketing_campaigns
- Grain: 
- Approx row count: 100
- Purpose:

### 22.notifications
- Grain: 
- Approx row count: 6,856
- Purpose:

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
- Grain: 
- Approx row count: 7,188
- Purpose:

### 33.product_reviews
- Grain: 
- Approx row count: 8,000
- Purpose:

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
- Grain: 
- Approx row count: 16,461
- Purpose:

### 43.session_channels
- Grain: 
- Approx row count: 
- Purpose:

### 44.session_events
- Grain: 
- Approx row count: 2,92,903
- Purpose:

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

```sql
--
<table_name> | <column_name> | <data_type> | <is_nullable> | <column_default>
addresses	address_id	bigint	NO	nextval('ecom.addresses_address_id_seq'::regclass)
addresses	line1	text	YES	
addresses	line2	text	YES	
addresses	landmark	text	YES	
addresses	city	text	YES	
addresses	state	text	YES	
addresses	country	text	YES	
addresses	postal_code	text	YES	
addresses	latitude	numeric	YES	
addresses	longitude	numeric	YES	
attribution_campaigns	touch_id	bigint	NO	
attribution_campaigns	campaign_id	text	NO	
attribution_campaigns	ad_cost_attributed	numeric	YES	
attribution_touches	touch_id	bigint	NO	nextval('ecom.attribution_touches_touch_id_seq'::regclass)
attribution_touches	session_id	uuid	YES	
attribution_touches	touched_at	timestamp with time zone	NO	
attribution_touches	utm_source	text	YES	
attribution_touches	utm_medium	text	YES	
attribution_touches	utm_campaign	text	YES	
attribution_touches	utm_term	text	YES	
attribution_touches	utm_content	text	YES	
attribution_touches	channel	text	YES	
attribution_touches	referrer	text	YES	
brands	brand_id	bigint	NO	nextval('ecom.brands_brand_id_seq'::regclass)
brands	brand_name	text	NO	
categories	category_id	bigint	NO	nextval('ecom.categories_category_id_seq'::regclass)
categories	category_name	text	NO	
categories	parent_id	bigint	YES	
collection_products	collection_id	bigint	NO	
collection_products	product_id	bigint	NO	
collection_products	position	integer	YES	
collections	collection_id	bigint	NO	nextval('ecom.collections_collection_id_seq'::regclass)
collections	collection_name	text	NO	
collections	created_at	timestamp with time zone	NO	
consents	consent_id	bigint	NO	nextval('ecom.consents_consent_id_seq'::regclass)
consents	customer_id	bigint	YES	
consents	consent_type	text	NO	
consents	status	text	NO	
consents	updated_at	timestamp with time zone	NO	
coupons	coupon_id	bigint	NO	nextval('ecom.coupons_coupon_id_seq'::regclass)
coupons	code	text	NO	
coupons	discount_type	text	NO	
coupons	discount_value	numeric	NO	
coupons	max_uses	integer	YES	
coupons	max_uses_per_customer	integer	YES	
coupons	starts_at	timestamp with time zone	NO	
coupons	ends_at	timestamp with time zone	NO	
coupons	is_active	boolean	YES	true
customer_addresses	customer_id	bigint	NO	
customer_addresses	address_id	bigint	NO	
customer_addresses	address_type	text	NO	
customer_addresses	is_default	boolean	YES	false
customer_addresses	created_at	timestamp with time zone	NO	
customer_segments	segment_id	bigint	NO	nextval('ecom.customer_segments_segment_id_seq'::regclass)
customer_segments	segment_name	text	NO	
customers	customer_id	bigint	NO	nextval('ecom.customers_customer_id_seq'::regclass)
customers	created_at	timestamp with time zone	NO	
customers	first_name	text	YES	
customers	last_name	text	YES	
customers	dob	date	YES	
customers	gender	text	YES	
customers	primary_email	text	YES	
customers	primary_phone	text	YES	
customers	country	text	YES	
customers	state	text	YES	
customers	city	text	YES	
customers	is_email_verified	boolean	YES	false
customers	is_phone_verified	boolean	YES	false
customers	marketing_opt_in	boolean	YES	false
customers	lifecycle_stage	text	YES	
customers	acquisition_channel	text	YES	
customers	source	text	YES	
customers	utm_campaign	text	YES	
customers	utm_medium	text	YES	
customers	utm_source	text	YES	
devices	device_id	bigint	NO	nextval('ecom.devices_device_id_seq'::regclass)
devices	device_type	text	YES	
devices	os	text	YES	
devices	browser	text	YES	
devices	model	text	YES	
experiment_assignments	experiment_id	bigint	NO	
experiment_assignments	exp_variant_id	bigint	YES	
experiment_assignments	session_id	uuid	NO	
experiment_assignments	assigned_at	timestamp with time zone	NO	
experiment_assignments	customer_id	bigint	YES	
experiment_assignments	assignment_source	text	YES	
experiment_variants	variant_id	bigint	NO	nextval('ecom.experiment_variants_variant_id_seq'::regclass)
experiment_variants	experiment_id	bigint	YES	
experiment_variants	variant_name	text	NO	
experiment_variants	allocation_pct	numeric	YES	
experiment_variants	is_control	boolean	YES	
experiments	experiment_id	bigint	NO	nextval('ecom.experiments_experiment_id_seq'::regclass)
experiments	name	text	NO	
experiments	starts_at	timestamp with time zone	NO	
experiments	ends_at	timestamp with time zone	NO	
experiments	hypothesis	text	YES	
experiments	owner	text	YES	
experiments	status	text	YES	
experiments	primary_metric	text	YES	
inventory_items	warehouse_id	bigint	NO	
inventory_items	variant_id	bigint	NO	
inventory_items	on_hand	integer	NO	0
inventory_items	reserved	integer	NO	0
inventory_movements	movement_id	bigint	NO	nextval('ecom.inventory_movements_movement_id_seq'::regclass)
inventory_movements	movement_time	timestamp with time zone	NO	
inventory_movements	warehouse_id	bigint	YES	
inventory_movements	variant_id	bigint	YES	
inventory_movements	direction	text	NO	
inventory_movements	qty	integer	NO	
inventory_movements	reason	text	YES	
inventory_movements	reference	text	YES	
loyalty_accounts	customer_id	bigint	NO	
loyalty_accounts	created_at	timestamp with time zone	NO	
loyalty_accounts	tier	text	NO	
loyalty_transactions	loyalty_txn_id	bigint	NO	nextval('ecom.loyalty_transactions_loyalty_txn_id_seq'::regclass)
loyalty_transactions	customer_id	bigint	YES	
loyalty_transactions	txn_time	timestamp with time zone	NO	
loyalty_transactions	points_delta	integer	NO	
loyalty_transactions	reason	text	YES	
loyalty_transactions	order_id	bigint	YES	
marketing_campaigns	campaign_id	text	NO	
marketing_campaigns	name	text	NO	
marketing_campaigns	channel	text	NO	
marketing_campaigns	budget	numeric	YES	
marketing_campaigns	starts_at	timestamp with time zone	NO	
marketing_campaigns	ends_at	timestamp with time zone	NO	
marketing_campaigns	created_at	timestamp with time zone	NO	now()
notifications	notification_id	bigint	NO	nextval('ecom.notifications_notification_id_seq'::regclass)
notifications	customer_id	bigint	YES	
notifications	created_at	timestamp with time zone	NO	
notifications	channel	text	NO	
notifications	template	text	YES	
notifications	status	text	YES	
notifications	related_session_id	uuid	YES	
notifications	opened_at	timestamp with time zone	YES	
notifications	clicked_at	timestamp with time zone	YES	
order_items	order_id	bigint	NO	
order_items	variant_id	bigint	NO	
order_items	qty	integer	NO	
order_items	unit_price	numeric	NO	
order_items	line_discount	numeric	NO	0
order_items	line_total	numeric	NO	
order_refunds	order_id	bigint	YES	
order_refunds	refund_amount	numeric	YES	
order_status_history	order_id	bigint	NO	
order_status_history	status	text	NO	
order_status_history	changed_at	timestamp with time zone	NO	
order_status_history	reason	text	YES	
orders	order_id	bigint	NO	nextval('ecom.orders_order_id_seq'::regclass)
orders	order_number	text	NO	
orders	created_at	timestamp with time zone	NO	
orders	customer_id	bigint	YES	
orders	session_id	uuid	YES	
orders	cart_id	uuid	YES	
orders	price_list_id	bigint	YES	
orders	status	text	NO	
orders	subtotal	numeric	NO	
orders	discount	numeric	NO	0
orders	tax	numeric	NO	0
orders	shipping_fee	numeric	NO	0
orders	total	numeric	NO	
orders	payment_status	text	NO	
orders	shipping_address_id	bigint	YES	
orders	billing_address_id	bigint	YES	
orders	applied_coupon_id	bigint	YES	
orders	applied_promo_id	bigint	YES	
payment_intents	payment_intent_id	bigint	NO	nextval('ecom.payment_intents_payment_intent_id_seq'::regclass)
payment_intents	order_id	bigint	YES	
payment_intents	created_at	timestamp with time zone	NO	
payment_intents	payment_method_id	bigint	YES	
payment_intents	amount	numeric	NO	
payment_intents	status	text	NO	
payment_methods	payment_method_id	bigint	NO	nextval('ecom.payment_methods_payment_method_id_seq'::regclass)
payment_methods	method_name	text	NO	
payment_transactions	txn_id	bigint	NO	nextval('ecom.payment_transactions_txn_id_seq'::regclass)
payment_transactions	payment_intent_id	bigint	YES	
payment_transactions	txn_time	timestamp with time zone	NO	
payment_transactions	gateway	text	YES	
payment_transactions	status	text	NO	
payment_transactions	error_code	text	YES	
payment_transactions	error_message	text	YES	
price_lists	price_list_id	bigint	NO	nextval('ecom.price_lists_price_list_id_seq'::regclass)
price_lists	name	text	NO	
price_lists	currency	text	NO	
prices	price_list_id	bigint	NO	
prices	variant_id	bigint	NO	
prices	list_price	numeric	NO	
prices	sale_price	numeric	YES	
prices	valid_from	timestamp with time zone	NO	
prices	valid_to	timestamp with time zone	YES	
product_images	image_id	bigint	NO	nextval('ecom.product_images_image_id_seq'::regclass)
product_images	product_id	bigint	YES	
product_images	image_url	text	YES	
product_images	position	integer	YES	
product_reviews	review_id	bigint	NO	nextval('ecom.product_reviews_review_id_seq'::regclass)
product_reviews	customer_id	bigint	YES	
product_reviews	product_id	bigint	YES	
product_reviews	order_id	bigint	YES	
product_reviews	rating	integer	NO	
product_reviews	title	text	YES	
product_reviews	body	text	YES	
product_reviews	created_at	timestamp with time zone	NO	
product_variants	variant_id	bigint	NO	nextval('ecom.product_variants_variant_id_seq'::regclass)
product_variants	product_id	bigint	YES	
product_variants	sku	text	NO	
product_variants	color	text	YES	
product_variants	size	text	YES	
product_variants	attributes	jsonb	YES	
product_variants	is_active	boolean	YES	true
products	product_id	bigint	NO	nextval('ecom.products_product_id_seq'::regclass)
products	created_at	timestamp with time zone	NO	
products	product_name	text	NO	
products	brand_id	bigint	YES	
products	category_id	bigint	YES	
products	description	text	YES	
products	is_active	boolean	YES	true
promotion_rules	rule_id	bigint	NO	nextval('ecom.promotion_rules_rule_id_seq'::regclass)
promotion_rules	promo_id	bigint	YES	
promotion_rules	min_cart_value	numeric	YES	
promotion_rules	category_id	bigint	YES	
promotion_rules	product_id	bigint	YES	
promotions	promo_id	bigint	NO	nextval('ecom.promotions_promo_id_seq'::regclass)
promotions	promo_name	text	NO	
promotions	promo_type	text	NO	
promotions	discount_type	text	NO	
promotions	discount_value	numeric	NO	
promotions	starts_at	timestamp with time zone	NO	
promotions	ends_at	timestamp with time zone	NO	
promotions	is_active	boolean	YES	true
refunds	refund_id	bigint	NO	nextval('ecom.refunds_refund_id_seq'::regclass)
refunds	order_id	bigint	YES	
refunds	created_at	timestamp with time zone	NO	
refunds	amount	numeric	NO	
refunds	reason	text	YES	
refunds	status	text	NO	
return_items	return_id	bigint	NO	
return_items	variant_id	bigint	NO	
return_items	qty	integer	NO	
return_items	reason_id	bigint	YES	
return_reasons	reason_id	bigint	NO	nextval('ecom.return_reasons_reason_id_seq'::regclass)
return_reasons	reason_text	text	NO	
return_requests	return_id	bigint	NO	nextval('ecom.return_requests_return_id_seq'::regclass)
return_requests	order_id	bigint	YES	
return_requests	customer_id	bigint	YES	
return_requests	requested_at	timestamp with time zone	NO	
return_requests	status	text	NO	
segment_memberships	segment_id	bigint	NO	
segment_memberships	customer_id	bigint	NO	
segment_memberships	valid_from	timestamp with time zone	NO	
segment_memberships	valid_to	timestamp with time zone	YES	
session_channels	session_id	uuid	YES	
session_channels	channel	text	YES	
session_events	event_id	bigint	NO	
session_events	session_id	uuid	NO	
session_events	customer_id	bigint	YES	
session_events	event_type	text	NO	
session_events	occurred_at	timestamp with time zone	NO	
session_events	product_id	bigint	YES	
session_events	variant_id	bigint	YES	
session_events	quantity	integer	YES	
session_events	unit_price	numeric	YES	
session_events	order_id	bigint	YES	
sessions	session_id	uuid	NO	gen_random_uuid()
sessions	started_at	timestamp with time zone	NO	
sessions	ended_at	timestamp with time zone	YES	
sessions	customer_id	bigint	YES	
sessions	anonymous_id	uuid	YES	
sessions	device_id	bigint	YES	
sessions	ip_address	inet	YES	
sessions	country	text	YES	
sessions	region	text	YES	
sessions	city	text	YES	
sessions	landing_page	text	YES	
sessions	referrer	text	YES	
shipments	shipment_id	bigint	NO	nextval('ecom.shipments_shipment_id_seq'::regclass)
shipments	order_id	bigint	YES	
shipments	carrier_id	bigint	YES	
shipments	shipping_method_id	bigint	YES	
shipments	shipped_at	timestamp with time zone	YES	
shipments	delivered_at	timestamp with time zone	YES	
shipments	tracking_number	text	YES	
shipments	status	text	NO	
shipping_carriers	carrier_id	bigint	NO	nextval('ecom.shipping_carriers_carrier_id_seq'::regclass)
shipping_carriers	carrier_name	text	NO	
shipping_methods	shipping_method_id	bigint	NO	nextval('ecom.shipping_methods_shipping_method_id_seq'::regclass)
shipping_methods	method_name	text	NO	
shipping_methods	base_fee	numeric	NO	
...



## Section C — Foreign Keys
```sql
---
<table_name> | <column_name> → <foreign_table>.<foreign_column>
...

## Section D — Categorical Distributions

```sql
---
<status> | <n> 	
delivered	19,779
shipped	7,715
paid	3,946
packed	3,887
cancelled	2,178
placed	1,897
SHIPPED	248
DELIVERED	200
Shipped	150
...

