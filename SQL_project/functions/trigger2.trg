create or replace trigger trg_prevent_product_deletion
  before delete on product  
  for each row
declare
  v_product_count NUMBER;
begin
   -- Check if the product is associated with any order
  SELECT COUNT(*)
  INTO v_product_count
  FROM in_order
  WHERE product_num = :old.product_num;

  -- Raise an exception if the product is associated with an order
  IF v_product_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cannot delete the product as it is associated with ' || v_product_count || ' orders.');
  END IF;
  
end trg_prevent_product_deletion;
/
