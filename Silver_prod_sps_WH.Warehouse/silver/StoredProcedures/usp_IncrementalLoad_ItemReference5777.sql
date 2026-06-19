--Exec silver.usp_IncrementalLoad_ItemReference5777
--select * from [dwh].[silver].[ItemReference5777]
--Truncate table [dwh].[silver].[ItemReference5777]

CREATE             PROCEDURE silver.usp_IncrementalLoad_ItemReference5777
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
        INSERT INTO [dwh].[silver].[ItemReference5777] (
            [Description2-9],
            [ReferenceTypeNo-5],
            [Description-7],
            [ReferenceNo-6],
            [ItemNo-1],
            [UnitofMeasure-3],
            [ReferenceType-4],
            [SupplierRefEntryNo-8000],
            [WTBABarcodeType-87000],
            [timestamp-0],
            [systemId-2000000000],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [$Company],
            [$DeliveredDateTime],
            [InsertDate]
        )
        SELECT
            s.[Description2-9],
            s.[ReferenceTypeNo-5],
            s.[Description-7],
            s.[ReferenceNo-6],
            s.[ItemNo-1],
            s.[UnitofMeasure-3],
            s.[ReferenceType-4],
            s.[SupplierRefEntryNo-8000],
            s.[WTBABarcodeType-87000],
            s.[timestamp-0],
            s.[systemId-2000000000],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            s.[SystemCreatedBy-2000000002],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            s.[$Company],
            TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            CURRENT_TIMESTAMP
        FROM [Bronze_2].[dbo].[ItemReference5777] s
        LEFT JOIN [dwh].[silver].[ItemReference5777] t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[Description2-9] = s.[Description2-9],
            t.[ReferenceTypeNo-5] = s.[ReferenceTypeNo-5],
            t.[Description-7] = s.[Description-7],
            t.[ReferenceNo-6] = s.[ReferenceNo-6],
            t.[ItemNo-1] = s.[ItemNo-1],
            t.[UnitofMeasure-3] = s.[UnitofMeasure-3],
            t.[ReferenceType-4] = s.[ReferenceType-4],
            t.[SupplierRefEntryNo-8000] = s.[SupplierRefEntryNo-8000],
            t.[WTBABarcodeType-87000] = s.[WTBABarcodeType-87000],
            t.[timestamp-0] = s.[timestamp-0],
            t.[SystemCreatedAt-2000000001] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')),
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')),
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')),
            t.[UpdateDate] = CURRENT_TIMESTAMP
        FROM [dwh].[silver].[ItemReference5777] t
        JOIN [Bronze_2].[dbo].[ItemReference5777] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            ISNULL(t.[Description2-9], '') <> ISNULL(s.[Description2-9], '') OR
            ISNULL(t.[ReferenceTypeNo-5], '') <> ISNULL(s.[ReferenceTypeNo-5], '') OR
            ISNULL(t.[Description-7], '') <> ISNULL(s.[Description-7], '') OR
            ISNULL(t.[ReferenceNo-6], '') <> ISNULL(s.[ReferenceNo-6], '') OR
            ISNULL(t.[ItemNo-1], '') <> ISNULL(s.[ItemNo-1], '') OR
            ISNULL(t.[UnitofMeasure-3], '') <> ISNULL(s.[UnitofMeasure-3], '') OR
            ISNULL(t.[ReferenceType-4], '') <> ISNULL(s.[ReferenceType-4], '') OR
            ROUND(ISNULL(t.[SupplierRefEntryNo-8000], -1),3) <> ROUND(ISNULL(s.[SupplierRefEntryNo-8000], -1),3) OR
            ISNULL(t.[WTBABarcodeType-87000], '') <> ISNULL(s.[WTBABarcodeType-87000], '') OR
            ROUND(ISNULL(t.[timestamp-0], -1),3) <> ROUND(ISNULL(s.[timestamp-0], -1),3) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemCreatedAt-2000000001], '')), '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[SystemModifiedAt-2000000003], '')), '1900-01-01') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(TRY_CONVERT(DATETIME2(3), NULLIF(s.[$DeliveredDateTime], '')), '1900-01-01');
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM [dwh].[silver].[ItemReference5777] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[ItemReference5777] s
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
        'ItemReference5777',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;