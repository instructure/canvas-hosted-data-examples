SELECT
  u.id,
  u.canvas_id,
  u.name,
  u.sortable_name,
  c.id,
  c.name,
  c.code,
  AVG(sf.score)
FROM enrollment_dim e
INNER JOIN course_dim c ON e.course_id = c.id
INNER JOIN assignment_dim a ON c.id = a.course_id
INNER JOIN submission_fact sf ON a.id = sf.assignment_id AND e.user_id = sf.user_id
INNER JOIN user_dim u ON sf.user_id = u.id
WHERE
  (e.type = 'StudentEnrollment' AND e.workflow_state = 'active') AND
  (a.workflow_state = 'published') AND
  sf.score IS NOT NULL
GROUP BY u.id, u.canvas_id, u.name, u.sortable_name, c.id, c.name, c.code;
