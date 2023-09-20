create or replace function all_orders_by_status(in_status in varchar2) return number is
  return number is
cursor order_cursor is
select *
from order1
where status = in_status;
oc order_cursor%rowtype;
counter number(10);
begin
  counter :=0;
  dbms_output.put_line('All orders with status: '||in_order||':');
  for oc in order_cursor
    loop
      
  return(Result);
end all_orders_by_status;
/
