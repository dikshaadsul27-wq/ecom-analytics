/* ### Q2 — Monthly Signup Cohort Retention

**Growth Head question:** *“For each month’s new signups, how many came back in months 1, 2, 3?”*

**Output:** `cohort_month, cohort_size, m1_retained, m2_retained, m3_retained, m1_retention_rate, m2_retention_rate, m3_retention_rate`

**Sanity check:** `cohort_size` for any month equals `count(distinct customer_id)` from `ecom.customers` where `date_trunc('month', created_at) = cohort_month`. All retention rates in `[0, 1]`.

**Pattern note:** `customer_first_order_month` CTE, then self-join on offset months. Customers who signed up but never ordered still count in `cohort_size` (contribute zero to retention). Exclude cancelled orders from “retained” — document that choice.

> *Censoring caveat: the dataset holds ~4 signup months, so m3 is only fully observable for the earliest cohort — later cohorts’ m2/m3 cells are censored, not zero. Show censored cells as blank/NULL (never 0%) and say so in your interpretation. Spotting this unprompted is a senior-analyst signal.*
*/

WITH

cohorts AS (
  SELECT
    customer_id
  , date_trunc('month', created_at)::date AS cohort_month
  FROM ecom.customers
),

customer_first_order_month AS (
  SELECT
    customer_id
  , date_trunc('month', MIN(created_at))::date AS first_order_month
  FROM ecom.orders
  WHERE LOWER(status) != 'cancelled'
  GROUP BY customer_id
),

customer_active_months AS (
  SELECT DISTINCT
    customer_id
  , date_trunc('month', created_at)::date AS active_month
  FROM ecom.orders
  WHERE LOWER(status) != 'cancelled'
),

cohort_sizes AS (
  SELECT
    cohort_month
  , COUNT(DISTINCT customer_id) AS cohort_size
  FROM cohorts
  GROUP BY 1
)

SELECT
  c.cohort_month
, cs.cohort_size


, COUNT(DISTINCT CASE
    WHEN cam.active_month = (c.cohort_month + INTERVAL '1 month')::date
    THEN c.customer_id END)                                      AS m1_retained

, COUNT(DISTINCT CASE
    WHEN cam.active_month = (c.cohort_month + INTERVAL '2 months')::date
    THEN c.customer_id END)                                      AS m2_retained

, COUNT(DISTINCT CASE
    WHEN cam.active_month = (c.cohort_month + INTERVAL '3 months')::date
    THEN c.customer_id END)                                      AS m3_retained


, ROUND(
    COUNT(DISTINCT CASE
      WHEN cam.active_month = (c.cohort_month + INTERVAL '1 month')::date
      THEN c.customer_id END
    ) * 1.0 / NULLIF(cs.cohort_size, 0), 4)                     AS m1_retention_rate

, CASE
    WHEN (c.cohort_month + INTERVAL '2 months')::date
         > date_trunc('month', (SELECT MAX(created_at) FROM ecom.orders))::date
    THEN NULL
    ELSE ROUND(
      COUNT(DISTINCT CASE
        WHEN cam.active_month = (c.cohort_month + INTERVAL '2 months')::date
        THEN c.customer_id END
      ) * 1.0 / NULLIF(cs.cohort_size, 0), 4)
  END                                                            AS m2_retention_rate

, CASE
    WHEN (c.cohort_month + INTERVAL '3 months')::date
         > date_trunc('month', (SELECT MAX(created_at) FROM ecom.orders))::date
    THEN NULL  
    ELSE ROUND(
      COUNT(DISTINCT CASE
        WHEN cam.active_month = (c.cohort_month + INTERVAL '3 months')::date
        THEN c.customer_id END
      ) * 1.0 / NULLIF(cs.cohort_size, 0), 4)
  END                                                            AS m3_retention_rate

FROM cohorts c
JOIN cohort_sizes cs USING (cohort_month)
LEFT JOIN customer_active_months cam ON c.customer_id = cam.customer_id
GROUP BY c.cohort_month, cs.cohort_size
ORDER BY c.cohort_month;
