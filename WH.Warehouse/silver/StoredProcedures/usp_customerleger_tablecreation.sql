-- exec usp_customerleger_tablecreation
Create   PROCEDURE silver.usp_customerleger_tablecreation
as 
BEGIN
--create SCHEMA silver

Create TABLE silver.[CustLedgerEntry21] (

[GlobalDimension1Code-23]	[varchar](MAX),
[ExternalDocumentNo-63]	[varchar](MAX),
[SalespersonCode-25]	[varchar](MAX),
[Description-7]	[varchar](MAX),
[CustomerNo-3]	[varchar](MAX),
[$Company]	[varchar](MAX),
[$DeliveredDateTime]	[datetime2](3),
[AppliestoDocType-34]	[varchar](MAX),
[CustomerName-8]	[varchar](MAX),
[CustomerPostingGroup-22]	[varchar](MAX),
[DocumentDate-62]	[date],
[DocumentNo-6]	[varchar](MAX),
[DocumentType-5]	[varchar](MAX),
[DueDate-37]	[date],
[EntryNo-1]	[int],
[InvDiscountLCY-20]	[real],
[PostingDate-4]	[date],
[ProfitLCY-19]	[real],
[SalesLCY-18]	[real],
[SelltoCustomerNo-21]	[varchar](MAX),
[SystemCreatedAt-2000000001]	[datetime2](3),
[SystemCreatedBy-2000000002]	[varchar](MAX),
[SystemModifiedAt-2000000003]	[datetime2](3),
[TransactionNo-53]	int,
[systemId-2000000000]	[varchar](MAX),
[timestamp-0]	[int],
[InsertDate]	[datetime2](3),
[UpdateDate]	[datetime2](3)

)

END