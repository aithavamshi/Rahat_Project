---  Exec silver.usp_IncrementalLoad_WTUSSLACustomerLicense88100
---  SELECT * FROM silver.WTUSSLACustomerLicense88100
---  TRUNCATE TABLE silver.WTUSSLACustomerLicense88100



CREATE       PROCEDURE silver.usp_IncrementalLoad_WTUSSLACustomerLicense88100
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
        INSERT INTO silver.WTUSSLACustomerLicense88100 (
            [EffectiveDate-50],
            [LicenseNoSuffix-35],
            [ErrorMessage-1010],
            [LicenseCreditCode-120],
            [LicenseNoPrefix-30],
            [ExpirationDate-60],
            [LicenseNo-40],
            [LicenseTypeCode-20],
            [LicenseStatusCode-90],
            [$Company],
            [$DeliveredDateTime],
            [County-110],
            [CustomerNo-10],
            [Default-100],
            [Delinquent-70],
            [EntryNo-1],
            [ErrorFlag-1000],
            [LastUpdateDate-500],
            [LastUpdateEntryNo-510],
            [LicenseStatus-300],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[EffectiveDate-50],
            s.[LicenseNoSuffix-35],
            s.[ErrorMessage-1010],
            s.[LicenseCreditCode-120],
            s.[LicenseNoPrefix-30],
            s.[ExpirationDate-60],
            s.[LicenseNo-40],
            s.[LicenseTypeCode-20],
            s.[LicenseStatusCode-90],
            s.[$Company],
            s.[$DeliveredDateTime],
            s.[County-110],
            s.[CustomerNo-10],
            s.[Default-100],
            s.[Delinquent-70],
            s.[EntryNo-1],
            s.[ErrorFlag-1000],
            s.[LastUpdateDate-500],
            s.[LastUpdateEntryNo-510],
            s.[LicenseStatus-300],
            s.[SystemCreatedAt-2000000001],
            s.[SystemCreatedBy-2000000002],
            s.[SystemModifiedAt-2000000003],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP
        FROM [test_lh].[dbo].[WTUSSLACustomerLicense88100] s
        LEFT JOIN silver.WTUSSLACustomerLicense88100 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[EffectiveDate-50] = s.[EffectiveDate-50],
            t.[LicenseNoSuffix-35] = s.[LicenseNoSuffix-35],
            t.[ErrorMessage-1010] = s.[ErrorMessage-1010],
            t.[LicenseCreditCode-120] = s.[LicenseCreditCode-120],
            t.[LicenseNoPrefix-30] = s.[LicenseNoPrefix-30],
            t.[ExpirationDate-60] = s.[ExpirationDate-60],
            t.[LicenseNo-40] = s.[LicenseNo-40],
            t.[LicenseTypeCode-20] = s.[LicenseTypeCode-20],
            t.[LicenseStatusCode-90] = s.[LicenseStatusCode-90],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
            t.[County-110] = s.[County-110],
            t.[CustomerNo-10] = s.[CustomerNo-10],
            t.[Default-100] = s.[Default-100],
            t.[Delinquent-70] = s.[Delinquent-70],
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[ErrorFlag-1000] = s.[ErrorFlag-1000],
            t.[LastUpdateDate-500] = s.[LastUpdateDate-500],
            t.[LastUpdateEntryNo-510] = s.[LastUpdateEntryNo-510],
            t.[LicenseStatus-300] = s.[LicenseStatus-300],
            t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = CURRENT_TIMESTAMP
        FROM silver.WTUSSLACustomerLicense88100 t
        JOIN [test_lh].[dbo].[WTUSSLACustomerLicense88100] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[EffectiveDate-50], '1900-01-01') <> ISNULL(s.[EffectiveDate-50], '1900-01-01') OR
            ISNULL(t.[LicenseNoSuffix-35], '') <> ISNULL(s.[LicenseNoSuffix-35], '') OR
            ISNULL(t.[ErrorMessage-1010], '') <> ISNULL(s.[ErrorMessage-1010], '') OR
            ISNULL(t.[LicenseCreditCode-120], '') <> ISNULL(s.[LicenseCreditCode-120], '') OR
            ISNULL(t.[LicenseNoPrefix-30], '') <> ISNULL(s.[LicenseNoPrefix-30], '') OR
            ISNULL(t.[ExpirationDate-60], '1900-01-01') <> ISNULL(s.[ExpirationDate-60], '1900-01-01') OR
            ISNULL(t.[LicenseNo-40], '') <> ISNULL(s.[LicenseNo-40], '') OR
            ISNULL(t.[LicenseTypeCode-20], '') <> ISNULL(s.[LicenseTypeCode-20], '') OR
            ISNULL(t.[LicenseStatusCode-90], '') <> ISNULL(s.[LicenseStatusCode-90], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(s.[$DeliveredDateTime], '1900-01-01') OR
            ISNULL(t.[County-110], '') <> ISNULL(s.[County-110], '') OR
            ISNULL(t.[CustomerNo-10], '') <> ISNULL(s.[CustomerNo-10], '') OR
            ISNULL(t.[Default-100], 0) <> ISNULL(s.[Default-100], 0) OR
            ISNULL(t.[Delinquent-70], 0) <> ISNULL(s.[Delinquent-70], 0) OR
            ISNULL(t.[EntryNo-1], '') <> ISNULL(s.[EntryNo-1], '') OR
            ISNULL(t.[ErrorFlag-1000], '') <> ISNULL(s.[ErrorFlag-1000], '') OR
            ISNULL(t.[LastUpdateDate-500], '') <> ISNULL(s.[LastUpdateDate-500], '') OR
            ISNULL(t.[LastUpdateEntryNo-510], '') <> ISNULL(s.[LastUpdateEntryNo-510], '') OR
            ISNULL(t.[LicenseStatus-300], '') <> ISNULL(s.[LicenseStatus-300], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        --------------------------------------------------- 
        DELETE t FROM silver.WTUSSLACustomerLicense88100 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[WTUSSLACustomerLicense88100] s
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
        'WTUSSLACustomerLicense88100',
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