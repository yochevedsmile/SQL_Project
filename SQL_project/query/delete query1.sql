DELETE FROM product
WHERE product_num NOT IN (
  SELECT DISTINCT product_num
  FROM in_order
);
