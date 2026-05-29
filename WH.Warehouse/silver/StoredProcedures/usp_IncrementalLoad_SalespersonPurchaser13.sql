---  Exec silver.usp_IncrementalLoad_SalespersonPurchaser13
---  select * from silver.SalespersonPurchaser13
---  TRUNCATE TABLE silver.SalespersonPurchaser13



CREATE       PROCEDURE silver.usp_IncrementalLoad_SalespersonPurchaser13
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
        INSERT INTO silver.SalespersonPurchaser13 (
            [PhoneNo-5053],
            [WTBAFirstName-87000],
            [WTBALastName-87001],
            [WTBASampleBudgetCustNo-87700],
            [WCAR06SalesCommissionCode-50101],
            [WTIAAllocationCode-90101],
            [EMail-5052],
            [SearchEMail-5085],
            [GlobalDimension1Code-5050],
            [JobTitle-5062],
            [$Company],
            [$DeliveredDateTime],
            [Blocked-5087],
            [Code-1],
            [Commission-3],
            --  [CoupledtoCRM-720],
            [Name-2],
            [PrivacyBlocked-150],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [WCAR06CalculateCommission-50100],
            [WTIAAllocate-90100],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
      
        )
        SELECT
            s.[PhoneNo-5053],
            s.[WTBAFirstName-87000],
            s.[WTBALastName-87001],
            s.[WTBASampleBudgetCustNo-87700],
            s.[WCAR06SalesCommissionCode-50101],
            s.[WTIAAllocationCode-90101],
            s.[EMail-5052],
            s.[SearchEMail-5085],
            s.[GlobalDimension1Code-5050],
            s.[JobTitle-5062],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[Blocked-5087],
            s.[Code-1],
            s.[Commission-3],
            --  s.[CoupledtoCRM-720],
            s.[Name-2],
            s.[PrivacyBlocked-150],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[WCAR06CalculateCommission-50100],
            s.[WTIAAllocate-90100],
            s.[systemId-2000000000],
            s.[timestamp-0],
            GETDATE()  -- Set InsertDate to current date/time
           
        FROM [test_lh].[dbo].[SalespersonPurchaser13] s
        LEFT JOIN silver.SalespersonPurchaser13 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
             t.[PhoneNo-5053]                       = s.[PhoneNo-5053],
             t.[WTBAFirstName-87000]                = s.[WTBAFirstName-87000],
             t.[WTBALastName-87001]                 = s.[WTBALastName-87001],
             t.[WTBASampleBudgetCustNo-87700]       = s.[WTBASampleBudgetCustNo-87700],
             t.[WCAR06SalesCommissionCode-50101]    = s.[WCAR06SalesCommissionCode-50101],
             t.[WTIAAllocationCode-90101]           = s.[WTIAAllocationCode-90101],
             t.[EMail-5052]                         = s.[EMail-5052],
             t.[SearchEMail-5085]                   = s.[SearchEMail-5085],
             t.[GlobalDimension1Code-5050]          = s.[GlobalDimension1Code-5050],
             t.[JobTitle-5062]                      = s.[JobTitle-5062],
             t.[$Company]                          = s.[$Company],
             t.[$DeliveredDateTime]                = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
             t.[Blocked-5087]                       = s.[Blocked-5087],
             t.[Code-1]                             = s.[Code-1],
             t.[Commission-3]                       = s.[Commission-3],
             --  t.[CoupledtoCRM-720]                   = s.[CoupledtoCRM-720],
             t.[Name-2]                             = s.[Name-2],
             t.[PrivacyBlocked-150]                 = s.[PrivacyBlocked-150],
             t.[SystemCreatedAt-2000000001]         = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
             t.[SystemCreatedBy-2000000002]         = s.[SystemCreatedBy-2000000002],
             t.[SystemModifiedAt-2000000003]        = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
             t.[WCAR06CalculateCommission-50100]    = s.[WCAR06CalculateCommission-50100],
             t.[WTIAAllocate-90100]                 = s.[WTIAAllocate-90100],
             t.[timestamp-0]                        = s.[timestamp-0],
             t.[UpdateDate]                         = GETDATE()  -- Update UpdateDate to current date/time
        FROM silver.SalespersonPurchaser13 t
        JOIN [test_lh].[dbo].[SalespersonPurchaser13] s
             ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
             ISNULL(t.[PhoneNo-5053], '')                       <> ISNULL(s.[PhoneNo-5053], '') OR
             ISNULL(t.[WTBAFirstName-87000], '')                <> ISNULL(s.[WTBAFirstName-87000], '') OR
             ISNULL(t.[WTBALastName-87001], '')                 <> ISNULL(s.[WTBALastName-87001], '') OR
             ISNULL(t.[WTBASampleBudgetCustNo-87700], '')       <> ISNULL(s.[WTBASampleBudgetCustNo-87700], '') OR
             ISNULL(t.[WCAR06SalesCommissionCode-50101], '')    <> ISNULL(s.[WCAR06SalesCommissionCode-50101], '') OR
             ISNULL(t.[WTIAAllocationCode-90101], '')           <> ISNULL(s.[WTIAAllocationCode-90101], '') OR
             ISNULL(t.[EMail-5052], '')                         <> ISNULL(s.[EMail-5052], '') OR
             ISNULL(t.[SearchEMail-5085], '')                   <> ISNULL(s.[SearchEMail-5085], '') OR
             ISNULL(t.[GlobalDimension1Code-5050], '')          <> ISNULL(s.[GlobalDimension1Code-5050], '') OR
             ISNULL(t.[JobTitle-5062], '')                      <> ISNULL(s.[JobTitle-5062], '') OR
             ISNULL(t.[$Company], '')                          <> ISNULL(s.[$Company], '') OR
             ISNULL(t.[$DeliveredDateTime], '1900-01-01')       <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
             ISNULL(t.[Blocked-5087], 0)                        <> ISNULL(s.[Blocked-5087], 0) OR
             ISNULL(t.[Code-1], '')                             <> ISNULL(s.[Code-1], '') OR
             ISNULL(t.[Commission-3], -1)                       <> ISNULL(s.[Commission-3], -1) OR
             --  ISNULL(t.[CoupledtoCRM-720], 0)                    <> ISNULL(s.[CoupledtoCRM-720], 0) OR
             ISNULL(t.[Name-2], '')                             <> ISNULL(s.[Name-2], '') OR
             ISNULL(t.[PrivacyBlocked-150], 0)                  <> ISNULL(s.[PrivacyBlocked-150], 0) OR
             ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
             ISNULL(t.[SystemCreatedBy-2000000002], '')         <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
             ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01')<> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
             ISNULL(t.[WCAR06CalculateCommission-50100], 0)    <> ISNULL(s.[WCAR06CalculateCommission-50100], 0) OR
             ISNULL(t.[WTIAAllocate-90100], 0)                 <> ISNULL(s.[WTIAAllocate-90100], 0) OR
             ISNULL(t.[timestamp-0], -1)                        <> ISNULL(s.[timestamp-0], -1);
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM silver.SalespersonPurchaser13
        WHERE [systemId-2000000000] NOT IN (
             SELECT [systemId-2000000000] FROM [test_lh].[dbo].[SalespersonPurchaser13]
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
        'SalespersonPurchaser13',
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