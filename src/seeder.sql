DELETE FROM "email_address" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "role" CASCADE;
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
DELETE FROM "currency" CASCADE;

    INSERT INTO "role" (name)
VALUES
    ('CUSTOMER'),
    ('PARTNER'),
    ('CUSTOMER_SUPPORT'),
    ('ADMIN');

INSERT INTO "language" (code, name)
VALUES
    ('en', 'English'),
    ('ru', 'Russian');

-- Currency
INSERT INTO "currency" (code, name, symbol, is_default)
VALUES
    ('USD', 'United States dollar', '$', default),
    ('BYN', 'Belarusian ruble', 'Br', true);

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
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer@gmail.com' AND r.name = 'CUSTOMER';

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
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'partner@gmail.com' AND r.name = 'PARTNER';

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
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer_support@gmail.com' AND r.name = 'CUSTOMER_SUPPORT';

-- Admin user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('admin@gmail.com', 'User Admin')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;

-- User roles
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'admin@gmail.com' AND r.name = 'ADMIN';

-- Cart
WITH cart_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "cart" (user_id, price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer_support@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
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

-- Products
INSERT INTO "product" (title, description)
VALUES
    ('test', 'Test product description');

-- WITH product_variant_price AS (
--     INSERT INTO "price" (amount, currency_id)
--         SELECT 15, c.id FROM "currency" c WHERE c.is_default = true
--         RETURNING id
-- )
-- INSERT INTO "product_variant" (product_id, color_id, price_id, stock)
--     SELECT p.id, c.id, pvp.id, 17 FROM product_variant_price pvp CROSS JOIN "product" p CROSS JOIN "color" c WHERE p.title = 'test' AND c.code = 'red';

-- WITH product_variant_price AS (
--     INSERT INTO "price" (amount, currency_id)
--         SELECT 20, c.id FROM "currency" c WHERE c.is_default = true
--         RETURNING id
-- )
-- INSERT INTO "product_variant" (product_id, color_id, size_id, price_id, stock)
-- SELECT p.id, c.id, s.id, pvp.id, 17 FROM product_variant_price pvp CROSS JOIN "product" p CROSS JOIN "color" c CROSS JOIN "size" s WHERE p.title = 'test';

-- Warehouse items
INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT DISTINCT w.id, pv.id, 15, 2, 13 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w WHERE p.title = 'test' AND w.code = 'BY0001';

INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT DISTINCT w.id, pv.id, 4, 0, 4 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w WHERE p.title = 'test' AND w.code = 'BY0002';

-- Delivery methods
WITH delivery_method_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'pickup', 'Self-delivery', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 0, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'standard', 'Standard', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 10, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, status, price_id)
SELECT 'dhl', 'DHL', 'inactive', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 5, c.id FROM "currency" c WHERE c.is_default = true
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
