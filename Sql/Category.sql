SELECT *
FROM pets_supplies;

UPDATE pets_supplies
SET category = CASE
    WHEN category IS NULL OR category = '-' THEN 'Unknown'
    ELSE category
END;

SELECT *
FROM pets_supplies
ORDER BY product_id;







