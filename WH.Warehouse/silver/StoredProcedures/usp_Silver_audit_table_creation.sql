--EXEC silver.usp_Silver_audit_table_creation 

Create   PROCEDURE silver.usp_Silver_audit_table_creation 
as 
begin 

CREATE TABLE silver.silver_audit_log (
    RunId            VARCHAR(100),
    TableName        VARCHAR(200),
    StartTime        DATETIME2(3),
    EndTime          DATETIME2(3),
    Status           VARCHAR(50),
    RowsInserted     INT,
    RowsUpdated      INT,
    RowsDeleted      INT,
    --FilesProcessed   INT,
    ErrorMessage     VARCHAR(MAX)
);



end