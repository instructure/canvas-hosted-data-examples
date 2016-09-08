SELECT DISTINCT(requests.user_id),
  MAX(requests.timestamp_day),
  u.canvas_id,
  u.name,
  count(1)
FROM requests
INNER JOIN user_dim AS u ON requests.user_id = u.id
INNER JOIN enrollment_dim AS ed ON ed.course_id = requests.course_id AND ed.user_id = u.id AND ed.type='TeacherEnrollment'
GROUP BY requests.user_id,requests.timestamp_day,u.canvas_id,u.name;
