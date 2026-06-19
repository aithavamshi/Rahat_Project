---  Exec silver.usp_IncrementalLoad_ValueEntry5802
---  select * from silver.ValueEntry5802
---  TRUNCATE TABLE silver.ValueEntry5802


CREATE       PROCEDURE silver.usp_IncrementalLoad_ValueEntry5802
@RunId VARCHAR(100) = 'RunId'
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
            INSERT INTO silver.ValueEntry5802 (
            [OrderNo-91], [ExternalDocumentNo-61], [Description-7], [SalespersPurchCode-22], [SourcePostingGroup-10],
            [SourceNo-5], [GenBusPostingGroup-57], [$Company], [Adjustment-5818], [CapacityLedgerEntryNo-5831],
            [CostAmountActual-43], [CostAmountExpected-151], [CostAmountNonInvtbl-152], [CostPostedtoGL-45],
            [CostperUnit-15], [DimensionSetID-480], [DiscountAmount-23], [DocumentDate-60], [DocumentLineNo-80],
            [DocumentNo-6], [DocumentType-79], [DropShipment-47], [ERCProfitActual-71276875], [EntryNo-1], [EntryType-105],
            [ExpCostPostedtoGLACY-159], [ExpectedCost-98], [ExpectedCostPostedtoGL-158], [GenProdPostingGroup-58],
            [Inventoriable-103], [InventoryPostingGroup-9], [InvoicedQuantity-14], [ItemLedgerEntryNo-11],
            [ItemLedgerEntryQuantity-13], [ItemLedgerEntryType-4], [ItemNo-2], [LocationCode-8], [OrderLineNo-92],
            [OrderType-90], [PostingDate-3], [PurchaseAmountActual-148], [PurchaseAmountExpected-149],
            [SalesAmountActual-17], [SalesAmountExpected-150], [SourceCode-25], [SourceType-41],
            [SystemCreatedAt-2000000001], [SystemCreatedBy-2000000002], [SystemModifiedAt-2000000003],
            [Type-5832], [UserID-24], [ValuedByAverageCost-100], [ValuedQuantity-12],
            [WTBACostperUnitBottle-87241], [WTBACostperUnitBottleACY-87251], [WTBACostperUnitCase-87240],
            [WTBACostperUnitCaseACY-87250], [WTBAInvoicedQtyBottle-87221], [WTBAInvoicedQtyCase-87220],
            [WTBAItemLedgQtyBottle-87201], [WTBAItemLedgQtyCase-87200], [WTBAValuedQtyBottle-87211],
            [WTBAValuedQtyCase-87210], [systemId-2000000000], [timestamp-0],InsertDate
            )
            SELECT
            s.[OrderNo-91], s.[ExternalDocumentNo-61], s.[Description-7], s.[SalespersPurchCode-22], s.[SourcePostingGroup-10],
            s.[SourceNo-5], s.[GenBusPostingGroup-57], s.[$Company], s.[Adjustment-5818], s.[CapacityLedgerEntryNo-5831],
            s.[CostAmountActual-43], s.[CostAmountExpected-151], s.[CostAmountNonInvtbl-152], s.[CostPostedtoGL-45],
            s.[CostperUnit-15], s.[DimensionSetID-480], s.[DiscountAmount-23], s.[DocumentDate-60], s.[DocumentLineNo-80],
            s.[DocumentNo-6], s.[DocumentType-79], s.[DropShipment-47], s.[ERCProfitActual-71276875], s.[EntryNo-1], s.[EntryType-105],
            s.[ExpCostPostedtoGLACY-159], s.[ExpectedCost-98], s.[ExpectedCostPostedtoGL-158], s.[GenProdPostingGroup-58],
            s.[Inventoriable-103], s.[InventoryPostingGroup-9], s.[InvoicedQuantity-14], s.[ItemLedgerEntryNo-11],
            s.[ItemLedgerEntryQuantity-13], s.[ItemLedgerEntryType-4], s.[ItemNo-2], s.[LocationCode-8], s.[OrderLineNo-92],
            s.[OrderType-90], s.[PostingDate-3], s.[PurchaseAmountActual-148], s.[PurchaseAmountExpected-149],
            s.[SalesAmountActual-17], s.[SalesAmountExpected-150], s.[SourceCode-25], s.[SourceType-41],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[Type-5832], s.[UserID-24], s.[ValuedByAverageCost-100], s.[ValuedQuantity-12],
            s.[WTBACostperUnitBottle-87241], s.[WTBACostperUnitBottleACY-87251], s.[WTBACostperUnitCase-87240],
            s.[WTBACostperUnitCaseACY-87250], s.[WTBAInvoicedQtyBottle-87221], s.[WTBAInvoicedQtyCase-87220],
            s.[WTBAItemLedgQtyBottle-87201], s.[WTBAItemLedgQtyCase-87200], s.[WTBAValuedQtyBottle-87211],
            s.[WTBAValuedQtyCase-87210], s.[systemId-2000000000], s.[timestamp-0],CURRENT_TIMESTAMP
        FROM [test_lh].[dbo].[ValueEntry5802] s
        LEFT JOIN silver.ValueEntry5802 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
    

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[OrderNo-91] = s.[OrderNo-91],
            t.[ExternalDocumentNo-61] = s.[ExternalDocumentNo-61],
            t.[Description-7] = s.[Description-7],
            t.[SalespersPurchCode-22] = s.[SalespersPurchCode-22],
            t.[SourcePostingGroup-10] = s.[SourcePostingGroup-10],
            t.[SourceNo-5] = s.[SourceNo-5],
            t.[GenBusPostingGroup-57] = s.[GenBusPostingGroup-57],
            t.[$Company] = s.[$Company],
            t.[Adjustment-5818] = s.[Adjustment-5818],
            t.[CapacityLedgerEntryNo-5831] = s.[CapacityLedgerEntryNo-5831],
            t.[CostAmountActual-43] = s.[CostAmountActual-43],
            t.[CostAmountExpected-151] = s.[CostAmountExpected-151],
            t.[CostAmountNonInvtbl-152] = s.[CostAmountNonInvtbl-152],
            t.[CostPostedtoGL-45] = s.[CostPostedtoGL-45],
            t.[CostperUnit-15] = s.[CostperUnit-15],
            t.[DimensionSetID-480] = s.[DimensionSetID-480],
            t.[DiscountAmount-23] = s.[DiscountAmount-23],
            t.[DocumentDate-60] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[DocumentDate-60], '')),
            t.[DocumentLineNo-80] = s.[DocumentLineNo-80],
            t.[DocumentNo-6] = s.[DocumentNo-6],
            t.[DocumentType-79] = s.[DocumentType-79],
            t.[DropShipment-47] = s.[DropShipment-47],
            t.[ERCProfitActual-71276875] = s.[ERCProfitActual-71276875],
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[EntryType-105] = s.[EntryType-105],
            t.[ExpCostPostedtoGLACY-159] = s.[ExpCostPostedtoGLACY-159],
            t.[ExpectedCost-98] = s.[ExpectedCost-98],
            t.[ExpectedCostPostedtoGL-158] = s.[ExpectedCostPostedtoGL-158],
            t.[GenProdPostingGroup-58] = s.[GenProdPostingGroup-58],
            t.[Inventoriable-103] = s.[Inventoriable-103],
            t.[InventoryPostingGroup-9] = s.[InventoryPostingGroup-9],
            t.[InvoicedQuantity-14] = s.[InvoicedQuantity-14],
            t.[ItemLedgerEntryNo-11] = s.[ItemLedgerEntryNo-11],
            t.[ItemLedgerEntryQuantity-13] = s.[ItemLedgerEntryQuantity-13],
            t.[ItemLedgerEntryType-4] = s.[ItemLedgerEntryType-4],
            t.[ItemNo-2] = s.[ItemNo-2],
            t.[LocationCode-8] = s.[LocationCode-8],
            t.[OrderLineNo-92] = s.[OrderLineNo-92],
            t.[OrderType-90] = s.[OrderType-90],
            t.[PostingDate-3] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[PostingDate-3], '')),
            t.[PurchaseAmountActual-148] = s.[PurchaseAmountActual-148],
            t.[PurchaseAmountExpected-149] = s.[PurchaseAmountExpected-149],
            t.[SalesAmountActual-17] = s.[SalesAmountActual-17],
            t.[SalesAmountExpected-150] = s.[SalesAmountExpected-150],
            t.[SourceCode-25] = s.[SourceCode-25],
            t.[SourceType-41] = s.[SourceType-41],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[Type-5832] = s.[Type-5832],
            t.[UserID-24] = s.[UserID-24],
            t.[ValuedByAverageCost-100] = s.[ValuedByAverageCost-100],
            t.[ValuedQuantity-12] = s.[ValuedQuantity-12],
            t.[WTBACostperUnitBottle-87241] = s.[WTBACostperUnitBottle-87241],
            t.[WTBACostperUnitBottleACY-87251] = s.[WTBACostperUnitBottleACY-87251],
            t.[WTBACostperUnitCase-87240] = s.[WTBACostperUnitCase-87240],
            t.[WTBACostperUnitCaseACY-87250] = s.[WTBACostperUnitCaseACY-87250],
            t.[WTBAInvoicedQtyBottle-87221] = s.[WTBAInvoicedQtyBottle-87221],
            t.[WTBAInvoicedQtyCase-87220] = s.[WTBAInvoicedQtyCase-87220],
            t.[WTBAItemLedgQtyBottle-87201] = s.[WTBAItemLedgQtyBottle-87201],
            t.[WTBAItemLedgQtyCase-87200] = s.[WTBAItemLedgQtyCase-87200],
            t.[WTBAValuedQtyBottle-87211] = s.[WTBAValuedQtyBottle-87211],
            t.[WTBAValuedQtyCase-87210] = s.[WTBAValuedQtyCase-87210],
            t.[systemId-2000000000] = s.[systemId-2000000000],
            t.[timestamp-0] = s.[timestamp-0],
            UpdateDate = CURRENT_TIMESTAMP
        FROM silver.ValueEntry5802 t
        JOIN [test_lh].[dbo].[ValueEntry5802] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[OrderNo-91], '') <> ISNULL(s.[OrderNo-91], '') OR
            ISNULL(t.[ExternalDocumentNo-61], '') <> ISNULL(s.[ExternalDocumentNo-61], '') OR
            ISNULL(t.[Description-7], '') <> ISNULL(s.[Description-7], '') OR
            ISNULL(t.[SalespersPurchCode-22], '') <> ISNULL(s.[SalespersPurchCode-22], '') OR
            ISNULL(t.[SourcePostingGroup-10], '') <> ISNULL(s.[SourcePostingGroup-10], '') OR
            ISNULL(t.[SourceNo-5], '') <> ISNULL(s.[SourceNo-5], '') OR
            ISNULL(t.[GenBusPostingGroup-57], '') <> ISNULL(s.[GenBusPostingGroup-57], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[Adjustment-5818], 0) <> ISNULL(s.[Adjustment-5818], 0) OR
            ISNULL(t.[CapacityLedgerEntryNo-5831], '') <> ISNULL(s.[CapacityLedgerEntryNo-5831], '') OR
            ISNULL(t.[CostAmountActual-43], '') <> ISNULL(s.[CostAmountActual-43], '') OR
            ISNULL(t.[CostAmountExpected-151], '') <> ISNULL(s.[CostAmountExpected-151], '') OR
            ISNULL(t.[CostAmountNonInvtbl-152], '') <> ISNULL(s.[CostAmountNonInvtbl-152], '') OR
            ISNULL(t.[CostPostedtoGL-45], '') <> ISNULL(s.[CostPostedtoGL-45], '') OR
            ISNULL(t.[CostperUnit-15], '') <> ISNULL(s.[CostperUnit-15], '') OR
            ISNULL(t.[DimensionSetID-480], '') <> ISNULL(s.[DimensionSetID-480], '') OR
            ISNULL(t.[DiscountAmount-23], '') <> ISNULL(s.[DiscountAmount-23], '') OR
            ISNULL(t.[DocumentDate-60], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[DocumentDate-60], '')), '1900-01-01') OR
            ISNULL(t.[DocumentLineNo-80], '') <> ISNULL(s.[DocumentLineNo-80], '') OR
            ISNULL(t.[DocumentNo-6], '') <> ISNULL(s.[DocumentNo-6], '') OR
            ISNULL(t.[DocumentType-79], '') <> ISNULL(s.[DocumentType-79], '') OR
            ISNULL(t.[DropShipment-47], '') <> ISNULL(s.[DropShipment-47], '') OR
            ISNULL(t.[ERCProfitActual-71276875], '') <> ISNULL(s.[ERCProfitActual-71276875], '') OR
            ISNULL(t.[EntryNo-1], '') <> ISNULL(s.[EntryNo-1], '') OR
            ISNULL(t.[EntryType-105], '') <> ISNULL(s.[EntryType-105], '') OR
            ISNULL(t.[ExpCostPostedtoGLACY-159], '') <> ISNULL(s.[ExpCostPostedtoGLACY-159], '') OR
            ISNULL(t.[ExpectedCost-98], '') <> ISNULL(s.[ExpectedCost-98], '') OR
            ISNULL(t.[ExpectedCostPostedtoGL-158], '') <> ISNULL(s.[ExpectedCostPostedtoGL-158], '') OR
            ISNULL(t.[GenProdPostingGroup-58], '') <> ISNULL(s.[GenProdPostingGroup-58], '') OR
            ISNULL(t.[Inventoriable-103], '') <> ISNULL(s.[Inventoriable-103], '') OR
            ISNULL(t.[InventoryPostingGroup-9], '') <> ISNULL(s.[InventoryPostingGroup-9], '') OR
            ISNULL(t.[InvoicedQuantity-14], '') <> ISNULL(s.[InvoicedQuantity-14], '') OR
            ISNULL(t.[ItemLedgerEntryNo-11], '') <> ISNULL(s.[ItemLedgerEntryNo-11], '') OR
            ISNULL(t.[ItemLedgerEntryQuantity-13], '') <> ISNULL(s.[ItemLedgerEntryQuantity-13], '') OR
            ISNULL(t.[ItemLedgerEntryType-4], '') <> ISNULL(s.[ItemLedgerEntryType-4], '') OR
            ISNULL(t.[ItemNo-2], '') <> ISNULL(s.[ItemNo-2], '') OR
            ISNULL(t.[LocationCode-8], '') <> ISNULL(s.[LocationCode-8], '') OR
            ISNULL(t.[OrderLineNo-92], '') <> ISNULL(s.[OrderLineNo-92], '') OR
            ISNULL(t.[OrderType-90], '') <> ISNULL(s.[OrderType-90], '') OR
            ISNULL(t.[PostingDate-3], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[PostingDate-3], '')), '1900-01-01') OR
            ISNULL(t.[PurchaseAmountActual-148], '') <> ISNULL(s.[PurchaseAmountActual-148], '') OR
            ISNULL(t.[PurchaseAmountExpected-149], '') <> ISNULL(s.[PurchaseAmountExpected-149], '') OR
            ISNULL(t.[SalesAmountActual-17], '') <> ISNULL(s.[SalesAmountActual-17], '') OR
            ISNULL(t.[SalesAmountExpected-150], '') <> ISNULL(s.[SalesAmountExpected-150], '') OR
            ISNULL(t.[SourceCode-25], '') <> ISNULL(s.[SourceCode-25], '') OR
            ISNULL(t.[SourceType-41], '') <> ISNULL(s.[SourceType-41], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[Type-5832], '') <> ISNULL(s.[Type-5832], '') OR
            ISNULL(t.[UserID-24], '') <> ISNULL(s.[UserID-24], '') OR
            ISNULL(t.[ValuedByAverageCost-100], '') <> ISNULL(s.[ValuedByAverageCost-100], '') OR
            ISNULL(t.[ValuedQuantity-12], '') <> ISNULL(s.[ValuedQuantity-12], '') OR
            ISNULL(t.[WTBACostperUnitBottle-87241], '') <> ISNULL(s.[WTBACostperUnitBottle-87241], '') OR
            ISNULL(t.[WTBACostperUnitBottleACY-87251], '') <> ISNULL(s.[WTBACostperUnitBottleACY-87251], '') OR
            ISNULL(t.[WTBACostperUnitCase-87240], '') <> ISNULL(s.[WTBACostperUnitCase-87240], '') OR
            ISNULL(t.[WTBACostperUnitCaseACY-87250], '') <> ISNULL(s.[WTBACostperUnitCaseACY-87250], '') OR
            ISNULL(t.[WTBAInvoicedQtyBottle-87221], '') <> ISNULL(s.[WTBAInvoicedQtyBottle-87221], '') OR
            ISNULL(t.[WTBAInvoicedQtyCase-87220], '') <> ISNULL(s.[WTBAInvoicedQtyCase-87220], '') OR
            ISNULL(t.[WTBAItemLedgQtyBottle-87201], '') <> ISNULL(s.[WTBAItemLedgQtyBottle-87201], '') OR
            ISNULL(t.[WTBAItemLedgQtyCase-87200], '') <> ISNULL(s.[WTBAItemLedgQtyCase-87200], '') OR
            ISNULL(t.[WTBAValuedQtyBottle-87211], '') <> ISNULL(s.[WTBAValuedQtyBottle-87211], '') OR
            ISNULL(t.[WTBAValuedQtyCase-87210], '') <> ISNULL(s.[WTBAValuedQtyCase-87210], '') OR
            ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
           DELETE t FROM silver.ValueEntry5802 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[ValueEntry5802] s
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
        'ValueEntry5802',
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