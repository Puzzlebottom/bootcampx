SELECT cohorts.name AS cohort_name, COUNT(students.id) AS student_count
  FROM cohorts
  JOIN students ON students.cohort_id = cohorts.id
 GROUP BY cohort_name
HAVING COUNT(students.*) >= 18
 ORDER BY student_count;