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