---  EXEC silver.usp_IncrementalLoad_SalesShipmentHeader110
---  SELECT * FROM silver.SalesShipmentHeader110
---  TRUNCATE TABLE silver.SalesShipmentHeader110



CREATE        PROCEDURE silver.usp_IncrementalLoad_SalesShipmentHeader110
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
        INSERT INTO silver.SalesShipmentHeader110 (
            [YourReference-11],
            [AppliestoDocNo-53],
            [WTBALastEmailSentDateTime-87350],
            [RequestedDeliveryDate-5790],
            [ShiptoName2-14],
            [CustomerDiscGroup-40],
            [BilltoName2-6],
            [SelltoCustomerName2-80],
            [WCSAL34SampleReasonCode-50050],
            [WTBACoopCode-87650],
            [ShiptoAddress2-16],
            [BilltoAddress2-8],
            [SelltoAddress2-82],
            [ShiptoPhoneNo-210],
            [ExternalDocumentNo-100],
            [ShortcutDimension1Code-29],
            [ShiptoCode-12],
            [PaymentMethodCode-104],
            [SelltoCountryRegionCode-90],
            [VATCountryRegionCode-78],
            [BilltoCountryRegionCode-87],
            [ShiptoCountryRegionCode-93],
            [WCINT04PASalesRep-50651],
            [WCINT04PAOrderNo-50650],
            [WTPCPriceCalculatedDate-89201],
            [ShiptoContact-18],
            [VATRegistrationNo-70],
            [SelltoEMail-172],
            [WTUSBeverageTaxAreaCode-88400],
            [BilltoContact-10],
            [SelltoContact-84],
            [SelltoPhoneNo-171],
            [BilltoContactNo-5053],
            [SelltoContactNo-5052],
            [OrderNoSeries-110],
            [SelltoAddress-81],
            [BilltoAddress-7],
            [OrderNo-44],
            [ShippingAgentCode-105],
            [ShipmentMethodCode-27],
            [WTBACreditClassCode-87109],
            [ShiptoAddress-15],
            [PmtDiscountDate-26],
            [BilltoPostCode-85],
            [SelltoPostCode-88],
            [ShiptoPostCode-91],
            [PaymentTermsCode-23],
            [BilltoCity-9],
            [SelltoCity-83],
            [SalespersonCode-43],
            [ShipmentDate-21],
            [BilltoCounty-86],
            [SelltoCounty-89],
            [CustomerPriceGroup-34],
            [ShiptoName-13],
            [$Company],
            [AllowLineDisc-7001],
            [AppliestoDocType-52],
            [BalAccountType-94],
            [BilltoCustomerId-9002],
            [BilltoCustomerNo-4],
            [BilltoName-5],
            [Correction-98],
            [CurrencyFactor-33],
            [CustomerId-9001],
            [CustomerPostingGroup-31],
            [DimensionSetID-480],
            [DocumentDate-99],
            [DueDate-24],
            [EU3PartyTrade-75],
            [ElectronicDocumentStatus-10030],
            [ExchangeRateUSD-10060],
            [ForeignTrade-10050],
            [GenBusPostingGroup-74],
            [InvoiceDiscCode-37],
            [LocationCode-28],
            [MarkedasCanceled-27008],
            [No-3],
            [NoPrinted-47],
            [NoSeries-109],
            [OrderDate-19],
            [PaymentDiscount-25],
            [PostingDate-20],
            [PostingDescription-22],
            [PricesIncludingVAT-35],
            [SATAddressID-27009],
            [SelltoCustomerName-79],
            [SelltoCustomerNo-2],
            [ShiptoCity-17],
            [ShiptoCounty-92],
            [SourceCode-113],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [TaxLiable-115],
            [TransitDistance-10047],
            [TransitHours-10046],
            [UserID-112],
            [VATBaseDiscount-119],
            [WTBABillHoldType-87570],
            [WTBAOrderTypeCode-87007],
            [WTBASOReviewStatus-87851],
            [WTBASalesRegionCode-87003],
            [WTBASiteOrderID-87401],
            [WTPCPriceCalculated-89200],
            [systemId-2000000000],
            [timestamp-0],
            [PriceCalculationMethod-7000],
            [$DeliveredDateTime],
            [WTBASampleOrder-87008],
            InsertDate
           
        )
        SELECT
            s.[YourReference-11],
            s.[AppliestoDocNo-53],
            s.[WTBALastEmailSentDateTime-87350],
            s.[RequestedDeliveryDate-5790],
            s.[ShiptoName2-14],
            s.[CustomerDiscGroup-40],
            s.[BilltoName2-6],
            s.[SelltoCustomerName2-80],
            s.[WCSAL34SampleReasonCode-50050],
            s.[WTBACoopCode-87650],
            s.[ShiptoAddress2-16],
            s.[BilltoAddress2-8],
            s.[SelltoAddress2-82],
            s.[ShiptoPhoneNo-210],
            s.[ExternalDocumentNo-100],
            s.[ShortcutDimension1Code-29],
            s.[ShiptoCode-12],
            s.[PaymentMethodCode-104],
            s.[SelltoCountryRegionCode-90],
            s.[VATCountryRegionCode-78],
            s.[BilltoCountryRegionCode-87],
            s.[ShiptoCountryRegionCode-93],
            s.[WCINT04PASalesRep-50651],
            s.[WCINT04PAOrderNo-50650],
            s.[WTPCPriceCalculatedDate-89201],
            s.[ShiptoContact-18],
            s.[VATRegistrationNo-70],
            s.[SelltoEMail-172],
            s.[WTUSBeverageTaxAreaCode-88400],
            s.[BilltoContact-10],
            s.[SelltoContact-84],
            s.[SelltoPhoneNo-171],
            s.[BilltoContactNo-5053],
            s.[SelltoContactNo-5052],
            s.[OrderNoSeries-110],
            s.[SelltoAddress-81],
            s.[BilltoAddress-7],
            s.[OrderNo-44],
            s.[ShippingAgentCode-105],
            s.[ShipmentMethodCode-27],
            s.[WTBACreditClassCode-87109],
            s.[ShiptoAddress-15],
            s.[PmtDiscountDate-26],
            s.[BilltoPostCode-85],
            s.[SelltoPostCode-88],
            s.[ShiptoPostCode-91],
            s.[PaymentTermsCode-23],
            s.[BilltoCity-9],
            s.[SelltoCity-83],
            s.[SalespersonCode-43],
            s.[ShipmentDate-21], 
            s.[BilltoCounty-86],
            s.[SelltoCounty-89],
            s.[CustomerPriceGroup-34],
            s.[ShiptoName-13],
            s.[$Company],
            s.[AllowLineDisc-7001],
            s.[AppliestoDocType-52],
            s.[BalAccountType-94],
            s.[BilltoCustomerId-9002],
            s.[BilltoCustomerNo-4],
            s.[BilltoName-5],
            s.[Correction-98],
            s.[CurrencyFactor-33],
            s.[CustomerId-9001],
            s.[CustomerPostingGroup-31],
            s.[DimensionSetID-480],
            s.[DocumentDate-99],
            s.[DueDate-24], 
            s.[EU3PartyTrade-75],
            s.[ElectronicDocumentStatus-10030],
            s.[ExchangeRateUSD-10060],
            s.[ForeignTrade-10050],
            s.[GenBusPostingGroup-74],
            s.[InvoiceDiscCode-37],
            s.[LocationCode-28],
            s.[MarkedasCanceled-27008],
            s.[No-3],
            s.[NoPrinted-47],
            s.[NoSeries-109],
            s.[OrderDate-19],
            s.[PaymentDiscount-25],
            s.[PostingDate-20],
            s.[PostingDescription-22],
            s.[PricesIncludingVAT-35],
            s.[SATAddressID-27009],
            s.[SelltoCustomerName-79],
            s.[SelltoCustomerNo-2],
            s.[ShiptoCity-17],
            s.[ShiptoCounty-92],
            s.[SourceCode-113],
            s.[SystemCreatedAt-2000000001],
            s.[SystemCreatedBy-2000000002],
            s.[SystemModifiedAt-2000000003], 
            s.[TaxLiable-115],
            s.[TransitDistance-10047],
            s.[TransitHours-10046],
            s.[UserID-112],
            s.[VATBaseDiscount-119],
            s.[WTBABillHoldType-87570],
            s.[WTBAOrderTypeCode-87007],
            s.[WTBASOReviewStatus-87851],
            s.[WTBASalesRegionCode-87003],
            s.[WTBASiteOrderID-87401],
            s.[WTPCPriceCalculated-89200],
            s.[systemId-2000000000],
            s.[timestamp-0],
            s.[PriceCalculationMethod-7000],
            s.[$DeliveredDateTime],
            s.[WTBASampleOrder-87008],
            GETDATE()
           
        FROM [test_lh].[dbo].[SalesShipmentHeader110] s
        LEFT JOIN silver.SalesShipmentHeader110 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;
            

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
            UPDATE t
            SET
                t.[YourReference-11] = s.[YourReference-11],
                t.[AppliestoDocNo-53] = s.[AppliestoDocNo-53],
                t.[WTBALastEmailSentDateTime-87350] = s.[WTBALastEmailSentDateTime-87350], 
                t.[RequestedDeliveryDate-5790] = s.[RequestedDeliveryDate-5790], 
                t.[ShiptoName2-14] = s.[ShiptoName2-14],
                t.[CustomerDiscGroup-40] = s.[CustomerDiscGroup-40],
                t.[BilltoName2-6] = s.[BilltoName2-6],
                t.[SelltoCustomerName2-80] = s.[SelltoCustomerName2-80],
                t.[WCSAL34SampleReasonCode-50050] = s.[WCSAL34SampleReasonCode-50050],
                t.[WTBACoopCode-87650] = s.[WTBACoopCode-87650],
                t.[ShiptoAddress2-16] = s.[ShiptoAddress2-16],
                t.[BilltoAddress2-8] = s.[BilltoAddress2-8],
                t.[SelltoAddress2-82] = s.[SelltoAddress2-82],
                t.[ShiptoPhoneNo-210] = s.[ShiptoPhoneNo-210],
                t.[ExternalDocumentNo-100] = s.[ExternalDocumentNo-100],
                t.[ShortcutDimension1Code-29] = s.[ShortcutDimension1Code-29],
                t.[ShiptoCode-12] = s.[ShiptoCode-12],
                t.[PaymentMethodCode-104] = s.[PaymentMethodCode-104],
                t.[SelltoCountryRegionCode-90] = s.[SelltoCountryRegionCode-90],
                t.[VATCountryRegionCode-78] = s.[VATCountryRegionCode-78],
                t.[BilltoCountryRegionCode-87] = s.[BilltoCountryRegionCode-87],
                t.[ShiptoCountryRegionCode-93] = s.[ShiptoCountryRegionCode-93],
                t.[WCINT04PASalesRep-50651] = s.[WCINT04PASalesRep-50651],
                t.[WCINT04PAOrderNo-50650] = s.[WCINT04PAOrderNo-50650],
                t.[WTPCPriceCalculatedDate-89201] = s.[WTPCPriceCalculatedDate-89201],
                t.[ShiptoContact-18] = s.[ShiptoContact-18],
                t.[VATRegistrationNo-70] = s.[VATRegistrationNo-70],
                t.[SelltoEMail-172] = s.[SelltoEMail-172],
                t.[WTUSBeverageTaxAreaCode-88400] = s.[WTUSBeverageTaxAreaCode-88400],
                t.[BilltoContact-10] = s.[BilltoContact-10],
                t.[SelltoContact-84] = s.[SelltoContact-84],
                t.[SelltoPhoneNo-171] = s.[SelltoPhoneNo-171],
                t.[BilltoContactNo-5053] = s.[BilltoContactNo-5053],
                t.[SelltoContactNo-5052] = s.[SelltoContactNo-5052],
                t.[OrderNoSeries-110] = s.[OrderNoSeries-110],
                t.[SelltoAddress-81] = s.[SelltoAddress-81],
                t.[BilltoAddress-7] = s.[BilltoAddress-7],
                t.[OrderNo-44] = s.[OrderNo-44],
                t.[ShippingAgentCode-105] = s.[ShippingAgentCode-105],
                t.[ShipmentMethodCode-27] = s.[ShipmentMethodCode-27],
                t.[WTBACreditClassCode-87109] = s.[WTBACreditClassCode-87109],
                t.[ShiptoAddress-15] = s.[ShiptoAddress-15],
                t.[PmtDiscountDate-26] = s.[PmtDiscountDate-26], 
                t.[BilltoPostCode-85] = s.[BilltoPostCode-85],
                t.[SelltoPostCode-88] = s.[SelltoPostCode-88],
                t.[ShiptoPostCode-91] = s.[ShiptoPostCode-91],
                t.[PaymentTermsCode-23] = s.[PaymentTermsCode-23],
                t.[BilltoCity-9] = s.[BilltoCity-9],
                t.[SelltoCity-83] = s.[SelltoCity-83],
                t.[SalespersonCode-43] = s.[SalespersonCode-43],
                t.[ShipmentDate-21] = s.[ShipmentDate-21], 
                t.[BilltoCounty-86] = s.[BilltoCounty-86],
                t.[SelltoCounty-89] = s.[SelltoCounty-89],
                t.[CustomerPriceGroup-34] = s.[CustomerPriceGroup-34],
                t.[ShiptoName-13] = s.[ShiptoName-13],
                t.[$Company] = s.[$Company],
                t.[AllowLineDisc-7001] = s.[AllowLineDisc-7001],
                t.[AppliestoDocType-52] = s.[AppliestoDocType-52],
                t.[BalAccountType-94] = s.[BalAccountType-94],
                t.[BilltoCustomerId-9002] = s.[BilltoCustomerId-9002],
                t.[BilltoCustomerNo-4] = s.[BilltoCustomerNo-4],
                t.[BilltoName-5] = s.[BilltoName-5],
                t.[Correction-98] = s.[Correction-98],
                t.[CurrencyFactor-33] = s.[CurrencyFactor-33],
                t.[CustomerId-9001] = s.[CustomerId-9001],
                t.[CustomerPostingGroup-31] = s.[CustomerPostingGroup-31],
                t.[DimensionSetID-480] = s.[DimensionSetID-480],
                t.[DocumentDate-99] = s.[DocumentDate-99], 
                t.[DueDate-24] = s.[DueDate-24],
                t.[EU3PartyTrade-75] = s.[EU3PartyTrade-75],
                t.[ElectronicDocumentStatus-10030] = s.[ElectronicDocumentStatus-10030],
                t.[ExchangeRateUSD-10060] = s.[ExchangeRateUSD-10060],
                t.[ForeignTrade-10050] = s.[ForeignTrade-10050],
                t.[GenBusPostingGroup-74] = s.[GenBusPostingGroup-74],
                t.[InvoiceDiscCode-37] = s.[InvoiceDiscCode-37],
                t.[LocationCode-28] = s.[LocationCode-28],
                t.[MarkedasCanceled-27008] = s.[MarkedasCanceled-27008],
                t.[No-3] = s.[No-3],
                t.[NoPrinted-47] = s.[NoPrinted-47],
                t.[NoSeries-109] = s.[NoSeries-109],
                t.[OrderDate-19] = s.[OrderDate-19],
                t.[PaymentDiscount-25] = s.[PaymentDiscount-25],
                t.[PostingDate-20] = s.[PostingDate-20],
                t.[PostingDescription-22] = s.[PostingDescription-22],
                t.[PricesIncludingVAT-35] = s.[PricesIncludingVAT-35],
                t.[SATAddressID-27009] = s.[SATAddressID-27009],
                t.[SelltoCustomerName-79] = s.[SelltoCustomerName-79],
                t.[SelltoCustomerNo-2] = s.[SelltoCustomerNo-2],
                t.[ShiptoCity-17] = s.[ShiptoCity-17],
                t.[ShiptoCounty-92] = s.[ShiptoCounty-92],
                t.[SourceCode-113] = s.[SourceCode-113],
                t.[SystemCreatedAt-2000000001] = s.[SystemCreatedAt-2000000001],
                t.[SystemCreatedBy-2000000002] = s.[SystemCreatedBy-2000000002],
                t.[SystemModifiedAt-2000000003] = s.[SystemModifiedAt-2000000003],
                t.[TaxLiable-115] = s.[TaxLiable-115],
                t.[TransitDistance-10047] = s.[TransitDistance-10047],
                t.[TransitHours-10046] = s.[TransitHours-10046],
                t.[UserID-112] = s.[UserID-112],
                t.[VATBaseDiscount-119] = s.[VATBaseDiscount-119],
                t.[WTBABillHoldType-87570] = s.[WTBABillHoldType-87570],
                t.[WTBAOrderTypeCode-87007] = s.[WTBAOrderTypeCode-87007],
                t.[WTBASOReviewStatus-87851] = s.[WTBASOReviewStatus-87851],
                t.[WTBASalesRegionCode-87003] = s.[WTBASalesRegionCode-87003],
                t.[WTBASiteOrderID-87401] = s.[WTBASiteOrderID-87401],
                t.[WTPCPriceCalculated-89200] = s.[WTPCPriceCalculated-89200], 
                t.[timestamp-0] = s.[timestamp-0],
                t.[PriceCalculationMethod-7000] = s.[PriceCalculationMethod-7000],
                t.[$DeliveredDateTime] = s.[$DeliveredDateTime],
                t.[WTBASampleOrder-87008] = s.[WTBASampleOrder-87008],
                t.UpdateDate = GETDATE()
            FROM silver.SalesShipmentHeader110 t
            JOIN [test_lh].[dbo].[SalesShipmentHeader110] s
                 ON t.[systemId-2000000000] = s.[systemId-2000000000]
            WHERE
                ISNULL(t.[YourReference-11], '') <> ISNULL(s.[YourReference-11], '') OR
        ISNULL(t.[AppliestoDocNo-53], '') <> ISNULL(s.[AppliestoDocNo-53], '') OR
        ISNULL(t.[WTBALastEmailSentDateTime-87350], '') <> ISNULL(s.[WTBALastEmailSentDateTime-87350], '') OR
        ISNULL(t.[RequestedDeliveryDate-5790], '') <> ISNULL(s.[RequestedDeliveryDate-5790], '') OR
        ISNULL(t.[ShiptoName2-14], '') <> ISNULL(s.[ShiptoName2-14], '') OR
        ISNULL(t.[CustomerDiscGroup-40], '') <> ISNULL(s.[CustomerDiscGroup-40], '') OR
        ISNULL(t.[BilltoName2-6], '') <> ISNULL(s.[BilltoName2-6], '') OR
        ISNULL(t.[SelltoCustomerName2-80], '') <> ISNULL(s.[SelltoCustomerName2-80], '') OR
        ISNULL(t.[WCSAL34SampleReasonCode-50050], '') <> ISNULL(s.[WCSAL34SampleReasonCode-50050], '') OR
        ISNULL(t.[WTBACoopCode-87650], '') <> ISNULL(s.[WTBACoopCode-87650], '') OR
        ISNULL(t.[ShiptoAddress2-16], '') <> ISNULL(s.[ShiptoAddress2-16], '') OR
        ISNULL(t.[BilltoAddress2-8], '') <> ISNULL(s.[BilltoAddress2-8], '') OR
        ISNULL(t.[SelltoAddress2-82], '') <> ISNULL(s.[SelltoAddress2-82], '') OR
        ISNULL(t.[ShiptoPhoneNo-210], '') <> ISNULL(s.[ShiptoPhoneNo-210], '') OR
        ISNULL(t.[ExternalDocumentNo-100], '') <> ISNULL(s.[ExternalDocumentNo-100], '') OR
        ISNULL(t.[ShortcutDimension1Code-29], '') <> ISNULL(s.[ShortcutDimension1Code-29], '') OR
        ISNULL(t.[ShiptoCode-12], '') <> ISNULL(s.[ShiptoCode-12], '') OR
        ISNULL(t.[PaymentMethodCode-104], '') <> ISNULL(s.[PaymentMethodCode-104], '') OR
        ISNULL(t.[SelltoCountryRegionCode-90], '') <> ISNULL(s.[SelltoCountryRegionCode-90], '') OR
        ISNULL(t.[VATCountryRegionCode-78], '') <> ISNULL(s.[VATCountryRegionCode-78], '') OR
        ISNULL(t.[BilltoCountryRegionCode-87], '') <> ISNULL(s.[BilltoCountryRegionCode-87], '') OR
        ISNULL(t.[ShiptoCountryRegionCode-93], '') <> ISNULL(s.[ShiptoCountryRegionCode-93], '') OR
        ISNULL(t.[WCINT04PASalesRep-50651], '') <> ISNULL(s.[WCINT04PASalesRep-50651], '') OR
        ISNULL(t.[WCINT04PAOrderNo-50650], '') <> ISNULL(s.[WCINT04PAOrderNo-50650], '') OR
        ISNULL(t.[WTPCPriceCalculatedDate-89201], '') <> ISNULL(s.[WTPCPriceCalculatedDate-89201], '') OR
        ISNULL(t.[ShiptoContact-18], '') <> ISNULL(s.[ShiptoContact-18], '') OR
        ISNULL(t.[VATRegistrationNo-70], '') <> ISNULL(s.[VATRegistrationNo-70], '') OR
        ISNULL(t.[SelltoEMail-172], '') <> ISNULL(s.[SelltoEMail-172], '') OR
        ISNULL(t.[WTUSBeverageTaxAreaCode-88400], '') <> ISNULL(s.[WTUSBeverageTaxAreaCode-88400], '') OR
        ISNULL(t.[BilltoContact-10], '') <> ISNULL(s.[BilltoContact-10], '') OR
        ISNULL(t.[SelltoContact-84], '') <> ISNULL(s.[SelltoContact-84], '') OR
        ISNULL(t.[SelltoPhoneNo-171], '') <> ISNULL(s.[SelltoPhoneNo-171], '') OR
        ISNULL(t.[BilltoContactNo-5053], '') <> ISNULL(s.[BilltoContactNo-5053], '') OR
        ISNULL(t.[SelltoContactNo-5052], '') <> ISNULL(s.[SelltoContactNo-5052], '') OR
        ISNULL(t.[OrderNoSeries-110], '') <> ISNULL(s.[OrderNoSeries-110], '') OR
        ISNULL(t.[SelltoAddress-81], '') <> ISNULL(s.[SelltoAddress-81], '') OR
        ISNULL(t.[BilltoAddress-7], '') <> ISNULL(s.[BilltoAddress-7], '') OR
        ISNULL(t.[OrderNo-44], '') <> ISNULL(s.[OrderNo-44], '') OR
        ISNULL(t.[ShippingAgentCode-105], '') <> ISNULL(s.[ShippingAgentCode-105], '') OR
        ISNULL(t.[ShipmentMethodCode-27], '') <> ISNULL(s.[ShipmentMethodCode-27], '') OR
        ISNULL(t.[WTBACreditClassCode-87109], '') <> ISNULL(s.[WTBACreditClassCode-87109], '') OR
        ISNULL(t.[ShiptoAddress-15], '') <> ISNULL(s.[ShiptoAddress-15], '') OR
        ISNULL(t.[PmtDiscountDate-26], '') <> ISNULL(s.[PmtDiscountDate-26], '') OR
        ISNULL(t.[BilltoPostCode-85], '') <> ISNULL(s.[BilltoPostCode-85], '') OR
        ISNULL(t.[SelltoPostCode-88], '') <> ISNULL(s.[SelltoPostCode-88], '') OR
        ISNULL(t.[ShiptoPostCode-91], '') <> ISNULL(s.[ShiptoPostCode-91], '') OR
        ISNULL(t.[PaymentTermsCode-23], '') <> ISNULL(s.[PaymentTermsCode-23], '') OR
        ISNULL(t.[BilltoCity-9], '') <> ISNULL(s.[BilltoCity-9], '') OR
        ISNULL(t.[SelltoCity-83], '') <> ISNULL(s.[SelltoCity-83], '') OR
        ISNULL(t.[SalespersonCode-43], '') <> ISNULL(s.[SalespersonCode-43], '') OR
        ISNULL(t.[ShipmentDate-21], '') <> ISNULL(s.[ShipmentDate-21], '') OR
        ISNULL(t.[BilltoCounty-86], '') <> ISNULL(s.[BilltoCounty-86], '') OR
        ISNULL(t.[SelltoCounty-89], '') <> ISNULL(s.[SelltoCounty-89], '') OR
        ISNULL(t.[CustomerPriceGroup-34], '') <> ISNULL(s.[CustomerPriceGroup-34], '') OR
        ISNULL(t.[ShiptoName-13], '') <> ISNULL(s.[ShiptoName-13], '') OR
        ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
        ISNULL(t.[AllowLineDisc-7001], '') <> ISNULL(s.[AllowLineDisc-7001], '') OR
        ISNULL(t.[AppliestoDocType-52], '') <> ISNULL(s.[AppliestoDocType-52], '') OR
        ISNULL(t.[BalAccountType-94], '') <> ISNULL(s.[BalAccountType-94], '') OR
        ISNULL(t.[BilltoCustomerId-9002], '') <> ISNULL(s.[BilltoCustomerId-9002], '') OR
        ISNULL(t.[BilltoCustomerNo-4], '') <> ISNULL(s.[BilltoCustomerNo-4], '') OR
        ISNULL(t.[BilltoName-5], '') <> ISNULL(s.[BilltoName-5], '') OR
        ISNULL(t.[Correction-98], '') <> ISNULL(s.[Correction-98], '') OR
        ISNULL(t.[CurrencyFactor-33], '') <> ISNULL(s.[CurrencyFactor-33], '') OR
        ISNULL(t.[CustomerId-9001], '') <> ISNULL(s.[CustomerId-9001], '') OR
        ISNULL(t.[CustomerPostingGroup-31], '') <> ISNULL(s.[CustomerPostingGroup-31], '') OR
        ISNULL(t.[DimensionSetID-480], '') <> ISNULL(s.[DimensionSetID-480], '') OR
        ISNULL(t.[DocumentDate-99], '') <> ISNULL(s.[DocumentDate-99], '') OR
        ISNULL(t.[DueDate-24], '') <> ISNULL(s.[DueDate-24], '') OR
        ISNULL(t.[EU3PartyTrade-75], '') <> ISNULL(s.[EU3PartyTrade-75], '') OR
        ISNULL(t.[ElectronicDocumentStatus-10030], '') <> ISNULL(s.[ElectronicDocumentStatus-10030], '') OR
        ISNULL(t.[ExchangeRateUSD-10060], '') <> ISNULL(s.[ExchangeRateUSD-10060], '') OR
        ISNULL(t.[ForeignTrade-10050], '') <> ISNULL(s.[ForeignTrade-10050], '') OR
        ISNULL(t.[GenBusPostingGroup-74], '') <> ISNULL(s.[GenBusPostingGroup-74], '') OR
        ISNULL(t.[InvoiceDiscCode-37], '') <> ISNULL(s.[InvoiceDiscCode-37], '') OR
        ISNULL(t.[LocationCode-28], '') <> ISNULL(s.[LocationCode-28], '') OR
        ISNULL(t.[MarkedasCanceled-27008], '') <> ISNULL(s.[MarkedasCanceled-27008], '') OR
        ISNULL(t.[No-3], '') <> ISNULL(s.[No-3], '') OR
        ISNULL(t.[NoPrinted-47], '') <> ISNULL(s.[NoPrinted-47], '') OR
        ISNULL(t.[NoSeries-109], '') <> ISNULL(s.[NoSeries-109], '') OR
        ISNULL(t.[OrderDate-19], '') <> ISNULL(s.[OrderDate-19], '') OR
        ISNULL(t.[PaymentDiscount-25], '') <> ISNULL(s.[PaymentDiscount-25], '') OR
        ISNULL(t.[PostingDate-20], '') <> ISNULL(s.[PostingDate-20], '') OR
        ISNULL(t.[PostingDescription-22], '') <> ISNULL(s.[PostingDescription-22], '') OR
        ISNULL(t.[PricesIncludingVAT-35], '') <> ISNULL(s.[PricesIncludingVAT-35], '') OR
        ISNULL(t.[SATAddressID-27009], '') <> ISNULL(s.[SATAddressID-27009], '') OR
        ISNULL(t.[SelltoCustomerName-79], '') <> ISNULL(s.[SelltoCustomerName-79], '') OR
        ISNULL(t.[SelltoCustomerNo-2], '') <> ISNULL(s.[SelltoCustomerNo-2], '') OR
        ISNULL(t.[ShiptoCity-17], '') <> ISNULL(s.[ShiptoCity-17], '') OR
        ISNULL(t.[ShiptoCounty-92], '') <> ISNULL(s.[ShiptoCounty-92], '') OR
        ISNULL(t.[SourceCode-113], '') <> ISNULL(s.[SourceCode-113], '') OR
        ISNULL(t.[SystemCreatedAt-2000000001], '') <> ISNULL(s.[SystemCreatedAt-2000000001], '') OR
        ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
        ISNULL(t.[SystemModifiedAt-2000000003], '') <> ISNULL(s.[SystemModifiedAt-2000000003], '') OR
        ISNULL(t.[TaxLiable-115], '') <> ISNULL(s.[TaxLiable-115], '') OR
        ISNULL(t.[TransitDistance-10047], '') <> ISNULL(s.[TransitDistance-10047], '') OR
        ISNULL(t.[TransitHours-10046], '') <> ISNULL(s.[TransitHours-10046], '') OR
        ISNULL(t.[UserID-112], '') <> ISNULL(s.[UserID-112], '') OR
        ISNULL(t.[VATBaseDiscount-119], '') <> ISNULL(s.[VATBaseDiscount-119], '') OR
        ISNULL(t.[WTBABillHoldType-87570], '') <> ISNULL(s.[WTBABillHoldType-87570], '') OR
        ISNULL(t.[WTBAOrderTypeCode-87007], '') <> ISNULL(s.[WTBAOrderTypeCode-87007], '') OR
        ISNULL(t.[WTBASOReviewStatus-87851], '') <> ISNULL(s.[WTBASOReviewStatus-87851], '') OR
        ISNULL(t.[WTBASalesRegionCode-87003], '') <> ISNULL(s.[WTBASalesRegionCode-87003], '') OR
        ISNULL(t.[WTBASiteOrderID-87401], '') <> ISNULL(s.[WTBASiteOrderID-87401], '') OR
        ISNULL(t.[WTPCPriceCalculated-89200], '') <> ISNULL(s.[WTPCPriceCalculated-89200], '') OR
        ISNULL(t.[timestamp-0], '') <> ISNULL(s.[timestamp-0], '') OR
        ISNULL(t.[PriceCalculationMethod-7000], '') <> ISNULL(s.[PriceCalculationMethod-7000], '') OR
        ISNULL(t.[$DeliveredDateTime], '') <> ISNULL(s.[$DeliveredDateTime], '') OR
        ISNULL(t.[WTBASampleOrder-87008], '') <> ISNULL(s.[WTBASampleOrder-87008], '')
    
    

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t FROM silver.SalesShipmentHeader110 t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[SalesShipmentHeader110] s
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
        'SalesShipmentHeader110',
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