DELETE FROM "email_address" CASCADE;
DELETE FROM "brand" CASCADE;
DELETE FROM "category" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "role" CASCADE;
DELETE FROM "permission" CASCADE;
DELETE FROM "user_role" CASCADE;
DELETE FROM "cart_item" CASCADE;
DELETE FROM "cart" CASCADE;
DELETE FROM "wishlist" CASCADE;
DELETE FROM "language" CASCADE;
DELETE FROM "translation" CASCADE;
DELETE FROM "product_variant" CASCADE;
DELETE FROM "product" CASCADE;
DELETE FROM "color" CASCADE;
DELETE FROM "size" CASCADE;
DELETE FROM "warehouse_item" CASCADE;
DELETE FROM "warehouse" CASCADE;
DELETE FROM "pickup_point" CASCADE;
DELETE FROM "address" CASCADE;
DELETE FROM "city" CASCADE;
DELETE FROM "country" CASCADE;
DELETE FROM "delivery_method" CASCADE;
DELETE FROM "price" CASCADE;
DELETE FROM "media" CASCADE;
DELETE FROM "order" CASCADE;
DELETE FROM "order_item" CASCADE;
DELETE FROM "payment_method" CASCADE;

-- Role
INSERT INTO "role" (code, name)
VALUES
    ('customer', 'Customer'),
    ('partner', 'Partner'),
    ('customer_support', 'Customer support'),
    ('admin', 'Admin');

-- Permission
INSERT INTO "permission" (action, subject, conditions)
VALUES
    ('read', 'BrandEntity', null),
    ('create', 'BrandEntity', null),
    ('update', 'BrandEntity', null),
    ('update', 'BrandEntity', '{"userId": "{{id}}"}'),
    ('delete', 'BrandEntity', null),
    ('delete', 'BrandEntity', '{"userId": "{{id}}"}'),
    ('manage', 'BrandEntity', null);

-- Role permission
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'read' AND p.subject = 'BrandEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'create' AND p.subject = 'BrandEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'update' AND p.subject = 'BrandEntity' AND p.conditions IS NOT NULL;
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'delete' AND p.subject = 'BrandEntity' AND p.conditions IS NOT NULL;

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'admin' AND p.conditions IS NULL;

INSERT INTO "language" (code, name)
VALUES
    ('en', 'English'),
    ('ru', 'Russian');

-- Customer user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
    VALUES
        ('customer@gmail.com', 'User Customer')
    RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Customer', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer@gmail.com' AND r.code = 'customer';

-- Partner user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('partner@gmail.com', 'User Partner')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Partner', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'partner@gmail.com' AND r.code = 'partner';

-- Customer support user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('customer_support@gmail.com', 'User Customer Support')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Customer Support', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer_support@gmail.com' AND r.code = 'customer_support';

-- Admin user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('admin@gmail.com', 'User Admin')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;

-- User role
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'admin@gmail.com' AND r.code = 'admin';

-- Cart
WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer_support@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
    RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'admin@gmail.com';

-- Wishlist
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer_support@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'admin@gmail.com';

-- Warehouse
INSERT INTO "warehouse" (code, name, status)
VALUES
    ('BY0001', 'Test Warehouse BY 1', default),
    ('BY0002', 'Test Warehouse BY 2', default),
    ('BY0003', 'Test Warehouse BY 3', 'inactive');

-- Country
INSERT INTO "country" (code, name)
VALUES
    ('BY', 'Belarus'),
    ('RU', 'Russia'),
    ('UA', 'Ukraine'),
    ('PL', 'Poland');

-- City
INSERT INTO "city" (name, country_id)
SELECT 'Brest', c.id FROM "country" c WHERE c.code = 'BY';
INSERT INTO "city" (name, country_id)
SELECT 'Vitebsk', c.id FROM "country" c WHERE c.code = 'BY';
INSERT INTO "city" (name, country_id)
SELECT 'Gomel', c.id FROM "country" c WHERE c.code = 'BY';
INSERT INTO "city" (name, country_id)
SELECT 'Grodno', c.id FROM "country" c WHERE c.code = 'BY';
INSERT INTO "city" (name, country_id)
SELECT 'Minsk', c.id FROM "country" c WHERE c.code = 'BY';
INSERT INTO "city" (name, country_id)
SELECT 'Mogilev', c.id FROM "country" c WHERE c.code = 'BY';

-- Color
INSERT INTO "color" (code, name, hex)
VALUES
    ('red', 'Red', '#FF0000'),
    ('green', 'Green', '#00FF00'),
    ('blue', 'Blue', '#0000FF'),
    ('white', 'White', '#FFFFFF'),
    ('black', 'Black', '#000000');

-- Size
INSERT INTO "size" (code, name)
VALUES
    ('2xs', '2XS'),
    ('xs', 'XS'),
    ('s', 'S'),
    ('m', 'M'),
    ('l', 'L'),
    ('xl', 'XL'),
    ('2xl', '2XL'),
    ('3xl', '3XL');

-- Delivery methods
WITH delivery_method_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'pickup', 'Self-delivery', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'standard', 'Standard', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount)
        SELECT 10
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, status, price_id)
SELECT 'dhl', 'DHL', 'inactive', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount)
        SELECT 5
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'yandex', 'Yandex delivery', dmp.id FROM delivery_method_price dmp;

-- Pickup-points
WITH pickup_point_address AS (
    INSERT INTO "address" (postal_code, state, street, building, city_id)
        SELECT 220055, null, 'Chichurina', '12', c.id FROM city c INNER JOIN country cn on cn.id = c.country_id WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id)
SELECT 'BY0001', 'Test pickup point 1', ppa.id FROM pickup_point_address ppa;

WITH pickup_point_address AS (
    INSERT INTO "address" (postal_code, state, street, building, city_id)
        SELECT 220055, null, 'Chichurina', '18', c.id FROM city c INNER JOIN country cn on cn.id = c.country_id WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id)
SELECT 'BY0002', 'Test pickup point 2', ppa.id FROM pickup_point_address ppa;

WITH pickup_point_address AS (
    INSERT INTO "address" (postal_code, state, street, building, city_id)
        SELECT 220055, null, 'Chichurina', '22', c.id FROM city c INNER JOIN country cn on cn.id = c.country_id WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id, status)
SELECT 'BY0003', 'Test pickup point 3', ppa.id, 'inactive' FROM pickup_point_address ppa;

-- Brand
INSERT INTO "brand" (code, name, user_id)
SELECT 'bershka', 'Bershka', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'admin@gmail.com';

INSERT INTO "brand" (code, name, user_id)
SELECT 'h_and_m', 'H&M', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'partner@gmail.com';

-- Category
INSERT INTO "category" (code, name, description, parent_id)
SELECT 'root', 'Root', 'Root category', null;

-- Category women
INSERT INTO "category" (code, name, description, parent_id)
SELECT 'women', 'Women', 'Women category', c.id FROM "category" c WHERE c.code = 'root';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'skirts', 'Skirts', 'Skirts', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'blazer', 'Blazer', 'Blazer', c.id FROM "category" c WHERE c.code = 'women';

-- Category men
INSERT INTO "category" (code, name, description, parent_id)
SELECT 'men', 'Men', 'Men category', c.id FROM "category" c WHERE c.code = 'root';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'hoodies', 'Hoodies', 'Hoodies category', c.id FROM "category" c WHERE c.code = 'men';

-- Payment methods
INSERT INTO "payment_method" (code, name)
VALUES
    ('cash_on_delivery', 'Cash on delivery'),
    ('card', 'Card');

-- Products
INSERT INTO "product" (title, description, category_id, brand_id)
SELECT 'test', 'Test product description', c.id, b.id FROM "category" c CROSS JOIN "brand" b WHERE c.code = 'skirts' AND b.code = 'bershka';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0001RS', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
    CROSS JOIN "product" p
    CROSS JOIN "color" c
    CROSS JOIN "size" s WHERE p.title = 'test' AND c.code = 'red' AND s.code = 's';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0002RM', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                         CROSS JOIN "product" p
                                         CROSS JOIN "color" c
                                         CROSS JOIN "size" s WHERE p.title = 'test' AND c.code = 'red' AND s.code = 'm';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0003RL', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                         CROSS JOIN "product" p
                                         CROSS JOIN "color" c
                                         CROSS JOIN "size" s WHERE p.title = 'test' AND c.code = 'red' AND s.code = 'l';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0004GL', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                         CROSS JOIN "product" p
                                         CROSS JOIN "color" c
                                         CROSS JOIN "size" s WHERE p.title = 'test' AND c.code = 'green' AND s.code = 'l';

-- Warehouse items
INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT w.id, pv.id, 30, 0, 30 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w;
