/* ### Q1 — Daily Business Summary with DoD and Same-Weekday WoW

**CEO question:** *“How are we doing today vs yesterday, and vs the same day last week?”*

**Output:** `order_date, revenue, orders, aov, paid_order_rate, cancelled_order_rate, refunds_amount, revenue_vs_yesterday_pct, revenue_vs_last_weekday_pct`

**Sanity check:** `paid_order_rate ∈ [0, 1]` on every row. `sum(orders)` across all rows equals `count(*) of ecom.orders` for the same window.

**Pattern note:** `lag(..., 1)` for DoD, `lag(..., 7)` for same-weekday WoW (removes day-of-week seasonality). Wrap every denominator in `nullif(..., 0)`.
*/

WITH daily_orders AS (
  SELECT
    date_trunc('day', o.created_at)::date         AS order_date
  , COUNT(*)                                       AS orders
  , SUM(o.total)                                   AS revenue
  , COUNT(*) FILTER (WHERE o.payment_status = 'paid')        AS paid_orders
  , COUNT(*) FILTER (WHERE LOWER(o.status) = 'cancelled')    AS cancelled_orders
  FROM ecom.orders o
  WHERE o.created_at >= (SELECT MAX(created_at) FROM ecom.orders) - INTERVAL '90 days'
  GROUP BY 1
)

, daily_refunds AS (
  SELECT
    date_trunc('day', r.created_at)::date          AS order_date
  , SUM(r.amount)                                  AS refunds_amount
  FROM ecom.refunds r
  WHERE r.created_at >= (SELECT MAX(created_at) FROM ecom.orders) - INTERVAL '90 days'
  GROUP BY 1
)

SELECT
  ord.order_date
, ord.revenue
, ord.orders
, (ord.revenue * 1.0 / NULLIF(ord.orders, 0))                  AS aov
, (ord.paid_orders      * 1.0 / ord.orders)                    AS paid_order_rate
, (ord.cancelled_orders * 1.0 / ord.orders)                    AS cancelled_order_rate
, COALESCE(dr.refunds_amount, 0)                               AS refunds_amount
, (ord.revenue - LAG(ord.revenue, 1) OVER (ORDER BY ord.order_date))
  / NULLIF(LAG(ord.revenue, 1) OVER (ORDER BY ord.order_date), 0)  AS revenue_vs_yesterday_pct
, (ord.revenue - LAG(ord.revenue, 7) OVER (ORDER BY ord.order_date))
  / NULLIF(LAG(ord.revenue, 7) OVER (ORDER BY ord.order_date), 0)  AS revenue_vs_last_weekday_pct
FROM daily_orders ord                     
LEFT JOIN daily_refunds dr USING (order_date)
ORDER BY ord.order_date DESC;
