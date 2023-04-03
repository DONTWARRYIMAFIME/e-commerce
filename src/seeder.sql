DELETE FROM "email_address" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "role" CASCADE;
DELETE FROM "user_role" CASCADE;
DELETE FROM "cart_item" CASCADE;
DELETE FROM "cart" CASCADE;
DELETE FROM "warehouse_item" CASCADE;
DELETE FROM "wishlist" CASCADE;
DELETE FROM "language" CASCADE;
DELETE FROM "product_variant" CASCADE;
DELETE FROM "product" CASCADE;
DELETE FROM "color" CASCADE;
DELETE FROM "currency" CASCADE;
DELETE FROM "price" CASCADE;
DELETE FROM "warehouse_item" CASCADE;
DELETE FROM "warehouse" CASCADE;
DELETE FROM "warehouse_status" CASCADE;
DELETE FROM "address" CASCADE;
DELETE FROM "city" CASCADE;
DELETE FROM "country" CASCADE;

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

-- Warehouse status
INSERT INTO "warehouse_status" (code, name, is_default)
VALUES
    ('ACTIVE', 'Active', default),
    ('INACTIVE', 'Inactive', true);

-- Warehouse
INSERT INTO "warehouse" (code, name, status_id)
SELECT 'BY01', 'By | Warehouse | 1', ws.id FROM "warehouse_status" ws WHERE ws.code = 'ACTIVE';
INSERT INTO "warehouse" (code, name, status_id)
SELECT 'BY02', 'By | Warehouse | 2', ws.id FROM "warehouse_status" ws WHERE ws.code = 'ACTIVE';
INSERT INTO "warehouse" (code, name, status_id)
SELECT 'BY03', 'By | Warehouse | 3', ws.id FROM "warehouse_status" ws WHERE ws.code = 'INACTIVE';

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
    ('RED', 'Red', '#FF0000'),
    ('GREEN', 'Green', '#00FF00'),
    ('BLUE', 'Blue', '#0000FF'),
    ('WHITE', 'White', '#FFFFFF'),
    ('BLACK', 'Black', '#000000');

-- Products
INSERT INTO "product" (title, description)
VALUES
    ('test', 'Test product description');

WITH product_variant_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 15, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "product_variant" (product_id, color_id, price_id)
    SELECT p.id, c.id, pvp.id FROM product_variant_price pvp CROSS JOIN "product" p CROSS JOIN "color" c WHERE p.title = 'test' AND c.code = 'RED';

WITH product_variant_price AS (
    INSERT INTO "price" (amount, currency_id)
        SELECT 20, c.id FROM "currency" c WHERE c.is_default = true
        RETURNING id
)
INSERT INTO "product_variant" (product_id, color_id, price_id)
SELECT p.id, c.id, pvp.id FROM product_variant_price pvp CROSS JOIN "product" p CROSS JOIN "color" c WHERE p.title = 'test' AND c.code = 'GREEN';

INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT DISTINCT w.id, pv.id, 15, 2, 13 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w WHERE p.title = 'test' AND w.code = 'BY01';

INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT DISTINCT w.id, pv.id, 4, 0, 4 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w WHERE p.title = 'test' AND w.code = 'BY02';
