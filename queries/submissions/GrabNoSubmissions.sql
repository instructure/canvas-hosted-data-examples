SELECT *
FROM
  (SELECT id,
          canvas_id,
          name,
          sortable_name
   FROM user_dim) u
INNER JOIN
  (SELECT user_id,
          course_id,
          type,
          workflow_state
   FROM enrollment_dim
   WHERE type = 'StudentEnrollment'
     AND workflow_state = 'active') e ON e.user_id=u.id
INNER JOIN
  (SELECT id,
          canvas_id,
          name,
          code
   FROM course_dim) c ON c.id=e.course_id
INNER JOIN
  (SELECT id,
          course_id,
          canvas_id,
          title,
          workflow_state
   FROM assignment_dim
   WHERE workflow_state = 'published') a ON a.course_id=c.id
INNER JOIN
  (SELECT assignment_id,
          canvas_id,
          graded_at,
          attempt,
          excused,
          grade_state,
          workflow_state
   FROM submission_dim
   WHERE workflow_state IN ('unsubmitted',
                            'graded')) s ON s.assignment_id=a.id
WHERE NOT EXISTS
    (SELECT 1
     FROM submission_dim
     WHERE submission_dim.assignment_id=a.id
       AND submission_dim.user_id = u.id);
