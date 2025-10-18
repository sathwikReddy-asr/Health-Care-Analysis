--Platform used: My SQL Workbench
--Table used: hdhi_admission_data
--Source: Kaggle

# 1-List all patients records where outcome='discharge' ?
SELECT * 
FROM hdhi_admission_data
WHERE OUTCOME = 'DISCHARGE';

# 2-Find the number of patients who were admitted through EMERGENCY vs OPD ?
SELECT TYPE_OF_ADMISSION_EMERGENCY_OPD,COUNT(*) AS TOTAL
FROM hdhi_admission_data
WHERE TYPE_OF_ADMISSION_EMERGENCY_OPD IN ('E','O')
GROUP BY 1;

SELECT 
SUM(CASE WHEN TYPE_OF_ADMISSION_EMERGENCY_OPD = 'E' THEN 1 ELSE 0 END) AS EMERGENCY,
SUM(CASE WHEN TYPE_OF_ADMISSION_EMERGENCY_OPD = 'O' THEN 1 ELSE 0 END) AS OPD
FROM hdhi_admission_data;
ALTER TABLE hdhi_admission_data
RENAME COLUMN `DM(Diabetes Mellitus)` TO DM_Diabetees_Mellitus;

# 3-Retrieve all records where AGE is less than 30 and has Diabetes Mellitus (DM = 1) ?
SELECT *
 FROM hdhi_admission_data
 WHERE AGE <30 AND DM_Diabetees_Mellitus = 1;

# 4-Find the average hospital stay duration (DURATION OF STAY) ?
 SELECT AVG(DURATION_OF_STAY)
 FROM hdhi_admission_data;

 # 5-List all patients who had CKD (Chronic Kidney Disease) and Heart Failure together ?
 SELECT *
 FROM hdhi_admission_data
 WHERE CKD_CHRONIC_KIDNEY_DISEASE = 1 AND HEART_FAILURE = 1;

 # 6-Count how many patients had STEMI (ST Elevation Myocardial Infarction) ?
 SELECT COUNT(*) AS COUNT_OF_STEMI
 FROM hdhi_admission_data
 WHERE STEMI_ST_ELEVATION_MYOCADIAL_INFARCTION = 1;

 # 7-Retrieve patients with Severe Anaemia and their Haemoglobin (HB) levels ?
 SELECT MRD_NO,AGE,GENDER,RURAL,HB_HAEMOGLOBIN
 FROM hdhi_admission_data
 WHERE SEVERE_ANAEMIA;

 # 8-Find patients whose Glucose levels are above 200 ?
 SELECT * 
 FROM hdhi_admission_data
 WHERE GLUCOSE > 200;

 # 9-Count patients who had Hypertension (HTN) but no Diabetes ?
 SELECT COUNT(*) AS TOTAL_COUNT
 FROM hdhi_admission_data
 WHERE HTN_HYPERTENSION = 1 AND DM_Diabetees_Mellitus = 0;

 # 10-List distinct values of OUTCOME observed in the dataset ?
 SELECT DISTINCT(OUTCOME)
 FROM hdhi_admission_data;

 # 11-Find the minimum, maximum, and average EF (Ejection Fraction) among patients ?
 SELECT MAX(EF_EJECTION_FRACTION) AS MAXIMUM,MIN(EF_EJECTION_FRACTION) AS MINIMUM,AVG(EF_EJECTION_FRACTION) AS AVERAGE
 FROM hdhi_admission_data;

 # 12-Retrieve the patients who had both CAD and Valvular Heart Disease ?
 SELECT * 
 FROM hdhi_admission_data
 WHERE CAD_CORONARY_ARTERY_DISEASE = 1 AND VALVULAR_VALVULAR_HEART_DISEASE = 1;

 # 13-Count the number of patients with ACS (Acute Coronary Syndrome) grouped by GENDER ?
 SELECT GENDER,COUNT(*) AS TOTAL_COUNT
 FROM hdhi_admission_data
 WHERE ACS_ACUTE_CORONARY_SYNDROME = 1
 GROUP BY 1;

 # 14-List patients who developed CVA INFARCT or CVA BLEED during admission ?
 SELECT *
 FROM hdhi_admission_data
 WHERE CVA_CEREBRO_VASCULAR_ACCIDENT_INFRACT = 1 OR CVA_CEREBROVASCULAR_ACCIDENT_BLEED = 1;

 # 15-Find the total number of patients who were admitted in each Month-Year ?
 SELECT MONTH_YEAR,COUNT(*) AS TOTAL_COUNT
 FROM hdhi_admission_data
 GROUP BY 1;

# 16-List all patients who had both (HFREF) and RAISED CARDIAC ENZYMES.
 select * 
 from hdhi_admission_data
 where RAISED_CARDIAC_ENZYMES = 1 and HFREF_HEART_FAILURE_WITH_REDUCED_EJECTION_FRACTION = 1;

 # 17-Find all patients with Platelets < 150,000 and TLC > 11,000, indicating potential infection or blood disorder ?
 select * 
 from hdhi_admission_data
 where TLC_TOTAL_LEUKOCYTES_COUNT > 11 and PLATELETS <15;

 # 18-Count the number of patients who are SMOKERS and consume ALCOHOL and also have CAD ?
 select * 
 from hdhi_admission_data
 where SMOKING = 1 and ALCOHOL = 1 and CAD_CORONARY_ARTERY_DISEASE = 1;

 # 19-Retrieve all patients with UREA > 50 or CREATININE > 1.5 to identify possible renal impairment ?
 select * 
 from hdhi_admission_data 
 where UREA >50 and CREATININE > 1.5;

 # 20-List patients above 60 years who experienced STEMI ?
 select *
 from hdhi_admission_data
 where AGE > 60 and STEMI_ST_ELEVATION_MYOCADIAL_INFARCTION = 1;

 # 21-Count patients who have DM, HTN, and CKD simultaneously ?
 select count(*) as total_count
 from hdhi_admission_data
 where DM_Diabetees_Mellitus = 1 and HTN_HYPERTENSION = 1 and CKD_CHRONIC_KIDNEY_DISEASE = 1;

 # 22-Find the top 5 longest DURATION OF STAY and their corresponding OUTCOME ?
select *
from hdhi_admission_data
order by DURATION_OF_STAY DESC
limit 5;

# 23-Retrieve patients who had CARDIOGENIC SHOCK or PULMONARY EMBOLISM during admission ?
select * 
from hdhi_admission_data
where CARDIOGENIC_SHOCK = 1 and PULMONARY_EMBOLISM = 1;

# 24-Count how many patients developed AF (Atrial Fibrillation), VT (Ventricular Tachycardia), or PSVT ?
select count(*) as total_count
from hdhi_admission_data
where AF_ATRIAL_FIBRILATION = 1 and (VT_VENTRICULAR_TACHYCARDIA = 1 or PSVT_PAROXYSMAL_SUPRA_VENTRICULAR_TACHYCARDIA = 1);

# 25-Find the average HB (Haemoglobin) for male vs female patients with SEVERE ANAEMIA ?
select GENDER,round(avg(HB_HAEMOGLOBIN),2)
from hdhi_admission_data
where SEVERE_ANAEMIA = 1
group by GENDER;
