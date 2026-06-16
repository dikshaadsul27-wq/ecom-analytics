/* Q3 — Funnel Conversion by Acquisition Channel

**CMO question:** *“Where in the funnel does each channel’s traffic leak — browse, cart, checkout, or payment?”*

**Output:** `channel, sessions, product_view_sessions, add_to_cart_sessions, begin_checkout_sessions, purchase_sessions, view_to_cart_rate, cart_to_checkout_rate, checkout_to_purchase_rate, session_to_purchase_rate`

**Sanity check:** Every rate `∈ [0, 1]`. Stage counts are monotonically non-increasing per channel: `sessions >= product_view_sessions >= add_to_cart_sessions >= begin_checkout_sessions >= purchase_sessions`.

**Pattern note:** Stages come from `ecom.session_events` (`event_type` values `product_view`, `add_to_cart`, `begin_checkout`, `purchase`). Use `count(distinct session_id) filter (where event_type = ...)` per stage — one pass, no row explosion from 5 left joins. A session’s channel comes from the `ecom.session_channels` view (first-touch), or derive the **most recent** touch from `ecom.attribution_touches` yourself — either is defensible; document the choice. Sessions with no attribution touch bucket as `'direct'`, do not drop.

> *Note: event instrumentation launched on **2026-04-19** — there are zero events before that date. Sessions earlier than that are uninstrumented, not inactive; restrict the funnel to sessions starting on or after launch, and say so in your interpretation rather than reporting a fake 0% conversion for older traffic.*
*/
