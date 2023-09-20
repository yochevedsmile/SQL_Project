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

