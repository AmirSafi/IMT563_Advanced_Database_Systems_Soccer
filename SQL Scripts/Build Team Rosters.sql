DECLARE @sql nvarchar(max)
SET @sql = 'CREATE VIEW "Team Rosters" AS SELECT DISTINCT t.year, t.team_api_id, 
									           p.player_api_id, p.player_name, team.team_long_name
										  FROM ( '
DECLARE @cnt INT = 1;
WHILE @cnt < 12
BEGIN
	set @sql = @sql + 'SELECT home_player_'+ CONVERT(varchar, @cnt) +' as pid, home_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
					   FROM Match
					   WHERE home_player_'+ CONVERT(varchar, @cnt) +' is not null
					   GROUP BY home_player_'+ CONVERT(varchar, @cnt) +', DATEPART(year, date), home_team_api_id
					   UNION ';
	set @sql = @sql + 'SELECT away_player_'+ CONVERT(varchar, @cnt) +' as pid, away_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
					   FROM Match
					   WHERE away_player_'+ CONVERT(varchar, @cnt) +' is not null
					   GROUP BY away_player_'+ CONVERT(varchar, @cnt) +', DATEPART(year, date), away_team_api_id
					   UNION ';
	set @cnt = @cnt + 1;
END
set @sql = left(@sql, len(@sql)-6) + ') t JOIN Player p on t.pid = p.Player_api_id
										  JOIN Team team on t.team_api_id = team.team_api_id'
exec sp_executesql @sql


--
-- The above streamlines the following (incomplete) SQL pattern:

WITH A as (
select t.team_api_id, p.player_api_id, p.player_name, team.team_long_name, t.year
from (
select home_player_1 as pid, home_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_1 is not null
group by home_player_1, DATEPART(year, date), home_team_api_id
UNION 
select home_player_2 as pid, home_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_2 is not null
group by home_player_2, DATEPART(year, date), home_team_api_id
UNION
select home_player_3 as pid, home_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_3 is not null
group by home_player_3, DATEPART(year, date), home_team_api_id
UNION
select away_player_2 as pid, away_team_api_id as team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where away_player_2 is not null
group by away_player_2, DATEPART(year, date), away_team_api_id
) t
JOIN Player p on t.pid = p.Player_api_id
JOIN Team team on t.team_api_id = team.team_api_id
)
SELECT *
FROM A
WHERE A.player_name = 'Aaron Hughes'

