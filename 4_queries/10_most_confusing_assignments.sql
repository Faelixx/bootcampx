SELECT assistance_requests.assignment_id AS id,
assignments.name AS name,
assignments.day AS day,
assignments.chapter AS chapter,
COUNT(assistance_requests.id) AS total_requests
FROM assistance_requests
JOIN assignments ON assignment_id = assignments.id
WHERE assistance_requests.assignment_id IS NOT NULL
GROUP BY assistance_requests.assignment_id, assignments.name, assignments.day, assignments.chapter
ORDER BY COUNT(assistance_requests.id) DESC;