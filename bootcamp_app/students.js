const { Pool } = require('pg');

const [, , cohortName, maxResults] = process.argv;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT students.id, students.name, cohorts.name AS cohort
FROM students
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name ILIKE '%${cohortName}%'
LIMIT ${maxResults};
`)
  .then(res => {
    res.rows.forEach(student => {
      console.log(`${student.name} has an id of ${student.id} and was in the ${student.cohort} cohort`);
    });
  })
  .catch(err => console.error('query error', err.stack));
