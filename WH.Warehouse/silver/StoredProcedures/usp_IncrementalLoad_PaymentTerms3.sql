---  exec silver.usp_IncrementalLoad_PaymentTerms3
---  select * from [dwh].[silver].[PaymentTerms3]
---  TRUNCATE TABLE [dwh].[silver].[PaymentTerms3]



CREATE     PROCEDURE silver.usp_IncrementalLoad_PaymentTerms3
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
        INSERT INTO silver.PaymentTerms3 (
        [DiscountDateCalculation-3],
        [$Company],
        [$DeliveredDateTime],
        [CalcPmtDisconCrMemos-6],
        [Code-1],
        --  [CoupledtoCRM-720],
        [Description-5],
        [Discount-4],
        [DueDateCalculation-2],
        [LastModifiedDateTime-8],
        [SystemCreatedAt-2000000001],
        [SystemCreatedBy-2000000002],
        [SystemModifiedAt-2000000003],
        [systemId-2000000000],
        [timestamp-0],
        [InsertDate]
       
        )
        SELECT
            s.[DiscountDateCalculation-3],
        s.[$Company],
        s.[$DeliveredDateTime],
        s.[CalcPmtDisconCrMemos-6],
        s.[Code-1],
        --  s.[CoupledtoCRM-720],
        s.[Description-5],
        s.[Discount-4],
        s.[DueDateCalculation-2],
        s.[LastModifiedDateTime-8],
        s.[SystemCreatedAt-2000000001],
        s.[SystemCreatedBy-2000000002],
        s.[SystemModifiedAt-2000000003],
        s.[systemId-2000000000],
        s.[timestamp-0],
        GETDATE()
      
        FROM [test_lh].[dbo].[PaymentTerms3] s
        LEFT JOIN silver.PaymentTerms3 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET 
            t.[DiscountDateCalculation-3] = s.[DiscountDateCalculation-3],
        t.[$Company] = s.[$Company],
        t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
        t.[CalcPmtDisconCrMemos-6] = s.[CalcPmtDisconCrMemos-6],
        t.[Code-1] = s.[Code-1],
        --  t.[CoupledtoCRM-720] = s.[CoupledtoCRM-720],
        t.[Description-5] = s.[Description-5],
        t.[Discount-4] = s.[Discount-4],
        t.[DueDateCalculation-2] = s.[DueDateCalculation-2],
        t.[LastModifiedDateTime-8] = s.[LastModifiedDateTime-8],
        t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
        t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
        t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
        t.[systemId-2000000000] = s.[systemId-2000000000],
        t.[timestamp-0] = s.[timestamp-0],
        t.[UpdateDate] = GETDATE()
        FROM silver.PaymentTerms3 t
        INNER JOIN [test_lh].[dbo].[PaymentTerms3] s
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE 
            ISNULL(t.[DiscountDateCalculation-3], '') <> ISNULL(s.[DiscountDateCalculation-3], '') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '') OR
        ISNULL(t.[CalcPmtDisconCrMemos-6], '') <> ISNULL(s.[CalcPmtDisconCrMemos-6], '') OR
        ISNULL(t.[Code-1], '') <> ISNULL(s.[Code-1], '') OR
        --  ISNULL(t.[CoupledtoCRM-720], '') <> ISNULL(s.[CoupledtoCRM-720], '') OR
        ISNULL(t.[Description-5], '') <> ISNULL(s.[Description-5], '') OR
        ISNULL(t.[Discount-4], '') <> ISNULL(s.[Discount-4], '') OR
        ISNULL(t.[DueDateCalculation-2], '') <> ISNULL(s.[DueDateCalculation-2], '') OR
        ISNULL(t.[LastModifiedDateTime-8], '') <> ISNULL(s.[LastModifiedDateTime-8], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '');
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM silver.PaymentTerms3
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000]
            FROM [test_lh].[dbo].[PaymentTerms3]
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
        'PaymentTerms3',
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