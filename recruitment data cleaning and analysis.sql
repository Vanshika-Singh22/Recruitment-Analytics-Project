CREATE TABLE Candidate_data(
     Age INT,
	 Gender VARCHAR(20),
	 EducationLevel VARCHAR(50),
	 ExperienceYears INT,
	 PreviousCompanies INT,
	 DistanceFromCompany DECIMAL(10,2),
	 InterviewScore INT,
	 SkillScore INT,
	 PersonalityScore INT,
	 RecruitmentStrategy VARCHAR(50),
	 HiringDecision VARCHAR(20)
);
SELECT * FROM  Candidate_data;

--DATA CLEANIONG:

--1. Checking of null value:
SELECT *
FROM Candidate_data
WHERE Age IS NULL
     OR Gender IS NULL
	 OR EducationLevel IS NULL;

--2. Checking for duplicate records:
SELECT *,
        COUNT(*)
FROM Candidate_data
GROUP BY Age, Gender, EducationLevel,
ExperienceYears,
          PreviousCompanies,
DistanceFromCompany,
           InterviewScore, SkillScore,
PersonalityScore,
           RecruitmentStrategy,
HiringDecision
HAVING COUNT(*) >1;

--3. Checking of invalid Values:
SELECT*
FROM  Candidate_data
WHERE Age < 18 OR Age > 70;

SELECT *
FROM Candidate_data
WHERE InterviewScore NOT BETWEEN 0 AND 100
     OR SkillScore NOT BETWEEN 0 AND  100
	 OR PersonalityScore NOT BETWEEN 0 AND 100;

--4. Checking unique categories:
SELECT DISTINCT EducationLevel
FROM Candidate_data;

SELECT DISTINCT Gender
FROM Candidate_data;

SELECT DISTINCT RecruitmentStrategy
FROM Candidate_data;

--5.Checking of Data types:
SELECT *
FROM Candidate_data
LIMIT '10';


SELECT
    COUNT(*) AS Total_Candidates,
    SUM(HiringDecision::INT) AS Total_Hired,
    ROUND((SUM(HiringDecision::INT)/COUNT(*)
FROM  Candidate_data;




SELECT COUNT(*) AS Total_Candidates
FROM  Candidate_data;


SELECT COUNT(*) AS Total_Hired
FROM  Candidate_data
WHERE HiringDecision = 1;

SELECT DISTINCT HiringDecision
FROM Candidate_data;

SELECT COUNT(*) AS Total_Hired
FROM Candidate_data
WHERE HiringDecision= '1' ;

--To calculate Ovetrall Hiring Rate:
SELECT
ROUND(
COUNT(CASE WHEN HiringDecision = '1' THEN 1 END) * 100.0
/ COUNT(*),2
) AS Hiring_Rate
FROM Candidate_data;


--4. Average Candidate Experience
SELECT ROUND (AVG(ExperienceYears), 2) AS 
Avg_Experience
FROM Candidate_data;

--5. Average Interview Score
SELECT ROUND(AVG(InterviewScore),2) AS
Avg_Interview_Score
FROM Candidate_data;

--6. Gender-wise Hiring Rate :
SELECT
     Gender,
	 COUNT(CASE WHEN HiringDecision= '1'
THEN 1 END) AS Hired_Count
FROM Candidate_data
GROUP BY Gender;


--8. Hiring Rate by Interview Score Range :
SELECT
      CASE
	      WHEN InterviewScore <50 THEN
'Below 50'  
          WHEN InterviewScore Between 50 AND 
69 THEN '50-69'
          WHEN InterviewScore Between 70 AND 
84 THEN '70-84'
          ELSE '85+'
		END AS Score_Range,
		ROUND(
             COUNT(CASE WHEN HiringDecision = '1' THEN 1 END) *100.0
			               /COUNT(*),2
				 ) AS Hiring_Rate
FROM Candidate_data
GROUP BY Score_Range
ORDER BY Score_Range;



