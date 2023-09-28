SELECT TOP(100) *
FROM asd_data

SELECT COUNT(*)
FROM asd_data

-- Which range of age has the highest ASB traits potential? 3y > 2y > 1y
WITH age AS (SELECT Age_By_Month, 
	CASE
		WHEN Age_By_Month <= 12 THEN '0-12 Months'
		WHEN Age_By_Month <= 24 THEN '13-24 Months'
		ELSE '25-36 Months'
	END AS Age_Range
FROM asd_data)


SELECT Age_Range, COUNT(*)
FROM age
GROUP BY Age_Range
ORDER BY COUNT(*) DESC

--Which lowest number in test score vs ASD Diagnosis?
SELECT MIN(Test_Score)
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'

SELECT Test_Score, COUNT(*) AS Total_ASD_Cases
FROM asd_data
WHERE Test_Score >= 4
GROUP BY Test_Score


-- Total cases with potential ASD Traits: 725/1050
SELECT COUNT(*) AS Total_ASD_Cases
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'
GROUP BY Potential_ASD_Traits


-- Sex vs ASD Traits: Male > Female
SELECT sex, COUNT(*)
FROM asd_data
GROUP BY sex

SELECT sex, COUNT(*)
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'
GROUP BY sex

SELECT sex, COUNT(*)
FROM asd_data
WHERE Potential_ASD_Traits ='No'
GROUP BY sex

-- Ethnicity vs ASD Traits: White European and Asian
SELECT ethnicity, COUNT(*)
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'
GROUP BY ethnicity
ORDER BY COUNT(*) DESC

-- Jaundice when born vs ASD Traits: 214/725, there is no association between jaundice when born and ASD Diagnosis
SELECT Jaundice, COUNT(*)
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'
GROUP BY Jaundice
ORDER BY COUNT(*) DESC


-- Family history in ASD vs ASD Traits: 115/725, there is no association between family history and ASD Diagnosis
SELECT Family_Member_With_ASD, COUNT(*)
FROM asd_data
WHERE Potential_ASD_Traits ='Yes'
GROUP BY Family_Member_With_ASD
ORDER BY COUNT(*) DESC

