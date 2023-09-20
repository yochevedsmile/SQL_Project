SELECT product.product_num, type1.stock
FROM product
NATURAL JOIN type1
NATURAL JOIN catagory 
WHERE catagory.catagory_name = 'chair' and type1.stock < 60
ORDER BY type1.stock DESC;

