USE Funnel_Purchases
GO

SELECT SUM(price) FROM dbo.[2019-Oct] WHERE event_type = 'purchase'