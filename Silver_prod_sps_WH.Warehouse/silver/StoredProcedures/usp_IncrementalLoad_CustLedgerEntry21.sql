---  Exec silver.usp_IncrementalLoad_CustLedgerEntry21
---  Truncate table silver.CustLedgerEntry21
---  Select * from silver.CustLedgerEntry21



CREATE             PROCEDURE silver.usp_IncrementalLoad_CustLedgerEntry21
@RunId VARCHAR(100) = 'RunId'
AS
BEGIN

    ---------------------------------------------------
    -- AUDIT VARIABLES
    ---------------------------------------------------
   
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @EndTime DATETIME;

    DECLARE @Inserted INT = 0;
    DECLARE @Updated  INT = 0;
    DECLARE @Deleted  INT = 0;

    DECLARE @Status VARCHAR(50) = 'Success';
    DECLARE @ErrorMessage VARCHAR(MAX) = '';



    BEGIN TRY

        ---------------------------------------------------
        -- STEP 1: INSERT NEW RECORDS
        ---------------------------------------------------
        INSERT INTO [dwh].[silver].[CustLedgerEntry21] (
            [GlobalDimension1Code-23],
            [ExternalDocumentNo-63],
            [SalespersonCode-25],
            [Description-7],
            [CustomerNo-3],
            [$Company],
            [$DeliveredDateTime],
            [AppliestoDocType-34],
            [CustomerName-8],
            [CustomerPostingGroup-22],
            [DocumentDate-62],
            [DocumentNo-6],
            [DocumentType-5],
            [DueDate-37],
            [EntryNo-1],
            [InvDiscountLCY-20],
            [PostingDate-4],
            [ProfitLCY-19],
            [SalesLCY-18],
            [SelltoCustomerNo-21],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [TransactionNo-53],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[GlobalDimension1Code-23],
            s.[ExternalDocumentNo-63],
            s.[SalespersonCode-25],
            s.[Description-7],
            s.[CustomerNo-3],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[AppliestoDocType-34],
            s.[CustomerName-8],
            s.[CustomerPostingGroup-22],
            TRY_CONVERT(DATE, NULLIF(s.[DocumentDate-62], '')),
            s.[DocumentNo-6],
            s.[DocumentType-5],
            TRY_CONVERT(DATE, NULLIF(s.[DueDate-37], '')),
            s.[EntryNo-1],
            s.[InvDiscountLCY-20],
            TRY_CONVERT(DATE, NULLIF(s.[PostingDate-4], '')),
            s.[ProfitLCY-19],
            s.[SalesLCY-18],
            s.[SelltoCustomerNo-21],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[TransactionNo-53],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP
        FROM [Bronze_2].[dbo].[CustLedgerEntry21] s
        LEFT JOIN [dwh].[silver].[CustLedgerEntry21] t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[GlobalDimension1Code-23] = s.[GlobalDimension1Code-23],
            t.[ExternalDocumentNo-63] = s.[ExternalDocumentNo-63],
            t.[SalespersonCode-25] = s.[SalespersonCode-25],
            t.[Description-7] = s.[Description-7],
            t.[CustomerNo-3] = s.[CustomerNo-3],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[AppliestoDocType-34] = s.[AppliestoDocType-34],
            t.[CustomerName-8] = s.[CustomerName-8],
            t.[CustomerPostingGroup-22] = s.[CustomerPostingGroup-22],
            t.[DocumentDate-62] = TRY_CONVERT(DATE, NULLIF(s.[DocumentDate-62], '')),
            t.[DocumentNo-6] = s.[DocumentNo-6],
            t.[DocumentType-5] = s.[DocumentType-5],
            t.[DueDate-37] = TRY_CONVERT(DATE, NULLIF(s.[DueDate-37], '')),
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[InvDiscountLCY-20] = s.[InvDiscountLCY-20],
            t.[PostingDate-4] = TRY_CONVERT(DATE, NULLIF(s.[PostingDate-4], '')),
            t.[ProfitLCY-19] = s.[ProfitLCY-19],
            t.[SalesLCY-18] = s.[SalesLCY-18],
            t.[SelltoCustomerNo-21] = s.[SelltoCustomerNo-21],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[TransactionNo-53] = s.[TransactionNo-53],
            t.[timestamp-0] = s.[timestamp-0],
            UpdateDate = CURRENT_TIMESTAMP
        FROM [dwh].[silver].[CustLedgerEntry21] t
        JOIN [Bronze_2].[dbo].[CustLedgerEntry21] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[ProfitLCY-19], 0) <> ISNULL(s.[ProfitLCY-19], 0) or 
            ISNULL(t.[SalesLCY-18], 0) <> ISNULL(s.[SalesLCY-18], 0);

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM [dwh].[silver].[CustLedgerEntry21] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[CustLedgerEntry21] s
            WHERE s.[systemId-2000000000] = t.[systemId-2000000000]
        ); 

        SET @Deleted = @@ROWCOUNT;

    END TRY

    BEGIN CATCH

        SET @Status = 'Failed';
        SET @ErrorMessage = ERROR_MESSAGE();

    END CATCH

    ---------------------------------------------------
    -- AUDIT INSERT
    ---------------------------------------------------
    SET @EndTime = GETDATE();

    INSERT INTO [dwh].[silver].[silver_audit_log]
    (
        RunId,
        TableName,
        StartTime,
        EndTime,
        Status,
        RowsInserted,
        RowsUpdated,
        RowsDeleted,
        ErrorMessage
    )
    VALUES
    (
        @RunId,
        'CustLedgerEntry21',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;