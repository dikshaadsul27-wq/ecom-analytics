/* ### Q2 — Monthly Signup Cohort Retention

**Growth Head question:** *“For each month’s new signups, how many came back in months 1, 2, 3?”*

**Output:** `cohort_month, cohort_size, m1_retained, m2_retained, m3_retained, m1_retention_rate, m2_retention_rate, m3_retention_rate`

**Sanity check:** `cohort_size` for any month equals `count(distinct customer_id)` from `ecom.customers` where `date_trunc('month', created_at) = cohort_month`. All retention rates in `[0, 1]`.

**Pattern note:** `customer_first_order_month` CTE, then self-join on offset months. Customers who signed up but never ordered still count in `cohort_size` (contribute zero to retention). Exclude cancelled orders from “retained” — document that choice.

> *Censoring caveat: the dataset holds ~4 signup months, so m3 is only fully observable for the earliest cohort — later cohorts’ m2/m3 cells are censored, not zero. Show censored cells as blank/NULL (never 0%) and say so in your interpretation. Spotting this unprompted is a senior-analyst signal.*
*/
