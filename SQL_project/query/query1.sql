SELECT product_num, color, weight
FROM product
WHERE product_num NOT IN (
  SELECT product_num FROM in_order
);



SELECT product.product_num, type1.stock
FROM product
NATURAL JOIN type1
NATURAL JOIN catagory 
WHERE catagory.catagory_name = 'chair' and type1.stock < 60
ORDER BY type1.stock DESC;


SELECT product_num, color, weight
FROM product
NATURAL JOIN in_order
GROUP BY product_num, color, weight
HAVING COUNT(in_order.order_ID) > 3;



SELECT volenteer_name
FROM volenteer
WHERE volenteer_ID NOT IN (
  SELECT volenteer_ID FROM order1
) AND availability > 5
Order By volenteer.volenteer_name;



UPDATE type1 
SET stock = stock - (
    SELECT COUNT(*) 
    FROM in_order 
    WHERE in_order.product_num IN (
        SELECT product_num 
        FROM product 
        WHERE type_ID IN (
            SELECT type_ID 
            FROM type1 
            WHERE catagory_num = 2
        )
    )
) 
WHERE type_ID IN (
    SELECT type_ID 
    FROM type1 
    WHERE catagory_num = 2
);



UPDATE customer 
SET type = 'VIP' 
WHERE customer_ID IN (
    SELECT customer_ID 
    FROM order1 
    GROUP BY customer_ID 
    HAVING COUNT(*) >= 3
);



DELETE FROM product
WHERE product_num NOT IN (
  SELECT DISTINCT product_num
  FROM in_order
);



DELETE FROM volenteer
WHERE volenteer_ID IN (
    SELECT volenteer_ID 
    FROM volenteer
    WHERE gender = 'male'
    AND availability < 2
    And volenteer_ID not in (
        SELECT volenteer_ID 
        FROM order1
    )
);
