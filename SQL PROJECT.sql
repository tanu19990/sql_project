-- What is the gender breakdown of employees in the company
SELECT * FROM project_hr.`human resources`

SELECT sum(gender), COUNT(*) as count
FROM project_hr.`human resources`
GROUP BY gender;

-- Count of Employees in Each Department:
SELECT department, COUNT(*) AS count 
FROM project_hr.`human resources`
GROUP BY department;

-- List of All Job Titles:
SELECT DISTINCT jobtitle 
FROM project_hr.`human resources`

-- Employees by Location:
SELECT location_city, location_state, COUNT(*) AS count 
FROM project_hr.`human resources`
GROUP BY location_city, location_state;

--  the race breakdown of employees in the company
SELECT race , COUNT(*) AS count
From project_hr.`human resources`
GROUP BY race;

 -- How many employees work at HQ vs remote
SELECT location,COUNT(*) AS count
FROm project_hr.`human resources`
GROUP BY location;

-- How does the gender distribution vary acorss dept. and job titles
SELECT department,jobtitle,gender,COUNT(*) AS count
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL
GROUP BY department, jobtitle,gender
ORDER BY department, jobtitle,gender;

SELECT department,gender,COUNT(*) AS count
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL
GROUP BY department,gender
ORDER BY department,gender;

--  What is the distribution of jobtitles acorss the company
SELECT jobtitle, COUNT(*) AS count
FROm project_hr.`human resources`
GROUP BY jobtitle;

-- Average Tenure of Employees by Department:
SELECT department, 
AVG(DATEDIFF(CURDATE(), hire_date)) AS average_tenure 
FROM project_hr.`human resources`
GROUP BY department;

-- Number of Male and Female Employees in Each Department:
SELECT department, gender, COUNT(*) AS count 
FROM project_hr.`human resources`
GROUP BY department, gender;

-- Total Employees by Gender and Race:
SELECT gender, race, COUNT(*) AS count 
FROM project_hr.`human resources`
GROUP BY gender, race;

-- Turnover Rate by Department:
SELECT department, (COUNT(*) / (SELECT COUNT(*) FROM project_hr.`human resources`)) * 100 AS turnover_rate 
FROM project_hr.`human resources`
WHERE termdate IS NOT NULL 
GROUP BY department;

-- Department-Wise Employee Retention Analysis:
SELECT department, COUNT(*) AS retained_employees 
FROM project_hr.`human resources`
WHERE termdate IS NULL OR termdate > DATE_SUB(CURDATE(), INTERVAL 5 YEAR) 
GROUP BY department;

-- Which dept has the higher turnover/termination rate
SELECT department,
		COUNT(*) AS total_count,
        COUNT(CASE
				WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 
				END) AS terminated_count,
		ROUND((COUNT(CASE
					WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 
                    END)/COUNT(*))*100,2) AS termination_rate
		FROM project_hr.`human resources`
        GROUP BY department
        ORDER BY termination_rate DESC;

-- What is the distribution of employees across location_state
SELECT location_state, COUNT(*) AS count
FROm project_hr.`human resources`
GROUP BY location_state;

SELECT location_city, COUNT(*) AS count
FROm project_hr.`human resources`
GROUP BY location_city;
