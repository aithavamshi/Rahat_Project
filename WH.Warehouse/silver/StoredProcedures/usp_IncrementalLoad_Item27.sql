---  Exec silver.usp_IncrementalLoad_Item27
---  select * from [WH].[silver].[Item27]
---  TRUNCATE TABLE silver.Item27


CREATE               PROCEDURE silver.usp_IncrementalLoad_Item27
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
        INSERT INTO [WH].[silver].[Item27] (
            [No-1                                     ],
    		[No2-2                                    ],
    		[Description-3                            ],
    		[SearchDescription-4                      ],
    		[Description2-5                           ],
    		[BaseUnitofMeasure-8                      ],
    		[PriceUnitConversion-9                    ],
    		[Type-10                                  ],
    		[InventoryPostingGroup-11                 ],
    		[ShelfNo-12                               ],
    		[ItemDiscGroup-14                         ],
    		[AllowInvoiceDisc-15                      ],
    		[StatisticsGroup-16                       ],
    		[CommissionGroup-17                       ],
    		[UnitPrice-18                             ],
    		[PriceProfitCalculation-19                ],
    		[Profit-20                                ],
    		[CostingMethod-21                         ],
    		[UnitCost-22                              ],
    		[StandardCost-24                          ],
    		[LastDirectCost-25                        ],
    		[IndirectCost-28                          ],
    		[CostisAdjusted-29                        ],
    		[AllowOnlineAdjustment-30                 ],
    		[VendorNo-31                              ],
    		[VendorItemNo-32                          ],
    		[LeadTimeCalculation-33                   ],
    		[ReorderPoint-34                          ],
    		[MaximumInventory-35                      ],
    		[ReorderQuantity-36                       ],
    		[AlternativeItemNo-37                     ],
    		[UnitListPrice-38                         ],
    		[DutyDue-39                               ],
    		[DutyCode-40                              ],
    		[GrossWeight-41                           ],
    		[NetWeight-42                             ],
    		[UnitsperParcel-43                        ],
    		[UnitVolume-44                            ],
    		[Durability-45                            ],
    		[FreightType-46                           ],
    		[TariffNo-47                              ],
    		[DutyUnitConversion-48                    ],
    		[CountryRegionPurchasedCode-49            ],
    		[BudgetQuantity-50                        ],
    		[BudgetedAmount-51                        ],
    		[BudgetProfit-52                          ],
    		[Blocked-54                               ],
    		[BlockReason-56                           ],
    		[LastDateTimeModified-61                  ],
    		[LastDateModified-62                      ],
    		[LastTimeModified-63                      ],
    		[PriceIncludesVAT-87                      ],
    		[VATBusPostingGrPrice-90                  ],
    		[GenProdPostingGroup-91                   ],
    		[CountryRegionofOriginCode-95             ],
    		[AutomaticExtTexts-96                     ],
    		[NoSeries-97                              ],
    		[TaxGroupCode-98                          ],
    		[VATProdPostingGroup-99                   ],
    		[Reserve-100                              ],
    		[GlobalDimension1Code-105                 ],
    		[GlobalDimension2Code-106                 ],
    		[StockoutWarning-120                      ],
    		[PreventNegativeInventory-121             ],
    		[VariantMandatoryifExists-122             ],
    		[ApplicationWkshUserID-521                ],
    		[AssemblyPolicy-910                       ],
    		[GTIN-1217                                ],
    		[DefaultDeferralTemplateCode-1700         ],
    		[LowLevelCode-5400                        ],
    		[LotSize-5401                             ],
    		[SerialNos-5402                           ],
    		[LastUnitCostCalcDate-5403                ],
    		[RolledupMaterialCost-5404                ],
    		[RolledupCapacityCost-5405                ],
    		[Scrap-5407                               ],
    		[RolledupMatNonInvtCost-5408              ],
    		[InventoryValueZero-5409                  ],
    		[DiscreteOrderQuantity-5410               ],
    		[MinimumOrderQuantity-5411                ],
    		[MaximumOrderQuantity-5412                ],
    		[SafetyStockQuantity-5413                 ],
    		[OrderMultiple-5414                       ],
    		[SafetyLeadTime-5415                      ],
    		[FlushingMethod-5417                      ],
    		[ReplenishmentSystem-5419                 ],
    		[RoundingPrecision-5422                   ],
    		[SalesUnitofMeasure-5425                  ],
    		[PurchUnitofMeasure-5426                  ],
    		[TimeBucket-5428                          ],
    		[ReorderingPolicy-5440                    ],
    		[IncludeInventory-5441                    ],
    		[ManufacturingPolicy-5442                 ],
    		[ReschedulingPeriod-5443                  ],
    		[LotAccumulationPeriod-5444               ],
    		[DampenerPeriod-5445                      ],
    		[DampenerQuantity-5446                    ],
    		[OverflowLevel-5447                       ],
    		[ManufacturerCode-5701                    ],
    		[ItemCategoryCode-5702                    ],
    		[CreatedFromNonstockItem-5703             ],
    		[PurchasingCode-5711                      ],
    		[ExcludedfromCostAdjustment-5801          ],
    		[ServiceItemGroup-5900                    ],
    		[SustCertNo-6210                          ],
    		[SustCertName-6211                        ],
    		[GHGCredit-6212                           ],
    		[CarbonCreditPerUOM-6213                  ],
    		[DefaultSustAccount-6214                  ],
    		[DefaultCO2Emission-6215                  ],
    		[DefaultCH4Emission-6216                  ],
    		[DefaultN2OEmission-6217                  ],
    		[CO2eperUnit-6218                         ],
    		[CO2eLastDateModified-6219                ],
    		[SourceofEmissionData-6220                ],
    		[EmissionVerified-6221                    ],
    		[CBAMCompliance-6222                      ],
    		[EPRCategory-6223                         ],
    		[MaterialCompositionNo-6224               ],
    		[EPRFeesPerUnit-6226                      ],
    		[EndofLifeDisposalReq-6227                ],
    		[ItemofConcern-6230                       ],
    		[RecyclabilityPercentage-6231             ],
    		[EnergyEfficiencyRating-6232              ],
    		[EndofLifeInformation-6233                ],
    		[ItemTrackingCode-6500                    ],
    		[LotNos-6501                              ],
    		[ExpirationCalculation-6502               ],
    		[WarehouseClassCode-7300                  ],
    		[SpecialEquipmentCode-7301                ],
    		[PutawayTemplateCode-7302                 ],
    		[PutawayUnitofMeasureCode-7307            ],
    		[PhysInvtCountingPeriodCode-7380          ],
    		[LastCountingPeriodUpdate-7381            ],
    		[UseCrossDocking-7384                     ],
    		[NextCountingStartDate-7385               ],
    		[NextCountingEndDate-7386                 ],
    		[UnitofMeasureId-8001                     ],
    		[TaxGroupId-8002                          ],
    		[SalesBlocked-8003                        ],
    		[PurchasingBlocked-8004                   ],
    		[ItemCategoryId-8005                      ],
    		[InventoryPostingGroupId-8006             ],
    		[GenProdPostingGroupId-8007               ],
    		[ServiceBlocked-8010                      ],
    		[ProductionBlocked-8011                   ],
    		[SubscriptionOption-8052                  ],
    		[OverReceiptCode-8510                     ],
    		[DutyClass-10004                          ],
    		[HasSalesForecast-21850                   ],
    		[SATItemClassification-27000              ],
    		[SATHazardousMaterial-27024               ],
    		[SATPackagingType-27025                   ],
    		[SATMaterialType-27026                    ],
    		[WCTEWPrestige-50000                      ],
    		[WCINV04PurchaserCode-50010               ],
    		[WCINV08AgedInventory-50043               ],
    		[WCINV08ExpectedQtyfromVend-50044         ],
    		[WCINV08WHItemNo-50045                    ],
    		[WCINV08NAforSalesreps-50046              ],
    		[WCINV08SuggestedRetailPrice-50047        ],
    		[WCAR06SalesCommissionable-50100          ],
    		[WCSAL04AllowSampleDiscount-50120         ],
    		[WCSAL04AllowPalletDiscount-50121         ],
    		[WCINV14ItemPortfolio-50150               ],
    		[WCINT02ExportedtoJFHB-50250              ],
    		[WCINT03ExportedtoMMK-50280               ],
    		[WCINV19DonotPrintonCat-50520             ],
    		[WCINT04PABlocked-50650                   ],
    		[WCINT04SplitAllowed-50651                ],
    		[CommuneVillage-80001                     ],
    		[SustainablePractices-80002               ],
    		[Climate-80003                            ],
    		[YearPlantedVineAge-80004                 ],
    		[HarvestTechnique-80005                   ],
    		[Fermentation-80006                       ],
    		[ResidualSugar-80007                      ],
    		[BoboProduct-80008                        ],
    		[LowsO2-80009                             ],
    		[SustainableCertificates-80010            ],
    		[DistillerName-80011                      ],
    		[Finishing-80012                          ],
    		[Maturation-80013                         ],
    		[Cooperage-80014                          ],
    		[Distillation-80015                       ],
    		[Closure-80016                            ],
    		[sO2Amount-80017                          ],
    		[VineyardSize-80018                       ],
    		[Elevage-80019                            ],
    		[WinemakerName-80020                      ],
    		[Filtration-80021                         ],
    		[Fining-80022                             ],
    		[TechSheetReady-80023                     ],
    		[MarketingDescription-80024               ],
    		[TastingNotes-80025                       ],
    		[ProducerWebsite-80027                    ],
    		[Soil-80028                               ],
    		[VintageDetails-80029                     ],
    		[WineComItem-80030                        ],
    		[WTBAVintageCode-87000                    ],
    		[WTBAOriginRegionCode-87005               ],
    		[WTBASubRegionCode-87006                  ],
    		[WTBAVarietalCode-87007                   ],
    		[WTBACasePack-87010                       ],
    		[WTBAItemClassificationCode-87014         ],
    		[WTBAAlcoholTypeCode-87015                ],
    		[WTBABottleSize-87020                     ],
    		[WTBAWineColor-87025                      ],
    		[WTBAContainerTypeCode-87028              ],
    		[WTBAAlcoholContent-87030                 ],
    		[WTBAProof-87031                          ],
    		[WTBAAppellationCode-87060                ],
    		[WTBAVegan-87062                          ],
    		[WTBAOrganic-87063                        ],
    		[WTBABiodynamic-87064                     ],
    		[WTBAClosureTypeCode-87065                ],
    		[WTBALabelCode-87080                      ],
    		[WTBASubAppellationCode-87085             ],
    		[WTBACasesperPalletLayer-87090            ],
    		[WTBALayersperPallet-87095                ],
    		[WTBACasesperPallet-87096                 ],
    		[WTBAUnitCostCase-87110                   ],
    		[WTBAUnitCostBottle-87111                 ],
    		[WTBALastDirectCostCase-87115             ],
    		[WTBALastDirectCostBottle-87116           ],
    		[WTBAStandardCostCase-87120               ],
    		[WTBAStandardCostBottle-87121             ],
    		[WTBABrandNo-87150                        ],
    		[WTBADoNotAllowSamples-87700              ],
    		[WTBAExclfromSampleBudget-87701           ],
    		[WTBASalesOrderReview-87850               ],
    		[WTUSSalesLimitation-88030                ],
    		[WTUSSalesLimAllocMethod-88035            ],
    		[WTUSCOLANo-88500                         ],
    		[WTUSExciseTaxClass-88650                 ],
    		[WTUSDonotPricePost-88800                 ],
    		[WTIAAllocate-90100                       ],
    		[WTIAFullAllocationRequired-90101         ],
    		[WTIAAllocationReservInt-90102            ],
    		[WTIAAllocationInheritCode-90103          ],
    		[WTIAAllocationisCurrent-90104            ],
    		[WTIAAllocJnlUnitofMeasure-90107          ],
    		[WTIALimitingQtyperSource-90130           ],
    		[WTIALimitingUnitType-90140               ],
    		[RoutingNo-99000750                       ],
    		[ProductionBOMNo-99000751                 ],
    		[SingleLevelMaterialCost-99000752         ],
    		[SingleLevelCapacityCost-99000753         ],
    		[SingleLevelSubcontrdCost-99000754        ],
    		[SingleLevelCapOvhdCost-99000755          ],
    		[SingleLevelMfgOvhdCost-99000756          ],
    		[OverheadRate-99000757                    ],
    		[RolledupSubcontractedCost-99000758       ],
    		[RolledupMfgOvhdCost-99000759             ],
    		[RolledupCapOverheadCost-99000760         ],
    		[OrderTrackingPolicy-99000773             ],
    		[SingleLvlMatNonInvtCost-99000779         ],
    		[AllowWhseOverpick-99000780               ],
    		[Critical-99000875                        ],
    		[CommonItemNo-99008500                    ],
    		[timestamp-0                              ],
    		[systemId-2000000000                      ],
    		[SystemCreatedAt-2000000001               ],
    		[SystemCreatedBy-2000000002               ],
    		[SystemModifiedAt-2000000003              ],
    		[SystemModifiedBy-2000000004              ],
    		[$Company                                 ],
    		[$DeliveredDateTime                       ],
            [InsertDate                               ]
            
        )
        SELECT
            s.[No-1                                     ],
    		s.[No2-2                                    ],
    		s.[Description-3                            ],
    		s.[SearchDescription-4                      ],
    		s.[Description2-5                           ],
    		s.[BaseUnitofMeasure-8                      ],
    		s.[PriceUnitConversion-9                    ],
    		s.[Type-10                                  ],
    		s.[InventoryPostingGroup-11                 ],
    		s.[ShelfNo-12                               ],
    		s.[ItemDiscGroup-14                         ],
    		s.[AllowInvoiceDisc-15                      ],
    		s.[StatisticsGroup-16                       ],
    		s.[CommissionGroup-17                       ],
    		s.[UnitPrice-18                             ],
    		s.[PriceProfitCalculation-19                ],
    		s.[Profit-20                                ],
    		s.[CostingMethod-21                         ],
    		s.[UnitCost-22                              ],
    		s.[StandardCost-24                          ],
    		s.[LastDirectCost-25                        ],
    		s.[IndirectCost-28                          ],
    		s.[CostisAdjusted-29                        ],
    		s.[AllowOnlineAdjustment-30                 ],
    		s.[VendorNo-31                              ],
    		s.[VendorItemNo-32                          ],
    		s.[LeadTimeCalculation-33                   ],
    		s.[ReorderPoint-34                          ],
    		s.[MaximumInventory-35                      ],
    		s.[ReorderQuantity-36                       ],
    		s.[AlternativeItemNo-37                     ],
    		s.[UnitListPrice-38                         ],
    		s.[DutyDue-39                               ],
    		s.[DutyCode-40                              ],
    		s.[GrossWeight-41                           ],
    		s.[NetWeight-42                             ],
    		s.[UnitsperParcel-43                        ],
    		s.[UnitVolume-44                            ],
    		s.[Durability-45                            ],
    		s.[FreightType-46                           ],
    		s.[TariffNo-47                              ],
    		s.[DutyUnitConversion-48                    ],
    		s.[CountryRegionPurchasedCode-49            ],
    		s.[BudgetQuantity-50                        ],
    		s.[BudgetedAmount-51                        ],
    		s.[BudgetProfit-52                          ],
    		s.[Blocked-54                               ],
    		s.[BlockReason-56                           ],
    		s.[LastDateTimeModified-61                  ],
    		s.[LastDateModified-62                      ],
    		s.[LastTimeModified-63                      ],
    		s.[PriceIncludesVAT-87                      ],
    		s.[VATBusPostingGrPrice-90                  ],
    		s.[GenProdPostingGroup-91                   ],
    		s.[CountryRegionofOriginCode-95             ],
    		s.[AutomaticExtTexts-96                     ],
    		s.[NoSeries-97                              ],
    		s.[TaxGroupCode-98                          ],
    		s.[VATProdPostingGroup-99                   ],
    		s.[Reserve-100                              ],
    		s.[GlobalDimension1Code-105                 ],
    		s.[GlobalDimension2Code-106                 ],
    		s.[StockoutWarning-120                      ],
    		s.[PreventNegativeInventory-121             ],
    		s.[VariantMandatoryifExists-122             ],
    		s.[ApplicationWkshUserID-521                ],
    		s.[AssemblyPolicy-910                       ],
    		s.[GTIN-1217                                ],
    		s.[DefaultDeferralTemplateCode-1700         ],
    		s.[LowLevelCode-5400                        ],
    		s.[LotSize-5401                             ],
    		s.[SerialNos-5402                           ],
    		s.[LastUnitCostCalcDate-5403                ],
    		s.[RolledupMaterialCost-5404                ],
    		s.[RolledupCapacityCost-5405                ],
    		s.[Scrap-5407                               ],
    		s.[RolledupMatNonInvtCost-5408              ],
    		s.[InventoryValueZero-5409                  ],
    		s.[DiscreteOrderQuantity-5410               ],
    		s.[MinimumOrderQuantity-5411                ],
    		s.[MaximumOrderQuantity-5412                ],
    		s.[SafetyStockQuantity-5413                 ],
    		s.[OrderMultiple-5414                       ],
    		s.[SafetyLeadTime-5415                      ],
    		s.[FlushingMethod-5417                      ],
    		s.[ReplenishmentSystem-5419                 ],
    		s.[RoundingPrecision-5422                   ],
    		s.[SalesUnitofMeasure-5425                  ],
    		s.[PurchUnitofMeasure-5426                  ],
    		s.[TimeBucket-5428                          ],
    		s.[ReorderingPolicy-5440                    ],
    		s.[IncludeInventory-5441                    ],
    		s.[ManufacturingPolicy-5442                 ],
    		s.[ReschedulingPeriod-5443                  ],
    		s.[LotAccumulationPeriod-5444               ],
    		s.[DampenerPeriod-5445                      ],
    		s.[DampenerQuantity-5446                    ],
    		s.[OverflowLevel-5447                       ],
    		s.[ManufacturerCode-5701                    ],
    		s.[ItemCategoryCode-5702                    ],
    		s.[CreatedFromNonstockItem-5703             ],
    		s.[PurchasingCode-5711                      ],
    		s.[ExcludedfromCostAdjustment-5801          ],
    		s.[ServiceItemGroup-5900                    ],
    		s.[SustCertNo-6210                          ],
    		s.[SustCertName-6211                        ],
    		s.[GHGCredit-6212                           ],
    		s.[CarbonCreditPerUOM-6213                  ],
    		s.[DefaultSustAccount-6214                  ],
    		s.[DefaultCO2Emission-6215                  ],
    		s.[DefaultCH4Emission-6216                  ],
    		s.[DefaultN2OEmission-6217                  ],
    		s.[CO2eperUnit-6218                         ],
    		s.[CO2eLastDateModified-6219                ],
    		s.[SourceofEmissionData-6220                ],
    		s.[EmissionVerified-6221                    ],
    		s.[CBAMCompliance-6222                      ],
    		s.[EPRCategory-6223                         ],
    		s.[MaterialCompositionNo-6224               ],
    		s.[EPRFeesPerUnit-6226                      ],
    		s.[EndofLifeDisposalReq-6227                ],
    		s.[ItemofConcern-6230                       ],
    		s.[RecyclabilityPercentage-6231             ],
    		s.[EnergyEfficiencyRating-6232              ],
    		s.[EndofLifeInformation-6233                ],
    		s.[ItemTrackingCode-6500                    ],
    		s.[LotNos-6501                              ],
    		s.[ExpirationCalculation-6502               ],
    		s.[WarehouseClassCode-7300                  ],
    		s.[SpecialEquipmentCode-7301                ],
    		s.[PutawayTemplateCode-7302                 ],
    		s.[PutawayUnitofMeasureCode-7307            ],
    		s.[PhysInvtCountingPeriodCode-7380          ],
    		s.[LastCountingPeriodUpdate-7381            ],
    		s.[UseCrossDocking-7384                     ],
    		s.[NextCountingStartDate-7385               ],
    		s.[NextCountingEndDate-7386                 ],
    		s.[UnitofMeasureId-8001                     ],
    		s.[TaxGroupId-8002                          ],
    		s.[SalesBlocked-8003                        ],
    		s.[PurchasingBlocked-8004                   ],
    		s.[ItemCategoryId-8005                      ],
    		s.[InventoryPostingGroupId-8006             ],
    		s.[GenProdPostingGroupId-8007               ],
    		s.[ServiceBlocked-8010                      ],
    		s.[ProductionBlocked-8011                   ],
    		s.[SubscriptionOption-8052                  ],
    		s.[OverReceiptCode-8510                     ],
    		s.[DutyClass-10004                          ],
    		s.[HasSalesForecast-21850                   ],
    		s.[SATItemClassification-27000              ],
    		s.[SATHazardousMaterial-27024               ],
    		s.[SATPackagingType-27025                   ],
    		s.[SATMaterialType-27026                    ],
    		s.[WCTEWPrestige-50000                      ],
    		s.[WCINV04PurchaserCode-50010               ],
    		s.[WCINV08AgedInventory-50043               ],
    		s.[WCINV08ExpectedQtyfromVend-50044         ],
    		s.[WCINV08WHItemNo-50045                    ],
    		s.[WCINV08NAforSalesreps-50046              ],
    		s.[WCINV08SuggestedRetailPrice-50047        ],
    		s.[WCAR06SalesCommissionable-50100          ],
    		s.[WCSAL04AllowSampleDiscount-50120         ],
    		s.[WCSAL04AllowPalletDiscount-50121         ],
    		s.[WCINV14ItemPortfolio-50150               ],
    		s.[WCINT02ExportedtoJFHB-50250              ],
    		s.[WCINT03ExportedtoMMK-50280               ],
    		s.[WCINV19DonotPrintonCat-50520             ],
    		s.[WCINT04PABlocked-50650                   ],
    		s.[WCINT04SplitAllowed-50651                ],
    		s.[CommuneVillage-80001                     ],
    		s.[SustainablePractices-80002               ],
    		s.[Climate-80003                            ],
    		s.[YearPlantedVineAge-80004                 ],
    		s.[HarvestTechnique-80005                   ],
    		s.[Fermentation-80006                       ],
    		s.[ResidualSugar-80007                      ],
    		s.[BoboProduct-80008                        ],
    		s.[LowsO2-80009                             ],
    		s.[SustainableCertificates-80010            ],
    		s.[DistillerName-80011                      ],
    		s.[Finishing-80012                          ],
    		s.[Maturation-80013                         ],
    		s.[Cooperage-80014                          ],
    		s.[Distillation-80015                       ],
    		s.[Closure-80016                            ],
    		s.[sO2Amount-80017                          ],
    		s.[VineyardSize-80018                       ],
    		s.[Elevage-80019                            ],
    		s.[WinemakerName-80020                      ],
    		s.[Filtration-80021                         ],
    		s.[Fining-80022                             ],
    		s.[TechSheetReady-80023                     ],
    		s.[MarketingDescription-80024               ],
    		s.[TastingNotes-80025                       ],
    		s.[ProducerWebsite-80027                    ],
    		s.[Soil-80028                               ],
    		s.[VintageDetails-80029                     ],
    		s.[WineComItem-80030                        ],
    		s.[WTBAVintageCode-87000                    ],
    		s.[WTBAOriginRegionCode-87005               ],
    		s.[WTBASubRegionCode-87006                  ],
    		s.[WTBAVarietalCode-87007                   ],
    		s.[WTBACasePack-87010                       ],
    		s.[WTBAItemClassificationCode-87014         ],
    		s.[WTBAAlcoholTypeCode-87015                ],
    		s.[WTBABottleSize-87020                     ],
    		s.[WTBAWineColor-87025                      ],
    		s.[WTBAContainerTypeCode-87028              ],
    		s.[WTBAAlcoholContent-87030                 ],
    		s.[WTBAProof-87031                          ],
    		s.[WTBAAppellationCode-87060                ],
    		s.[WTBAVegan-87062                          ],
    		s.[WTBAOrganic-87063                        ],
    		s.[WTBABiodynamic-87064                     ],
    		s.[WTBAClosureTypeCode-87065                ],
    		s.[WTBALabelCode-87080                      ],
    		s.[WTBASubAppellationCode-87085             ],
    		s.[WTBACasesperPalletLayer-87090            ],
    		s.[WTBALayersperPallet-87095                ],
    		s.[WTBACasesperPallet-87096                 ],
    		s.[WTBAUnitCostCase-87110                   ],
    		s.[WTBAUnitCostBottle-87111                 ],
    		s.[WTBALastDirectCostCase-87115             ],
    		s.[WTBALastDirectCostBottle-87116           ],
    		s.[WTBAStandardCostCase-87120               ],
    		s.[WTBAStandardCostBottle-87121             ],
    		s.[WTBABrandNo-87150                        ],
    		s.[WTBADoNotAllowSamples-87700              ],
    		s.[WTBAExclfromSampleBudget-87701           ],
    		s.[WTBASalesOrderReview-87850               ],
    		s.[WTUSSalesLimitation-88030                ],
    		s.[WTUSSalesLimAllocMethod-88035            ],
    		s.[WTUSCOLANo-88500                         ],
    		s.[WTUSExciseTaxClass-88650                 ],
    		s.[WTUSDonotPricePost-88800                 ],
    		s.[WTIAAllocate-90100                       ],
    		s.[WTIAFullAllocationRequired-90101         ],
    		s.[WTIAAllocationReservInt-90102            ],
    		s.[WTIAAllocationInheritCode-90103          ],
    		s.[WTIAAllocationisCurrent-90104            ],
    		s.[WTIAAllocJnlUnitofMeasure-90107          ],
    		s.[WTIALimitingQtyperSource-90130           ],
    		s.[WTIALimitingUnitType-90140               ],
    		s.[RoutingNo-99000750                       ],
    		s.[ProductionBOMNo-99000751                 ],
    		s.[SingleLevelMaterialCost-99000752         ],
    		s.[SingleLevelCapacityCost-99000753         ],
    		s.[SingleLevelSubcontrdCost-99000754        ],
    		s.[SingleLevelCapOvhdCost-99000755          ],
    		s.[SingleLevelMfgOvhdCost-99000756          ],
    		s.[OverheadRate-99000757                    ],
    		s.[RolledupSubcontractedCost-99000758       ],
    		s.[RolledupMfgOvhdCost-99000759             ],
    		s.[RolledupCapOverheadCost-99000760         ],
    		s.[OrderTrackingPolicy-99000773             ],
    		s.[SingleLvlMatNonInvtCost-99000779         ],
    		s.[AllowWhseOverpick-99000780               ],
    		s.[Critical-99000875                        ],
    		s.[CommonItemNo-99008500                    ],
    		s.[timestamp-0                              ],
    		s.[systemId-2000000000                      ],
    		s.[SystemCreatedAt-2000000001               ],
    		s.[SystemCreatedBy-2000000002               ],
    		s.[SystemModifiedAt-2000000003              ],
    		s.[SystemModifiedBy-2000000004              ],
    		s.[$Company                                 ],
    		s.[$DeliveredDateTime                       ],
            GETDATE()
           
        FROM [test_lh].[dbo].[Item27] s
        LEFT JOIN [WH].[silver].[Item27] t
            ON s.[systemId-2000000000] = t.[systemId-2000000000]
        WHERE t.[systemId-2000000000] IS NULL
          AND s.[systemId-2000000000] IS NOT NULL;        

        SET @Inserted = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
        UPDATE t
        SET
	    	t.[No-1                                     ]  =  s.[No-1                                     ],
	    	t.[No2-2                                    ]  =  s.[No2-2                                    ],
	    	t.[Description-3                            ]  =  s.[Description-3                            ],
	    	t.[SearchDescription-4                      ]  =  s.[SearchDescription-4                      ],
	    	t.[Description2-5                           ]  =  s.[Description2-5                           ],
	    	t.[BaseUnitofMeasure-8                      ]  =  s.[BaseUnitofMeasure-8                      ],
	    	t.[PriceUnitConversion-9                    ]  =  s.[PriceUnitConversion-9                    ],
	    	t.[Type-10                                  ]  =  s.[Type-10                                  ],
	    	t.[InventoryPostingGroup-11                 ]  =  s.[InventoryPostingGroup-11                 ],
	    	t.[ShelfNo-12                               ]  =  s.[ShelfNo-12                               ],
	    	t.[ItemDiscGroup-14                         ]  =  s.[ItemDiscGroup-14                         ],
	    	t.[AllowInvoiceDisc-15                      ]  =  s.[AllowInvoiceDisc-15                      ],
	    	t.[StatisticsGroup-16                       ]  =  s.[StatisticsGroup-16                       ],
	    	t.[CommissionGroup-17                       ]  =  s.[CommissionGroup-17                       ],
	    	t.[UnitPrice-18                             ]  =  s.[UnitPrice-18                             ],
	    	t.[PriceProfitCalculation-19                ]  =  s.[PriceProfitCalculation-19                ],
	    	t.[Profit-20                                ]  =  s.[Profit-20                                ],
	    	t.[CostingMethod-21                         ]  =  s.[CostingMethod-21                         ],
	    	t.[UnitCost-22                              ]  =  s.[UnitCost-22                              ],
	    	t.[StandardCost-24                          ]  =  s.[StandardCost-24                          ],
	    	t.[LastDirectCost-25                        ]  =  s.[LastDirectCost-25                        ],
	    	t.[IndirectCost-28                          ]  =  s.[IndirectCost-28                          ],
	    	t.[CostisAdjusted-29                        ]  =  s.[CostisAdjusted-29                        ],
	    	t.[AllowOnlineAdjustment-30                 ]  =  s.[AllowOnlineAdjustment-30                 ],
	    	t.[VendorNo-31                              ]  =  s.[VendorNo-31                              ],
	    	t.[VendorItemNo-32                          ]  =  s.[VendorItemNo-32                          ],
	    	t.[LeadTimeCalculation-33                   ]  =  s.[LeadTimeCalculation-33                   ],
	    	t.[ReorderPoint-34                          ]  =  s.[ReorderPoint-34                          ],
	    	t.[MaximumInventory-35                      ]  =  s.[MaximumInventory-35                      ],
	    	t.[ReorderQuantity-36                       ]  =  s.[ReorderQuantity-36                       ],
	    	t.[AlternativeItemNo-37                     ]  =  s.[AlternativeItemNo-37                     ],
	    	t.[UnitListPrice-38                         ]  =  s.[UnitListPrice-38                         ],
	    	t.[DutyDue-39                               ]  =  s.[DutyDue-39                               ],
	    	t.[DutyCode-40                              ]  =  s.[DutyCode-40                              ],
	    	t.[GrossWeight-41                           ]  =  s.[GrossWeight-41                           ],
	    	t.[NetWeight-42                             ]  =  s.[NetWeight-42                             ],
	    	t.[UnitsperParcel-43                        ]  =  s.[UnitsperParcel-43                        ],
	    	t.[UnitVolume-44                            ]  =  s.[UnitVolume-44                            ],
	    	t.[Durability-45                            ]  =  s.[Durability-45                            ],
	    	t.[FreightType-46                           ]  =  s.[FreightType-46                           ],
	    	t.[TariffNo-47                              ]  =  s.[TariffNo-47                              ],
	    	t.[DutyUnitConversion-48                    ]  =  s.[DutyUnitConversion-48                    ],
	    	t.[CountryRegionPurchasedCode-49            ]  =  s.[CountryRegionPurchasedCode-49            ],
	    	t.[BudgetQuantity-50                        ]  =  s.[BudgetQuantity-50                        ],
	    	t.[BudgetedAmount-51                        ]  =  s.[BudgetedAmount-51                        ],
	    	t.[BudgetProfit-52                          ]  =  s.[BudgetProfit-52                          ],
	    	t.[Blocked-54                               ]  =  s.[Blocked-54                               ],
	    	t.[BlockReason-56                           ]  =  s.[BlockReason-56                           ],
	    	t.[LastDateTimeModified-61                  ]  =  s.[LastDateTimeModified-61                  ],
	    	t.[LastDateModified-62                      ]  =  s.[LastDateModified-62                      ],
	    	t.[LastTimeModified-63                      ]  =  s.[LastTimeModified-63                      ],
	    	t.[PriceIncludesVAT-87                      ]  =  s.[PriceIncludesVAT-87                      ],
	    	t.[VATBusPostingGrPrice-90                  ]  =  s.[VATBusPostingGrPrice-90                  ],
	    	t.[GenProdPostingGroup-91                   ]  =  s.[GenProdPostingGroup-91                   ],
	    	t.[CountryRegionofOriginCode-95             ]  =  s.[CountryRegionofOriginCode-95             ],
	    	t.[AutomaticExtTexts-96                     ]  =  s.[AutomaticExtTexts-96                     ],
	    	t.[NoSeries-97                              ]  =  s.[NoSeries-97                              ],
	    	t.[TaxGroupCode-98                          ]  =  s.[TaxGroupCode-98                          ],
	    	t.[VATProdPostingGroup-99                   ]  =  s.[VATProdPostingGroup-99                   ],
	    	t.[Reserve-100                              ]  =  s.[Reserve-100                              ],
	    	t.[GlobalDimension1Code-105                 ]  =  s.[GlobalDimension1Code-105                 ],
	    	t.[GlobalDimension2Code-106                 ]  =  s.[GlobalDimension2Code-106                 ],
	    	t.[StockoutWarning-120                      ]  =  s.[StockoutWarning-120                      ],
	    	t.[PreventNegativeInventory-121             ]  =  s.[PreventNegativeInventory-121             ],
	    	t.[VariantMandatoryifExists-122             ]  =  s.[VariantMandatoryifExists-122             ],
	    	t.[ApplicationWkshUserID-521                ]  =  s.[ApplicationWkshUserID-521                ],
	    	t.[AssemblyPolicy-910                       ]  =  s.[AssemblyPolicy-910                       ],
	    	t.[GTIN-1217                                ]  =  s.[GTIN-1217                                ],
	    	t.[DefaultDeferralTemplateCode-1700         ]  =  s.[DefaultDeferralTemplateCode-1700         ],
	    	t.[LowLevelCode-5400                        ]  =  s.[LowLevelCode-5400                        ],
	    	t.[LotSize-5401                             ]  =  s.[LotSize-5401                             ],
	    	t.[SerialNos-5402                           ]  =  s.[SerialNos-5402                           ],
	    	t.[LastUnitCostCalcDate-5403                ]  =  s.[LastUnitCostCalcDate-5403                ],
	    	t.[RolledupMaterialCost-5404                ]  =  s.[RolledupMaterialCost-5404                ],
	    	t.[RolledupCapacityCost-5405                ]  =  s.[RolledupCapacityCost-5405                ],
	    	t.[Scrap-5407                               ]  =  s.[Scrap-5407                               ],
	    	t.[RolledupMatNonInvtCost-5408              ]  =  s.[RolledupMatNonInvtCost-5408              ],
	    	t.[InventoryValueZero-5409                  ]  =  s.[InventoryValueZero-5409                  ],
	    	t.[DiscreteOrderQuantity-5410               ]  =  s.[DiscreteOrderQuantity-5410               ],
	    	t.[MinimumOrderQuantity-5411                ]  =  s.[MinimumOrderQuantity-5411                ],
	    	t.[MaximumOrderQuantity-5412                ]  =  s.[MaximumOrderQuantity-5412                ],
	    	t.[SafetyStockQuantity-5413                 ]  =  s.[SafetyStockQuantity-5413                 ],
	    	t.[OrderMultiple-5414                       ]  =  s.[OrderMultiple-5414                       ],
	    	t.[SafetyLeadTime-5415                      ]  =  s.[SafetyLeadTime-5415                      ],
	    	t.[FlushingMethod-5417                      ]  =  s.[FlushingMethod-5417                      ],
	    	t.[ReplenishmentSystem-5419                 ]  =  s.[ReplenishmentSystem-5419                 ],
	    	t.[RoundingPrecision-5422                   ]  =  s.[RoundingPrecision-5422                   ],
	    	t.[SalesUnitofMeasure-5425                  ]  =  s.[SalesUnitofMeasure-5425                  ],
	    	t.[PurchUnitofMeasure-5426                  ]  =  s.[PurchUnitofMeasure-5426                  ],
	    	t.[TimeBucket-5428                          ]  =  s.[TimeBucket-5428                          ],
	    	t.[ReorderingPolicy-5440                    ]  =  s.[ReorderingPolicy-5440                    ],
	    	t.[IncludeInventory-5441                    ]  =  s.[IncludeInventory-5441                    ],
	    	t.[ManufacturingPolicy-5442                 ]  =  s.[ManufacturingPolicy-5442                 ],
	    	t.[ReschedulingPeriod-5443                  ]  =  s.[ReschedulingPeriod-5443                  ],
	    	t.[LotAccumulationPeriod-5444               ]  =  s.[LotAccumulationPeriod-5444               ],
	    	t.[DampenerPeriod-5445                      ]  =  s.[DampenerPeriod-5445                      ],
	    	t.[DampenerQuantity-5446                    ]  =  s.[DampenerQuantity-5446                    ],
	    	t.[OverflowLevel-5447                       ]  =  s.[OverflowLevel-5447                       ],
	    	t.[ManufacturerCode-5701                    ]  =  s.[ManufacturerCode-5701                    ],
	    	t.[ItemCategoryCode-5702                    ]  =  s.[ItemCategoryCode-5702                    ],
	    	t.[CreatedFromNonstockItem-5703             ]  =  s.[CreatedFromNonstockItem-5703             ],
	    	t.[PurchasingCode-5711                      ]  =  s.[PurchasingCode-5711                      ],
	    	t.[ExcludedfromCostAdjustment-5801          ]  =  s.[ExcludedfromCostAdjustment-5801          ],
	    	t.[ServiceItemGroup-5900                    ]  =  s.[ServiceItemGroup-5900                    ],
	    	t.[SustCertNo-6210                          ]  =  s.[SustCertNo-6210                          ],
	    	t.[SustCertName-6211                        ]  =  s.[SustCertName-6211                        ],
	    	t.[GHGCredit-6212                           ]  =  s.[GHGCredit-6212                           ],
	    	t.[CarbonCreditPerUOM-6213                  ]  =  s.[CarbonCreditPerUOM-6213                  ],
	    	t.[DefaultSustAccount-6214                  ]  =  s.[DefaultSustAccount-6214                  ],
	    	t.[DefaultCO2Emission-6215                  ]  =  s.[DefaultCO2Emission-6215                  ],
	    	t.[DefaultCH4Emission-6216                  ]  =  s.[DefaultCH4Emission-6216                  ],
	    	t.[DefaultN2OEmission-6217                  ]  =  s.[DefaultN2OEmission-6217                  ],
	    	t.[CO2eperUnit-6218                         ]  =  s.[CO2eperUnit-6218                         ],
	    	t.[CO2eLastDateModified-6219                ]  =  s.[CO2eLastDateModified-6219                ],
	    	t.[SourceofEmissionData-6220                ]  =  s.[SourceofEmissionData-6220                ],
	    	t.[EmissionVerified-6221                    ]  =  s.[EmissionVerified-6221                    ],
	    	t.[CBAMCompliance-6222                      ]  =  s.[CBAMCompliance-6222                      ],
	    	t.[EPRCategory-6223                         ]  =  s.[EPRCategory-6223                         ],
	    	t.[MaterialCompositionNo-6224               ]  =  s.[MaterialCompositionNo-6224               ],
	    	t.[EPRFeesPerUnit-6226                      ]  =  s.[EPRFeesPerUnit-6226                      ],
	    	t.[EndofLifeDisposalReq-6227                ]  =  s.[EndofLifeDisposalReq-6227                ],
	    	t.[ItemofConcern-6230                       ]  =  s.[ItemofConcern-6230                       ],
	    	t.[RecyclabilityPercentage-6231             ]  =  s.[RecyclabilityPercentage-6231             ],
	    	t.[EnergyEfficiencyRating-6232              ]  =  s.[EnergyEfficiencyRating-6232              ],
	    	t.[EndofLifeInformation-6233                ]  =  s.[EndofLifeInformation-6233                ],
	    	t.[ItemTrackingCode-6500                    ]  =  s.[ItemTrackingCode-6500                    ],
	    	t.[LotNos-6501                              ]  =  s.[LotNos-6501                              ],
	    	t.[ExpirationCalculation-6502               ]  =  s.[ExpirationCalculation-6502               ],
	    	t.[WarehouseClassCode-7300                  ]  =  s.[WarehouseClassCode-7300                  ],
	    	t.[SpecialEquipmentCode-7301                ]  =  s.[SpecialEquipmentCode-7301                ],
	    	t.[PutawayTemplateCode-7302                 ]  =  s.[PutawayTemplateCode-7302                 ],
	    	t.[PutawayUnitofMeasureCode-7307            ]  =  s.[PutawayUnitofMeasureCode-7307            ],
	    	t.[PhysInvtCountingPeriodCode-7380          ]  =  s.[PhysInvtCountingPeriodCode-7380          ],
	    	t.[LastCountingPeriodUpdate-7381            ]  =  s.[LastCountingPeriodUpdate-7381            ],
	    	t.[UseCrossDocking-7384                     ]  =  s.[UseCrossDocking-7384                     ],
	    	t.[NextCountingStartDate-7385               ]  =  s.[NextCountingStartDate-7385               ],
	    	t.[NextCountingEndDate-7386                 ]  =  s.[NextCountingEndDate-7386                 ],
	    	t.[UnitofMeasureId-8001                     ]  =  s.[UnitofMeasureId-8001                     ],
	    	t.[TaxGroupId-8002                          ]  =  s.[TaxGroupId-8002                          ],
	    	t.[SalesBlocked-8003                        ]  =  s.[SalesBlocked-8003                        ],
	    	t.[PurchasingBlocked-8004                   ]  =  s.[PurchasingBlocked-8004                   ],
	    	t.[ItemCategoryId-8005                      ]  =  s.[ItemCategoryId-8005                      ],
	    	t.[InventoryPostingGroupId-8006             ]  =  s.[InventoryPostingGroupId-8006             ],
	    	t.[GenProdPostingGroupId-8007               ]  =  s.[GenProdPostingGroupId-8007               ],
	    	t.[ServiceBlocked-8010                      ]  =  s.[ServiceBlocked-8010                      ],
	    	t.[ProductionBlocked-8011                   ]  =  s.[ProductionBlocked-8011                   ],
	    	t.[SubscriptionOption-8052                  ]  =  s.[SubscriptionOption-8052                  ],
	    	t.[OverReceiptCode-8510                     ]  =  s.[OverReceiptCode-8510                     ],
	    	t.[DutyClass-10004                          ]  =  s.[DutyClass-10004                          ],
	    	t.[HasSalesForecast-21850                   ]  =  s.[HasSalesForecast-21850                   ],
	    	t.[SATItemClassification-27000              ]  =  s.[SATItemClassification-27000              ],
	    	t.[SATHazardousMaterial-27024               ]  =  s.[SATHazardousMaterial-27024               ],
	    	t.[SATPackagingType-27025                   ]  =  s.[SATPackagingType-27025                   ],
	    	t.[SATMaterialType-27026                    ]  =  s.[SATMaterialType-27026                    ],
	    	t.[WCTEWPrestige-50000                      ]  =  s.[WCTEWPrestige-50000                      ],
	    	t.[WCINV04PurchaserCode-50010               ]  =  s.[WCINV04PurchaserCode-50010               ],
	    	t.[WCINV08AgedInventory-50043               ]  =  s.[WCINV08AgedInventory-50043               ],
	    	t.[WCINV08ExpectedQtyfromVend-50044         ]  =  s.[WCINV08ExpectedQtyfromVend-50044         ],
	    	t.[WCINV08WHItemNo-50045                    ]  =  s.[WCINV08WHItemNo-50045                    ],
	    	t.[WCINV08NAforSalesreps-50046              ]  =  s.[WCINV08NAforSalesreps-50046              ],
	    	t.[WCINV08SuggestedRetailPrice-50047        ]  =  s.[WCINV08SuggestedRetailPrice-50047        ],
	    	t.[WCAR06SalesCommissionable-50100          ]  =  s.[WCAR06SalesCommissionable-50100          ],
	    	t.[WCSAL04AllowSampleDiscount-50120         ]  =  s.[WCSAL04AllowSampleDiscount-50120         ],
	    	t.[WCSAL04AllowPalletDiscount-50121         ]  =  s.[WCSAL04AllowPalletDiscount-50121         ],
	    	t.[WCINV14ItemPortfolio-50150               ]  =  s.[WCINV14ItemPortfolio-50150               ],
	    	t.[WCINT02ExportedtoJFHB-50250              ]  =  s.[WCINT02ExportedtoJFHB-50250              ],
	    	t.[WCINT03ExportedtoMMK-50280               ]  =  s.[WCINT03ExportedtoMMK-50280               ],
	    	t.[WCINV19DonotPrintonCat-50520             ]  =  s.[WCINV19DonotPrintonCat-50520             ],
	    	t.[WCINT04PABlocked-50650                   ]  =  s.[WCINT04PABlocked-50650                   ],
	    	t.[WCINT04SplitAllowed-50651                ]  =  s.[WCINT04SplitAllowed-50651                ],
	    	t.[CommuneVillage-80001                     ]  =  s.[CommuneVillage-80001                     ],
	    	t.[SustainablePractices-80002               ]  =  s.[SustainablePractices-80002               ],
	    	t.[Climate-80003                            ]  =  s.[Climate-80003                            ],
	    	t.[YearPlantedVineAge-80004                 ]  =  s.[YearPlantedVineAge-80004                 ],
	    	t.[HarvestTechnique-80005                   ]  =  s.[HarvestTechnique-80005                   ],
	    	t.[Fermentation-80006                       ]  =  s.[Fermentation-80006                       ],
	    	t.[ResidualSugar-80007                      ]  =  s.[ResidualSugar-80007                      ],
	    	t.[BoboProduct-80008                        ]  =  s.[BoboProduct-80008                        ],
	    	t.[LowsO2-80009                             ]  =  s.[LowsO2-80009                             ],
	    	t.[SustainableCertificates-80010            ]  =  s.[SustainableCertificates-80010            ],
	    	t.[DistillerName-80011                      ]  =  s.[DistillerName-80011                      ],
	    	t.[Finishing-80012                          ]  =  s.[Finishing-80012                          ],
	    	t.[Maturation-80013                         ]  =  s.[Maturation-80013                         ],
	    	t.[Cooperage-80014                          ]  =  s.[Cooperage-80014                          ],
	    	t.[Distillation-80015                       ]  =  s.[Distillation-80015                       ],
	    	t.[Closure-80016                            ]  =  s.[Closure-80016                            ],
	    	t.[sO2Amount-80017                          ]  =  s.[sO2Amount-80017                          ],
	    	t.[VineyardSize-80018                       ]  =  s.[VineyardSize-80018                       ],
	    	t.[Elevage-80019                            ]  =  s.[Elevage-80019                            ],
	    	t.[WinemakerName-80020                      ]  =  s.[WinemakerName-80020                      ],
	    	t.[Filtration-80021                         ]  =  s.[Filtration-80021                         ],
	    	t.[Fining-80022                             ]  =  s.[Fining-80022                             ],
	    	t.[TechSheetReady-80023                     ]  =  s.[TechSheetReady-80023                     ],
	    	t.[MarketingDescription-80024               ]  =  s.[MarketingDescription-80024               ],
	    	t.[TastingNotes-80025                       ]  =  s.[TastingNotes-80025                       ],
	    	t.[ProducerWebsite-80027                    ]  =  s.[ProducerWebsite-80027                    ],
	    	t.[Soil-80028                               ]  =  s.[Soil-80028                               ],
	    	t.[VintageDetails-80029                     ]  =  s.[VintageDetails-80029                     ],
	    	t.[WineComItem-80030                        ]  =  s.[WineComItem-80030                        ],
	    	t.[WTBAVintageCode-87000                    ]  =  s.[WTBAVintageCode-87000                    ],
	    	t.[WTBAOriginRegionCode-87005               ]  =  s.[WTBAOriginRegionCode-87005               ],
	    	t.[WTBASubRegionCode-87006                  ]  =  s.[WTBASubRegionCode-87006                  ],
	    	t.[WTBAVarietalCode-87007                   ]  =  s.[WTBAVarietalCode-87007                   ],
	    	t.[WTBACasePack-87010                       ]  =  s.[WTBACasePack-87010                       ],
	    	t.[WTBAItemClassificationCode-87014         ]  =  s.[WTBAItemClassificationCode-87014         ],
	    	t.[WTBAAlcoholTypeCode-87015                ]  =  s.[WTBAAlcoholTypeCode-87015                ],
	    	t.[WTBABottleSize-87020                     ]  =  s.[WTBABottleSize-87020                     ],
	    	t.[WTBAWineColor-87025                      ]  =  s.[WTBAWineColor-87025                      ],
	    	t.[WTBAContainerTypeCode-87028              ]  =  s.[WTBAContainerTypeCode-87028              ],
	    	t.[WTBAAlcoholContent-87030                 ]  =  s.[WTBAAlcoholContent-87030                 ],
	    	t.[WTBAProof-87031                          ]  =  s.[WTBAProof-87031                          ],
	    	t.[WTBAAppellationCode-87060                ]  =  s.[WTBAAppellationCode-87060                ],
	    	t.[WTBAVegan-87062                          ]  =  s.[WTBAVegan-87062                          ],
	    	t.[WTBAOrganic-87063                        ]  =  s.[WTBAOrganic-87063                        ],
	    	t.[WTBABiodynamic-87064                     ]  =  s.[WTBABiodynamic-87064                     ],
	    	t.[WTBAClosureTypeCode-87065                ]  =  s.[WTBAClosureTypeCode-87065                ],
	    	t.[WTBALabelCode-87080                      ]  =  s.[WTBALabelCode-87080                      ],
	    	t.[WTBASubAppellationCode-87085             ]  =  s.[WTBASubAppellationCode-87085             ],
	    	t.[WTBACasesperPalletLayer-87090            ]  =  s.[WTBACasesperPalletLayer-87090            ],
	    	t.[WTBALayersperPallet-87095                ]  =  s.[WTBALayersperPallet-87095                ],
	    	t.[WTBACasesperPallet-87096                 ]  =  s.[WTBACasesperPallet-87096                 ],
	    	t.[WTBAUnitCostCase-87110                   ]  =  s.[WTBAUnitCostCase-87110                   ],
	    	t.[WTBAUnitCostBottle-87111                 ]  =  s.[WTBAUnitCostBottle-87111                 ],
	    	t.[WTBALastDirectCostCase-87115             ]  =  s.[WTBALastDirectCostCase-87115             ],
	    	t.[WTBALastDirectCostBottle-87116           ]  =  s.[WTBALastDirectCostBottle-87116           ],
	    	t.[WTBAStandardCostCase-87120               ]  =  s.[WTBAStandardCostCase-87120               ],
	    	t.[WTBAStandardCostBottle-87121             ]  =  s.[WTBAStandardCostBottle-87121             ],
	    	t.[WTBABrandNo-87150                        ]  =  s.[WTBABrandNo-87150                        ],
	    	t.[WTBADoNotAllowSamples-87700              ]  =  s.[WTBADoNotAllowSamples-87700              ],
	    	t.[WTBAExclfromSampleBudget-87701           ]  =  s.[WTBAExclfromSampleBudget-87701           ],
	    	t.[WTBASalesOrderReview-87850               ]  =  s.[WTBASalesOrderReview-87850               ],
	    	t.[WTUSSalesLimitation-88030                ]  =  s.[WTUSSalesLimitation-88030                ],
	    	t.[WTUSSalesLimAllocMethod-88035            ]  =  s.[WTUSSalesLimAllocMethod-88035            ],
	    	t.[WTUSCOLANo-88500                         ]  =  s.[WTUSCOLANo-88500                         ],
	    	t.[WTUSExciseTaxClass-88650                 ]  =  s.[WTUSExciseTaxClass-88650                 ],
	    	t.[WTUSDonotPricePost-88800                 ]  =  s.[WTUSDonotPricePost-88800                 ],
	    	t.[WTIAAllocate-90100                       ]  =  s.[WTIAAllocate-90100                       ],
	    	t.[WTIAFullAllocationRequired-90101         ]  =  s.[WTIAFullAllocationRequired-90101         ],
	    	t.[WTIAAllocationReservInt-90102            ]  =  s.[WTIAAllocationReservInt-90102            ],
	    	t.[WTIAAllocationInheritCode-90103          ]  =  s.[WTIAAllocationInheritCode-90103          ],
	    	t.[WTIAAllocationisCurrent-90104            ]  =  s.[WTIAAllocationisCurrent-90104            ],
	    	t.[WTIAAllocJnlUnitofMeasure-90107          ]  =  s.[WTIAAllocJnlUnitofMeasure-90107          ],
	    	t.[WTIALimitingQtyperSource-90130           ]  =  s.[WTIALimitingQtyperSource-90130           ],
	    	t.[WTIALimitingUnitType-90140               ]  =  s.[WTIALimitingUnitType-90140               ],
	    	t.[RoutingNo-99000750                       ]  =  s.[RoutingNo-99000750                       ],
	    	t.[ProductionBOMNo-99000751                 ]  =  s.[ProductionBOMNo-99000751                 ],
	    	t.[SingleLevelMaterialCost-99000752         ]  =  s.[SingleLevelMaterialCost-99000752         ],
	    	t.[SingleLevelCapacityCost-99000753         ]  =  s.[SingleLevelCapacityCost-99000753         ],
	    	t.[SingleLevelSubcontrdCost-99000754        ]  =  s.[SingleLevelSubcontrdCost-99000754        ],
	    	t.[SingleLevelCapOvhdCost-99000755          ]  =  s.[SingleLevelCapOvhdCost-99000755          ],
	    	t.[SingleLevelMfgOvhdCost-99000756          ]  =  s.[SingleLevelMfgOvhdCost-99000756          ],
	    	t.[OverheadRate-99000757                    ]  =  s.[OverheadRate-99000757                    ],
	    	t.[RolledupSubcontractedCost-99000758       ]  =  s.[RolledupSubcontractedCost-99000758       ],
	    	t.[RolledupMfgOvhdCost-99000759             ]  =  s.[RolledupMfgOvhdCost-99000759             ],
	    	t.[RolledupCapOverheadCost-99000760         ]  =  s.[RolledupCapOverheadCost-99000760         ],
	    	t.[OrderTrackingPolicy-99000773             ]  =  s.[OrderTrackingPolicy-99000773             ],
	    	t.[SingleLvlMatNonInvtCost-99000779         ]  =  s.[SingleLvlMatNonInvtCost-99000779         ],
	    	t.[AllowWhseOverpick-99000780               ]  =  s.[AllowWhseOverpick-99000780               ],
	    	t.[Critical-99000875                        ]  =  s.[Critical-99000875                        ],
	    	t.[CommonItemNo-99008500                    ]  =  s.[CommonItemNo-99008500                    ],
	    	t.[timestamp-0                              ]  =  s.[timestamp-0                              ],
	    	t.[SystemCreatedAt-2000000001               ]  =  s.[SystemCreatedAt-2000000001               ],
	    	t.[SystemCreatedBy-2000000002               ]  =  s.[SystemCreatedBy-2000000002               ],
	    	t.[SystemModifiedAt-2000000003              ]  =  s.[SystemModifiedAt-2000000003              ],
	    	t.[SystemModifiedBy-2000000004              ]  =  s.[SystemModifiedBy-2000000004              ],
	    	t.[$Company                                 ]  =  s.[$Company                                 ],
	    	t.[$DeliveredDateTime                       ]  =  s.[$DeliveredDateTime                       ],
	    	t.[UpdateDate                               ]  =  GETDATE()
	    	
        FROM [WH].[silver].[Item27] t
        JOIN [test_lh].[dbo].[Item27] s
            ON t.[systemId-2000000000] = s.[systemId-2000000000]
        WHERE
	    	ISNULL(t.[No-1                                     ] ,'') <> ISNULL(s.[No-1                                     ] ,'')OR
            ISNULL(t.[No2-2                                    ] ,'') <> ISNULL(s.[No2-2                                    ] ,'')OR
	    	ISNULL(t.[Description-3                            ] ,'') <> ISNULL(s.[Description-3                            ] ,'')OR
	    	ISNULL(t.[SearchDescription-4                      ] ,'') <> ISNULL(s.[SearchDescription-4                      ] ,'')OR
            ISNULL(t.[Description2-5                           ] ,'') <> ISNULL(s.[Description2-5                           ] ,'')OR
            ISNULL(t.[BaseUnitofMeasure-8                      ] ,'') <> ISNULL(s.[BaseUnitofMeasure-8                      ] ,'')OR
            ISNULL(t.[PriceUnitConversion-9                    ] ,'') <> ISNULL(s.[PriceUnitConversion-9                    ] ,'')OR
            ISNULL(t.[Type-10                                  ] ,'') <> ISNULL(s.[Type-10                                  ] ,'')OR
            ISNULL(t.[InventoryPostingGroup-11                 ] ,'') <> ISNULL(s.[InventoryPostingGroup-11                 ] ,'')OR
            ISNULL(t.[ShelfNo-12                               ] ,'') <> ISNULL(s.[ShelfNo-12                               ] ,'')OR
            ISNULL(t.[ItemDiscGroup-14                         ] ,'') <> ISNULL(s.[ItemDiscGroup-14                         ] ,'')OR
            ISNULL(t.[AllowInvoiceDisc-15                      ] ,'') <> ISNULL(s.[AllowInvoiceDisc-15                      ] ,'')OR
            ISNULL(t.[StatisticsGroup-16                       ] ,'') <> ISNULL(s.[StatisticsGroup-16                       ] ,'')OR
            ISNULL(t.[CommissionGroup-17                       ] ,'') <> ISNULL(s.[CommissionGroup-17                       ] ,'')OR
            ISNULL(t.[UnitPrice-18                             ] ,'') <> ISNULL(s.[UnitPrice-18                             ] ,'')OR
            ISNULL(t.[PriceProfitCalculation-19                ] ,'') <> ISNULL(s.[PriceProfitCalculation-19                ] ,'')OR
            ISNULL(t.[Profit-20                                ] ,'') <> ISNULL(s.[Profit-20                                ] ,'')OR
            ISNULL(t.[CostingMethod-21                         ] ,'') <> ISNULL(s.[CostingMethod-21                         ] ,'')OR
            ISNULL(t.[UnitCost-22                              ] ,'') <> ISNULL(s.[UnitCost-22                              ] ,'')OR
            ISNULL(t.[StandardCost-24                          ] ,'') <> ISNULL(s.[StandardCost-24                          ] ,'')OR
            ISNULL(t.[LastDirectCost-25                        ] ,'') <> ISNULL(s.[LastDirectCost-25                        ] ,'')OR
            ISNULL(t.[IndirectCost-28                          ] ,'') <> ISNULL(s.[IndirectCost-28                          ] ,'')OR
            ISNULL(t.[CostisAdjusted-29                        ] ,'') <> ISNULL(s.[CostisAdjusted-29                        ] ,'')OR
            ISNULL(t.[AllowOnlineAdjustment-30                 ] ,'') <> ISNULL(s.[AllowOnlineAdjustment-30                 ] ,'')OR
            ISNULL(t.[VendorNo-31                              ] ,'') <> ISNULL(s.[VendorNo-31                              ] ,'')OR
            ISNULL(t.[VendorItemNo-32                          ] ,'') <> ISNULL(s.[VendorItemNo-32                          ] ,'')OR
            ISNULL(t.[LeadTimeCalculation-33                   ] ,'') <> ISNULL(s.[LeadTimeCalculation-33                   ] ,'')OR
            ISNULL(t.[ReorderPoint-34                          ] ,'') <> ISNULL(s.[ReorderPoint-34                          ] ,'')OR
            ISNULL(t.[MaximumInventory-35                      ] ,'') <> ISNULL(s.[MaximumInventory-35                      ] ,'')OR
            ISNULL(t.[ReorderQuantity-36                       ] ,'') <> ISNULL(s.[ReorderQuantity-36                       ] ,'')OR
            ISNULL(t.[AlternativeItemNo-37                     ] ,'') <> ISNULL(s.[AlternativeItemNo-37                     ] ,'')OR
            ISNULL(t.[UnitListPrice-38                         ] ,'') <> ISNULL(s.[UnitListPrice-38                         ] ,'')OR
            ISNULL(t.[DutyDue-39                               ] ,'') <> ISNULL(s.[DutyDue-39                               ] ,'')OR
            ISNULL(t.[DutyCode-40                              ] ,'') <> ISNULL(s.[DutyCode-40                              ] ,'')OR
            ISNULL(t.[GrossWeight-41                           ] ,'') <> ISNULL(s.[GrossWeight-41                           ] ,'')OR
            ISNULL(t.[NetWeight-42                             ] ,'') <> ISNULL(s.[NetWeight-42                             ] ,'')OR
            ISNULL(t.[UnitsperParcel-43                        ] ,'') <> ISNULL(s.[UnitsperParcel-43                        ] ,'')OR
            ISNULL(t.[UnitVolume-44                            ] ,'') <> ISNULL(s.[UnitVolume-44                            ] ,'')OR
            ISNULL(t.[Durability-45                            ] ,'') <> ISNULL(s.[Durability-45                            ] ,'')OR
            ISNULL(t.[FreightType-46                           ] ,'') <> ISNULL(s.[FreightType-46                           ] ,'')OR
            ISNULL(t.[TariffNo-47                              ] ,'') <> ISNULL(s.[TariffNo-47                              ] ,'')OR
            ISNULL(t.[DutyUnitConversion-48                    ] ,'') <> ISNULL(s.[DutyUnitConversion-48                    ] ,'')OR
            ISNULL(t.[CountryRegionPurchasedCode-49            ] ,'') <> ISNULL(s.[CountryRegionPurchasedCode-49            ] ,'')OR
            ISNULL(t.[BudgetQuantity-50                        ] ,'') <> ISNULL(s.[BudgetQuantity-50                        ] ,'')OR
            ISNULL(t.[BudgetedAmount-51                        ] ,'') <> ISNULL(s.[BudgetedAmount-51                        ] ,'')OR
            ISNULL(t.[BudgetProfit-52                          ] ,'') <> ISNULL(s.[BudgetProfit-52                          ] ,'')OR
            ISNULL(t.[Blocked-54                               ] ,'') <> ISNULL(s.[Blocked-54                               ] ,'')OR
            ISNULL(t.[BlockReason-56                           ] ,'') <> ISNULL(s.[BlockReason-56                           ] ,'')OR
            ISNULL(t.[LastDateTimeModified-61                  ] ,'') <> ISNULL(s.[LastDateTimeModified-61                  ] ,'')OR
            ISNULL(t.[LastDateModified-62                      ] ,'') <> ISNULL(s.[LastDateModified-62                      ] ,'')OR
            ISNULL(t.[LastTimeModified-63                      ] ,'') <> ISNULL(s.[LastTimeModified-63                      ] ,'')OR
            ISNULL(t.[PriceIncludesVAT-87                      ] ,'') <> ISNULL(s.[PriceIncludesVAT-87                      ] ,'')OR
            ISNULL(t.[VATBusPostingGrPrice-90                  ] ,'') <> ISNULL(s.[VATBusPostingGrPrice-90                  ] ,'')OR
            ISNULL(t.[GenProdPostingGroup-91                   ] ,'') <> ISNULL(s.[GenProdPostingGroup-91                   ] ,'')OR
            ISNULL(t.[CountryRegionofOriginCode-95             ] ,'') <> ISNULL(s.[CountryRegionofOriginCode-95             ] ,'')OR
            ISNULL(t.[AutomaticExtTexts-96                     ] ,'') <> ISNULL(s.[AutomaticExtTexts-96                     ] ,'')OR
            ISNULL(t.[NoSeries-97                              ] ,'') <> ISNULL(s.[NoSeries-97                              ] ,'')OR
            ISNULL(t.[TaxGroupCode-98                          ] ,'') <> ISNULL(s.[TaxGroupCode-98                          ] ,'')OR
            ISNULL(t.[VATProdPostingGroup-99                   ] ,'') <> ISNULL(s.[VATProdPostingGroup-99                   ] ,'')OR
            ISNULL(t.[Reserve-100                              ] ,'') <> ISNULL(s.[Reserve-100                              ] ,'')OR
            ISNULL(t.[GlobalDimension1Code-105                 ] ,'') <> ISNULL(s.[GlobalDimension1Code-105                 ] ,'')OR
            ISNULL(t.[GlobalDimension2Code-106                 ] ,'') <> ISNULL(s.[GlobalDimension2Code-106                 ] ,'')OR
            ISNULL(t.[StockoutWarning-120                      ] ,'') <> ISNULL(s.[StockoutWarning-120                      ] ,'')OR
            ISNULL(t.[PreventNegativeInventory-121             ] ,'') <> ISNULL(s.[PreventNegativeInventory-121             ] ,'')OR
            ISNULL(t.[VariantMandatoryifExists-122             ] ,'') <> ISNULL(s.[VariantMandatoryifExists-122             ] ,'')OR
            ISNULL(t.[ApplicationWkshUserID-521                ] ,'') <> ISNULL(s.[ApplicationWkshUserID-521                ] ,'')OR
            ISNULL(t.[AssemblyPolicy-910                       ] ,'') <> ISNULL(s.[AssemblyPolicy-910                       ] ,'')OR
            ISNULL(t.[GTIN-1217                                ] ,'') <> ISNULL(s.[GTIN-1217                                ] ,'')OR
            ISNULL(t.[DefaultDeferralTemplateCode-1700         ] ,'') <> ISNULL(s.[DefaultDeferralTemplateCode-1700         ] ,'')OR
            ISNULL(t.[LowLevelCode-5400                        ] ,'') <> ISNULL(s.[LowLevelCode-5400                        ] ,'')OR
            ISNULL(t.[LotSize-5401                             ] ,'') <> ISNULL(s.[LotSize-5401                             ] ,'')OR
            ISNULL(t.[SerialNos-5402                           ] ,'') <> ISNULL(s.[SerialNos-5402                           ] ,'')OR
            ISNULL(t.[LastUnitCostCalcDate-5403                ] ,'') <> ISNULL(s.[LastUnitCostCalcDate-5403                ] ,'')OR
            ISNULL(t.[RolledupMaterialCost-5404                ] ,'') <> ISNULL(s.[RolledupMaterialCost-5404                ] ,'')OR
            ISNULL(t.[RolledupCapacityCost-5405                ] ,'') <> ISNULL(s.[RolledupCapacityCost-5405                ] ,'')OR
            ISNULL(t.[Scrap-5407                               ] ,'') <> ISNULL(s.[Scrap-5407                               ] ,'')OR
            ISNULL(t.[RolledupMatNonInvtCost-5408              ] ,'') <> ISNULL(s.[RolledupMatNonInvtCost-5408              ] ,'')OR
            ISNULL(t.[InventoryValueZero-5409                  ] ,'') <> ISNULL(s.[InventoryValueZero-5409                  ] ,'')OR
            ISNULL(t.[DiscreteOrderQuantity-5410               ] ,'') <> ISNULL(s.[DiscreteOrderQuantity-5410               ] ,'')OR
            ISNULL(t.[MinimumOrderQuantity-5411                ] ,'') <> ISNULL(s.[MinimumOrderQuantity-5411                ] ,'')OR
            ISNULL(t.[MaximumOrderQuantity-5412                ] ,'') <> ISNULL(s.[MaximumOrderQuantity-5412                ] ,'')OR
            ISNULL(t.[SafetyStockQuantity-5413                 ] ,'') <> ISNULL(s.[SafetyStockQuantity-5413                 ] ,'')OR
            ISNULL(t.[OrderMultiple-5414                       ] ,'') <> ISNULL(s.[OrderMultiple-5414                       ] ,'')OR
            ISNULL(t.[SafetyLeadTime-5415                      ] ,'') <> ISNULL(s.[SafetyLeadTime-5415                      ] ,'')OR
            ISNULL(t.[FlushingMethod-5417                      ] ,'') <> ISNULL(s.[FlushingMethod-5417                      ] ,'')OR
            ISNULL(t.[ReplenishmentSystem-5419                 ] ,'') <> ISNULL(s.[ReplenishmentSystem-5419                 ] ,'')OR
            ISNULL(t.[RoundingPrecision-5422                   ] ,'') <> ISNULL(s.[RoundingPrecision-5422                   ] ,'')OR
            ISNULL(t.[SalesUnitofMeasure-5425                  ] ,'') <> ISNULL(s.[SalesUnitofMeasure-5425                  ] ,'')OR
            ISNULL(t.[PurchUnitofMeasure-5426                  ] ,'') <> ISNULL(s.[PurchUnitofMeasure-5426                  ] ,'')OR
            ISNULL(t.[TimeBucket-5428                          ] ,'') <> ISNULL(s.[TimeBucket-5428                          ] ,'')OR
            ISNULL(t.[ReorderingPolicy-5440                    ] ,'') <> ISNULL(s.[ReorderingPolicy-5440                    ] ,'')OR
            ISNULL(t.[IncludeInventory-5441                    ] ,'') <> ISNULL(s.[IncludeInventory-5441                    ] ,'')OR
            ISNULL(t.[ManufacturingPolicy-5442                 ] ,'') <> ISNULL(s.[ManufacturingPolicy-5442                 ] ,'')OR
            ISNULL(t.[ReschedulingPeriod-5443                  ] ,'') <> ISNULL(s.[ReschedulingPeriod-5443                  ] ,'')OR
            ISNULL(t.[LotAccumulationPeriod-5444               ] ,'') <> ISNULL(s.[LotAccumulationPeriod-5444               ] ,'')OR
            ISNULL(t.[DampenerPeriod-5445                      ] ,'') <> ISNULL(s.[DampenerPeriod-5445                      ] ,'')OR
            ISNULL(t.[DampenerQuantity-5446                    ] ,'') <> ISNULL(s.[DampenerQuantity-5446                    ] ,'')OR
            ISNULL(t.[OverflowLevel-5447                       ] ,'') <> ISNULL(s.[OverflowLevel-5447                       ] ,'')OR
            ISNULL(t.[ManufacturerCode-5701                    ] ,'') <> ISNULL(s.[ManufacturerCode-5701                    ] ,'')OR
            ISNULL(t.[ItemCategoryCode-5702                    ] ,'') <> ISNULL(s.[ItemCategoryCode-5702                    ] ,'')OR
            ISNULL(t.[CreatedFromNonstockItem-5703             ] ,'') <> ISNULL(s.[CreatedFromNonstockItem-5703             ] ,'')OR
            ISNULL(t.[PurchasingCode-5711                      ] ,'') <> ISNULL(s.[PurchasingCode-5711                      ] ,'')OR
            ISNULL(t.[ExcludedfromCostAdjustment-5801          ] ,'') <> ISNULL(s.[ExcludedfromCostAdjustment-5801          ] ,'')OR
            ISNULL(t.[ServiceItemGroup-5900                    ] ,'') <> ISNULL(s.[ServiceItemGroup-5900                    ] ,'')OR
            ISNULL(t.[SustCertNo-6210                          ] ,'') <> ISNULL(s.[SustCertNo-6210                          ] ,'')OR
            ISNULL(t.[SustCertName-6211                        ] ,'') <> ISNULL(s.[SustCertName-6211                        ] ,'')OR
            ISNULL(t.[GHGCredit-6212                           ] ,'') <> ISNULL(s.[GHGCredit-6212                           ] ,'')OR
            ISNULL(t.[CarbonCreditPerUOM-6213                  ] ,'') <> ISNULL(s.[CarbonCreditPerUOM-6213                  ] ,'')OR
            ISNULL(t.[DefaultSustAccount-6214                  ] ,'') <> ISNULL(s.[DefaultSustAccount-6214                  ] ,'')OR
            ISNULL(t.[DefaultCO2Emission-6215                  ] ,'') <> ISNULL(s.[DefaultCO2Emission-6215                  ] ,'')OR
            ISNULL(t.[DefaultCH4Emission-6216                  ] ,'') <> ISNULL(s.[DefaultCH4Emission-6216                  ] ,'')OR
            ISNULL(t.[DefaultN2OEmission-6217                  ] ,'') <> ISNULL(s.[DefaultN2OEmission-6217                  ] ,'')OR
            ISNULL(t.[CO2eperUnit-6218                         ] ,'') <> ISNULL(s.[CO2eperUnit-6218                         ] ,'')OR
            ISNULL(t.[CO2eLastDateModified-6219                ] ,'') <> ISNULL(s.[CO2eLastDateModified-6219                ] ,'')OR
            ISNULL(t.[SourceofEmissionData-6220                ] ,'') <> ISNULL(s.[SourceofEmissionData-6220                ] ,'')OR
            ISNULL(t.[EmissionVerified-6221                    ] ,'') <> ISNULL(s.[EmissionVerified-6221                    ] ,'')OR
            ISNULL(t.[CBAMCompliance-6222                      ] ,'') <> ISNULL(s.[CBAMCompliance-6222                      ] ,'')OR
            ISNULL(t.[EPRCategory-6223                         ] ,'') <> ISNULL(s.[EPRCategory-6223                         ] ,'')OR
            ISNULL(t.[MaterialCompositionNo-6224               ] ,'') <> ISNULL(s.[MaterialCompositionNo-6224               ] ,'')OR
            ISNULL(t.[EPRFeesPerUnit-6226                      ] ,'') <> ISNULL(s.[EPRFeesPerUnit-6226                      ] ,'')OR
            ISNULL(t.[EndofLifeDisposalReq-6227                ] ,'') <> ISNULL(s.[EndofLifeDisposalReq-6227                ] ,'')OR
            ISNULL(t.[ItemofConcern-6230                       ] ,'') <> ISNULL(s.[ItemofConcern-6230                       ] ,'')OR
            ISNULL(t.[RecyclabilityPercentage-6231             ] ,'') <> ISNULL(s.[RecyclabilityPercentage-6231             ] ,'')OR
            ISNULL(t.[EnergyEfficiencyRating-6232              ] ,'') <> ISNULL(s.[EnergyEfficiencyRating-6232              ] ,'')OR
            ISNULL(t.[EndofLifeInformation-6233                ] ,'') <> ISNULL(s.[EndofLifeInformation-6233                ] ,'')OR
            ISNULL(t.[ItemTrackingCode-6500                    ] ,'') <> ISNULL(s.[ItemTrackingCode-6500                    ] ,'')OR
            ISNULL(t.[LotNos-6501                              ] ,'') <> ISNULL(s.[LotNos-6501                              ] ,'')OR
            ISNULL(t.[ExpirationCalculation-6502               ] ,'') <> ISNULL(s.[ExpirationCalculation-6502               ] ,'')OR
            ISNULL(t.[WarehouseClassCode-7300                  ] ,'') <> ISNULL(s.[WarehouseClassCode-7300                  ] ,'')OR
            ISNULL(t.[SpecialEquipmentCode-7301                ] ,'') <> ISNULL(s.[SpecialEquipmentCode-7301                ] ,'')OR
            ISNULL(t.[PutawayTemplateCode-7302                 ] ,'') <> ISNULL(s.[PutawayTemplateCode-7302                 ] ,'')OR
            ISNULL(t.[PutawayUnitofMeasureCode-7307            ] ,'') <> ISNULL(s.[PutawayUnitofMeasureCode-7307            ] ,'')OR
            ISNULL(t.[PhysInvtCountingPeriodCode-7380          ] ,'') <> ISNULL(s.[PhysInvtCountingPeriodCode-7380          ] ,'')OR
            ISNULL(t.[LastCountingPeriodUpdate-7381            ] ,'') <> ISNULL(s.[LastCountingPeriodUpdate-7381            ] ,'')OR
            ISNULL(t.[UseCrossDocking-7384                     ] ,'') <> ISNULL(s.[UseCrossDocking-7384                     ] ,'')OR
            ISNULL(t.[NextCountingStartDate-7385               ] ,'') <> ISNULL(s.[NextCountingStartDate-7385               ] ,'')OR
            ISNULL(t.[NextCountingEndDate-7386                 ] ,'') <> ISNULL(s.[NextCountingEndDate-7386                 ] ,'')OR
            ISNULL(t.[UnitofMeasureId-8001                     ] ,'') <> ISNULL(s.[UnitofMeasureId-8001                     ] ,'')OR
            ISNULL(t.[TaxGroupId-8002                          ] ,'') <> ISNULL(s.[TaxGroupId-8002                          ] ,'')OR
            ISNULL(t.[SalesBlocked-8003                        ] ,'') <> ISNULL(s.[SalesBlocked-8003                        ] ,'')OR
            ISNULL(t.[PurchasingBlocked-8004                   ] ,'') <> ISNULL(s.[PurchasingBlocked-8004                   ] ,'')OR
            ISNULL(t.[ItemCategoryId-8005                      ] ,'') <> ISNULL(s.[ItemCategoryId-8005                      ] ,'')OR
            ISNULL(t.[InventoryPostingGroupId-8006             ] ,'') <> ISNULL(s.[InventoryPostingGroupId-8006             ] ,'')OR
            ISNULL(t.[GenProdPostingGroupId-8007               ] ,'') <> ISNULL(s.[GenProdPostingGroupId-8007               ] ,'')OR
            ISNULL(t.[ServiceBlocked-8010                      ] ,'') <> ISNULL(s.[ServiceBlocked-8010                      ] ,'')OR
            ISNULL(t.[ProductionBlocked-8011                   ] ,'') <> ISNULL(s.[ProductionBlocked-8011                   ] ,'')OR
            ISNULL(t.[SubscriptionOption-8052                  ] ,'') <> ISNULL(s.[SubscriptionOption-8052                  ] ,'')OR
            ISNULL(t.[OverReceiptCode-8510                     ] ,'') <> ISNULL(s.[OverReceiptCode-8510                     ] ,'')OR
            ISNULL(t.[DutyClass-10004                          ] ,'') <> ISNULL(s.[DutyClass-10004                          ] ,'')OR
            ISNULL(t.[HasSalesForecast-21850                   ] ,'') <> ISNULL(s.[HasSalesForecast-21850                   ] ,'')OR
            ISNULL(t.[SATItemClassification-27000              ] ,'') <> ISNULL(s.[SATItemClassification-27000              ] ,'')OR
            ISNULL(t.[SATHazardousMaterial-27024               ] ,'') <> ISNULL(s.[SATHazardousMaterial-27024               ] ,'')OR
            ISNULL(t.[SATPackagingType-27025                   ] ,'') <> ISNULL(s.[SATPackagingType-27025                   ] ,'')OR
            ISNULL(t.[SATMaterialType-27026                    ] ,'') <> ISNULL(s.[SATMaterialType-27026                    ] ,'')OR
            ISNULL(t.[WCTEWPrestige-50000                      ] ,'') <> ISNULL(s.[WCTEWPrestige-50000                      ] ,'')OR
            ISNULL(t.[WCINV04PurchaserCode-50010               ] ,'') <> ISNULL(s.[WCINV04PurchaserCode-50010               ] ,'')OR
            ISNULL(t.[WCINV08AgedInventory-50043               ] ,'') <> ISNULL(s.[WCINV08AgedInventory-50043               ] ,'')OR
            ISNULL(t.[WCINV08ExpectedQtyfromVend-50044         ] ,'') <> ISNULL(s.[WCINV08ExpectedQtyfromVend-50044         ] ,'')OR
            ISNULL(t.[WCINV08WHItemNo-50045                    ] ,'') <> ISNULL(s.[WCINV08WHItemNo-50045                    ] ,'')OR
            ISNULL(t.[WCINV08NAforSalesreps-50046              ] ,'') <> ISNULL(s.[WCINV08NAforSalesreps-50046              ] ,'')OR
            ISNULL(t.[WCINV08SuggestedRetailPrice-50047        ] ,'') <> ISNULL(s.[WCINV08SuggestedRetailPrice-50047        ] ,'')OR
            ISNULL(t.[WCAR06SalesCommissionable-50100          ] ,'') <> ISNULL(s.[WCAR06SalesCommissionable-50100          ] ,'')OR
            ISNULL(t.[WCSAL04AllowSampleDiscount-50120         ] ,'') <> ISNULL(s.[WCSAL04AllowSampleDiscount-50120         ] ,'')OR
            ISNULL(t.[WCSAL04AllowPalletDiscount-50121         ] ,'') <> ISNULL(s.[WCSAL04AllowPalletDiscount-50121         ] ,'')OR
            ISNULL(t.[WCINV14ItemPortfolio-50150               ] ,'') <> ISNULL(s.[WCINV14ItemPortfolio-50150               ] ,'')OR
            ISNULL(t.[WCINT02ExportedtoJFHB-50250              ] ,'') <> ISNULL(s.[WCINT02ExportedtoJFHB-50250              ] ,'')OR
            ISNULL(t.[WCINT03ExportedtoMMK-50280               ] ,'') <> ISNULL(s.[WCINT03ExportedtoMMK-50280               ] ,'')OR
            ISNULL(t.[WCINV19DonotPrintonCat-50520             ] ,'') <> ISNULL(s.[WCINV19DonotPrintonCat-50520             ] ,'')OR
            ISNULL(t.[WCINT04PABlocked-50650                   ] ,'') <> ISNULL(s.[WCINT04PABlocked-50650                   ] ,'')OR
            ISNULL(t.[WCINT04SplitAllowed-50651                ] ,'') <> ISNULL(s.[WCINT04SplitAllowed-50651                ] ,'')OR
            ISNULL(t.[CommuneVillage-80001                     ] ,'') <> ISNULL(s.[CommuneVillage-80001                     ] ,'')OR
            ISNULL(t.[SustainablePractices-80002               ] ,'') <> ISNULL(s.[SustainablePractices-80002               ] ,'')OR
            ISNULL(t.[Climate-80003                            ] ,'') <> ISNULL(s.[Climate-80003                            ] ,'')OR
            ISNULL(t.[YearPlantedVineAge-80004                 ] ,'') <> ISNULL(s.[YearPlantedVineAge-80004                 ] ,'')OR
            ISNULL(t.[HarvestTechnique-80005                   ] ,'') <> ISNULL(s.[HarvestTechnique-80005                   ] ,'')OR
            ISNULL(t.[Fermentation-80006                       ] ,'') <> ISNULL(s.[Fermentation-80006                       ] ,'')OR
            ISNULL(t.[ResidualSugar-80007                      ] ,'') <> ISNULL(s.[ResidualSugar-80007                      ] ,'')OR
            ISNULL(t.[BoboProduct-80008                        ] ,'') <> ISNULL(s.[BoboProduct-80008                        ] ,'')OR
            ISNULL(t.[LowsO2-80009                             ] ,'') <> ISNULL(s.[LowsO2-80009                             ] ,'')OR
            ISNULL(t.[SustainableCertificates-80010            ] ,'') <> ISNULL(s.[SustainableCertificates-80010            ] ,'')OR
            ISNULL(t.[DistillerName-80011                      ] ,'') <> ISNULL(s.[DistillerName-80011                      ] ,'')OR
            ISNULL(t.[Finishing-80012                          ] ,'') <> ISNULL(s.[Finishing-80012                          ] ,'')OR
            ISNULL(t.[Maturation-80013                         ] ,'') <> ISNULL(s.[Maturation-80013                         ] ,'')OR
            ISNULL(t.[Cooperage-80014                          ] ,'') <> ISNULL(s.[Cooperage-80014                          ] ,'')OR
            ISNULL(t.[Distillation-80015                       ] ,'') <> ISNULL(s.[Distillation-80015                       ] ,'')OR
            ISNULL(t.[Closure-80016                            ] ,'') <> ISNULL(s.[Closure-80016                            ] ,'')OR
            ISNULL(t.[sO2Amount-80017                          ] ,'') <> ISNULL(s.[sO2Amount-80017                          ] ,'')OR
            ISNULL(t.[VineyardSize-80018                       ] ,'') <> ISNULL(s.[VineyardSize-80018                       ] ,'')OR
            ISNULL(t.[Elevage-80019                            ] ,'') <> ISNULL(s.[Elevage-80019                            ] ,'')OR
            ISNULL(t.[WinemakerName-80020                      ] ,'') <> ISNULL(s.[WinemakerName-80020                      ] ,'')OR
            ISNULL(t.[Filtration-80021                         ] ,'') <> ISNULL(s.[Filtration-80021                         ] ,'')OR
            ISNULL(t.[Fining-80022                             ] ,'') <> ISNULL(s.[Fining-80022                             ] ,'')OR
            ISNULL(t.[TechSheetReady-80023                     ] ,'') <> ISNULL(s.[TechSheetReady-80023                     ] ,'')OR
            ISNULL(t.[MarketingDescription-80024               ] ,'') <> ISNULL(s.[MarketingDescription-80024               ] ,'')OR
            ISNULL(t.[TastingNotes-80025                       ] ,'') <> ISNULL(s.[TastingNotes-80025                       ] ,'')OR
            ISNULL(t.[ProducerWebsite-80027                    ] ,'') <> ISNULL(s.[ProducerWebsite-80027                    ] ,'')OR
            ISNULL(t.[Soil-80028                               ] ,'') <> ISNULL(s.[Soil-80028                               ] ,'')OR
            ISNULL(t.[VintageDetails-80029                     ] ,'') <> ISNULL(s.[VintageDetails-80029                     ] ,'')OR
            ISNULL(t.[WineComItem-80030                        ] ,'') <> ISNULL(s.[WineComItem-80030                        ] ,'')OR
            ISNULL(t.[WTBAVintageCode-87000                    ] ,'') <> ISNULL(s.[WTBAVintageCode-87000                    ] ,'')OR
            ISNULL(t.[WTBAOriginRegionCode-87005               ] ,'') <> ISNULL(s.[WTBAOriginRegionCode-87005               ] ,'')OR
            ISNULL(t.[WTBASubRegionCode-87006                  ] ,'') <> ISNULL(s.[WTBASubRegionCode-87006                  ] ,'')OR
            ISNULL(t.[WTBAVarietalCode-87007                   ] ,'') <> ISNULL(s.[WTBAVarietalCode-87007                   ] ,'')OR
            ISNULL(t.[WTBACasePack-87010                       ] ,'') <> ISNULL(s.[WTBACasePack-87010                       ] ,'')OR
            ISNULL(t.[WTBAItemClassificationCode-87014         ] ,'') <> ISNULL(s.[WTBAItemClassificationCode-87014         ] ,'')OR
            ISNULL(t.[WTBAAlcoholTypeCode-87015                ] ,'') <> ISNULL(s.[WTBAAlcoholTypeCode-87015                ] ,'')OR
            ISNULL(t.[WTBABottleSize-87020                     ] ,'') <> ISNULL(s.[WTBABottleSize-87020                     ] ,'')OR
            ISNULL(t.[WTBAWineColor-87025                      ] ,'') <> ISNULL(s.[WTBAWineColor-87025                      ] ,'')OR
            ISNULL(t.[WTBAContainerTypeCode-87028              ] ,'') <> ISNULL(s.[WTBAContainerTypeCode-87028              ] ,'')OR
            ISNULL(t.[WTBAAlcoholContent-87030                 ] ,'') <> ISNULL(s.[WTBAAlcoholContent-87030                 ] ,'')OR
            ISNULL(t.[WTBAProof-87031                          ] ,'') <> ISNULL(s.[WTBAProof-87031                          ] ,'')OR
            ISNULL(t.[WTBAAppellationCode-87060                ] ,'') <> ISNULL(s.[WTBAAppellationCode-87060                ] ,'')OR
            ISNULL(t.[WTBAVegan-87062                          ] ,'') <> ISNULL(s.[WTBAVegan-87062                          ] ,'')OR
            ISNULL(t.[WTBAOrganic-87063                        ] ,'') <> ISNULL(s.[WTBAOrganic-87063                        ] ,'')OR
            ISNULL(t.[WTBABiodynamic-87064                     ] ,'') <> ISNULL(s.[WTBABiodynamic-87064                     ] ,'')OR
            ISNULL(t.[WTBAClosureTypeCode-87065                ] ,'') <> ISNULL(s.[WTBAClosureTypeCode-87065                ] ,'')OR
            ISNULL(t.[WTBALabelCode-87080                      ] ,'') <> ISNULL(s.[WTBALabelCode-87080                      ] ,'')OR
            ISNULL(t.[WTBASubAppellationCode-87085             ] ,'') <> ISNULL(s.[WTBASubAppellationCode-87085             ] ,'')OR
            ISNULL(t.[WTBACasesperPalletLayer-87090            ] ,'') <> ISNULL(s.[WTBACasesperPalletLayer-87090            ] ,'')OR
            ISNULL(t.[WTBALayersperPallet-87095                ] ,'') <> ISNULL(s.[WTBALayersperPallet-87095                ] ,'')OR
            ISNULL(t.[WTBACasesperPallet-87096                 ] ,'') <> ISNULL(s.[WTBACasesperPallet-87096                 ] ,'')OR
            ISNULL(t.[WTBAUnitCostCase-87110                   ] ,'') <> ISNULL(s.[WTBAUnitCostCase-87110                   ] ,'')OR
            ISNULL(t.[WTBAUnitCostBottle-87111                 ] ,'') <> ISNULL(s.[WTBAUnitCostBottle-87111                 ] ,'')OR
            ISNULL(t.[WTBALastDirectCostCase-87115             ] ,'') <> ISNULL(s.[WTBALastDirectCostCase-87115             ] ,'')OR
            ISNULL(t.[WTBALastDirectCostBottle-87116           ] ,'') <> ISNULL(s.[WTBALastDirectCostBottle-87116           ] ,'')OR
            ISNULL(t.[WTBAStandardCostCase-87120               ] ,'') <> ISNULL(s.[WTBAStandardCostCase-87120               ] ,'')OR
            ISNULL(t.[WTBAStandardCostBottle-87121             ] ,'') <> ISNULL(s.[WTBAStandardCostBottle-87121             ] ,'')OR
            ISNULL(t.[WTBABrandNo-87150                        ] ,'') <> ISNULL(s.[WTBABrandNo-87150                        ] ,'')OR
            ISNULL(t.[WTBADoNotAllowSamples-87700              ] ,'') <> ISNULL(s.[WTBADoNotAllowSamples-87700              ] ,'')OR
            ISNULL(t.[WTBAExclfromSampleBudget-87701           ] ,'') <> ISNULL(s.[WTBAExclfromSampleBudget-87701           ] ,'')OR
            ISNULL(t.[WTBASalesOrderReview-87850               ] ,'') <> ISNULL(s.[WTBASalesOrderReview-87850               ] ,'')OR
            ISNULL(t.[WTUSSalesLimitation-88030                ] ,'') <> ISNULL(s.[WTUSSalesLimitation-88030                ] ,'')OR
            ISNULL(t.[WTUSSalesLimAllocMethod-88035            ] ,'') <> ISNULL(s.[WTUSSalesLimAllocMethod-88035            ] ,'')OR
            ISNULL(t.[WTUSCOLANo-88500                         ] ,'') <> ISNULL(s.[WTUSCOLANo-88500                         ] ,'')OR
            ISNULL(t.[WTUSExciseTaxClass-88650                 ] ,'') <> ISNULL(s.[WTUSExciseTaxClass-88650                 ] ,'')OR
            ISNULL(t.[WTUSDonotPricePost-88800                 ] ,'') <> ISNULL(s.[WTUSDonotPricePost-88800                 ] ,'')OR
            ISNULL(t.[WTIAAllocate-90100                       ] ,'') <> ISNULL(s.[WTIAAllocate-90100                       ] ,'')OR
            ISNULL(t.[WTIAFullAllocationRequired-90101         ] ,'') <> ISNULL(s.[WTIAFullAllocationRequired-90101         ] ,'')OR
            ISNULL(t.[WTIAAllocationReservInt-90102            ] ,'') <> ISNULL(s.[WTIAAllocationReservInt-90102            ] ,'')OR
            ISNULL(t.[WTIAAllocationInheritCode-90103          ] ,'') <> ISNULL(s.[WTIAAllocationInheritCode-90103          ] ,'')OR
            ISNULL(t.[WTIAAllocationisCurrent-90104            ] ,'') <> ISNULL(s.[WTIAAllocationisCurrent-90104            ] ,'')OR
            ISNULL(t.[WTIAAllocJnlUnitofMeasure-90107          ] ,'') <> ISNULL(s.[WTIAAllocJnlUnitofMeasure-90107          ] ,'')OR
            ISNULL(t.[WTIALimitingQtyperSource-90130           ] ,'') <> ISNULL(s.[WTIALimitingQtyperSource-90130           ] ,'')OR
            ISNULL(t.[WTIALimitingUnitType-90140               ] ,'') <> ISNULL(s.[WTIALimitingUnitType-90140               ] ,'')OR
            ISNULL(t.[RoutingNo-99000750                       ] ,'') <> ISNULL(s.[RoutingNo-99000750                       ] ,'')OR
            ISNULL(t.[ProductionBOMNo-99000751                 ] ,'') <> ISNULL(s.[ProductionBOMNo-99000751                 ] ,'')OR
            ISNULL(t.[SingleLevelMaterialCost-99000752         ] ,'') <> ISNULL(s.[SingleLevelMaterialCost-99000752         ] ,'')OR
            ISNULL(t.[SingleLevelCapacityCost-99000753         ] ,'') <> ISNULL(s.[SingleLevelCapacityCost-99000753         ] ,'')OR
            ISNULL(t.[SingleLevelSubcontrdCost-99000754        ] ,'') <> ISNULL(s.[SingleLevelSubcontrdCost-99000754        ] ,'')OR
            ISNULL(t.[SingleLevelCapOvhdCost-99000755          ] ,'') <> ISNULL(s.[SingleLevelCapOvhdCost-99000755          ] ,'')OR
            ISNULL(t.[SingleLevelMfgOvhdCost-99000756          ] ,'') <> ISNULL(s.[SingleLevelMfgOvhdCost-99000756          ] ,'')OR
            ISNULL(t.[OverheadRate-99000757                    ] ,'') <> ISNULL(s.[OverheadRate-99000757                    ] ,'')OR
            ISNULL(t.[RolledupSubcontractedCost-99000758       ] ,'') <> ISNULL(s.[RolledupSubcontractedCost-99000758       ] ,'')OR
            ISNULL(t.[RolledupMfgOvhdCost-99000759             ] ,'') <> ISNULL(s.[RolledupMfgOvhdCost-99000759             ] ,'')OR
            ISNULL(t.[RolledupCapOverheadCost-99000760         ] ,'') <> ISNULL(s.[RolledupCapOverheadCost-99000760         ] ,'')OR
            ISNULL(t.[OrderTrackingPolicy-99000773             ] ,'') <> ISNULL(s.[OrderTrackingPolicy-99000773             ] ,'')OR
            ISNULL(t.[SingleLvlMatNonInvtCost-99000779         ] ,'') <> ISNULL(s.[SingleLvlMatNonInvtCost-99000779         ] ,'')OR
            ISNULL(t.[AllowWhseOverpick-99000780               ] ,'') <> ISNULL(s.[AllowWhseOverpick-99000780               ] ,'')OR
            ISNULL(t.[Critical-99000875                        ] ,'') <> ISNULL(s.[Critical-99000875                        ] ,'')OR
            ISNULL(t.[CommonItemNo-99008500                    ] ,'') <> ISNULL(s.[CommonItemNo-99008500                    ] ,'')OR
            ISNULL(t.[timestamp-0                              ] ,'') <> ISNULL(s.[timestamp-0                              ] ,'')OR
            ISNULL(t.[SystemCreatedAt-2000000001               ] ,'') <> ISNULL(s.[SystemCreatedAt-2000000001               ] ,'')OR
            ISNULL(t.[SystemCreatedBy-2000000002               ] ,'') <> ISNULL(s.[SystemCreatedBy-2000000002               ] ,'')OR
            ISNULL(t.[SystemModifiedAt-2000000003              ] ,'') <> ISNULL(s.[SystemModifiedAt-2000000003              ] ,'')OR
            ISNULL(t.[SystemModifiedBy-2000000004              ] ,'') <> ISNULL(s.[SystemModifiedBy-2000000004              ] ,'')OR
            ISNULL(t.[$Company                                 ] ,'') <> ISNULL(s.[$Company                                 ] ,'')OR
            ISNULL(t.[$DeliveredDateTime                       ] ,'') <> ISNULL(s.[$DeliveredDateTime                       ] ,'')

        SET @Updated = @@ROWCOUNT;

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
		DELETE t FROM [WH].[silver].[Item27] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM [test_lh].[dbo].[Item27] s
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
        'Item27',
        @StartTime,
        @EndTime,
        @Status,
        @Inserted,
        @Updated,
        @Deleted,
        --@FilesProcessed,
        @ErrorMessage
    );

END