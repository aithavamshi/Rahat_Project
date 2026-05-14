CREATE     PROCEDURE sp_Load_DimItem
AS
BEGIN
--Insert 
	PRINT 'INSERT STARTED';
    INSERT INTO [WH].[gold].[Item27] (

		[WTIAAllocJnlUnitofMeasure     ],
		[VendorItemNo                  ],
		[WCINV08WHItemNo               ],
		[WTUSSalesLimAllocMethod       ],
		[LeadTimeCalculation           ],
		[WTBAClosureTypeCode           ],
		[WTBASubRegionCode             ],
		[WarehouseClassCode            ],
		[ItemDiscGroup                 ],
		[WTBAWineColor                 ],
		[WTUSCOLANo                    ],
		[WTBAOriginRegionCode-87005    ],
		[WTBAVarietalCode              ],
		[WTBABrandNo                   ],
		[WTBAVintageCode               ],
		[WTBAAlcoholTypeCode           ],
		[WCINV04PurchaserCode          ],
		[WTBALabelCode                 ],
		[CountryRegionofOriginCode     ],
		[WCINV14ItemPortfolio          ],
		[GenProdPostingGroup           ],
		[InventoryPostingGroup         ],
		[VendorNo                      ],
		[WTBABottleSize                ],
		[$Company                      ],
		[AllowInvoiceDisc              ],
		[AllowOnlineAdjustment         ],
		[BaseUnitofMeasure             ],
		[Blocked                       ],
		[Description                   ],
		[ItemCategoryCode              ],
		[LastDateModified              ],
		[LastDateTimeModified          ],
		[LastDirectCost                ],
		[LastTimeModified              ],
		[NetWeight                     ],
		[No                            ],
		[PurchasingBlocked             ],
		[SalesUnitofMeasure            ],
		[SearchDescription             ],
		[StandardCost                  ],
		[SystemCreatedAt               ],
		[SystemCreatedBy               ],
		[SystemModifiedAt              ],
		[UnitCost                      ],
		[UnitListPrice                 ],
		[UnitPrice                     ],
		[UnitVolume                    ],
		[UseCrossDocking               ],
		[WCAR06SalesCommissionable     ],
		[WCINT02ExportedtoJFHB         ],
		[WCINT03ExportedtoMMK          ],
		[WCINT04PABlocked              ],
		[WCINT04SplitAllowed           ],
		[WCINV08AgedInventory          ],
		[WCINV08ExpectedQtyfromVend    ],
		[WCINV08NAforSalesreps         ],
		[WCINV08SuggestedRetailPrice   ],
		[WCINV19DonotPrintonCat        ],
		[WCSAL04AllowPalletDiscount    ],
		[WCSAL04AllowSampleDiscount    ],
		[WCTEWPrestige                 ],
		[WTBAAlcoholContent            ],
		[WTBABiodynamic                ],
		[WTBACasePack                  ],
		[WTBACasesperPallet            ],
		[WTBACasesperPalletLayer       ],
		[WTBADoNotAllowSamples         ],
		[WTBAExclfromSampleBudget      ],
		[WTBALastDirectCostBottle      ],
		[WTBALastDirectCostCase        ],
		[WTBALayersperPallet           ],
		[WTBAOrganic                   ],
		[WTBAProof                     ],
		[WTBASalesOrderReview          ],
		[WTBAStandardCostBottle        ],
		[WTBAStandardCostCase          ],
		[WTBAUnitCostBottle            ],
		[WTBAUnitCostCase              ],
		[WTBAVegan                     ],
		[WTIAAllocate                  ],
		[WTIAAllocationReservInt       ],
		[WTIAAllocationisCurrent       ],
		[WTIAFullAllocationRequired    ],
		[WTIALimitingQtyperSource      ],
		[WTIALimitingUnitType          ],
		[WTUSDonotPricePost            ],
		[WTUSSalesLimitation           ],
		[systemId                      ],
		[timestamp                     ],
		[InsertDate                    ]
		)
	Select
		s.[WTIAAllocJnlUnitofMeasure-90107],
		s.[VendorItemNo-32],
		s.[WCINV08WHItemNo-50045],
		s.[WTUSSalesLimAllocMethod-88035],
		s.[LeadTimeCalculation-33],
		s.[WTBAClosureTypeCode-87065],
		s.[WTBASubRegionCode-87006],
		s.[WarehouseClassCode-7300],
		s.[ItemDiscGroup-14],
		s.[WTBAWineColor-87025],
		s.[WTUSCOLANo-88500],
		s.[WTBAOriginRegionCode-87005],
		s.[WTBAVarietalCode-87007],
		s.[WTBABrandNo-87150],
		s.[WTBAVintageCode-87000],
		s.[WTBAAlcoholTypeCode-87015],
		s.[WCINV04PurchaserCode-50010],
		s.[WTBALabelCode-87080],
		s.[CountryRegionofOriginCode-95],
		s.[WCINV14ItemPortfolio-50150],
		s.[GenProdPostingGroup-91],
		s.[InventoryPostingGroup-11],
		s.[VendorNo-31],
		s.[WTBABottleSize-87020],
		s.[$Company],
		s.[AllowInvoiceDisc-15],
		s.[AllowOnlineAdjustment-30],
		s.[BaseUnitofMeasure-8],
		s.[Blocked-54],
		s.[Description-3],
		s.[ItemCategoryCode-5702],
		s.[LastDateModified-62],
		s.[LastDateTimeModified-61],
		s.[LastDirectCost-25],
		s.[LastTimeModified-63],
		s.[NetWeight-42],
		s.[No-1],
		s.[PurchasingBlocked-8004],
		s.[SalesUnitofMeasure-5425],
		s.[SearchDescription-4],
		s.[StandardCost-24],
		s.[SystemCreatedAt-2000000001],
		s.[SystemCreatedBy-2000000002],
		s.[SystemModifiedAt-2000000003],
		s.[UnitCost-22],
		s.[UnitListPrice-38],
		s.[UnitPrice-18],
		s.[UnitVolume-44],
		s.[UseCrossDocking-7384],
		s.[WCAR06SalesCommissionable-50100],
		s.[WCINT02ExportedtoJFHB-50250],
		s.[WCINT03ExportedtoMMK-50280],
		s.[WCINT04PABlocked-50650],
		s.[WCINT04SplitAllowed-50651],
		s.[WCINV08AgedInventory-50043],
		s.[WCINV08ExpectedQtyfromVend-50044],
		s.[WCINV08NAforSalesreps-50046],
		s.[WCINV08SuggestedRetailPrice-50047],
		s.[WCINV19DonotPrintonCat-50520],
		s.[WCSAL04AllowPalletDiscount-50121],
		s.[WCSAL04AllowSampleDiscount-50120],
		s.[WCTEWPrestige-50000],
		s.[WTBAAlcoholContent-87030],
		s.[WTBABiodynamic-87064],
		s.[WTBACasePack-87010],
		s.[WTBACasesperPallet-87096],
		s.[WTBACasesperPalletLayer-87090],
		s.[WTBADoNotAllowSamples-87700],
		s.[WTBAExclfromSampleBudget-87701],
		s.[WTBALastDirectCostBottle-87116],
		s.[WTBALastDirectCostCase-87115],
		s.[WTBALayersperPallet-87095],
		s.[WTBAOrganic-87063],
		s.[WTBAProof-87031],
		s.[WTBASalesOrderReview-87850],
		s.[WTBAStandardCostBottle-87121],
		s.[WTBAStandardCostCase-87120],
		s.[WTBAUnitCostBottle-87111],
		s.[WTBAUnitCostCase-87110],
		s.[WTBAVegan-87062],
		s.[WTIAAllocate-90100],
		s.[WTIAAllocationReservInt-90102],
		s.[WTIAAllocationisCurrent-90104],
		s.[WTIAFullAllocationRequired-90101],
		s.[WTIALimitingQtyperSource-90130],
		s.[WTIALimitingUnitType-90140],
		s.[WTUSDonotPricePost-88800],
		s.[WTUSSalesLimitation-88030],
		s.[systemId-2000000000],
		s.[timestamp-0],
		getdate() as InsertDate
	FROM [Rahat_LH].[dbo].[item] s
    LEFT JOIN [WH].[gold].[Item27] t
        ON s.[No-1] = t.[No]
    WHERE t.[No] IS NULL;
	--Update
	PRINT 'Update STARTED';
	Update t
	set
	   t.[WTIAAllocJnlUnitofMeasure     ] = s.[WTIAAllocJnlUnitofMeasure-90107],
	   t.[VendorItemNo                  ] = s.[VendorItemNo-32],
       t.[WCINV08WHItemNo               ] = s.[WCINV08WHItemNo-50045],
       t.[WTUSSalesLimAllocMethod       ] = s.[WTUSSalesLimAllocMethod-88035],
       t.[LeadTimeCalculation           ] = s.[LeadTimeCalculation-33],
       t.[WTBAClosureTypeCode           ] = s.[WTBAClosureTypeCode-87065],
       t.[WTBASubRegionCode             ] = s.[WTBASubRegionCode-87006],
       t.[WarehouseClassCode            ] = s.[WarehouseClassCode-7300],
       t.[ItemDiscGroup                 ] = s.[ItemDiscGroup-14],
       t.[WTBAWineColor                 ] = s.[WTBAWineColor-87025],
       t.[WTUSCOLANo                    ] = s.[WTUSCOLANo-88500],
       t.[WTBAOriginRegionCode-87005    ] = s.[WTBAOriginRegionCode-87005],
       t.[WTBAVarietalCode              ] = s.[WTBAVarietalCode-87007],
       t.[WTBABrandNo                   ] = s.[WTBABrandNo-87150],
       t.[WTBAVintageCode               ] = s.[WTBAVintageCode-87000],
       t.[WTBAAlcoholTypeCode           ] = s.[WTBAAlcoholTypeCode-87015],
       t.[WCINV04PurchaserCode          ] = s.[WCINV04PurchaserCode-50010],
       t.[WTBALabelCode                 ] = s.[WTBALabelCode-87080],
       t.[CountryRegionofOriginCode     ] = s.[CountryRegionofOriginCode-95],
       t.[WCINV14ItemPortfolio          ] = s.[WCINV14ItemPortfolio-50150],
       t.[GenProdPostingGroup           ] = s.[GenProdPostingGroup-91],
       t.[InventoryPostingGroup         ] = s.[InventoryPostingGroup-11],
       t.[VendorNo                      ] = s.[VendorNo-31],
       t.[WTBABottleSize                ] = s.[WTBABottleSize-87020],
       t.[$Company                      ] = s.[$Company],
       t.[AllowInvoiceDisc              ] = s.[AllowInvoiceDisc-15],
       t.[AllowOnlineAdjustment         ] = s.[AllowOnlineAdjustment-30],
       t.[BaseUnitofMeasure             ] = s.[BaseUnitofMeasure-8],
       t.[Blocked                       ] = s.[Blocked-54],
       t.[Description                   ] = s.[Description-3],
       t.[ItemCategoryCode              ] = s.[ItemCategoryCode-5702],
       t.[LastDateModified              ] = s.[LastDateModified-62],
       t.[LastDateTimeModified          ] = s.[LastDateTimeModified-61],
       t.[LastDirectCost                ] = s.[LastDirectCost-25],
       t.[LastTimeModified              ] = s.[LastTimeModified-63],
       t.[NetWeight                     ] = s.[NetWeight-42],
       t.[PurchasingBlocked             ] = s.[PurchasingBlocked-8004],
       t.[SalesUnitofMeasure            ] = s.[SalesUnitofMeasure-5425],
       t.[SearchDescription             ] = s.[SearchDescription-4],
       t.[StandardCost                  ] = s.[StandardCost-24],
       t.[SystemCreatedAt               ] = s.[SystemCreatedAt-2000000001],
       t.[SystemCreatedBy               ] = s.[SystemCreatedBy-2000000002],
       t.[SystemModifiedAt              ] = s.[SystemModifiedAt-2000000003],
       t.[UnitCost                      ] = s.[UnitCost-22],
       t.[UnitListPrice                 ] = s.[UnitListPrice-38],
       t.[UnitPrice                     ] = s.[UnitPrice-18],
       t.[UnitVolume                    ] = s.[UnitVolume-44],
       t.[UseCrossDocking               ] = s.[UseCrossDocking-7384],
       t.[WCAR06SalesCommissionable     ] = s.[WCAR06SalesCommissionable-50100],
       t.[WCINT02ExportedtoJFHB         ] = s.[WCINT02ExportedtoJFHB-50250],
       t.[WCINT03ExportedtoMMK          ] = s.[WCINT03ExportedtoMMK-50280],
       t.[WCINT04PABlocked              ] = s.[WCINT04PABlocked-50650],
       t.[WCINT04SplitAllowed           ] = s.[WCINT04SplitAllowed-50651],
       t.[WCINV08AgedInventory          ] = s.[WCINV08AgedInventory-50043],
       t.[WCINV08ExpectedQtyfromVend    ] = s.[WCINV08ExpectedQtyfromVend-50044],
       t.[WCINV08NAforSalesreps         ] = s.[WCINV08NAforSalesreps-50046],
       t.[WCINV08SuggestedRetailPrice   ] = s.[WCINV08SuggestedRetailPrice-50047],
       t.[WCINV19DonotPrintonCat        ] = s.[WCINV19DonotPrintonCat-50520],
       t.[WCSAL04AllowPalletDiscount    ] = s.[WCSAL04AllowPalletDiscount-50121],
       t.[WCSAL04AllowSampleDiscount    ] = s.[WCSAL04AllowSampleDiscount-50120],
       t.[WCTEWPrestige                 ] = s.[WCTEWPrestige-50000],
       t.[WTBAAlcoholContent            ] = s.[WTBAAlcoholContent-87030],
       t.[WTBABiodynamic                ] = s.[WTBABiodynamic-87064],
       t.[WTBACasePack                  ] = s.[WTBACasePack-87010],
       t.[WTBACasesperPallet            ] = s.[WTBACasesperPallet-87096],
       t.[WTBACasesperPalletLayer       ] = s.[WTBACasesperPalletLayer-87090],
       t.[WTBADoNotAllowSamples         ] = s.[WTBADoNotAllowSamples-87700],
       t.[WTBAExclfromSampleBudget      ] = s.[WTBAExclfromSampleBudget-87701],
       t.[WTBALastDirectCostBottle      ] = s.[WTBALastDirectCostBottle-87116],
       t.[WTBALastDirectCostCase        ] = s.[WTBALastDirectCostCase-87115],
       t.[WTBALayersperPallet           ] = s.[WTBALayersperPallet-87095],
       t.[WTBAOrganic                   ] = s.[WTBAOrganic-87063],
       t.[WTBAProof                     ] = s.[WTBAProof-87031],
       t.[WTBASalesOrderReview          ] = s.[WTBASalesOrderReview-87850],
       t.[WTBAStandardCostBottle        ] = s.[WTBAStandardCostBottle-87121],
       t.[WTBAStandardCostCase          ] = s.[WTBAStandardCostCase-87120],
       t.[WTBAUnitCostBottle            ] = s.[WTBAUnitCostBottle-87111],
       t.[WTBAUnitCostCase              ] = s.[WTBAUnitCostCase-87110],
       t.[WTBAVegan                     ] = s.[WTBAVegan-87062],
       t.[WTIAAllocate                  ] = s.[WTIAAllocate-90100],
       t.[WTIAAllocationReservInt       ] = s.[WTIAAllocationReservInt-90102],
       t.[WTIAAllocationisCurrent       ] = s.[WTIAAllocationisCurrent-90104],
       t.[WTIAFullAllocationRequired    ] = s.[WTIAFullAllocationRequired-90101],
       t.[WTIALimitingQtyperSource      ] = s.[WTIALimitingQtyperSource-90130],
       t.[WTIALimitingUnitType          ] = s.[WTIALimitingUnitType-90140],
       t.[WTUSDonotPricePost            ] = s.[WTUSDonotPricePost-88800],
       t.[WTUSSalesLimitation           ] = s.[WTUSSalesLimitation-88030],
       t.[systemId                      ] = s.[systemId-2000000000],
       t.[timestamp                     ] = s.[timestamp-0],
       t.[UpdateDate                    ] = getdate() 
	   FROM [WH].[gold].[Item27] t
	   JOIN [Rahat_LH].[dbo].[item] s
	   ON t.[No] = s.[No-1]
	   WHERE 
	   ISNULL(t.[WTIAAllocJnlUnitofMeasure     ],'') <> ISNULL(s.[WTIAAllocJnlUnitofMeasure-90107],   '') OR
	   ISNULL(t.[VendorItemNo                  ],'') <> ISNULL(s.[VendorItemNo-32],                   '') OR
       ISNULL(t.[WCINV08WHItemNo               ],'') <> ISNULL(s.[WCINV08WHItemNo-50045],             '') OR
       ISNULL(t.[WTUSSalesLimAllocMethod       ],'') <> ISNULL(s.[WTUSSalesLimAllocMethod-88035],     '') OR
       ISNULL(t.[LeadTimeCalculation           ],'') <> ISNULL(s.[LeadTimeCalculation-33],            '') OR
       ISNULL(t.[WTBAClosureTypeCode           ],'') <> ISNULL(s.[WTBAClosureTypeCode-87065],         '') OR
       ISNULL(t.[WTBASubRegionCode             ],'') <> ISNULL(s.[WTBASubRegionCode-87006],           '') OR
       ISNULL(t.[WarehouseClassCode            ],'') <> ISNULL(s.[WarehouseClassCode-7300],           '') OR
       ISNULL(t.[ItemDiscGroup                 ],'') <> ISNULL(s.[ItemDiscGroup-14],                  '') OR
       ISNULL(t.[WTBAWineColor                 ],'') <> ISNULL(s.[WTBAWineColor-87025],               '') OR
       ISNULL(t.[WTUSCOLANo                    ],'') <> ISNULL(s.[WTUSCOLANo-88500],                  '') OR
       ISNULL(t.[WTBAOriginRegionCode-87005    ],'') <> ISNULL(s.[WTBAOriginRegionCode-87005],        '') OR
       ISNULL(t.[WTBAVarietalCode              ],'') <> ISNULL(s.[WTBAVarietalCode-87007],            '') OR
       ISNULL(t.[WTBABrandNo                   ],'') <> ISNULL(s.[WTBABrandNo-87150],                 '') OR
       ISNULL(t.[WTBAVintageCode               ],'') <> ISNULL(s.[WTBAVintageCode-87000],             '') OR
       ISNULL(t.[WTBAAlcoholTypeCode           ],'') <> ISNULL(s.[WTBAAlcoholTypeCode-87015],         '') OR
       ISNULL(t.[WCINV04PurchaserCode          ],'') <> ISNULL(s.[WCINV04PurchaserCode-50010],        '') OR
       ISNULL(t.[WTBALabelCode                 ],'') <> ISNULL(s.[WTBALabelCode-87080],               '') OR
       ISNULL(t.[CountryRegionofOriginCode     ],'') <> ISNULL(s.[CountryRegionofOriginCode-95],      '') OR
       ISNULL(t.[WCINV14ItemPortfolio          ],'') <> ISNULL(s.[WCINV14ItemPortfolio-50150],        '') OR
       ISNULL(t.[GenProdPostingGroup           ],'') <> ISNULL(s.[GenProdPostingGroup-91],            '') OR
       ISNULL(t.[InventoryPostingGroup         ],'') <> ISNULL(s.[InventoryPostingGroup-11],          '') OR
       ISNULL(t.[VendorNo                      ],'') <> ISNULL(s.[VendorNo-31],                       '') OR
       ISNULL(t.[WTBABottleSize                ],'') <> ISNULL(s.[WTBABottleSize-87020],              '') OR
       ISNULL(t.[$Company                      ],'') <> ISNULL(s.[$Company],                          '') OR
      ISNULL(t.[AllowInvoiceDisc],           0) <> ISNULL(s.[AllowInvoiceDisc-15],           0) OR
       ISNULL(t.[AllowOnlineAdjustment],      0) <> ISNULL(s.[AllowOnlineAdjustment-30],       0) OR
       ISNULL(t.[BaseUnitofMeasure             ],'') <> ISNULL(s.[BaseUnitofMeasure-8],               '') OR
       ISNULL(t.[Blocked],                    0) <> ISNULL(s.[Blocked-54],                     0) OR
       ISNULL(t.[Description                   ],'') <> ISNULL(s.[Description-3],                     '') OR
       ISNULL(t.[ItemCategoryCode              ],'') <> ISNULL(s.[ItemCategoryCode-5702],             '') OR
       ISNULL(t.[LastDateModified],    '1900-01-01') <> ISNULL(s.[LastDateModified-62],        '1900-01-01') OR
       ISNULL(t.[LastDateTimeModified],'1900-01-01') <> ISNULL(s.[LastDateTimeModified-61],    '1900-01-01') OR
       Round(ISNULL(t.[LastDirectCost                ],-1),2) <> Round(ISNULL(s.[LastDirectCost-25],                 -1), 2) OR
       ISNULL(t.[LastTimeModified],    '') <> ISNULL(s.[LastTimeModified-63],        '') OR
       Round(ISNULL(t.[NetWeight                     ],-1),2) <> Round(ISNULL(s.[NetWeight-42],                      -1), 2) OR
       ISNULL(t.[PurchasingBlocked],          0) <> ISNULL(s.[PurchasingBlocked-8004],         0) OR
       ISNULL(t.[SalesUnitofMeasure            ],'') <> ISNULL(s.[SalesUnitofMeasure-5425],           '') OR
       ISNULL(t.[SearchDescription             ],'') <> ISNULL(s.[SearchDescription-4],               '') OR
       ISNULL(t.[StandardCost],               0) <> ISNULL(s.[StandardCost-24],                0) OR
       ISNULL(t.[SystemCreatedAt],     '1900-01-01') <> ISNULL(s.[SystemCreatedAt-2000000001], '1900-01-01') OR
       ISNULL(t.[SystemCreatedBy               ],'') <> ISNULL(s.[SystemCreatedBy-2000000002],        '') OR
       ISNULL(t.[SystemModifiedAt],    '1900-01-01') <> ISNULL(s.[SystemModifiedAt-2000000003],'1900-01-01') OR
       ROUND(ISNULL(t.[UnitCost], -1), 2) <> ROUND(ISNULL(s.[UnitCost-22], -1), 2)						 OR
       ISNULL(t.[UnitListPrice],              0) <> ISNULL(s.[UnitListPrice-38],               0) OR
       ISNULL(t.[UnitPrice],                  0) <> ISNULL(s.[UnitPrice-18],                   0) OR
       ROUND(ISNULL(t.[UnitVolume],               -1), 2) <> ROUND(ISNULL(s.[UnitVolume-44],                -1), 2) OR
      ISNULL(t.[UseCrossDocking],            0) <> ISNULL(s.[UseCrossDocking-7384],           0) OR
       ISNULL(t.[WCAR06SalesCommissionable],  0) <> ISNULL(s.[WCAR06SalesCommissionable-50100],0) OR
       ISNULL(t.[WCINT02ExportedtoJFHB],      0) <> ISNULL(s.[WCINT02ExportedtoJFHB-50250],   0) OR
       ISNULL(t.[WCINT03ExportedtoMMK],       0) <> ISNULL(s.[WCINT03ExportedtoMMK-50280],     0) OR
       ISNULL(t.[WCINT04PABlocked],           0) <> ISNULL(s.[WCINT04PABlocked-50650],         0) OR
       ISNULL(t.[WCINT04SplitAllowed],        0) <> ISNULL(s.[WCINT04SplitAllowed-50651],      0) OR
       ISNULL(t.[WCINV08AgedInventory],       0) <> ISNULL(s.[WCINV08AgedInventory-50043],     0) OR
      ISNULL(t.[WCINV08ExpectedQtyfromVend], 0) <> ISNULL(s.[WCINV08ExpectedQtyfromVend-50044],0) OR
       ISNULL(t.[WCINV08NAforSalesreps],      0) <> ISNULL(s.[WCINV08NAforSalesreps-50046],    0) OR
       ROUND(ISNULL(t.[WCINV08SuggestedRetailPrice],-1),2) <> ROUND(ISNULL(s.[WCINV08SuggestedRetailPrice-50047],-1),2) OR
       ISNULL(t.[WCINV19DonotPrintonCat],     0) <> ISNULL(s.[WCINV19DonotPrintonCat-50520],   0) OR
       ISNULL(t.[WCSAL04AllowPalletDiscount], 0) <> ISNULL(s.[WCSAL04AllowPalletDiscount-50121],0) OR
       ISNULL(t.[WCSAL04AllowSampleDiscount], 0) <> ISNULL(s.[WCSAL04AllowSampleDiscount-50120],0) OR
       ISNULL(t.[WCTEWPrestige],              0) <> ISNULL(s.[WCTEWPrestige-50000],             0) OR
       ROUND(ISNULL(t.[WTBAAlcoholContent],       -1), 2) <> ROUND(ISNULL(s.[WTBAAlcoholContent-87030],     -1), 2) OR
       ISNULL(t.[WTBABiodynamic],             0) <> ISNULL(s.[WTBABiodynamic-87064],            0) OR
       ROUND(ISNULL(t.[WTBACasePack], -1), 2) <> ROUND(ISNULL(s.[WTBACasePack-87010], -1), 2) OR
       ISNULL(t.[WTBACasesperPallet],         0) <> ISNULL(s.[WTBACasesperPallet-87096],        0) OR
       ISNULL(t.[WTBACasesperPalletLayer],    0) <> ISNULL(s.[WTBACasesperPalletLayer-87090],   0) OR
       ISNULL(t.[WTBADoNotAllowSamples],      0) <> ISNULL(s.[WTBADoNotAllowSamples-87700],     0) OR
       ISNULL(t.[WTBAExclfromSampleBudget],   0) <> ISNULL(s.[WTBAExclfromSampleBudget-87701],  0) OR
      ROUND(ISNULL(t.[WTBALastDirectCostBottle], -1), 2) <> ROUND(ISNULL(s.[WTBALastDirectCostBottle-87116],-1), 2) OR
       ROUND(ISNULL(t.[WTBALastDirectCostCase],   -1), 2) <> ROUND(ISNULL(s.[WTBALastDirectCostCase-87115], -1), 2) OR
      ISNULL(t.[WTBALayersperPallet],        0) <> ISNULL(s.[WTBALayersperPallet-87095],        0) OR
      ISNULL(t.[WTBAOrganic],                0) <> ISNULL(s.[WTBAOrganic-87063],               0) OR
       ROUND(ISNULL(t.[WTBAProof],                -1), 2) <> ROUND(ISNULL(s.[WTBAProof-87031],              -1), 2) OR
      ISNULL(t.[WTBASalesOrderReview],       0) <> ISNULL(s.[WTBASalesOrderReview-87850],       0) OR
       ISNULL(t.[WTBAStandardCostBottle        ],0) <> ISNULL(s.[WTBAStandardCostBottle-87121],     0) OR
       ISNULL(t.[WTBAStandardCostCase          ],0) <> ISNULL(s.[WTBAStandardCostCase-87120],      0) OR
       ROUND(ISNULL(t.[WTBAUnitCostBottle], -1), 2) <> ROUND(ISNULL(s.[WTBAUnitCostBottle-87111], -1), 2) OR
       ROUND(ISNULL(t.[WTBAUnitCostCase],   -1), 2) <> ROUND(ISNULL(s.[WTBAUnitCostCase-87110],   -1), 2) OR
       ISNULL(t.[WTBAVegan],                  0) <> ISNULL(s.[WTBAVegan-87062],                  0) OR
      ISNULL(t.[WTIAAllocate],               0) <> ISNULL(s.[WTIAAllocate-90100],               0) OR
       ISNULL(t.[WTIAAllocationReservInt       ],'') <> ISNULL(s.[WTIAAllocationReservInt-90102],     '') OR
       ISNULL(t.[WTIAAllocationisCurrent],    0) <> ISNULL(s.[WTIAAllocationisCurrent-90104],    0) OR
       ISNULL(t.[WTIAFullAllocationRequired], 0) <> ISNULL(s.[WTIAFullAllocationRequired-90101], 0) OR
       ISNULL(t.[WTIALimitingQtyperSource],   0) <> ISNULL(s.[WTIALimitingQtyperSource-90130],   0) OR
       ISNULL(t.[WTIALimitingUnitType          ],'') <> ISNULL(s.[WTIALimitingUnitType-90140],        '') OR
       ISNULL(t.[WTUSDonotPricePost],         0) <> ISNULL(s.[WTUSDonotPricePost-88800],         0) OR
       ISNULL(t.[WTUSSalesLimitation           ],'') <> ISNULL(s.[WTUSSalesLimitation-88030],         '') OR
       ISNULL(t.[systemId                      ],'') <> ISNULL(s.[systemId-2000000000],               '') OR
	   ISNULL(t.[timestamp],                  0) <> ISNULL(s.[timestamp-0],                      0);

	  
	  --Delete
	    PRINT 'Delete STARTED';
		Delete t from [WH].[gold].[Item27] t
		left join  [Rahat_LH].[dbo].[item] s 
		on t.[No] = s.[No-1]
		where s.[No-1] is null ;
		
end