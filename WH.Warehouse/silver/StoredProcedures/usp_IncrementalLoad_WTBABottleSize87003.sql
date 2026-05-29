---  Exec silver.usp_IncrementalLoad_WTBABottleSize87003
---  select * from silver.WTBABottleSize87003
---  TRUNCATE TABLE silver.WTBABottleSize87003

--SELECT * FROM silver.WTBABottleSize87003 
--WHERE [systemId-2000000000] = '{4745F6CE-1701-F111-8405-7C1E52F51665}'

CREATE       PROCEDURE silver.usp_IncrementalLoad_WTBABottleSize87003
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
        INSERT INTO silver.WTBABottleSize87003 (
            [$Company],
            [$DeliveredDateTime],
            [Code-1],
            [Description-10],
            [Gallons-40],
            [Liters-20],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [Type-100],
            [UnitSize-50],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[Code-1],
            s.[Description-10],
            s.[Gallons-40],
            s.[Liters-20],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[Type-100],
            s.[UnitSize-50],
            s.[systemId-2000000000],
            s.[timestamp-0],
            GETDATE()
        FROM [test_lh].[dbo].[WTBABottleSize87003] s
        LEFT JOIN silver.WTBABottleSize87003 t 
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL;        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[Code-1] = s.[Code-1],
            t.[Description-10] = s.[Description-10],
            t.[Gallons-40] = s.[Gallons-40],
            t.[Liters-20] = s.[Liters-20],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[Type-100] = s.[Type-100],
            t.[UnitSize-50] = s.[UnitSize-50],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = GETDATE()
        FROM silver.WTBABottleSize87003 t
        JOIN [test_lh].[dbo].[WTBABottleSize87003] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[Code-1], '') <> ISNULL(s.[Code-1], '') OR
            ISNULL(t.[Description-10], '') <> ISNULL(s.[Description-10], '') OR
            ISNULL(t.[Gallons-40], -1) <> ISNULL(s.[Gallons-40], -1) OR
            ISNULL(t.[Liters-20], -1) <> ISNULL(s.[Liters-20], -1) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[Type-100], '') <> ISNULL(s.[Type-100], '') OR
            ISNULL(t.[UnitSize-50], -1) <> ISNULL(s.[UnitSize-50], -1) OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
         DELETE FROM silver.WTBABottleSize87003
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000] FROM [test_lh].[dbo].[WTBABottleSize87003]
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
        'WTBABottleSize87003',
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