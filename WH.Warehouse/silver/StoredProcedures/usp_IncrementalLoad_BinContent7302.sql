--Exec silver.usp_IncrementalLoad_BinContent7302
--select * from [WH].[silver].[BinContent7302]
--Truncate table [WH].[silver].[BinContent7302]

 
CREATE     PROCEDURE silver.usp_IncrementalLoad_BinContent7302
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
                INSERT INTO [dwh].[silver].[BinContent7302] (
            [LocationCode-1],
            [BinCode-3],
            [ItemNo-4],
            [BlockMovement-12],
            [MinQty-15],
            [MaxQty-16],
            [BinRanking-21],
            [Fixed-37],
            [CrossDockBin-40],
            [Default-41],
            [QtyperUnitofMeasure-5404],
            [UnitofMeasureCode-5407],
            [Dedicated-6502],
            [timestamp-0],
            [systemId-2000000000],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [$Company],
            [$DeliveredDateTime],
            [InsertDate]
        )
        SELECT
            s.[LocationCode-1],
            s.[BinCode-3],
            s.[ItemNo-4],
            s.[BlockMovement-12],
            s.[MinQty-15],
            s.[MaxQty-16],
            s.[BinRanking-21],
            s.[Fixed-37],
            s.[CrossDockBin-40],
            s.[Default-41],
            s.[QtyperUnitofMeasure-5404],
            s.[UnitofMeasureCode-5407],
            s.[Dedicated-6502],
            s.[timestamp-0],
            s.[systemId-2000000000],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            CURRENT_TIMESTAMP
        FROM [test_lh].[dbo].[BinContent7302] s
        LEFT JOIN [WH].[silver].[BinContent7302] t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[LocationCode-1] = s.[LocationCode-1],
            t.[BinCode-3] = s.[BinCode-3],
            t.[ItemNo-4] = s.[ItemNo-4],
            t.[BlockMovement-12] = s.[BlockMovement-12],
            t.[MinQty-15] = s.[MinQty-15],
            t.[MaxQty-16] = s.[MaxQty-16],
            t.[BinRanking-21] = s.[BinRanking-21],
            t.[Fixed-37] = s.[Fixed-37],
            t.[CrossDockBin-40] = s.[CrossDockBin-40],
            t.[Default-41] = s.[Default-41],
            t.[QtyperUnitofMeasure-5404] = s.[QtyperUnitofMeasure-5404],
            t.[UnitofMeasureCode-5407] = s.[UnitofMeasureCode-5407],
            t.[Dedicated-6502] = s.[Dedicated-6502],
            t.[timestamp-0] = s.[timestamp-0],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[UpdateDate] = CURRENT_TIMESTAMP
        FROM [Wh].[silver].[BinContent7302] t
        JOIN [test_lh].[dbo].[BinContent7302] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[LocationCode-1], '') <> ISNULL(s.[LocationCode-1], '') OR
            ISNULL(t.[BinCode-3], '') <> ISNULL(s.[BinCode-3], '') OR
            ISNULL(t.[ItemNo-4], '') <> ISNULL(s.[ItemNo-4], '') OR
            ISNULL(t.[BlockMovement-12], '') <> ISNULL(s.[BlockMovement-12], '') OR
            ROUND(ISNULL(t.[MinQty-15], -999999.99),3) <> ROUND(ISNULL(s.[MinQty-15], -999999.99),3) OR
            ROUND(ISNULL(t.[MaxQty-16], -999999.99),3) <> ROUND(ISNULL(s.[MaxQty-16], -999999.99),3) OR
            ROUND(ISNULL(t.[BinRanking-21], -1),3) <> ROUND(ISNULL(s.[BinRanking-21], -1),3) OR
            ROUND(ISNULL(t.[Fixed-37], 0),3) <> ROUND(ISNULL(s.[Fixed-37], 0),3) OR
            ROUND(ISNULL(t.[CrossDockBin-40], 0),3) <> ROUND(ISNULL(s.[CrossDockBin-40], 0),3) OR
            ROUND(ISNULL(t.[Default-41], 0),3) <> ROUND(ISNULL(s.[Default-41], 0),3) OR
            ROUND(ISNULL(t.[QtyperUnitofMeasure-5404], -999999.99),3) <> ROUND(ISNULL(s.[QtyperUnitofMeasure-5404], -999999.99),3) OR
            ISNULL(t.[UnitofMeasureCode-5407], '') <> ISNULL(s.[UnitofMeasureCode-5407], '') OR
            ROUND(ISNULL(t.[Dedicated-6502], 0),3) <> ROUND(ISNULL(s.[Dedicated-6502], 0),3) OR
            ROUND(ISNULL(t.[timestamp-0], -1),3) <> ROUND(ISNULL(s.[timestamp-0], -1),3) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01');


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
          DELETE FROM [dwh].[silver].[BinContent7302]
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000]
            FROM [test_lh].[dbo].[BinContent7302]
            WHERE [systemId-2000000000] IS NOT NULL
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
        'BinContent7302',
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