---  Exec silver.usp_IncrementalLoad_WTUSItemRegistration88154
---  select * from silver.WTUSItemRegistration88154
---  TRUNCATE TABLE silver.WTUSItemRegistration88154


CREATE       PROCEDURE silver.usp_IncrementalLoad_WTUSItemRegistration88154
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
        INSERT INTO silver.WTUSItemRegistration88154 (
            [ExpirationDate-110],
            [Description-50],
            [BrandNo-5],
            [StartDate-100],
            [RegistrationNo-40],
            [$Company],
            [$DeliveredDateTime],
            [Exclude-60],
            [ItemNo-1],
            [SalesRegionCode-2],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
        )
        SELECT
            s.[ExpirationDate-110],
            s.[Description-50],
            s.[BrandNo-5],
            s.[StartDate-100],
            s.[RegistrationNo-40],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[Exclude-60],
            s.[ItemNo-1],
            s.[SalesRegionCode-2],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[systemId-2000000000],
            s.[timestamp-0],
            SYSDATETIME()
        FROM [test_lh].[dbo].[WTUSItemRegistration88154] s
        LEFT JOIN silver.WTUSItemRegistration88154 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[ExpirationDate-110] = s.[ExpirationDate-110],
            t.[Description-50] = s.[Description-50],
            t.[BrandNo-5] = s.[BrandNo-5],
            t.[StartDate-100] = s.[StartDate-100],
            t.[RegistrationNo-40] = s.[RegistrationNo-40],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[Exclude-60] = s.[Exclude-60],
            t.[ItemNo-1] = s.[ItemNo-1],
            t.[SalesRegionCode-2] = s.[SalesRegionCode-2],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = SYSDATETIME()
        FROM silver.WTUSItemRegistration88154 t
        JOIN [test_lh].[dbo].[WTUSItemRegistration88154] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[ExpirationDate-110], '1900-01-01') <> ISNULL(s.[ExpirationDate-110], '1900-01-01') OR
            ISNULL(t.[Description-50], '') <> ISNULL(s.[Description-50], '') OR
            ISNULL(t.[BrandNo-5], '') <> ISNULL(s.[BrandNo-5], '') OR
            ISNULL(t.[StartDate-100], '1900-01-01') <> ISNULL(s.[StartDate-100], '1900-01-01') OR
            ISNULL(t.[RegistrationNo-40], '') <> ISNULL(s.[RegistrationNo-40], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[Exclude-60], 0) <> ISNULL(s.[Exclude-60], 0) OR
            ISNULL(t.[ItemNo-1], '') <> ISNULL(s.[ItemNo-1], '') OR
            ISNULL(t.[SalesRegionCode-2], '') <> ISNULL(s.[SalesRegionCode-2], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------

        DELETE t FROM silver.WTUSItemRegistration88154 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[WTUSItemRegistration88154] s
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
        'WTUSItemRegistration88154',
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