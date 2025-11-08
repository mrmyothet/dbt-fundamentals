{% set items = ['book', 'dog', 'cat'] %}

SELECT 'book' AS item_name 
UNION ALL 
SELECT 'dog' AS item_name
UNION ALL
SELECT 'cat' AS item_name
