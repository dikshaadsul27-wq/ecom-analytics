/* ### Q4 — Top Products by Net Revenue (After Refunds)

**CFO question:** *“Which products actually make us money — net of returns?”*

**Output:** `product_id, product_name, category, gross_revenue, orders_count, units_sold, returns_count, return_rate, refunds_amount, net_revenue`

**Sanity check:** `sum(gross_revenue)` across all products equals `sum(qty * unit_price)` from `ecom.order_items` for the same window, within 0.5%.

**Pattern note:** Three CTEs (`product_revenue`, `product_returns`, `product_refunds`) joined in the final select. Don’t try a single join — you’ll double-count.
*/
