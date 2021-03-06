-- Output columns for a given table
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'MATCH_new_PK_SI'


-- Output all CONSTRAINTS for a given table (quoted)
SELECT OBJECT_NAME(object_id) AS ConstraintName,
        OBJECT_NAME(parent_object_id) AS TableName,
        type_desc AS ConstraintType
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT' AND OBJECT_NAME(parent_object_id) = 'MATCH_new_PK_SI'


-- Output all indexes, the tables they're on, and associated columns
SELECT 
     TableName = t.name,
     IndexName = ind.name,
     ColumnName = col.name,
     ind.*,
     ic.*,
     col.* 
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.index_columns ic ON  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
INNER JOIN 
     sys.columns col ON ic.object_id = col.object_id and ic.column_id = col.column_id 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
WHERE 
     ind.is_primary_key = 0 
     AND ind.is_unique = 0 
     AND ind.is_unique_constraint = 0 
     AND t.is_ms_shipped = 0 
ORDER BY 
     t.name, ind.name