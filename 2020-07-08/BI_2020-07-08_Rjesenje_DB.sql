USE bikes
GO

CREATE TABLE items (
	kljuc_id nvarchar(50) NOT NULL,
	order_id int NOT NULL,
	item_id int NOT NULL,
	product_id int NOT NULL,
	quantity int NOT NULL,
	list_price decimal(10,2) NOT NULL,
	discount decimal(4, 2) NOT NULL,
	CONSTRAINT PK_items PRIMARY KEY (kljuc_id),
	CONSTRAINT FK_items_order_items FOREIGN KEY (order_id, item_id)
		REFERENCES sales.order_items (order_id, item_id),
)
GO

INSERT items
SELECT CONCAT(order_id, '-', item_id), 
		order_id, item_id, product_id,
		quantity, list_price, discount
FROM sales.order_items
GO

SELECT *
FROM items
GO
