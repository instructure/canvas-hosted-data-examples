SELECT DISTINCT(u.id),
  u.canvas_id,
  u.name,
  u.sortable_name,
  COUNT(e.id) as student_count
FROM enrollment_dim e
INNER JOIN user_dim u ON e.user_id = u.id
WHERE (e.type = 'StudentEnrollment')
GROUP BY u.id, u.canvas_id, u.name, u.sortable_name
ORDER BY student_count DESC;
