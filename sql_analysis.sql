SELECT COUNT(*) FROM student_data;

----Average stress

SELECT ROUND(AVG(stress_level),2) AS avg_stress
FROM student_data;

----Sleep vs stress

SELECT sleep_hours, ROUND(AVG(stress_level),2) AS avg_stress
FROM student_data
GROUP BY sleep_hours
ORDER BY sleep_hours;

----Pressure vs stress 

SELECT academic_pressure, ROUND(AVG(stress_level),2) AS avg_stress
FROM student_data
GROUP BY academic_pressure
ORDER BY academic_pressure;

----Risk Distribution

SELECT 
risk_category,
COUNT(*) AS total,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM student_data),2) AS percentage
FROM student_data
GROUP BY risk_category;

----High Risk Profile

SELECT 
ROUND(AVG(study_hours),2) AS study,
ROUND(AVG(sleep_hours),2) AS sleep,
ROUND(AVG(academic_pressure),2) AS pressure,
ROUND(AVG(assignments_per_week),2) AS assignments,
ROUND(AVG(screen_time),2) AS screen,
ROUND(AVG(physical_activity),2) AS activity
FROM student_data
WHERE risk_category = 'High';

----Extreme Cases

SELECT *
FROM student_data
WHERE sleep_hours <= 4 AND academic_pressure >= 8;
