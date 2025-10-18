**🏥 Healthcare Data Analysis Using SQL**

This project involves analyzing hospital admission data to uncover key insights about patient health conditions, admission patterns, and outcomes using MySQL Workbench.
The dataset contains detailed information about patient demographics, diagnoses, comorbidities, and treatment outcomes.

**📘 Project Overview**

The goal of this project is to perform data exploration and clinical insights extraction using SQL.
Through a series of structured SQL queries, I analyzed relationships between diseases, patient behavior, and outcomes — helping to understand hospital performance and patient profiles.

**🗂️ Dataset Information**

Table Name: hdhi_admission_data

Key Columns:

AGE, GENDER, RURAL
TYPE_OF_ADMISSION_EMERGENCY_OPD

OUTCOME

DM_Diabetees_Mellitus, HTN_HYPERTENSION, CAD_CORONARY_ARTERY_DISEASE and other health-related fields.

**🔍 SQL Analysis Performed**

1. Patient-Level Analysis

Listed all patients with OUTCOME = 'DISCHARGE'

Filtered patients below 30 with Diabetes

Found patients with both CKD and Heart Failure

2. Admission Insights

Counted admissions by Emergency vs OPD

Calculated average duration of stay

Analyzed monthly admissions trends

3. Disease-Specific Queries

Count of patients with STEMI, ACS, CKD, CAD, Anaemia

Identified patients with multiple conditions (e.g., DM + HTN + CKD)

Retrieved patients with Urea > 50 or Creatinine > 1.5

4. Risk and Test Analysis

Patients with high glucose (>200)

Cases with low platelets (<150,000) and high TLC (>11,000)

Calculated average haemoglobin by gender among severe anaemia cases

5. Outcome-Based Analysis

Top 5 patients with longest hospital stays

Count of patients developing CVA, AF, VT, PSVT

Analysis of cardiogenic shock and pulmonary embolism cases

**⚙️ Tools Used**

SQL Workbench / MySQL

Excel (for initial dataset cleaning)

**📈 Key Insights**

-Majority of admissions were via Emergency rather than OPD.

-Patients with Diabetes and Hypertension have higher CKD occurrence.

-Males showed slightly higher rates of Severe Anaemia.

-Patients with STEMI and Heart Failure had longer hospital stays.

-Elevated Urea/Creatinine levels indicated potential renal issues.
