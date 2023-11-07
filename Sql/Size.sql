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
WHERE animal IS NULL OR animal = 'NA' OR animal = '-';

SELECT *
FROM pets_supplies
ORDER BY product_id;

SELECT COUNT(size)
FROM pets_supplies
WHERE size IS NULL or size = 'NA' OR size = '-';

UPDATE pets_supplies
SET size = CASE
    WHEN size IS NULL THEN 'Unknown'
    ELSE INITCAP(LOWER(size))
END;







