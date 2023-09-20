create or replace function count_orders_by_status(in_status in varchar2) return number is
counter number(10);
cursor order_cursor is
select order_id, customer_id
from order1
where status = in_status;
oc order_cursor%rowtype;
begin
  counter :=0;
  dbms_output.put_line('All orders with status: '||in_status||':');
  for oc in order_cursor
    loop
      dbms_output.put_line('Order ID: '|| oc.order_id|| ' Customer ID: ' || oc.customer_id); 
      counter := counter +1;
    end loop;      
return (counter);
end;
/
