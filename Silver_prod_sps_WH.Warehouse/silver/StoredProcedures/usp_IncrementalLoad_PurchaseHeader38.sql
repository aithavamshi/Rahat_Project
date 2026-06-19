---  Exec silver.usp_IncrementalLoad_PurchaseHeader38
---  select * from silver.PurchaseHeader38
---  TRUNCATE TABLE silver.PurchaseHeader38



CREATE             PROCEDURE silver.usp_IncrementalLoad_PurchaseHeader38
@RunId VARCHAR(100) ='RunId'
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
        INSERT INTO silver.PurchaseHeader38 (
        [IRS1099Code-10020],
        [RequestedReceiptDate-5790],
        [ShiptoName2-14],
        [ShiptoAddress2-16],
        [VATRegistrationNo-70],
        [LastReceivingNo-64],
        [WTBAPickupContact-87559],
        [WTBAPickupFaxNo-87561],
        [AppliestoDocNo-53],
        [ShiptoContact-18],
        [VendorCrMemoNo-69],
        [ShiptoPhoneNo-210],
        [WTBAPickupEmail-87562],
        [WCINT00DateTimeExported-50203],
        [WCINT00ExportFileName-50206],
        [WTBAPickupAddress2-87554],
        [VendorInvoiceNo-68],
        [WTBAPickupPhoneNo-87560],
        [WTBAPickupCounty-87556],
        [BuyfromAddress2-82],
        [PaytoAddress2-8],
        [WTBAPickupCountryRegCode-87558],
        [BuyfromVendorName2-80],
        [PaytoName2-6],
        [WTBAPickupPostCode-87557],
        [WTBAPickupCity-87555],
        [WTBAPickupAddress-87553],
        [BuyfromCounty-89],
        [PaytoCounty-86],
        [WCINT02LastEventPO-50251],
        [WTBAFreightForwarderCode-87750],
        [WTBAConsolidationNo-87820],
        [ERCPDReminderFollowUpDate-71276916],
        [ExpectedReceiptDate-21],
        [WTBAPickupName-87551],
        [WTBAPickupCode-87550],
        [CurrencyCode-32],
        [BuyfromContact-84],
        [PaytoContact-10],
        [BuyfromPostCode-88],
        [PaytoPostCode-85],
        [LeadTimeCalculation-5792],
        [PmtDiscountDate-26],
        [PrepmtPmtDiscountDate-142],
        [ShipmentMethodCode-27],
        [ShiptoCountryRegionCode-93],
        [PaymentMethodCode-104],
        [BuyfromCity-83],
        [PaytoCity-9],
        [ReceivingNoSeries-109],
        [PaymentTermsCode-23],
        [PrepmtPaymentTermsCode-143],
        [LocationCode-28],
        [BuyfromCountryRegionCode-90],
        [PaytoCountryRegionCode-87],
        [ShiptoAddress-15],
        [ShiptoCity-17],
        [ShiptoCounty-92],
        [ShiptoPostCode-91],
        [VATCountryRegionCode-78],
        [ShiptoName-13],
        [ShortcutDimension1Code-29],
        [BuyfromContactNo-5052],
        [PaytoContactNo-5053],
        [BuyfromAddress-81],
        [PaytoAddress-7],
        [PostingDate-20],
        [VATReportingDate-179],
        [BuyfromVendorName-79],
        [BuyfromVendorNo-2],
        [DueDate-24],
        [GenBusPostingGroup-74],
        [InvoiceDiscCode-37],
        [PaytoName-5],
        [PaytoVendorNo-4],
        [PostingNoSeries-108],
        [PrepaymentDueDate-137],
        [PurchaserCode-43],
        [VendorPostingGroup-31],
        [$Company],
        [$DeliveredDateTime],
        [AppliestoDocType-52],
        [BalAccountType-94],
        [CompressPrepayment-136],
        [Correction-98],
        [CurrencyFactor-33],
        [DIOTTypeofOperation-27030],
        [DimensionSetID-480],
        [DocNoOccurrence-5048],
        [DocumentDate-99],
        [DocumentType-1],
        [EDocumentLink-6100],
        [ERCExemptfromPrePayApp-71276894],
        [ERCPrePayAmounttoApply-71276895],
        [ERCPrintRentalLabels-71276877],
        [ERCRecurringExpired-71276876],
        [ERCRecurringInvoice-71276904],
        [ERCRecurringOnHold-71276905],
        [ERCRecurringPostingOption-71276907],
        [GSTHSTTaxType-10019],
        [ICDirection-129],
        [ICStatus-124],
        [IRS1099Amount-10021],
        [IncomingDocumentEntryNo-165],
        [Invoice-58],
        [InvoiceDiscountCalculation-121],
        [InvoiceDiscountValue-122],
        [JobQueueEntryID-161],
        [JobQueueStatus-160],
        [No-3],
        [NoPrinted-47],
        [NoSeries-107],
        [OrderDate-19],
        [PaymentDiscount-25],
        [PostingDescription-22],
        [PostingfromWhseRef-5753],
        [Prepayment-134],
        [PrepmtIncludeTax-12600],
        [PrepmtPaymentDiscount-144],
        [PriceCalculationMethod-7000],
        [PricesIncludingVAT-35],
        [PrintPostedDocuments-59],
        [Receive-57],
        [RecurringBilling-8051],
        [SendICDocument-123],
        [Ship-5803],
        [Status-120],
        [SystemCreatedAt-2000000001],
        [SystemCreatedBy-2000000002],
        [SystemModifiedAt-2000000003],
        [TaxLiable-115],
        [VATBaseDiscount-119],
        [WCINT00ExcludefromExport-50200],
        [WCINT00ExportAgain-50201],
        [WCINT00ExportError-50204],
        [WCINT00Exported-50202],
        [WCINT02JFHShipmentId-50250],
        [WTBAShipped-87821],
        [WTCBChargebackType-89000],
        [systemId-2000000000],
        [timestamp-0],
        [InsertDate]
        
        )
        SELECT
            s.[IRS1099Code-10020],
        s.[RequestedReceiptDate-5790],
        s.[ShiptoName2-14],
        s.[ShiptoAddress2-16],
        s.[VATRegistrationNo-70],
        s.[LastReceivingNo-64],
        s.[WTBAPickupContact-87559],
        s.[WTBAPickupFaxNo-87561],
        s.[AppliestoDocNo-53],
        s.[ShiptoContact-18],
        s.[VendorCrMemoNo-69],
        s.[ShiptoPhoneNo-210],
        s.[WTBAPickupEmail-87562],
        s.[WCINT00DateTimeExported-50203],
        s.[WCINT00ExportFileName-50206],
        s.[WTBAPickupAddress2-87554],
        s.[VendorInvoiceNo-68],
        s.[WTBAPickupPhoneNo-87560],
        s.[WTBAPickupCounty-87556],
        s.[BuyfromAddress2-82],
        s.[PaytoAddress2-8],
        s.[WTBAPickupCountryRegCode-87558],
        s.[BuyfromVendorName2-80],
        s.[PaytoName2-6],
        s.[WTBAPickupPostCode-87557],
        s.[WTBAPickupCity-87555],
        s.[WTBAPickupAddress-87553],
        s.[BuyfromCounty-89],
        s.[PaytoCounty-86],
        s.[WCINT02LastEventPO-50251],
        s.[WTBAFreightForwarderCode-87750],
        s.[WTBAConsolidationNo-87820],
        s.[ERCPDReminderFollowUpDate-71276916],
        s.[ExpectedReceiptDate-21],
        s.[WTBAPickupName-87551],
        s.[WTBAPickupCode-87550],
        s.[CurrencyCode-32],
        s.[BuyfromContact-84],
        s.[PaytoContact-10],
        s.[BuyfromPostCode-88],
        s.[PaytoPostCode-85],
        s.[LeadTimeCalculation-5792],
        s.[PmtDiscountDate-26],
        s.[PrepmtPmtDiscountDate-142],
        s.[ShipmentMethodCode-27],
        s.[ShiptoCountryRegionCode-93],
        s.[PaymentMethodCode-104],
        s.[BuyfromCity-83],
        s.[PaytoCity-9],
        s.[ReceivingNoSeries-109],
        s.[PaymentTermsCode-23],
        s.[PrepmtPaymentTermsCode-143],
        s.[LocationCode-28],
        s.[BuyfromCountryRegionCode-90],
        s.[PaytoCountryRegionCode-87],
        s.[ShiptoAddress-15],
        s.[ShiptoCity-17],
        s.[ShiptoCounty-92],
        s.[ShiptoPostCode-91],
        s.[VATCountryRegionCode-78],
        s.[ShiptoName-13],
        s.[ShortcutDimension1Code-29],
        s.[BuyfromContactNo-5052],
        s.[PaytoContactNo-5053],
        s.[BuyfromAddress-81],
        s.[PaytoAddress-7],
        s.[PostingDate-20],
        s.[VATReportingDate-179],
        s.[BuyfromVendorName-79],
        s.[BuyfromVendorNo-2],
        s.[DueDate-24],
        s.[GenBusPostingGroup-74],
        s.[InvoiceDiscCode-37],
        s.[PaytoName-5],
        s.[PaytoVendorNo-4],
        s.[PostingNoSeries-108],
        s.[PrepaymentDueDate-137],
        s.[PurchaserCode-43],
        s.[VendorPostingGroup-31],
        s.[$Company],
        s.[$DeliveredDateTime],
        s.[AppliestoDocType-52],
        s.[BalAccountType-94],
        s.[CompressPrepayment-136],
        s.[Correction-98],
        s.[CurrencyFactor-33],
        s.[DIOTTypeofOperation-27030],
        s.[DimensionSetID-480],
        s.[DocNoOccurrence-5048],
        s.[DocumentDate-99],
        s.[DocumentType-1],
        s.[EDocumentLink-6100],
        s.[ERCExemptfromPrePayApp-71276894],
        s.[ERCPrePayAmounttoApply-71276895],
        s.[ERCPrintRentalLabels-71276877],
        s.[ERCRecurringExpired-71276876],
        s.[ERCRecurringInvoice-71276904],
        s.[ERCRecurringOnHold-71276905],
        s.[ERCRecurringPostingOption-71276907],
        s.[GSTHSTTaxType-10019],
        s.[ICDirection-129],
        s.[ICStatus-124],
        s.[IRS1099Amount-10021],
        s.[IncomingDocumentEntryNo-165],
        s.[Invoice-58],
        s.[InvoiceDiscountCalculation-121],
        s.[InvoiceDiscountValue-122],
        s.[JobQueueEntryID-161],
        s.[JobQueueStatus-160],
        s.[No-3],
        s.[NoPrinted-47],
        s.[NoSeries-107],
        s.[OrderDate-19],
        s.[PaymentDiscount-25],
        s.[PostingDescription-22],
        s.[PostingfromWhseRef-5753],
        s.[Prepayment-134],
        s.[PrepmtIncludeTax-12600],
        s.[PrepmtPaymentDiscount-144],
        s.[PriceCalculationMethod-7000],
        s.[PricesIncludingVAT-35],
        s.[PrintPostedDocuments-59],
        s.[Receive-57],
        s.[RecurringBilling-8051],
        s.[SendICDocument-123],
        s.[Ship-5803],
        s.[Status-120],
        s.[SystemCreatedAt-2000000001],
        s.[SystemCreatedBy-2000000002],
        s.[SystemModifiedAt-2000000003],
        s.[TaxLiable-115],
        s.[VATBaseDiscount-119],
        s.[WCINT00ExcludefromExport-50200],
        s.[WCINT00ExportAgain-50201],
        s.[WCINT00ExportError-50204],
        s.[WCINT00Exported-50202],
        s.[WCINT02JFHShipmentId-50250],
        s.[WTBAShipped-87821],
        s.[WTCBChargebackType-89000],
        s.[systemId-2000000000],
        s.[timestamp-0],
        GETDATE()
        
        FROM [Bronze_2].[dbo].[PurchaseHeader38] s
        LEFT JOIN silver.PurchaseHeader38 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET 
            t.[IRS1099Code-10020] = s.[IRS1099Code-10020],
        t.[RequestedReceiptDate-5790] = s.[RequestedReceiptDate-5790],
        t.[ShiptoName2-14] = s.[ShiptoName2-14],
        t.[ShiptoAddress2-16] = s.[ShiptoAddress2-16],
        t.[VATRegistrationNo-70] = s.[VATRegistrationNo-70],
        t.[LastReceivingNo-64] = s.[LastReceivingNo-64],
        t.[WTBAPickupContact-87559] = s.[WTBAPickupContact-87559],
        t.[WTBAPickupFaxNo-87561] = s.[WTBAPickupFaxNo-87561],
        t.[AppliestoDocNo-53] = s.[AppliestoDocNo-53],
        t.[ShiptoContact-18] = s.[ShiptoContact-18],
        t.[VendorCrMemoNo-69] = s.[VendorCrMemoNo-69],
        t.[ShiptoPhoneNo-210] = s.[ShiptoPhoneNo-210],
        t.[WTBAPickupEmail-87562] = s.[WTBAPickupEmail-87562],
        t.[WCINT00DateTimeExported-50203] = s.[WCINT00DateTimeExported-50203],
        t.[WCINT00ExportFileName-50206] = s.[WCINT00ExportFileName-50206],
        t.[WTBAPickupAddress2-87554] = s.[WTBAPickupAddress2-87554],
        t.[VendorInvoiceNo-68] = s.[VendorInvoiceNo-68],
        t.[WTBAPickupPhoneNo-87560] = s.[WTBAPickupPhoneNo-87560],
        t.[WTBAPickupCounty-87556] = s.[WTBAPickupCounty-87556],
        t.[BuyfromAddress2-82] = s.[BuyfromAddress2-82],
        t.[PaytoAddress2-8] = s.[PaytoAddress2-8],
        t.[WTBAPickupCountryRegCode-87558] = s.[WTBAPickupCountryRegCode-87558],
        t.[BuyfromVendorName2-80] = s.[BuyfromVendorName2-80],
        t.[PaytoName2-6] = s.[PaytoName2-6],
        t.[WTBAPickupPostCode-87557] = s.[WTBAPickupPostCode-87557],
        t.[WTBAPickupCity-87555] = s.[WTBAPickupCity-87555],
        t.[WTBAPickupAddress-87553] = s.[WTBAPickupAddress-87553],
        t.[BuyfromCounty-89] = s.[BuyfromCounty-89],
        t.[PaytoCounty-86] = s.[PaytoCounty-86],
        t.[WCINT02LastEventPO-50251] = s.[WCINT02LastEventPO-50251],
        t.[WTBAFreightForwarderCode-87750] = s.[WTBAFreightForwarderCode-87750],
        t.[WTBAConsolidationNo-87820] = s.[WTBAConsolidationNo-87820],
        t.[ERCPDReminderFollowUpDate-71276916] = s.[ERCPDReminderFollowUpDate-71276916],
        t.[ExpectedReceiptDate-21] = s.[ExpectedReceiptDate-21],
        t.[WTBAPickupName-87551] = s.[WTBAPickupName-87551],
        t.[WTBAPickupCode-87550] = s.[WTBAPickupCode-87550],
        t.[CurrencyCode-32] = s.[CurrencyCode-32],
        t.[BuyfromContact-84] = s.[BuyfromContact-84],
        t.[PaytoContact-10] = s.[PaytoContact-10],
        t.[BuyfromPostCode-88] = s.[BuyfromPostCode-88],
        t.[PaytoPostCode-85] = s.[PaytoPostCode-85],
        t.[LeadTimeCalculation-5792] = s.[LeadTimeCalculation-5792],
        t.[PmtDiscountDate-26] = s.[PmtDiscountDate-26],
        t.[PrepmtPmtDiscountDate-142] = s.[PrepmtPmtDiscountDate-142],
        t.[ShipmentMethodCode-27] = s.[ShipmentMethodCode-27],
        t.[ShiptoCountryRegionCode-93] = s.[ShiptoCountryRegionCode-93],
        t.[PaymentMethodCode-104] = s.[PaymentMethodCode-104],
        t.[BuyfromCity-83] = s.[BuyfromCity-83],
        t.[PaytoCity-9] = s.[PaytoCity-9],
        t.[ReceivingNoSeries-109] = s.[ReceivingNoSeries-109],
        t.[PaymentTermsCode-23] = s.[PaymentTermsCode-23],
        t.[PrepmtPaymentTermsCode-143] = s.[PrepmtPaymentTermsCode-143],
        t.[LocationCode-28] = s.[LocationCode-28],
        t.[BuyfromCountryRegionCode-90] = s.[BuyfromCountryRegionCode-90],
        t.[PaytoCountryRegionCode-87] = s.[PaytoCountryRegionCode-87],
        t.[ShiptoAddress-15] = s.[ShiptoAddress-15],
        t.[ShiptoCity-17] = s.[ShiptoCity-17],
        t.[ShiptoCounty-92] = s.[ShiptoCounty-92],
        t.[ShiptoPostCode-91] = s.[ShiptoPostCode-91],
        t.[VATCountryRegionCode-78] = s.[VATCountryRegionCode-78],
        t.[ShiptoName-13] = s.[ShiptoName-13],
        t.[ShortcutDimension1Code-29] = s.[ShortcutDimension1Code-29],
        t.[BuyfromContactNo-5052] = s.[BuyfromContactNo-5052],
        t.[PaytoContactNo-5053] = s.[PaytoContactNo-5053],
        t.[BuyfromAddress-81] = s.[BuyfromAddress-81],
        t.[PaytoAddress-7] = s.[PaytoAddress-7],
        t.[PostingDate-20] = s.[PostingDate-20],
        t.[VATReportingDate-179] = s.[VATReportingDate-179],
        t.[BuyfromVendorName-79] = s.[BuyfromVendorName-79],
        t.[BuyfromVendorNo-2] = s.[BuyfromVendorNo-2],
        t.[DueDate-24] = s.[DueDate-24],
        t.[GenBusPostingGroup-74] = s.[GenBusPostingGroup-74],
        t.[InvoiceDiscCode-37] = s.[InvoiceDiscCode-37],
        t.[PaytoName-5] = s.[PaytoName-5],
        t.[PaytoVendorNo-4] = s.[PaytoVendorNo-4],
        t.[PostingNoSeries-108] = s.[PostingNoSeries-108],
        t.[PrepaymentDueDate-137] = s.[PrepaymentDueDate-137],
        t.[PurchaserCode-43] = s.[PurchaserCode-43],
        t.[VendorPostingGroup-31] = s.[VendorPostingGroup-31],
        t.[$Company] = s.[$Company],
        t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
        t.[AppliestoDocType-52] = s.[AppliestoDocType-52],
        t.[BalAccountType-94] = s.[BalAccountType-94],
        t.[CompressPrepayment-136] = s.[CompressPrepayment-136],
        t.[Correction-98] = s.[Correction-98],
        t.[CurrencyFactor-33] = s.[CurrencyFactor-33],
        t.[DIOTTypeofOperation-27030] = s.[DIOTTypeofOperation-27030],
        t.[DimensionSetID-480] = s.[DimensionSetID-480],
        t.[DocNoOccurrence-5048] = s.[DocNoOccurrence-5048],
        t.[DocumentDate-99] = s.[DocumentDate-99],
        t.[DocumentType-1] = s.[DocumentType-1],
        t.[EDocumentLink-6100] = s.[EDocumentLink-6100],
        t.[ERCExemptfromPrePayApp-71276894] = s.[ERCExemptfromPrePayApp-71276894],
        t.[ERCPrePayAmounttoApply-71276895] = s.[ERCPrePayAmounttoApply-71276895],
        t.[ERCPrintRentalLabels-71276877] = s.[ERCPrintRentalLabels-71276877],
        t.[ERCRecurringExpired-71276876] = s.[ERCRecurringExpired-71276876],
        t.[ERCRecurringInvoice-71276904] = s.[ERCRecurringInvoice-71276904],
        t.[ERCRecurringOnHold-71276905] = s.[ERCRecurringOnHold-71276905],
        t.[ERCRecurringPostingOption-71276907] = s.[ERCRecurringPostingOption-71276907],
        t.[GSTHSTTaxType-10019] = s.[GSTHSTTaxType-10019],
        t.[ICDirection-129] = s.[ICDirection-129],
        t.[ICStatus-124] = s.[ICStatus-124],
        t.[IRS1099Amount-10021] = s.[IRS1099Amount-10021],
        t.[IncomingDocumentEntryNo-165] = s.[IncomingDocumentEntryNo-165],
        t.[Invoice-58] = s.[Invoice-58],
        t.[InvoiceDiscountCalculation-121] = s.[InvoiceDiscountCalculation-121],
        t.[InvoiceDiscountValue-122] = s.[InvoiceDiscountValue-122],
        t.[JobQueueEntryID-161] = s.[JobQueueEntryID-161],
        t.[JobQueueStatus-160] = s.[JobQueueStatus-160],
        t.[No-3] = s.[No-3],
        t.[NoPrinted-47] = s.[NoPrinted-47],
        t.[NoSeries-107] = s.[NoSeries-107],
        t.[OrderDate-19] = s.[OrderDate-19],
        t.[PaymentDiscount-25] = s.[PaymentDiscount-25],
        t.[PostingDescription-22] = s.[PostingDescription-22],
        t.[PostingfromWhseRef-5753] = s.[PostingfromWhseRef-5753],
        t.[Prepayment-134] = s.[Prepayment-134],
        t.[PrepmtIncludeTax-12600] = s.[PrepmtIncludeTax-12600],
        t.[PrepmtPaymentDiscount-144] = s.[PrepmtPaymentDiscount-144],
        t.[PriceCalculationMethod-7000] = s.[PriceCalculationMethod-7000],
        t.[PricesIncludingVAT-35] = s.[PricesIncludingVAT-35],
        t.[PrintPostedDocuments-59] = s.[PrintPostedDocuments-59],
        t.[Receive-57] = s.[Receive-57],
        t.[RecurringBilling-8051] = s.[RecurringBilling-8051],
        t.[SendICDocument-123] = s.[SendICDocument-123],
        t.[Ship-5803] = s.[Ship-5803],
        t.[Status-120] = s.[Status-120],
        t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
        t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
        t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
        t.[TaxLiable-115] = s.[TaxLiable-115],
        t.[VATBaseDiscount-119] = s.[VATBaseDiscount-119],
        t.[WCINT00ExcludefromExport-50200] = s.[WCINT00ExcludefromExport-50200],
        t.[WCINT00ExportAgain-50201] = s.[WCINT00ExportAgain-50201],
        t.[WCINT00ExportError-50204] = s.[WCINT00ExportError-50204],
        t.[WCINT00Exported-50202] = s.[WCINT00Exported-50202],
        t.[WCINT02JFHShipmentId-50250] = s.[WCINT02JFHShipmentId-50250],
        t.[WTBAShipped-87821] = s.[WTBAShipped-87821],
        t.[WTCBChargebackType-89000] = s.[WTCBChargebackType-89000],
        t.[systemId-2000000000] = s.[systemId-2000000000],
        t.[timestamp-0] = s.[timestamp-0],
        t.[UpdateDate] = GETDATE()
        FROM silver.PurchaseHeader38 t
        INNER JOIN [Bronze_2].[dbo].[PurchaseHeader38] s
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE 
            ISNULL(t.[IRS1099Code-10020], '') <> ISNULL(s.[IRS1099Code-10020], '') OR
        ISNULL(t.[RequestedReceiptDate-5790], '') <> ISNULL(s.[RequestedReceiptDate-5790], '') OR
        ISNULL(t.[ShiptoName2-14], '') <> ISNULL(s.[ShiptoName2-14], '') OR
        ISNULL(t.[ShiptoAddress2-16], '') <> ISNULL(s.[ShiptoAddress2-16], '') OR
        ISNULL(t.[VATRegistrationNo-70], '') <> ISNULL(s.[VATRegistrationNo-70], '') OR
        ISNULL(t.[LastReceivingNo-64], '') <> ISNULL(s.[LastReceivingNo-64], '') OR
        ISNULL(t.[WTBAPickupContact-87559], '') <> ISNULL(s.[WTBAPickupContact-87559], '') OR
        ISNULL(t.[WTBAPickupFaxNo-87561], '') <> ISNULL(s.[WTBAPickupFaxNo-87561], '') OR
        ISNULL(t.[AppliestoDocNo-53], '') <> ISNULL(s.[AppliestoDocNo-53], '') OR
        ISNULL(t.[ShiptoContact-18], '') <> ISNULL(s.[ShiptoContact-18], '') OR
        ISNULL(t.[VendorCrMemoNo-69], '') <> ISNULL(s.[VendorCrMemoNo-69], '') OR
        ISNULL(t.[ShiptoPhoneNo-210], '') <> ISNULL(s.[ShiptoPhoneNo-210], '') OR
        ISNULL(t.[WTBAPickupEmail-87562], '') <> ISNULL(s.[WTBAPickupEmail-87562], '') OR
        ISNULL(t.[WCINT00DateTimeExported-50203], '') <> ISNULL(s.[WCINT00DateTimeExported-50203], '') OR
        ISNULL(t.[WCINT00ExportFileName-50206], '') <> ISNULL(s.[WCINT00ExportFileName-50206], '') OR
        ISNULL(t.[WTBAPickupAddress2-87554], '') <> ISNULL(s.[WTBAPickupAddress2-87554], '') OR
        ISNULL(t.[VendorInvoiceNo-68], '') <> ISNULL(s.[VendorInvoiceNo-68], '') OR
        ISNULL(t.[WTBAPickupPhoneNo-87560], '') <> ISNULL(s.[WTBAPickupPhoneNo-87560], '') OR
        ISNULL(t.[WTBAPickupCounty-87556], '') <> ISNULL(s.[WTBAPickupCounty-87556], '') OR
        ISNULL(t.[BuyfromAddress2-82], '') <> ISNULL(s.[BuyfromAddress2-82], '') OR
        ISNULL(t.[PaytoAddress2-8], '') <> ISNULL(s.[PaytoAddress2-8], '') OR
        ISNULL(t.[WTBAPickupCountryRegCode-87558], '') <> ISNULL(s.[WTBAPickupCountryRegCode-87558], '') OR
        ISNULL(t.[BuyfromVendorName2-80], '') <> ISNULL(s.[BuyfromVendorName2-80], '') OR
        ISNULL(t.[PaytoName2-6], '') <> ISNULL(s.[PaytoName2-6], '') OR
        ISNULL(t.[WTBAPickupPostCode-87557], '') <> ISNULL(s.[WTBAPickupPostCode-87557], '') OR
        ISNULL(t.[WTBAPickupCity-87555], '') <> ISNULL(s.[WTBAPickupCity-87555], '') OR
        ISNULL(t.[WTBAPickupAddress-87553], '') <> ISNULL(s.[WTBAPickupAddress-87553], '') OR
        ISNULL(t.[BuyfromCounty-89], '') <> ISNULL(s.[BuyfromCounty-89], '') OR
        ISNULL(t.[PaytoCounty-86], '') <> ISNULL(s.[PaytoCounty-86], '') OR
        ISNULL(t.[WCINT02LastEventPO-50251], '') <> ISNULL(s.[WCINT02LastEventPO-50251], '') OR
        ISNULL(t.[WTBAFreightForwarderCode-87750], '') <> ISNULL(s.[WTBAFreightForwarderCode-87750], '') OR
        ISNULL(t.[WTBAConsolidationNo-87820], '') <> ISNULL(s.[WTBAConsolidationNo-87820], '') OR
        ISNULL(t.[ERCPDReminderFollowUpDate-71276916], '') <> ISNULL(s.[ERCPDReminderFollowUpDate-71276916], '') OR
        ISNULL(t.[ExpectedReceiptDate-21], '') <> ISNULL(s.[ExpectedReceiptDate-21], '') OR
        ISNULL(t.[WTBAPickupName-87551], '') <> ISNULL(s.[WTBAPickupName-87551], '') OR
        ISNULL(t.[WTBAPickupCode-87550], '') <> ISNULL(s.[WTBAPickupCode-87550], '') OR
        ISNULL(t.[CurrencyCode-32], '') <> ISNULL(s.[CurrencyCode-32], '') OR
        ISNULL(t.[BuyfromContact-84], '') <> ISNULL(s.[BuyfromContact-84], '') OR
        ISNULL(t.[PaytoContact-10], '') <> ISNULL(s.[PaytoContact-10], '') OR
        ISNULL(t.[BuyfromPostCode-88], '') <> ISNULL(s.[BuyfromPostCode-88], '') OR
        ISNULL(t.[PaytoPostCode-85], '') <> ISNULL(s.[PaytoPostCode-85], '') OR
        ISNULL(t.[LeadTimeCalculation-5792], '') <> ISNULL(s.[LeadTimeCalculation-5792], '') OR
        ISNULL(t.[PmtDiscountDate-26], '') <> ISNULL(s.[PmtDiscountDate-26], '') OR
        ISNULL(t.[PrepmtPmtDiscountDate-142], '') <> ISNULL(s.[PrepmtPmtDiscountDate-142], '') OR
        ISNULL(t.[ShipmentMethodCode-27], '') <> ISNULL(s.[ShipmentMethodCode-27], '') OR
        ISNULL(t.[ShiptoCountryRegionCode-93], '') <> ISNULL(s.[ShiptoCountryRegionCode-93], '') OR
        ISNULL(t.[PaymentMethodCode-104], '') <> ISNULL(s.[PaymentMethodCode-104], '') OR
        ISNULL(t.[BuyfromCity-83], '') <> ISNULL(s.[BuyfromCity-83], '') OR
        ISNULL(t.[PaytoCity-9], '') <> ISNULL(s.[PaytoCity-9], '') OR
        ISNULL(t.[ReceivingNoSeries-109], '') <> ISNULL(s.[ReceivingNoSeries-109], '') OR
        ISNULL(t.[PaymentTermsCode-23], '') <> ISNULL(s.[PaymentTermsCode-23], '') OR
        ISNULL(t.[PrepmtPaymentTermsCode-143], '') <> ISNULL(s.[PrepmtPaymentTermsCode-143], '') OR
        ISNULL(t.[LocationCode-28], '') <> ISNULL(s.[LocationCode-28], '') OR
        ISNULL(t.[BuyfromCountryRegionCode-90], '') <> ISNULL(s.[BuyfromCountryRegionCode-90], '') OR
        ISNULL(t.[PaytoCountryRegionCode-87], '') <> ISNULL(s.[PaytoCountryRegionCode-87], '') OR
        ISNULL(t.[ShiptoAddress-15], '') <> ISNULL(s.[ShiptoAddress-15], '') OR
        ISNULL(t.[ShiptoCity-17], '') <> ISNULL(s.[ShiptoCity-17], '') OR
        ISNULL(t.[ShiptoCounty-92], '') <> ISNULL(s.[ShiptoCounty-92], '') OR
        ISNULL(t.[ShiptoPostCode-91], '') <> ISNULL(s.[ShiptoPostCode-91], '') OR
        ISNULL(t.[VATCountryRegionCode-78], '') <> ISNULL(s.[VATCountryRegionCode-78], '') OR
        ISNULL(t.[ShiptoName-13], '') <> ISNULL(s.[ShiptoName-13], '') OR
        ISNULL(t.[ShortcutDimension1Code-29], '') <> ISNULL(s.[ShortcutDimension1Code-29], '') OR
        ISNULL(t.[BuyfromContactNo-5052], '') <> ISNULL(s.[BuyfromContactNo-5052], '') OR
        ISNULL(t.[PaytoContactNo-5053], '') <> ISNULL(s.[PaytoContactNo-5053], '') OR
        ISNULL(t.[BuyfromAddress-81], '') <> ISNULL(s.[BuyfromAddress-81], '') OR
        ISNULL(t.[PaytoAddress-7], '') <> ISNULL(s.[PaytoAddress-7], '') OR
        ISNULL(t.[PostingDate-20], '') <> ISNULL(s.[PostingDate-20], '') OR
        ISNULL(t.[VATReportingDate-179], '') <> ISNULL(s.[VATReportingDate-179], '') OR
        ISNULL(t.[BuyfromVendorName-79], '') <> ISNULL(s.[BuyfromVendorName-79], '') OR
        ISNULL(t.[BuyfromVendorNo-2], '') <> ISNULL(s.[BuyfromVendorNo-2], '') OR
        ISNULL(t.[DueDate-24], '') <> ISNULL(s.[DueDate-24], '') OR
        ISNULL(t.[GenBusPostingGroup-74], '') <> ISNULL(s.[GenBusPostingGroup-74], '') OR
        ISNULL(t.[InvoiceDiscCode-37], '') <> ISNULL(s.[InvoiceDiscCode-37], '') OR
        ISNULL(t.[PaytoName-5], '') <> ISNULL(s.[PaytoName-5], '') OR
        ISNULL(t.[PaytoVendorNo-4], '') <> ISNULL(s.[PaytoVendorNo-4], '') OR
        ISNULL(t.[PostingNoSeries-108], '') <> ISNULL(s.[PostingNoSeries-108], '') OR
        ISNULL(t.[PrepaymentDueDate-137], '') <> ISNULL(s.[PrepaymentDueDate-137], '') OR
        ISNULL(t.[PurchaserCode-43], '') <> ISNULL(s.[PurchaserCode-43], '') OR
        ISNULL(t.[VendorPostingGroup-31], '') <> ISNULL(s.[VendorPostingGroup-31], '') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '') OR
        ISNULL(t.[AppliestoDocType-52], '') <> ISNULL(s.[AppliestoDocType-52], '') OR
        ISNULL(t.[BalAccountType-94], '') <> ISNULL(s.[BalAccountType-94], '') OR
        ISNULL(t.[CompressPrepayment-136], '') <> ISNULL(s.[CompressPrepayment-136], '') OR
        ISNULL(t.[Correction-98], '') <> ISNULL(s.[Correction-98], '') OR
        ISNULL(t.[CurrencyFactor-33], '') <> ISNULL(s.[CurrencyFactor-33], '') OR
        ISNULL(t.[DIOTTypeofOperation-27030], '') <> ISNULL(s.[DIOTTypeofOperation-27030], '') OR
        ISNULL(t.[DimensionSetID-480], '') <> ISNULL(s.[DimensionSetID-480], '') OR
        ISNULL(t.[DocNoOccurrence-5048], '') <> ISNULL(s.[DocNoOccurrence-5048], '') OR
        ISNULL(t.[DocumentDate-99], '') <> ISNULL(s.[DocumentDate-99], '') OR
        ISNULL(t.[DocumentType-1], '') <> ISNULL(s.[DocumentType-1], '') OR
        ISNULL(t.[EDocumentLink-6100], '') <> ISNULL(s.[EDocumentLink-6100], '') OR
        ISNULL(t.[ERCExemptfromPrePayApp-71276894], '') <> ISNULL(s.[ERCExemptfromPrePayApp-71276894], '') OR
        ISNULL(t.[ERCPrePayAmounttoApply-71276895], '') <> ISNULL(s.[ERCPrePayAmounttoApply-71276895], '') OR
        ISNULL(t.[ERCPrintRentalLabels-71276877], '') <> ISNULL(s.[ERCPrintRentalLabels-71276877], '') OR
        ISNULL(t.[ERCRecurringExpired-71276876], '') <> ISNULL(s.[ERCRecurringExpired-71276876], '') OR
        ISNULL(t.[ERCRecurringInvoice-71276904], '') <> ISNULL(s.[ERCRecurringInvoice-71276904], '') OR
        ISNULL(t.[ERCRecurringOnHold-71276905], '') <> ISNULL(s.[ERCRecurringOnHold-71276905], '') OR
        ISNULL(t.[ERCRecurringPostingOption-71276907], '') <> ISNULL(s.[ERCRecurringPostingOption-71276907], '') OR
        ISNULL(t.[GSTHSTTaxType-10019], '') <> ISNULL(s.[GSTHSTTaxType-10019], '') OR
        ISNULL(t.[ICDirection-129], '') <> ISNULL(s.[ICDirection-129], '') OR
        ISNULL(t.[ICStatus-124], '') <> ISNULL(s.[ICStatus-124], '') OR
        ISNULL(t.[IRS1099Amount-10021], '') <> ISNULL(s.[IRS1099Amount-10021], '') OR
        ISNULL(t.[IncomingDocumentEntryNo-165], '') <> ISNULL(s.[IncomingDocumentEntryNo-165], '') OR
        ISNULL(t.[Invoice-58], '') <> ISNULL(s.[Invoice-58], '') OR
        ISNULL(t.[InvoiceDiscountCalculation-121], '') <> ISNULL(s.[InvoiceDiscountCalculation-121], '') OR
        ISNULL(t.[InvoiceDiscountValue-122], '') <> ISNULL(s.[InvoiceDiscountValue-122], '') OR
        ISNULL(t.[JobQueueEntryID-161], '') <> ISNULL(s.[JobQueueEntryID-161], '') OR
        ISNULL(t.[JobQueueStatus-160], '') <> ISNULL(s.[JobQueueStatus-160], '') OR
        ISNULL(t.[No-3], '') <> ISNULL(s.[No-3], '') OR
        ISNULL(t.[NoPrinted-47], '') <> ISNULL(s.[NoPrinted-47], '') OR
        ISNULL(t.[NoSeries-107], '') <> ISNULL(s.[NoSeries-107], '') OR
        ISNULL(t.[OrderDate-19], '') <> ISNULL(s.[OrderDate-19], '') OR
        ISNULL(t.[PaymentDiscount-25], '') <> ISNULL(s.[PaymentDiscount-25], '') OR
        ISNULL(t.[PostingDescription-22], '') <> ISNULL(s.[PostingDescription-22], '') OR
        ISNULL(t.[PostingfromWhseRef-5753], '') <> ISNULL(s.[PostingfromWhseRef-5753], '') OR
        ISNULL(t.[Prepayment-134], '') <> ISNULL(s.[Prepayment-134], '') OR
        ISNULL(t.[PrepmtIncludeTax-12600], '') <> ISNULL(s.[PrepmtIncludeTax-12600], '') OR
        ISNULL(t.[PrepmtPaymentDiscount-144], '') <> ISNULL(s.[PrepmtPaymentDiscount-144], '') OR
        ISNULL(t.[PriceCalculationMethod-7000], '') <> ISNULL(s.[PriceCalculationMethod-7000], '') OR
        ISNULL(t.[PricesIncludingVAT-35], '') <> ISNULL(s.[PricesIncludingVAT-35], '') OR
        ISNULL(t.[PrintPostedDocuments-59], '') <> ISNULL(s.[PrintPostedDocuments-59], '') OR
        ISNULL(t.[Receive-57], '') <> ISNULL(s.[Receive-57], '') OR
        ISNULL(t.[RecurringBilling-8051], '') <> ISNULL(s.[RecurringBilling-8051], '') OR
        ISNULL(t.[SendICDocument-123], '') <> ISNULL(s.[SendICDocument-123], '') OR
        ISNULL(t.[Ship-5803], '') <> ISNULL(s.[Ship-5803], '') OR
        ISNULL(t.[Status-120], '') <> ISNULL(s.[Status-120], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[TaxLiable-115], '') <> ISNULL(s.[TaxLiable-115], '') OR
        ISNULL(t.[VATBaseDiscount-119], '') <> ISNULL(s.[VATBaseDiscount-119], '') OR
        ISNULL(t.[WCINT00ExcludefromExport-50200], '') <> ISNULL(s.[WCINT00ExcludefromExport-50200], '') OR
        ISNULL(t.[WCINT00ExportAgain-50201], '') <> ISNULL(s.[WCINT00ExportAgain-50201], '') OR
        ISNULL(t.[WCINT00ExportError-50204], '') <> ISNULL(s.[WCINT00ExportError-50204], '') OR
        ISNULL(t.[WCINT00Exported-50202], '') <> ISNULL(s.[WCINT00Exported-50202], '') OR
        ISNULL(t.[WCINT02JFHShipmentId-50250], '') <> ISNULL(s.[WCINT02JFHShipmentId-50250], '') OR
        ISNULL(t.[WTBAShipped-87821], '') <> ISNULL(s.[WTBAShipped-87821], '') OR
        ISNULL(t.[WTCBChargebackType-89000], '') <> ISNULL(s.[WTCBChargebackType-89000], '') OR
        ISNULL(t.[systemId-2000000000], '') <> ISNULL(s.[systemId-2000000000], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '');
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------   
	    DELETE t FROM silver.PurchaseHeader38 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [Bronze_2].[dbo].[PurchaseHeader38] s
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
        'PurchaseHeader38',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        @ErrorMessage
    );

END;