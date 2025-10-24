
--Step 1 Analyze event distribution:
  
  SELECT event_type, COUNT(*) as Amount FROM dbo.[2019-Oct] GROUP BY event_type

--Step 2 Check time range:  
  SELECT MIN(event_time) AS Start_Time, MAX(event_time) AS End_Time FROM dbo.[2019-Oct]
  
--Step 3 Identify top 10 products/categories:
  SELECT TOP 10 category_code, COUNT(*) FROM dbo.[2019-Oct] GROUP BY category_code ORDER BY COUNT(*) DESC
  
--Step 4 User behavior patterns:
  SELECT user_id, COUNT(DISTINCT user_session) FROM dbo.[2019-Oct] GROUP BY user_id HAVING COUNT(DISTINCT user_session) > 1
  