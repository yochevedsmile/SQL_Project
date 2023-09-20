SELECT name
from person
INNER JOIN volenteer1 ON person.ID = volenteer1.volenteer_id
WHERE ID in(SELECT volenteer_ID FROM volenteer1)
AND ID NOT IN (SELECT volenteer_ID FROM order1)
AND availability > 5 
Order By person.name;
