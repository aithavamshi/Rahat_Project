--Exec WH.gold.Dim_GLEntry17



CREATE    PROCEDURE gold.Dim_GLEntry17

AS
BEGIN

    select 
	
	[GenProdPostingGroup-50]    as GenProdPostingGroup,
	[GenBusPostingGroup-49]     as GenBusPostingGroup,
	[GlobalDimension1Code-23]   as GlobalDimension1Code,
	[SourceNameWC-50000]        as SourceNameWC,
	[SourceNo-58]               as SourceNo,
	[SourceCode-28]             as SourceCode,
	[Description-7]    			as Description,
	[BalAccountType-51] 		as BalAccountType,
	[DocumentType-5] 			as DocumentType,
	[SourceCurrencyAmount-18] 	as SourceCurrencyAmount,
	[SourceType-57] 			as SourceType,
	[Amount-17] 				as Amount,
	[DocumentDate-55] 			as DocumentDate,
	[EntryNo-1] 				as EntryNo,
	[PostingDate-4] 			as PostingDate,
	[InsertDate] 				as InsertDate,
	[UpdateDate] 				as UpdateDate
	into #TempGLEntry17
	from WH.silver.GLEntry17 

        ---------------------------------------------------
        -- STEP 1: INSERT NEW RECORDS
        ---------------------------------------------------
            INSERT INTO gold.GLEntry17 (

			GenProdPostingGroup, 
			GenBusPostingGroup, 
			GlobalDimension1Code, 
			SourceNameWC, 
			SourceNo, 
			SourceCode, 
			Description, 
			BalAccountType, 
			DocumentType, 
			SourceCurrencyAmount, 
			SourceType, 
			Amount, 
			DocumentDate,
            EntryNo	,		
			PostingDate, 
			InsertDate  
    )
    SELECT
		s.[GenProdPostingGroup],
		s.[GenBusPostingGroup],
		s.[GlobalDimension1Code],
		s.[SourceNameWC],
		s.[SourceNo],
		s.[SourceCode],
		s.[Description],
		s.[BalAccountType],
		s.[DocumentType],
		s.[SourceCurrencyAmount],
		s.[SourceType],
		s.[Amount],
		s.[DocumentDate],
		s.[EntryNo],
		s.[PostingDate],
		GETDATE()   
    FROM #TempGLEntry17 s
    LEFT JOIN gold.GLEntry17 t
        ON s.[EntryNo] = t.EntryNo
    WHERE t.EntryNo IS NULL
      AND s.[EntryNo] IS NOT NULL;


        ---------------------------------------------------
        -- STEP 2: UPDATE CHANGED RECORDS
        ---------------------------------------------------
				UPDATE t
		SET
			t.[GenProdPostingGroup]		 = s.[GenProdPostingGroup],
			t.[GenBusPostingGroup] 		 = s.[GenBusPostingGroup],
			t.[GlobalDimension1Code] 	 = s.[GlobalDimension1Code],
			t.[SourceNameWC] 			 = s.[SourceNameWC],
			t.[SourceNo] 				 = s.[SourceNo],
			t.[SourceCode] 				 = s.[SourceCode],
			t.[Description] 			 = s.[Description],
			t.[BalAccountType] 			 = s.[BalAccountType],
			t.[DocumentType] 			 = s.[DocumentType],
			t.[SourceCurrencyAmount] 	 = s.[SourceCurrencyAmount],
			t.[SourceType] 				 = s.[SourceType],
			t.[Amount] 					 = s.[Amount],
			t.[DocumentDate] 			 = s.[DocumentDate],
			t.[PostingDate] 			 = s.[PostingDate],
			t.[UpdateDate] 				 = GETDATE()
		FROM gold.GLEntry17 t
		JOIN #TempGLEntry17 s
			ON t.EntryNo = s.[EntryNo]
		WHERE
	    ISNULL(t.[GenProdPostingGroup], '')   				<> ISNULL(s.[GenProdPostingGroup], '') OR
	    ISNULL(t.[GenBusPostingGroup], '') 					<> ISNULL(s.[GenBusPostingGroup], '') OR
	    ISNULL(t.[GlobalDimension1Code], '') 			<> ISNULL(s.[GlobalDimension1Code], '') OR
	    ISNULL(t.[SourceNameWC], '') 						<> ISNULL(s.[SourceNameWC], '') OR
	    ISNULL(t.[SourceNo], '') 							<> ISNULL(s.[SourceNo], '') OR
	    ISNULL(t.[SourceCode], '') 							<> ISNULL(s.[SourceCode], '') OR
	    ISNULL(t.[Description], '') 						<> ISNULL(s.[Description], '') OR
	    ISNULL(t.[BalAccountType], '') 						<> ISNULL(s.[BalAccountType], '') OR
	    ISNULL(t.[DocumentType], '') 						<> ISNULL(s.[DocumentType], '') OR
	    ISNULL(t.[SourceType], '') 							<> ISNULL(s.[SourceType], '') OR
	    --ROUND(ISNULL(t.[SourceCurrencyAmount], 0.0),2) 	<> ROUND(ISNULL(s.[SourceCurrencyAmount], 0.0),2) OR
	    --ROUND(ISNULL(t.[Amount], 0.0),2)      		 	<> ROUND(ISNULL(s.[Amount], 0.0),2) OR
	    ISNULL(t.[DocumentDate], '1900-01-01') 				<> ISNULL(s.[DocumentDate], '1900-01-01') OR
	    ISNULL(t.[PostingDate], '1900-01-01') 				<> ISNULL(s.[PostingDate], '1900-01-01')

        ---------------------------------------------------
        -- STEP 3: DELETE MISSING RECORDS
        ---------------------------------------------------
        DELETE t 
        FROM [WH].[gold].[GLEntry17] t
        WHERE NOT EXISTS
        (
            SELECT 1
            FROM #TempGLEntry17 s
            WHERE s.[EntryNo] = t.EntryNo
        ); 
	
	DROP TABLE IF EXISTS #TempCustomer 
	
END;