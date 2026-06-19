---  Exec silver.usp_IncrementalLoad_Vendor23
---  select * from silver.Vendor23
---  TRUNCATE TABLE silver.Vendor23



CREATE         PROCEDURE silver.usp_IncrementalLoad_Vendor23
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
        INSERT INTO silver.Vendor23 (
            [TerritoryCode-15],
            [WTCBDeplAllowVendorNo-89040],
            [WTCBDeplAllowancePostingGr-89010],
            [CreditorNo-170],
            [DocumentSendingProfile-7601],
            [IRS1099Code-10020],
            [PaytoVendorNo-45],
            [WTBAFDARegExpirationDate-87010],
            [FederalIDNo-10016],
            [VATRegistrationNo-86],
            [MobilePhoneNo-5061],
            [WTIAAllocationCode-90101],
            [OurAccountNo-14],
            [HomePage-103],
            [WTBAFreightForwarderCode-87750],
            [ShippingAgentCode-31],
            [FaxNo-84],
            [Address2-6],
            [NoSeries-107],
            [Name2-4],
            [CurrencyCode-22],
            [WTBAPickupAddressCode-87550],
            [WTBAFDARegistrationNo-87000],
            [ShipmentMethodCode-30],
            [LeadTimeCalculation-5790],
            [Contact-8],
            [LocationCode-5701],
            [PrimaryContactNo-5049],
            [CountryRegionCode-35],
            [PaymentTermsCode-27],
            [EMail-102],
            [County-92],
            [PhoneNo-9],
            [PaymentMethodCode-47],
            [WTBAVendorTypeCode-87160],
            [PostCode-91],
            [City-7],
            [Address-5],
            [GenBusPostingGroup-88],
            [Name-2],
            [PurchaserCode-29],
            [SearchName-3],
            [VendorPostingGroup-21],
            [$Company],
            [$DeliveredDateTime],
            [AllowMultiplePostingGroups-175],
            [ApplicationMethod-80],
            [BankCommunication-10017],
            [BlockPaymentTolerance-116],
            [Blocked-39],
            [BudgetedAmount-19],
            [CheckDateFormat-10018],
            [CheckDateSeparator-10019],
            --  [CoupledtoCRM-720],
            [CurrencyId-8001],
            [DIOTTypeofOperation-27030],
            [DisableSearchbyName-160],
            [ERCAPMDefaultPPExempt-71276879],
            [ERCAPMPPLevel-71276880],
            [ERCDefaultAmountOption-71276877],
            [ERCDefaultType-71276875],
            [ERCSpecifiedAmount-71276878],
            [ExcludefromPmtPractices-134],
            [FATCARequirement-10031],
            [FATCAfilingrequirement-10026],
            [IntrastatPartnerType-133],
            [InvoiceDiscCode-33],
            [LastDateModified-54],
            [LastModifiedDateTime-53],
            [No-1],
            [PartnerType-132],
            [PaymentMethodId-8003],
            [PaymentTermsId-8002],
            [Prepayment-124],
            [PriceCalculationMethod-7000],
            [PricesIncludingVAT-82],
            [Priority-46],
            [PrivacyBlocked-150],
            [ReceiveEDocumentTo-6101],
            [Receiving1099EFormConsent-10030],
            [StatisticsGroup-26],
            [SystemCreatedAt-2000000001],
            [SystemCreatedBy-2000000002],
            [SystemModifiedAt-2000000003],
            [TaxIdentificationType-14020],
            [TaxLiable-109],
            [ValidateEUVatRegNo-7602],
            [WTCBDeplAllowance-89000],
            [WTIAAllocate-90100],
            [systemId-2000000000],
            [timestamp-0],
            [InsertDate]
            
        )
        SELECT
            s.[TerritoryCode-15],
            s.[WTCBDeplAllowVendorNo-89040],
            s.[WTCBDeplAllowancePostingGr-89010],
            s.[CreditorNo-170],
            s.[DocumentSendingProfile-7601],
            s.[IRS1099Code-10020],
            s.[PaytoVendorNo-45],
            s.[WTBAFDARegExpirationDate-87010],
            s.[FederalIDNo-10016],
            s.[VATRegistrationNo-86],
            s.[MobilePhoneNo-5061],
            s.[WTIAAllocationCode-90101],
            s.[OurAccountNo-14],
            s.[HomePage-103],
            s.[WTBAFreightForwarderCode-87750],
            s.[ShippingAgentCode-31],
            s.[FaxNo-84],
            s.[Address2-6],
            s.[NoSeries-107],
            s.[Name2-4],
            s.[CurrencyCode-22],
            s.[WTBAPickupAddressCode-87550],
            s.[WTBAFDARegistrationNo-87000],
            s.[ShipmentMethodCode-30],
            s.[LeadTimeCalculation-5790],
            s.[Contact-8],
            s.[LocationCode-5701],
            s.[PrimaryContactNo-5049],
            s.[CountryRegionCode-35],
            s.[PaymentTermsCode-27],
            s.[EMail-102],
            s.[County-92],
            s.[PhoneNo-9],
            s.[PaymentMethodCode-47],
            s.[WTBAVendorTypeCode-87160],
            s.[PostCode-91],
            s.[City-7],
            s.[Address-5],
            s.[GenBusPostingGroup-88],
            s.[Name-2],
            s.[PurchaserCode-29],
            s.[SearchName-3],
            s.[VendorPostingGroup-21],
            s.[$Company],
            s.[$DeliveredDateTime],
            s.[AllowMultiplePostingGroups-175],
            s.[ApplicationMethod-80],
            s.[BankCommunication-10017],
            s.[BlockPaymentTolerance-116],
            s.[Blocked-39],
            s.[BudgetedAmount-19],
            s.[CheckDateFormat-10018],
            s.[CheckDateSeparator-10019],
            --  s.[CoupledtoCRM-720],
            s.[CurrencyId-8001],
            s.[DIOTTypeofOperation-27030],
            s.[DisableSearchbyName-160],
            s.[ERCAPMDefaultPPExempt-71276879],
            s.[ERCAPMPPLevel-71276880],
            s.[ERCDefaultAmountOption-71276877],
            s.[ERCDefaultType-71276875],
            s.[ERCSpecifiedAmount-71276878],
            s.[ExcludefromPmtPractices-134],
            s.[FATCARequirement-10031],
            s.[FATCAfilingrequirement-10026],
            s.[IntrastatPartnerType-133],
            s.[InvoiceDiscCode-33],
            s.[LastDateModified-54],
            s.[LastModifiedDateTime-53],
            s.[No-1],
            s.[PartnerType-132],
            s.[PaymentMethodId-8003],
            s.[PaymentTermsId-8002],
            s.[Prepayment-124],
            s.[PriceCalculationMethod-7000],
            s.[PricesIncludingVAT-82],
            s.[Priority-46],
            s.[PrivacyBlocked-150],
            s.[ReceiveEDocumentTo-6101],
            s.[Receiving1099EFormConsent-10030],
            s.[StatisticsGroup-26],
            s.[SystemCreatedAt-2000000001],
            s.[SystemCreatedBy-2000000002],
            s.[SystemModifiedAt-2000000003],
            s.[TaxIdentificationType-14020],
            s.[TaxLiable-109],
            s.[ValidateEUVatRegNo-7602],
            s.[WTCBDeplAllowance-89000],
            s.[WTIAAllocate-90100],
            s.[systemId-2000000000],
            s.[timestamp-0],
            CURRENT_TIMESTAMP  -- InsertDate
           
        FROM [test_lh].[dbo].[Vendor23] s
        LEFT JOIN silver.Vendor23 t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
        AND s.[systemId-2000000000] IS NOT NULL;
                

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
            t.[TerritoryCode-15]                  = s.[TerritoryCode-15],
            t.[WTCBDeplAllowVendorNo-89040]       = s.[WTCBDeplAllowVendorNo-89040],
            t.[WTCBDeplAllowancePostingGr-89010]  = s.[WTCBDeplAllowancePostingGr-89010],
            t.[CreditorNo-170]                    = s.[CreditorNo-170],
            t.[DocumentSendingProfile-7601]       = s.[DocumentSendingProfile-7601],
            t.[IRS1099Code-10020]                 = s.[IRS1099Code-10020],
            t.[PaytoVendorNo-45]                  = s.[PaytoVendorNo-45],
            t.[WTBAFDARegExpirationDate-87010]    = s.[WTBAFDARegExpirationDate-87010],
            t.[FederalIDNo-10016]                 = s.[FederalIDNo-10016],
            t.[VATRegistrationNo-86]             = s.[VATRegistrationNo-86],
            t.[MobilePhoneNo-5061]                = s.[MobilePhoneNo-5061],
            t.[WTIAAllocationCode-90101]          = s.[WTIAAllocationCode-90101],
            t.[OurAccountNo-14]                   = s.[OurAccountNo-14],
            t.[HomePage-103]                      = s.[HomePage-103],
            t.[WTBAFreightForwarderCode-87750]    = s.[WTBAFreightForwarderCode-87750],
            t.[ShippingAgentCode-31]              = s.[ShippingAgentCode-31],
            t.[FaxNo-84]                          = s.[FaxNo-84],
            t.[Address2-6]                        = s.[Address2-6],
            t.[NoSeries-107]                      = s.[NoSeries-107],
            t.[Name2-4]                           = s.[Name2-4],
            t.[CurrencyCode-22]                   = s.[CurrencyCode-22],
            t.[WTBAPickupAddressCode-87550]       = s.[WTBAPickupAddressCode-87550],
            t.[WTBAFDARegistrationNo-87000]       = s.[WTBAFDARegistrationNo-87000],
            t.[ShipmentMethodCode-30]             = s.[ShipmentMethodCode-30],
            t.[LeadTimeCalculation-5790]          = s.[LeadTimeCalculation-5790],
            t.[Contact-8]                         = s.[Contact-8],
            t.[LocationCode-5701]                 = s.[LocationCode-5701],
            t.[PrimaryContactNo-5049]             = s.[PrimaryContactNo-5049],
            t.[CountryRegionCode-35]              = s.[CountryRegionCode-35],
            t.[PaymentTermsCode-27]               = s.[PaymentTermsCode-27],
            t.[EMail-102]                         = s.[EMail-102],
            t.[County-92]                         = s.[County-92],
            t.[PhoneNo-9]                         = s.[PhoneNo-9],
            t.[PaymentMethodCode-47]              = s.[PaymentMethodCode-47],
            t.[WTBAVendorTypeCode-87160]          = s.[WTBAVendorTypeCode-87160],
            t.[PostCode-91]                       = s.[PostCode-91],
            t.[City-7]                            = s.[City-7],
            t.[Address-5]                         = s.[Address-5],
            t.[GenBusPostingGroup-88]             = s.[GenBusPostingGroup-88],
            t.[Name-2]                            = s.[Name-2],
            t.[PurchaserCode-29]                  = s.[PurchaserCode-29],
            t.[SearchName-3]                      = s.[SearchName-3],
            t.[VendorPostingGroup-21]             = s.[VendorPostingGroup-21],
            t.[$Company]                          = s.[$Company],
            t.[$DeliveredDateTime]                = s.[$DeliveredDateTime],
            t.[AllowMultiplePostingGroups-175]    = s.[AllowMultiplePostingGroups-175],
            t.[ApplicationMethod-80]              = s.[ApplicationMethod-80],
            t.[BankCommunication-10017]           = s.[BankCommunication-10017],
            t.[BlockPaymentTolerance-116]         = s.[BlockPaymentTolerance-116],
            t.[Blocked-39]                        = s.[Blocked-39],
            t.[BudgetedAmount-19]                 = s.[BudgetedAmount-19],
            t.[CheckDateFormat-10018]             = s.[CheckDateFormat-10018],
            t.[CheckDateSeparator-10019]          = s.[CheckDateSeparator-10019],
            --   t.[CoupledtoCRM-720]                  = s.[CoupledtoCRM-720],
            t.[CurrencyId-8001]                   = s.[CurrencyId-8001],
            t.[DIOTTypeofOperation-27030]         = s.[DIOTTypeofOperation-27030],
            t.[DisableSearchbyName-160]           = s.[DisableSearchbyName-160],
            t.[ERCAPMDefaultPPExempt-71276879]    = s.[ERCAPMDefaultPPExempt-71276879],
            t.[ERCAPMPPLevel-71276880]            = s.[ERCAPMPPLevel-71276880],
            t.[ERCDefaultAmountOption-71276877]   = s.[ERCDefaultAmountOption-71276877],
            t.[ERCDefaultType-71276875]           = s.[ERCDefaultType-71276875],
            t.[ERCSpecifiedAmount-71276878]       = s.[ERCSpecifiedAmount-71276878],
            t.[ExcludefromPmtPractices-134]       = s.[ExcludefromPmtPractices-134],
            t.[FATCARequirement-10031]            = s.[FATCARequirement-10031],
            t.[FATCAfilingrequirement-10026]      = s.[FATCAfilingrequirement-10026],
            t.[IntrastatPartnerType-133]          = s.[IntrastatPartnerType-133],
            t.[InvoiceDiscCode-33]                = s.[InvoiceDiscCode-33],
            t.[LastDateModified-54]               = s.[LastDateModified-54],
            t.[LastModifiedDateTime-53]           = s.[LastModifiedDateTime-53],
            t.[No-1]                              = s.[No-1],
            t.[PartnerType-132]                   = s.[PartnerType-132],
            t.[PaymentMethodId-8003]              = s.[PaymentMethodId-8003],
            t.[PaymentTermsId-8002]               = s.[PaymentTermsId-8002],
            t.[Prepayment-124]                    = s.[Prepayment-124],
            t.[PriceCalculationMethod-7000]       = s.[PriceCalculationMethod-7000],
            t.[PricesIncludingVAT-82]             = s.[PricesIncludingVAT-82],
            t.[Priority-46]                       = s.[Priority-46],
            t.[PrivacyBlocked-150]                = s.[PrivacyBlocked-150],
            t.[ReceiveEDocumentTo-6101]           = s.[ReceiveEDocumentTo-6101],
            t.[Receiving1099EFormConsent-10030]   = s.[Receiving1099EFormConsent-10030],
            t.[StatisticsGroup-26]                = s.[StatisticsGroup-26],
            t.[SystemCreatedAt-2000000001]        = s.[SystemCreatedAt-2000000001],
            t.[SystemCreatedBy-2000000002]        = s.[SystemCreatedBy-2000000002],
            t.[SystemModifiedAt-2000000003]       = s.[SystemModifiedAt-2000000003],
            t.[TaxIdentificationType-14020]       = s.[TaxIdentificationType-14020],
            t.[TaxLiable-109]                     = s.[TaxLiable-109],
            t.[ValidateEUVatRegNo-7602]           = s.[ValidateEUVatRegNo-7602],
            t.[WTCBDeplAllowance-89000]           = s.[WTCBDeplAllowance-89000],
            t.[WTIAAllocate-90100]                = s.[WTIAAllocate-90100],
            t.[timestamp-0]                       = s.[timestamp-0],
            t.[UpdateDate]                        = CURRENT_TIMESTAMP
        FROM silver.Vendor23 t
        JOIN [test_lh].[dbo].[Vendor23] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
            (
               
            ISNULL(t.[TerritoryCode-15], '') <> ISNULL(s.[TerritoryCode-15], '') OR
            ISNULL(t.[WTCBDeplAllowVendorNo-89040], '') <> ISNULL(s.[WTCBDeplAllowVendorNo-89040], '') OR
            ISNULL(t.[WTCBDeplAllowancePostingGr-89010], '') <> ISNULL(s.[WTCBDeplAllowancePostingGr-89010], '') OR
            ISNULL(t.[CreditorNo-170], '') <> ISNULL(s.[CreditorNo-170], '') OR
            ISNULL(t.[DocumentSendingProfile-7601], '') <> ISNULL(s.[DocumentSendingProfile-7601], '') OR
            ISNULL(t.[IRS1099Code-10020], '') <> ISNULL(s.[IRS1099Code-10020], '') OR
            ISNULL(t.[PaytoVendorNo-45], '') <> ISNULL(s.[PaytoVendorNo-45], '') OR
            ISNULL(t.[WTBAFDARegExpirationDate-87010], '1900-01-01') <> ISNULL(s.[WTBAFDARegExpirationDate-87010], '1900-01-01') OR
            ISNULL(t.[FederalIDNo-10016], '') <> ISNULL(s.[FederalIDNo-10016], '') OR
            ISNULL(t.[VATRegistrationNo-86], '') <> ISNULL(s.[VATRegistrationNo-86], '') OR
            ISNULL(t.[MobilePhoneNo-5061], '') <> ISNULL(s.[MobilePhoneNo-5061], '') OR
            ISNULL(t.[WTIAAllocationCode-90101], '') <> ISNULL(s.[WTIAAllocationCode-90101], '') OR
            ISNULL(t.[OurAccountNo-14], '') <> ISNULL(s.[OurAccountNo-14], '') OR
            ISNULL(t.[HomePage-103], '') <> ISNULL(s.[HomePage-103], '') OR
            ISNULL(t.[WTBAFreightForwarderCode-87750], '') <> ISNULL(s.[WTBAFreightForwarderCode-87750], '') OR
            ISNULL(t.[ShippingAgentCode-31], '') <> ISNULL(s.[ShippingAgentCode-31], '') OR
            ISNULL(t.[FaxNo-84], '') <> ISNULL(s.[FaxNo-84], '') OR
            ISNULL(t.[Address2-6], '') <> ISNULL(s.[Address2-6], '') OR
            ISNULL(t.[NoSeries-107], '') <> ISNULL(s.[NoSeries-107], '') OR
            ISNULL(t.[Name2-4], '') <> ISNULL(s.[Name2-4], '') OR
            ISNULL(t.[CurrencyCode-22], '') <> ISNULL(s.[CurrencyCode-22], '') OR
            ISNULL(t.[WTBAPickupAddressCode-87550], '') <> ISNULL(s.[WTBAPickupAddressCode-87550], '') OR
            ISNULL(t.[WTBAFDARegistrationNo-87000], '') <> ISNULL(s.[WTBAFDARegistrationNo-87000], '') OR
            ISNULL(t.[ShipmentMethodCode-30], '') <> ISNULL(s.[ShipmentMethodCode-30], '') OR
            ISNULL(t.[LeadTimeCalculation-5790], '') <> ISNULL(s.[LeadTimeCalculation-5790], '') OR
            ISNULL(t.[Contact-8], '') <> ISNULL(s.[Contact-8], '') OR
            ISNULL(t.[LocationCode-5701], '') <> ISNULL(s.[LocationCode-5701], '') OR
            ISNULL(t.[PrimaryContactNo-5049], '') <> ISNULL(s.[PrimaryContactNo-5049], '') OR
            ISNULL(t.[CountryRegionCode-35], '') <> ISNULL(s.[CountryRegionCode-35], '') OR
            ISNULL(t.[PaymentTermsCode-27], '') <> ISNULL(s.[PaymentTermsCode-27], '') OR
            ISNULL(t.[EMail-102], '') <> ISNULL(s.[EMail-102], '') OR
            ISNULL(t.[County-92], '') <> ISNULL(s.[County-92], '') OR
            ISNULL(t.[PhoneNo-9], '') <> ISNULL(s.[PhoneNo-9], '') OR
            ISNULL(t.[PaymentMethodCode-47], '') <> ISNULL(s.[PaymentMethodCode-47], '') OR
            ISNULL(t.[WTBAVendorTypeCode-87160], '') <> ISNULL(s.[WTBAVendorTypeCode-87160], '') OR
            ISNULL(t.[PostCode-91], '') <> ISNULL(s.[PostCode-91], '') OR
            ISNULL(t.[City-7], '') <> ISNULL(s.[City-7], '') OR
            ISNULL(t.[Address-5], '') <> ISNULL(s.[Address-5], '') OR
            ISNULL(t.[GenBusPostingGroup-88], '') <> ISNULL(s.[GenBusPostingGroup-88], '') OR
            ISNULL(t.[Name-2], '') <> ISNULL(s.[Name-2], '') OR
            ISNULL(t.[PurchaserCode-29], '') <> ISNULL(s.[PurchaserCode-29], '') OR
            ISNULL(t.[SearchName-3], '') <> ISNULL(s.[SearchName-3], '') OR
            ISNULL(t.[VendorPostingGroup-21], '') <> ISNULL(s.[VendorPostingGroup-21], '') OR
            ISNULL(t.[$Company], '') <> ISNULL(s.[$Company], '') OR
            ISNULL(t.[$DeliveredDateTime], '1900-01-01') <> ISNULL(s.[$DeliveredDateTime], '1900-01-01') OR
            ISNULL(t.[AllowMultiplePostingGroups-175], 0) <> ISNULL(s.[AllowMultiplePostingGroups-175], 0) OR
            ISNULL(t.[ApplicationMethod-80], '') <> ISNULL(s.[ApplicationMethod-80], '') OR
            ISNULL(t.[BankCommunication-10017], '') <> ISNULL(s.[BankCommunication-10017], '') OR
            ISNULL(t.[BlockPaymentTolerance-116], 0) <> ISNULL(s.[BlockPaymentTolerance-116], 0) OR
            ISNULL(t.[Blocked-39], '') <> ISNULL(s.[Blocked-39], '') OR
            ISNULL(t.[BudgetedAmount-19], 0.0) <> ISNULL(s.[BudgetedAmount-19], 0.0) OR
            ISNULL(t.[CheckDateFormat-10018], '') <> ISNULL(s.[CheckDateFormat-10018], '') OR
            ISNULL(t.[CheckDateSeparator-10019], '') <> ISNULL(s.[CheckDateSeparator-10019], '') OR
            --   ISNULL(t.[CoupledtoCRM-720], 0) <> ISNULL(s.[CoupledtoCRM-720], 0) OR
            ISNULL(t.[CurrencyId-8001], '') <> ISNULL(s.[CurrencyId-8001], '') OR
            ISNULL(t.[DIOTTypeofOperation-27030], '') <> ISNULL(s.[DIOTTypeofOperation-27030], '') OR
            ISNULL(t.[DisableSearchbyName-160], 0) <> ISNULL(s.[DisableSearchbyName-160], 0) OR
            ISNULL(t.[ERCAPMDefaultPPExempt-71276879], 0) <> ISNULL(s.[ERCAPMDefaultPPExempt-71276879], 0) OR
            ISNULL(t.[ERCAPMPPLevel-71276880], '') <> ISNULL(s.[ERCAPMPPLevel-71276880], '') OR
            ISNULL(t.[ERCDefaultAmountOption-71276877], '') <> ISNULL(s.[ERCDefaultAmountOption-71276877], '') OR
            ISNULL(t.[ERCDefaultType-71276875], '') <> ISNULL(s.[ERCDefaultType-71276875], '') OR
            ISNULL(t.[ERCSpecifiedAmount-71276878], 0.0) <> ISNULL(s.[ERCSpecifiedAmount-71276878], 0.0) OR
            ISNULL(t.[ExcludefromPmtPractices-134], 0) <> ISNULL(s.[ExcludefromPmtPractices-134], 0) OR
            ISNULL(t.[FATCARequirement-10031], 0) <> ISNULL(s.[FATCARequirement-10031], 0) OR
            ISNULL(t.[FATCAfilingrequirement-10026], 0) <> ISNULL(s.[FATCAfilingrequirement-10026], 0) OR
            ISNULL(t.[IntrastatPartnerType-133], '') <> ISNULL(s.[IntrastatPartnerType-133], '') OR
            ISNULL(t.[InvoiceDiscCode-33], '') <> ISNULL(s.[InvoiceDiscCode-33], '') OR
            ISNULL(t.[LastDateModified-54], '1900-01-01') <> ISNULL(s.[LastDateModified-54], '1900-01-01') OR
            ISNULL(t.[LastModifiedDateTime-53], '1900-01-01') <> ISNULL(s.[LastModifiedDateTime-53], '1900-01-01') OR
            ISNULL(t.[No-1], '') <> ISNULL(s.[No-1], '') OR
            ISNULL(t.[PartnerType-132], '') <> ISNULL(s.[PartnerType-132], '') OR
            ISNULL(t.[PaymentMethodId-8003], '') <> ISNULL(s.[PaymentMethodId-8003], '') OR
            ISNULL(t.[PaymentTermsId-8002], '') <> ISNULL(s.[PaymentTermsId-8002], '') OR
            ISNULL(t.[Prepayment-124], 0.0) <> ISNULL(s.[Prepayment-124], 0.0) OR
            ISNULL(t.[PriceCalculationMethod-7000], '') <> ISNULL(s.[PriceCalculationMethod-7000], '') OR
            ISNULL(t.[PricesIncludingVAT-82], 0) <> ISNULL(s.[PricesIncludingVAT-82], 0) OR
            ISNULL(t.[Priority-46], 0) <> ISNULL(s.[Priority-46], 0) OR
            ISNULL(t.[PrivacyBlocked-150], 0) <> ISNULL(s.[PrivacyBlocked-150], 0) OR
            ISNULL(t.[ReceiveEDocumentTo-6101], '') <> ISNULL(s.[ReceiveEDocumentTo-6101], '') OR
            ISNULL(t.[Receiving1099EFormConsent-10030], 0) <> ISNULL(s.[Receiving1099EFormConsent-10030], 0) OR
            ISNULL(t.[StatisticsGroup-26], 0) <> ISNULL(s.[StatisticsGroup-26], 0) OR
            ISNULL(t.[SystemCreatedAt-2000000001], '1900-01-01') <> ISNULL(s.[SystemCreatedAt-2000000001], '1900-01-01') OR
            ISNULL(t.[SystemCreatedBy-2000000002], '') <> ISNULL(s.[SystemCreatedBy-2000000002], '') OR
            ISNULL(t.[SystemModifiedAt-2000000003], '1900-01-01') <> ISNULL(s.[SystemModifiedAt-2000000003], '1900-01-01') OR
            ISNULL(t.[TaxIdentificationType-14020], '') <> ISNULL(s.[TaxIdentificationType-14020], '') OR
            ISNULL(t.[TaxLiable-109], 0) <> ISNULL(s.[TaxLiable-109], 0) OR
            ISNULL(t.[ValidateEUVatRegNo-7602], 0) <> ISNULL(s.[ValidateEUVatRegNo-7602], 0) OR
            ISNULL(t.[WTCBDeplAllowance-89000], 0) <> ISNULL(s.[WTCBDeplAllowance-89000], 0) OR
            ISNULL(t.[WTIAAllocate-90100], 0) <> ISNULL(s.[WTIAAllocate-90100], 0) OR
            ISNULL(t.[timestamp-0], -1) <> ISNULL(s.[timestamp-0], -1)
        
            );


        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------     
           DELETE t FROM silver.[Vendor23] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[Vendor23] s
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
        'Vendor23',
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