SELECT 
    b.title AS brand,
    COUNT(m.id) AS models_count
FROM brands b
LEFT JOIN models m ON b.id = m.brand_id
GROUP BY b.id, b.title
ORDER BY models_count DESC, b.title;

SELECT 
    s.title AS store,
    COALESCE(SUM(i.amount), 0) AS total_items
FROM stores s
LEFT JOIN items i ON s.id = i.store_id
GROUP BY s.id, s.title
ORDER BY total_items DESC, s.title;

SELECT 
    c.name,
    COUNT(o.id) AS orders_count
FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name
ORDER BY orders_count DESC, c.name
LIMIT 1;

SELECT 
    c.name,
    i.price AS max_price,
    m.title AS model
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN item_order io ON o.id = io.order_id
JOIN items i ON io.item_id = i.id
JOIN models m ON i.model_id = m.id
ORDER BY i.price DESC
LIMIT 1;