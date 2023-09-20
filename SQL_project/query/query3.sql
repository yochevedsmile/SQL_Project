SELECT product_num, color, weight
FROM product
NATURAL JOIN in_order
GROUP BY product_num, color, weight
HAVING COUNT(in_order.order_ID) > 3;
