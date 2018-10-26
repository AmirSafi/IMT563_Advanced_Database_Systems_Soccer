------------------------
-- Build ROSTER Table 
--
-- team_id | player_id | player_name | ...
-- <api_id>  <id>
------------------------
-- Build SQL statement from 'home_player_%' and 'away_player_%' fields 1 ~ 11
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

