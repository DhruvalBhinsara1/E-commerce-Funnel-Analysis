-- Map Funnel Stages for Each Session

WITH session_flags AS (
    SELECT user_session,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
    FROM dbo.[2019-Oct]
    GROUP BY user_session
)
SELECT
    SUM(viewed) AS views,
    SUM(carted) AS carts,
    SUM(CASE WHEN carted = 1 AND purchased = 1 THEN 1 ELSE 0 END) AS purchases_with_cart
FROM session_flags;