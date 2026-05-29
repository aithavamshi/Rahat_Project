---  Exec silver.usp_IncrementalLoad_WTBARegion87002
---  SELECT * FROM silver.WTBARegion87002
---  TRUNCATE TABLE silver.WTBARegion87002



CREATE     PROCEDURE silver.sp_IncrementalLoad_WTBARegion87002
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
        INSERT INTO silver.WTBARegion87002 (
            [AlternativeCode-20],
            [$Company],
            [$DeliveredDateTime],
            [Code-2],
            [County-1],
            [Name-10],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate,
            UpdateDate
        )
        SELECT
            TRY_CONVERT(VARCHAR(100), NULLIF(s.[AlternativeCode-20], '')),
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[Code-2],
            s.[County-1],
            s.[Name-10],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP,
            NULL
        FROM [test_lh].[dbo].[WTBARegion87002] s
        LEFT JOIN silver.WTBARegion87002 t 
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[AlternativeCode-20] = TRY_CONVERT(VARCHAR(100), NULLIF(s.[AlternativeCode-20], '')) ,
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[Code-2] = s.[Code-2],
            t.[County-1] = s.[County-1],
            t.[Name-10] = s.[Name-10],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = CURRENT_TIMESTAMP
        FROM silver.WTBARegion87002 t
        JOIN [test_lh].[dbo].[WTBARegion87002] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[AlternativeCode-20], '') <> ISNULL(TRY_CONVERT(VARCHAR(100), NULLIF(s.[AlternativeCode-20], '')), '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[Code-2], '') <> ISNULL(s.[Code-2], '') OR
            ISNULL(t.[County-1], '') <> ISNULL(s.[County-1], '') OR
            ISNULL(t.[Name-10], '') <> ISNULL(s.[Name-10], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM silver.WTBARegion87002
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000] FROM [test_lh].[dbo].[WTBARegion87002]
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
        'WTBARegion87002',
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