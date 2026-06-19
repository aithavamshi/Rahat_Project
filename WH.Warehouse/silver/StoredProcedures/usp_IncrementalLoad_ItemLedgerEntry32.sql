---  Exec silver.usp_IncrementalLoad_ItemLedgerEntry32
---  select * from [WH].[silver].[ItemLedgerEntry32]
---  TRUNCATE TABLE [WH].[silver].[ItemLedgerEntry32]

CREATE                     PROCEDURE silver.usp_IncrementalLoad_ItemLedgerEntry32
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
        INSERT INTO silver.[ItemLedgerEntry32] (
            [$Company],
            [EntryNo-1],
            [EntryType-4],
            [DocumentNo-6],
            [ItemNo-2],
            [Description-7],
            [PostingDate-3],
            [DocumentDate-60],
            [Quantity-12],
            [RemainingQuantity-13],
            [LocationCode-8],
            [GlobalDimension1Code-33],
            [ShptMethodCode-40],
            [SourceType-41],
            [SourceNo-5],
            [UnitofMeasureCode-5407],
            [WTBALiters-87300],
            [WTBAGallons-87301],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
        )
        SELECT
            s.[$Company],
            s.[EntryNo-1],
            s.[EntryType-4],
            s.[DocumentNo-6],
            s.[ItemNo-2],
            s.[Description-7],
            s.[PostingDate-3],
            s.[DocumentDate-60],
            s.[Quantity-12],
            s.[RemainingQuantity-13],
            s.[LocationCode-8],
            s.[GlobalDimension1Code-33],
            s.[ShptMethodCode-40],
            s.[SourceType-41],
            s.[SourceNo-5],
            s.[UnitofMeasureCode-5407],
            s.[WTBALiters-87300],
            s.[WTBAGallons-87301],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[systemId-2000000000],
            s.[timestamp-0],
            SYSDATETIME()  -- InsertDate
        FROM [test_lh].[dbo].[ItemLedgerEntry32] s
        LEFT JOIN silver.ItemLedgerEntry32 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[$Company] = s.[$Company],
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[EntryType-4] = s.[EntryType-4],
            t.[DocumentNo-6] = s.[DocumentNo-6],
            t.[ItemNo-2] = s.[ItemNo-2],
            t.[Description-7] = s.[Description-7],
            t.[PostingDate-3] = s.[PostingDate-3],
            t.[DocumentDate-60] = s.[DocumentDate-60],
            t.[Quantity-12] = s.[Quantity-12],
            t.[RemainingQuantity-13] = s.[RemainingQuantity-13],
            t.[LocationCode-8] = s.[LocationCode-8],
            t.[GlobalDimension1Code-33] = s.[GlobalDimension1Code-33],
            t.[ShptMethodCode-40] = s.[ShptMethodCode-40],
            t.[SourceType-41] = s.[SourceType-41],
            t.[SourceNo-5] = s.[SourceNo-5],
            t.[UnitofMeasureCode-5407] = s.[UnitofMeasureCode-5407],
            t.[WTBALiters-87300] = s.[WTBALiters-87300],
            t.[WTBAGallons-87301] = s.[WTBAGallons-87301],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = SYSDATETIME()
        FROM silver.ItemLedgerEntry32 t
        JOIN [test_lh].[dbo].[ItemLedgerEntry32] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[EntryNo-1], -1) <> ISNULL(s.[EntryNo-1], -1) OR
            ISNULL(t.[EntryType-4], '') <> ISNULL(s.[EntryType-4], '') OR
            ISNULL(t.[DocumentNo-6], '') <> ISNULL(s.[DocumentNo-6],'') OR
            ISNULL(t.[ItemNo-2], '') <> ISNULL(s.[ItemNo-2], '') OR
            ISNULL(t.[Description-7],'') <> ISNULL(s.[Description-7],'') OR
            ISNULL(t.[PostingDate-3], '1900-01-01') <> ISNULL(s.[PostingDate-3], '1900-01-01') OR
            ISNULL(t.[DocumentDate-60], '1900-01-01') <> ISNULL(s.[DocumentDate-60], '1900-01-01') OR
            ISNULL(t.[Quantity-12], -99999) <> ISNULL(s.[Quantity-12], -99999) OR
            ISNULL(t.[RemainingQuantity-13], -99999) <> ISNULL(s.[RemainingQuantity-13], -99999) OR
            ISNULL(t.[LocationCode-8],'') <> ISNULL(s.[LocationCode-8],'') OR
            ISNULL(t.[GlobalDimension1Code-33],'') <> ISNULL(s.[GlobalDimension1Code-33],'') OR
            ISNULL(t.[ShptMethodCode-40],'') <> ISNULL(s.[ShptMethodCode-40],'') OR
            ISNULL(t.[SourceType-41],'') <> ISNULL(s.[SourceType-41],'') OR
            ISNULL(t.[SourceNo-5],'') <> ISNULL(s.[SourceNo-5],'') OR
            ISNULL(t.[UnitofMeasureCode-5407],'') <> ISNULL(s.[UnitofMeasureCode-5407],'') OR
            ISNULL(t.[WTBALiters-87300], -99999) <> ISNULL(s.[WTBALiters-87300], -99999) OR
            ISNULL(t.[WTBAGallons-87301], -99999) <> ISNULL(s.[WTBAGallons-87301], -99999) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.ItemLedgerEntry32 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[ItemLedgerEntry32] s
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
        'ItemLedgerEntry32',
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