---  Exec silver.usp_IncrementalLoad_ShipmentMethod10
---  select * from silver.ShipmentMethod10
---  TRUNCATE TABLE silver.ShipmentMethod10


CREATE               PROCEDURE silver.usp_IncrementalLoad_ShipmentMethod10
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
         INSERT INTO silver.ShipmentMethod10 (
            [$Company],
            [$DeliveredDateTime],
            [Code-1],
            [Description-2],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [WCINT01CollectPrepaid-50220],
            [WCINT01SalesType-50221],
            [systemId-2000000000],
            [timestamp-0],
            InsertDate,
            UpdateDate
        )
        SELECT
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            s.[Code-1],
            s.[Description-2],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[WCINT01CollectPrepaid-50220],
            s.[WCINT01SalesType-50221],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP,
            NULL
        FROM [Bronze_2].[dbo].[ShipmentMethod10] s
        LEFT JOIN silver.ShipmentMethod10 t 
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
       

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[Code-1] = s.[Code-1],
            t.[Description-2] = s.[Description-2],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[WCINT01CollectPrepaid-50220] = s.[WCINT01CollectPrepaid-50220],
            t.[WCINT01SalesType-50221] = s.[WCINT01SalesType-50221],
            t.[timestamp-0] = s.[timestamp-0],
            t.UpdateDate = CURRENT_TIMESTAMP
        FROM silver.ShipmentMethod10 t
        JOIN [Bronze_2].[dbo].[ShipmentMethod10] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01') OR
            ISNULL(t.[Code-1], '') <> ISNULL(s.[Code-1], '') OR
            ISNULL(t.[Description-2], '') <> ISNULL(s.[Description-2], '') OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[WCINT01CollectPrepaid-50220], '') <> ISNULL(s.[WCINT01CollectPrepaid-50220], '') OR
            ISNULL(t.[WCINT01SalesType-50221], '') <> ISNULL(s.[WCINT01SalesType-50221], '') OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1);


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.ShipmentMethod10 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[ShipmentMethod10] s
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
        'ShipmentMethod10',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;