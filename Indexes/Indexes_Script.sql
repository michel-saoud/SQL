SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

CREATE INDEX index_customer_id ON orders(customer_id);

CREATE INDEX index_book_id ON orders(book_id);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books 
WHERE original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));

CREATE INDEX translate_index ON books(original_language,title,sales_in_millions);

DROP INDEX translate_index ON books;





