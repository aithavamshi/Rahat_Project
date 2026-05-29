---  EXEC silver.usp_IncrementalLoad_SalesShipmentLine111
---  SELECT * FROM silver.SalesShipmentLine111
---  Truncate table silver.SalesShipmentLine111


CREATE     PROCEDURE silver.usp_IncrementalLoad_SalesShipmentLine111
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
        INSERT INTO silver.SalesShipmentLine111 (
            [ReturnReasonCode-6608],
            [RequestedDeliveryDate-5790],
            [WCSAL04PalletDiscGroupCode-50121],
            [WTBAOrderChargeCode-87600],
            [BinCode-5403],
            [CustomerDiscGroup-7002],
            [WCSAL04SampleDiscGroupCode-50120],
            [WTPCSalesPriceGroupCode-89200],
            [WTPCSalesPriceCategoryCode-89203],
            [WTBASampleReasonCode-87700],
            [ShortcutDimension1Code-40],
            [WTIAAllocationInheritCode-90110],
            [WTUSBeverageTaxAreaCode-88400],
            [ItemCategoryCode-5709],
            [WTBABrandNo-87150],
            [WTBAAlcoholTypeCode-87050],
            [WTBABottleSize-87020],
            [PostingGroup-8],
            [UnitofMeasure-13],
            [UnitofMeasureCode-5407],
            [GenProdPostingGroup-75],
            [PlannedDeliveryDate-5794],
            [PlannedShipmentDate-5795],
            [WTBABudgetSalespersonCode-87702],
            [WCTEWSalespersonCode-50000],
            [CustomerPriceGroup-42],
            [BilltoCustomerNo-68],
            [GenBusPostingGroup-74],
            [LocationCode-7],
            [No-6],
            [SelltoCustomerNo-2],
            [ShipmentDate-10],
            [WTBAOrderDate-87110],
            [WTBADocumentDate-87100],
            [OrderNo-65],
            [Description-11],
            [PostingDate-131],
            [$Company],
            [$DeliveredDateTime],
            [AllowInvoiceDisc-32],
            [AllowLineDisc-7001],
            [ApplfromItemEntry-5811],
            [AppltoItemEntry-38],
            [AttachedtoLineNo-80],
            [AuthorizedforCreditCard-826],
            [BlanketOrderLineNo-98],
            [Correction-5817],
            [DepruntilFAPostingDate-5605],
            [DimensionSetID-480],
            [DocumentId-8000],
            [DocumentNo-3],
            [DropShipment-73],
            [GrossWeight-34],
            [ICPartnerRefType-107],
            [ItemChargeBaseAmount-5812],
            [ItemReferenceType-5727],
            [ItemShptEntryNo-39],
            [JobContractEntryNo-1002],
            [LineDiscount-27],
            [LineNo-4],
            [Nonstock-5710],
            [OrderLineNo-66],
            [PriceCalculationMethod-7000],
            [PurchOrderLineNo-72],
            [QtyInvoicedBase-5461],
            [QtyShippedNotInvoiced-58],
            [QtyperUnitofMeasure-5404],
            [Quantity-15],
            [QuantityBase-5415],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [Type-5],
            [UnitCost-100],
            [UnitCostLCY-23],
            [UnitPrice-22],
            [UnitVolume-37],
            [UnitsperParcel-36],
            [UseDuplicationList-5613],
            [VAT-25],
            [VATBaseAmount-99],
            [VATCalculationType-77],
            [WCAR06DefaultComm-50114],
            [WCAR06DefaultCommAmount-50115],
            [WCAR06ManualComm-50111],
            [WCAR06ManualCommAmount-50112],
            [WCAR06MaxComm-50113],
            [WCAR06SalesCommClosed-50101],
            [WCAR06SalesCommLedgEntry-50102],
            [WCAR06SalesCommissionable-50100],
            [WCINT01ShortShipOrigQty-50221],
            [WCINT01ShortShipped-50220],
            [WTBABillHoldEntryNo-87570],
            [WTBACasePack-87010],
            [WTBAGallons-87301],
            [WTBAGrossWeight-87823],
            [WTBALinkedLineNo-87000],
            [WTBALiters-87300],
            [WTBANetWeight-87870],
            [WTBAOriginalQtyBottle-87343],
            [WTBAOriginalQuantity-87340],
            [WTBAOriginalQuantityBase-87341],
            [WTBAQuantityBottle-87083],
            [WTBAQuantityCase-87080],
            [WTBAQuantityPallet-87880],
            [WTBASalesPriceOverride-87030],
            [WTBASampleEntryNo-87704],
            [WTBASampleTotalAmount-87701],
            [WTBAVolume-87824],
            [WTCBBillBack-89050],
            [WTCBChargebackLedgerEntry-89040],
            [WTCBDeplAllowLineAmt-89030],
            [WTCBDeplAllowLineUnitAmt-89020],
            [WTCBDeplAllowUnitAmt-89010],
            [WTCBDeplAllowUnitAmtType-89000],
            [WTPCSalesPriceCalcMethod-89201],
            [WTPCSalesPriceCalcQty-89202],
            [WTPCSalesPriceLinkId-89204],
            [WTUSBeverageTax-88401],
            [systemId-2000000000],
            [NetWeight-35],
            [QuantityInvoiced-61],
            [TaxLiable-86],
            [WTBAOriginalQtyCase-87342],
            [timestamp-0],
            InsertDate
           
        )
        SELECT
            s.[ReturnReasonCode-6608],
            s.[RequestedDeliveryDate-5790], 
            s.[WCSAL04PalletDiscGroupCode-50121],
            s.[WTBAOrderChargeCode-87600],
            s.[BinCode-5403],
            s.[CustomerDiscGroup-7002],
            s.[WCSAL04SampleDiscGroupCode-50120],
            s.[WTPCSalesPriceGroupCode-89200],
            s.[WTPCSalesPriceCategoryCode-89203],
            s.[WTBASampleReasonCode-87700],
            s.[ShortcutDimension1Code-40],
            s.[WTIAAllocationInheritCode-90110],
            s.[WTUSBeverageTaxAreaCode-88400],
            s.[ItemCategoryCode-5709],
            s.[WTBABrandNo-87150],
            s.[WTBAAlcoholTypeCode-87050],
            s.[WTBABottleSize-87020],
            s.[PostingGroup-8],
            s.[UnitofMeasure-13],
            s.[UnitofMeasureCode-5407],
            s.[GenProdPostingGroup-75],
            s.[PlannedDeliveryDate-5794],
            s.[PlannedShipmentDate-5795],
            s.[WTBABudgetSalespersonCode-87702],
            s.[WCTEWSalespersonCode-50000],
            s.[CustomerPriceGroup-42],
            s.[BilltoCustomerNo-68],
            s.[GenBusPostingGroup-74],
            s.[LocationCode-7],
            s.[No-6],
            s.[SelltoCustomerNo-2],
            s.[ShipmentDate-10],
            s.[WTBAOrderDate-87110], 
            s.[WTBADocumentDate-87100],
            s.[OrderNo-65],
            s.[Description-11],
            s.[PostingDate-131], 
            s.[$Company],
           s.[$DeliveredDateTime],
            s.[AllowInvoiceDisc-32],
            s.[AllowLineDisc-7001],
            s.[ApplfromItemEntry-5811],
            s.[AppltoItemEntry-38],
            s.[AttachedtoLineNo-80],
            s.[AuthorizedforCreditCard-826],
            s.[BlanketOrderLineNo-98],
            s.[Correction-5817],
            s.[DepruntilFAPostingDate-5605],
            s.[DimensionSetID-480],
            s.[DocumentId-8000],
            s.[DocumentNo-3],
            s.[DropShipment-73],
            s.[GrossWeight-34],
            s.[ICPartnerRefType-107],
            s.[ItemChargeBaseAmount-5812],
            s.[ItemReferenceType-5727],
            s.[ItemShptEntryNo-39],
            s.[JobContractEntryNo-1002],
            s.[LineDiscount-27],
            s.[LineNo-4],
            s.[Nonstock-5710],
            s.[OrderLineNo-66],
            s.[PriceCalculationMethod-7000],
            s.[PurchOrderLineNo-72],
            s.[QtyInvoicedBase-5461],
            s.[QtyShippedNotInvoiced-58],
            s.[QtyperUnitofMeasure-5404],
            s.[Quantity-15],
            s.[QuantityBase-5415],
            s.[SystemCreatedAt-2000000001],
            s.[SystemCreatedBy-2000000002],
            s.[SystemModifiedAt-2000000003],
            s.[Type-5],
            s.[UnitCost-100],
            s.[UnitCostLCY-23],
            s.[UnitPrice-22],
            s.[UnitVolume-37],
            s.[UnitsperParcel-36],
            s.[UseDuplicationList-5613],
            s.[VAT-25],
            s.[VATBaseAmount-99],
            s.[VATCalculationType-77],
            s.[WCAR06DefaultComm-50114],
            s.[WCAR06DefaultCommAmount-50115],
            s.[WCAR06ManualComm-50111],
            s.[WCAR06ManualCommAmount-50112],
            s.[WCAR06MaxComm-50113],
            s.[WCAR06SalesCommClosed-50101],
            s.[WCAR06SalesCommLedgEntry-50102],
            s.[WCAR06SalesCommissionable-50100],
            s.[WCINT01ShortShipOrigQty-50221],
            s.[WCINT01ShortShipped-50220],
            s.[WTBABillHoldEntryNo-87570],
            s.[WTBACasePack-87010],
            s.[WTBAGallons-87301],
            s.[WTBAGrossWeight-87823],
            s.[WTBALinkedLineNo-87000],
            s.[WTBALiters-87300],
            s.[WTBANetWeight-87870],
            s.[WTBAOriginalQtyBottle-87343],
            s.[WTBAOriginalQuantity-87340],
            s.[WTBAOriginalQuantityBase-87341],
            s.[WTBAQuantityBottle-87083],
            s.[WTBAQuantityCase-87080],
            s.[WTBAQuantityPallet-87880],
            s.[WTBASalesPriceOverride-87030],
            s.[WTBASampleEntryNo-87704],
            s.[WTBASampleTotalAmount-87701],
            s.[WTBAVolume-87824],
            s.[WTCBBillBack-89050],
            s.[WTCBChargebackLedgerEntry-89040],
            s.[WTCBDeplAllowLineAmt-89030],
            s.[WTCBDeplAllowLineUnitAmt-89020],
            s.[WTCBDeplAllowUnitAmt-89010],
            s.[WTCBDeplAllowUnitAmtType-89000],
            s.[WTPCSalesPriceCalcMethod-89201],
            s.[WTPCSalesPriceCalcQty-89202],
            s.[WTPCSalesPriceLinkId-89204],
            s.[WTUSBeverageTax-88401],
            s.[systemId-2000000000],
            s.[NetWeight-35],
            s.[QuantityInvoiced-61],
            s.[TaxLiable-86],
            s.[WTBAOriginalQtyCase-87342],
            s.[timestamp-0],
            GETDATE()
            
        FROM [test_lh].[dbo].[SalesShipmentLine111] s
        LEFT JOIN silver.SalesShipmentLine111 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[ReturnReasonCode-6608] = s.[ReturnReasonCode-6608],
            t.[RequestedDeliveryDate-5790] = s.[RequestedDeliveryDate-5790],
            t.[WCSAL04PalletDiscGroupCode-50121] = s.[WCSAL04PalletDiscGroupCode-50121],
            t.[WTBAOrderChargeCode-87600] = s.[WTBAOrderChargeCode-87600],
            t.[BinCode-5403] = s.[BinCode-5403],
            t.[CustomerDiscGroup-7002] = s.[CustomerDiscGroup-7002],
            t.[WCSAL04SampleDiscGroupCode-50120] = s.[WCSAL04SampleDiscGroupCode-50120],
            t.[WTPCSalesPriceGroupCode-89200] = s.[WTPCSalesPriceGroupCode-89200],
            t.[WTPCSalesPriceCategoryCode-89203] = s.[WTPCSalesPriceCategoryCode-89203],
            t.[WTBASampleReasonCode-87700] = s.[WTBASampleReasonCode-87700],
            t.[ShortcutDimension1Code-40] = s.[ShortcutDimension1Code-40],
            t.[WTIAAllocationInheritCode-90110] = s.[WTIAAllocationInheritCode-90110],
            t.[WTUSBeverageTaxAreaCode-88400] = s.[WTUSBeverageTaxAreaCode-88400],
            t.[ItemCategoryCode-5709] = s.[ItemCategoryCode-5709],
            t.[WTBABrandNo-87150] = s.[WTBABrandNo-87150],
            t.[WTBAAlcoholTypeCode-87050] = s.[WTBAAlcoholTypeCode-87050],
            t.[WTBABottleSize-87020] = s.[WTBABottleSize-87020],
            t.[PostingGroup-8] = s.[PostingGroup-8],
            t.[UnitofMeasure-13] = s.[UnitofMeasure-13],
            t.[UnitofMeasureCode-5407] = s.[UnitofMeasureCode-5407],
            t.[GenProdPostingGroup-75] = s.[GenProdPostingGroup-75],
            t.[PlannedDeliveryDate-5794] =s.[PlannedDeliveryDate-5794],
            t.[PlannedShipmentDate-5795] = s.[PlannedShipmentDate-5795],
            t.[WTBABudgetSalespersonCode-87702] = s.[WTBABudgetSalespersonCode-87702],
            t.[WCTEWSalespersonCode-50000] = s.[WCTEWSalespersonCode-50000],
            t.[CustomerPriceGroup-42] = s.[CustomerPriceGroup-42],
            t.[BilltoCustomerNo-68] = s.[BilltoCustomerNo-68],
            t.[GenBusPostingGroup-74] = s.[GenBusPostingGroup-74],
            t.[LocationCode-7] = s.[LocationCode-7],
            t.[No-6] = s.[No-6],
            t.[SelltoCustomerNo-2] = s.[SelltoCustomerNo-2],
            t.[ShipmentDate-10] = s.[ShipmentDate-10],
            t.[WTBAOrderDate-87110] = s.[WTBAOrderDate-87110], 
            t.[WTBADocumentDate-87100] = s.[WTBADocumentDate-87100],
            t.[OrderNo-65] = s.[OrderNo-65],
            t.[Description-11] = s.[Description-11],
            t.[PostingDate-131] = s.[PostingDate-131],
            t.[$Company] = s.[$Company],
            t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
            t.[AllowInvoiceDisc-32] = s.[AllowInvoiceDisc-32],
            t.[AllowLineDisc-7001] = s.[AllowLineDisc-7001],
            t.[ApplfromItemEntry-5811] = s.[ApplfromItemEntry-5811],
            t.[AppltoItemEntry-38] = s.[AppltoItemEntry-38],
            t.[AttachedtoLineNo-80] = s.[AttachedtoLineNo-80],
            t.[AuthorizedforCreditCard-826] = s.[AuthorizedforCreditCard-826],
            t.[BlanketOrderLineNo-98] = s.[BlanketOrderLineNo-98],
            t.[Correction-5817] = s.[Correction-5817],
            t.[DepruntilFAPostingDate-5605] = s.[DepruntilFAPostingDate-5605], 
            t.[DimensionSetID-480] = s.[DimensionSetID-480],
            t.[DocumentId-8000] = s.[DocumentId-8000],
            t.[DocumentNo-3] = s.[DocumentNo-3],
            t.[DropShipment-73] = s.[DropShipment-73],
            t.[GrossWeight-34] = s.[GrossWeight-34],
            t.[ICPartnerRefType-107] = s.[ICPartnerRefType-107],
            t.[ItemChargeBaseAmount-5812] = s.[ItemChargeBaseAmount-5812],
            t.[ItemReferenceType-5727] = s.[ItemReferenceType-5727],
            t.[ItemShptEntryNo-39] = s.[ItemShptEntryNo-39],
            t.[JobContractEntryNo-1002] = s.[JobContractEntryNo-1002],
            t.[LineDiscount-27] = s.[LineDiscount-27],
            t.[LineNo-4] = s.[LineNo-4],
            t.[Nonstock-5710] = s.[Nonstock-5710],
            t.[OrderLineNo-66] = s.[OrderLineNo-66],
            t.[PriceCalculationMethod-7000] = s.[PriceCalculationMethod-7000],
            t.[PurchOrderLineNo-72] = s.[PurchOrderLineNo-72],
            t.[QtyInvoicedBase-5461] = s.[QtyInvoicedBase-5461],
            t.[QtyShippedNotInvoiced-58] = s.[QtyShippedNotInvoiced-58],
            t.[QtyperUnitofMeasure-5404] = s.[QtyperUnitofMeasure-5404],
            t.[Quantity-15] = s.[Quantity-15],
            t.[QuantityBase-5415] = s.[QuantityBase-5415],
            t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
            t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
            t.[Type-5] = s.[Type-5],
            t.[UnitCost-100] = s.[UnitCost-100],
            t.[UnitCostLCY-23] = s.[UnitCostLCY-23],
            t.[UnitPrice-22] = s.[UnitPrice-22],
            t.[UnitVolume-37] = s.[UnitVolume-37],
            t.[UnitsperParcel-36] = s.[UnitsperParcel-36],
            t.[UseDuplicationList-5613] = s.[UseDuplicationList-5613],
            t.[VAT-25] = s.[VAT-25],
            t.[VATBaseAmount-99] = s.[VATBaseAmount-99],
            t.[VATCalculationType-77] = s.[VATCalculationType-77],
            t.[WCAR06DefaultComm-50114] = s.[WCAR06DefaultComm-50114],
            t.[WCAR06DefaultCommAmount-50115] = s.[WCAR06DefaultCommAmount-50115],
            t.[WCAR06ManualComm-50111] = s.[WCAR06ManualComm-50111],
            t.[WCAR06ManualCommAmount-50112] = s.[WCAR06ManualCommAmount-50112],
            t.[WCAR06MaxComm-50113] = s.[WCAR06MaxComm-50113],
            t.[WCAR06SalesCommClosed-50101] = s.[WCAR06SalesCommClosed-50101],
            t.[WCAR06SalesCommLedgEntry-50102] = s.[WCAR06SalesCommLedgEntry-50102],
            t.[WCAR06SalesCommissionable-50100] = s.[WCAR06SalesCommissionable-50100],
            t.[WCINT01ShortShipOrigQty-50221] = s.[WCINT01ShortShipOrigQty-50221],
            t.[WCINT01ShortShipped-50220] = s.[WCINT01ShortShipped-50220],
            t.[WTBABillHoldEntryNo-87570] = s.[WTBABillHoldEntryNo-87570],
            t.[WTBACasePack-87010] = s.[WTBACasePack-87010],
            t.[WTBAGallons-87301] = s.[WTBAGallons-87301],
            t.[WTBAGrossWeight-87823] = s.[WTBAGrossWeight-87823],
            t.[WTBALinkedLineNo-87000] = s.[WTBALinkedLineNo-87000],
            t.[WTBALiters-87300] = s.[WTBALiters-87300],
            t.[WTBANetWeight-87870] = s.[WTBANetWeight-87870],
            t.[WTBAOriginalQtyBottle-87343] = s.[WTBAOriginalQtyBottle-87343],
            t.[WTBAOriginalQuantity-87340] = s.[WTBAOriginalQuantity-87340],
            t.[WTBAOriginalQuantityBase-87341] = s.[WTBAOriginalQuantityBase-87341],
            t.[WTBAQuantityBottle-87083] = s.[WTBAQuantityBottle-87083],
            t.[WTBAQuantityCase-87080] = s.[WTBAQuantityCase-87080],
            t.[WTBAQuantityPallet-87880] = s.[WTBAQuantityPallet-87880],
            t.[WTBASalesPriceOverride-87030] = s.[WTBASalesPriceOverride-87030],
            t.[WTBASampleEntryNo-87704] = s.[WTBASampleEntryNo-87704],
            t.[WTBASampleTotalAmount-87701] = s.[WTBASampleTotalAmount-87701],
            t.[WTBAVolume-87824] = s.[WTBAVolume-87824],
            t.[WTCBBillBack-89050] = s.[WTCBBillBack-89050],
            t.[WTCBChargebackLedgerEntry-89040] = s.[WTCBChargebackLedgerEntry-89040],
            t.[WTCBDeplAllowLineAmt-89030] = s.[WTCBDeplAllowLineAmt-89030],
            t.[WTCBDeplAllowLineUnitAmt-89020] = s.[WTCBDeplAllowLineUnitAmt-89020],
            t.[WTCBDeplAllowUnitAmt-89010] = s.[WTCBDeplAllowUnitAmt-89010],
            t.[WTCBDeplAllowUnitAmtType-89000] = s.[WTCBDeplAllowUnitAmtType-89000],
            t.[WTPCSalesPriceCalcMethod-89201] = s.[WTPCSalesPriceCalcMethod-89201],
            t.[WTPCSalesPriceCalcQty-89202] = s.[WTPCSalesPriceCalcQty-89202],
            t.[WTPCSalesPriceLinkId-89204] = s.[WTPCSalesPriceLinkId-89204],
            t.[WTUSBeverageTax-88401] = s.[WTUSBeverageTax-88401],
            t.[systemId-2000000000] = s.[systemId-2000000000],
            t.[NetWeight-35] = s.[NetWeight-35],
            t.[QuantityInvoiced-61] = s.[QuantityInvoiced-61],
            t.[TaxLiable-86] = s.[TaxLiable-86],
            t.[WTBAOriginalQtyCase-87342] = s.[WTBAOriginalQtyCase-87342],
            t.[timestamp-0] = s.[timestamp-0],
            t.[UpdateDate] = GETDATE()
        FROM silver.SalesShipmentLine111 t
        JOIN [test_lh].[dbo].[SalesShipmentLine111] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
           (
        ISNULL(t.[ReturnReasonCode-6608], '') <> ISNULL(s.[ReturnReasonCode-6608], '') OR
        ISNULL(t.[RequestedDeliveryDate-5790], '1900-01-01') <> ISNULL(s.[RequestedDeliveryDate-5790], '1900-01-01') OR
        ISNULL(t.[WCSAL04PalletDiscGroupCode-50121], '') <> ISNULL(s.[WCSAL04PalletDiscGroupCode-50121], '') OR
        ISNULL(t.[WTBAOrderChargeCode-87600], '') <> ISNULL(s.[WTBAOrderChargeCode-87600], '') OR
        ISNULL(t.[BinCode-5403], '') <> ISNULL(s.[BinCode-5403], '') OR
        ISNULL(t.[CustomerDiscGroup-7002], '') <> ISNULL(s.[CustomerDiscGroup-7002], '') OR
        ISNULL(t.[WCSAL04SampleDiscGroupCode-50120], '') <> ISNULL(s.[WCSAL04SampleDiscGroupCode-50120], '') OR
        ISNULL(t.[WTPCSalesPriceGroupCode-89200], '') <> ISNULL(s.[WTPCSalesPriceGroupCode-89200], '') OR
        ISNULL(t.[WTPCSalesPriceCategoryCode-89203], '') <> ISNULL(s.[WTPCSalesPriceCategoryCode-89203], '') OR
        ISNULL(t.[WTBASampleReasonCode-87700], '') <> ISNULL(s.[WTBASampleReasonCode-87700], '') OR
        ISNULL(t.[ShortcutDimension1Code-40], '') <> ISNULL(s.[ShortcutDimension1Code-40], '') OR
        ISNULL(t.[WTIAAllocationInheritCode-90110], '') <> ISNULL(s.[WTIAAllocationInheritCode-90110], '') OR
        ISNULL(t.[WTUSBeverageTaxAreaCode-88400], '') <> ISNULL(s.[WTUSBeverageTaxAreaCode-88400], '') OR
        ISNULL(t.[ItemCategoryCode-5709], '') <> ISNULL(s.[ItemCategoryCode-5709], '') OR
        ISNULL(t.[WTBABrandNo-87150], '') <> ISNULL(s.[WTBABrandNo-87150], '') OR
        ISNULL(t.[WTBAAlcoholTypeCode-87050], '') <> ISNULL(s.[WTBAAlcoholTypeCode-87050], '') OR
        ISNULL(t.[WTBABottleSize-87020], '') <> ISNULL(s.[WTBABottleSize-87020], '') OR
        ISNULL(t.[PostingGroup-8], '') <> ISNULL(s.[PostingGroup-8], '') OR
        ISNULL(t.[UnitofMeasure-13], '') <> ISNULL(s.[UnitofMeasure-13], '') OR
        ISNULL(t.[UnitofMeasureCode-5407], '') <> ISNULL(s.[UnitofMeasureCode-5407], '') OR
        ISNULL(t.[GenProdPostingGroup-75], '') <> ISNULL(s.[GenProdPostingGroup-75], '') OR
        ISNULL(t.[PlannedDeliveryDate-5794], '1900-01-01') <> ISNULL(s.[PlannedDeliveryDate-5794], '1900-01-01') OR
        ISNULL(t.[PlannedShipmentDate-5795], '1900-01-01') <> ISNULL(s.[PlannedShipmentDate-5795], '1900-01-01') OR
        ISNULL(t.[WTBABudgetSalespersonCode-87702], '') <> ISNULL(s.[WTBABudgetSalespersonCode-87702], '') OR
        ISNULL(t.[WCTEWSalespersonCode-50000], '') <> ISNULL(s.[WCTEWSalespersonCode-50000], '') OR
        ISNULL(t.[CustomerPriceGroup-42], '') <> ISNULL(s.[CustomerPriceGroup-42], '') OR
        ISNULL(t.[BilltoCustomerNo-68], '') <> ISNULL(s.[BilltoCustomerNo-68], '') OR
        ISNULL(t.[GenBusPostingGroup-74], '') <> ISNULL(s.[GenBusPostingGroup-74], '') OR
        ISNULL(t.[LocationCode-7], '') <> ISNULL(s.[LocationCode-7], '') OR
        ISNULL(t.[No-6], '') <> ISNULL(s.[No-6], '') OR
        ISNULL(t.[SelltoCustomerNo-2], '') <> ISNULL(s.[SelltoCustomerNo-2], '') OR
        ISNULL(t.[ShipmentDate-10], '1900-01-01') <> ISNULL(s.[ShipmentDate-10], '1900-01-01') OR
        ISNULL(t.[WTBAOrderDate-87110], '1900-01-01') <> ISNULL(s.[WTBAOrderDate-87110], '1900-01-01') OR
        ISNULL(t.[WTBADocumentDate-87100], '1900-01-01') <> ISNULL(s.[WTBADocumentDate-87100], '1900-01-01') OR
        ISNULL(t.[OrderNo-65], '') <> ISNULL(s.[OrderNo-65], '') OR
        ISNULL(t.[Description-11], '') <> ISNULL(s.[Description-11], '') OR
        ISNULL(t.[PostingDate-131], '1900-01-01') <> ISNULL(s.[PostingDate-131], '1900-01-01') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(s.[$DeliveredDateTime], '1900-01-01') OR
        ISNULL(t.[AllowInvoiceDisc-32], 0) <> ISNULL(s.[AllowInvoiceDisc-32], 0) OR
        ISNULL(t.[AllowLineDisc-7001], 0) <> ISNULL(s.[AllowLineDisc-7001], 0) OR
        ISNULL(t.[ApplfromItemEntry-5811], '') <> ISNULL(s.[ApplfromItemEntry-5811], '') OR
        ISNULL(t.[AppltoItemEntry-38], '') <> ISNULL(s.[AppltoItemEntry-38], '') OR
        ISNULL(t.[AttachedtoLineNo-80], '') <> ISNULL(s.[AttachedtoLineNo-80], '') OR
        ISNULL(t.[AuthorizedforCreditCard-826], '') <> ISNULL(s.[AuthorizedforCreditCard-826], '') OR
        ISNULL(t.[BlanketOrderLineNo-98], '') <> ISNULL(s.[BlanketOrderLineNo-98], '') OR
        ISNULL(t.[Correction-5817], '') <> ISNULL(s.[Correction-5817], '') OR
        ISNULL(t.[DepruntilFAPostingDate-5605], '') <> ISNULL(s.[DepruntilFAPostingDate-5605], '') OR
        ISNULL(t.[DimensionSetID-480], '') <> ISNULL(s.[DimensionSetID-480], '') OR
        ISNULL(t.[DocumentId-8000], '') <> ISNULL(s.[DocumentId-8000], '') OR
        ISNULL(t.[DocumentNo-3], '') <> ISNULL(s.[DocumentNo-3], '') OR
        ISNULL(t.[DropShipment-73], '') <> ISNULL(s.[DropShipment-73], '') OR
        ISNULL(t.[GrossWeight-34], '') <> ISNULL(s.[GrossWeight-34], '') OR
        ISNULL(t.[ICPartnerRefType-107], '') <> ISNULL(s.[ICPartnerRefType-107], '') OR
        ISNULL(t.[ItemChargeBaseAmount-5812], '') <> ISNULL(s.[ItemChargeBaseAmount-5812], '') OR
        ISNULL(t.[ItemReferenceType-5727], '') <> ISNULL(s.[ItemReferenceType-5727], '') OR
        ISNULL(t.[ItemShptEntryNo-39], '') <> ISNULL(s.[ItemShptEntryNo-39], '') OR
        ISNULL(t.[JobContractEntryNo-1002], '') <> ISNULL(s.[JobContractEntryNo-1002], '') OR
        ISNULL(t.[LineDiscount-27], '') <> ISNULL(s.[LineDiscount-27], '') OR
        ISNULL(t.[LineNo-4], '') <> ISNULL(s.[LineNo-4], '') OR
        ISNULL(t.[Nonstock-5710], '') <> ISNULL(s.[Nonstock-5710], '') OR
        ISNULL(t.[OrderLineNo-66], '') <> ISNULL(s.[OrderLineNo-66], '') OR
        ISNULL(t.[PriceCalculationMethod-7000], '') <> ISNULL(s.[PriceCalculationMethod-7000], '') OR
        ISNULL(t.[PurchOrderLineNo-72], '') <> ISNULL(s.[PurchOrderLineNo-72], '') OR
        ISNULL(t.[QtyInvoicedBase-5461], '') <> ISNULL(s.[QtyInvoicedBase-5461], '') OR
        ISNULL(t.[QtyShippedNotInvoiced-58], '') <> ISNULL(s.[QtyShippedNotInvoiced-58], '') OR
        ISNULL(t.[QtyperUnitofMeasure-5404], '') <> ISNULL(s.[QtyperUnitofMeasure-5404], '') OR
        ISNULL(t.[Quantity-15], '') <> ISNULL(s.[Quantity-15], '') OR
        ISNULL(t.[QuantityBase-5415], '') <> ISNULL(s.[QuantityBase-5415], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[Type-5], '') <> ISNULL(s.[Type-5], '') OR
        ISNULL(t.[UnitCost-100], '') <> ISNULL(s.[UnitCost-100], '') OR
        ISNULL(t.[UnitCostLCY-23], '') <> ISNULL(s.[UnitCostLCY-23], '') OR
        ISNULL(t.[UnitPrice-22], '') <> ISNULL(s.[UnitPrice-22], '') OR
        ISNULL(t.[UnitVolume-37], '') <> ISNULL(s.[UnitVolume-37], '') OR
        ISNULL(t.[UnitsperParcel-36], '') <> ISNULL(s.[UnitsperParcel-36], '') OR
        ISNULL(t.[UseDuplicationList-5613], '') <> ISNULL(s.[UseDuplicationList-5613], '') OR
        ISNULL(t.[VAT-25], '') <> ISNULL(s.[VAT-25], '') OR
        ISNULL(t.[VATBaseAmount-99], '') <> ISNULL(s.[VATBaseAmount-99], '') OR
        ISNULL(t.[VATCalculationType-77], '') <> ISNULL(s.[VATCalculationType-77], '') OR
        ISNULL(t.[WCAR06DefaultComm-50114], '') <> ISNULL(s.[WCAR06DefaultComm-50114], '') OR
        ISNULL(t.[WCAR06DefaultCommAmount-50115], '') <> ISNULL(s.[WCAR06DefaultCommAmount-50115], '') OR
        ISNULL(t.[WCAR06ManualComm-50111], '') <> ISNULL(s.[WCAR06ManualComm-50111], '') OR
        ISNULL(t.[WCAR06ManualCommAmount-50112], '') <> ISNULL(s.[WCAR06ManualCommAmount-50112], '') OR
        ISNULL(t.[WCAR06MaxComm-50113], '') <> ISNULL(s.[WCAR06MaxComm-50113], '') OR
        ISNULL(t.[WCAR06SalesCommClosed-50101], '') <> ISNULL(s.[WCAR06SalesCommClosed-50101], '') OR
        ISNULL(t.[WCAR06SalesCommLedgEntry-50102], '') <> ISNULL(s.[WCAR06SalesCommLedgEntry-50102], '') OR
        ISNULL(t.[WCAR06SalesCommissionable-50100], '') <> ISNULL(s.[WCAR06SalesCommissionable-50100], '') OR
        ISNULL(t.[WCINT01ShortShipOrigQty-50221], '') <> ISNULL(s.[WCINT01ShortShipOrigQty-50221], '') OR
        ISNULL(t.[WCINT01ShortShipped-50220], '') <> ISNULL(s.[WCINT01ShortShipped-50220], '') OR
        ISNULL(t.[WTBABillHoldEntryNo-87570], '') <> ISNULL(s.[WTBABillHoldEntryNo-87570], '') OR
        ISNULL(t.[WTBACasePack-87010], '') <> ISNULL(s.[WTBACasePack-87010], '') OR
        ISNULL(t.[WTBAGallons-87301], '') <> ISNULL(s.[WTBAGallons-87301], '') OR
        ISNULL(t.[WTBAGrossWeight-87823], '') <> ISNULL(s.[WTBAGrossWeight-87823], '') OR
        ISNULL(t.[WTBALinkedLineNo-87000], '') <> ISNULL(s.[WTBALinkedLineNo-87000], '') OR
        ISNULL(t.[WTBALiters-87300], '') <> ISNULL(s.[WTBALiters-87300], '') OR
        ISNULL(t.[WTBANetWeight-87870], '') <> ISNULL(s.[WTBANetWeight-87870], '') OR
        ISNULL(t.[WTBAOriginalQtyBottle-87343], '') <> ISNULL(s.[WTBAOriginalQtyBottle-87343], '') OR
        ISNULL(t.[WTBAOriginalQuantity-87340], '') <> ISNULL(s.[WTBAOriginalQuantity-87340], '') OR
        ISNULL(t.[WTBAOriginalQuantityBase-87341], '') <> ISNULL(s.[WTBAOriginalQuantityBase-87341], '') OR
        ISNULL(t.[WTBAQuantityBottle-87083], '') <> ISNULL(s.[WTBAQuantityBottle-87083], '') OR
        ISNULL(t.[WTBAQuantityCase-87080], '') <> ISNULL(s.[WTBAQuantityCase-87080], '') OR
        ISNULL(t.[WTBAQuantityPallet-87880], '') <> ISNULL(s.[WTBAQuantityPallet-87880], '') OR
        ISNULL(t.[WTBASalesPriceOverride-87030], '') <> ISNULL(s.[WTBASalesPriceOverride-87030], '') OR
        ISNULL(t.[WTBASampleEntryNo-87704], '') <> ISNULL(s.[WTBASampleEntryNo-87704], '') OR
        ISNULL(t.[WTBASampleTotalAmount-87701], '') <> ISNULL(s.[WTBASampleTotalAmount-87701], '') OR
        ISNULL(t.[WTBAVolume-87824], '') <> ISNULL(s.[WTBAVolume-87824], '') OR
        ISNULL(t.[WTCBBillBack-89050], '') <> ISNULL(s.[WTCBBillBack-89050], '') OR
        ISNULL(t.[WTCBChargebackLedgerEntry-89040], '') <> ISNULL(s.[WTCBChargebackLedgerEntry-89040], '') OR
        ISNULL(t.[WTCBDeplAllowLineAmt-89030], '') <> ISNULL(s.[WTCBDeplAllowLineAmt-89030], '') OR
        ISNULL(t.[WTCBDeplAllowLineUnitAmt-89020], '') <> ISNULL(s.[WTCBDeplAllowLineUnitAmt-89020], '') OR
        ISNULL(t.[WTCBDeplAllowUnitAmt-89010], '') <> ISNULL(s.[WTCBDeplAllowUnitAmt-89010], '') OR
        ISNULL(t.[WTCBDeplAllowUnitAmtType-89000], '') <> ISNULL(s.[WTCBDeplAllowUnitAmtType-89000], '') OR
        ISNULL(t.[WTPCSalesPriceCalcMethod-89201], '') <> ISNULL(s.[WTPCSalesPriceCalcMethod-89201], '') OR
        ISNULL(t.[WTPCSalesPriceCalcQty-89202], '') <> ISNULL(s.[WTPCSalesPriceCalcQty-89202], '') OR
        ISNULL(t.[WTPCSalesPriceLinkId-89204], '') <> ISNULL(s.[WTPCSalesPriceLinkId-89204], '') OR
        ISNULL(t.[WTUSBeverageTax-88401], '') <> ISNULL(s.[WTUSBeverageTax-88401], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[NetWeight-35], '') <> ISNULL(s.[NetWeight-35], '') OR
        ISNULL(t.[QuantityInvoiced-61], '') <> ISNULL(s.[QuantityInvoiced-61], '') OR
        ISNULL(t.[TaxLiable-86], '') <> ISNULL(s.[TaxLiable-86], '') OR
        ISNULL(t.[WTBAOriginalQtyCase-87342], '') <> ISNULL(s.[WTBAOriginalQtyCase-87342], '') OR
        ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1)
    )


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE FROM silver.SalesShipmentLine111
        WHERE [systemId-2000000000] NOT IN (
            SELECT [systemId-2000000000] FROM [test_lh].[dbo].[SalesShipmentLine111]
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
        'SalesShipmentLine111',
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