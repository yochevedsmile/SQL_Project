UPDATE customer 
SET type = 'VIP' 
WHERE customer_ID IN (
    SELECT customer_ID 
    FROM order1 
    GROUP BY customer_ID 
    HAVING COUNT(*) >= 3
);
