CREATE TABLE [gold].[SalesDetails] (

	[name] varchar(max) NULL, 
	[category_name] varchar(max) NULL, 
	[ship_to_city] varchar(max) NULL, 
	[ship_to_state] varchar(max) NULL, 
	[posting_date] date NULL, 
	[document_no] varchar(max) NULL, 
	[customer_name] varchar(max) NULL, 
	[item_no] varchar(max) NULL, 
	[item_description] varchar(max) NULL, 
	[cases_sold] float NULL, 
	[sales] float NULL, 
	[gross_profit] float NULL, 
	[gross_margin] float NULL, 
	[InsertDate] datetime2(3) NULL, 
	[UpdateDate] datetime2(3) NULL
);