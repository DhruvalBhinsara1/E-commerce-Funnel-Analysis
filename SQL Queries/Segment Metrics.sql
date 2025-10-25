-- Segment metrics by category/brand/user type

SELECT category_code, COUNT(*) AS events, SUM(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) AS purchases
FROM dbo.[2019-Oct]
GROUP BY category_code
ORDER BY purchases DESC