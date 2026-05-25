---  EXEC [silver].[usp_IncrementalLoad_GLEntry17]
---  SELECT * FROM silver.GLEntry17    
---  TRUNCATE TABLE silver.GLEntry17
---  select count(*) from silver.GLEntry17



CREATE      PROCEDURE [silver].[usp_IncrementalLoad_GLEntry17]
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
            INSERT INTO silver.GLEntry17 (
        [GlobalDimension2Code-24],
        [Comment-5618],
        [ReasonCode-47],
        [SourceCurrencyCode-20],
        [GenProdPostingGroup-50],
        [GenBusPostingGroup-49],
        [ProdOrderNo-5400],
        [JournalBatchName-46],
        [JournalTemplName-78],
        [NoSeries-59],
        [GlobalDimension1Code-23],
        [BalAccountNo-10],
        [SourceNameWC-50000],
        [SourceNo-58],
        [ExternalDocumentNo-56],
        [SourceCode-28],
        [Description-7],
        [$Company],
        [AddCurrencyCreditAmount-70],
        [AddCurrencyDebitAmount-69],
        [AdditionalCurrencyAmount-68],
        [BalAccountType-51],
        [CloseIncomeStatementDimID-71],
        [DimensionChangesCount-497],
        [DimensionSetID-480],
        [DocumentNo-6],
        [DocumentType-5],
        [FAEntryNo-5601],
        [GenPostingType-48],
        [LastDimCorrectionNode-496],
        [NonDeductibleVATAmountACY-6201],
        [Reversed-73],
        [ReversedEntryNo-75],
        [ReversedbyEntryNo-74],
        [SourceCurrencyAmount-18],
        [SourceType-57],
        [SystemCreatedAt-2000000001],
        [SystemCreatedBy-2000000002],
        [SystemModifiedAt-2000000003],
        [TransactionNo-52],
        [VATAmount-43],
        [WTCBChargebackLedgerEntry-89000],
        [systemId-2000000000],
        [$DeliveredDateTime],
        [Amount-17],
        [CreditAmount-54],
        [DebitAmount-53],
        [DocumentDate-55],
        [EntryNo-1],
        [FAEntryType-5600],
        [GLAccountNo-3],
        [GSTHST-10019],
        [LastDimCorrectionEntryNo-495],
        [LastModifiedDateTime-8005],
        [NonDeductibleVATAmount-6200],
        [PostingDate-4],
        [PriorYearEntry-30],
        [Quantity-42],
        [SourceCurrencyVATAmount-19],
        [SystemCreatedEntry-29],
        [TaxLiable-61],
        [UseTax-63],
        [UserID-27],
        [VATReportingDate-79],
        [timestamp-0],
        [InsertDate]
       
     )
     SELECT
        s.[GlobalDimension2Code-24],
        s.[Comment-5618],
        s.[ReasonCode-47],
        s.[SourceCurrencyCode-20],
        s.[GenProdPostingGroup-50],
        s.[GenBusPostingGroup-49],
        s.[ProdOrderNo-5400],
        s.[JournalBatchName-46],
        s.[JournalTemplName-78],
        s.[NoSeries-59],
        s.[GlobalDimension1Code-23],
        s.[BalAccountNo-10],
        s.[SourceNameWC-50000],
        s.[SourceNo-58],
        s.[ExternalDocumentNo-56],
        s.[SourceCode-28],
        s.[Description-7],
        s.[$Company],
        s.[AddCurrencyCreditAmount-70],
        s.[AddCurrencyDebitAmount-69],
        s.[AdditionalCurrencyAmount-68],
        s.[BalAccountType-51],
        s.[CloseIncomeStatementDimID-71],
        s.[DimensionChangesCount-497],
        s.[DimensionSetID-480],
        s.[DocumentNo-6],
        s.[DocumentType-5],
        s.[FAEntryNo-5601],
        s.[GenPostingType-48],
        s.[LastDimCorrectionNode-496],
        s.[NonDeductibleVATAmountACY-6201],
        s.[Reversed-73],
        s.[ReversedEntryNo-75],
        s.[ReversedbyEntryNo-74],
        s.[SourceCurrencyAmount-18],
        s.[SourceType-57],
        s.[SystemCreatedAt-2000000001],
        s.[SystemCreatedBy-2000000002],
        s.[SystemModifiedAt-2000000003],
        s.[TransactionNo-52],
        s.[VATAmount-43],
        s.[WTCBChargebackLedgerEntry-89000],
        s.[systemId-2000000000],
        s.[$DeliveredDateTime],
        s.[Amount-17],
        s.[CreditAmount-54],
        s.[DebitAmount-53],
        s.[DocumentDate-55],
        s.[EntryNo-1],
        s.[FAEntryType-5600],
        s.[GLAccountNo-3],
        s.[GSTHST-10019],
        s.[LastDimCorrectionEntryNo-495],
        s.[LastModifiedDateTime-8005],
        s.[NonDeductibleVATAmount-6200],
        s.[PostingDate-4],
        s.[PriorYearEntry-30],
        s.[Quantity-42],
        s.[SourceCurrencyVATAmount-19],
        s.[SystemCreatedEntry-29],
        s.[TaxLiable-61],
        s.[UseTax-63],
        s.[UserID-27],
        s.[VATReportingDate-79],
        s.[timestamp-0],
        GETDATE()
       
      FROM [test_lh].[dbo].[GLEntry17] s
      LEFT JOIN silver.GLEntry17 t
          ON s.[systemId-2000000000] = t.[systemId-2000000000]
      WHERE t.[systemId-2000000000] IS NULL
        AND s.[systemId-2000000000] IS NOT NULL;

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
				UPDATE t
		SET
			t.[GlobalDimension2Code-24] = s.[GlobalDimension2Code-24],
			t.[Comment-5618] = s.[Comment-5618],
			t.[ReasonCode-47] = s.[ReasonCode-47],
			t.[SourceCurrencyCode-20] = s.[SourceCurrencyCode-20],
			t.[GenProdPostingGroup-50] = s.[GenProdPostingGroup-50],
			t.[GenBusPostingGroup-49] = s.[GenBusPostingGroup-49],
			t.[ProdOrderNo-5400] = s.[ProdOrderNo-5400],
			t.[JournalBatchName-46] = s.[JournalBatchName-46],
			t.[JournalTemplName-78] = s.[JournalTemplName-78],
			t.[NoSeries-59] = s.[NoSeries-59],
			t.[GlobalDimension1Code-23] = s.[GlobalDimension1Code-23],
			t.[BalAccountNo-10] = s.[BalAccountNo-10],
			t.[SourceNameWC-50000] = s.[SourceNameWC-50000],
			t.[SourceNo-58] = s.[SourceNo-58],
			t.[ExternalDocumentNo-56] = s.[ExternalDocumentNo-56],
			t.[SourceCode-28] = s.[SourceCode-28],
			t.[Description-7] = s.[Description-7],
			t.[$Company] = s.[$Company],
			t.[AddCurrencyCreditAmount-70] = s.[AddCurrencyCreditAmount-70],
			t.[AddCurrencyDebitAmount-69] = s.[AddCurrencyDebitAmount-69],
			t.[AdditionalCurrencyAmount-68] = s.[AdditionalCurrencyAmount-68],
			t.[BalAccountType-51] = s.[BalAccountType-51],
			t.[CloseIncomeStatementDimID-71] = s.[CloseIncomeStatementDimID-71],
			t.[DimensionChangesCount-497] = s.[DimensionChangesCount-497],
			t.[DimensionSetID-480] = s.[DimensionSetID-480],
			t.[DocumentNo-6] = s.[DocumentNo-6],
			t.[DocumentType-5] = s.[DocumentType-5],
			t.[FAEntryNo-5601] = s.[FAEntryNo-5601],
			t.[GenPostingType-48] = s.[GenPostingType-48],
			t.[LastDimCorrectionNode-496] = s.[LastDimCorrectionNode-496],
			t.[NonDeductibleVATAmountACY-6201] = s.[NonDeductibleVATAmountACY-6201],
			t.[Reversed-73] = s.[Reversed-73],
			t.[ReversedEntryNo-75] = s.[ReversedEntryNo-75],
			t.[ReversedbyEntryNo-74] = s.[ReversedbyEntryNo-74],
			t.[SourceCurrencyAmount-18] = s.[SourceCurrencyAmount-18],
			t.[SourceType-57] = s.[SourceType-57],
			t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
			t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
			t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
			t.[TransactionNo-52] = s.[TransactionNo-52],
			t.[VATAmount-43] = s.[VATAmount-43],
			t.[WTCBChargebackLedgerEntry-89000] = s.[WTCBChargebackLedgerEntry-89000],  
			t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
			t.[Amount-17] = s.[Amount-17],
			t.[CreditAmount-54] = s.[CreditAmount-54],
			t.[DebitAmount-53] = s.[DebitAmount-53],
			t.[DocumentDate-55] = s.[DocumentDate-55],
			t.[EntryNo-1] = s.[EntryNo-1],
			t.[FAEntryType-5600] = s.[FAEntryType-5600],
			t.[GLAccountNo-3] = s.[GLAccountNo-3],
			t.[GSTHST-10019] = s.[GSTHST-10019],
			t.[LastDimCorrectionEntryNo-495] = s.[LastDimCorrectionEntryNo-495],
		    t.[LastModifiedDateTime-8005] = s.[LastModifiedDateTime-8005],
			t.[NonDeductibleVATAmount-6200] = s.[NonDeductibleVATAmount-6200],
			t.[PostingDate-4] = s.[PostingDate-4],
			t.[PriorYearEntry-30] = s.[PriorYearEntry-30],
			t.[Quantity-42] = s.[Quantity-42],
			t.[SourceCurrencyVATAmount-19] = s.[SourceCurrencyVATAmount-19],
			t.[SystemCreatedEntry-29] = s.[SystemCreatedEntry-29],
			t.[TaxLiable-61] = s.[TaxLiable-61],
			t.[UseTax-63] = s.[UseTax-63],
			t.[UserID-27] = s.[UserID-27],
			t.[VATReportingDate-79] = s.[VATReportingDate-79],
			t.[timestamp-0] = s.[timestamp-0],
			t.[UpdateDate] = GETDATE()
		FROM silver.GLEntry17 t
		JOIN [test_lh].[dbo].[GLEntry17] s
			ON t.[systemId-2000000000] = s.[systemId-2000000000]
		WHERE
	ISNULL(t.[GlobalDimension2Code-24], '') <> ISNULL(s.[GlobalDimension2Code-24], '') OR
	ISNULL(t.[Comment-5618], '') <> ISNULL(s.[Comment-5618], '') OR
	ISNULL(t.[ReasonCode-47], '') <> ISNULL(s.[ReasonCode-47], '') OR
	ISNULL(t.[SourceCurrencyCode-20], '') <> ISNULL(s.[SourceCurrencyCode-20], '') OR
	ISNULL(t.[GenProdPostingGroup-50], '') <> ISNULL(s.[GenProdPostingGroup-50], '') OR
	ISNULL(t.[GenBusPostingGroup-49], '') <> ISNULL(s.[GenBusPostingGroup-49], '') OR
	ISNULL(t.[ProdOrderNo-5400], '') <> ISNULL(s.[ProdOrderNo-5400], '') OR
	ISNULL(t.[JournalBatchName-46], '') <> ISNULL(s.[JournalBatchName-46], '') OR
	ISNULL(t.[JournalTemplName-78], '') <> ISNULL(s.[JournalTemplName-78], '') OR
	ISNULL(t.[NoSeries-59], '') <> ISNULL(s.[NoSeries-59], '') OR
	ISNULL(t.[GlobalDimension1Code-23], '') <> ISNULL(s.[GlobalDimension1Code-23], '') OR
	ISNULL(t.[BalAccountNo-10], '') <> ISNULL(s.[BalAccountNo-10], '') OR
	ISNULL(t.[SourceNameWC-50000], '') <> ISNULL(s.[SourceNameWC-50000], '') OR
	ISNULL(t.[SourceNo-58], '') <> ISNULL(s.[SourceNo-58], '') OR
	ISNULL(t.[ExternalDocumentNo-56], '') <> ISNULL(s.[ExternalDocumentNo-56], '') OR
	ISNULL(t.[SourceCode-28], '') <> ISNULL(s.[SourceCode-28], '') OR
	ISNULL(t.[Description-7], '') <> ISNULL(s.[Description-7], '') OR
	ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
	ISNULL(t.[BalAccountType-51], '') <> ISNULL(s.[BalAccountType-51], '') OR
	ISNULL(t.[DocumentNo-6], '') <> ISNULL(s.[DocumentNo-6], '') OR
	ISNULL(t.[DocumentType-5], '') <> ISNULL(s.[DocumentType-5], '') OR
	ISNULL(t.[GenPostingType-48], '') <> ISNULL(s.[GenPostingType-48], '') OR
	ISNULL(t.[SourceType-57], '') <> ISNULL(s.[SourceType-57], '') OR
	ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
	ISNULL(t.[FAEntryType-5600], '') <> ISNULL(s.[FAEntryType-5600], '') OR
	ISNULL(t.[GLAccountNo-3], '') <> ISNULL(s.[GLAccountNo-3], '') OR
	ISNULL(t.[GSTHST-10019], '') <> ISNULL(s.[GSTHST-10019], '') OR
	ISNULL(t.[UserID-27], '') <> ISNULL(s.[UserID-27], '') OR
	
	ISNULL(t.[AddCurrencyCreditAmount-70], 0.0) <> ISNULL(s.[AddCurrencyCreditAmount-70], 0.0) OR
	ISNULL(t.[AddCurrencyDebitAmount-69], 0.0) <> ISNULL(s.[AddCurrencyDebitAmount-69], 0.0) OR
	ISNULL(t.[AdditionalCurrencyAmount-68], 0.0) <> ISNULL(s.[AdditionalCurrencyAmount-68], 0.0) OR
	--ROUND(ISNULL(t.[SourceCurrencyAmount-18], 0.0),2) <> ROUND(ISNULL(s.[SourceCurrencyAmount-18], 0.0),2) OR
	ISNULL(t.[VATAmount-43], 0.0) <> ISNULL(s.[VATAmount-43], 0.0) OR
	--ROUND(ISNULL(t.[Amount-17], 0.0),2)      <> ROUND(ISNULL(s.[Amount-17], 0.0),2) OR
	--ROUND(ISNULL(t.[CreditAmount-54], 0.0), 2) <> ROUND(ISNULL(s.[CreditAmount-54], 0.0), 2) OR
	ISNULL(t.[DebitAmount-53], 0.0) <> ISNULL(s.[DebitAmount-53], 0.0) OR
	ISNULL(t.[NonDeductibleVATAmountACY-6201], 0.0) <> ISNULL(s.[NonDeductibleVATAmountACY-6201], 0.0) OR
	ISNULL(t.[NonDeductibleVATAmount-6200], 0.0) <> ISNULL(s.[NonDeductibleVATAmount-6200], 0.0) OR
	ISNULL(t.[Quantity-42], 0.0) <> ISNULL(s.[Quantity-42], 0.0) OR
	ISNULL(t.[SourceCurrencyVATAmount-19], 0.0) <> ISNULL(s.[SourceCurrencyVATAmount-19], 0.0) OR
	
	ISNULL(t.[CloseIncomeStatementDimID-71], 0) <> ISNULL(s.[CloseIncomeStatementDimID-71], 0) OR
	ISNULL(t.[DimensionChangesCount-497], 0) <> ISNULL(s.[DimensionChangesCount-497], 0) OR
	ISNULL(t.[DimensionSetID-480], 0) <> ISNULL(s.[DimensionSetID-480], 0) OR
	ISNULL(t.[FAEntryNo-5601], 0) <> ISNULL(s.[FAEntryNo-5601], 0) OR
	ISNULL(t.[LastDimCorrectionNode-496], 0) <> ISNULL(s.[LastDimCorrectionNode-496], 0) OR
	ISNULL(t.[ReversedEntryNo-75], 0) <> ISNULL(s.[ReversedEntryNo-75], 0) OR
	ISNULL(t.[ReversedbyEntryNo-74], 0) <> ISNULL(s.[ReversedbyEntryNo-74], 0) OR
	ISNULL(t.[TransactionNo-52], 0) <> ISNULL(s.[TransactionNo-52], 0) OR
	ISNULL(t.[WTCBChargebackLedgerEntry-89000], 0) <> ISNULL(s.[WTCBChargebackLedgerEntry-89000], 0) OR
	ISNULL(t.[EntryNo-1], 0) <> ISNULL(s.[EntryNo-1], 0) OR
	ISNULL(t.[LastDimCorrectionEntryNo-495], 0) <> ISNULL(s.[LastDimCorrectionEntryNo-495], 0) OR
	ISNULL(t.[timestamp-0], 0) <> ISNULL(s.[timestamp-0], 0) OR
	
	ISNULL(t.[Reversed-73], 0) <> ISNULL(s.[Reversed-73], 0) OR
	ISNULL(t.[PriorYearEntry-30], 0) <> ISNULL(s.[PriorYearEntry-30], 0) OR
	ISNULL(t.[SystemCreatedEntry-29], 0) <> ISNULL(s.[SystemCreatedEntry-29], 0) OR
	ISNULL(t.[TaxLiable-61], 0) <> ISNULL(s.[TaxLiable-61], 0) OR
	ISNULL(t.[UseTax-63], 0) <> ISNULL(s.[UseTax-63], 0) OR
	
	ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(s.[SystemCreatedAt-2000000001], '1900-01-01') OR
	ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(s.[SystemModifiedAt-2000000003], '1900-01-01') OR
	ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(s.[$DeliveredDateTime], '1900-01-01') OR
	ISNULL(t.[DocumentDate-55], '1900-01-01') <> ISNULL(s.[DocumentDate-55], '1900-01-01') OR
	ISNULL(t.[LastModifiedDateTime-8005], '1900-01-01') <> ISNULL(s.[LastModifiedDateTime-8005], '1900-01-01') OR
	ISNULL(t.[PostingDate-4], '1900-01-01') <> ISNULL(s.[PostingDate-4], '1900-01-01') OR
	ISNULL(t.[VATReportingDate-79], '1900-01-01') <> ISNULL(s.[VATReportingDate-79], '1900-01-01')

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
			DELETE FROM silver.GLEntry17
		WHERE [systemId-2000000000] NOT IN (
			SELECT [systemId-2000000000] FROM [test_lh].[dbo].[GLEntry17]
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
        'GLEntry17',
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