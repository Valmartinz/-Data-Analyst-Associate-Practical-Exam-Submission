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

SELECT COUNT(sales)
FROM pets_supplies
WHERE sales < 0 OR sales IS NULL;

UPDATE pets_supplies
SET sales = ROUND(sales::numeric, 2);

SELECT COUNT(rating)
FROM pets_supplies
WHERE rating IS NULL OR rating = 'NA';

SELECT *
FROM pets_supplies
ORDER BY product_id;

UPDATE pets_supplies
SET rating = 
  CASE 
    WHEN rating IS NULL OR rating = 'NA' THEN 0
    ELSE rating::numeric
  END;

SELECT *
FROM pets_supplies
ORDER BY product_id;

SELECT COUNT(repeat_purchase)
FROM pets_supplies
WHERE repeat_purchase IS NULL OR repeat_purchase = '-0' OR repeat_purchase = '-1';

UPDATE pets_supplies
SET repeat_purchase = CASE 
    WHEN repeat_purchase = '-0' THEN '0'
    WHEN repeat_purchase = '-1' THEN '1'
    ELSE repeat_purchase
END;

SELECT *
FROM pets_supplies
ORDER BY product_id;

