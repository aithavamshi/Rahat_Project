---  Exec WH.dbo.usp_IncrementalLoad_CustLedgerEntry21
---  Truncate table silver.CustLedgerEntry21
---  Select * from silver.CustLedgerEntry21



CREATE         PROCEDURE silver.usp_IncrementalLoad_CustLedgerEntry21

@RunId VARCHAR(100)
AS
BEGIN

    ---------------------------------------------------
    -- AUDIT VARIABLES
    ---------------------------------------------------
    --DECLARE @RunId VARCHAR(100);
    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @EndTime DATETIME;

    DECLARE @Inserted INT = 0;
    DECLARE @Updated  INT = 0;
    DECLARE @Deleted  INT = 0;

    DECLARE @Status VARCHAR(50) = 'Success';
    DECLARE @ErrorMessage VARCHAR(MAX) = '';

    --DECLARE @FilesProcessed INT = 0;

    --SET @RunId =
    --'RUN_' + FORMAT(GETDATE(),'yyyyMMdd_HHmmss');

    BEGIN TRY

        ---------------------------------------------------
        -- STEP 1: INSERT NEW RECORDS
        ---------------------------------------------------
        INSERT INTO [WH].[silver].[CustLedgerEntry21] (
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
        FROM [test_lh].[dbo].[CustLedgerEntry21] s
        LEFT JOIN [WH].[silver].[CustLedgerEntry21] t
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
        FROM [WH].[silver].[CustLedgerEntry21] t
        JOIN [test_lh].[dbo].[CustLedgerEntry21] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
        ISNULL(t.[GlobalDimension1Code-23], '') <> ISNULL(s.[GlobalDimension1Code-23], '') OR
        ISNULL(t.[ExternalDocumentNo-63], '') <> ISNULL(s.[ExternalDocumentNo-63], '') OR
        ISNULL(t.[SalespersonCode-25], '') <> ISNULL(s.[SalespersonCode-25], '') OR
        ISNULL(t.[Description-7], '') <> ISNULL(s.[Description-7], '') OR
        ISNULL(t.[CustomerNo-3], '') <> ISNULL(s.[CustomerNo-3], '') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
        ISNULL(t.[AppliestoDocType-34], '') <> ISNULL(s.[AppliestoDocType-34], '') OR
        ISNULL(t.[CustomerName-8], '') <> ISNULL(s.[CustomerName-8], '') OR
        ISNULL(t.[CustomerPostingGroup-22], '') <> ISNULL(s.[CustomerPostingGroup-22], '') OR
        ISNULL(t.[DocumentDate-62], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[DocumentDate-62], '')), '1900-01-01') OR
        ISNULL(t.[DocumentNo-6], '') <> ISNULL(s.[DocumentNo-6], '') OR
        ISNULL(t.[DocumentType-5], '') <> ISNULL(s.[DocumentType-5], '') OR
        ISNULL(t.[DueDate-37], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[DueDate-37], '')), '1900-01-01') OR
        ISNULL(t.[EntryNo-1], -1) <> ISNULL(s.[EntryNo-1], -1) OR
        ISNULL(t.[InvDiscountLCY-20], 0) <> ISNULL(s.[InvDiscountLCY-20], 0) OR
        ISNULL(t.[PostingDate-4], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[PostingDate-4], '')), '1900-01-01') OR
        ISNULL(t.[ProfitLCY-19], 0) <> ISNULL(s.[ProfitLCY-19], 0) OR
        ISNULL(t.[SalesLCY-18], 0) <> ISNULL(s.[SalesLCY-18], 0) OR
        ISNULL(t.[SelltoCustomerNo-21], '') <> ISNULL(s.[SelltoCustomerNo-21], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
        ISNULL(t.[TransactionNo-53], -1) <> ISNULL(s.[TransactionNo-53], -1) OR
        ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM [WH].[silver].[CustLedgerEntry21]
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000]
            FROM [test_lh].[dbo].[CustLedgerEntry21]
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

    INSERT INTO [WH].[silver].[silver_audit_log]
    (
        RunId,
        TableName,
        StartTime,
        EndTime,
        Status,
        RowsInserted,
        RowsUpdated,
        RowsDeleted,
        --FilesProcessed,
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
        --@FilesProcessed,
        @ErrorMessage
    );

END;