/* ### Q1 — Daily Business Summary with DoD and Same-Weekday WoW

**CEO question:** *“How are we doing today vs yesterday, and vs the same day last week?”*

**Output:** `order_date, revenue, orders, aov, paid_order_rate, cancelled_order_rate, refunds_amount, revenue_vs_yesterday_pct, revenue_vs_last_weekday_pct`

**Sanity check:** `paid_order_rate ∈ [0, 1]` on every row. `sum(orders)` across all rows equals `count(*) of ecom.orders` for the same window.

**Pattern note:** `lag(..., 1)` for DoD, `lag(..., 7)` for same-weekday WoW (removes day-of-week seasonality). Wrap every denominator in `nullif(..., 0)`.
*/

with daily as (
  select
    o.created_at,
    sum(o.total) as revenue,
    count(*) as orders,
    sum(case when o.status = 'paid' then 1 else 0 end)::float / nullif(count(*),0) as paid_order_rate,
    sum(case when o.status = 'cancelled' then 1 else 0 end)::float / nullif(count(*),0) as cancelled_order_rate,
    coalesce(sum(r.refund_amount),0) as refunds_amount
  from ecom.orders o
  left join ecom.order_refunds r
    on o.order_id = r.order_id
  group by o.created_at
)
select
  created_at,
  revenue,
  orders,
  revenue / nullif(orders,0) as aov,
  paid_order_rate,
  cancelled_order_rate,
  refunds_amount,
  (revenue - lag(revenue,1) over(order by created_at)) / nullif(lag(revenue,1) over(order by created_at),0) as revenue_vs_yesterday_pct,
  (revenue - lag(revenue,7) over(order by created_at)) / nullif(lag(revenue,7) over(order by created_at),0) as revenue_vs_last_weekday_pct
from daily
order by created_at;
