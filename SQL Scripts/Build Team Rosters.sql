DECLARE @sql nvarchar(max)
SET @sql = 'select team.team_api_id as team_api_id, p.player_api_id, p.player_name, team.team_long_name, t.year
from ( '
DECLARE @cnt INT = 1;
WHILE @cnt < 12
BEGIN
	set @sql = @sql + 'SELECT home_player_'+ CONVERT(varchar, @cnt) +' as pid, home_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
					   FROM Match
					   WHERE home_player_'+ CONVERT(varchar, @cnt) +' is not null
					   GROUP BY home_player_'+ CONVERT(varchar, @cnt) +', DATEPART(year, date), home_team_api_id
					   UNION ';
	set @sql = @sql + 'SELECT away_player_'+ CONVERT(varchar, @cnt) +' as pid, away_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
					   FROM Match
					   WHERE away_player_'+ CONVERT(varchar, @cnt) +' is not null
					   GROUP BY away_player_'+ CONVERT(varchar, @cnt) +', DATEPART(year, date), away_team_api_id
					   UNION ';
	set @cnt = @cnt + 1;
END
set @sql = left(@sql, len(@sql)-6) + ') t JOIN Player p on t.pid = p.Player_api_id
										  JOIN Team team on team_api_id = team.team_api_id'
exec sp_executesql @sql



select team.team_api_id as team_api_id, p.player_api_id, p.player_name, team.team_long_name, t.year
from (
select home_player_1 as pid, home_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_1 is not null
group by home_player_1, DATEPART(year, date), home_team_api_id
UNION 
select home_player_2 as pid, home_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_2 is not null
group by home_player_2, DATEPART(year, date), home_team_api_id
UNION
select home_player_3 as pid, home_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where home_player_3 is not null
group by home_player_3, DATEPART(year, date), home_team_api_id
UNION
select away_player_2 as pid, away_team_api_id, DATEPART(year, date) as year, COUNT(*) cnt
from Match
where away_player_2 is not null
group by away_player_2, DATEPART(year, date), away_team_api_id
) t
JOIN Player p on t.pid = p.Player_api_id
JOIN Team team on team_api_id = team.team_api_id


declare @sql nvarchar(max)
--declare @team int = 9987
set @sql = 'SELECT DISTINCT t.teamID, p.id playerID, p.player_name FROM ('
DECLARE @cnt INT = 1;
WHILE @cnt < 12
BEGIN
   set @sql = @sql + 'SELECT home_team_api_id teamID, home_player_' + CONVERT(varchar, @cnt) + 
   ' pid FROM Match UNION '; -- WHERE home_team_api_id = ' + CONVERT(varchar, @team) + '
   set @sql = @sql + 'SELECT away_team_api_id teamID, away_player_' + CONVERT(varchar, @cnt) + 
   ' pid FROM Match UNION '; --  WHERE away_team_api_id = ' + CONVERT(varchar, @team) + '
   SET @cnt = @cnt + 1;
END    -- Remove " UNION "          -- Join with Player to get player names 
set @sql = left(@sql, len(@sql)-6) + ') t INNER JOIN Player p ON t.pid = p.id ORDER BY t.teamID DESC'
exec sp_executesql @sql

SELECT * FROM Team