---  Exec usp_IncrementalLoad_GLRegister45
---  select * from [dwh].[silver].[GLRegister45]
---  truncate table [dwh].[silver].[GLRegister45]

CREATE       PROCEDURE silver.usp_IncrementalLoad_GLRegister45
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
        

        INSERT INTO silver.GLRegister45 (
            [JournalBatchName-7],
            [JournalTemplName-12],
            [SourceCode-5],
            [$Company],
            [$DeliveredDateTime],
            [CreationDate-4],
            [CreationTime-11],
            [FromEntryNo-2],
            [FromVATEntryNo-8],
            [No-1],
            [Reversed-10],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [ToEntryNo-3],
            [ToVATEntryNo-9],
            [UserID-6],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate,
            UpdateDate
        )
        SELECT
            s.[JournalBatchName-7],
            s.[JournalTemplName-12],
            s.[SourceCode-5],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            TRY_CONVERT(DATE, NULLIF(s.[CreationDate-4], '')),
            s.[CreationTime-11],
            s.[FromEntryNo-2],
            s.[FromVATEntryNo-8],
            s.[No-1],
            s.[Reversed-10],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[ToEntryNo-3],
            s.[ToVATEntryNo-9],
            s.[UserID-6],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP,
            NULL
        FROM [test_lh].[dbo].[GLRegister45] s
        LEFT JOIN silver.GLRegister45 t 
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
		  
        SET @Inserted = @@ROWCOUNT;


        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[JournalBatchName-7] = s.[JournalBatchName-7],
            t.[JournalTemplName-12] = s.[JournalTemplName-12],
            t.[SourceCode-5] = s.[SourceCode-5],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[CreationDate-4] = TRY_CONVERT(DATE, NULLIF(s.[CreationDate-4], '')),
            t.[CreationTime-11] = s.[CreationTime-11],
            t.[FromEntryNo-2] = s.[FromEntryNo-2],
            t.[FromVATEntryNo-8] = s.[FromVATEntryNo-8],
            t.[No-1] = s.[No-1],
            t.[Reversed-10] = s.[Reversed-10],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[ToEntryNo-3] = s.[ToEntryNo-3],
            t.[ToVATEntryNo-9] = s.[ToVATEntryNo-9],
            t.[UserID-6] = s.[UserID-6],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = CURRENT_TIMESTAMP
        FROM silver.GLRegister45 t
        JOIN [test_lh].[dbo].[GLRegister45] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[JournalBatchName-7], '') <> ISNULL(s.[JournalBatchName-7], '') OR
            ISNULL(t.[JournalTemplName-12], '') <> ISNULL(s.[JournalTemplName-12], '') OR
            ISNULL(t.[SourceCode-5], '') <> ISNULL(s.[SourceCode-5], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[CreationDate-4], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[CreationDate-4], '')), '1900-01-01') OR
            ISNULL(t.[CreationTime-11], '') <> ISNULL(s.[CreationTime-11], '') OR
            ISNULL(t.[FromEntryNo-2], -1) <> ISNULL(s.[FromEntryNo-2], -1) OR
            ISNULL(t.[FromVATEntryNo-8], -1) <> ISNULL(s.[FromVATEntryNo-8], -1) OR
            ISNULL(t.[No-1], -1) <> ISNULL(s.[No-1], -1) OR
            ISNULL(t.[Reversed-10], 0) <> ISNULL(s.[Reversed-10], 0) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[ToEntryNo-3], -1) <> ISNULL(s.[ToEntryNo-3], -1) OR
            ISNULL(t.[ToVATEntryNo-9], -1) <> ISNULL(s.[ToVATEntryNo-9], -1) OR
            ISNULL(t.[UserID-6], '') <> ISNULL(s.[UserID-6], '') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
		   DELETE FROM silver.GLRegister45
	   WHERE [systemId-2000000000] NOT IN (
		   SELECT [systemId-2000000000] FROM [test_lh].[dbo].[GLRegister45]
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
        'GLRegister45',
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