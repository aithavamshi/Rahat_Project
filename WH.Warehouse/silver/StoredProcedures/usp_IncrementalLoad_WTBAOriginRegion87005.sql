--Exec silver.usp_IncrementalLoad_WTBAOriginRegion87005
--select * from [dwh].[silver].[WTBAOriginRegion87005]
--Truncate table [dwh].[silver].[WTBAOriginRegion87005]

CREATE     PROCEDURE silver.usp_IncrementalLoad_WTBAOriginRegion87005
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
        INSERT INTO [WH].[silver].[WTBAOriginRegion87005] (
            [Description-10],
            [Code-1],
            [CountryCode-20],
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
            s.[Description-10],
            s.[Code-1],
            s.[CountryCode-20],
            s.[timestamp-0],
            s.[systemId-2000000000],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            CURRENT_TIMESTAMP
        FROM [test_lh].[dbo].[WTBAOriginRegion87005] s
        LEFT JOIN [WH].[silver].[WTBAOriginRegion87005] t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[Description-10] = s.[Description-10],
            t.[Code-1] = s.[Code-1],
            t.[CountryCode-20] = s.[CountryCode-20],
            t.[timestamp-0] = s.[timestamp-0],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[UpdateDate] = CURRENT_TIMESTAMP
        FROM [WH].[silver].[WTBAOriginRegion87005] t
        JOIN [test_lh].[dbo].[WTBAOriginRegion87005] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[Description-10], '') <> ISNULL(s.[Description-10], '') OR
            ISNULL(t.[Code-1], '') <> ISNULL(s.[Code-1], '') OR
            ISNULL(t.[CountryCode-20], '') <> ISNULL(s.[CountryCode-20], '') OR
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
        DELETE FROM [WH].[silver].[WTBAOriginRegion87005]
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000]
            FROM [test_lh].[dbo].[WTBAOriginRegion87005]
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
        'WTBAOriginRegion87005',
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