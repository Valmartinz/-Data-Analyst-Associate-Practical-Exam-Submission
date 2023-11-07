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

SELECT *
FROM pets_supplies
ORDER BY product_id;

UPDATE pets_supplies
SET size = CASE
    WHEN size IS NULL THEN 'Unknown'
    ELSE INITCAP(LOWER(size))
END;

SELECT *
FROM pets_supplies
ORDER BY product_id;

SELECT COUNT(*)
FROM pets_supplies
WHERE price IS NULL OR price = 'unlisted';

UPDATE pets_supplies
SET price = (
    SELECT percentile_cont(0.5) WITHIN GROUP (ORDER BY CASE WHEN price = 'unlisted' THEN NULL ELSE price::numeric END)
    FROM pets_supplies
    WHERE price <> 'unlisted'
)
WHERE price = 'unlisted';

UPDATE pets_supplies
SET price = ROUND(price::numeric, 2)
WHERE price <> 'unlisted' AND price <> '';

SELECT *
FROM pets_supplies
ORDER BY product_id;

