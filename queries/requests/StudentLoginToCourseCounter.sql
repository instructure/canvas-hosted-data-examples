SELECT DISTINCT(ed.course_id),
  requests.user_id,
  u.canvas_id,
  u.name,
  COUNT(DISTINCT requests.session_id)
FROM requests
INNER JOIN user_dim AS u ON requests.user_id = u.id
INNER JOIN enrollment_dim AS ed ON ed.course_id = requests.course_id AND ed.user_id = u.id AND ed.type='StudentEnrollment'
GROUP BY requests.user_id,ed.course_id,u.canvas_id,u.name;
