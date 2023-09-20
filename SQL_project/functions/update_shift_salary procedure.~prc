create or replace procedure update_shift_salary(volunteer_id in number, new_salary in number) is
--finds all shifts with this volunteer
  cursor shift_cursor is
  select s_id, salary, shift_type
  from shifts natural join volunteering 
  where vo_id = volunteer_id;
  shift_rec shift_cursor%rowtype;
begin
  open shift_cursor;
  loop
    fetch shift_cursor into shift_rec;
    exit when shift_cursor%notfound;
    dbms_output.put_line('Shift number: ' || shift_rec.s_id || ' ,salary updated from: '|| shift_rec.salary ||' to: ' || new_salary);
    update shifts
    set shifts.salary = new_salary
    where shifts.s_id = shift_rec.s_id;
  end loop;
  close shift_cursor;
exception
  when NO_DATA_FOUND then
  dbms_output.put_line('Volunteer ' || volunteer_id || ' does not exist');    
end;
/
