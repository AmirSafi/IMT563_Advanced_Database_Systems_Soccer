/* Player Attributes Table */

DROP TABLE Player_Attributes

CREATE TABLE Player_Attributes (
id int CONSTRAINT PK_Player_Attributes PRIMARY KEY,
player_fifa_api_id int NOT NULL,
player_api_id int NOT NULL,
date datetime NOT NULL,
overall_rating int NULL,
potential int NULL,
preferred_foot varchar(5) NULL,
attacking_work_rate varchar(6) NULL,
defensive_work_rate nvarchar(7) NULL,
crossing int NULL,
finishing int NULL,
heading_accuracy int NULL,
short_passing int NULL,
volleys int NULL,
dribbling int NULL,
curve int NULL,
free_kick_accuracy int NULL,
long_passing int NULL,
ball_control int NULL,
acceleration int NULL,
sprint_speed int NULL,
agility int NULL,
reactions int NULL,
balance int NULL,
shot_power int NULL,
jumping int NULL,
stamina int NULL,
strength int NULL,
long_shots int NULL,
aggression int NULL,
interceptions int NULL,
positioning int NULL,
vision int NULL,
penalties int NULL,
marking int NULL,
standing_tackle int NULL,
sliding_tackle int NULL,
gk_diving int NULL,
gk_handling int NULL,
gk_kicking int NULL,
gk_positioning int NULL,
gk_reflexes int NULL
)

BULK INSERT Player_Attributes --if someone has the permissions to make this work let me know, if not test insert example is below
FROM 'C:\Player_Attributes.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n'
)

INSERT INTO Player_Attributes VALUES (
1,218353,505942,'2016-02-18 00:00:00',67,71,'right','medium','medium',49,44,71,61,44,51,45,39,64,49,60,64,59,47,65,55,58,54,76,35,71,70,45,54,48,65,69,69,6,11,10,8,8)

SELECT * FROM Player_Attributes