---  Exec silver.usp_IncrementalLoad_PurchaseLine39
---  select * from [dwh].[silver].[PurchaseLine39]
---  TRUNCATE TABLE [silver].[PurchaseLine39]



CREATE                           PROCEDURE silver.usp_IncrementalLoad_PurchaseLine39
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
        INSERT INTO silver.PurchaseLine39 (
          [OrderNo-65], [VendorItemNo-70], [WTBAContainerNo-87821], [WTBAConsolidationNo-87820],
          [CurrencyCode-91], [LeadTimeCalculation-5792], [ItemCategoryCode-5709], [SafetyLeadTime-99000758],
          [PostingGroup-8], [UnitofMeasure-13], [UnitofMeasureCode-5407], [WTBAAlcoholTypeCode-87050],
          [WTBABottleSize-87020], [GenProdPostingGroup-75], [LocationCode-7], [ShortcutDimension1Code-40],
          [OrderDate-5795], [PlannedReceiptDate-5794], [ExpectedReceiptDate-10], [GenBusPostingGroup-74],
          [No-6], [BuyfromVendorNo-2], [PaytoVendorNo-68], [Description-11], [$Company], [$DeliveredDateTime],
          [1099Liable-10030], [ARcdNotInvExVATLCY-141], [AllowInvoiceDisc-32], [AllowItemChargeAssignment-5800],
          [Amount-29], [AmountInclVATToInv-6101], [AmountIncludingVAT-30], [AmtRcdNotInvoiced-59],
          [AmtRcdNotInvoicedLCY-93], [AppltoItemEntry-38], [AttachedtoLineNo-80], [BlanketOrderLineNo-98],
          [CompletelyReceived-5752], [CopiedFromPostedDoc-6610], [DeprAcquisitionCost-5606], [DepruntilFAPostingDate-5605],
          [DimensionSetID-480], [DirectUnitCost-22], [Discount-8055], [DocumentNo-3], [DocumentType-1],
          [DropShipment-73],  [ERCGenForDocLineNo-71276917], [ERCGenForDocType-71276915], [ERCPQDispositionStatus-71276920],
          [EmissionCH4-6218], [EmissionCH4PerUnit-6215], [EmissionCO2-6217], [EmissionCO2PerUnit-6214],
          [EmissionN2O-6219], [EmissionN2OPerUnit-6216], [FAPostingType-5601], [Finished-99000753], [GSTHST-10025],
          [GrossWeight-34], [ICPartnerRefType-107], [IRS1099Liable-10022], [IndirectCost-54],
          [InvDiscAmounttoInvoice-105], [InvDiscountAmount-69], [ItemReferenceType-5727], [JobCurrencyFactor-1012],
          [JobLineAmount-1005], [JobLineAmountLCY-1010], [JobLineDiscAmountLCY-1011], [JobLineDiscount-1007],
          [JobLineDiscountAmount-1006], [JobLineType-1002], [JobPlanningLineNo-1019], [JobRemainingQty-1030],
          [JobRemainingQtyBase-1031], [JobTotalPrice-1004], [JobTotalPriceLCY-1009], [JobUnitPrice-1003],
          [JobUnitPriceLCY-1008], [LineAmount-103], [LineDiscount-27], [LineDiscountAmount-28], [LineNo-4],
          [MPSOrder-99000756], [NetWeight-35], [NonDeductibleVAT-6200], [NonDeductibleVATAmount-6202],
          [NonDeductibleVATBase-6201], [NonDeductibleVATDiff-6203], [Nonstock-5710], [OrderLineNo-66],
          [OutstandingAmount-57], [OutstandingAmountLCY-92], [OutstandingAmtExVATLCY-140], [OutstandingQtyBase-5416],
          [OutstandingQuantity-16], [OverReceiptApprovalStatus-8511], [OverReceiptQuantity-8509],
          [OverheadRate-99000755], [PlanningFlexibility-99000757], [PmtDiscountAmount-145], [PostedEmissionCH4-6221],
          [PostedEmissionCO2-6220], [PostedEmissionN2O-6222], [Prepayment-109], [PrepaymentAmount-113],
          [PrepaymentLine-123], [PrepaymentTaxLiable-119], [PrepaymentVAT-115], [PrepaymentVATDifference-135],
          [PrepmtAmountInvInclVAT-124], [PrepmtAmountInvLCY-129], [PrepmtAmtDeducted-122], [PrepmtAmtInclVAT-112],
          [PrepmtAmtInv-111], [PrepmtAmttoDeduct-121], [PrepmtLineAmount-110], [PrepmtNonDeductVATAmount-6205],
          [PrepmtNonDeductVATBase-6204], [PrepmtPmtDiscountAmount-146], [PrepmtVATAmountInvLCY-132],
          [PrepmtVATBaseAmt-114], [PrepmtVATCalcType-116], [PrepmtVATDiffDeducted-137], [PrepmtVATDifftoDeduct-136],
          [PriceCalculationMethod-7000], [ProdOrderLineNo-99000754], [Profit-67], [QtyInvoicedBase-5461],
          [QtyRcdNotInvoiced-58], [QtyRcdNotInvoicedBase-5458], [QtyReceivedBase-5460], [QtyRoundingPrecision-5405],
          [QtyRoundingPrecisionBase-5406], [QtyperUnitofMeasure-5404], [QtytoInvoice-17], [QtytoInvoiceBase-5417],
          [QtytoReceive-18], [QtytoReceiveBase-5418], [Quantity-15], [QuantityBase-5415], [QuantityInvoiced-61],
          [QuantityReceived-60], [RecalculateInvoiceDisc-56], [ReceiptLineNo-64], [RetQtyShpdNotInvdBase-5806],
          [ReturnQtyShipped-5809], [ReturnQtyShippedBase-5810], [ReturnQtyShippedNotInvd-5805],
          [ReturnQtytoShip-5803], [ReturnQtytoShipBase-5804], [ReturnShipmentLineNo-6601], [ReturnShpdNotInvd-5807],
          [ReturnShpdNotInvdLCY-5808], [RoutingReferenceNo-99000759], [SalesOrderLineNo-72], [SalvageValue-5603],
          [SpecialOrder-5713], [SpecialOrderSalesLineNo-5715], [Subtype-6609], [SystemCreatedAt-2000000001],
          [SystemCreatedBy-2000000002], [SystemCreatedEntry-101], [SystemModifiedAt-2000000003],
          [TaxLiable-86], [TaxToBeExpensed-10001], [Type-5], [UnitCost-100], [UnitCostLCY-23], [UnitPriceLCY-31],
          [UnitVolume-37], [UnitsperParcel-36], [UseDuplicationList-5613], [UseTax-88], [VAT-25],
          [VATBaseAmount-99], [VATCalculationType-77], [VATDifference-104], [WTBACasePack-87010],
          [WTBAGallons-87301], [WTBAGrossWeight-87823], [WTBALiters-87300], [WTBANetWeight-87870],
          [WTBAOutstandingQtyBottle-87846], [WTBAOutstandingQtyCase-87845], [WTBAQtyInvoicedBottle-87836],
          [WTBAQtyInvoicedCase-87835], [WTBAQtyReceivedBottle-87832], [WTBAQtyReceivedCase-87829],
          [WTBAQtytoInvoiceBottle-87834], [WTBAQtytoInvoiceCase-87833], [WTBAQtytoReceiveBottle-87831],
          [WTBAQtytoReceiveCase-87828], [WTBAQuantityBottle-87030], [WTBAQuantityCase-87827],
          [WTBAQuantityPallet-87880], [WTBARetQtyShippedBottle-87840], [WTBARetQtyShippedCase-87839],
          [WTBARetQtytoShipBottle-87838], [WTBARetQtytoShipCase-87837], [WTBAVolume-87824],
          [WTCBAmountUnitType-89030], [WTCBBillBack-89020], [WTCBBillBackUpcharge-89025],
          [WTCBChargebackGroupAmount-89040], [WTCBChargebackLedgerEntry-89000], [systemId-2000000000],
          [timestamp-0], [InsertDate])
      SELECT
          s.[OrderNo-65], s.[VendorItemNo-70], s.[WTBAContainerNo-87821], s.[WTBAConsolidationNo-87820],
          s.[CurrencyCode-91], s.[LeadTimeCalculation-5792], s.[ItemCategoryCode-5709], s.[SafetyLeadTime-99000758],
          s.[PostingGroup-8], s.[UnitofMeasure-13], s.[UnitofMeasureCode-5407], s.[WTBAAlcoholTypeCode-87050],
          s.[WTBABottleSize-87020], s.[GenProdPostingGroup-75], s.[LocationCode-7], s.[ShortcutDimension1Code-40],
          s.[OrderDate-5795], s.[PlannedReceiptDate-5794], s.[ExpectedReceiptDate-10], s.[GenBusPostingGroup-74],
          s.[No-6], s.[BuyfromVendorNo-2], s.[PaytoVendorNo-68], s.[Description-11], s.[$Company], s.[$DeliveredDateTime],
          s.[1099Liable-10030], s.[ARcdNotInvExVATLCY-141], s.[AllowInvoiceDisc-32], s.[AllowItemChargeAssignment-5800],
          s.[Amount-29], s.[AmountInclVATToInv-6101], s.[AmountIncludingVAT-30], s.[AmtRcdNotInvoiced-59],
          s.[AmtRcdNotInvoicedLCY-93], s.[AppltoItemEntry-38], s.[AttachedtoLineNo-80], s.[BlanketOrderLineNo-98],
          s.[CompletelyReceived-5752], s.[CopiedFromPostedDoc-6610], s.[DeprAcquisitionCost-5606], s.[DepruntilFAPostingDate-5605],
          s.[DimensionSetID-480], s.[DirectUnitCost-22], s.[Discount-8055], s.[DocumentNo-3], s.[DocumentType-1],
          s.[DropShipment-73], s.[ERCGenForDocLineNo-71276917], s.[ERCGenForDocType-71276915], s.[ERCPQDispositionStatus-71276920],
          s.[EmissionCH4-6218], s.[EmissionCH4PerUnit-6215], s.[EmissionCO2-6217], s.[EmissionCO2PerUnit-6214],
          s.[EmissionN2O-6219], s.[EmissionN2OPerUnit-6216], s.[FAPostingType-5601], s.[Finished-99000753], s.[GSTHST-10025],
          s.[GrossWeight-34], s.[ICPartnerRefType-107], s.[IRS1099Liable-10022], s.[IndirectCost-54],
          s.[InvDiscAmounttoInvoice-105], s.[InvDiscountAmount-69], s.[ItemReferenceType-5727], s.[JobCurrencyFactor-1012],
          s.[JobLineAmount-1005], s.[JobLineAmountLCY-1010], s.[JobLineDiscAmountLCY-1011], s.[JobLineDiscount-1007],
          s.[JobLineDiscountAmount-1006], s.[JobLineType-1002], s.[JobPlanningLineNo-1019], s.[JobRemainingQty-1030],
          s.[JobRemainingQtyBase-1031], s.[JobTotalPrice-1004], s.[JobTotalPriceLCY-1009], s.[JobUnitPrice-1003],
          s.[JobUnitPriceLCY-1008], s.[LineAmount-103], s.[LineDiscount-27], s.[LineDiscountAmount-28], s.[LineNo-4],
          s.[MPSOrder-99000756], s.[NetWeight-35], s.[NonDeductibleVAT-6200], s.[NonDeductibleVATAmount-6202],
          s.[NonDeductibleVATBase-6201], s.[NonDeductibleVATDiff-6203], s.[Nonstock-5710], s.[OrderLineNo-66],
          s.[OutstandingAmount-57], s.[OutstandingAmountLCY-92], s.[OutstandingAmtExVATLCY-140], s.[OutstandingQtyBase-5416],
          s.[OutstandingQuantity-16], s.[OverReceiptApprovalStatus-8511], s.[OverReceiptQuantity-8509],
          s.[OverheadRate-99000755], s.[PlanningFlexibility-99000757], s.[PmtDiscountAmount-145], s.[PostedEmissionCH4-6221],
          s.[PostedEmissionCO2-6220], s.[PostedEmissionN2O-6222], s.[Prepayment-109], s.[PrepaymentAmount-113],
          s.[PrepaymentLine-123], s.[PrepaymentTaxLiable-119], s.[PrepaymentVAT-115], s.[PrepaymentVATDifference-135],
          s.[PrepmtAmountInvInclVAT-124], s.[PrepmtAmountInvLCY-129], s.[PrepmtAmtDeducted-122], s.[PrepmtAmtInclVAT-112],
          s.[PrepmtAmtInv-111], s.[PrepmtAmttoDeduct-121], s.[PrepmtLineAmount-110], s.[PrepmtNonDeductVATAmount-6205],
          s.[PrepmtNonDeductVATBase-6204], s.[PrepmtPmtDiscountAmount-146], s.[PrepmtVATAmountInvLCY-132],
          s.[PrepmtVATBaseAmt-114], s.[PrepmtVATCalcType-116], s.[PrepmtVATDiffDeducted-137], s.[PrepmtVATDifftoDeduct-136],
          s.[PriceCalculationMethod-7000], s.[ProdOrderLineNo-99000754], s.[Profit-67], s.[QtyInvoicedBase-5461],
          s.[QtyRcdNotInvoiced-58], s.[QtyRcdNotInvoicedBase-5458], s.[QtyReceivedBase-5460], s.[QtyRoundingPrecision-5405],
          s.[QtyRoundingPrecisionBase-5406], s.[QtyperUnitofMeasure-5404], s.[QtytoInvoice-17], s.[QtytoInvoiceBase-5417],
          s.[QtytoReceive-18], s.[QtytoReceiveBase-5418], s.[Quantity-15], s.[QuantityBase-5415], s.[QuantityInvoiced-61],
          s.[QuantityReceived-60], s.[RecalculateInvoiceDisc-56], s.[ReceiptLineNo-64], s.[RetQtyShpdNotInvdBase-5806],
          s.[ReturnQtyShipped-5809], s.[ReturnQtyShippedBase-5810], s.[ReturnQtyShippedNotInvd-5805],
          s.[ReturnQtytoShip-5803], s.[ReturnQtytoShipBase-5804], s.[ReturnShipmentLineNo-6601], s.[ReturnShpdNotInvd-5807],
          s.[ReturnShpdNotInvdLCY-5808], s.[RoutingReferenceNo-99000759], s.[SalesOrderLineNo-72], s.[SalvageValue-5603],
          s.[SpecialOrder-5713], s.[SpecialOrderSalesLineNo-5715], s.[Subtype-6609], s.[SystemCreatedAt-2000000001],
          s.[SystemCreatedBy-2000000002], s.[SystemCreatedEntry-101], s.[SystemModifiedAt-2000000003],
          s.[TaxLiable-86], s.[TaxToBeExpensed-10001], s.[Type-5], s.[UnitCost-100], s.[UnitCostLCY-23], s.[UnitPriceLCY-31],
          s.[UnitVolume-37], s.[UnitsperParcel-36], s.[UseDuplicationList-5613], s.[UseTax-88], s.[VAT-25],
          s.[VATBaseAmount-99], s.[VATCalculationType-77], s.[VATDifference-104], s.[WTBACasePack-87010],
          s.[WTBAGallons-87301], s.[WTBAGrossWeight-87823], s.[WTBALiters-87300], s.[WTBANetWeight-87870],
          s.[WTBAOutstandingQtyBottle-87846], s.[WTBAOutstandingQtyCase-87845], s.[WTBAQtyInvoicedBottle-87836],
          s.[WTBAQtyInvoicedCase-87835], s.[WTBAQtyReceivedBottle-87832], s.[WTBAQtyReceivedCase-87829],
          s.[WTBAQtytoInvoiceBottle-87834], s.[WTBAQtytoInvoiceCase-87833], s.[WTBAQtytoReceiveBottle-87831],
          s.[WTBAQtytoReceiveCase-87828], s.[WTBAQuantityBottle-87030], s.[WTBAQuantityCase-87827],
          s.[WTBAQuantityPallet-87880], s.[WTBARetQtyShippedBottle-87840], s.[WTBARetQtyShippedCase-87839],
          s.[WTBARetQtytoShipBottle-87838], s.[WTBARetQtytoShipCase-87837], s.[WTBAVolume-87824],
          s.[WTCBAmountUnitType-89030], s.[WTCBBillBack-89020], s.[WTCBBillBackUpcharge-89025],
          s.[WTCBChargebackGroupAmount-89040], s.[WTCBChargebackLedgerEntry-89000], s.[systemId-2000000000],
          s.[timestamp-0],CURRENT_TIMESTAMP
      
      FROM [test_lh].[dbo].[PurchaseLine39] AS s
      LEFT JOIN silver.PurchaseLine39 AS t
          ON s.[systemId-2000000000] = t.[systemId-2000000000]
      WHERE t.[systemId-2000000000] IS NULL
            AND s.[systemId-2000000000] IS NOT NULL;
              

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
			UPDATE t
			SET
		t.[OrderNo-65] = s.[OrderNo-65],
		t.[VendorItemNo-70] = s.[VendorItemNo-70],
		t.[WTBAContainerNo-87821] = s.[WTBAContainerNo-87821],
		t.[WTBAConsolidationNo-87820] = s.[WTBAConsolidationNo-87820],
		t.[CurrencyCode-91] = s.[CurrencyCode-91],
		t.[LeadTimeCalculation-5792] = s.[LeadTimeCalculation-5792],
		t.[ItemCategoryCode-5709] = s.[ItemCategoryCode-5709],
		t.[SafetyLeadTime-99000758] = s.[SafetyLeadTime-99000758],
		t.[PostingGroup-8] = s.[PostingGroup-8],
		t.[UnitofMeasure-13] = s.[UnitofMeasure-13],
		t.[UnitofMeasureCode-5407] = s.[UnitofMeasureCode-5407],
		t.[WTBAAlcoholTypeCode-87050] = s.[WTBAAlcoholTypeCode-87050],
		t.[WTBABottleSize-87020] = s.[WTBABottleSize-87020],
		t.[GenProdPostingGroup-75] = s.[GenProdPostingGroup-75],
		t.[LocationCode-7] = s.[LocationCode-7],
		t.[ShortcutDimension1Code-40] = s.[ShortcutDimension1Code-40],
		t.[OrderDate-5795] = s.[OrderDate-5795],
		t.[PlannedReceiptDate-5794] = s.[PlannedReceiptDate-5794],
		t.[ExpectedReceiptDate-10] = s.[ExpectedReceiptDate-10],
		t.[GenBusPostingGroup-74] = s.[GenBusPostingGroup-74],
		t.[No-6] = s.[No-6],
		t.[BuyfromVendorNo-2] = s.[BuyfromVendorNo-2],
		t.[PaytoVendorNo-68] = s.[PaytoVendorNo-68],
		t.[Description-11] = s.[Description-11],
		t.[$Company] = s.[$Company],
		t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
		t.[1099Liable-10030] = s.[1099Liable-10030],
		t.[ARcdNotInvExVATLCY-141] = s.[ARcdNotInvExVATLCY-141],
		t.[AllowInvoiceDisc-32] = s.[AllowInvoiceDisc-32],
		t.[AllowItemChargeAssignment-5800] = s.[AllowItemChargeAssignment-5800],
		t.[Amount-29] = s.[Amount-29],
		t.[AmountInclVATToInv-6101] = s.[AmountInclVATToInv-6101],
		t.[AmountIncludingVAT-30] = s.[AmountIncludingVAT-30],
		t.[AmtRcdNotInvoiced-59] = s.[AmtRcdNotInvoiced-59],
		t.[AmtRcdNotInvoicedLCY-93] = s.[AmtRcdNotInvoicedLCY-93],
		t.[AppltoItemEntry-38] = s.[AppltoItemEntry-38],
		t.[AttachedtoLineNo-80] = s.[AttachedtoLineNo-80],
		t.[BlanketOrderLineNo-98] = s.[BlanketOrderLineNo-98],
		t.[CompletelyReceived-5752] = s.[CompletelyReceived-5752],
		t.[CopiedFromPostedDoc-6610] = s.[CopiedFromPostedDoc-6610],
		t.[DeprAcquisitionCost-5606] = s.[DeprAcquisitionCost-5606],
		t.[DepruntilFAPostingDate-5605] = s.[DepruntilFAPostingDate-5605],
		t.[DimensionSetID-480] = s.[DimensionSetID-480],
		t.[DirectUnitCost-22] = s.[DirectUnitCost-22],
		t.[Discount-8055] = s.[Discount-8055],
		t.[DocumentNo-3] = s.[DocumentNo-3],
		t.[DocumentType-1] = s.[DocumentType-1],
		t.[DropShipment-73] = s.[DropShipment-73],
		t.[ERCGenForDocLineNo-71276917] = s.[ERCGenForDocLineNo-71276917],
		t.[ERCGenForDocType-71276915] = s.[ERCGenForDocType-71276915],
		t.[ERCPQDispositionStatus-71276920] = s.[ERCPQDispositionStatus-71276920],
		t.[EmissionCH4-6218] = s.[EmissionCH4-6218],
		t.[EmissionCH4PerUnit-6215] = s.[EmissionCH4PerUnit-6215],
		t.[EmissionCO2-6217] = s.[EmissionCO2-6217],
		t.[EmissionCO2PerUnit-6214] = s.[EmissionCO2PerUnit-6214],
		t.[EmissionN2O-6219] = s.[EmissionN2O-6219],
		t.[EmissionN2OPerUnit-6216] = s.[EmissionN2OPerUnit-6216],
		t.[FAPostingType-5601] = s.[FAPostingType-5601],
		t.[Finished-99000753] = s.[Finished-99000753],
		t.[GSTHST-10025] = s.[GSTHST-10025],
		t.[GrossWeight-34] = s.[GrossWeight-34],
		t.[ICPartnerRefType-107] = s.[ICPartnerRefType-107],
		t.[IRS1099Liable-10022] = s.[IRS1099Liable-10022],
		t.[IndirectCost-54] = s.[IndirectCost-54],
		t.[InvDiscAmounttoInvoice-105] = s.[InvDiscAmounttoInvoice-105],
		t.[InvDiscountAmount-69] = s.[InvDiscountAmount-69],
		t.[ItemReferenceType-5727] = s.[ItemReferenceType-5727],
		t.[JobCurrencyFactor-1012] = s.[JobCurrencyFactor-1012],
		t.[JobLineAmount-1005] = s.[JobLineAmount-1005],
		t.[JobLineAmountLCY-1010] = s.[JobLineAmountLCY-1010],
		t.[JobLineDiscAmountLCY-1011] = s.[JobLineDiscAmountLCY-1011],
		t.[JobLineDiscount-1007] = s.[JobLineDiscount-1007],
		t.[JobLineDiscountAmount-1006] = s.[JobLineDiscountAmount-1006],
		t.[JobLineType-1002] = s.[JobLineType-1002],
		t.[JobPlanningLineNo-1019] = s.[JobPlanningLineNo-1019],
		t.[JobRemainingQty-1030] = s.[JobRemainingQty-1030],
		t.[JobRemainingQtyBase-1031] = s.[JobRemainingQtyBase-1031],
		t.[JobTotalPrice-1004] = s.[JobTotalPrice-1004],
		t.[JobTotalPriceLCY-1009] = s.[JobTotalPriceLCY-1009],
		t.[JobUnitPrice-1003] = s.[JobUnitPrice-1003],
		t.[JobUnitPriceLCY-1008] = s.[JobUnitPriceLCY-1008],
		t.[LineAmount-103] = s.[LineAmount-103],
		t.[LineDiscount-27] = s.[LineDiscount-27],
		t.[LineDiscountAmount-28] = s.[LineDiscountAmount-28],
		t.[LineNo-4] = s.[LineNo-4],
		t.[MPSOrder-99000756] = s.[MPSOrder-99000756],
		t.[NetWeight-35] = s.[NetWeight-35],
		t.[NonDeductibleVAT-6200] = s.[NonDeductibleVAT-6200],
		t.[NonDeductibleVATAmount-6202] = s.[NonDeductibleVATAmount-6202],
		t.[NonDeductibleVATBase-6201] = s.[NonDeductibleVATBase-6201],
		t.[NonDeductibleVATDiff-6203] = s.[NonDeductibleVATDiff-6203],
		t.[Nonstock-5710] = s.[Nonstock-5710],
		t.[OrderLineNo-66] = s.[OrderLineNo-66],
		t.[OutstandingAmount-57] = s.[OutstandingAmount-57],
		t.[OutstandingAmountLCY-92] = s.[OutstandingAmountLCY-92],
		t.[OutstandingAmtExVATLCY-140] = s.[OutstandingAmtExVATLCY-140],
		t.[OutstandingQtyBase-5416] = s.[OutstandingQtyBase-5416],
		t.[OutstandingQuantity-16] = s.[OutstandingQuantity-16],
		t.[OverReceiptApprovalStatus-8511] = s.[OverReceiptApprovalStatus-8511],
		t.[OverReceiptQuantity-8509] = s.[OverReceiptQuantity-8509],
		t.[OverheadRate-99000755] = s.[OverheadRate-99000755],
		t.[PlanningFlexibility-99000757] = s.[PlanningFlexibility-99000757],
		t.[PmtDiscountAmount-145] = s.[PmtDiscountAmount-145],
		t.[PostedEmissionCH4-6221] = s.[PostedEmissionCH4-6221],
		t.[PostedEmissionCO2-6220] = s.[PostedEmissionCO2-6220],
		t.[PostedEmissionN2O-6222] = s.[PostedEmissionN2O-6222],
		t.[Prepayment-109] = s.[Prepayment-109],
		t.[PrepaymentAmount-113] = s.[PrepaymentAmount-113],
		t.[PrepaymentLine-123] = s.[PrepaymentLine-123],
		t.[PrepaymentTaxLiable-119] = s.[PrepaymentTaxLiable-119],
		t.[PrepaymentVAT-115] = s.[PrepaymentVAT-115],
		t.[PrepaymentVATDifference-135] = s.[PrepaymentVATDifference-135],
		t.[PrepmtAmountInvInclVAT-124] = s.[PrepmtAmountInvInclVAT-124],
		t.[PrepmtAmountInvLCY-129] = s.[PrepmtAmountInvLCY-129],
		t.[PrepmtAmtDeducted-122] = s.[PrepmtAmtDeducted-122],
		t.[PrepmtAmtInclVAT-112] = s.[PrepmtAmtInclVAT-112],
		t.[PrepmtAmtInv-111] = s.[PrepmtAmtInv-111],
		t.[PrepmtAmttoDeduct-121] = s.[PrepmtAmttoDeduct-121],
		t.[PrepmtLineAmount-110] = s.[PrepmtLineAmount-110],
		t.[PrepmtNonDeductVATAmount-6205] = s.[PrepmtNonDeductVATAmount-6205],
		t.[PrepmtNonDeductVATBase-6204] = s.[PrepmtNonDeductVATBase-6204],
		t.[PrepmtPmtDiscountAmount-146] = s.[PrepmtPmtDiscountAmount-146],
		t.[PrepmtVATAmountInvLCY-132] = s.[PrepmtVATAmountInvLCY-132],
		t.[PrepmtVATBaseAmt-114] = s.[PrepmtVATBaseAmt-114],
		t.[PrepmtVATCalcType-116] = s.[PrepmtVATCalcType-116],
		t.[PrepmtVATDiffDeducted-137] = s.[PrepmtVATDiffDeducted-137],
		t.[PrepmtVATDifftoDeduct-136] = s.[PrepmtVATDifftoDeduct-136],
		t.[PriceCalculationMethod-7000] = s.[PriceCalculationMethod-7000],
		t.[ProdOrderLineNo-99000754] = s.[ProdOrderLineNo-99000754],
		t.[Profit-67] = s.[Profit-67],
		t.[QtyInvoicedBase-5461] = s.[QtyInvoicedBase-5461],
		t.[QtyRcdNotInvoiced-58] = s.[QtyRcdNotInvoiced-58],
		t.[QtyRcdNotInvoicedBase-5458] = s.[QtyRcdNotInvoicedBase-5458],
		t.[QtyReceivedBase-5460] = s.[QtyReceivedBase-5460],
		t.[QtyRoundingPrecision-5405] = s.[QtyRoundingPrecision-5405],
		t.[QtyRoundingPrecisionBase-5406] = s.[QtyRoundingPrecisionBase-5406],
		t.[QtyperUnitofMeasure-5404] = s.[QtyperUnitofMeasure-5404],
		t.[QtytoInvoice-17] = s.[QtytoInvoice-17],
		t.[QtytoInvoiceBase-5417] = s.[QtytoInvoiceBase-5417],
		t.[QtytoReceive-18] = s.[QtytoReceive-18],
		t.[QtytoReceiveBase-5418] = s.[QtytoReceiveBase-5418],
		t.[Quantity-15] = s.[Quantity-15],
		t.[QuantityBase-5415] = s.[QuantityBase-5415],
		t.[QuantityInvoiced-61] = s.[QuantityInvoiced-61],
		t.[QuantityReceived-60] = s.[QuantityReceived-60],
		t.[RecalculateInvoiceDisc-56] = s.[RecalculateInvoiceDisc-56],
		t.[ReceiptLineNo-64] = s.[ReceiptLineNo-64],
		t.[RetQtyShpdNotInvdBase-5806] = s.[RetQtyShpdNotInvdBase-5806],
		t.[ReturnQtyShipped-5809] = s.[ReturnQtyShipped-5809],
		t.[ReturnQtyShippedBase-5810] = s.[ReturnQtyShippedBase-5810],
		t.[ReturnQtyShippedNotInvd-5805] = s.[ReturnQtyShippedNotInvd-5805],
		t.[ReturnQtytoShip-5803] = s.[ReturnQtytoShip-5803],
		t.[ReturnQtytoShipBase-5804] = s.[ReturnQtytoShipBase-5804],
		t.[ReturnShipmentLineNo-6601] = s.[ReturnShipmentLineNo-6601],
		t.[ReturnShpdNotInvd-5807] = s.[ReturnShpdNotInvd-5807],
		t.[ReturnShpdNotInvdLCY-5808] = s.[ReturnShpdNotInvdLCY-5808],
		t.[RoutingReferenceNo-99000759] = s.[RoutingReferenceNo-99000759],
		t.[SalesOrderLineNo-72] = s.[SalesOrderLineNo-72],
		t.[SalvageValue-5603] = s.[SalvageValue-5603],
		t.[SpecialOrder-5713] = s.[SpecialOrder-5713],
		t.[SpecialOrderSalesLineNo-5715] = s.[SpecialOrderSalesLineNo-5715],
		t.[Subtype-6609] = s.[Subtype-6609],
		t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
		t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
		t.[SystemCreatedEntry-101] = s.[SystemCreatedEntry-101],
		t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
		t.[TaxLiable-86] = s.[TaxLiable-86],
		t.[TaxToBeExpensed-10001] = s.[TaxToBeExpensed-10001],
		t.[Type-5] = s.[Type-5],
		t.[UnitCost-100] = s.[UnitCost-100],
		t.[UnitCostLCY-23] = s.[UnitCostLCY-23],
		t.[UnitPriceLCY-31] = s.[UnitPriceLCY-31],
		t.[UnitVolume-37] = s.[UnitVolume-37],
		t.[UnitsperParcel-36] = s.[UnitsperParcel-36],
		t.[UseDuplicationList-5613] = s.[UseDuplicationList-5613],
		t.[UseTax-88] = s.[UseTax-88],
		t.[VAT-25] = s.[VAT-25],
		t.[VATBaseAmount-99] = s.[VATBaseAmount-99],
		t.[VATCalculationType-77] = s.[VATCalculationType-77],
		t.[VATDifference-104] = s.[VATDifference-104],
		t.[WTBACasePack-87010] = s.[WTBACasePack-87010],
		t.[WTBAGallons-87301] = s.[WTBAGallons-87301],
		t.[WTBAGrossWeight-87823] = s.[WTBAGrossWeight-87823],
		t.[WTBALiters-87300] = s.[WTBALiters-87300],
		t.[WTBANetWeight-87870] = s.[WTBANetWeight-87870],
		t.[WTBAOutstandingQtyBottle-87846] = s.[WTBAOutstandingQtyBottle-87846],
		t.[WTBAOutstandingQtyCase-87845] = s.[WTBAOutstandingQtyCase-87845],
		t.[WTBAQtyInvoicedBottle-87836] = s.[WTBAQtyInvoicedBottle-87836],
		t.[WTBAQtyInvoicedCase-87835] = s.[WTBAQtyInvoicedCase-87835],
		t.[WTBAQtyReceivedBottle-87832] = s.[WTBAQtyReceivedBottle-87832],
		t.[WTBAQtyReceivedCase-87829] = s.[WTBAQtyReceivedCase-87829],
		t.[WTBAQtytoInvoiceBottle-87834] = s.[WTBAQtytoInvoiceBottle-87834],
		t.[WTBAQtytoInvoiceCase-87833] = s.[WTBAQtytoInvoiceCase-87833],
		t.[WTBAQtytoReceiveBottle-87831] = s.[WTBAQtytoReceiveBottle-87831],
		t.[WTBAQtytoReceiveCase-87828] = s.[WTBAQtytoReceiveCase-87828],
		t.[WTBAQuantityBottle-87030] = s.[WTBAQuantityBottle-87030],
		t.[WTBAQuantityCase-87827] = s.[WTBAQuantityCase-87827],
		t.[WTBAQuantityPallet-87880] = s.[WTBAQuantityPallet-87880],
		t.[WTBARetQtyShippedBottle-87840] = s.[WTBARetQtyShippedBottle-87840],
		t.[WTBARetQtyShippedCase-87839] = s.[WTBARetQtyShippedCase-87839],
		t.[WTBARetQtytoShipBottle-87838] = s.[WTBARetQtytoShipBottle-87838],
		t.[WTBARetQtytoShipCase-87837] = s.[WTBARetQtytoShipCase-87837],
		t.[WTBAVolume-87824] = s.[WTBAVolume-87824],
		t.[WTCBAmountUnitType-89030] = s.[WTCBAmountUnitType-89030],
		t.[WTCBBillBack-89020] = s.[WTCBBillBack-89020],
		t.[WTCBBillBackUpcharge-89025] = s.[WTCBBillBackUpcharge-89025],
		t.[WTCBChargebackGroupAmount-89040] = s.[WTCBChargebackGroupAmount-89040],
		t.[WTCBChargebackLedgerEntry-89000] = s.[WTCBChargebackLedgerEntry-89000],
		t.[systemId-2000000000] = s.[systemId-2000000000],
		t.[timestamp-0] = s.[timestamp-0],
		t.[UpdateDate] = GETDATE()      
			FROM silver.PurchaseLine39 t
			JOIN [test_lh].[dbo].[PurchaseLine39] s
				ON t.[systemId-2000000000] = s.[systemId-2000000000]
			WHERE(
		ISNULL(t.[OrderNo-65], '') <> ISNULL(s.[OrderNo-65], '') OR
		ISNULL(t.[VendorItemNo-70], '') <> ISNULL(s.[VendorItemNo-70], '') OR
		ISNULL(t.[WTBAContainerNo-87821], '') <> ISNULL(s.[WTBAContainerNo-87821], '') OR
		ISNULL(t.[WTBAConsolidationNo-87820], '') <> ISNULL(s.[WTBAConsolidationNo-87820], '') OR
		ISNULL(t.[CurrencyCode-91], '') <> ISNULL(s.[CurrencyCode-91], '') OR
		ISNULL(t.[LeadTimeCalculation-5792], '') <> ISNULL(s.[LeadTimeCalculation-5792], '') OR
		ISNULL(t.[ItemCategoryCode-5709], '') <> ISNULL(s.[ItemCategoryCode-5709], '') OR
		ISNULL(t.[SafetyLeadTime-99000758], '') <> ISNULL(s.[SafetyLeadTime-99000758], '') OR
		ISNULL(t.[PostingGroup-8], '') <> ISNULL(s.[PostingGroup-8], '') OR
		ISNULL(t.[UnitofMeasure-13], '') <> ISNULL(s.[UnitofMeasure-13], '') OR
		ISNULL(t.[UnitofMeasureCode-5407], '') <> ISNULL(s.[UnitofMeasureCode-5407], '') OR
		ISNULL(t.[WTBAAlcoholTypeCode-87050], '') <> ISNULL(s.[WTBAAlcoholTypeCode-87050], '') OR
		ISNULL(t.[WTBABottleSize-87020], '') <> ISNULL(s.[WTBABottleSize-87020], '') OR
		ISNULL(t.[GenProdPostingGroup-75], '') <> ISNULL(s.[GenProdPostingGroup-75], '') OR
		ISNULL(t.[LocationCode-7], '') <> ISNULL(s.[LocationCode-7], '') OR
		ISNULL(t.[ShortcutDimension1Code-40], '') <> ISNULL(s.[ShortcutDimension1Code-40], '') OR
		ISNULL(t.[OrderDate-5795], '') <> ISNULL(s.[OrderDate-5795], '') OR
		ISNULL(t.[PlannedReceiptDate-5794], '') <> ISNULL(s.[PlannedReceiptDate-5794], '') OR
		ISNULL(t.[ExpectedReceiptDate-10], '') <> ISNULL(s.[ExpectedReceiptDate-10], '') OR
		ISNULL(t.[GenBusPostingGroup-74], '') <> ISNULL(s.[GenBusPostingGroup-74], '') OR
		ISNULL(t.[No-6], '') <> ISNULL(s.[No-6], '') OR
		ISNULL(t.[BuyfromVendorNo-2], '') <> ISNULL(s.[BuyfromVendorNo-2], '') OR
		ISNULL(t.[PaytoVendorNo-68], '') <> ISNULL(s.[PaytoVendorNo-68], '') OR
		ISNULL(t.[Description-11], '') <> ISNULL(s.[Description-11], '') OR
		ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
		ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '') OR
		ISNULL(t.[1099Liable-10030], '') <> ISNULL(s.[1099Liable-10030], '') OR
		ISNULL(t.[ARcdNotInvExVATLCY-141], '') <> ISNULL(s.[ARcdNotInvExVATLCY-141], '') OR
		ISNULL(t.[AllowInvoiceDisc-32], '') <> ISNULL(s.[AllowInvoiceDisc-32], '') OR
		ISNULL(t.[AllowItemChargeAssignment-5800], '') <> ISNULL(s.[AllowItemChargeAssignment-5800], '') OR
		ISNULL(t.[Amount-29], '') <> ISNULL(s.[Amount-29], '') OR
		ISNULL(t.[AmountInclVATToInv-6101], '') <> ISNULL(s.[AmountInclVATToInv-6101], '') OR
		ISNULL(t.[AmountIncludingVAT-30], '') <> ISNULL(s.[AmountIncludingVAT-30], '') OR
		ISNULL(t.[AmtRcdNotInvoiced-59], '') <> ISNULL(s.[AmtRcdNotInvoiced-59], '') OR
		ISNULL(t.[AmtRcdNotInvoicedLCY-93], '') <> ISNULL(s.[AmtRcdNotInvoicedLCY-93], '') OR
		ISNULL(t.[AppltoItemEntry-38], '') <> ISNULL(s.[AppltoItemEntry-38], '') OR
		ISNULL(t.[AttachedtoLineNo-80], '') <> ISNULL(s.[AttachedtoLineNo-80], '') OR
		ISNULL(t.[BlanketOrderLineNo-98], '') <> ISNULL(s.[BlanketOrderLineNo-98], '') OR
		ISNULL(t.[CompletelyReceived-5752], '') <> ISNULL(s.[CompletelyReceived-5752], '') OR
		ISNULL(t.[CopiedFromPostedDoc-6610], '') <> ISNULL(s.[CopiedFromPostedDoc-6610], '')OR
		ISNULL(t.[DeprAcquisitionCost-5606], '') <> ISNULL(s.[DeprAcquisitionCost-5606], '') OR
		ISNULL(t.[DepruntilFAPostingDate-5605], '') <> ISNULL(s.[DepruntilFAPostingDate-5605], '') OR
		ISNULL(t.[DimensionSetID-480], '') <> ISNULL(s.[DimensionSetID-480], '') OR
		ISNULL(t.[DirectUnitCost-22], '') <> ISNULL(s.[DirectUnitCost-22], '') OR
		ISNULL(t.[Discount-8055], '') <> ISNULL(s.[Discount-8055], '') OR
		ISNULL(t.[DocumentNo-3], '') <> ISNULL(s.[DocumentNo-3], '') OR
		ISNULL(t.[DocumentType-1], '') <> ISNULL(s.[DocumentType-1], '') OR
		ISNULL(t.[DropShipment-73], '') <> ISNULL(s.[DropShipment-73], '') OR
		ISNULL(t.[ERCGenForDocLineNo-71276917], '') <> ISNULL(s.[ERCGenForDocLineNo-71276917], '') OR
		ISNULL(t.[ERCGenForDocType-71276915], '') <> ISNULL(s.[ERCGenForDocType-71276915], '') OR
		ISNULL(t.[ERCPQDispositionStatus-71276920], '') <> ISNULL(s.[ERCPQDispositionStatus-71276920], '') OR
		ISNULL(t.[EmissionCH4-6218], '') <> ISNULL(s.[EmissionCH4-6218], '') OR
		ISNULL(t.[EmissionCH4PerUnit-6215], '') <> ISNULL(s.[EmissionCH4PerUnit-6215], '') OR
		ISNULL(t.[EmissionCO2-6217], '') <> ISNULL(s.[EmissionCO2-6217], '') OR
		ISNULL(t.[EmissionCO2PerUnit-6214], '') <> ISNULL(s.[EmissionCO2PerUnit-6214], '') OR
		ISNULL(t.[EmissionN2O-6219], '') <> ISNULL(s.[EmissionN2O-6219], '') OR
		ISNULL(t.[EmissionN2OPerUnit-6216], '') <> ISNULL(s.[EmissionN2OPerUnit-6216], '') OR
		ISNULL(t.[FAPostingType-5601], '') <> ISNULL(s.[FAPostingType-5601], '') OR
		ISNULL(t.[Finished-99000753], '') <> ISNULL(s.[Finished-99000753], '') OR
		ISNULL(t.[GSTHST-10025], '') <> ISNULL(s.[GSTHST-10025], '')OR
		ISNULL(t.[GrossWeight-34], '') <> ISNULL(s.[GrossWeight-34], '') OR
		ISNULL(t.[ICPartnerRefType-107], '') <> ISNULL(s.[ICPartnerRefType-107], '') OR
		ISNULL(t.[IRS1099Liable-10022], '') <> ISNULL(s.[IRS1099Liable-10022], '') OR
		ISNULL(t.[IndirectCost-54], '') <> ISNULL(s.[IndirectCost-54], '') OR
		ISNULL(t.[InvDiscAmounttoInvoice-105], '') <> ISNULL(s.[InvDiscAmounttoInvoice-105], '') OR
		ISNULL(t.[InvDiscountAmount-69], '') <> ISNULL(s.[InvDiscountAmount-69], '') OR
		ISNULL(t.[ItemReferenceType-5727], '') <> ISNULL(s.[ItemReferenceType-5727], '') OR
		ISNULL(t.[JobCurrencyFactor-1012], '') <> ISNULL(s.[JobCurrencyFactor-1012], '') OR
		ISNULL(t.[JobLineAmount-1005], '') <> ISNULL(s.[JobLineAmount-1005], '') OR
		ISNULL(t.[JobLineAmountLCY-1010], '') <> ISNULL(s.[JobLineAmountLCY-1010], '') OR
		ISNULL(t.[JobLineDiscAmountLCY-1011], '') <> ISNULL(s.[JobLineDiscAmountLCY-1011], '') OR
		ISNULL(t.[JobLineDiscount-1007], '') <> ISNULL(s.[JobLineDiscount-1007], '') OR
		ISNULL(t.[JobLineDiscountAmount-1006], '') <> ISNULL(s.[JobLineDiscountAmount-1006], '') OR
		ISNULL(t.[JobLineType-1002], '') <> ISNULL(s.[JobLineType-1002], '') OR
		ISNULL(t.[JobPlanningLineNo-1019], '') <> ISNULL(s.[JobPlanningLineNo-1019], '') OR
		ISNULL(t.[JobRemainingQty-1030], '') <> ISNULL(s.[JobRemainingQty-1030], '') OR
		ISNULL(t.[JobRemainingQtyBase-1031], '') <> ISNULL(s.[JobRemainingQtyBase-1031], '') OR
		ISNULL(t.[JobTotalPrice-1004], '') <> ISNULL(s.[JobTotalPrice-1004], '') OR
		ISNULL(t.[JobTotalPriceLCY-1009], '') <> ISNULL(s.[JobTotalPriceLCY-1009], '') OR
		ISNULL(t.[JobUnitPrice-1003], '') <> ISNULL(s.[JobUnitPrice-1003], '')OR
		ISNULL(t.[JobUnitPriceLCY-1008], '') <> ISNULL(s.[JobUnitPriceLCY-1008], '') OR
		ISNULL(t.[LineAmount-103], '') <> ISNULL(s.[LineAmount-103], '') OR
		ISNULL(t.[LineDiscount-27], '') <> ISNULL(s.[LineDiscount-27], '') OR
		ISNULL(t.[LineDiscountAmount-28], '') <> ISNULL(s.[LineDiscountAmount-28], '') OR
		ISNULL(t.[LineNo-4], '') <> ISNULL(s.[LineNo-4], '') OR
		ISNULL(t.[MPSOrder-99000756], '') <> ISNULL(s.[MPSOrder-99000756], '') OR
		ISNULL(t.[NetWeight-35], '') <> ISNULL(s.[NetWeight-35], '') OR
		ISNULL(t.[NonDeductibleVAT-6200], '') <> ISNULL(s.[NonDeductibleVAT-6200], '') OR
		ISNULL(t.[NonDeductibleVATAmount-6202], '') <> ISNULL(s.[NonDeductibleVATAmount-6202], '') OR
		ISNULL(t.[NonDeductibleVATBase-6201], '') <> ISNULL(s.[NonDeductibleVATBase-6201], '') OR
		ISNULL(t.[NonDeductibleVATDiff-6203], '') <> ISNULL(s.[NonDeductibleVATDiff-6203], '') OR
		ISNULL(t.[Nonstock-5710], '') <> ISNULL(s.[Nonstock-5710], '') OR
		ISNULL(t.[OrderLineNo-66], '') <> ISNULL(s.[OrderLineNo-66], '') OR
		ISNULL(t.[OutstandingAmount-57], '') <> ISNULL(s.[OutstandingAmount-57], '') OR
		ISNULL(t.[OutstandingAmountLCY-92], '') <> ISNULL(s.[OutstandingAmountLCY-92], '') OR
		ISNULL(t.[OutstandingAmtExVATLCY-140], '') <> ISNULL(s.[OutstandingAmtExVATLCY-140], '') OR
		ISNULL(t.[OutstandingQtyBase-5416], '') <> ISNULL(s.[OutstandingQtyBase-5416], '') OR
		ISNULL(t.[OutstandingQuantity-16], '') <> ISNULL(s.[OutstandingQuantity-16], '') OR
		ISNULL(t.[OverReceiptApprovalStatus-8511], '') <> ISNULL(s.[OverReceiptApprovalStatus-8511], '') OR
		ISNULL(t.[OverReceiptQuantity-8509], '') <> ISNULL(s.[OverReceiptQuantity-8509], '')OR
		ISNULL(t.[OverheadRate-99000755], '') <> ISNULL(s.[OverheadRate-99000755], '') OR
		ISNULL(t.[PlanningFlexibility-99000757], '') <> ISNULL(s.[PlanningFlexibility-99000757], '') OR
		ISNULL(t.[PmtDiscountAmount-145], '') <> ISNULL(s.[PmtDiscountAmount-145], '') OR
		ISNULL(t.[PostedEmissionCH4-6221], '') <> ISNULL(s.[PostedEmissionCH4-6221], '') OR
		ISNULL(t.[PostedEmissionCO2-6220], '') <> ISNULL(s.[PostedEmissionCO2-6220], '') OR
		ISNULL(t.[PostedEmissionN2O-6222], '') <> ISNULL(s.[PostedEmissionN2O-6222], '') OR
		ISNULL(t.[Prepayment-109], '') <> ISNULL(s.[Prepayment-109], '') OR
		ISNULL(t.[PrepaymentAmount-113], '') <> ISNULL(s.[PrepaymentAmount-113], '') OR
		ISNULL(t.[PrepaymentLine-123], '') <> ISNULL(s.[PrepaymentLine-123], '') OR
		ISNULL(t.[PrepaymentTaxLiable-119], '') <> ISNULL(s.[PrepaymentTaxLiable-119], '') OR
		ISNULL(t.[PrepaymentVAT-115], '') <> ISNULL(s.[PrepaymentVAT-115], '') OR
		ISNULL(t.[PrepaymentVATDifference-135], '') <> ISNULL(s.[PrepaymentVATDifference-135], '') OR
		ISNULL(t.[PrepmtAmountInvInclVAT-124], '') <> ISNULL(s.[PrepmtAmountInvInclVAT-124], '') OR
		ISNULL(t.[PrepmtAmountInvLCY-129], '') <> ISNULL(s.[PrepmtAmountInvLCY-129], '') OR
		ISNULL(t.[PrepmtAmtDeducted-122], '') <> ISNULL(s.[PrepmtAmtDeducted-122], '') OR
		ISNULL(t.[PrepmtAmtInclVAT-112], '') <> ISNULL(s.[PrepmtAmtInclVAT-112], '') OR
		ISNULL(t.[PrepmtAmtInv-111], '') <> ISNULL(s.[PrepmtAmtInv-111], '') OR
		ISNULL(t.[PrepmtAmttoDeduct-121], '') <> ISNULL(s.[PrepmtAmttoDeduct-121], '') OR
		ISNULL(t.[PrepmtLineAmount-110], '') <> ISNULL(s.[PrepmtLineAmount-110], '') OR
		ISNULL(t.[PrepmtNonDeductVATAmount-6205], '') <> ISNULL(s.[PrepmtNonDeductVATAmount-6205], '') OR
		ISNULL(t.[PrepmtNonDeductVATBase-6204], '') <> ISNULL(s.[PrepmtNonDeductVATBase-6204], '') OR
		ISNULL(t.[PrepmtPmtDiscountAmount-146], '') <> ISNULL(s.[PrepmtPmtDiscountAmount-146], '') OR
		ISNULL(t.[PrepmtVATAmountInvLCY-132], '') <> ISNULL(s.[PrepmtVATAmountInvLCY-132], '') OR
		ISNULL(t.[PrepmtVATBaseAmt-114], '') <> ISNULL(s.[PrepmtVATBaseAmt-114], '') OR
		ISNULL(t.[PrepmtVATCalcType-116], '') <> ISNULL(s.[PrepmtVATCalcType-116], '') OR
		ISNULL(t.[PrepmtVATDiffDeducted-137], '') <> ISNULL(s.[PrepmtVATDiffDeducted-137], '') OR
		ISNULL(t.[PrepmtVATDifftoDeduct-136], '') <> ISNULL(s.[PrepmtVATDifftoDeduct-136], '') OR
		ISNULL(t.[PriceCalculationMethod-7000], '') <> ISNULL(s.[PriceCalculationMethod-7000], '') OR
		ISNULL(t.[ProdOrderLineNo-99000754], '') <> ISNULL(s.[ProdOrderLineNo-99000754], '') OR
		ISNULL(t.[Profit-67], '') <> ISNULL(s.[Profit-67], '') OR
		ISNULL(t.[QtyInvoicedBase-5461], '') <> ISNULL(s.[QtyInvoicedBase-5461], '') OR
		ISNULL(t.[QtyRcdNotInvoiced-58], '') <> ISNULL(s.[QtyRcdNotInvoiced-58], '') OR
		ISNULL(t.[QtyRcdNotInvoicedBase-5458], '') <> ISNULL(s.[QtyRcdNotInvoicedBase-5458], '') OR
		ISNULL(t.[QtyReceivedBase-5460], '') <> ISNULL(s.[QtyReceivedBase-5460], '') OR
		ISNULL(t.[QtyRoundingPrecision-5405], '') <> ISNULL(s.[QtyRoundingPrecision-5405], '') OR
		ISNULL(t.[QtyRoundingPrecisionBase-5406], '') <> ISNULL(s.[QtyRoundingPrecisionBase-5406], '') OR
		ISNULL(t.[QtyperUnitofMeasure-5404], '') <> ISNULL(s.[QtyperUnitofMeasure-5404], '') OR
		ISNULL(t.[QtytoInvoice-17], '') <> ISNULL(s.[QtytoInvoice-17], '') OR
		ISNULL(t.[QtytoInvoiceBase-5417], '') <> ISNULL(s.[QtytoInvoiceBase-5417], '') OR
		ISNULL(t.[QtytoReceive-18], '') <> ISNULL(s.[QtytoReceive-18], '') OR
		ISNULL(t.[QtytoReceiveBase-5418], '') <> ISNULL(s.[QtytoReceiveBase-5418], '') OR
		ISNULL(t.[Quantity-15], '') <> ISNULL(s.[Quantity-15], '') OR
		ISNULL(t.[QuantityBase-5415], '') <> ISNULL(s.[QuantityBase-5415], '') OR
		ISNULL(t.[QuantityInvoiced-61], '') <> ISNULL(s.[QuantityInvoiced-61], '') OR
		ISNULL(t.[QuantityReceived-60], '') <> ISNULL(s.[QuantityReceived-60], '') OR
		ISNULL(t.[RecalculateInvoiceDisc-56], '') <> ISNULL(s.[RecalculateInvoiceDisc-56], '') OR
		ISNULL(t.[ReceiptLineNo-64], '') <> ISNULL(s.[ReceiptLineNo-64], '') OR
		ISNULL(t.[RetQtyShpdNotInvdBase-5806], '') <> ISNULL(s.[RetQtyShpdNotInvdBase-5806], '') OR
		ISNULL(t.[ReturnQtyShipped-5809], '') <> ISNULL(s.[ReturnQtyShipped-5809], '') OR
		ISNULL(t.[ReturnQtyShippedBase-5810], '') <> ISNULL(s.[ReturnQtyShippedBase-5810], '') OR
		ISNULL(t.[ReturnQtyShippedNotInvd-5805], '') <> ISNULL(s.[ReturnQtyShippedNotInvd-5805], '') OR
		ISNULL(t.[ReturnQtytoShip-5803], '') <> ISNULL(s.[ReturnQtytoShip-5803], '') OR
		ISNULL(t.[ReturnQtytoShipBase-5804], '') <> ISNULL(s.[ReturnQtytoShipBase-5804], '') OR
		ISNULL(t.[ReturnShipmentLineNo-6601], '') <> ISNULL(s.[ReturnShipmentLineNo-6601], '') OR
		ISNULL(t.[ReturnShpdNotInvd-5807], '') <> ISNULL(s.[ReturnShpdNotInvd-5807], '') OR
		ISNULL(t.[ReturnShpdNotInvdLCY-5808], '') <> ISNULL(s.[ReturnShpdNotInvdLCY-5808], '') OR
		ISNULL(t.[RoutingReferenceNo-99000759], '') <> ISNULL(s.[RoutingReferenceNo-99000759], '') OR
		ISNULL(t.[SalesOrderLineNo-72], '') <> ISNULL(s.[SalesOrderLineNo-72], '') OR
		ISNULL(t.[SalvageValue-5603], '') <> ISNULL(s.[SalvageValue-5603], '') OR
		ISNULL(t.[SpecialOrder-5713], '') <> ISNULL(s.[SpecialOrder-5713], '') OR
		ISNULL(t.[SpecialOrderSalesLineNo-5715], '') <> ISNULL(s.[SpecialOrderSalesLineNo-5715], '') OR
		ISNULL(t.[Subtype-6609], '') <> ISNULL(s.[Subtype-6609], '') OR
		ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
		ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
		ISNULL(t.[SystemCreatedEntry-101], '') <> ISNULL(s.[SystemCreatedEntry-101], '') OR
		ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
		ISNULL(t.[TaxLiable-86], '') <> ISNULL(s.[TaxLiable-86], '') OR
		ISNULL(t.[TaxToBeExpensed-10001], '') <> ISNULL(s.[TaxToBeExpensed-10001], '') OR
		ISNULL(t.[Type-5], '') <> ISNULL(s.[Type-5], '') OR
		ISNULL(t.[UnitCost-100], '') <> ISNULL(s.[UnitCost-100], '') OR
		ISNULL(t.[UnitCostLCY-23], '') <> ISNULL(s.[UnitCostLCY-23], '') OR
		ISNULL(t.[UnitPriceLCY-31], '') <> ISNULL(s.[UnitPriceLCY-31], '') OR
		ISNULL(t.[UnitVolume-37], '') <> ISNULL(s.[UnitVolume-37], '') OR
		ISNULL(t.[UnitsperParcel-36], '') <> ISNULL(s.[UnitsperParcel-36], '') OR
		ISNULL(t.[UseDuplicationList-5613], '') <> ISNULL(s.[UseDuplicationList-5613], '') OR
		ISNULL(t.[UseTax-88], '') <> ISNULL(s.[UseTax-88], '') OR
		ISNULL(t.[VAT-25], '') <> ISNULL(s.[VAT-25], '') OR
		ISNULL(t.[VATBaseAmount-99], '') <> ISNULL(s.[VATBaseAmount-99], '') OR
		ISNULL(t.[VATCalculationType-77], '') <> ISNULL(s.[VATCalculationType-77], '') OR
		ISNULL(t.[VATDifference-104], '') <> ISNULL(s.[VATDifference-104], '')OR
		ISNULL(t.[WTBACasePack-87010], '') <> ISNULL(s.[WTBACasePack-87010], '') OR
		ISNULL(t.[WTBAGallons-87301], '') <> ISNULL(s.[WTBAGallons-87301], '') OR
		ISNULL(t.[WTBAGrossWeight-87823], '') <> ISNULL(s.[WTBAGrossWeight-87823], '') OR
		ISNULL(t.[WTBALiters-87300], '') <> ISNULL(s.[WTBALiters-87300], '') OR
		ISNULL(t.[WTBANetWeight-87870], '') <> ISNULL(s.[WTBANetWeight-87870], '') OR
		ISNULL(t.[WTBAOutstandingQtyBottle-87846], '') <> ISNULL(s.[WTBAOutstandingQtyBottle-87846], '') OR
		ISNULL(t.[WTBAOutstandingQtyCase-87845], '') <> ISNULL(s.[WTBAOutstandingQtyCase-87845], '') OR
		ISNULL(t.[WTBAQtyInvoicedBottle-87836], '') <> ISNULL(s.[WTBAQtyInvoicedBottle-87836], '') OR
		ISNULL(t.[WTBAQtyInvoicedCase-87835], '') <> ISNULL(s.[WTBAQtyInvoicedCase-87835], '') OR
		ISNULL(t.[WTBAQtyReceivedBottle-87832], '') <> ISNULL(s.[WTBAQtyReceivedBottle-87832], '') OR
		ISNULL(t.[WTBAQtyReceivedCase-87829], '') <> ISNULL(s.[WTBAQtyReceivedCase-87829], '') OR
		ISNULL(t.[WTBAQtytoInvoiceBottle-87834], '') <> ISNULL(s.[WTBAQtytoInvoiceBottle-87834], '') OR
		ISNULL(t.[WTBAQtytoInvoiceCase-87833], '') <> ISNULL(s.[WTBAQtytoInvoiceCase-87833], '') OR
		ISNULL(t.[WTBAQtytoReceiveBottle-87831], '') <> ISNULL(s.[WTBAQtytoReceiveBottle-87831], '') OR
		ISNULL(t.[WTBAQtytoReceiveCase-87828], '') <> ISNULL(s.[WTBAQtytoReceiveCase-87828], '') OR
		ISNULL(t.[WTBAQuantityBottle-87030], '') <> ISNULL(s.[WTBAQuantityBottle-87030], '') OR
		ISNULL(t.[WTBAQuantityCase-87827], '') <> ISNULL(s.[WTBAQuantityCase-87827], '') OR
		ISNULL(t.[WTBAQuantityPallet-87880], '') <> ISNULL(s.[WTBAQuantityPallet-87880], '') OR
        ISNULL(t.[WTBARetQtyShippedBottle-87840], '') <> ISNULL(s.[WTBARetQtyShippedBottle-87840], '') OR
        ISNULL(t.[WTBARetQtyShippedCase-87839], '') <> ISNULL(s.[WTBARetQtyShippedCase-87839], '') OR
        ISNULL(t.[WTBARetQtytoShipBottle-87838], '') <> ISNULL(s.[WTBARetQtytoShipBottle-87838], '') OR
        ISNULL(t.[WTBARetQtytoShipCase-87837], '') <> ISNULL(s.[WTBARetQtytoShipCase-87837], '') OR
        ISNULL(t.[WTBAVolume-87824], '') <> ISNULL(s.[WTBAVolume-87824], '') OR
        ISNULL(t.[WTCBAmountUnitType-89030], '') <> ISNULL(s.[WTCBAmountUnitType-89030], '') OR
        ISNULL(t.[WTCBBillBack-89020], '') <> ISNULL(s.[WTCBBillBack-89020], '') OR
        ISNULL(t.[WTCBBillBackUpcharge-89025], '') <> ISNULL(s.[WTCBBillBackUpcharge-89025], '') OR
        ISNULL(t.[WTCBChargebackGroupAmount-89040], '') <> ISNULL(s.[WTCBChargebackGroupAmount-89040], '') OR
        ISNULL(t.[WTCBChargebackLedgerEntry-89000], '') <> ISNULL(s.[WTCBChargebackLedgerEntry-89000], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '')
        );

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
		DELETE t FROM silver.PurchaseLine39 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[PurchaseLine39] s
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
        'PurchaseLine39',
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