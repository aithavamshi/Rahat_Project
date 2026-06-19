CREATE         PROCEDURE silver.usp_IncrementalLoad_BrandPerformanceReport
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
        Insert INTO silver.BrandPerformanceReport (
                [BudgetName-2],
    			[GLAccountNo-3],
    			[Date-4],
    			[GlobalDimension1Code-5],
    			[GlobalDimension2Code-6],
    			[Amount-7],
    			[Description-9],
    			[BusinessUnitCode-10],
    			[UserID-11],
    			[BudgetDimension1Code-12],
    			[BudgetDimension2Code-13],
    			[BudgetDimension3Code-14],
    			[BudgetDimension4Code-15],
    			[LastDateModified-16],
    			[DimensionSetID-480],
    			[timestamp-0],
    			[systemId-2000000000],
                InsertDate,
                UpdateDate
            )
            SELECT
                s.[BudgetName-2],
    			s.[GLAccountNo-3],
    			TRY_CONVERT(DATE, NULLIF(s.[Date-4], '')),
    			s.[GlobalDimension1Code-5],
    			s.[GlobalDimension2Code-6],
    			s.[Amount-7],
    			s.[Description-9],
    			s.[BusinessUnitCode-10],
    			s.[UserID-11],
    			s.[BudgetDimension1Code-12],
    			s.[BudgetDimension2Code-13],
    			s.[BudgetDimension3Code-14],
    			s.[BudgetDimension4Code-15],
    			TRY_CONVERT(DATE, NULLIF(s.[LastDateModified-16], '')),
    			s.[DimensionSetID-480],
    			s.[timestamp-0],
    			s.[systemId-2000000000],
                CURRENT_TIMESTAMP,
                NULL
            FROM [test_lh].[dbo].[GLBudgetEntry96] s
            LEFT JOIN silver.BrandPerformanceReport t
                ON  s.[systemId-2000000000] = t.[systemId-2000000000]
            WHERE t.[systemId-2000000000] IS NULL
            and s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[BudgetName-2] = s.[BudgetName-2],
            t.[GLAccountNo-3] = s.[GLAccountNo-3],
            t.[Date-4] = TRY_CONVERT(DATE, NULLIF(s.[Date-4], '')),
            t.[GlobalDimension1Code-5] = s.[GlobalDimension1Code-5],
            t.[GlobalDimension2Code-6] = s.[GlobalDimension2Code-6],
            t.[Amount-7] = s.[Amount-7],
            t.[Description-9] = s.[Description-9],
            t.[BusinessUnitCode-10] = s.[BusinessUnitCode-10],
            t.[UserID-11] = s.[UserID-11],
            t.[BudgetDimension1Code-12] = s.[BudgetDimension1Code-12],
            t.[BudgetDimension2Code-13] = s.[BudgetDimension2Code-13],
            t.[BudgetDimension3Code-14] = s.[BudgetDimension3Code-14],
            t.[BudgetDimension4Code-15] = s.[BudgetDimension4Code-15],
            t.[LastDateModified-16] = TRY_CONVERT(DATE, NULLIF(s.[LastDateModified-16], '')),
            t.[DimensionSetID-480] = s.[DimensionSetID-480],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = GETDATE()
        FROM silver.BrandPerformanceReport t
        INNER JOIN [test_lh].[dbo].[GLBudgetEntry96] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE 
            ISNULL(t.[BudgetName-2], '') <> ISNULL(s.[BudgetName-2], '') OR
            ISNULL(t.[GLAccountNo-3], '') <> ISNULL(s.[GLAccountNo-3], '') OR
            ISNULL(t.[Date-4], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[Date-4], '')), '1900-01-01') OR
            ISNULL(t.[GlobalDimension1Code-5], '') <> ISNULL(s.[GlobalDimension1Code-5], '') OR
            ISNULL(t.[GlobalDimension2Code-6], '') <> ISNULL(s.[GlobalDimension2Code-6], '') OR
            ISNULL(t.[Amount-7], 0) <> ISNULL(s.[Amount-7], 0) OR
            ISNULL(t.[Description-9], '') <> ISNULL(s.[Description-9], '') OR
            ISNULL(t.[BusinessUnitCode-10], '') <> ISNULL(s.[BusinessUnitCode-10], '') OR
            ISNULL(t.[UserID-11], '') <> ISNULL(s.[UserID-11], '') OR
            ISNULL(t.[BudgetDimension1Code-12], '') <> ISNULL(s.[BudgetDimension1Code-12], '') OR
            ISNULL(t.[BudgetDimension2Code-13], '') <> ISNULL(s.[BudgetDimension2Code-13], '') OR
            ISNULL(t.[BudgetDimension3Code-14], '') <> ISNULL(s.[BudgetDimension3Code-14], '') OR
            ISNULL(t.[BudgetDimension4Code-15], '') <> ISNULL(s.[BudgetDimension4Code-15], '') OR
            ISNULL(t.[LastDateModified-16], '1900-01-01') <> ISNULL(TRY_CONVERT(DATE, NULLIF(s.[LastDateModified-16], '')), '1900-01-01') OR
            ISNULL(t.[DimensionSetID-480], -1) <> ISNULL(s.[DimensionSetID-480], -1) OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
      
            
        DELETE t FROM silver.BrandPerformanceReport t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[GLBudgetEntry96] s
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
        'BrandPerformanceReport',
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