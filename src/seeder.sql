DELETE FROM "email_address" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "language" CASCADE;


WITH new_email_address AS (
    INSERT INTO "email_address" (email)
    VALUES
        ('user@gmail.com')
    RETURNING id
)
INSERT INTO "user" (email_address_id, password)
SELECT e.id, '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;

INSERT INTO "language" (code, name)
VALUES
    ('en', 'English'),
    ('ru', 'Russian');