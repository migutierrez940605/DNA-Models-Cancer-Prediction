----Cleaning DNA Models Result Data

---Vizualize data and Create a new table as copy from the original for Training 
SELECT *
FROM result

SELECT *
INTO result_test
FROM result;

CREATE TABLE result_test(
"Value" float,
"Models" varchar(100),
"DNA Data" varchar(100),
"Measures" varchar(100)
)
INSERT INTO result_test 
SELECT*
FROM result

SELECT *
FROM result_test

---Remove duplicates

SELECT* ,count(Models)
FROM result_test
GROUP BY Models, Value, [DNA Data],Measures
HAVING count(Models)>1
order by count(Models) desc

SELECT *,
RN=ROW_NUMBER() OVER (PARTITION BY Models, Value, [DNA Data],Measures order by Models)
FROM result_test

WITH Duplicate1_CTE AS
(
SELECT Models, Value, [DNA Data], Measures,
ROW_NUMBER() OVER (PARTITION BY Models, Value, [DNA Data],Measures order by Models) AS RN
FROM result_test
)
DELETE
FROM  Duplicate1_CTE
WHERE RN>1

---Standardize the Data
--Create a new column with type of complexity according to the IR measure. The data sets that have measure close to 1 are of complexity I, the otherwise are of complexity II.
SELECT*,
CASE
    WHEN [DNA DATA]='DLBCL' THEN 'Complexity I'
	WHEN [DNA DATA]='SMK' THEN 'Complexity I'
	ELSE 'Complexity II'
END AS 'Type Complexity'
FROM result_test

ALTER TABLE result_test
ADD "Type Complexity" varchar(100)

UPDATE result_test
SET [Type Complexity]=
(CASE
    WHEN [DNA DATA]='DLBCL' THEN 'Complexity I'
	WHEN [DNA DATA]='SMK' THEN 'Complexity I'
	ELSE 'Complexity II'
END)
FROM result_test

--Modify the measure column translating the characters to English sensitivity (Se), specificity (Es), and accuracy
SELECT*,
CASE
    WHEN Measures='Exactitud' THEN 'Accuracy'
	WHEN Measures='Sensibilidad' THEN 'Sensitivity'
	ELSE 'Specificity'
END 
FROM result_test

UPDATE result_test
SET Measures=
(CASE
    WHEN Measures='Exactitud' THEN 'Accuracy'
	WHEN Measures='Sensibilidad' THEN 'Sensitivity'
	ELSE 'Specificity'
END )
FROM result_test

 