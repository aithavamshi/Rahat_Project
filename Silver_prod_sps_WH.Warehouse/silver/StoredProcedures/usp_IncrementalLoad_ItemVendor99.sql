---  Exec silver.usp_IncrementalLoad_ItemVendor99
---  Select * from [dwh].[silver].[ItemVendor99]
---  TRUNCATE TABLE [dwh].[silver].[ItemVendor99]


CREATE           PROCEDURE silver.usp_IncrementalLoad_ItemVendor99
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
        INSERT INTO silver.ItemVendor99 (
            [$Company],
        [$DeliveredDateTime],
        [ItemNo-1],
        [LeadTimeCalculation-6],
        [SupplierRefEntryNo-8000],
        [SystemCreatedAt-2000000001],
        [SystemCreatedBy-2000000002],
        [SystemModifiedAt-2000000003],
        [VendorNo-2],
        [systemId-2000000000],
        [timestamp-0],
        [InsertDate]
        
        )
        SELECT
            s.[$Company],
        s.[$DeliveredDateTime],
        s.[ItemNo-1],
        s.[LeadTimeCalculation-6],
        s.[SupplierRefEntryNo-8000],
        s.[SystemCreatedAt-2000000001],
        s.[SystemCreatedBy-2000000002],
        s.[SystemModifiedAt-2000000003],
        s.[VendorNo-2],
        s.[systemId-2000000000],
        s.[timestamp-0],
        GETDATE()
        FROM [Bronze_2].[dbo].[ItemVendor99] s
        LEFT JOIN silver.ItemVendor99 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET 
            t.[$Company] = s.[$Company],
        t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
        t.[ItemNo-1] = s.[ItemNo-1],
        t.[LeadTimeCalculation-6] = s.[LeadTimeCalculation-6],
        t.[SupplierRefEntryNo-8000] = s.[SupplierRefEntryNo-8000],
        t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
        t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
        t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
        t.[VendorNo-2] = s.[VendorNo-2],
        t.[systemId-2000000000] = s.[systemId-2000000000],
        t.[timestamp-0] = s.[timestamp-0],
        t.[UpdateDate] = GETDATE()
        FROM silver.ItemVendor99 t
        INNER JOIN [Bronze_2].[dbo].[ItemVendor99] s
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE 
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '') OR
        ISNULL(t.[ItemNo-1], '') <> ISNULL(s.[ItemNo-1], '') OR
        ISNULL(t.[LeadTimeCalculation-6], '') <> ISNULL(s.[LeadTimeCalculation-6], '') OR
        ISNULL(t.[SupplierRefEntryNo-8000], '') <> ISNULL(s.[SupplierRefEntryNo-8000], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[VendorNo-2], '') <> ISNULL(s.[VendorNo-2], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '');
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM [dwh].[silver].[ItemVendor99] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[ItemVendor99] s
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
        'ItemVendor99',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;