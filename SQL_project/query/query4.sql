SELECT volenteer_name
FROM volenteer
WHERE volenteer_ID NOT IN (
  SELECT volenteer_ID FROM order1
) AND availability > 5
Order By volenteer.volenteer_name;
