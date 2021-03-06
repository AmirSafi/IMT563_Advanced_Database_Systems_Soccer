/****** Object:  Table [dbo].[Match]    Script Date: 10/9/2018 10:42:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Match](
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
	[BSA] [float] NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


