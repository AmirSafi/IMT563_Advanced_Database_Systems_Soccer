-- Get thresholds (change quartile limit)
SELECT COUNT(*)
FROM (
SELECT NTILE(10) over (ORDER BY date) as quartile, home_team_goal, date
FROM Match ) t
WHERE t.quartile <= 2

-- 2010-01-31  20%
-- 2012-05-13  50%
-- 2014-12-13  80%

-- Set a threshold and run your query
SET STATISTICS TIME ON;
GO
SELECT COUNT(*)
FROM Match
WHERE date <= CONVERT(DATE, '2010-01-31')
SET STATISTICS TIME OFF;
GO



