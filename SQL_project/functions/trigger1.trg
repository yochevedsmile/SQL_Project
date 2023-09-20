create or replace trigger trg_update_shift_salary
  before update of start_time ON shifts
  for each row
begin
  IF :new.start_time < :old.start_time THEN
    -- Increase the salary by 10% if the start time is updated to a later time
    :new.salary := :new.salary * 1.1;
  ELSIF :new.start_time > :old.start_time THEN
    -- Decrease the salary by 10% if the start time is updated to an earlier time
    :new.salary := :new.salary * 0.9;
  END IF;
end;
/
