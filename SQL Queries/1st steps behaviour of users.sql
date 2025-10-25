-- Assign Sequence Numbers to Events Within Each Session

USE Funnel_Purchases
GO

WITH SessionEvents AS (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY user_session ORDER BY event_time) AS step
    FROM dbo.[2019-Oct]
)
SELECT * FROM SessionEvents WHERE user_session = '75cc2bbb-f9b6-4333-b949-7a6d6b7ecdae';