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

SELECT COUNT(animal)
FROM pets_supplies
WHERE animal IS NULL OR category = 'NA' OR animal = '-';

SELECT COUNT(DISTINCT animal)
FROM pets_supplies;





