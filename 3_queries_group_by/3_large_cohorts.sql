SELECT cohorts.name AS cohort_name,
COUNT(students.name) AS student_count
FROM students
JOIN cohorts 
ON cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.name) >= 18
ORDER BY COUNT(students.name);