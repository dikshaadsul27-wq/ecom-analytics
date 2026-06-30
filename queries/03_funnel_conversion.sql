/* Q3 — Funnel Conversion by Acquisition Channel

**CMO question:** *“Where in the funnel does each channel’s traffic leak — browse, cart, checkout, or payment?”*

**Output:** `channel, sessions, product_view_sessions, add_to_cart_sessions, begin_checkout_sessions, purchase_sessions, view_to_cart_rate, cart_to_checkout_rate, checkout_to_purchase_rate, session_to_purchase_rate`

**Sanity check:** Every rate `∈ [0, 1]`. Stage counts are monotonically non-increasing per channel: `sessions >= product_view_sessions >= add_to_cart_sessions >= begin_checkout_sessions >= purchase_sessions`.

**Pattern note:** Stages come from `ecom.session_events` (`event_type` values `product_view`, `add_to_cart`, `begin_checkout`, `purchase`). Use `count(distinct session_id) filter (where event_type = ...)` per stage — one pass, no row explosion from 5 left joins. A session’s channel comes from the `ecom.session_channels` view (first-touch), or derive the **most recent** touch from `ecom.attribution_touches` yourself — either is defensible; document the choice. Sessions with no attribution touch bucket as `'direct'`, do not drop.

> *Note: event instrumentation launched on **2026-04-19** — there are zero events before that date. Sessions earlier than that are uninstrumented, not inactive; restrict the funnel to sessions starting on or after launch, and say so in your interpretation rather than reporting a fake 0% conversion for older traffic.*
*/
WITH
instrumented_sessions AS (
  SELECT DISTINCT session_id
  FROM ecom.session_events
  WHERE occurred_at >= '2026-04-19'
),

session_channel AS (
  SELECT
    s.session_id,
    COALESCE(
      (SELECT at.channel
       FROM ecom.attribution_touches at
       WHERE at.session_id = s.session_id
       ORDER BY at.touched_at DESC
       LIMIT 1),
      'direct'
    ) AS channel
  FROM instrumented_sessions s
),

funnel AS (
  SELECT
    sc.channel,

    COUNT(DISTINCT se.session_id) AS sessions,

    COUNT(DISTINCT se.session_id) FILTER (WHERE se.event_type = 'product_view')   AS product_view_sessions,
    COUNT(DISTINCT se.session_id) FILTER (WHERE se.event_type = 'add_to_cart')    AS add_to_cart_sessions,
    COUNT(DISTINCT se.session_id) FILTER (WHERE se.event_type = 'begin_checkout') AS begin_checkout_sessions,
    COUNT(DISTINCT se.session_id) FILTER (WHERE se.event_type = 'purchase')       AS purchase_sessions

  FROM ecom.session_events se
  JOIN session_channel sc USING (session_id)
  WHERE se.occurred_at >= '2026-04-19'
  GROUP BY sc.channel
)

SELECT
  channel,
  sessions,
  product_view_sessions,
  add_to_cart_sessions,
  begin_checkout_sessions,
  purchase_sessions,

  ROUND(add_to_cart_sessions    * 1.0 / NULLIF(product_view_sessions,   0), 4) AS view_to_cart_rate,
  ROUND(begin_checkout_sessions * 1.0 / NULLIF(add_to_cart_sessions,    0), 4) AS cart_to_checkout_rate,
  ROUND(purchase_sessions       * 1.0 / NULLIF(begin_checkout_sessions, 0), 4) AS checkout_to_purchase_rate,

  ROUND(purchase_sessions       * 1.0 / NULLIF(sessions,                0), 4) AS session_to_purchase_rate

FROM funnel
ORDER BY sessions DESC;
