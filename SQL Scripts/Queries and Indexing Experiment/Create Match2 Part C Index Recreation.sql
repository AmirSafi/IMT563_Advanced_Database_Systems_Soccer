CREATE TABLE Match2 (
	[id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[league_id] [int] NOT NULL,
	[season] [nvarchar](50) NOT NULL,
	[stage] [int] NOT NULL,
	[date] [date] NOT NULL,
	[match_api_id] [int] NOT NULL,
	[home_team_api_id] [int] NOT NULL,
	[away_team_api_id] [int] NOT NULL,
	[home_team_goal] [int] NOT NULL,
	[away_team_goal] [int] NOT NULL,
	[home_player_X1] [nvarchar](50) NULL,
	[home_player_X2] [nvarchar](50) NULL,
	[home_player_X3] [nvarchar](50) NULL,
	[home_player_X4] [nvarchar](50) NULL,
	[home_player_X5] [nvarchar](50) NULL,
	[home_player_X6] [nvarchar](50) NULL,
	[home_player_X7] [nvarchar](50) NULL,
	[home_player_X8] [nvarchar](50) NULL,
	[home_player_X9] [nvarchar](50) NULL,
	[home_player_X10] [nvarchar](50) NULL,
	[home_player_X11] [nvarchar](50) NULL,
	[away_player_X1] [nvarchar](50) NULL,
	[away_player_X2] [nvarchar](50) NULL,
	[away_player_X3] [nvarchar](50) NULL,
	[away_player_X4] [nvarchar](50) NULL,
	[away_player_X5] [nvarchar](50) NULL,
	[away_player_X6] [nvarchar](50) NULL,
	[away_player_X7] [nvarchar](50) NULL,
	[away_player_X8] [nvarchar](50) NULL,
	[away_player_X9] [nvarchar](50) NULL,
	[away_player_X10] [nvarchar](50) NULL,
	[away_player_X11] [nvarchar](50) NULL,
	[home_player_Y1] [nvarchar](50) NULL,
	[home_player_Y2] [nvarchar](50) NULL,
	[home_player_Y3] [nvarchar](50) NULL,
	[home_player_Y4] [nvarchar](50) NULL,
	[home_player_Y5] [nvarchar](50) NULL,
	[home_player_Y6] [nvarchar](50) NULL,
	[home_player_Y7] [nvarchar](50) NULL,
	[home_player_Y8] [nvarchar](50) NULL,
	[home_player_Y9] [nvarchar](50) NULL,
	[home_player_Y10] [nvarchar](50) NULL,
	[home_player_Y11] [nvarchar](50) NULL,
	[away_player_Y1] [nvarchar](50) NULL,
	[away_player_Y2] [nvarchar](50) NULL,
	[away_player_Y3] [nvarchar](50) NULL,
	[away_player_Y4] [nvarchar](50) NULL,
	[away_player_Y5] [nvarchar](50) NULL,
	[away_player_Y6] [nvarchar](50) NULL,
	[away_player_Y7] [nvarchar](50) NULL,
	[away_player_Y8] [nvarchar](50) NULL,
	[away_player_Y9] [nvarchar](50) NULL,
	[away_player_Y10] [nvarchar](50) NULL,
	[away_player_Y11] [nvarchar](50) NULL,
	[home_player_1] [nvarchar](50) NULL,
	[home_player_2] [nvarchar](50) NULL,
	[home_player_3] [nvarchar](50) NULL,
	[home_player_4] [nvarchar](50) NULL,
	[home_player_5] [nvarchar](50) NULL,
	[home_player_6] [nvarchar](50) NULL,
	[home_player_7] [nvarchar](50) NULL,
	[home_player_8] [nvarchar](50) NULL,
	[home_player_9] [nvarchar](50) NULL,
	[home_player_10] [nvarchar](50) NULL,
	[home_player_11] [nvarchar](50) NULL,
	[away_player_1] [nvarchar](50) NULL,
	[away_player_2] [nvarchar](50) NULL,
	[away_player_3] [nvarchar](50) NULL,
	[away_player_4] [nvarchar](50) NULL,
	[away_player_5] [nvarchar](50) NULL,
	[away_player_6] [nvarchar](50) NULL,
	[away_player_7] [nvarchar](50) NULL,
	[away_player_8] [nvarchar](50) NULL,
	[away_player_9] [nvarchar](50) NULL,
	[away_player_10] [nvarchar](50) NULL,
	[away_player_11] [nvarchar](50) NULL,
	[goal] [varchar](max) NULL,
	[shoton] [varchar](max) NULL,
	[shotoff] [varchar](max) NULL,
	[foulcommit] [varchar](max) NULL,
	[card] [varchar](max) NULL,
	[cross] [varchar](max) NULL,
	[corner] [varchar](max) NULL,
	[possession] [varchar](max) NULL,
	[B365H] [float] NULL,
	[B365D] [float] NULL,
	[B365A] [float] NULL,
	[BWH] [float] NULL,
	[BWD] [float] NULL,
	[BWA] [float] NULL,
	[IWH] [float] NULL,
	[IWD] [float] NULL,
	[IWA] [float] NULL,
	[LBH] [float] NULL,
	[LBD] [float] NULL,
	[LBA] [float] NULL,
	[PSH] [nvarchar](50) NULL,
	[PSD] [nvarchar](50) NULL,
	[PSA] [nvarchar](50) NULL,
	[WHH] [float] NULL,
	[WHD] [float] NULL,
	[WHA] [float] NULL,
	[SJH] [float] NULL,
	[SJD] [float] NULL,
	[SJA] [float] NULL,
	[VCH] [float] NULL,
	[VCD] [float] NULL,
	[VCA] [float] NULL,
	[GBH] [float] NULL,
	[GBD] [float] NULL,
	[GBA] [float] NULL,
	[BSH] [float] NULL,
	[BSD] [float] NULL,
	[BSA] [float] NULL)


INSERT INTO Match2 
SELECT *
FROM Match WITH (NOLOCK)
WHERE date < '2010-01-31'

SET STATISTICS TIME ON
GO
SELECT *
FROM Match2
SET STATISTICS TIME OFF
GO

SELECT COUNT(*)
FROM Match2

-- 2010-01-31  20%
-- 2012-05-13  50%
-- 2014-12-13  80%

-- Code for Part C #4
SET STATISTICS TIME ON
DELETE FROM Match2
WHERE date < '2014-12-13';  
GO
CREATE INDEX idx_mm_3 ON Match2 (date)
SET STATISTICS TIME OFF
GO