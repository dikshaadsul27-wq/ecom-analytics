/* ### Q5 — Category Health: Purchases → Returns

**Category Manager question:** *“Which categories generate the most revenue, and which have the highest return rates?”*

**Output:** `category, orders_with_category, units_sold, revenue, returns, return_rate_pct`

**Sanity check:** `return_rate_pct ∈ [0, 100]`. `returns <= orders_with_category` for every category. `sum(revenue)` across categories equals `sum(line_total)` from `ecom.order_items` on paid orders, within 0.5%.

**Pattern note:** Two CTEs (`category_sales`, `category_returns`) joined in the final select. Returns aggregate via `return_items → product_variants → products → categories`. Note the join chain — going through `product_variants` is required because `return_items` references variants, not products.
*/
