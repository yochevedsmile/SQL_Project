---queries with parameters
SELECT name
from person
INNER JOIN volenteer1 ON person.ID = volenteer1.volenteer_id
WHERE ID in(SELECT volenteer_ID FROM volenteer1)
AND ID NOT IN (SELECT volenteer_ID FROM order1)
AND availability > &<name = "num_availability" hint= "number between 0 and 7" type= "integer">
Order By person.name;


SELECT DISTINCT pe.name
FROM person pe
INNER JOIN volunteer v ON pe.id = v.id
INNER JOIN volunteering vl ON v.id = vl.v_id
INNER JOIN shifts s ON vl.s_id = s.s_id
WHERE vl.v_date >=&<name = "shift_date" type= date>;

select order_id
from order1
where status = &<name = "order_status" list = "select distinct status from order1" type = "string">;


select * 
from product
where color in (&<name = "color" list = "select distinct color from product" 
type = "string" multiselect = "yes">);


---query for first report and first graph
select * 
from shifts
order by shift_type;

---query for second report
select *
from order1
order by status;

---query for second graph
select status, count(*) as order_amount
from order1
group by status;

