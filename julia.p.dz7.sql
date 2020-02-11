

-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
SELECT name FROM users WHERE id IN (SELECT id FROM orders);

-- Выведите список товаров products и разделов catalogs, который соответствует товару.


SELECT 
	name, 
	(SELECT name FROM catalogs WHERE id=products.catalog_id) 
		as catalog_name
FROM products;


