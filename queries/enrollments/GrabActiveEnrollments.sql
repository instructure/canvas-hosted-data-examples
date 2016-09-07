SELECT u.id,
  u.canvas_id,
  u.name,
  u.sortable_name,
  COUNT( DISTINCT e.course_section_id ) as enrollment_count
FROM enrollment_dim e
INNER JOIN user_dim u ON e.user_id = u.id
WHERE ( e.workflow_state = 'active' )
GROUP BY u.id, u.canvas_id, u.name, u.sortable_name
ORDER BY enrollment_count DESC;
