---  Exec silver.usp_IncrementalLoad_WTBABrand87150
---  SELECT * FROM silver.WTBABrand87150
---  TRUNCATE TABLE silver.WTBABrand87150


CREATE       PROCEDURE silver.usp_IncrementalLoad_WTBABrand87150
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
        INSERT INTO silver.WTBABrand87150 (
            [WTIAAllocationCode-90101],
            [BrandTypeCode-530],
            [$Company],
            [$DeliveredDateTime],
            [BrandOwnership-600],
            [ExcludeFromWebsite-510],
            [Name-20],
            [No-1],
            [ProducerNo-180],
            [SearchName-160],
            [SmallWinery-610],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [WTIAAllocate-90100],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
        )
        SELECT
            s.[WTIAAllocationCode-90101],
            s.[BrandTypeCode-530],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[BrandOwnership-600],
            s.[ExcludeFromWebsite-510],
            s.[Name-20],
            s.[No-1],
            s.[ProducerNo-180],
            s.[SearchName-160],
            s.[SmallWinery-610],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[WTIAAllocate-90100],
            s.[systemId-2000000000],
            s.[timestamp-0],
            SYSDATETIME()
        FROM [test_lh].[dbo].[WTBABrand87150] s
        LEFT JOIN silver.WTBABrand87150 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[WTIAAllocationCode-90101] = s.[WTIAAllocationCode-90101],
            t.[BrandTypeCode-530] = s.[BrandTypeCode-530],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[BrandOwnership-600] = s.[BrandOwnership-600],
            t.[ExcludeFromWebsite-510] = s.[ExcludeFromWebsite-510],
            t.[Name-20] = s.[Name-20],
            t.[No-1] = s.[No-1],
            t.[ProducerNo-180] = s.[ProducerNo-180],
            t.[SearchName-160] = s.[SearchName-160],
            t.[SmallWinery-610] = s.[SmallWinery-610],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[WTIAAllocate-90100] = s.[WTIAAllocate-90100],
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = SYSDATETIME()
        FROM silver.WTBABrand87150 t
        JOIN [test_lh].[dbo].[WTBABrand87150] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[WTIAAllocationCode-90101], '') <> ISNULL(s.[WTIAAllocationCode-90101], '') OR
            ISNULL(t.[BrandTypeCode-530], '') <> ISNULL(s.[BrandTypeCode-530], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[BrandOwnership-600], '') <> ISNULL(s.[BrandOwnership-600], '') OR
            ISNULL(t.[ExcludeFromWebsite-510], 0) <> ISNULL(s.[ExcludeFromWebsite-510], 0) OR
            ISNULL(t.[Name-20], '') <> ISNULL(s.[Name-20], '') OR
            ISNULL(t.[No-1], '') <> ISNULL(s.[No-1], '') OR
            ISNULL(t.[ProducerNo-180], '') <> ISNULL(s.[ProducerNo-180], '') OR
            ISNULL(t.[SearchName-160], '') <> ISNULL(s.[SearchName-160], '') OR
            ISNULL(t.[SmallWinery-610], 0) <> ISNULL(s.[SmallWinery-610], 0) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[WTIAAllocate-90100], 0) <> ISNULL(s.[WTIAAllocate-90100], 0) OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.WTBABrand87150 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[WTBABrand87150] s
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
        'WTBABrand87150',
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