--Query to create separate table for respiratory diseases based on diagnosis code: 
CREATE TABLE capstone2.RESPIRATORY_DISEASES AS

SELECT HOSP_KID
	,RECNUM
	,DXCCSR_RSP001
	,DXCCSR_RSP002
	,DXCCSR_RSP003
	,DXCCSR_RSP004
	,DXCCSR_RSP005
	,DXCCSR_RSP006
	,DXCCSR_RSP007
	,DXCCSR_RSP008
	,DXCCSR_RSP009
	,DXCCSR_RSP010
	,DXCCSR_RSP011
	,DXCCSR_RSP012
	,DXCCSR_RSP013
	,DXCCSR_RSP014
	,DXCCSR_RSP015
	,DXCCSR_RSP016
	,DXCCSR_RSP017
FROM `capstone - 400517. capstone2.kid_GPRS`

--QUERY FOR asthma cases by Gender 
SELECT FEMALE
	,count(*)
FROM `capstone - 400517. capstone2.table_core`
WHERE Asthma <> '0'
	AND Asthma IS NOT NULL
GROUP BY 1

--QUERY FOR asthma cases by INCOME 
SELECT ZIPINC_QRTL
	,count(*)
FROM `capstone - 400517. capstone2.table_core`
WHERE Asthma <> '0'
GROUP BY 1



--QUERY FOR asthma cases by race
SELECT RACE
	,count(*)
FROM `capstone - 400517. capstone2.table_core`
--WHERE Asthma <> '0'
GROUP BY 1
--query for asthma and infectious diseases 
SELECT Asthma
	,INF_All
	,COUNT(*) AS INFANDASTHMA
FROM `capstone - 400517. capstone2.table_core`
WHERE Asthma <> '0'
	AND INF_All <> 0
GROUP BY 1
	,2
--COMORBIDITY ANALYSIS FOR ASTHMA AND OTHER DISEASES 
SELECT RECNUM
FROM `capstone - 400517. capstone2.table_core`
WHERE (
		Blood_All <> 0
		OR MAL_All <> 0
		OR MBD_ALL <> 0
		OR END_ALL <> 0
		OR INF_All <> 0
		OR DIG_ALL <> 0
		OR NVS_ALL <> 0
		OR PRG_All <> 0
		OR CIR_All <> 0
		OR SKN_All <> 0
		OR MUS_All <> 0
		OR Tumor_All <> 0
		OR EYE_All <> 0
		OR EAR_All <> 0
		)
	AND Asthma <> '0'
--Data cleaning in gender
DELETE
FROM `capstone - 400517. capstone2.table_core`
WHERE FEMALE IN (
		'A'
		,'C'
		,'nan'
		);

--query to get total charges by payer
SELECT
	--RECNUM
	Pay1
	,sum(TotalChargesInteger)
FROM `capstone - 400517. capstone2.table_core`
WHERE Asthma <> '0'
	AND (
		Blood_All = 0
		AND MAL_All = 0
		AND MBD_ALL = 0
		AND END_ALL = 0
		AND INF_All = 0
		AND DIG_ALL = 0
		AND NVS_ALL = 0
		AND PRG_All = 0
		AND CIR_All = 0
		AND SKN_All = 0
		AND MUS_All = 0
		AND Tumor_All = 0
		AND EYE_All = 0
		AND EAR_All = 0
		)
	AND PAY1 IN (
		'1'
		,'2'
		)
--and race <> 'nan'
--and Race not like '%nan'
GROUP BY 1

--Query to check count of each endocrine disease 
SELECT SUM(CASE 
			WHEN CAST(DXCCSR_END001 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_1
	,SUM(CASE 
			WHEN CAST(DXCCSR_END002 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_2
	,SUM(CASE 
			WHEN CAST(DXCCSR_END003 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_3
	,SUM(CASE 
			WHEN CAST(DXCCSR_END004 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_4
	,SUM(CASE 
			WHEN CAST(DXCCSR_END006 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_6
	,SUM(CASE 
			WHEN CAST(DXCCSR_END007 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_7
	,SUM(CASE 
			WHEN CAST(DXCCSR_END008 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_8
	,SUM(CASE 
			WHEN CAST(DXCCSR_END009 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_9
	,SUM(CASE 
			WHEN CAST(DXCCSR_END010 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_10
	,SUM(CASE 
			WHEN CAST(DXCCSR_END011 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_11
	,SUM(CASE 
			WHEN CAST(DXCCSR_END012 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_12
	,SUM(CASE 
			WHEN CAST(DXCCSR_END013 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_13
	,SUM(CASE 
			WHEN CAST(DXCCSR_END014 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_14
	,SUM(CASE 
			WHEN CAST(DXCCSR_END015 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_15
	,SUM(CASE 
			WHEN CAST(DXCCSR_END016 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_16
	,SUM(CASE 
			WHEN CAST(DXCCSR_END017 AS INT64) = 1
				THEN 1
			ELSE 0
			END) AS Count_17
	,
FROM `capstone - 400517. capstone2.ENDOCRINE_DISEASES`
--Query to analyze asthma and length of stay
SELECT RECNUM
	,LOS
FROM `capstone - 400517. capstone2.table_core`
WHERE (
		Blood_All <> 0
		OR MAL_All <> 0
		OR MBD_ALL <> 0
		OR END_ALL <> 0
		OR INF_All <> 0
		OR DIG_ALL <> 0
		OR NVS_ALL <> 0
		OR PRG_All <> 0
		OR CIR_All <> 0
		OR SKN_All <> 0
		OR MUS_All <> 0
		OR Tumor_All <> 0
		OR EYE_All <> 0
		OR EAR_All <> 0
		)
	AND Asthma <> '0'
	AND Asthma IS NOT NULL
--Query to get count of individual infectious diseases
SELECT SUM(CASE 
			WHEN CAST(DXCCSR_INF001 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF001
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF002 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF002
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF003 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF003
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF004 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF004
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF005 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF005
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF006 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF006
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF007 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF007
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF008 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF008
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF009 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF009
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF010 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF010
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF011 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF011
	,SUM(CASE 
			WHEN CAST(DXCCSR_INF012 AS INT64) <> 0
				THEN 1
			ELSE 0
			END) AS Count_INF012
FROM `capstone - 400517. capstone2.Infectious_DISEASES`
--Query to clean total charges col.
--ALTER TABLE `capstone-400517.capstone2.table_core` 
--ADD COLUMN TotalChargesInteger INT64;
-- Copy data from the existing column to the new column
UPDATE `capstone - 400517. capstone2.table_core`
SET TotalChargesInteger = CASE 
		WHEN TOTCHG = 'nan'
			THEN NULL -- or set to a default value
		WHEN TOTCHG = 'A'
			THEN NULL
		WHEN TOTCHG = 'C'
			THEN NULL
		WHEN TOTCHG = 'TOTCHG'
			THEN NULL
		ELSE CAST(TOTCHG AS INT64)
		END
WHERE 1 = 1

--Query to get LOS AND TOTAL CHARGE FOR PATIENTS WITH ASTHMA AND OTHER DISEASES
SELECT t1.DXCCSR_RSP009
	,COUNT(*)
FROM (
	SELECT RECNUM
		,DXCCSR_Default_DX1
		,DXCCSR_RSP009
	FROM `capstone - 400517. capstone2.kid_GPRS` A11
	WHERE A11.DXCCSR_Default_DX1 = ‘RSP009’
	) t1
GROUP BY 1

--query to create separate table for CongenitalMalfunction
CREATE TABLE capstone2.CongenitalMalfunction_DISEASES AS

SELECT HOSP_KID
	,RECNUM
	,DXCCSR_MAL001
	,DXCCSR_MAL002
	,DXCCSR_MAL003
	,DXCCSR_MAL004
	,DXCCSR_MAL005
	,DXCCSR_MAL006
	,DXCCSR_MAL007
	,DXCCSR_MAL008
	,DXCCSR_MAL009
	,DXCCSR_MAL010
FROM `capstone - 400517. capstone2.kid_GPRS`

--query to make new table for infectious diseases 
CREATE TABLE capstone2.Infectious _DISEASES AS

SELECT HOSP_KID
	,RECNUM
	,DXCCSR_INF001
	,DXCCSR_INF002
	,DXCCSR_INF003
	,DXCCSR_INF004
	,DXCCSR_INF005
	,DXCCSR_INF006
	,DXCCSR_INF007
	,DXCCSR_INF008
	,DXCCSR_INF009
	,DXCCSR_INF010
	,DXCCSR_INF011
	,DXCCSR_INF012
FROM `capstone - 400517. capstone2.kid_GPRS`


--Query to make range for LOS
UPDATE capstone2.table_core
SET LOS_Range = CASE 
		WHEN LOS BETWEEN '0'
				AND '1'
			THEN '0-1'
		WHEN LOS BETWEEN '2'
				AND '3'
			THEN '2-3'
		WHEN LOS BETWEEN '4'
				AND '9'
			THEN '4-9'
		WHEN LOS > '10'
			THEN '10+'
		END
WHERE 1 = 1
--query to make range for total charges 
UPDATE capstone2.table_core
SET TotalChargeRange = CASE 
		WHEN TotalChargesInteger BETWEEN 0
				AND 12000
			THEN 1
		WHEN TotalChargesInteger BETWEEN 12001
				AND 20000
			THEN 2
		WHEN TotalChargesInteger BETWEEN 20001
				AND 40000
			THEN 3
		WHEN TotalChargesInteger BETWEEN 40001
				AND 80000
			THEN 4
		WHEN TotalChargesInteger > 80001
			THEN 5
		END
WHERE 1 = 1

