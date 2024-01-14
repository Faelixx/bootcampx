SELECT students.name AS student,
AVG(assignment_submissions.duration) AS average_assignment_duration,
AVG(assignments.duration) AS average_estimated_duration
FROM assignment_submissions
JOIN assignments ON assignment_id = assignments.id
JOIN students ON student_id = students.id
WHERE students.end_date IS null
GROUP BY students.name
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY average_assignment_duration;
