---  exec silver.usp_IncrementalLoad_WTUSSLALicense88103
---  SELECT * FROM silver.WTUSSLALicense88103
---  TRUNCATE TABLE silver.WTUSSLALicense88103



CREATE             PROCEDURE silver.usp_IncrementalLoad_WTUSSLALicense88103
@RunId VARCHAR(100) = 'RunId'
AS
BEGIN

    ---------------------------------------------------
    -- AUDIT VARIABLES
    ---------------------------------------------------

    DECLARE @StartTime DATETIME = GETDATE();
    DECLARE @EndTime DATETIME;

    DECLARE @Inserted INT = 0;
    DECLARE @Updated  INT = 0;
    DECLARE @Deleted  INT = 0;

    DECLARE @Status VARCHAR(50) = 'Success';
    DECLARE @ErrorMessage VARCHAR(MAX) = '';


    BEGIN TRY

        ---------------------------------------------------
        -- STEP 1: INSERT NEW RECORDS
        ---------------------------------------------------
        INSERT INTO silver.WTUSSLALicense88103 (
            [DelinquentDate-90],
            [FileDateStamp-220],
            [FileName-210],
            [LicenseTypeCode-400],
            [ExpirationDate-440],
            [$Company],
            [County-310],
            [CustomerNo-300],
            [Method-350],
            [SystemCreatedBy-2000000002],
            [systemId-2000000000],
            [$DeliveredDateTime],
            [CustomerLedgerEntryNo-80],
            [Date-20],
            [Delinquent-50],
            [DelinquentAmount-100],
            [EntryNo-1],
            [LicenseCreditCode-420],
            [LicenseNo-10],
            [LicenseStatus-430],
            [LicenseStatusCode-410],
            [SiteLogEntryNo-200],
            [SystemCreatedAt-2000000001],
            [SystemModifiedAt-2000000003],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[DelinquentDate-90],
            s.[FileDateStamp-220],
            s.[FileName-210],
            s.[LicenseTypeCode-400],
            s.[ExpirationDate-440],
            s.[$Company],
            s.[County-310],
            s.[CustomerNo-300],
            s.[Method-350],
            s.[SystemCreatedBy-2000000002],
            s.[systemId-2000000000],
            s.[$DeliveredDateTime],
            s.[CustomerLedgerEntryNo-80],
            s.[Date-20],
            s.[Delinquent-50],
            s.[DelinquentAmount-100],
            s.[EntryNo-1],
            s.[LicenseCreditCode-420],
            s.[LicenseNo-10],
            s.[LicenseStatus-430],
            s.[LicenseStatusCode-410],
            s.[SiteLogEntryNo-200],
            s.[SystemCreatedAt-2000000001],
            s.[SystemModifiedAt-2000000003],
            s.[timestamp-0],
            CURRENT_TIMESTAMP
        FROM [Bronze_2].[dbo].[WTUSSLALicense88103] s
        LEFT JOIN silver.WTUSSLALicense88103 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[DelinquentDate-90] = s.[DelinquentDate-90],
            t.[FileDateStamp-220] = s.[FileDateStamp-220],
            t.[FileName-210] = s.[FileName-210],
            t.[LicenseTypeCode-400] = s.[LicenseTypeCode-400],
            t.[ExpirationDate-440] = s.[ExpirationDate-440],
            t.[$Company] = s.[$Company],
            t.[County-310] = s.[County-310],
            t.[CustomerNo-300] = s.[CustomerNo-300],
            t.[Method-350] = s.[Method-350],
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
            t.[CustomerLedgerEntryNo-80] = s.[CustomerLedgerEntryNo-80],
            t.[Date-20] = s.[Date-20],
            t.[Delinquent-50] = s.[Delinquent-50],
            t.[DelinquentAmount-100] = s.[DelinquentAmount-100],
            t.[EntryNo-1] = s.[EntryNo-1],
            t.[LicenseCreditCode-420] = s.[LicenseCreditCode-420],
            t.[LicenseNo-10] = s.[LicenseNo-10],
            t.[LicenseStatus-430] = s.[LicenseStatus-430],
            t.[LicenseStatusCode-410] = s.[LicenseStatusCode-410],
            t.[SiteLogEntryNo-200] = s.[SiteLogEntryNo-200],
            t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
            t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = CURRENT_TIMESTAMP
        FROM silver.WTUSSLALicense88103 t
        JOIN [Bronze_2].[dbo].[WTUSSLALicense88103] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[DelinquentDate-90], '1900-01-01') <> ISNULL(s.[DelinquentDate-90], '1900-01-01') OR
            ISNULL(t.[FileDateStamp-220], '1900-01-01') <> ISNULL(s.[FileDateStamp-220], '1900-01-01') OR
            ISNULL(t.[FileName-210], '') <> ISNULL(s.[FileName-210], '') OR
            ISNULL(t.[LicenseTypeCode-400], '') <> ISNULL(s.[LicenseTypeCode-400], '') OR
            ISNULL(t.[ExpirationDate-440], '1900-01-01') <> ISNULL(s.[ExpirationDate-440], '1900-01-01') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[County-310], '') <> ISNULL(s.[County-310], '') OR
            ISNULL(t.[CustomerNo-300], '') <> ISNULL(s.[CustomerNo-300], '') OR
            ISNULL(t.[Method-350], '') <> ISNULL(s.[Method-350], '') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(s.[$DeliveredDateTime], '1900-01-01') OR
            ISNULL(t.[CustomerLedgerEntryNo-80], -1) <> ISNULL(s.[CustomerLedgerEntryNo-80], -1) OR
            ISNULL(t.[Date-20], '1900-01-01') <> ISNULL(s.[Date-20], '1900-01-01') OR
            ISNULL(t.[Delinquent-50], 0) <> ISNULL(s.[Delinquent-50], 0) OR
            ISNULL(t.[DelinquentAmount-100], -1) <> ISNULL(s.[DelinquentAmount-100], -1) OR
            ISNULL(t.[EntryNo-1], -1) <> ISNULL(s.[EntryNo-1], -1) OR
            ISNULL(t.[LicenseCreditCode-420], '') <> ISNULL(s.[LicenseCreditCode-420], '') OR
            ISNULL(t.[LicenseNo-10], '') <> ISNULL(s.[LicenseNo-10], '') OR
            ISNULL(t.[LicenseStatus-430], '') <> ISNULL(s.[LicenseStatus-430], '') OR
            ISNULL(t.[LicenseStatusCode-410], '') <> ISNULL(s.[LicenseStatusCode-410], '') OR
            ISNULL(t.[SiteLogEntryNo-200], -1) <> ISNULL(s.[SiteLogEntryNo-200], -1) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(s.[SystemCreatedAt-2000000001], '1900-01-01') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(s.[SystemModifiedAt-2000000003], '1900-01-01') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.WTUSSLALicense88103 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[WTUSSLALicense88103] s
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

    INSERT INTO [dwh].[silver].[silver_audit_log]
    (
        RunId,
        TableName,
        StartTime,
        EndTime,
        Status,
        RowsInserted,
        RowsUpdated,
        RowsDeleted,
        ErrorMessage
    )
    VALUES
    (
        @RunId,
        'WTUSSLALicense88103',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;