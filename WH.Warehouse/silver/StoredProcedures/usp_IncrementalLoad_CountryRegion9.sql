---  Exec silver.usp_IncrementalLoad_CountryRegion9
---  select * from silver.CountryRegion9
---  Truncate table silver.CountryRegion9

CREATE     PROCEDURE silver.usp_IncrementalLoad_CountryRegion9
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
        INSERT INTO silver.CountryRegion9 (
            [VATScheme-10],
            [CountyName-12],
            [ISONumericCode-5],
            [ISOCode-4],
            [$Company],
            [$DeliveredDateTime],
            [AddressFormat-8],
            [Code-1],
            [ContactAddressFormat-9],
            [LastModifiedDateTime-11],
            [Name-2],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [WTIAAllocate-90100],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate
        )
        SELECT
            s.[VATScheme-10],
            s.[CountyName-12],
            s.[ISONumericCode-5],
            s.[ISOCode-4],
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[AddressFormat-8],
            s.[Code-1],
            s.[ContactAddressFormat-9],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[LastModifiedDateTime-11], '')),
            s.[Name-2],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[WTIAAllocate-90100],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP
        FROM [test_lh].[dbo].[CountryRegion9] s
        LEFT JOIN silver.CountryRegion9 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[VATScheme-10] = s.[VATScheme-10],
            t.[CountyName-12] = s.[CountyName-12],
            t.[ISONumericCode-5] = s.[ISONumericCode-5],
            t.[ISOCode-4] = s.[ISOCode-4],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[AddressFormat-8] = s.[AddressFormat-8],
            t.[Code-1] = s.[Code-1],
            t.[ContactAddressFormat-9] = s.[ContactAddressFormat-9],
            t.[LastModifiedDateTime-11] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[LastModifiedDateTime-11], '')),
            t.[Name-2] = s.[Name-2],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[WTIAAllocate-90100] = s.[WTIAAllocate-90100],
            t.[timestamp-0] = s.[timestamp-0],
            UpdateDate = CURRENT_TIMESTAMP
        FROM silver.CountryRegion9 t
        JOIN [test_lh].[dbo].[CountryRegion9] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[VATScheme-10], '') <> ISNULL(s.[VATScheme-10], '') OR
            ISNULL(t.[CountyName-12], '') <> ISNULL(s.[CountyName-12], '') OR
            ISNULL(t.[ISONumericCode-5], '') <> ISNULL(s.[ISONumericCode-5], '') OR
            ISNULL(t.[ISOCode-4], '') <> ISNULL(s.[ISOCode-4], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[AddressFormat-8], '') <> ISNULL(s.[AddressFormat-8], '') OR
            ISNULL(t.[Code-1], '') <> ISNULL(s.[Code-1], '') OR
            ISNULL(t.[ContactAddressFormat-9], '') <> ISNULL(s.[ContactAddressFormat-9], '') OR
            ISNULL(t.[LastModifiedDateTime-11], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[LastModifiedDateTime-11], '')), '1900-01-01') OR
            ISNULL(t.[Name-2], '') <> ISNULL(s.[Name-2], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[WTIAAllocate-90100], 0) <> ISNULL(s.[WTIAAllocate-90100], 0) OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM silver.CountryRegion9
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000] FROM [test_lh].[dbo].[CountryRegion9]
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
        'CountryRegion9',
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