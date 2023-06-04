DELETE FROM "email_address" CASCADE;
DELETE FROM "email_address_confirmation" CASCADE;
DELETE FROM "user" CASCADE;
DELETE FROM "role" CASCADE;
DELETE FROM "permission" CASCADE;
DELETE FROM "role_permission" CASCADE;
DELETE FROM "user_role" CASCADE;
DELETE FROM "category" CASCADE;
DELETE FROM "brand" CASCADE;
DELETE FROM "cart_item" CASCADE;
DELETE FROM "cart" CASCADE;
DELETE FROM "wishlist_item" CASCADE;
DELETE FROM "wishlist" CASCADE;
DELETE FROM "product_variant" CASCADE;
DELETE FROM "product" CASCADE;
DELETE FROM "product_media" CASCADE;
DELETE FROM "color" CASCADE;
DELETE FROM "size" CASCADE;
DELETE FROM "comment" CASCADE;
DELETE FROM "comment_media" CASCADE;
DELETE FROM "warehouse_item" CASCADE;
DELETE FROM "warehouse" CASCADE;
DELETE FROM "pickup_point" CASCADE;
DELETE FROM "address" CASCADE;
DELETE FROM "user_address" CASCADE;
DELETE FROM "city" CASCADE;
DELETE FROM "country" CASCADE;
DELETE FROM "delivery_method" CASCADE;
DELETE FROM "price" CASCADE;
DELETE FROM "media" CASCADE;
DELETE FROM "order" CASCADE;
DELETE FROM "order_item" CASCADE;
DELETE FROM "payment_method" CASCADE;
DELETE FROM "payment_intent" CASCADE;
DELETE FROM "promotion" CASCADE;
DELETE FROM "promotion_product" CASCADE;

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
    ('manage', 'all', null),

    ('read', 'AddressEntity', null),
    ('create', 'BrandEntity', null),
    ('update', 'BrandEntity', null),
    ('delete', 'BrandEntity', null),
    ('manage', 'BrandEntity', null),

    ('read', 'BrandEntity', null),
    ('read', 'BrandEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'BrandEntity', null),
    ('update', 'BrandEntity', null),
    ('update', 'BrandEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'BrandEntity', null),
    ('delete', 'BrandEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'BrandEntity', null),

    ('read', 'CartEntity', null),
    ('read', 'CartEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'CartEntity', null),
    ('update', 'CartEntity', null),
    ('update', 'CartEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'CartEntity', null),
    ('delete', 'CartEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'CartEntity', null),

    ('read', 'CartItemEntity', null),
    ('read', 'CartItemEntity', '{"cart.userId": { "$eq": "{{userId}}" }}'),
    ('create', 'CartItemEntity', null),
    ('update', 'CartItemEntity', null),
    ('delete', 'CartItemEntity', null),
    ('manage', 'CartItemEntity', null),

    ('read', 'CategoryEntity', null),
    ('create', 'CategoryEntity', null),
    ('update', 'CategoryEntity', null),
    ('delete', 'CategoryEntity', null),
    ('manage', 'CategoryEntity', null),

    ('read', 'CityEntity', null),
    ('create', 'CityEntity', null),
    ('update', 'CityEntity', null),
    ('delete', 'CityEntity', null),
    ('manage', 'CityEntity', null),

    ('read', 'ColorEntity', null),
    ('create', 'ColorEntity', null),
    ('update', 'ColorEntity', null),
    ('delete', 'ColorEntity', null),
    ('manage', 'ColorEntity', null),

    ('read', 'CommentEntity', null),
    ('create', 'CommentEntity', null),
    ('update', 'CommentEntity', null),
    ('update', 'CommentEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'CommentEntity', null),
    ('delete', 'CommentEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'CommentEntity', null),

    ('read', 'CountryEntity', null),
    ('create', 'CountryEntity', null),
    ('update', 'CountryEntity', null),
    ('delete', 'CountryEntity', null),
    ('manage', 'CountryEntity', null),

    ('read', 'DeliveryMethodEntity', null),
    ('read', 'DeliveryMethodEntity', '{"status": { "$eq": "active" }}'),
    ('create', 'DeliveryMethodEntity', null),
    ('update', 'DeliveryMethodEntity', null),
    ('delete', 'DeliveryMethodEntity', null),
    ('manage', 'DeliveryMethodEntity', null),

    ('read', 'EmailAddressEntity', null),
    ('create', 'EmailAddressEntity', null),
    ('update', 'EmailAddressEntity', null),
    ('delete', 'EmailAddressEntity', null),
    ('manage', 'EmailAddressEntity', null),

    ('read', 'EmailAddressConfirmationEntity', null),
    ('read', 'EmailAddressConfirmationEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'EmailAddressConfirmationEntity', null),
    ('update', 'EmailAddressConfirmationEntity', null),
    ('update', 'EmailAddressConfirmationEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'EmailAddressConfirmationEntity', null),
    ('delete', 'EmailAddressConfirmationEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'EmailAddressConfirmationEntity', null),

    ('read', 'MediaEntity', null),
    ('create', 'MediaEntity', null),
    ('update', 'MediaEntity', null),
    ('delete', 'MediaEntity', null),
    ('manage', 'MediaEntity', null),

    ('read', 'OrderEntity', null),
    ('read', 'OrderEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'OrderEntity', null),
    ('update', 'OrderEntity', null),
    ('update', 'OrderEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'OrderEntity', null),
    ('delete', 'OrderEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'OrderEntity', null),

    ('read', 'PaymentMethodEntity', null),
    ('read', 'PaymentMethodEntity', '{"status": { "$eq": "active" }}'),
    ('create', 'PaymentMethodEntity', null),
    ('update', 'PaymentMethodEntity', null),
    ('delete', 'PaymentMethodEntity', null),
    ('manage', 'PaymentMethodEntity', null),

    ('read', 'PaymentIntentEntity', null),
    ('create', 'PaymentIntentEntity', null),
    ('update', 'PaymentIntentEntity', null),
    ('delete', 'PaymentIntentEntity', null),
    ('manage', 'PaymentIntentEntity', null),

    ('read', 'PermissionEntity', null),
    ('create', 'PermissionEntity', null),
    ('update', 'PermissionEntity', null),
    ('delete', 'PermissionEntity', null),
    ('manage', 'PermissionEntity', null),

    ('read', 'PickupPointEntity', null),
    ('read', 'PickupPointEntity', '{"status": { "$eq": "active" }}'),
    ('create', 'PickupPointEntity', null),
    ('update', 'PickupPointEntity', null),
    ('delete', 'PickupPointEntity', null),
    ('manage', 'PickupPointEntity', null),

    ('read', 'PriceEntity', null),
    ('create', 'PriceEntity', null),
    ('update', 'PriceEntity', null),
    ('delete', 'PriceEntity', null),
    ('manage', 'PriceEntity', null),

    ('read', 'ProductEntity', null),
    ('read', 'ProductEntity', '{"brandId": { "$in": "{{brandIds}}" }}'),
    ('create', 'ProductEntity', null),
    ('update', 'ProductEntity', null),
    ('update', 'ProductEntity', '{"brandId": { "$in": "{{brandIds}}" }}'),
    ('delete', 'ProductEntity', null),
    ('delete', 'ProductEntity', '{"brandId": { "$in": "{{brandIds}}" }}'),
    ('manage', 'ProductEntity', null),

    ('read', 'ProductVariantEntity', null),
    ('read', 'ProductVariantEntity', '{"product": {"brandId": { "$in": "{{brandIds}}" }}}'),
    ('create', 'ProductVariantEntity', null),
    ('update', 'ProductVariantEntity', null),
    ('update', 'ProductVariantEntity', '{"product.brandId": { "$in": "{{brandIds}}" }}'),
    ('delete', 'ProductVariantEntity', null),
    ('delete', 'ProductVariantEntity', '{"product.brandId": { "$in": "{{brandIds}}" }}'),
    ('manage', 'ProductVariantEntity', null),

    ('read', 'RoleEntity', null),
    ('create', 'RoleEntity', null),
    ('update', 'RoleEntity', null),
    ('delete', 'RoleEntity', null),
    ('manage', 'RoleEntity', null),

    ('read', 'SizeEntity', null),
    ('create', 'SizeEntity', null),
    ('update', 'SizeEntity', null),
    ('delete', 'SizeEntity', null),
    ('manage', 'SizeEntity', null),

    ('read', 'UserEntity', null),
    ('read', 'UserEntity', '{"id": { "$eq": "{{userId}}" }}'),
    ('create', 'UserEntity', null),
    ('update', 'UserEntity', null),
    ('update', 'UserEntity', '{"id": { "$eq": "{{userId}}" }}'),
    ('delete', 'UserEntity', null),
    ('delete', 'UserEntity', '{"id": { "$eq": "{{userId}}" }}'),
    ('manage', 'UserEntity', null),

    ('read', 'UserAddressEntity', null),
    ('read', 'UserAddressEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'UserAddressEntity', null),
    ('update', 'UserAddressEntity', null),
    ('update', 'UserAddressEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'UserAddressEntity', null),
    ('delete', 'UserAddressEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'UserAddressEntity', null),

    ('read', 'WarehouseEntity', null),
    ('read', 'WarehouseEntity', '{"status": { "$eq": "active" }}'),
    ('create', 'WarehouseEntity', null),
    ('update', 'WarehouseEntity', null),
    ('delete', 'WarehouseEntity', null),
    ('manage', 'WarehouseEntity', null),

    ('read', 'WarehouseItemEntity', null),
    ('create', 'WarehouseItemEntity', null),
    ('update', 'WarehouseItemEntity', '{"warehouseItem.productVariant.product.brandId": {"$in": "{{brandIds}}"}}'),
    ('delete', 'WarehouseItemEntity', null),
    ('manage', 'WarehouseItemEntity', null),

    ('read', 'WishlistEntity', null),
    ('read', 'WishlistEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('create', 'WishlistEntity', null),
    ('update', 'WishlistEntity', null),
    ('update', 'WishlistEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('delete', 'WishlistEntity', null),
    ('delete', 'WishlistEntity', '{"userId": { "$eq": "{{userId}}" }}'),
    ('manage', 'WishlistEntity', null),

    ('read', 'PromotionEntity', null),
    ('create', 'PromotionEntity', null),
    ('update', 'PromotionEntity', null),
    ('delete', 'PromotionEntity', null),
    ('manage', 'PromotionEntity', null),

    ('read', 'PromotionProductEntity', null),
    ('create', 'PromotionProductEntity', null),
    ('update', 'PromotionProductEntity', null),
    ('update', 'PromotionProductEntity', '{"product.brandId": { "$in": "{{brandIds}}" }}'),
    ('delete', 'PromotionProductEntity', null),
    ('delete', 'PromotionProductEntity', '{"product.brandId": { "$in": "{{brandIds}}" }}'),
    ('manage', 'PromotionProductEntity', null);

-- Role permission
-- Customer
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'BrandEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'CartEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'CartEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'CategoryEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'CityEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'ColorEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'CommentEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'create' AND p.subject = 'CommentEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'CommentEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'delete' AND p.subject = 'CommentEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'CountryEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'DeliveryMethodEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'EmailAddressEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'create' AND p.subject = 'EmailAddressConfirmationEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'OrderEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'create' AND p.subject = 'OrderEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'OrderEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'PaymentMethodEntity' AND p.conditions = '{"status": { "$eq": "active" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'create' AND p.subject = 'PaymentIntentEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'PaymentIntentEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'PickupPointEntity' AND p.conditions = '{"status": { "$eq": "active" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'ProductEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'ProductVariantEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'SizeEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'UserEntity' AND p.conditions = '{"id": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'UserEntity' AND p.conditions = '{"id": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'delete' AND p.subject = 'UserEntity' AND p.conditions = '{"id": { "$eq": "{{userId}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'UserAddressEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'create' AND p.subject = 'UserAddressEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'UserAddressEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'delete' AND p.subject = 'UserAddressEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'read' AND p.subject = 'WishlistEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'customer' AND p.action = 'update' AND p.subject = 'WishlistEntity' AND p.conditions = '{"userId": { "$eq": "{{userId}}" }}';

-- Partner
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'read' AND p.subject = 'PromotionProductEntity';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'create' AND p.subject = 'ProductEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'update' AND p.subject = 'ProductEntity' AND p.conditions = '{"brandId": { "$in": "{{brandIds}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'delete' AND p.subject = 'ProductEntity' AND p.conditions = '{"brandId": { "$in": "{{brandIds}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'create' AND p.subject = 'ProductVariantEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'update' AND p.subject = 'ProductVariantEntity' AND p.conditions = '{"product.brandId": { "$in": "{{brandIds}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'delete' AND p.subject = 'ProductVariantEntity' AND p.conditions = '{"product.brandId": { "$in": "{{brandIds}}" }}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'read' AND p.subject = 'WarehouseEntity' AND p.conditions = '{"status": { "$eq": "active" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'update' AND p.subject = 'WarehouseItemEntity' AND p.conditions = '{"warehouseItem.productVariant.product.brandId": {"$in": "{{brandIds}}"}}';

INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'read' AND p.subject = 'PromotionEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'create' AND p.subject = 'PromotionProductEntity';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'update' AND p.subject = 'PromotionProductEntity' AND p.conditions = '{"product.brandId": { "$in": "{{brandIds}}" }}';
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'partner' AND p.action = 'delete' AND p.subject = 'PromotionProductEntity' AND p.conditions = '{"product.brandId": { "$in": "{{brandIds}}" }}';

-- Admin
INSERT INTO "role_permission" (role_id, permission_id)
SELECT r.id, p.id FROM "role" r CROSS JOIN "permission" p WHERE r.code = 'admin' AND p.action = 'manage' AND p.subject = 'all';

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
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'partner@gmail.com' AND r.code IN ('customer','partner');

WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('partner2@gmail.com', 'User Partner 2')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'User', 'Partner 2', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'partner2@gmail.com' AND r.code IN ('customer','partner');

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

-- Pull and bear partner
WITH new_email_address AS (
    INSERT INTO "email_address" (address, name)
        VALUES
            ('pull_and_bear_partner@gmail.com', 'Pull And Bear Partner')
        RETURNING id
)
INSERT INTO "user" (email_address_id, first_name, last_name, password)
SELECT e.id, 'Pull&Bear', 'Partner', '$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0' FROM new_email_address e;
INSERT INTO "user_role" (user_id, role_id)
SELECT u.id, r.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id CROSS JOIN "role" r WHERE ea.address = 'pull_and_bear_partner@gmail.com' AND r.code IN ('customer','partner');

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
INSERT INTO "cart" (user_id, subtotal_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, subtotal_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, subtotal_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner2@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, subtotal_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'pull_and_bear_partner@gmail.com';


WITH cart_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "cart" (user_id, subtotal_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer_support@gmail.com';

WITH cart_price AS (
    INSERT INTO "price" (amount)
    VALUES (0),(0),(0),(0)
    RETURNING *
)
INSERT INTO "cart" (user_id, subtotal_price_id, tax_price_id, delivery_price_id, total_price_id)
SELECT u.id, cp.id FROM "cart_price" cp CROSS JOIN "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'admin@gmail.com';

-- Wishlist
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'customer@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'partner2@gmail.com';
INSERT INTO "wishlist" (user_id)
SELECT u.id FROM "user" u INNER JOIN "email_address" ea on ea.id = u.email_address_id WHERE ea.address = 'pull_and_bear_partner@gmail.com';
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

INSERT INTO "city" (name, country_id)
SELECT 'Moscow', c.id FROM "country" c WHERE c.code = 'RU';
INSERT INTO "city" (name, country_id)
SELECT 'Saint Petersburg', c.id FROM "country" c WHERE c.code = 'RU';

-- Color
INSERT INTO "color" (code, name, hex)
VALUES
    ('red', 'Red', '#FF7276'),
    ('pink', 'Pink', '#FFB6C1'),
    ('purple', 'Purple', '#CBC3E3'),
    ('orange', 'Orange', '#FFD580'),
    ('yellow', 'Yellow', '#FFFF9E'),
    ('green', 'Green', '#D1FFBD'),
    ('blue', 'Blue', '#ADD8E6'),
    ('grey', 'Grey', '#D3D3D3'),
    ('white', 'White', '#EAEAEA'),
    ('brown', 'Brown', '#C4A484'),
    ('beige', 'Beige', '#FFEFDF'),
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
INSERT INTO "delivery_method" (code, name, type, price_id)
SELECT 'standard_pickup', 'Deliver to pickup point', 'pickup_point_delivery', dmp.id FROM delivery_method_price dmp;

WITH delivery_method_price AS (
    INSERT INTO "price" (amount)
        SELECT 0
        RETURNING id
)
INSERT INTO "delivery_method" (code, name, price_id)
SELECT 'standard_home', 'Standard Free', dmp.id FROM delivery_method_price dmp;

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
    INSERT INTO "address" (postal_code, state, street, building, city_id, country_id)
        SELECT 220055, null, 'Chichurina', '12', c.id, cn.id FROM city c INNER JOIN country cn on cn.id = c.country_id WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id)
SELECT 'BY0001', 'Test pickup point 1', ppa.id FROM pickup_point_address ppa;

WITH pickup_point_address AS (
    INSERT INTO "address" (postal_code, state, street, building, city_id, country_id)
        SELECT 220055, null, 'Chichurina', '18', c.id, cn.id FROM city c INNER JOIN country cn on cn.id = c.country_id WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id)
SELECT 'BY0002', 'Test pickup point 2', ppa.id FROM pickup_point_address ppa;

WITH pickup_point_address AS (
    INSERT INTO "address" (postal_code, state, street, building, city_id, country_id)
        SELECT 220055, null, 'Chichurina', '22', c.id, cn.id FROM city c INNER JOIN country cn on cn.id = c.country_id  WHERE cn.code = 'BY' AND c.name = 'Minsk'
        RETURNING id
)
INSERT INTO "pickup_point" (code, name, address_id, status)
SELECT 'BY0003', 'Test pickup point 3', ppa.id, 'inactive' FROM pickup_point_address ppa;

-- Brand
INSERT INTO "brand" (code, name, user_id)
SELECT 'bershka', 'Bershka', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'admin@gmail.com';

INSERT INTO "brand" (code, name, user_id)
SELECT 'h_and_m', 'H&M', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'partner@gmail.com';
INSERT INTO "brand" (code, name, user_id)
SELECT 'versago', 'Versago', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'partner@gmail.com';

INSERT INTO "brand" (code, name, user_id)
SELECT 'zara', 'ZARA', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'partner2@gmail.com';

INSERT INTO "brand" (code, name, user_id)
SELECT 'pull_and_bear', 'Pull&Bear', u.id FROM "user" u INNER JOIN email_address ea ON u.email_address_id = ea.id WHERE ea.address = 'pull_and_bear_partner@gmail.com';

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

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'dresses', 'Dresses', 'Dresses', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'shorts', 'Shorts', 'Shorts', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'sleepwear', 'Sleepwear', 'Sleepwear', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'coats', 'Coats', 'Coats', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'shirts', 'Shirts', 'Shirts', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'tops', 'Tops', 'Tops', c.id FROM "category" c WHERE c.code = 'women';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'swimwear', 'Swimwear', 'Swimwear', c.id FROM "category" c WHERE c.code = 'women';

-- Category men
INSERT INTO "category" (code, name, description, parent_id)
SELECT 'men', 'Men', 'Men category', c.id FROM "category" c WHERE c.code = 'root';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'hoodies', 'Hoodies', 'Hoodies category', c.id FROM "category" c WHERE c.code = 'men';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'blazer', 'Blazer', 'Blazer', c.id FROM "category" c WHERE c.code = 'men';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'jeans', 'Jeans', 'Jeans', c.id FROM "category" c WHERE c.code = 'men';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'shirts', 'Shirts', 'Shirts', c.id FROM "category" c WHERE c.code = 'men';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'shorts', 'Shorts', 'Shorts', c.id FROM "category" c WHERE c.code = 'men';

INSERT INTO "category" (code, name, description, parent_id)
SELECT 'pants', 'Pants', 'Pants', c.id FROM "category" c WHERE c.code = 'men';

-- Payment methods
-- INSERT INTO "payment_method" (code, name)
-- VALUES
--     ('cash', 'Cash'),
--     ('cards', 'Cards');

-- Products
INSERT INTO "product" (title, description, category_id, brand_id)
SELECT 'Bermuda baggy cargo TEST PRODUCT',
       'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet delectus in perferendis placeat recusandae similique? Dolorum, eaque sit. Beatae doloremque enim molestiae ratione similique unde!',
       c.id, b.id FROM "category" c CROSS JOIN "brand" b WHERE c.code = 'skirts' AND b.code = 'bershka';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0001RS', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                                       CROSS JOIN "product" p
                                                       CROSS JOIN "color" c
                                                       CROSS JOIN "size" s WHERE p.title = 'Bermuda baggy cargo TEST PRODUCT' AND c.code = 'red' AND s.code = 's';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0002RM', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                                       CROSS JOIN "product" p
                                                       CROSS JOIN "color" c
                                                       CROSS JOIN "size" s WHERE p.title = 'Bermuda baggy cargo TEST PRODUCT' AND c.code = 'red' AND s.code = 'm';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0003RL', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                                       CROSS JOIN "product" p
                                                       CROSS JOIN "color" c
                                                       CROSS JOIN "size" s WHERE p.title = 'Bermuda baggy cargo TEST PRODUCT' AND c.code = 'red' AND s.code = 'l';

WITH product_variant_price AS (
    INSERT INTO "price" (amount)
        SELECT random() * 30 + 1
        RETURNING id
)
INSERT INTO "product_variant" (sku, product_id, color_id, size_id, price_id)
SELECT 'SK-B0004GL', p.id, c.id, s.id, pvp.id FROM product_variant_price pvp
                                                       CROSS JOIN "product" p
                                                       CROSS JOIN "color" c
                                                       CROSS JOIN "size" s WHERE p.title = 'Bermuda baggy cargo TEST PRODUCT' AND c.code = 'green' AND s.code = 'l';

-- Warehouse items
INSERT INTO "warehouse_item" AS pv (warehouse_id, product_variant_id, stock, reserved, available)
SELECT w.id, pv.id, 30, 0, 30 FROM product_variant pv INNER JOIN "product" p ON p.id = pv.product_id CROSS JOIN "warehouse" w;

-- Promotion
WITH promotion_price AS (
    INSERT INTO "price" (amount)
        SELECT 5
        RETURNING id
)
INSERT INTO "promotion" (code, name, price_id)
SELECT 'top_filtered', 'Top Filtered', p.id FROM promotion_price p;
