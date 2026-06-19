---  Exec silver.usp_IncrementalLoad_PriceListLine7001
---  Select * from [WH].[silver].[PriceListLine7001]
---  TRUNCATE TABLE [WH].[silver].[PriceListLine7001]


CREATE       PROCEDURE silver.usp_IncrementalLoad_PriceListLine7001

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
        INSERT INTO silver.PriceListLine7001 (
        [PriceListCode-1],
        [SourceNo-4],
        [CurrencyCode-10],
        [StartingDate-12],
        [EndingDate-13],
        [AssigntoNo-34],
        [ProductNo-33],
        [Description-29],
        [AssetNo-8],
        [UnitofMeasureCode-15],
        [MinimumQuantity-14],
        [LineAmount-27],
        [UnitPrice-17],
        [DirectUnitCost-31],
        [AllowLineDisc-21],
        [AllowInvoiceDisc-22],
        [PriceIncludesVAT-23],
        [WCAR06SalesCommMax-50100],
        [WTBAUnitPriceCase-87030],
        [WTBAUnitPriceBottle-87040],
        [WTBAPriceCategoryCode-87250],
        [WTCBDeplAllowUnitAmtType-89000],
        [WTCBDeplAllowUnitAmt-89010],
        [WTCBAllowDeplAllowAmtConv-89060],
        [WTPCMixMatchPricing-89200],
        [WTPCFamilyPlanPricing-89201],
        [WTPCCoopPricing-89202],
        [timestamp-0],
        [systemId-2000000000],
        [SystemCreatedAt-2000000001],
        [SystemModifiedAt-2000000003],
        [$Company],
        [$DeliveredDateTime],
        [InsertDate]
        
        )
        SELECT
        s.[PriceListCode-1],
        s.[SourceNo-4],
        s.[CurrencyCode-10],
        s.[StartingDate-12],
        s.[EndingDate-13],
        s.[AssigntoNo-34],
        s.[ProductNo-33],
        s.[Description-29],
        s.[AssetNo-8],
        s.[UnitofMeasureCode-15],
        s.[MinimumQuantity-14],
        s.[LineAmount-27],
        s.[UnitPrice-17],
        s.[DirectUnitCost-31],
        s.[AllowLineDisc-21],
        s.[AllowInvoiceDisc-22],
        s.[PriceIncludesVAT-23],
        s.[WCAR06SalesCommMax-50100],
        s.[WTBAUnitPriceCase-87030],
        s.[WTBAUnitPriceBottle-87040],
        s.[WTBAPriceCategoryCode-87250],
        s.[WTCBDeplAllowUnitAmtType-89000],
        s.[WTCBDeplAllowUnitAmt-89010],
        s.[WTCBAllowDeplAllowAmtConv-89060],
        s.[WTPCMixMatchPricing-89200],
        s.[WTPCFamilyPlanPricing-89201],
        s.[WTPCCoopPricing-89202],
        s.[timestamp-0],
        s.[systemId-2000000000],
        s.[SystemCreatedAt-2000000001],
        s.[SystemModifiedAt-2000000003],
        s.[$Company],
        s.[$DeliveredDateTime],
        GETDATE()
     
        FROM [test_lh].[dbo].[PriceListLine7001] s
        LEFT JOIN silver.PriceListLine7001 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET 
        t.[PriceListCode-1]            = s.[PriceListCode-1],
        t.[SourceNo-4]                 = s.[SourceNo-4],
        t.[CurrencyCode-10]            = s.[CurrencyCode-10],
        t.[StartingDate-12]            = s.[StartingDate-12],
        t.[EndingDate-13]              = s.[EndingDate-13],
        t.[AssigntoNo-34]              = s.[AssigntoNo-34],
        t.[ProductNo-33]               = s.[ProductNo-33],
        t.[Description-29]             = s.[Description-29],
        t.[AssetNo-8]                  = s.[AssetNo-8],
        t.[UnitofMeasureCode-15]       = s.[UnitofMeasureCode-15],
        t.[MinimumQuantity-14]         = s.[MinimumQuantity-14],
        t.[LineAmount-27]              = s.[LineAmount-27],
        t.[UnitPrice-17]               = s.[UnitPrice-17],
        t.[DirectUnitCost-31]          = s.[DirectUnitCost-31],
        t.[AllowLineDisc-21]           = s.[AllowLineDisc-21],
        t.[AllowInvoiceDisc-22]        = s.[AllowInvoiceDisc-22],
        t.[PriceIncludesVAT-23]        = s.[PriceIncludesVAT-23],
        t.[WCAR06SalesCommMax-50100]   = s.[WCAR06SalesCommMax-50100],
        t.[WTBAUnitPriceCase-87030]    = s.[WTBAUnitPriceCase-87030],
        t.[WTBAUnitPriceBottle-87040]  = s.[WTBAUnitPriceBottle-87040],
        t.[WTBAPriceCategoryCode-87250]= s.[WTBAPriceCategoryCode-87250],
        t.[WTCBDeplAllowUnitAmtType-89000] = s.[WTCBDeplAllowUnitAmtType-89000],
        t.[WTCBDeplAllowUnitAmt-89010] = s.[WTCBDeplAllowUnitAmt-89010],
        t.[WTCBAllowDeplAllowAmtConv-89060] = s.[WTCBAllowDeplAllowAmtConv-89060],
        t.[WTPCMixMatchPricing-89200]  = s.[WTPCMixMatchPricing-89200],
        t.[WTPCFamilyPlanPricing-89201]= s.[WTPCFamilyPlanPricing-89201],
        t.[WTPCCoopPricing-89202]      = s.[WTPCCoopPricing-89202],
        t.[$Company]                   = s.[$Company],
        t.[$DeliveredDateTime]         = s.[$DeliveredDateTime],
        t.[UpdateDate]                 = GETDATE()
        FROM silver.PriceListLine7001 t
        INNER JOIN [test_lh].[dbo].[PriceListLine7001] s
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE 
        ISNULL(t.[PriceListCode-1], '') <> ISNULL(s.[PriceListCode-1], '') OR
        ISNULL(t.[SourceNo-4], '') <> ISNULL(s.[SourceNo-4], '') OR
        ISNULL(t.[CurrencyCode-10], '') <> ISNULL(s.[CurrencyCode-10], '') OR
        ISNULL(t.[StartingDate-12], '') <> ISNULL(s.[StartingDate-12], '') OR
        ISNULL(t.[EndingDate-13], '') <> ISNULL(s.[EndingDate-13], '') OR
        ISNULL(t.[AssigntoNo-34], '') <> ISNULL(s.[AssigntoNo-34], '') OR
        ISNULL(t.[ProductNo-33], '') <> ISNULL(s.[ProductNo-33], '') OR
        ISNULL(t.[Description-29], '') <> ISNULL(s.[Description-29], '') OR
        ISNULL(t.[AssetNo-8], '') <> ISNULL(s.[AssetNo-8], '') OR
        ISNULL(t.[UnitofMeasureCode-15], '') <> ISNULL(s.[UnitofMeasureCode-15], '') OR
        ISNULL(t.[MinimumQuantity-14], '') <> ISNULL(s.[MinimumQuantity-14], '') OR
        ISNULL(t.[LineAmount-27], '') <> ISNULL(s.[LineAmount-27], '') OR
        ISNULL(t.[UnitPrice-17], '') <> ISNULL(s.[UnitPrice-17], '') OR
        ISNULL(t.[DirectUnitCost-31], '') <> ISNULL(s.[DirectUnitCost-31], '') OR
        ISNULL(t.[AllowLineDisc-21], '') <> ISNULL(s.[AllowLineDisc-21], '') OR
        ISNULL(t.[AllowInvoiceDisc-22], '') <> ISNULL(s.[AllowInvoiceDisc-22], '') OR
        ISNULL(t.[PriceIncludesVAT-23], '') <> ISNULL(s.[PriceIncludesVAT-23], '') OR
        ISNULL(t.[WCAR06SalesCommMax-50100], '') <> ISNULL(s.[WCAR06SalesCommMax-50100], '') OR
        ISNULL(t.[WTBAUnitPriceCase-87030], '') <> ISNULL(s.[WTBAUnitPriceCase-87030], '') OR
        ISNULL(t.[WTBAUnitPriceBottle-87040], '') <> ISNULL(s.[WTBAUnitPriceBottle-87040], '') OR
        ISNULL(t.[WTBAPriceCategoryCode-87250], '') <> ISNULL(s.[WTBAPriceCategoryCode-87250], '') OR
        ISNULL(t.[WTCBDeplAllowUnitAmtType-89000], '') <> ISNULL(s.[WTCBDeplAllowUnitAmtType-89000], '') OR
        ISNULL(t.[WTCBDeplAllowUnitAmt-89010], '') <> ISNULL(s.[WTCBDeplAllowUnitAmt-89010], '') OR
        ISNULL(t.[WTCBAllowDeplAllowAmtConv-89060], '') <> ISNULL(s.[WTCBAllowDeplAllowAmtConv-89060], '') OR
        ISNULL(t.[WTPCMixMatchPricing-89200], '') <> ISNULL(s.[WTPCMixMatchPricing-89200], '') OR
        ISNULL(t.[WTPCFamilyPlanPricing-89201], '') <> ISNULL(s.[WTPCFamilyPlanPricing-89201], '') OR
        ISNULL(t.[WTPCCoopPricing-89202], '') <> ISNULL(s.[WTPCCoopPricing-89202], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '')
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------

        DELETE t FROM silver.PriceListLine7001 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[PriceListLine7001] s
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
        'PriceListLine7001',
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