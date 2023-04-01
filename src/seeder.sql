DELETE FROM "email_address" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "role" CASCADE;
DELETE FROM "user_roles" CASCADE;
DELETE FROM "language" CASCADE;
DELETE FROM "color" CASCADE;
DELETE FROM "currency" CASCADE;
DELETE FROM "price" CASCADE;
DELETE FROM "product_variant" CASCADE;
DELETE FROM "product" CASCADE;

INSERT INTO "role" (name)
VALUES
    ('customer'),
    ('partner'),
    ('customer_support'),
    ('admin');

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
INSERT INTO "user_roles" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN email_address ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer@gmail.com' AND r.name = 'customer';

-- Partner user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('partner@gmail.com', 'User Partner')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Partner', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_roles" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN email_address ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'partner@gmail.com' AND r.name = 'partner';

-- Customer support user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('customer_support@gmail.com', 'User Customer Support')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Customer Support', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_roles" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN email_address ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'customer_support@gmail.com' AND r.name = 'customer_support';

-- Admin user
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('admin@gmail.com', 'User Admin')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Admin', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_roles" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN email_address ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'admin@gmail.com' AND r.name = 'admin';

-- Color
INSERT INTO "color" (code, name, hex)
VALUES
    ('red', 'Red', '#FF0000'),
    ('green', 'Green', '#00FF00'),
    ('blue', 'Blue', '#0000FF'),
    ('white', 'White', '#FFFFFF'),
    ('black', 'Black', '#000000');

-- Currency
INSERT INTO "currency" (code, name, symbol, is_default)
VALUES
    ('usd', 'United States dollar', '$', true),
    ('byn', 'Belarusian ruble', 'Br', default);
