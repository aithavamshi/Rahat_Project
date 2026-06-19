---  Exec silver.usp_IncrementalLoad_WTBAProducer87156
---  SELECT * FROM silver.WTBAProducer87156
---  TRUNCATE TABLE silver.WTBAProducer87156


CREATE             PROCEDURE silver.usp_IncrementalLoad_WTBAProducer87156
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


    BEGIN TRY

        ---------------------------------------------------
        -- STEP 1: INSERT NEW RECORDS
        ---------------------------------------------------
        INSERT INTO silver.WTBAProducer87156 (
            [ProducerTypeCode-530],
            [HomePage-150],
            [Address2-50],
            [FDARegExpirationDate-810],
            [Name2-30],
            [FDARegistrationNo-800],
            [FaxNo-130],
            [County-80],
            [CountryRegionCode-90],
            [Email-140],
            [PhoneNo-120],
            [PostCode-70],
            [Address-40],
            [City-60],
            [Name-20],
            [SearchName-160],
            [VendorNo-10],
            [$Company],
            [$DeliveredDateTime],
            [ExcludeFromWebsite-510],
            [No-1],
            [SmallWinery-610],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
        )
        SELECT
            s.[ProducerTypeCode-530],
            s.[HomePage-150],
            s.[Address2-50],
            TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[FDARegExpirationDate-810] AS VARCHAR), '')),
            s.[Name2-30],
            s.[FDARegistrationNo-800],
            s.[FaxNo-130],
            s.[County-80],
            s.[CountryRegionCode-90],
            s.[Email-140],
            s.[PhoneNo-120],
            s.[PostCode-70],
            s.[Address-40],
            s.[City-60],
            s.[Name-20],
            s.[SearchName-160],
            s.[VendorNo-10],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[$DeliveredDateTime] AS VARCHAR), '')),
            s.[ExcludeFromWebsite-510],
            s.[No-1],
            s.[SmallWinery-610],
            TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemCreatedAt-2000000001] AS VARCHAR), '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemModifiedAt-2000000003] AS VARCHAR), '')),
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP
        FROM [Bronze_2].[dbo].[WTBAProducer87156] s
        LEFT JOIN silver.WTBAProducer87156 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[ProducerTypeCode-530] = s.[ProducerTypeCode-530],
            t.[HomePage-150] = s.[HomePage-150],
            t.[Address2-50] = s.[Address2-50],
            t.[FDARegExpirationDate-810] = TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[FDARegExpirationDate-810] AS VARCHAR), '')),
            t.[Name2-30] = s.[Name2-30],
            t.[FDARegistrationNo-800] = s.[FDARegistrationNo-800],
            t.[FaxNo-130] = s.[FaxNo-130],
            t.[County-80] = s.[County-80],
            t.[CountryRegionCode-90] = s.[CountryRegionCode-90],
            t.[Email-140] = s.[Email-140],
            t.[PhoneNo-120] = s.[PhoneNo-120],
            t.[PostCode-70] = s.[PostCode-70],
            t.[Address-40] = s.[Address-40],
            t.[City-60] = s.[City-60],
            t.[Name-20] = s.[Name-20],
            t.[SearchName-160] = s.[SearchName-160],
            t.[VendorNo-10] = s.[VendorNo-10],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[$DeliveredDateTime] AS VARCHAR), '')),
            t.[ExcludeFromWebsite-510] = s.[ExcludeFromWebsite-510],
            t.[No-1] = s.[No-1],
            t.[SmallWinery-610] = s.[SmallWinery-610],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemCreatedAt-2000000001] AS VARCHAR), '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemModifiedAt-2000000003] AS VARCHAR), '')),
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = CURRENT_TIMESTAMP
        FROM silver.WTBAProducer87156 t
        JOIN [Bronze_2].[dbo].[WTBAProducer87156] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[ProducerTypeCode-530], '') <> ISNULL(s.[ProducerTypeCode-530], '') OR
            ISNULL(t.[HomePage-150], '') <> ISNULL(s.[HomePage-150], '') OR
            ISNULL(t.[Address2-50], '') <> ISNULL(s.[Address2-50], '') OR
            ISNULL(t.[FDARegExpirationDate-810], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[FDARegExpirationDate-810] AS VARCHAR), '')), '1900-01-01') OR
            ISNULL(t.[Name2-30], '') <> ISNULL(s.[Name2-30], '') OR
            ISNULL(t.[FDARegistrationNo-800], '') <> ISNULL(s.[FDARegistrationNo-800], '') OR
            ISNULL(t.[FaxNo-130], '') <> ISNULL(s.[FaxNo-130], '') OR
            ISNULL(t.[County-80], '') <> ISNULL(s.[County-80], '') OR
            ISNULL(t.[CountryRegionCode-90], '') <> ISNULL(s.[CountryRegionCode-90], '') OR
            ISNULL(t.[Email-140], '') <> ISNULL(s.[Email-140], '') OR
            ISNULL(t.[PhoneNo-120], '') <> ISNULL(s.[PhoneNo-120], '') OR
            ISNULL(t.[PostCode-70], '') <> ISNULL(s.[PostCode-70], '') OR
            ISNULL(t.[Address-40], '') <> ISNULL(s.[Address-40], '') OR
            ISNULL(t.[City-60], '') <> ISNULL(s.[City-60], '') OR
            ISNULL(t.[Name-20], '') <> ISNULL(s.[Name-20], '') OR
            ISNULL(t.[SearchName-160], '') <> ISNULL(s.[SearchName-160], '') OR
            ISNULL(t.[VendorNo-10], '') <> ISNULL(s.[VendorNo-10], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[$DeliveredDateTime] AS VARCHAR), '')), '1900-01-01') OR
            ISNULL(t.[ExcludeFromWebsite-510], 0) <> ISNULL(s.[ExcludeFromWebsite-510], 0) OR
            ISNULL(t.[No-1], '') <> ISNULL(s.[No-1], '') OR
            ISNULL(t.[SmallWinery-610], 0) <> ISNULL(s.[SmallWinery-610], 0) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemCreatedAt-2000000001] AS VARCHAR), '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(CAST(s.[SystemModifiedAt-2000000003] AS VARCHAR), '')), '1900-01-01') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.WTBAProducer87156 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[WTBAProducer87156] s
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
        'WTBAProducer87156',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;