/* Test Query for Part 3 */
--Average home goals scored by Swiss teams during the 2015/2016 season
SELECT t.team_long_name, AVG(home_team_goal) AS 'Average Goals Scored'
FROM Team t
JOIN dbo.Match m ON t.team_api_id = m.home_team_api_id
WHERE m.season = '2015/2016' AND m.country_id = 24558
GROUP BY t.team_long_name
