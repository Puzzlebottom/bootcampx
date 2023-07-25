SELECT x.name, x.avg_time AS average_assistance_time
  FROM (SELECT cohorts.name, AVG(completed_at - started_at) AS avg_time
          FROM assistance_requests
          JOIN students ON students.id = assistance_requests.student_id
          JOIN cohorts ON cohorts.id = cohort_id
         GROUP BY cohorts.name) AS x
 WHERE avg_time = (SELECT MAX(y.avg_time)
                     FROM (SELECT cohorts.name, AVG(completed_at - started_at) AS avg_time
                             FROM assistance_requests
                             JOIN students ON students.id = assistance_requests.student_id
                             JOIN cohorts ON cohorts.id = cohort_id
                            GROUP BY cohorts.name) AS y
                     )