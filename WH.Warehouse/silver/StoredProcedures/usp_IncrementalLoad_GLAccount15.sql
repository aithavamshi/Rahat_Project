---  Exec silver.usp_IncrementalLoad_GLAccount15
---  select * from silver.GLAccount15
---  TRUNCATE TABLE silver.GLAccount15

CREATE       PROCEDURE silver.usp_IncrementalLoad_GLAccount15
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
        INSERT INTO silver.GLAccount15 (
            [GlobalDimension1Code-6],
            [$Company],
            [$DeliveredDateTime],
            [AccountCategory-8],
            [AccountType-4],
            [Blocked-13],
            [DebitCredit-10],
            [DirectPosting-14],
            [GenPostingType-43],
            [IncomeBalance-9],
            [Name-2],
            [No-1],
            [SearchName-3],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[GlobalDimension1Code-6],
            s.[$Company],
            TRY_CAST(NULLIF(s.[$DeliveredDateTime], '') AS DATETIME2(3)),
            s.[AccountCategory-8],
            s.[AccountType-4],
            s.[Blocked-13],
            s.[DebitCredit-10],
            s.[DirectPosting-14],
            s.[GenPostingType-43],
            s.[IncomeBalance-9],
            s.[Name-2],
            s.[No-1],
            s.[SearchName-3],
            TRY_CAST(NULLIF(s.[SystemCreatedAt-2000000001], '') AS DATETIME2(3)),
            s.[SystemCreatedBy-2000000002],
            TRY_CAST(NULLIF(s.[SystemModifiedAt-2000000003], '') AS DATETIME2(3)),
            s.[systemId-2000000000],
            s.[timestamp-0],
            GETDATE()
        FROM [test_lh].[dbo].[GLAccount15] s
        LEFT JOIN silver.GLAccount15 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
            SET
                [GlobalDimension1Code-6] = s.[GlobalDimension1Code-6],
                [$Company] = s.[$Company],
                [$DeliveredDateTime] = TRY_CAST(NULLIF(s.[$DeliveredDateTime], '') AS DATETIME2(3)),
                [AccountCategory-8] = s.[AccountCategory-8],
                [AccountType-4] = s.[AccountType-4],
                [Blocked-13] = s.[Blocked-13],
                [DebitCredit-10] = s.[DebitCredit-10],
                [DirectPosting-14] = s.[DirectPosting-14],
                [GenPostingType-43] = s.[GenPostingType-43],
                [IncomeBalance-9] = s.[IncomeBalance-9],
                [Name-2] = s.[Name-2],
                [No-1] = s.[No-1],
                [SearchName-3] = s.[SearchName-3],
                [SystemCreatedAt-2000000001] = TRY_CAST(NULLIF(s.[SystemCreatedAt-2000000001], '') AS DATETIME2(3)),
                [SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
                [SystemModifiedAt-2000000003] = TRY_CAST(NULLIF(s.[SystemModifiedAt-2000000003], '') AS DATETIME2(3)),
                [timestamp-0] = s.[timestamp-0],
                UpdateDate = GETDATE()
            FROM silver.GLAccount15 t
            JOIN [test_lh].[dbo].[GLAccount15] s
                ON t.[systemId-2000000000] = s.[systemId-2000000000]
            WHERE
                ISNULL(t.[GlobalDimension1Code-6], '') <> ISNULL(s.[GlobalDimension1Code-6], '') OR
                ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
                ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CAST(NULLIF(s.[$DeliveredDateTime], '') AS DATETIME2(3)), '1900-01-01') OR
                ISNULL(t.[AccountCategory-8], '') <> ISNULL(s.[AccountCategory-8], '') OR
                ISNULL(t.[AccountType-4], '') <> ISNULL(s.[AccountType-4], '') OR
                ISNULL(t.[Blocked-13], 0) <> ISNULL(s.[Blocked-13], 0) OR
                ISNULL(t.[DebitCredit-10], '') <> ISNULL(s.[DebitCredit-10], '') OR
                ISNULL(t.[DirectPosting-14], 0) <> ISNULL(s.[DirectPosting-14], 0) OR
                ISNULL(t.[GenPostingType-43], '') <> ISNULL(s.[GenPostingType-43], '') OR
                ISNULL(t.[IncomeBalance-9], '') <> ISNULL(s.[IncomeBalance-9], '') OR
                ISNULL(t.[Name-2], '') <> ISNULL(s.[Name-2], '') OR
                ISNULL(t.[No-1], '') <> ISNULL(s.[No-1], '') OR
                ISNULL(t.[SearchName-3], '') <> ISNULL(s.[SearchName-3], '') OR
                ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CAST(NULLIF(s.[SystemCreatedAt-2000000001], '') AS DATETIME2(3)), '1900-01-01') OR
                ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
                ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CAST(NULLIF(s.[SystemModifiedAt-2000000003], '') AS DATETIME2(3)), '1900-01-01') OR
                ISNULL(t.[timestamp-0], 0) <> ISNULL(s.[timestamp-0], 0);

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
               DELETE FROM silver.GLAccount15
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000]
            FROM [test_lh].[dbo].[GLAccount15]
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
        'GLAccount15',
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