CREATE TABLE [dbo].[silver_audit_log] (

	[RunId] varchar(100) NULL, 
	[TableName] varchar(200) NULL, 
	[StartTime] datetime2(6) NULL, 
	[EndTime] datetime2(6) NULL, 
	[Status] varchar(50) NULL, 
	[RowsInserted] int NULL, 
	[RowsUpdated] int NULL, 
	[RowsDeleted] int NULL, 
	[FilesProcessed] int NULL, 
	[ErrorMessage] varchar(max) NULL
);