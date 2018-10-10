--Player table creation
--Issues with Bulk insert for birthday column
/*CREATE TABLE Player(
	id int primary key NOT NULL, player_api_id int NOT NULL, player_name nvarchar(50) NOT NULL, player_fifa_api_id varchar(100) NOT NULL, birthday datetime2 (7) NOT NULL,
	height float,
	weight int);

BULK INSERT Player
FROM 'C:\Users\SONY LAPTOP\Desktop\Fall 2018\IMT 563 ADBMS\Project Tables\Player.csv'
WITH
(
    FIRSTROW = 7,
	FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
	TABLOCK
)*/

Select * from Player;

--Country table creation
CREATE TABLE Country(id int foreign key references Player(id) NOT NULL, name char(100));

BULK INSERT Country
FROM 'C:\Users\SONY LAPTOP\Desktop\Fall 2018\IMT 563 ADBMS\Project Tables\Country.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

Select * from Country;

--League table creation
CREATE TABLE League(id int foreign key references Player(id) NOT NULL, country_id varchar(20), name char(200));

BULK INSERT League
FROM 'C:\Users\SONY LAPTOP\Desktop\Fall 2018\IMT 563 ADBMS\Project Tables\League.csv'
WITH
(
    FIRSTROW = 3,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

Select * from League;

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
FROM 'C:\Users\SONY LAPTOP\Desktop\Fall 2018\IMT 563 ADBMS\Project Tables\Player_Attributes.csv'
WITH
(
    FIRSTROW = 42,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n'
)

Select * from Player_Attributes;