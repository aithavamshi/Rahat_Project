---  EXEC silver.usp_IncrementalLoad_VendorLedgerEntry25
---  SELECT * FROM silver.VendorLedgerEntry25
---  TRUNCATE TABLE silver.VendorLedgerEntry25


CREATE             PROCEDURE silver.usp_IncrementalLoad_VendorLedgerEntry25
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
        INSERT INTO silver.VendorLedgerEntry25 (
            [AppliestoID-47],
            [AppliestoExtDocNo-173],
            [InvoiceReceivedDate-175],
            [CreditorNo-170],
            [GlobalDimension1Code-23],
            [ClosedbyCurrencyCode-65],
            [CurrencyCode-11],
            [BalAccountNo-52],
            [JournalBatchName-49],
            [JournalTemplName-48],
            [PmtDiscToleranceDate-78],
            [PmtDiscountDate-38],
            [NoSeries-64],
            [ExternalDocumentNo-63],
            [PaymentMethodCode-172],
            [PurchaserCode-25],
            [ClosedatDate-45],
            [SourceCode-28],
            [VendorNo-3],
            [$Company],
            [$DeliveredDateTime],
            [AcceptedPaymentTolerance-81],
            [AcceptedPmtDiscTolerance-82],
            [AdjustedCurrencyFactor-73],
            [AmounttoApply-84],
            [AppliestoDocType-34],
            [ApplyingEntry-86],
            [BalAccountType-51],
            [BuyfromVendorNo-21],
            [ClosedbyAmount-46],
            [ClosedbyAmountLCY-54],
            [ClosedbyCurrencyAmount-66],
            [ClosedbyEntryNo-44],
            [Description-7],
            [DimensionSetID-480],
            [DocumentDate-62],
            [DocumentNo-6],
            [DocumentType-5],
            [DueDate-37],
            [EntryNo-1],
            [ExportedtoPaymentFile-290],
            [InvDiscountLCY-20],
            [MaxPaymentTolerance-79],
            [Open-36],
            [OrigPmtDiscPossibleLCY-42],
            [OriginalCurrencyFactor-74],
            [OriginalPmtDiscPossible-39],
            [PmtDiscRcdLCY-40],
            [PmtToleranceLCY-83],
            [Positive-43],
            [PostingDate-4],
            [Prepayment-90],
            [PurchaseLCY-18],
            [RemainingPmtDiscPossible-77],
            [Reversed-87],
            [ReversedEntryNo-89],
            [ReversedbyEntryNo-88],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [TransactionNo-53],
            [UserID-27],
            [VendorName-8],
            [VendorPostingGroup-22],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
        )
        SELECT
            s.[AppliestoID-47],
            s.[AppliestoExtDocNo-173],
            s.[InvoiceReceivedDate-175],
            s.[CreditorNo-170],
            s.[GlobalDimension1Code-23],
            s.[ClosedbyCurrencyCode-65],
            s.[CurrencyCode-11],
            s.[BalAccountNo-52],
            s.[JournalBatchName-49],
            s.[JournalTemplName-48],
            s.[PmtDiscToleranceDate-78],
            s.[PmtDiscountDate-38],
            s.[NoSeries-64],
            s.[ExternalDocumentNo-63],
            s.[PaymentMethodCode-172],
            s.[PurchaserCode-25],
            s.[ClosedatDate-45],
            s.[SourceCode-28],
            s.[VendorNo-3],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[AcceptedPaymentTolerance-81],
            s.[AcceptedPmtDiscTolerance-82],
            s.[AdjustedCurrencyFactor-73],
            s.[AmounttoApply-84],
            s.[AppliestoDocType-34],
            s.[ApplyingEntry-86],
            s.[BalAccountType-51],
            s.[BuyfromVendorNo-21],
            s.[ClosedbyAmount-46],
            s.[ClosedbyAmountLCY-54],
            s.[ClosedbyCurrencyAmount-66],
            s.[ClosedbyEntryNo-44],
            s.[Description-7],
            s.[DimensionSetID-480],
            s.[DocumentDate-62],
            s.[DocumentNo-6],
            s.[DocumentType-5],
            s.[DueDate-37],
            s.[EntryNo-1],
            s.[ExportedtoPaymentFile-290],
            s.[InvDiscountLCY-20],
            s.[MaxPaymentTolerance-79],
            s.[Open-36],
            s.[OrigPmtDiscPossibleLCY-42],
            s.[OriginalCurrencyFactor-74],
            s.[OriginalPmtDiscPossible-39],
            s.[PmtDiscRcdLCY-40],
            s.[PmtToleranceLCY-83],
            s.[Positive-43],
            s.[PostingDate-4],
            s.[Prepayment-90],
            s.[PurchaseLCY-18],
            s.[RemainingPmtDiscPossible-77],
            s.[Reversed-87],
            s.[ReversedEntryNo-89],
            s.[ReversedbyEntryNo-88],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[TransactionNo-53],
            s.[UserID-27],
            s.[VendorName-8],
            s.[VendorPostingGroup-22],
            s.[systemId-2000000000],
            s.[timestamp-0],
            SYSDATETIME()
        FROM [Bronze_2].[dbo].[VendorLedgerEntry25] s
        LEFT JOIN silver.VendorLedgerEntry25 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[AppliestoID-47] = s.[AppliestoID-47],
            t.[AppliestoExtDocNo-173] = s.[AppliestoExtDocNo-173],
            t.[InvoiceReceivedDate-175] = s.[InvoiceReceivedDate-175],
            t.[CreditorNo-170] = s.[CreditorNo-170],
            t.[GlobalDimension1Code-23] = s.[GlobalDimension1Code-23],
            t.[ClosedbyCurrencyCode-65] = s.[ClosedbyCurrencyCode-65],
            t.[CurrencyCode-11] = s.[CurrencyCode-11],
            t.[BalAccountNo-52] = s.[BalAccountNo-52],
            t.[JournalBatchName-49] = s.[JournalBatchName-49],
            t.[JournalTemplName-48] = s.[JournalTemplName-48],
            t.[PmtDiscToleranceDate-78] = s.[PmtDiscToleranceDate-78],
            t.[PmtDiscountDate-38] = s.[PmtDiscountDate-38],
            t.[NoSeries-64] = s.[NoSeries-64],
            t.[ExternalDocumentNo-63] = s.[ExternalDocumentNo-63],
            t.[PaymentMethodCode-172] = s.[PaymentMethodCode-172],
            t.[PurchaserCode-25] = s.[PurchaserCode-25],
            t.[ClosedatDate-45] = s.[ClosedatDate-45],
            t.[SourceCode-28] = s.[SourceCode-28],
            t.[VendorNo-3] = s.[VendorNo-3],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[AcceptedPaymentTolerance-81] = s.[AcceptedPaymentTolerance-81],
            t.[AcceptedPmtDiscTolerance-82] = s.[AcceptedPmtDiscTolerance-82],
            t.[AdjustedCurrencyFactor-73] = s.[AdjustedCurrencyFactor-73],
            t.[AmounttoApply-84] = s.[AmounttoApply-84],
            t.[AppliestoDocType-34] = s.[AppliestoDocType-34],
            t.[ApplyingEntry-86] = s.[ApplyingEntry-86],
            t.[BalAccountType-51] = s.[BalAccountType-51],
            t.[BuyfromVendorNo-21] = s.[BuyfromVendorNo-21],
            t.[ClosedbyAmount-46] = s.[ClosedbyAmount-46],
            t.[ClosedbyAmountLCY-54] = s.[ClosedbyAmountLCY-54],
            t.[ClosedbyCurrencyAmount-66] = s.[ClosedbyCurrencyAmount-66],
            t.[ClosedbyEntryNo-44] = s.[ClosedbyEntryNo-44],
            t.[Description-7] = s.[Description-7],
            t.[DimensionSetID-480] = s.[DimensionSetID-480],
            t.[DocumentDate-62] = s.[DocumentDate-62],
            t.[DocumentNo-6] = s.[DocumentNo-6],
            t.[DocumentType-5] = s.[DocumentType-5],
            t.[DueDate-37] = s.[DueDate-37],
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[ExportedtoPaymentFile-290] = s.[ExportedtoPaymentFile-290],
            t.[InvDiscountLCY-20] = s.[InvDiscountLCY-20],
            t.[MaxPaymentTolerance-79] = s.[MaxPaymentTolerance-79],
            t.[Open-36] = s.[Open-36],
            t.[OrigPmtDiscPossibleLCY-42] = s.[OrigPmtDiscPossibleLCY-42],
            t.[OriginalCurrencyFactor-74] = s.[OriginalCurrencyFactor-74],
            t.[OriginalPmtDiscPossible-39] = s.[OriginalPmtDiscPossible-39],
            t.[PmtDiscRcdLCY-40] = s.[PmtDiscRcdLCY-40],
            t.[PmtToleranceLCY-83] = s.[PmtToleranceLCY-83],
            t.[Positive-43] = s.[Positive-43],
            t.[PostingDate-4] = s.[PostingDate-4],
            t.[Prepayment-90] = s.[Prepayment-90],
            t.[PurchaseLCY-18] = s.[PurchaseLCY-18],
            t.[RemainingPmtDiscPossible-77] = s.[RemainingPmtDiscPossible-77],
            t.[Reversed-87] = s.[Reversed-87],
            t.[ReversedEntryNo-89] = s.[ReversedEntryNo-89],
            t.[ReversedbyEntryNo-88] = s.[ReversedbyEntryNo-88],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[TransactionNo-53] = s.[TransactionNo-53],
            t.[UserID-27] = s.[UserID-27],
            t.[VendorName-8] = s.[VendorName-8],
            t.[VendorPostingGroup-22] = s.[VendorPostingGroup-22],
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = SYSDATETIME()
        FROM silver.VendorLedgerEntry25 t
        JOIN [Bronze_2].[dbo].[VendorLedgerEntry25] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[AppliestoID-47], '') <> ISNULL(s.[AppliestoID-47], '') OR
            ISNULL(t.[AppliestoExtDocNo-173], '') <> ISNULL(s.[AppliestoExtDocNo-173], '') OR
            ISNULL(t.[InvoiceReceivedDate-175], '1900-01-01') <> ISNULL(s.[InvoiceReceivedDate-175], '1900-01-01') OR
            ISNULL(t.[CreditorNo-170], '') <> ISNULL(s.[CreditorNo-170], '') OR
            ISNULL(t.[GlobalDimension1Code-23], '') <> ISNULL(s.[GlobalDimension1Code-23], '') OR
            ISNULL(t.[ClosedbyCurrencyCode-65], '') <> ISNULL(s.[ClosedbyCurrencyCode-65], '') OR
            ISNULL(t.[CurrencyCode-11], '') <> ISNULL(s.[CurrencyCode-11], '') OR
            ISNULL(t.[BalAccountNo-52], '') <> ISNULL(s.[BalAccountNo-52], '') OR
            ISNULL(t.[JournalBatchName-49], '') <> ISNULL(s.[JournalBatchName-49], '') OR
            ISNULL(t.[JournalTemplName-48], '') <> ISNULL(s.[JournalTemplName-48], '') OR
            ISNULL(t.[PmtDiscToleranceDate-78], '1900-01-01') <> ISNULL(s.[PmtDiscToleranceDate-78], '1900-01-01') OR
            ISNULL(t.[PmtDiscountDate-38], '1900-01-01') <> ISNULL(s.[PmtDiscountDate-38], '1900-01-01') OR
            ISNULL(t.[NoSeries-64], '') <> ISNULL(s.[NoSeries-64], '') OR
            ISNULL(t.[ExternalDocumentNo-63], '') <> ISNULL(s.[ExternalDocumentNo-63], '') OR
            ISNULL(t.[PaymentMethodCode-172], '') <> ISNULL(s.[PaymentMethodCode-172], '') OR
            ISNULL(t.[PurchaserCode-25], '') <> ISNULL(s.[PurchaserCode-25], '') OR
            ISNULL(t.[ClosedatDate-45], '1900-01-01') <> ISNULL(s.[ClosedatDate-45], '1900-01-01') OR
            ISNULL(t.[SourceCode-28], '') <> ISNULL(s.[SourceCode-28], '') OR
            ISNULL(t.[VendorNo-3], '') <> ISNULL(s.[VendorNo-3], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[AcceptedPaymentTolerance-81], -99999) <> ISNULL(s.[AcceptedPaymentTolerance-81], -99999) OR
            ISNULL(t.[AcceptedPmtDiscTolerance-82], 0) <> ISNULL(s.[AcceptedPmtDiscTolerance-82], 0) OR
            ISNULL(t.[AdjustedCurrencyFactor-73], -99999) <> ISNULL(s.[AdjustedCurrencyFactor-73], -99999) OR
            ISNULL(t.[AmounttoApply-84], -99999) <> ISNULL(s.[AmounttoApply-84], -99999) OR
            ISNULL(t.[AppliestoDocType-34], '') <> ISNULL(s.[AppliestoDocType-34], '') OR
            ISNULL(t.[ApplyingEntry-86], 0) <> ISNULL(s.[ApplyingEntry-86], 0) OR
            ISNULL(t.[BalAccountType-51], '') <> ISNULL(s.[BalAccountType-51], '') OR
            ISNULL(t.[BuyfromVendorNo-21], '') <> ISNULL(s.[BuyfromVendorNo-21], '') OR
            ISNULL(t.[ClosedbyAmount-46], -99999) <> ISNULL(s.[ClosedbyAmount-46], -99999) OR
            ISNULL(t.[ClosedbyAmountLCY-54], -99999) <> ISNULL(s.[ClosedbyAmountLCY-54], -99999) OR
            ISNULL(t.[ClosedbyCurrencyAmount-66], -99999) <> ISNULL(s.[ClosedbyCurrencyAmount-66], -99999) OR
            ISNULL(t.[ClosedbyEntryNo-44], -1) <> ISNULL(s.[ClosedbyEntryNo-44], -1) OR
            ISNULL(t.[Description-7], '') <> ISNULL(s.[Description-7], '') OR
            ISNULL(t.[DimensionSetID-480], -1) <> ISNULL(s.[DimensionSetID-480], -1) OR
            ISNULL(t.[DocumentDate-62], '1900-01-01') <> ISNULL(s.[DocumentDate-62], '1900-01-01') OR
            ISNULL(t.[DocumentNo-6], '') <> ISNULL(s.[DocumentNo-6], '') OR
            ISNULL(t.[DocumentType-5], '') <> ISNULL(s.[DocumentType-5], '') OR
            ISNULL(t.[DueDate-37], '1900-01-01') <> ISNULL(s.[DueDate-37], '1900-01-01') OR
            ISNULL(t.[EntryNo-1], -1) <> ISNULL(s.[EntryNo-1], -1) OR
            ISNULL(t.[ExportedtoPaymentFile-290], 0) <> ISNULL(s.[ExportedtoPaymentFile-290], 0) OR
            ISNULL(t.[InvDiscountLCY-20], -99999) <> ISNULL(s.[InvDiscountLCY-20], -99999) OR
            ISNULL(t.[MaxPaymentTolerance-79], -99999) <> ISNULL(s.[MaxPaymentTolerance-79], -99999) OR
            ISNULL(t.[Open-36], 0) <> ISNULL(s.[Open-36], 0) OR
            ISNULL(t.[OrigPmtDiscPossibleLCY-42], -99999) <> ISNULL(s.[OrigPmtDiscPossibleLCY-42], -99999) OR
            ISNULL(t.[OriginalCurrencyFactor-74], -99999) <> ISNULL(s.[OriginalCurrencyFactor-74], -99999) OR
            ISNULL(t.[OriginalPmtDiscPossible-39], -99999) <> ISNULL(s.[OriginalPmtDiscPossible-39], -99999) OR
            ISNULL(t.[PmtDiscRcdLCY-40], -99999) <> ISNULL(s.[PmtDiscRcdLCY-40], -99999) OR
            ISNULL(t.[PmtToleranceLCY-83], -99999) <> ISNULL(s.[PmtToleranceLCY-83], -99999) OR
            ISNULL(t.[Positive-43], 0) <> ISNULL(s.[Positive-43], 0) OR
            ISNULL(t.[PostingDate-4], '1900-01-01') <> ISNULL(s.[PostingDate-4], '1900-01-01') OR
            ISNULL(t.[Prepayment-90], 0) <> ISNULL(s.[Prepayment-90], 0) OR
            ISNULL(t.[PurchaseLCY-18], -99999) <> ISNULL(s.[PurchaseLCY-18], -99999) OR
            ISNULL(t.[RemainingPmtDiscPossible-77], -99999) <> ISNULL(s.[RemainingPmtDiscPossible-77], -99999) OR
            ISNULL(t.[Reversed-87], 0) <> ISNULL(s.[Reversed-87], 0) OR
            ISNULL(t.[ReversedEntryNo-89], -1) <> ISNULL(s.[ReversedEntryNo-89], -1) OR
            ISNULL(t.[ReversedbyEntryNo-88], -1) <> ISNULL(s.[ReversedbyEntryNo-88], -1) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[TransactionNo-53], -1) <> ISNULL(s.[TransactionNo-53], -1) OR
            ISNULL(t.[UserID-27], '') <> ISNULL(s.[UserID-27], '') OR
            ISNULL(t.[VendorName-8], '') <> ISNULL(s.[VendorName-8], '') OR
            ISNULL(t.[VendorPostingGroup-22], '') <> ISNULL(s.[VendorPostingGroup-22], '') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------  
        DELETE t FROM silver.VendorLedgerEntry25 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[VendorLedgerEntry25] s
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
        'VendorLedgerEntry25',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;