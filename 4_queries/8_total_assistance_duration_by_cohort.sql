SELECT cohorts.name AS name,
       SUM(completed_at - started_at) AS total_duration
  FROM assistance_requests req
  JOIN students ON students.id = req.student_id
  JOIN cohorts ON cohorts.id = cohort_id
 GROUP BY cohorts.name
 ORDER BY total_duration;