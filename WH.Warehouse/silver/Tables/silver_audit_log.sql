CREATE TABLE [silver].[silver_audit_log] (

	[RunId] varchar(100) NULL, 
	[TableName] varchar(200) NULL, 
	[StartTime] datetime2(3) NULL, 
	[EndTime] datetime2(3) NULL, 
	[Status] varchar(50) NULL, 
	[RowsInserted] int NULL, 
	[RowsUpdated] int NULL, 
	[RowsDeleted] int NULL, 
	[ErrorMessage] varchar(max) NULL
);