const { Pool } = require('pg');
const cohortName = process.argv[2];
const values = [cohortName];

const queryString = `
SELECT DISTINCT teachers.name AS teacher,
cohorts.name AS cohort
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teacher, cohorts.name
ORDER BY teachers.name;
`


const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(queryString, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort}: ${user.teacher}`)
  })
})
.catch(err => console.error('query error', err.stack));
