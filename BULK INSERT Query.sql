TRUNCATE TABLE Player_Attributes

--Only need to do this once for the DB
DROP EXTERNAL DATA SOURCE imt563ian_blobdatasource;

CREATE EXTERNAL DATA SOURCE imt563ian_blobdatasource
WITH ( 
TYPE = BLOB_STORAGE, 
LOCATION = 'https://imt563ian.blob.core.windows.net/soccer'
)

--BULK INSERT for each CSV, needs to be loaded in Blob 'soccer' container
BULK INSERT Player_Attributes
from 'Player_Attributes.csv'
WITH ( DATA_SOURCE = 'imt563ian_blobdatasource', FORMAT='CSV', FIRSTROW=2);



