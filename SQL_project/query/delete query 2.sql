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
