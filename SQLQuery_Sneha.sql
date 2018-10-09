--Player table creation
--Data imported from csv, create statement works, but the bulk insert does outputs an error
/*CREATE TABLE Player(
	id int primary key NOT NULL, player_api_id int NOT NULL, player_name nvarchar(50) NOT NULL, player_fifa_api_id varchar(100) NOT NULL, birthday datetime2,
	height float,
	weight int);

BULK INSERT Player
FROM 'C:\Users\SONY LAPTOP\Desktop\Fall 2018\IMT 563 ADBMS\Project Tables\Player.csv'
WITH
(
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n'   --Use to shift the control to next row
);*/

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