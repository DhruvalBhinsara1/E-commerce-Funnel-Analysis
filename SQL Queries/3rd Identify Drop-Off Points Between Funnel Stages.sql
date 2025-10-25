-- Identify Drop-Off Points Between Funnel Stages

WITH session_flags AS (
    SELECT user_session,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0 END) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0 END) AS carted,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchased
    FROM dbo.[2019-Oct]
    GROUP BY user_session
)
SELECT
    COUNT(*) AS total_sessions,
    SUM(CASE WHEN viewed = 1 AND carted = 0 THEN 1 ELSE 0 END) AS drop_off_after_view,
    SUM(CASE WHEN carted = 1 AND purchased = 0 THEN 1 ELSE 0 END) AS drop_off_after_cart
FROM session_flags;