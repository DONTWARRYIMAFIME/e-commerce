--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE ecommerce_db;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md5067ac55252970a27e3158d918448c59c';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "ecommerce_db" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ecommerce_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE ecommerce_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE ecommerce_db OWNER TO postgres;

\connect ecommerce_db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: category_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category_code_enum AS ENUM (
    'root',
    'men',
    'women',
    'hoodies',
    'shirts',
    'skirts',
    'blazer',
    'dresses',
    'shorts',
    'sleepwear',
    'coats',
    'tops',
    'swimwear',
    'jeans',
    'pants',
    't_shirt'
);


ALTER TYPE public.category_code_enum OWNER TO postgres;

--
-- Name: country_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.country_code_enum AS ENUM (
    'BY',
    'RU',
    'UA',
    'PL'
);


ALTER TYPE public.country_code_enum OWNER TO postgres;

--
-- Name: delivery_method_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_method_code_enum AS ENUM (
    'standard_pickup',
    'standard_home',
    'yandex',
    'dhl'
);


ALTER TYPE public.delivery_method_code_enum OWNER TO postgres;

--
-- Name: delivery_method_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_method_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.delivery_method_status_enum OWNER TO postgres;

--
-- Name: delivery_method_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.delivery_method_type_enum AS ENUM (
    'home_delivery',
    'pickup_point_delivery'
);


ALTER TYPE public.delivery_method_type_enum OWNER TO postgres;

--
-- Name: order_history_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_history_status_enum AS ENUM (
    'created',
    'reserved_in_warehouse',
    'waiting_for_payment',
    'PAID',
    'ready_for_shipping',
    'in_shipping',
    'on_the_way_to_warehouse',
    'cancelled',
    'rejected',
    'complete'
);


ALTER TYPE public.order_history_status_enum OWNER TO postgres;

--
-- Name: order_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.order_status_enum AS ENUM (
    'created',
    'reserved_in_warehouse',
    'waiting_for_payment',
    'PAID',
    'ready_for_shipping',
    'in_shipping',
    'on_the_way_to_warehouse',
    'cancelled',
    'rejected',
    'complete'
);


ALTER TYPE public.order_status_enum OWNER TO postgres;

--
-- Name: payment_intent_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_intent_status_enum AS ENUM (
    'canceled',
    'processing',
    'requires_action',
    'requires_capture',
    'requires_confirmation',
    'requires_payment_method',
    'succeeded',
    'refunded'
);


ALTER TYPE public.payment_intent_status_enum OWNER TO postgres;

--
-- Name: payment_method_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_method_code_enum AS ENUM (
    'cash',
    'card'
);


ALTER TYPE public.payment_method_code_enum OWNER TO postgres;

--
-- Name: payment_method_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.payment_method_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.payment_method_status_enum OWNER TO postgres;

--
-- Name: permission_action_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.permission_action_enum AS ENUM (
    'read',
    'aggregate',
    'create',
    'update',
    'delete',
    'manage',
    'cancel',
    'reject',
    'transfer_to_delivery',
    'complete'
);


ALTER TYPE public.permission_action_enum OWNER TO postgres;

--
-- Name: pickup_point_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.pickup_point_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.pickup_point_status_enum OWNER TO postgres;

--
-- Name: price_currency_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.price_currency_enum AS ENUM (
    'byn',
    'usd'
);


ALTER TYPE public.price_currency_enum OWNER TO postgres;

--
-- Name: role_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_code_enum AS ENUM (
    'customer',
    'partner',
    'customer_support',
    'admin'
);


ALTER TYPE public.role_code_enum OWNER TO postgres;

--
-- Name: size_code_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.size_code_enum AS ENUM (
    'XXS',
    'XS',
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL'
);


ALTER TYPE public.size_code_enum OWNER TO postgres;

--
-- Name: warehouse_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.warehouse_status_enum AS ENUM (
    'active',
    'inactive'
);


ALTER TYPE public.warehouse_status_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    postal_code character varying(16) NOT NULL,
    state character varying(64),
    street character varying(64),
    building character varying(12),
    city_id uuid NOT NULL,
    country_id uuid NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(32) NOT NULL,
    name character varying(32) NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    payment_method_id uuid,
    delivery_method_id uuid,
    delivery_address_id uuid,
    subtotal_price_id uuid NOT NULL,
    tax_price_id uuid NOT NULL,
    delivery_price_id uuid NOT NULL,
    total_price_id uuid NOT NULL,
    quantity integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- Name: cart_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_item (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    cart_id uuid NOT NULL,
    product_variant_id uuid NOT NULL,
    quantity integer NOT NULL,
    price_id uuid NOT NULL
);


ALTER TABLE public.cart_item OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.category_code_enum NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    parent_id uuid,
    nsleft integer DEFAULT 1 NOT NULL,
    nsright integer DEFAULT 2 NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    name character varying(128) NOT NULL,
    country_id uuid NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    hex character varying(7) NOT NULL
);


ALTER TABLE public.color OWNER TO postgres;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    product_id uuid NOT NULL,
    description text,
    rating double precision NOT NULL,
    title character varying(256) NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_media (
    comment_id uuid NOT NULL,
    media_id uuid NOT NULL
);


ALTER TABLE public.comment_media OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.country_code_enum NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: delivery_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery_method (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.delivery_method_code_enum NOT NULL,
    name character varying(64) NOT NULL,
    status public.delivery_method_status_enum DEFAULT 'active'::public.delivery_method_status_enum NOT NULL,
    price_id uuid NOT NULL,
    avg_delivery_time_in_hours integer,
    type public.delivery_method_type_enum DEFAULT 'home_delivery'::public.delivery_method_type_enum NOT NULL
);


ALTER TABLE public.delivery_method OWNER TO postgres;

--
-- Name: email_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_address (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    address character varying(192) NOT NULL,
    name character varying(256),
    verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.email_address OWNER TO postgres;

--
-- Name: email_address_confirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_address_confirmation (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    email_address_id uuid NOT NULL,
    token character varying NOT NULL
);


ALTER TABLE public.email_address_confirmation OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    public_id character varying(256) NOT NULL,
    filename character varying(256) NOT NULL,
    url text NOT NULL,
    format character varying NOT NULL,
    width integer,
    height integer
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    status public.order_status_enum DEFAULT 'created'::public.order_status_enum NOT NULL,
    payment_method_id uuid NOT NULL,
    delivery_method_id uuid NOT NULL,
    delivery_address_id uuid NOT NULL,
    subtotal_price_id uuid NOT NULL,
    delivery_price_id uuid NOT NULL,
    tax_price_id uuid NOT NULL,
    total_price_id uuid NOT NULL,
    payment_intent_id uuid
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: order_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_history (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    order_id uuid NOT NULL,
    status public.order_history_status_enum NOT NULL
);


ALTER TABLE public.order_history OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_item (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    order_id uuid NOT NULL,
    product_variant_id uuid NOT NULL,
    warehouse_id uuid NOT NULL,
    price_id uuid NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_item OWNER TO postgres;

--
-- Name: payment_intent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_intent (
    client_secret character varying NOT NULL,
    payment_method_id uuid NOT NULL,
    price_id uuid,
    status public.payment_intent_status_enum NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    intent_id character varying NOT NULL,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


ALTER TABLE public.payment_intent OWNER TO postgres;

--
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.payment_method_code_enum NOT NULL,
    online boolean DEFAULT false NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    status public.payment_method_status_enum DEFAULT 'active'::public.payment_method_status_enum NOT NULL,
    media_id uuid
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    action public.permission_action_enum NOT NULL,
    subject character varying(128) NOT NULL,
    conditions jsonb
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- Name: pickup_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pickup_point (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(6) NOT NULL,
    name character varying(128) NOT NULL,
    address_id uuid NOT NULL,
    status public.pickup_point_status_enum DEFAULT 'active'::public.pickup_point_status_enum NOT NULL
);


ALTER TABLE public.pickup_point OWNER TO postgres;

--
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    amount numeric(10,2) DEFAULT '0'::numeric NOT NULL,
    currency public.price_currency_enum DEFAULT 'byn'::public.price_currency_enum NOT NULL
);


ALTER TABLE public.price OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    title character varying(256) NOT NULL,
    description text NOT NULL,
    category_id uuid NOT NULL,
    brand_id uuid NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_media (
    product_id uuid NOT NULL,
    media_id uuid NOT NULL
);


ALTER TABLE public.product_media OWNER TO postgres;

--
-- Name: product_variant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_variant (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    sku character varying NOT NULL,
    product_id uuid NOT NULL,
    color_id uuid NOT NULL,
    size_id uuid NOT NULL,
    price_id uuid NOT NULL
);


ALTER TABLE public.product_variant OWNER TO postgres;

--
-- Name: promotion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(256) NOT NULL,
    price_id uuid NOT NULL
);


ALTER TABLE public.promotion OWNER TO postgres;

--
-- Name: promotion_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_product (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    product_id uuid NOT NULL,
    promotion_id uuid NOT NULL,
    expire_at timestamp without time zone NOT NULL,
    payment_intent_id uuid
);


ALTER TABLE public.promotion_product OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.role_code_enum NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permission (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


ALTER TABLE public.role_permission OWNER TO postgres;

--
-- Name: size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code public.size_code_enum NOT NULL,
    name character varying(3) NOT NULL,
    priority integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.size OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    email_address_id uuid NOT NULL,
    avatar_id uuid,
    phone character varying,
    first_name character varying(64),
    last_name character varying(128),
    password character varying NOT NULL,
    deleted_at timestamp without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_address (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    address_id uuid NOT NULL
);


ALTER TABLE public.user_address OWNER TO postgres;

--
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- Name: warehouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(6) NOT NULL,
    name character varying(32) NOT NULL,
    status public.warehouse_status_enum DEFAULT 'active'::public.warehouse_status_enum NOT NULL,
    address_id uuid
);


ALTER TABLE public.warehouse OWNER TO postgres;

--
-- Name: warehouse_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouse_item (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    warehouse_id uuid NOT NULL,
    product_variant_id uuid NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    reserved integer DEFAULT 0 NOT NULL,
    available integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.warehouse_item OWNER TO postgres;

--
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- Name: wishlist_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist_item (
    wishlist_id uuid NOT NULL,
    product_id uuid NOT NULL
);


ALTER TABLE public.wishlist_item OWNER TO postgres;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, created_at, updated_at, postal_code, state, street, building, city_id, country_id) FROM stdin;
fd7b8f8f-4289-45e3-b066-b6853a6e0ee2	2023-06-01 10:08:03.858732	2023-06-01 10:08:03.858732	220055	\N	Chichurina	12	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
12894cc0-7307-472e-ba36-edac92269296	2023-06-01 10:08:03.976651	2023-06-01 10:08:03.976651	220055	\N	Chichurina	18	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
2c924e3a-a008-43f1-b72a-8eddb9fec708	2023-06-01 10:08:04.017488	2023-06-01 10:08:04.017488	220055	\N	Chichurina	22	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
ed63390e-a18a-4db7-b0f4-0dd0d7595fbf	2023-06-01 12:10:23.840459	2023-06-01 12:10:23.840459	111111	test state	test street	111	c8cdcc5f-bb7d-43ca-9aab-4073771cae52	7aac771a-75e9-4a62-b38e-11f27cc24edb
1863a6ee-2aa8-40ce-a865-b95a6dc3d7ac	2023-06-01 17:34:52.407716	2023-06-01 17:34:52.407716	2222222	test area	test street	222	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
8255e3e1-c534-4541-9bad-1beb6dd0ed15	2023-06-02 19:43:44.781911	2023-06-02 19:43:44.781911	333333	ttt	ttt	333	c8cdcc5f-bb7d-43ca-9aab-4073771cae52	7aac771a-75e9-4a62-b38e-11f27cc24edb
78c098d3-246b-4e0c-856a-19ffb97c8b9b	2023-06-02 19:58:25.237886	2023-06-03 17:14:21.882595	220055	Минская область	Чичурина	13	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
b60d7bd1-7706-4744-b89e-67ef17863e16	2023-06-11 18:58:36.261583	2023-06-11 18:58:36.261583	210032	Витебская	1-Мая	2	077cbfdc-0e37-441d-874d-c5ccae9b0eab	7aac771a-75e9-4a62-b38e-11f27cc24edb
99ca3877-f686-4215-805d-0802b8737ef6	2023-06-12 22:46:53.427826	2023-06-12 22:47:02.560617	123123	test 2	test 2	test 2	00f26819-9553-41f8-ba70-c16895899349	7aac771a-75e9-4a62-b38e-11f27cc24edb
c92882cb-c254-4ebb-aa0a-9742b7db7593	2023-06-11 19:09:07.598351	2023-06-12 22:59:01.634179	220055	Минская	Чичурина	15	e129260a-070e-4e93-96cc-0e2731aad0b5	7aac771a-75e9-4a62-b38e-11f27cc24edb
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (id, created_at, updated_at, code, name, user_id) FROM stdin;
e8ef7e01-40d9-4738-b0df-5857ed93c32b	2023-06-14 09:04:05.265516	2023-06-14 09:04:05.265516	h_and_m	H&M	ce681f11-2efe-4f25-ba51-9778552c7222
e2f60624-a7d4-4799-a64b-50c42a74116c	2023-06-14 10:49:10.069222	2023-06-14 10:49:10.069222	mango	MANGO	a4659cb7-be52-427a-9e3c-cbfc1f080a54
ae898734-c399-4444-bcfb-c5dce7ed3b9b	2023-06-14 11:24:23.307212	2023-06-14 11:24:23.307212	pull_and_bear	PULL&BEAR	0cf4be63-7ff0-4def-af17-d77946063a18
b022b741-95ad-451d-9aa4-a4c6ed2a9324	2023-06-14 11:49:25.384503	2023-06-14 11:49:25.384503	versage	VERSAGE	19a90e53-5288-410e-b340-c48be90d8a3c
\.


--
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, created_at, updated_at, user_id, payment_method_id, delivery_method_id, delivery_address_id, subtotal_price_id, tax_price_id, delivery_price_id, total_price_id, quantity) FROM stdin;
4f588b54-6e49-4d4e-9fa3-0894e5420827	2023-06-14 09:01:36.201986	2023-06-14 09:01:36.201986	ce681f11-2efe-4f25-ba51-9778552c7222	\N	\N	\N	a96c8ec0-da65-4960-92de-9c876d2ebbd8	b78236e5-9fd8-4ed0-8f51-d285db2e3656	213fb2d9-33d2-442f-a2a0-5636dd71798c	3dc00c49-7c2b-4be3-a458-ab2a41064e93	0
a2121137-4a36-404e-a8a1-6716a506058e	2023-06-14 10:48:58.023128	2023-06-14 10:48:58.023128	a4659cb7-be52-427a-9e3c-cbfc1f080a54	\N	\N	\N	aac9e322-f7a5-4660-83f0-401ee56fdb1a	0ae919d4-4ad7-4138-b609-dc209023c464	c0ab9362-47da-4d4e-8ca0-4740a1422a84	365b3253-8b28-42b0-8db4-9b7d5d01c743	0
a038f544-2e83-4d76-9a01-6dd5a3c18b56	2023-06-14 11:24:02.470972	2023-06-14 11:24:02.470972	0cf4be63-7ff0-4def-af17-d77946063a18	\N	\N	\N	433abab9-7395-453b-82e5-2ba3e2d286b8	c25def1e-1fb6-4e82-8591-dec021d9fc9a	9b9976d0-1aac-4378-8d80-a2c19385d3c1	0698614d-c097-4e92-aa94-05da98d4cc53	0
5e56d06f-bf0e-4d6c-a450-32bacbd8f508	2023-06-14 11:49:13.612603	2023-06-14 11:49:13.612603	19a90e53-5288-410e-b340-c48be90d8a3c	\N	\N	\N	83e100d5-f255-4373-bab8-219cbcecda1b	b3749535-8147-4f1b-9690-861a0bc8f150	91a159d8-04f9-488c-a12c-5d9bcfb198db	41e1e4b3-c960-4aab-90ce-ca6009dc3e0b	0
e25cbb68-1e5f-47be-b0f0-f17046f95855	2023-06-14 13:14:39.500198	2023-06-14 13:14:39.500198	c7b4b668-6128-4e7d-b8cd-fabe1ed71cf9	\N	\N	\N	d4b7ddbf-bc31-4ef4-bb38-43f3447c1f5b	5f261fb1-5c2d-4daa-bc46-563375448cbc	a5f3deed-b143-4108-bf27-ecedf79d8f49	b44be66c-58f7-4f13-87e8-2b15fd068059	0
60f41da3-2209-4de0-acde-cc45f76abee8	2023-06-01 11:36:22.09999	2023-06-01 11:36:22.09999	a0fbdc0b-2120-41ee-b661-bbd625473e43	\N	\N	\N	7166ef19-32b8-451d-a85b-e045a83e6575	67116cfb-1dc5-4251-a247-c0fb72142de4	f94ff45c-4b78-4219-a4c6-60140804d44d	36c1d268-9dd3-428d-a03f-e767a8948067	0
\.


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_item (id, created_at, updated_at, cart_id, product_variant_id, quantity, price_id) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, created_at, updated_at, code, name, description, parent_id, nsleft, nsright) FROM stdin;
9b6a62cf-9d1c-4a27-8a12-0815dd07bb26	2023-05-21 12:14:31.05583	2023-05-21 12:14:31.05583	root	Root	Root category	\N	1	2
61495247-27bb-429d-b260-220ee6d8e1be	2023-05-21 12:14:31.062344	2023-05-21 12:14:31.062344	women	Women	Women category	9b6a62cf-9d1c-4a27-8a12-0815dd07bb26	1	2
4d294ae9-ebe6-40c3-91a9-b177f952db86	2023-05-21 12:14:31.07046	2023-05-21 12:14:31.07046	skirts	Skirts	Skirts	61495247-27bb-429d-b260-220ee6d8e1be	1	2
bc4fe48d-6e5b-48f1-9a0b-cb66d88ecdfb	2023-05-21 12:14:31.078401	2023-05-21 12:14:31.078401	blazer	Blazer	Blazer	61495247-27bb-429d-b260-220ee6d8e1be	1	2
f722ed55-b189-4633-8479-5582b860c0f7	2023-05-21 12:14:31.083827	2023-05-21 12:14:31.083827	dresses	Dresses	Dresses	61495247-27bb-429d-b260-220ee6d8e1be	1	2
33c02fee-d891-4ddd-a45b-5d79810d2602	2023-05-21 12:14:31.090502	2023-05-21 12:14:31.090502	shorts	Shorts	Shorts	61495247-27bb-429d-b260-220ee6d8e1be	1	2
3217ca56-8298-47e3-b502-46449f385e45	2023-05-21 12:14:31.095759	2023-05-21 12:14:31.095759	sleepwear	Sleepwear	Sleepwear	61495247-27bb-429d-b260-220ee6d8e1be	1	2
01d680bd-ccda-48ff-905a-21eb33009b24	2023-05-21 12:14:31.101335	2023-05-21 12:14:31.101335	coats	Coats	Coats	61495247-27bb-429d-b260-220ee6d8e1be	1	2
89d9c446-d149-4133-8384-40e97394663f	2023-05-21 12:14:31.106861	2023-05-21 12:14:31.106861	shirts	Shirts	Shirts	61495247-27bb-429d-b260-220ee6d8e1be	1	2
d96ce1c5-5521-4d91-874c-e07afc54fa82	2023-05-21 12:14:31.112663	2023-05-21 12:14:31.112663	tops	Tops	Tops	61495247-27bb-429d-b260-220ee6d8e1be	1	2
cd177efe-b398-4049-be9b-ed8848253681	2023-05-21 12:14:31.118665	2023-05-21 12:14:31.118665	swimwear	Swimwear	Swimwear	61495247-27bb-429d-b260-220ee6d8e1be	1	2
1280453c-bd80-43dc-95c6-6b4811efb056	2023-05-21 12:14:31.124154	2023-05-21 12:14:31.124154	men	Men	Men category	9b6a62cf-9d1c-4a27-8a12-0815dd07bb26	1	2
b5dbb42c-8252-4b96-b58d-d6a6384b5f10	2023-05-21 12:14:31.130733	2023-05-21 12:14:31.130733	hoodies	Hoodies	Hoodies category	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
ca5ed990-1497-4427-8eb5-1ad445b8e0de	2023-05-21 12:14:31.137568	2023-05-21 12:14:31.137568	blazer	Blazer	Blazer	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	2023-05-21 12:14:31.143963	2023-05-21 12:14:31.143963	jeans	Jeans	Jeans	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
0899a897-620c-446f-88b7-1cde3ed896fd	2023-05-21 12:14:31.150099	2023-05-21 12:14:31.150099	shirts	Shirts	Shirts	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
99bbfded-7bd1-4f75-b848-f213f2a28ad3	2023-05-21 12:14:31.156265	2023-05-21 12:14:31.156265	shorts	Shorts	Shorts	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
618b2b04-ed8b-43b2-bd86-e640c9498622	2023-05-21 12:14:31.162915	2023-05-21 12:14:31.162915	pants	Pants	Pants	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
220352ab-466d-4ade-ae75-9dcf787008c1	2023-06-14 11:33:26.29184	2023-06-14 11:33:26.29184	t_shirt	T-Shirts	T-Shirts	1280453c-bd80-43dc-95c6-6b4811efb056	1	2
ed6b4883-9d16-4d12-9ac0-b0e6b5cd8a13	2023-06-14 11:58:53.365612	2023-06-14 11:58:53.365612	t_shirt	T-Shirts	T-Shirts	61495247-27bb-429d-b260-220ee6d8e1be	1	2
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, created_at, updated_at, name, country_id) FROM stdin;
c8cdcc5f-bb7d-43ca-9aab-4073771cae52	2023-05-21 12:14:30.9359	2023-05-21 12:14:30.9359	Brest	7aac771a-75e9-4a62-b38e-11f27cc24edb
077cbfdc-0e37-441d-874d-c5ccae9b0eab	2023-05-21 12:14:30.940622	2023-05-21 12:14:30.940622	Vitebsk	7aac771a-75e9-4a62-b38e-11f27cc24edb
45eee596-9316-4098-8f7b-06c6ff03da22	2023-05-21 12:14:30.945451	2023-05-21 12:14:30.945451	Gomel	7aac771a-75e9-4a62-b38e-11f27cc24edb
00f26819-9553-41f8-ba70-c16895899349	2023-05-21 12:14:30.95011	2023-05-21 12:14:30.95011	Grodno	7aac771a-75e9-4a62-b38e-11f27cc24edb
e129260a-070e-4e93-96cc-0e2731aad0b5	2023-05-21 12:14:30.954642	2023-05-21 12:14:30.954642	Minsk	7aac771a-75e9-4a62-b38e-11f27cc24edb
82a6d91e-3853-4df0-a103-6c0e3bb07beb	2023-05-21 12:14:30.961379	2023-05-21 12:14:30.961379	Mogilev	7aac771a-75e9-4a62-b38e-11f27cc24edb
30fa0ba3-1ed5-4555-a828-c32e589f1d18	2023-05-27 18:39:32.590975	2023-05-27 18:39:32.590975	Moscow	6a9d5a75-ad37-4996-a182-613ad541ca58
0506e37f-0e01-4cb3-a03c-421849d540a7	2023-05-27 18:39:32.697582	2023-05-27 18:39:32.697582	Saint Petersburg	6a9d5a75-ad37-4996-a182-613ad541ca58
\.


--
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.color (id, created_at, updated_at, code, name, hex) FROM stdin;
62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	red	Red	#FF7276
f16d53c0-7ece-435c-87d8-068186398eae	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	pink	Pink	#FFB6C1
68c94815-02e1-43e5-9495-dc40cbd994f2	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	purple	Purple	#CBC3E3
1f96fa55-5c94-44b7-8069-764dcf8f947a	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	orange	Orange	#FFD580
a620da0a-a51f-4db3-b1d0-1c533a0d87d0	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	yellow	Yellow	#FFFF9E
3c314204-70d9-414f-899f-11dac5eb6b12	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	green	Green	#D1FFBD
7a4a9d95-1c71-4af9-98a7-b0fee348c945	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	blue	Blue	#ADD8E6
b768b2b3-5576-4e50-b317-6243d69453fb	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	grey	Grey	#D3D3D3
e8f39507-8e79-41ff-9f74-890067a6d468	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	white	White	#EAEAEA
97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	brown	Brown	#C4A484
545a2a6e-b4f3-491b-856a-4d8008fd8f75	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	beige	Beige	#FFEFDF
a1b54494-0e51-4801-bcfa-9dbdf2466e97	2023-05-21 12:14:30.96761	2023-05-21 12:14:30.96761	black	Black	#000000
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment (id, created_at, updated_at, user_id, product_id, description, rating, title) FROM stdin;
72a5a0b4-8f50-4119-8220-9e75b2404527	2023-06-14 13:12:02.395088	2023-06-14 13:12:02.395088	a4659cb7-be52-427a-9e3c-cbfc1f080a54	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	Покупала месяц назад, все пришло быстро и нужно размера	5	Супер!
\.


--
-- Data for Name: comment_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comment_media (comment_id, media_id) FROM stdin;
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, created_at, updated_at, code, name) FROM stdin;
7aac771a-75e9-4a62-b38e-11f27cc24edb	2023-05-21 12:14:30.93032	2023-05-21 12:14:30.93032	BY	Belarus
6a9d5a75-ad37-4996-a182-613ad541ca58	2023-05-21 12:14:30.93032	2023-05-21 12:14:30.93032	RU	Russia
31066eb0-f787-415b-a5d3-e5d1736028f7	2023-05-21 12:14:30.93032	2023-05-21 12:14:30.93032	UA	Ukraine
6a0907dc-7113-426e-b339-f4a95b7d5ecb	2023-05-21 12:14:30.93032	2023-05-21 12:14:30.93032	PL	Poland
\.


--
-- Data for Name: delivery_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.delivery_method (id, created_at, updated_at, code, name, status, price_id, avg_delivery_time_in_hours, type) FROM stdin;
2c68054f-40f3-4cf7-b74f-eb9f1f5cad62	2023-05-27 18:43:52.776542	2023-05-27 18:43:52.776542	standard_home	Standard Free	active	d9795611-d069-429d-bf34-fe3eaee606f6	60	home_delivery
6b0719a3-58c4-4468-ac59-19f90e4999a4	2023-05-27 18:43:52.765956	2023-05-27 18:43:52.765956	standard_pickup	Deliver to pickup point	active	e4ae1424-ca1c-4b18-8a3a-5c3f7bbb4907	60	pickup_point_delivery
1c53356a-1b98-45e3-b79a-3d1baad373a1	2023-05-21 12:14:30.998336	2023-05-21 12:14:30.998336	yandex	Yandex delivery	active	f4e1f022-2b7b-41dd-9df4-f59a6f778c8c	52	home_delivery
ff02346a-8a0b-44ca-a55c-ef6037d2098d	2023-05-21 12:14:30.993017	2023-05-21 12:14:30.993017	dhl	DHL	inactive	f188d659-f4d3-4522-82dc-d1bc6d297bd7	48	home_delivery
\.


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_address (id, created_at, updated_at, address, name, verified) FROM stdin;
bf769c76-c611-4fab-96e4-3f3b0c58d289	2023-05-21 12:14:30.784813	2023-05-21 12:14:30.784813	customer@gmail.com	User Customer	f
7cd53a52-8a1a-4255-b903-b97d70f919a2	2023-05-21 12:14:30.798119	2023-05-21 12:14:30.798119	partner@gmail.com	User Partner	f
d485ac0d-67cf-4771-8f80-dbeb9a710c48	2023-05-21 12:14:30.809203	2023-05-21 12:14:30.809203	partner2@gmail.com	User Partner 2	f
c242acd5-f77f-4826-8ae5-46cc8dc38e5d	2023-05-21 12:14:30.823516	2023-05-21 12:14:30.823516	customer_support@gmail.com	User Customer Support	f
6f5f2e0a-b27f-4969-b972-f4cd32ad0f72	2023-05-21 12:14:30.856955	2023-05-21 12:14:30.856955	admin@gmail.com	User Admin	f
fde1daa3-5501-45f8-b2a6-e13abd95bbb9	2023-06-14 09:01:36.020051	2023-06-14 09:01:36.020051	h_and_m@partner.outfitr.com	H&M Partner	f
e2764f91-fee5-429b-911f-752265f48036	2023-06-14 10:48:57.935297	2023-06-14 10:48:57.935297	mango@partner.outfitr.com	MANGO Partner	f
953b762d-335c-469a-a37d-571e20b9436c	2023-06-14 11:24:02.385476	2023-06-14 11:24:02.385476	pull_and_bear@partner.outfitr.com	PULL&BEAR Partner	f
f0bbbf9e-c4ab-49fc-aceb-b9c5cc904f09	2023-06-14 11:49:13.486661	2023-06-14 11:49:13.486661	versage@partner.outfitr.com	VERSAGE Partner	f
c6e1994d-bc63-4f0e-9dda-169806cb4ccd	2023-06-14 13:14:39.399989	2023-06-14 13:14:39.399989	customer2@gmail.com	Дарья Букина	f
\.


--
-- Data for Name: email_address_confirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_address_confirmation (id, created_at, updated_at, user_id, email_address_id, token) FROM stdin;
a446936f-eb63-4933-a13c-d5380087baae	2023-06-14 09:01:36.194041	2023-06-14 09:01:36.194041	ce681f11-2efe-4f25-ba51-9778552c7222	fde1daa3-5501-45f8-b2a6-e13abd95bbb9	09add8c7-c3b4-4afa-9eba-1d862fbf5db8
ed8f569a-808c-4cd2-8bf5-127282e4dae2	2023-06-14 10:48:58.02278	2023-06-14 10:48:58.02278	a4659cb7-be52-427a-9e3c-cbfc1f080a54	e2764f91-fee5-429b-911f-752265f48036	7c1bf710-0d98-4513-8982-c01073a41e87
bd8ee084-628c-4719-abc2-26c5d458d5b0	2023-06-14 11:24:02.474341	2023-06-14 11:24:02.474341	0cf4be63-7ff0-4def-af17-d77946063a18	953b762d-335c-469a-a37d-571e20b9436c	d7b276c9-d2a9-44d2-8a66-873393bd7988
20cee8bf-a885-4169-8866-a7bcc237fee5	2023-06-14 11:49:13.612424	2023-06-14 11:49:13.612424	19a90e53-5288-410e-b340-c48be90d8a3c	f0bbbf9e-c4ab-49fc-aceb-b9c5cc904f09	79151f28-120a-43dd-95bd-52c6bd3493a1
beb303fc-edbd-40ea-b2fd-907ca2e4b259	2023-06-14 13:14:39.497264	2023-06-14 13:14:39.497264	c7b4b668-6128-4e7d-b8cd-fabe1ed71cf9	c6e1994d-bc63-4f0e-9dda-169806cb4ccd	a1aa421d-fa2e-4733-b120-9133d70297b6
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, created_at, updated_at, public_id, filename, url, format, width, height) FROM stdin;
669eb530-edef-4ed6-ba34-710b06d7eb0d	2023-05-21 15:17:33.711662	2023-05-21 15:17:33.711662	products/2e712e40-3fbe-4562-bd8b-caafe199bda7/wkz9saqk05cociodl6r5	wkz9saqk05cociodl6r5	http://res.cloudinary.com/e-commerce-example/image/upload/v1684682253/products/2e712e40-3fbe-4562-bd8b-caafe199bda7/wkz9saqk05cociodl6r5.jpg	image	850	1275
36e86577-b635-468e-9009-d5a204c7a535	2023-05-21 15:17:33.974583	2023-05-21 15:17:33.974583	products/2e712e40-3fbe-4562-bd8b-caafe199bda7/cibk0xl69q5t86v8p5og	cibk0xl69q5t86v8p5og	http://res.cloudinary.com/e-commerce-example/image/upload/v1684682253/products/2e712e40-3fbe-4562-bd8b-caafe199bda7/cibk0xl69q5t86v8p5og.jpg	image	850	1275
7508bd24-6647-4015-a99b-5bc0e22cb195	2023-05-21 15:25:27.49304	2023-05-21 15:25:27.49304	products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/jrulxbxwpx4yu7c14qus	jrulxbxwpx4yu7c14qus	http://res.cloudinary.com/e-commerce-example/image/upload/v1684682727/products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/jrulxbxwpx4yu7c14qus.jpg	image	850	1275
4aa320ba-e3fd-46ba-b7ad-219a4404ab48	2023-05-21 15:25:27.639754	2023-05-21 15:25:27.639754	products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/fbhrq1rohmhb1rwd2aji	fbhrq1rohmhb1rwd2aji	http://res.cloudinary.com/e-commerce-example/image/upload/v1684682727/products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/fbhrq1rohmhb1rwd2aji.jpg	image	850	1275
9af53c6c-dfd5-4ef4-91aa-cdcb8945aaad	2023-05-21 15:25:27.731239	2023-05-21 15:25:27.731239	products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/ytstsqwx8uha0lchli21	ytstsqwx8uha0lchli21	http://res.cloudinary.com/e-commerce-example/image/upload/v1684682727/products/babe9a8a-2411-4fb5-9945-01ee91e0a0f8/ytstsqwx8uha0lchli21.jpg	image	850	1275
c68ed20a-c284-4269-8f20-5abe7a90824f	2023-05-21 12:20:56.766425	2023-05-21 12:20:56.766425	products/6612aa02-e18d-4b0a-be40-1fcb577f4a56/y4bf8eff01wfjr2pz7f9	y4bf8eff01wfjr2pz7f9	http://res.cloudinary.com/e-commerce-example/image/upload/v1684671656/products/6612aa02-e18d-4b0a-be40-1fcb577f4a56/y4bf8eff01wfjr2pz7f9.jpg	image	850	1275
9bd20c16-0cce-4eda-b916-7aaaf5042558	2023-05-21 12:20:56.733291	2023-05-21 12:20:56.733291	products/6612aa02-e18d-4b0a-be40-1fcb577f4a56/nucnduikgr56m9ydtw0m	nucnduikgr56m9ydtw0m	http://res.cloudinary.com/e-commerce-example/image/upload/v1684671656/products/6612aa02-e18d-4b0a-be40-1fcb577f4a56/nucnduikgr56m9ydtw0m.jpg	image	850	1275
6d640408-8c5a-4b5e-9f84-5d6547842808	2023-05-26 11:23:06.565565	2023-05-26 11:23:06.596039	paymentMethod/cash/qjh048fyswo3lnxuhae2	qjh048fyswo3lnxuhae2	http://res.cloudinary.com/e-commerce-example/image/upload/v1685100186/paymentMethod/cash/qjh048fyswo3lnxuhae2.png	image	512	512
e8f48435-efee-490e-b4cb-30b59cb05f25	2023-05-26 11:24:08.56245	2023-05-26 11:24:08.567377	paymentMethod/card/fmxbmvgl8ifongx0ifg0	fmxbmvgl8ifongx0ifg0	http://res.cloudinary.com/e-commerce-example/image/upload/v1685100248/paymentMethod/card/fmxbmvgl8ifongx0ifg0.png	image	512	512
4e6b3888-67a2-4860-93e8-b00731fe426b	2023-05-26 11:58:51.491135	2023-05-26 11:58:51.491135	paymentMethod/card/bejz0s7nrzqicza1dotl	bejz0s7nrzqicza1dotl	http://res.cloudinary.com/e-commerce-example/image/upload/v1685102331/paymentMethod/card/bejz0s7nrzqicza1dotl.png	image	512	512
e9a8f623-af82-4539-91de-2afbaef4a321	2023-05-26 12:00:25.772316	2023-05-26 12:00:25.772316	paymentMethod/cash/iotjp8bkqk2burasuzlf	iotjp8bkqk2burasuzlf	http://res.cloudinary.com/e-commerce-example/image/upload/v1685102425/paymentMethod/cash/iotjp8bkqk2burasuzlf.png	image	512	512
644348fc-da37-4726-8c03-05f5c0e37363	2023-05-26 12:01:48.60078	2023-05-26 12:01:48.60078	paymentMethod/cash/xsauhpq4btqpmvuwawqf	xsauhpq4btqpmvuwawqf	http://res.cloudinary.com/e-commerce-example/image/upload/v1685102508/paymentMethod/cash/xsauhpq4btqpmvuwawqf.png	image	512	512
b7053c8b-9dea-4ca4-846c-cf27b1e8ebc9	2023-05-26 12:02:09.528285	2023-05-26 12:02:09.528285	paymentMethod/card/ed7rhbsd9omzyjxboonw	ed7rhbsd9omzyjxboonw	http://res.cloudinary.com/e-commerce-example/image/upload/v1685102529/paymentMethod/card/ed7rhbsd9omzyjxboonw.png	image	512	512
26da364a-595a-43ec-84ba-be116ad86bf2	2023-05-29 15:06:29.64422	2023-05-29 15:06:29.64422	products/cc4f9409-eb60-45ad-aa7b-183e361fa75c/kmi27xehbgdzudn91ihy	kmi27xehbgdzudn91ihy	http://res.cloudinary.com/e-commerce-example/image/upload/v1685372789/products/cc4f9409-eb60-45ad-aa7b-183e361fa75c/kmi27xehbgdzudn91ihy.jpg	image	1256	1757
b4d1eb2e-cb71-4bfa-92d6-f229b2f1fbda	2023-05-29 15:06:29.773193	2023-05-29 15:06:29.773193	products/cc4f9409-eb60-45ad-aa7b-183e361fa75c/omadpjplqjbwchwccc1b	omadpjplqjbwchwccc1b	http://res.cloudinary.com/e-commerce-example/image/upload/v1685372789/products/cc4f9409-eb60-45ad-aa7b-183e361fa75c/omadpjplqjbwchwccc1b.jpg	image	1256	1757
01130d0d-60bb-4b15-8c83-ea9f3707adcb	2023-06-01 11:44:29.21872	2023-06-01 11:44:29.21872	users/dd75632e-b93b-4baa-b4d8-960b808a5c9f/v5dc1msufwwrptvhpgfk	v5dc1msufwwrptvhpgfk	http://res.cloudinary.com/e-commerce-example/image/upload/v1685619868/users/dd75632e-b93b-4baa-b4d8-960b808a5c9f/v5dc1msufwwrptvhpgfk.jpg	image	2352	1466
805a2610-f34d-42b6-8550-162e101e3af9	2023-06-01 11:47:57.48552	2023-06-01 11:47:57.48552	users/d34214e4-9fba-4563-af89-fa5efa7ee64b/ymxcbtdbyle5fczigjfv	ymxcbtdbyle5fczigjfv	http://res.cloudinary.com/e-commerce-example/image/upload/v1685620076/users/d34214e4-9fba-4563-af89-fa5efa7ee64b/ymxcbtdbyle5fczigjfv.jpg	image	2560	1609
f0cfd464-eac9-4632-b7ca-0f0e58f28b87	2023-06-01 19:10:16.011496	2023-06-01 19:10:16.011496	paymentMethod/cards/a6r3var2d37aloc8hl46	a6r3var2d37aloc8hl46	http://res.cloudinary.com/e-commerce-example/image/upload/v1685646615/paymentMethod/cards/a6r3var2d37aloc8hl46.png	image	512	512
5d00fa7f-915c-4dac-9bf8-6c842ba9a1a5	2023-06-01 21:44:20.247073	2023-06-01 21:44:20.247073	paymentMethod/card/derlssfcna97hn9pzjbv	derlssfcna97hn9pzjbv	http://res.cloudinary.com/e-commerce-example/image/upload/v1685655859/paymentMethod/card/derlssfcna97hn9pzjbv.png	image	512	512
4c004689-943f-4c70-8426-4c739cf5e1f6	2023-06-01 11:54:45.259604	2023-06-03 13:52:27.864274	users/917310e9-dae9-4611-872f-ca94e5c23d9c/vkoz7jq29tk1658lfguo	vkoz7jq29tk1658lfguo	http://res.cloudinary.com/e-commerce-example/image/upload/v1685800347/users/917310e9-dae9-4611-872f-ca94e5c23d9c/vkoz7jq29tk1658lfguo.jpg	image	768	1024
af33ab4a-e2b8-401a-8089-c370c5ec1fdb	2023-06-03 23:43:23.813185	2023-06-03 23:43:23.813185	comments/78aee22a-c7e6-40d6-9c64-4d1cadc0144d/vzyq59ke6uiwysumcdre	vzyq59ke6uiwysumcdre	http://res.cloudinary.com/e-commerce-example/image/upload/v1685835803/comments/78aee22a-c7e6-40d6-9c64-4d1cadc0144d/vzyq59ke6uiwysumcdre.jpg	image	1256	1757
1f4edc13-d5fd-4008-a1ea-578387bacab4	2023-06-03 23:43:23.878828	2023-06-03 23:43:23.878828	comments/78aee22a-c7e6-40d6-9c64-4d1cadc0144d/rpnt6fzqqrysyqhjhapd	rpnt6fzqqrysyqhjhapd	http://res.cloudinary.com/e-commerce-example/image/upload/v1685835803/comments/78aee22a-c7e6-40d6-9c64-4d1cadc0144d/rpnt6fzqqrysyqhjhapd.jpg	image	1256	1757
03772f45-ff93-44a2-9966-2f893531d805	2023-06-03 23:46:25.671965	2023-06-03 23:46:25.671965	comments/be9323df-eba9-4567-a5cd-67998f870075/ab6hnnetllt5gbqzn8q9	ab6hnnetllt5gbqzn8q9	http://res.cloudinary.com/e-commerce-example/image/upload/v1685835985/comments/be9323df-eba9-4567-a5cd-67998f870075/ab6hnnetllt5gbqzn8q9.jpg	image	1256	1757
ea1de8ec-c156-4054-bc10-fc2fe03a767b	2023-06-03 23:46:25.782655	2023-06-03 23:46:25.782655	comments/be9323df-eba9-4567-a5cd-67998f870075/ekmkx0nhknm3qcej0mvv	ekmkx0nhknm3qcej0mvv	http://res.cloudinary.com/e-commerce-example/image/upload/v1685835985/comments/be9323df-eba9-4567-a5cd-67998f870075/ekmkx0nhknm3qcej0mvv.jpg	image	1256	1757
40ffea27-a6e0-461d-bf50-1a96ee41d9f2	2023-06-08 17:08:48.63929	2023-06-08 17:08:48.63929	products/93909bfa-7468-4263-bb6f-e57b65ef5f35/j2l1pwnvo9j0effaxkaa	j2l1pwnvo9j0effaxkaa	http://res.cloudinary.com/e-commerce-example/image/upload/v1686244128/products/93909bfa-7468-4263-bb6f-e57b65ef5f35/j2l1pwnvo9j0effaxkaa.jpg	image	1256	1757
b0ffad9e-3add-45cc-a039-81ea97f1f9bd	2023-06-08 17:08:48.657782	2023-06-08 17:08:48.657782	products/93909bfa-7468-4263-bb6f-e57b65ef5f35/sjoq3nv31xd4pf7mvuka	sjoq3nv31xd4pf7mvuka	http://res.cloudinary.com/e-commerce-example/image/upload/v1686244128/products/93909bfa-7468-4263-bb6f-e57b65ef5f35/sjoq3nv31xd4pf7mvuka.jpg	image	1256	1757
8813fc22-9646-4a8b-85a8-be151dd32d41	2023-06-11 18:57:09.711312	2023-06-11 18:57:09.711312	comments/f538c23f-097d-4ab8-8464-b55bd01a4ffc/pdc4wbgx7s3ooiocujzn	pdc4wbgx7s3ooiocujzn	http://res.cloudinary.com/e-commerce-example/image/upload/v1686509829/comments/f538c23f-097d-4ab8-8464-b55bd01a4ffc/pdc4wbgx7s3ooiocujzn.png	image	925	258
7ee8a992-b900-4fc0-9cc4-6b4372cf0f16	2023-06-14 02:31:35.560474	2023-06-14 02:31:35.560474	products/662a807e-9caa-4a18-a0e0-7d24f79a658b/hrnpuyv4ae87kkxldtlo	hrnpuyv4ae87kkxldtlo	http://res.cloudinary.com/e-commerce-example/image/upload/v1686709894/products/662a807e-9caa-4a18-a0e0-7d24f79a658b/hrnpuyv4ae87kkxldtlo.jpg	image	1256	1757
d3017631-f8d8-4dbe-929d-84f06a57ee36	2023-06-14 02:31:35.732459	2023-06-14 02:31:35.732459	products/662a807e-9caa-4a18-a0e0-7d24f79a658b/jsj3cvhzn9hmtdrp3mtj	jsj3cvhzn9hmtdrp3mtj	http://res.cloudinary.com/e-commerce-example/image/upload/v1686709895/products/662a807e-9caa-4a18-a0e0-7d24f79a658b/jsj3cvhzn9hmtdrp3mtj.jpg	image	1256	1757
6ec33563-f20c-4fac-9fb7-709fbb591a31	2023-06-14 02:33:07.087204	2023-06-14 02:33:07.087204	products/158d1240-fb96-45b7-b86a-55c69809dec4/iw1iqmcviuqrluaei3ux	iw1iqmcviuqrluaei3ux	http://res.cloudinary.com/e-commerce-example/image/upload/v1686709986/products/158d1240-fb96-45b7-b86a-55c69809dec4/iw1iqmcviuqrluaei3ux.jpg	image	1256	1757
2050a2fb-40ba-4360-a3c4-3ee55310f99d	2023-06-14 02:33:07.115764	2023-06-14 02:33:07.115764	products/158d1240-fb96-45b7-b86a-55c69809dec4/c7ftv1x1ihmzw3l6srtu	c7ftv1x1ihmzw3l6srtu	http://res.cloudinary.com/e-commerce-example/image/upload/v1686709986/products/158d1240-fb96-45b7-b86a-55c69809dec4/c7ftv1x1ihmzw3l6srtu.jpg	image	1256	1757
8b221e15-e75e-41f3-bd55-da644af19e78	2023-06-14 03:11:16.616366	2023-06-14 03:11:16.616366	products/5ac6958d-9fbe-4ab3-9d50-12490ae3cf76/oqqjzfpbpnhoui1ef3cu	oqqjzfpbpnhoui1ef3cu	http://res.cloudinary.com/e-commerce-example/image/upload/v1686712276/products/5ac6958d-9fbe-4ab3-9d50-12490ae3cf76/oqqjzfpbpnhoui1ef3cu.jpg	image	1256	1757
c2793fed-29a3-47f5-b3c4-3b7f7278fefd	2023-06-14 03:11:16.721216	2023-06-14 03:11:16.721216	products/5ac6958d-9fbe-4ab3-9d50-12490ae3cf76/o7ok1kemyngs2psnn7vp	o7ok1kemyngs2psnn7vp	http://res.cloudinary.com/e-commerce-example/image/upload/v1686712276/products/5ac6958d-9fbe-4ab3-9d50-12490ae3cf76/o7ok1kemyngs2psnn7vp.jpg	image	1256	1757
38e56cd0-54d1-4ac9-b71d-1d319c674378	2023-06-14 03:37:14.151355	2023-06-14 03:37:14.151355	products/8a4360bd-1215-46e3-b37d-1828e806ee7c/j0z15lecwtntmsuo7cnq	j0z15lecwtntmsuo7cnq	http://res.cloudinary.com/e-commerce-example/image/upload/v1686713833/products/8a4360bd-1215-46e3-b37d-1828e806ee7c/j0z15lecwtntmsuo7cnq.jpg	image	1256	1757
20813a39-37d6-4d84-813e-730514838e14	2023-06-14 03:37:14.167988	2023-06-14 03:37:14.167988	products/8a4360bd-1215-46e3-b37d-1828e806ee7c/ld2ijif9vz3b4ybiahyy	ld2ijif9vz3b4ybiahyy	http://res.cloudinary.com/e-commerce-example/image/upload/v1686713833/products/8a4360bd-1215-46e3-b37d-1828e806ee7c/ld2ijif9vz3b4ybiahyy.jpg	image	1256	1757
90721eb7-02a6-40ad-9a27-9e7745149abb	2023-06-14 09:05:30.021765	2023-06-14 09:05:30.021765	products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/mzgfjnpiqf2efddc1fgb	mzgfjnpiqf2efddc1fgb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686733529/products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/mzgfjnpiqf2efddc1fgb.jpg	image	768	1152
a24ff9fa-e01e-45a8-ab7f-706d94653456	2023-06-14 09:05:30.056488	2023-06-14 09:05:30.056488	products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/hthwa4bwnqudydqllav7	hthwa4bwnqudydqllav7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686733529/products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/hthwa4bwnqudydqllav7.jpg	image	768	1152
4011145a-b03c-4b68-83a6-63db43902ed8	2023-06-14 09:05:30.147778	2023-06-14 09:05:30.147778	products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/rylzuvakgi9waoyjmhf9	rylzuvakgi9waoyjmhf9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686733529/products/9f6bea20-bbd2-43db-bc89-4e2b32fae406/rylzuvakgi9waoyjmhf9.jpg	image	768	1152
907700f5-d8ca-457e-b675-00b9b2f55ad4	2023-06-14 09:07:30.457538	2023-06-14 09:07:30.457538	products/64ba5389-494f-45a0-abb9-691e3d6ce763/o5ou8gbj8ngc615lg93g	o5ou8gbj8ngc615lg93g	http://res.cloudinary.com/e-commerce-example/image/upload/v1686733649/products/64ba5389-494f-45a0-abb9-691e3d6ce763/o5ou8gbj8ngc615lg93g.jpg	image	768	1152
bc335e42-acc2-4ddd-be20-31b4bbf573cf	2023-06-14 09:07:32.186271	2023-06-14 09:07:32.186271	products/64ba5389-494f-45a0-abb9-691e3d6ce763/w9fcyp6daesv1ongw3fd	w9fcyp6daesv1ongw3fd	http://res.cloudinary.com/e-commerce-example/image/upload/v1686733651/products/64ba5389-494f-45a0-abb9-691e3d6ce763/w9fcyp6daesv1ongw3fd.jpg	image	768	1152
440a735c-40f7-4f6f-919e-582be7487f21	2023-06-14 09:28:35.640252	2023-06-14 09:28:35.640252	products/611e9037-7498-4696-8688-8b6997816a74/u5pi4qnvhskep2geb9q2	u5pi4qnvhskep2geb9q2	http://res.cloudinary.com/e-commerce-example/image/upload/v1686734915/products/611e9037-7498-4696-8688-8b6997816a74/u5pi4qnvhskep2geb9q2.jpg	image	768	1152
b954897f-45d8-408e-aefe-8a8955ba445c	2023-06-14 09:28:35.682193	2023-06-14 09:28:35.682193	products/611e9037-7498-4696-8688-8b6997816a74/vcqvh4rar8rv8gfoqbkt	vcqvh4rar8rv8gfoqbkt	http://res.cloudinary.com/e-commerce-example/image/upload/v1686734915/products/611e9037-7498-4696-8688-8b6997816a74/vcqvh4rar8rv8gfoqbkt.jpg	image	768	1152
493d5651-e4fd-4f56-8ba8-9b8e4baeb106	2023-06-14 09:28:35.72792	2023-06-14 09:28:35.72792	products/611e9037-7498-4696-8688-8b6997816a74/rer86wwq42wkpvh2qmxv	rer86wwq42wkpvh2qmxv	http://res.cloudinary.com/e-commerce-example/image/upload/v1686734915/products/611e9037-7498-4696-8688-8b6997816a74/rer86wwq42wkpvh2qmxv.jpg	image	768	1152
30cd0b12-28df-40e1-ba01-40e056b0823e	2023-06-14 09:28:35.808555	2023-06-14 09:28:35.808555	products/611e9037-7498-4696-8688-8b6997816a74/udl4a7e8nmop9zfr9bip	udl4a7e8nmop9zfr9bip	http://res.cloudinary.com/e-commerce-example/image/upload/v1686734915/products/611e9037-7498-4696-8688-8b6997816a74/udl4a7e8nmop9zfr9bip.jpg	image	768	1152
faff7d73-09ce-4f56-972c-1981c94dce53	2023-06-14 09:30:01.655482	2023-06-14 09:30:01.655482	products/840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c/q5dxpf9eohvzuvvjruho	q5dxpf9eohvzuvvjruho	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735001/products/840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c/q5dxpf9eohvzuvvjruho.jpg	image	768	1152
92ee662a-6165-46a8-a802-53541b2ca456	2023-06-14 09:30:01.701706	2023-06-14 09:30:01.701706	products/840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c/p2kbkja7e3wonu2tzejs	p2kbkja7e3wonu2tzejs	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735001/products/840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c/p2kbkja7e3wonu2tzejs.jpg	image	768	1152
b7c57d1b-df96-4cb6-ab95-85e897955c02	2023-06-14 09:30:58.138984	2023-06-14 09:30:58.138984	products/1e43d324-bdec-4247-acff-eea4af35beff/myfuclutkldyyjrgrfsi	myfuclutkldyyjrgrfsi	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735057/products/1e43d324-bdec-4247-acff-eea4af35beff/myfuclutkldyyjrgrfsi.jpg	image	768	1152
ad2beebc-21f0-42d8-93ed-80845082ef09	2023-06-14 09:30:58.294017	2023-06-14 09:30:58.294017	products/1e43d324-bdec-4247-acff-eea4af35beff/zckz7oehqsleufqfbhkf	zckz7oehqsleufqfbhkf	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735057/products/1e43d324-bdec-4247-acff-eea4af35beff/zckz7oehqsleufqfbhkf.jpg	image	768	1152
633f650c-2a1d-4966-8471-db9cd5e2bc79	2023-06-14 09:32:08.510109	2023-06-14 09:32:08.510109	products/a9dcbd11-a664-44b8-b670-b65cffc1df36/adkcxdenzwsh1ej6nbdp	adkcxdenzwsh1ej6nbdp	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735128/products/a9dcbd11-a664-44b8-b670-b65cffc1df36/adkcxdenzwsh1ej6nbdp.jpg	image	768	1152
9ac58b3f-3122-4b11-9907-ddc6912a5ba7	2023-06-14 09:32:08.631111	2023-06-14 09:32:08.631111	products/a9dcbd11-a664-44b8-b670-b65cffc1df36/vfuvdbw2ph4bsskjkkiv	vfuvdbw2ph4bsskjkkiv	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735128/products/a9dcbd11-a664-44b8-b670-b65cffc1df36/vfuvdbw2ph4bsskjkkiv.jpg	image	768	1152
aabb6415-6fd6-4850-866a-fd6017bf7aad	2023-06-14 09:32:09.297118	2023-06-14 09:32:09.297118	products/a9dcbd11-a664-44b8-b670-b65cffc1df36/ibarqfxutp469mumeiam	ibarqfxutp469mumeiam	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735128/products/a9dcbd11-a664-44b8-b670-b65cffc1df36/ibarqfxutp469mumeiam.jpg	image	768	1152
b54a2e6a-6f7e-4b9e-bcfc-f0ebbabe28e9	2023-06-14 09:33:32.409579	2023-06-14 09:33:32.409579	products/d4600980-2b88-47fd-9db4-367bc55a3308/o6cn6lpirhhh2xcds4z4	o6cn6lpirhhh2xcds4z4	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735211/products/d4600980-2b88-47fd-9db4-367bc55a3308/o6cn6lpirhhh2xcds4z4.jpg	image	768	1152
7abb17c8-cc24-4f2a-81cc-98e5d4c74015	2023-06-14 09:33:32.437394	2023-06-14 09:33:32.437394	products/d4600980-2b88-47fd-9db4-367bc55a3308/serf9xly2cdcz4hzvvcn	serf9xly2cdcz4hzvvcn	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735211/products/d4600980-2b88-47fd-9db4-367bc55a3308/serf9xly2cdcz4hzvvcn.jpg	image	768	1152
6887e4fe-67db-4155-9d20-529f6fa613f5	2023-06-14 09:41:40.250587	2023-06-14 09:41:40.250587	products/3c59856c-9e30-464e-b753-ae63a0d8e75d/f8g1gv3xes5kgleezxat	f8g1gv3xes5kgleezxat	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735699/products/3c59856c-9e30-464e-b753-ae63a0d8e75d/f8g1gv3xes5kgleezxat.jpg	image	768	1152
4270167d-d91f-4ef4-96d1-23f05f13c2f2	2023-06-14 09:41:40.308165	2023-06-14 09:41:40.308165	products/3c59856c-9e30-464e-b753-ae63a0d8e75d/u7vp2sbc9pjv07tidadl	u7vp2sbc9pjv07tidadl	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735699/products/3c59856c-9e30-464e-b753-ae63a0d8e75d/u7vp2sbc9pjv07tidadl.jpg	image	768	1152
1d7e3c82-51c6-42f9-83d4-3722b6bc017b	2023-06-14 09:41:40.484641	2023-06-14 09:41:40.484641	products/3c59856c-9e30-464e-b753-ae63a0d8e75d/yk084mcgnhfkdcsugcp6	yk084mcgnhfkdcsugcp6	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735699/products/3c59856c-9e30-464e-b753-ae63a0d8e75d/yk084mcgnhfkdcsugcp6.jpg	image	768	1152
edb477fa-32b9-462f-959a-cee1d138aeff	2023-06-14 09:43:13.341334	2023-06-14 09:43:13.341334	products/07c234c3-9c7d-432e-b9f2-423603b23a47/ng3bvvt0hsyhwwnxmips	ng3bvvt0hsyhwwnxmips	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735792/products/07c234c3-9c7d-432e-b9f2-423603b23a47/ng3bvvt0hsyhwwnxmips.jpg	image	768	1152
4357417b-9eed-42b2-8e0b-b2a4f6a55377	2023-06-14 09:43:13.71051	2023-06-14 09:43:13.71051	products/07c234c3-9c7d-432e-b9f2-423603b23a47/fej8n2i7rtcqoohxzcam	fej8n2i7rtcqoohxzcam	http://res.cloudinary.com/e-commerce-example/image/upload/v1686735792/products/07c234c3-9c7d-432e-b9f2-423603b23a47/fej8n2i7rtcqoohxzcam.jpg	image	768	1152
24d15e79-e66b-4f3d-a22d-4d0ca80b52a9	2023-06-14 09:48:06.6593	2023-06-14 09:48:06.6593	products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/pqzhwbqlxokwy0dzedm7	pqzhwbqlxokwy0dzedm7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736086/products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/pqzhwbqlxokwy0dzedm7.jpg	image	768	1152
320efc6d-dae8-49f6-bfcf-a9735f9dfbed	2023-06-14 09:48:06.693737	2023-06-14 09:48:06.693737	products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/ppy4xr2oj16id31cpym9	ppy4xr2oj16id31cpym9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736086/products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/ppy4xr2oj16id31cpym9.jpg	image	768	1152
43b449e3-7eb6-4d6b-af1f-6216bc388446	2023-06-14 09:48:06.703286	2023-06-14 09:48:06.703286	products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/yahejjx7drvmvrenpihn	yahejjx7drvmvrenpihn	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736086/products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/yahejjx7drvmvrenpihn.jpg	image	768	1152
58463a88-e160-422c-881e-f8ecf2a10a4c	2023-06-14 09:48:06.728391	2023-06-14 09:48:06.728391	products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/cnq2elaxhuutuzfth4t9	cnq2elaxhuutuzfth4t9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736086/products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/cnq2elaxhuutuzfth4t9.jpg	image	768	1152
f082eb8f-c042-4b1b-85d5-e50c68ee7e49	2023-06-14 09:48:06.841614	2023-06-14 09:48:06.841614	products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/ka0whewyriyu1db7gjoi	ka0whewyriyu1db7gjoi	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736086/products/7b5b1783-c8c5-4eec-a0be-eca47bb40d3e/ka0whewyriyu1db7gjoi.jpg	image	768	1152
d6375bea-ab23-4003-a0a8-1225fe343740	2023-06-14 09:55:37.786424	2023-06-14 09:55:37.786424	products/a2551f45-1a83-4d1e-94cf-03c66a8b65eb/wrsrcls2syer2gputehv	wrsrcls2syer2gputehv	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736537/products/a2551f45-1a83-4d1e-94cf-03c66a8b65eb/wrsrcls2syer2gputehv.jpg	image	768	1152
47c19c97-3904-4fc3-84f4-7f0bf8347c8a	2023-06-14 09:55:37.869868	2023-06-14 09:55:37.869868	products/a2551f45-1a83-4d1e-94cf-03c66a8b65eb/y6davywyzxgbchjdrcdj	y6davywyzxgbchjdrcdj	http://res.cloudinary.com/e-commerce-example/image/upload/v1686736537/products/a2551f45-1a83-4d1e-94cf-03c66a8b65eb/y6davywyzxgbchjdrcdj.jpg	image	768	1152
2ef25073-f52e-4e79-8b48-7e4ff12cacb4	2023-06-14 10:39:30.267041	2023-06-14 10:39:30.267041	products/a5703a54-782a-4e59-9ac3-3a4eac93c4cc/htz2kutrbgte0bvvmqv9	htz2kutrbgte0bvvmqv9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739169/products/a5703a54-782a-4e59-9ac3-3a4eac93c4cc/htz2kutrbgte0bvvmqv9.jpg	image	768	1152
efaa5a65-4ddd-4fe3-983d-c27a0259aff3	2023-06-14 10:39:30.295427	2023-06-14 10:39:30.295427	products/a5703a54-782a-4e59-9ac3-3a4eac93c4cc/k5tzaaoq6he1j49h7ye7	k5tzaaoq6he1j49h7ye7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739169/products/a5703a54-782a-4e59-9ac3-3a4eac93c4cc/k5tzaaoq6he1j49h7ye7.jpg	image	768	1152
fe196361-47ed-44f1-93bf-a42b59daa31d	2023-06-14 10:40:48.150366	2023-06-14 10:40:48.150366	products/62f17240-a3f4-472e-ba06-205de4cad742/cjrab3c0i3stsr6vcyra	cjrab3c0i3stsr6vcyra	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739247/products/62f17240-a3f4-472e-ba06-205de4cad742/cjrab3c0i3stsr6vcyra.jpg	image	768	1152
0c4e9083-58d3-41c4-b405-ac54cf7c690e	2023-06-14 10:40:48.192013	2023-06-14 10:40:48.192013	products/62f17240-a3f4-472e-ba06-205de4cad742/wdxnbot9e5xyce90c0v8	wdxnbot9e5xyce90c0v8	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739247/products/62f17240-a3f4-472e-ba06-205de4cad742/wdxnbot9e5xyce90c0v8.jpg	image	768	1152
8fbf96a3-681b-46d4-bbbd-693c2865db38	2023-06-14 10:40:48.242218	2023-06-14 10:40:48.242218	products/62f17240-a3f4-472e-ba06-205de4cad742/myozdi8o9ioqomt2cd2f	myozdi8o9ioqomt2cd2f	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739247/products/62f17240-a3f4-472e-ba06-205de4cad742/myozdi8o9ioqomt2cd2f.jpg	image	768	1152
b8cce727-6334-48df-ac53-e87c22972757	2023-06-14 10:40:48.337121	2023-06-14 10:40:48.337121	products/62f17240-a3f4-472e-ba06-205de4cad742/k14z4qzdrpmjkhwdp0tc	k14z4qzdrpmjkhwdp0tc	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739247/products/62f17240-a3f4-472e-ba06-205de4cad742/k14z4qzdrpmjkhwdp0tc.jpg	image	768	1152
7f625358-d156-41a7-86e9-a315fa40a738	2023-06-14 10:40:48.451794	2023-06-14 10:40:48.451794	products/62f17240-a3f4-472e-ba06-205de4cad742/n7ltf30bhjz1lnmviu0s	n7ltf30bhjz1lnmviu0s	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739247/products/62f17240-a3f4-472e-ba06-205de4cad742/n7ltf30bhjz1lnmviu0s.jpg	image	768	1152
3d1c3312-9a04-4e6c-825d-e57cd2eedf66	2023-06-14 10:42:04.024058	2023-06-14 10:42:04.024058	products/06e6feb1-bba0-492e-acdf-d3a664be350e/zb0qujy5xc1gcosozjue	zb0qujy5xc1gcosozjue	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739323/products/06e6feb1-bba0-492e-acdf-d3a664be350e/zb0qujy5xc1gcosozjue.jpg	image	768	1152
7b22f438-b01e-4373-83c8-0471debbcf89	2023-06-14 10:42:04.037351	2023-06-14 10:42:04.037351	products/06e6feb1-bba0-492e-acdf-d3a664be350e/viqtb5o6unvgminnhybf	viqtb5o6unvgminnhybf	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739323/products/06e6feb1-bba0-492e-acdf-d3a664be350e/viqtb5o6unvgminnhybf.jpg	image	768	1152
feac8995-61a5-4328-972b-617380273849	2023-06-14 10:42:04.326402	2023-06-14 10:42:04.326402	products/06e6feb1-bba0-492e-acdf-d3a664be350e/od7umgnqbkgxk6xvypou	od7umgnqbkgxk6xvypou	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739323/products/06e6feb1-bba0-492e-acdf-d3a664be350e/od7umgnqbkgxk6xvypou.jpg	image	768	1152
f217ff36-fb0c-4cc3-aa86-e2bf7ffdd189	2023-06-14 10:43:34.405142	2023-06-14 10:43:34.405142	products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/pgfjqndb1tkyjlq6quzg	pgfjqndb1tkyjlq6quzg	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739414/products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/pgfjqndb1tkyjlq6quzg.jpg	image	768	1152
73478bc8-7c12-4370-9bee-95e97af057fe	2023-06-14 10:43:34.561549	2023-06-14 10:43:34.561549	products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/wjyl7qoxfohxr2hs7vwe	wjyl7qoxfohxr2hs7vwe	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739414/products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/wjyl7qoxfohxr2hs7vwe.jpg	image	768	1152
4754f32e-b856-49d9-a9ce-b90aef476116	2023-06-14 10:43:34.561898	2023-06-14 10:43:34.561898	products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/jq3nthfk9ac2nyydnxk3	jq3nthfk9ac2nyydnxk3	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739414/products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/jq3nthfk9ac2nyydnxk3.jpg	image	768	1152
7b5db65d-aa71-411c-b537-447e394bd8ed	2023-06-14 10:43:34.618303	2023-06-14 10:43:34.618303	products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/u5e3cf5smxwddhaazd7j	u5e3cf5smxwddhaazd7j	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739413/products/ea6eeabe-25df-4250-a9dd-3a0ad9606480/u5e3cf5smxwddhaazd7j.jpg	image	768	1152
72bd75c4-d25c-447a-9931-f8f599afe3bf	2023-06-14 10:44:30.483929	2023-06-14 10:44:30.483929	products/503710a0-09b0-4732-b329-56c5ab449e00/ixnp9s9w6dlo0f3u9o9f	ixnp9s9w6dlo0f3u9o9f	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739470/products/503710a0-09b0-4732-b329-56c5ab449e00/ixnp9s9w6dlo0f3u9o9f.jpg	image	768	1152
3a03fab9-eb37-4296-bc15-ffdba22bd100	2023-06-14 10:44:30.502534	2023-06-14 10:44:30.502534	products/503710a0-09b0-4732-b329-56c5ab449e00/vhj5qvp673j2pvgp2w2z	vhj5qvp673j2pvgp2w2z	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739470/products/503710a0-09b0-4732-b329-56c5ab449e00/vhj5qvp673j2pvgp2w2z.jpg	image	768	1152
a2821da2-e054-4ca7-9e37-193effd2ddf4	2023-06-14 10:44:30.693098	2023-06-14 10:44:30.693098	products/503710a0-09b0-4732-b329-56c5ab449e00/dbapbyolxmfdcejgprjv	dbapbyolxmfdcejgprjv	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739470/products/503710a0-09b0-4732-b329-56c5ab449e00/dbapbyolxmfdcejgprjv.jpg	image	768	1152
bfd1f3cd-0315-4c06-8e24-d9ae127cdc3e	2023-06-14 10:45:33.547151	2023-06-14 10:45:33.547151	products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/eleisqaivlpodqny8lfb	eleisqaivlpodqny8lfb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739533/products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/eleisqaivlpodqny8lfb.jpg	image	768	1152
283fde90-0ca3-497f-87e5-6133700b564b	2023-06-14 10:45:33.669628	2023-06-14 10:45:33.669628	products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/auqiihuw493dp29jt0gg	auqiihuw493dp29jt0gg	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739533/products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/auqiihuw493dp29jt0gg.jpg	image	768	1152
fd933304-363a-4f0b-ba6b-bf8c4e0884bb	2023-06-14 10:45:33.687763	2023-06-14 10:45:33.687763	products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/deknaftewf8ahucd1h0a	deknaftewf8ahucd1h0a	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739533/products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/deknaftewf8ahucd1h0a.jpg	image	768	1152
2c1a0924-7122-4473-80f4-f374a4d2fe93	2023-06-14 10:45:33.845699	2023-06-14 10:45:33.845699	products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/jryrxwuqbdkinn5d74i1	jryrxwuqbdkinn5d74i1	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739533/products/cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3/jryrxwuqbdkinn5d74i1.jpg	image	768	1152
02e3b4aa-61b8-4910-b4db-23f630b82f52	2023-06-14 10:46:15.773406	2023-06-14 10:46:15.773406	products/85274b42-6f1f-475f-b9b5-9ceb0b837720/o9byeyfjmvzgeq2bcya5	o9byeyfjmvzgeq2bcya5	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739575/products/85274b42-6f1f-475f-b9b5-9ceb0b837720/o9byeyfjmvzgeq2bcya5.jpg	image	768	1152
11cd3059-27c5-49bd-b0f0-a1be62568f19	2023-06-14 10:46:15.800223	2023-06-14 10:46:15.800223	products/85274b42-6f1f-475f-b9b5-9ceb0b837720/qcy7dgbabivj3mkuida1	qcy7dgbabivj3mkuida1	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739575/products/85274b42-6f1f-475f-b9b5-9ceb0b837720/qcy7dgbabivj3mkuida1.jpg	image	768	1152
e9ecaa67-bc85-4e45-ae12-b49813dfb3db	2023-06-14 10:47:02.533816	2023-06-14 10:47:02.533816	products/1c2956c8-4808-453a-b2e6-f546cc8435aa/x98rsd3vgjahpsrjndnx	x98rsd3vgjahpsrjndnx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739622/products/1c2956c8-4808-453a-b2e6-f546cc8435aa/x98rsd3vgjahpsrjndnx.jpg	image	768	1152
6535a54a-75d8-4e6b-a1a2-14624ee193f4	2023-06-14 10:47:02.645069	2023-06-14 10:47:02.645069	products/1c2956c8-4808-453a-b2e6-f546cc8435aa/y0zdoybzvgvtt3puuni2	y0zdoybzvgvtt3puuni2	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739622/products/1c2956c8-4808-453a-b2e6-f546cc8435aa/y0zdoybzvgvtt3puuni2.jpg	image	768	1152
06d48f8b-067f-46c9-b40f-4122e6473ab3	2023-06-14 10:48:26.542013	2023-06-14 10:48:26.542013	products/595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe/w6bpehygstavjj4cbmcs	w6bpehygstavjj4cbmcs	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739706/products/595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe/w6bpehygstavjj4cbmcs.jpg	image	768	1152
c558935e-0dd8-4402-b6e6-3fac5ceb1726	2023-06-14 10:50:03.639168	2023-06-14 10:50:03.639168	products/8dfd5af9-68d2-483f-be7b-d3b53f6c2f43/kf1dyvqfo5aanz8r8gu7	kf1dyvqfo5aanz8r8gu7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739803/products/8dfd5af9-68d2-483f-be7b-d3b53f6c2f43/kf1dyvqfo5aanz8r8gu7.jpg	image	1256	1757
99b8fa13-02d3-4fbb-8605-e43ea0d1d8ce	2023-06-14 10:50:03.796753	2023-06-14 10:50:03.796753	products/8dfd5af9-68d2-483f-be7b-d3b53f6c2f43/ybbkwhcoxsatdb9uybs9	ybbkwhcoxsatdb9uybs9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739803/products/8dfd5af9-68d2-483f-be7b-d3b53f6c2f43/ybbkwhcoxsatdb9uybs9.jpg	image	1256	1757
541a6bdc-a119-4954-9117-12729aecfbba	2023-06-14 10:51:22.110318	2023-06-14 10:51:22.110318	products/b3888a76-a491-48c0-9383-784242ab4199/za3culuu6qtuau5sncjb	za3culuu6qtuau5sncjb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739881/products/b3888a76-a491-48c0-9383-784242ab4199/za3culuu6qtuau5sncjb.jpg	image	1256	1757
a3930095-1a9e-4ed7-94c4-4225c463dff4	2023-06-14 10:51:22.260108	2023-06-14 10:51:22.260108	products/b3888a76-a491-48c0-9383-784242ab4199/t9oropzwao0klhdlrodo	t9oropzwao0klhdlrodo	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739881/products/b3888a76-a491-48c0-9383-784242ab4199/t9oropzwao0klhdlrodo.jpg	image	1256	1757
e624ccf4-faed-4f5e-9e07-ba2252bec21a	2023-06-14 10:51:22.284124	2023-06-14 10:51:22.284124	products/b3888a76-a491-48c0-9383-784242ab4199/mubizednvvq6im9xwqgz	mubizednvvq6im9xwqgz	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739881/products/b3888a76-a491-48c0-9383-784242ab4199/mubizednvvq6im9xwqgz.jpg	image	1256	1757
caf79924-7b4a-4131-808e-5ce34b135496	2023-06-14 10:52:47.361671	2023-06-14 10:52:47.361671	products/bc9a686e-17eb-4355-8721-07175dde489b/yqjagshd8mhg1v3cpqo6	yqjagshd8mhg1v3cpqo6	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739967/products/bc9a686e-17eb-4355-8721-07175dde489b/yqjagshd8mhg1v3cpqo6.jpg	image	1256	1757
e4f2717e-1ab9-48c1-86f3-c8b98af7d277	2023-06-14 10:52:47.573414	2023-06-14 10:52:47.573414	products/bc9a686e-17eb-4355-8721-07175dde489b/umm2ibmmkkoymkq5ryaf	umm2ibmmkkoymkq5ryaf	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739967/products/bc9a686e-17eb-4355-8721-07175dde489b/umm2ibmmkkoymkq5ryaf.jpg	image	1256	1757
1df577ff-7cb6-4150-98ba-d5b2150c7692	2023-06-14 10:52:47.641876	2023-06-14 10:52:47.641876	products/bc9a686e-17eb-4355-8721-07175dde489b/oehfzqxhsom43cflgsmb	oehfzqxhsom43cflgsmb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739967/products/bc9a686e-17eb-4355-8721-07175dde489b/oehfzqxhsom43cflgsmb.jpg	image	1256	1757
8ae1bf1c-1e42-4c1c-b7dc-f39a9e46d171	2023-06-14 10:52:47.723522	2023-06-14 10:52:47.723522	products/bc9a686e-17eb-4355-8721-07175dde489b/wkmtos3a4bjykbm3cvzr	wkmtos3a4bjykbm3cvzr	http://res.cloudinary.com/e-commerce-example/image/upload/v1686739967/products/bc9a686e-17eb-4355-8721-07175dde489b/wkmtos3a4bjykbm3cvzr.jpg	image	1256	1757
95437858-a38c-48b1-8c05-021333ad451e	2023-06-14 10:53:30.719996	2023-06-14 10:53:30.719996	products/f2725de1-5816-49b4-b7e8-7e4d4bcc1913/ptvj9budvwnrnyeuxuta	ptvj9budvwnrnyeuxuta	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740010/products/f2725de1-5816-49b4-b7e8-7e4d4bcc1913/ptvj9budvwnrnyeuxuta.jpg	image	1256	1757
403aff45-45fd-4f77-9dc7-19c532f2b26f	2023-06-14 10:54:40.458712	2023-06-14 10:54:40.458712	products/831453bd-bb1f-4c45-b11f-15d16f7f1236/yw388tu6bp8uio8dcfup	yw388tu6bp8uio8dcfup	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740079/products/831453bd-bb1f-4c45-b11f-15d16f7f1236/yw388tu6bp8uio8dcfup.jpg	image	1256	1757
37c8b337-95bd-434e-98fc-60e8d7cdf97e	2023-06-14 10:54:40.51991	2023-06-14 10:54:40.51991	products/831453bd-bb1f-4c45-b11f-15d16f7f1236/of5wnchfzsfg9y3ndk5e	of5wnchfzsfg9y3ndk5e	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740080/products/831453bd-bb1f-4c45-b11f-15d16f7f1236/of5wnchfzsfg9y3ndk5e.jpg	image	1256	1757
a2f4ae5c-9561-4bb1-ab57-d772ac420cb2	2023-06-14 10:55:43.530616	2023-06-14 10:55:43.530616	products/773353c3-1ed0-4bc6-9e32-63f0b4f481e8/u5foyumb2yaw9gw62za0	u5foyumb2yaw9gw62za0	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740143/products/773353c3-1ed0-4bc6-9e32-63f0b4f481e8/u5foyumb2yaw9gw62za0.jpg	image	1256	1757
dcbe944c-0727-42fa-aed9-40d0e3412c78	2023-06-14 10:55:43.670449	2023-06-14 10:55:43.670449	products/773353c3-1ed0-4bc6-9e32-63f0b4f481e8/xholjerpo3tutn7sypdo	xholjerpo3tutn7sypdo	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740143/products/773353c3-1ed0-4bc6-9e32-63f0b4f481e8/xholjerpo3tutn7sypdo.jpg	image	1256	1757
f90aee5b-586f-4c39-a9f5-75dbf7a10109	2023-06-14 10:56:42.584181	2023-06-14 10:56:42.584181	products/4ae30169-15f3-4c97-8a96-66934b2294c9/vhodjgwjqkynu6okqgnp	vhodjgwjqkynu6okqgnp	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740202/products/4ae30169-15f3-4c97-8a96-66934b2294c9/vhodjgwjqkynu6okqgnp.jpg	image	1256	1757
d99c01cf-d21d-4fd5-8cc0-aa545c7d1996	2023-06-14 10:56:42.641856	2023-06-14 10:56:42.641856	products/4ae30169-15f3-4c97-8a96-66934b2294c9/irayb1p1nyokgph4dst4	irayb1p1nyokgph4dst4	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740202/products/4ae30169-15f3-4c97-8a96-66934b2294c9/irayb1p1nyokgph4dst4.jpg	image	1256	1757
1db83119-cbb6-44af-8ef0-7f70d79a8f33	2023-06-14 10:56:42.678712	2023-06-14 10:56:42.678712	products/4ae30169-15f3-4c97-8a96-66934b2294c9/euxa7flonudtfpzkxjog	euxa7flonudtfpzkxjog	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740202/products/4ae30169-15f3-4c97-8a96-66934b2294c9/euxa7flonudtfpzkxjog.jpg	image	1256	1757
2338b1f9-5ee6-4210-b5a3-2c44d6cc5416	2023-06-14 10:56:42.709498	2023-06-14 10:56:42.709498	products/4ae30169-15f3-4c97-8a96-66934b2294c9/bruu26ojdshrfrxufcyx	bruu26ojdshrfrxufcyx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740202/products/4ae30169-15f3-4c97-8a96-66934b2294c9/bruu26ojdshrfrxufcyx.jpg	image	1256	1757
fbcc6b47-ebfe-4767-8efa-a73056331cac	2023-06-14 10:57:48.925282	2023-06-14 10:57:48.925282	products/82f01998-4fbd-4269-8e38-2a25ac8bf3d3/gqlrqg6clrwspgh6tk24	gqlrqg6clrwspgh6tk24	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740268/products/82f01998-4fbd-4269-8e38-2a25ac8bf3d3/gqlrqg6clrwspgh6tk24.jpg	image	1256	1757
5d053b61-db11-434e-8c1f-5a9f8e5887ed	2023-06-14 10:57:48.969235	2023-06-14 10:57:48.969235	products/82f01998-4fbd-4269-8e38-2a25ac8bf3d3/pkyqgfm26wmjhmmpudwt	pkyqgfm26wmjhmmpudwt	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740268/products/82f01998-4fbd-4269-8e38-2a25ac8bf3d3/pkyqgfm26wmjhmmpudwt.jpg	image	1256	1757
2b756a8b-e1ea-4002-9f05-f67b221ec946	2023-06-14 10:58:47.630519	2023-06-14 10:58:47.630519	products/af92aa49-22fd-4390-a1ee-649596b12d65/henc9dgb8cnnpghhfw5r	henc9dgb8cnnpghhfw5r	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740327/products/af92aa49-22fd-4390-a1ee-649596b12d65/henc9dgb8cnnpghhfw5r.jpg	image	1256	1757
e4627a5f-6df2-4fd5-97ed-a0a46f3fbb09	2023-06-14 10:58:47.785776	2023-06-14 10:58:47.785776	products/af92aa49-22fd-4390-a1ee-649596b12d65/t7feqpkubltq2xnz2tlx	t7feqpkubltq2xnz2tlx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740327/products/af92aa49-22fd-4390-a1ee-649596b12d65/t7feqpkubltq2xnz2tlx.jpg	image	1256	1757
b3e83f8c-dde6-438b-b044-8264aad9da52	2023-06-14 10:58:47.847987	2023-06-14 10:58:47.847987	products/af92aa49-22fd-4390-a1ee-649596b12d65/ys7x6utakcdqzbkhgdyf	ys7x6utakcdqzbkhgdyf	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740327/products/af92aa49-22fd-4390-a1ee-649596b12d65/ys7x6utakcdqzbkhgdyf.jpg	image	1256	1757
e0933229-09a4-4662-8d98-962f106abd45	2023-06-14 10:59:28.730728	2023-06-14 10:59:28.730728	products/bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b/mn1o1kswt0bigs9glvy2	mn1o1kswt0bigs9glvy2	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740368/products/bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b/mn1o1kswt0bigs9glvy2.jpg	image	1256	1757
61d98d10-831a-4135-9225-f25887fad276	2023-06-14 10:59:28.894515	2023-06-14 10:59:28.894515	products/bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b/gojh7isnzroqsnclcmhr	gojh7isnzroqsnclcmhr	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740368/products/bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b/gojh7isnzroqsnclcmhr.jpg	image	1256	1757
ebd06549-e998-4d67-a965-e41fd91fc423	2023-06-14 11:01:06.546561	2023-06-14 11:01:06.546561	products/96e852ca-79e6-438a-9d90-a560fc44fd92/kqx9gbnmi9zcs86fnbue	kqx9gbnmi9zcs86fnbue	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740466/products/96e852ca-79e6-438a-9d90-a560fc44fd92/kqx9gbnmi9zcs86fnbue.jpg	image	1256	1757
a9258a90-c6c3-4125-9627-4aab5908a571	2023-06-14 11:01:06.561463	2023-06-14 11:01:06.561463	products/96e852ca-79e6-438a-9d90-a560fc44fd92/dcpelo0kjuyha9bds4kl	dcpelo0kjuyha9bds4kl	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740465/products/96e852ca-79e6-438a-9d90-a560fc44fd92/dcpelo0kjuyha9bds4kl.jpg	image	1256	1757
21fbc260-245c-4afc-af30-436913189d92	2023-06-14 11:01:06.672807	2023-06-14 11:01:06.672807	products/96e852ca-79e6-438a-9d90-a560fc44fd92/meweznekmlmv8ynfvqco	meweznekmlmv8ynfvqco	http://res.cloudinary.com/e-commerce-example/image/upload/v1686740466/products/96e852ca-79e6-438a-9d90-a560fc44fd92/meweznekmlmv8ynfvqco.jpg	image	1256	1757
1092b4ae-b0cf-4f7d-8f88-b9626ce42780	2023-06-14 11:14:19.959706	2023-06-14 11:14:19.959706	products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/ebqylk5at0a7gbsdirq9	ebqylk5at0a7gbsdirq9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741259/products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/ebqylk5at0a7gbsdirq9.jpg	image	1256	1757
bc3c6090-b143-4872-bb2d-2f0cf0432f7f	2023-06-14 11:14:19.9678	2023-06-14 11:14:19.9678	products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/so514yvjblm6ksutsvc7	so514yvjblm6ksutsvc7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741259/products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/so514yvjblm6ksutsvc7.jpg	image	1256	1757
7636de03-5310-4683-ab1c-e9f28bacd987	2023-06-14 11:14:20.562849	2023-06-14 11:14:20.562849	products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/koyuegwpnialnmnmvc4z	koyuegwpnialnmnmvc4z	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741260/products/519fc9bb-58d0-4342-80d2-bce9ca2bceef/koyuegwpnialnmnmvc4z.jpg	image	1256	1757
bd86bb88-e9c4-4e05-82a2-9d7f882ead8b	2023-06-14 11:15:53.308395	2023-06-14 11:15:53.308395	products/daf599f9-6641-41da-9d88-427cd0aff377/rlboiymqnc5yx9ecikta	rlboiymqnc5yx9ecikta	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741352/products/daf599f9-6641-41da-9d88-427cd0aff377/rlboiymqnc5yx9ecikta.jpg	image	1256	1757
22fbe5e2-7936-4de8-952c-b2f2664b6838	2023-06-14 11:15:53.346476	2023-06-14 11:15:53.346476	products/daf599f9-6641-41da-9d88-427cd0aff377/lsdnlireblv3mfywh7yj	lsdnlireblv3mfywh7yj	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741352/products/daf599f9-6641-41da-9d88-427cd0aff377/lsdnlireblv3mfywh7yj.jpg	image	1256	1757
fb6252f2-d67c-4a3c-b4fd-4b8673f1d544	2023-06-14 11:16:50.288891	2023-06-14 11:16:50.288891	products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/dfbk4awoe6yglx1nygv7	dfbk4awoe6yglx1nygv7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741409/products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/dfbk4awoe6yglx1nygv7.jpg	image	1256	1757
f864350d-a24e-468c-b410-b917b7d86886	2023-06-14 11:16:50.297877	2023-06-14 11:16:50.297877	products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/ic5flsubgkouxk7yyfm3	ic5flsubgkouxk7yyfm3	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741409/products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/ic5flsubgkouxk7yyfm3.jpg	image	1256	1757
654ff88a-4a32-4e4e-b3c3-41022ff7d72b	2023-06-14 11:16:50.438908	2023-06-14 11:16:50.438908	products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/o9x2czfns35jvvqkvw5b	o9x2czfns35jvvqkvw5b	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741409/products/ba3c0b6b-35e4-41e7-9263-dd7b163c9d66/o9x2czfns35jvvqkvw5b.jpg	image	1256	1757
34d53598-1b2c-489d-8ea4-7f321f2b7811	2023-06-14 11:17:45.439106	2023-06-14 11:17:45.439106	products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/azj1nkufnytjftm4dvmz	azj1nkufnytjftm4dvmz	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741465/products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/azj1nkufnytjftm4dvmz.jpg	image	1256	1757
129d93e6-c173-4cb4-8d10-72037f67c78a	2023-06-14 11:17:45.742235	2023-06-14 11:17:45.742235	products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/uwdtqhjjwvw5fkrit9dx	uwdtqhjjwvw5fkrit9dx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741465/products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/uwdtqhjjwvw5fkrit9dx.jpg	image	1256	1757
d420df3b-b81e-44ad-9816-d70f4f710b71	2023-06-14 11:17:45.836819	2023-06-14 11:17:45.836819	products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/iuagpmyiayhsn0erthoj	iuagpmyiayhsn0erthoj	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741465/products/f6be6332-6ed2-4f55-812c-4a3a89d9a0d3/iuagpmyiayhsn0erthoj.jpg	image	1256	1757
0463abde-afac-4acb-9367-dd6a9cbac1d7	2023-06-14 11:19:06.388917	2023-06-14 11:19:06.388917	products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/lcv3cnwlupqhrcduvqia	lcv3cnwlupqhrcduvqia	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741546/products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/lcv3cnwlupqhrcduvqia.jpg	image	1256	1757
6bb5b56e-e5e4-4d7e-bdf8-45a46247df9d	2023-06-14 11:19:06.584395	2023-06-14 11:19:06.584395	products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/gydykq2gzphr1ozadiaq	gydykq2gzphr1ozadiaq	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741546/products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/gydykq2gzphr1ozadiaq.jpg	image	1256	1757
f9847ccc-5f84-448c-9204-1e727c20ab04	2023-06-14 11:19:06.896283	2023-06-14 11:19:06.896283	products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/ucykztll9clkwgpuhoc2	ucykztll9clkwgpuhoc2	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741546/products/38f65e3f-1f41-4b23-a63e-eb31378b3dd0/ucykztll9clkwgpuhoc2.jpg	image	1256	1757
311a16b9-0a72-45a5-a9ca-ecba2f4bc771	2023-06-14 11:20:14.797992	2023-06-14 11:20:14.797992	products/60449c96-7736-429c-b8a6-0696dfa6dd28/bnn2koghupy3dd5axi4j	bnn2koghupy3dd5axi4j	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741614/products/60449c96-7736-429c-b8a6-0696dfa6dd28/bnn2koghupy3dd5axi4j.jpg	image	1256	1757
30614da7-87c6-4d35-a37a-5b5ef1975962	2023-06-14 11:20:14.87023	2023-06-14 11:20:14.87023	products/60449c96-7736-429c-b8a6-0696dfa6dd28/lqjyl9jasvpjq8sbbpoo	lqjyl9jasvpjq8sbbpoo	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741614/products/60449c96-7736-429c-b8a6-0696dfa6dd28/lqjyl9jasvpjq8sbbpoo.jpg	image	1256	1757
179d4496-27b4-402b-8a0f-a6c1c7a9e08e	2023-06-14 11:20:15.105335	2023-06-14 11:20:15.105335	products/60449c96-7736-429c-b8a6-0696dfa6dd28/tlfpvs3od7bwzpvvxqnb	tlfpvs3od7bwzpvvxqnb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741614/products/60449c96-7736-429c-b8a6-0696dfa6dd28/tlfpvs3od7bwzpvvxqnb.jpg	image	1256	1757
2d36f9e4-ae26-4a69-ae2c-825d7f8f160e	2023-06-14 11:21:40.686645	2023-06-14 11:21:40.686645	products/88532d4c-e55d-4281-84b8-93b258138002/yemqx4nfeagrm8ovtfeq	yemqx4nfeagrm8ovtfeq	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741700/products/88532d4c-e55d-4281-84b8-93b258138002/yemqx4nfeagrm8ovtfeq.jpg	image	1256	1757
17533aa6-3654-401a-b50f-6ca3d54aa201	2023-06-14 11:21:40.7929	2023-06-14 11:21:40.7929	products/88532d4c-e55d-4281-84b8-93b258138002/r2ldjqditib13mqhiw7q	r2ldjqditib13mqhiw7q	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741700/products/88532d4c-e55d-4281-84b8-93b258138002/r2ldjqditib13mqhiw7q.jpg	image	1256	1757
39d747d4-7289-4d04-bcd8-c71450882666	2023-06-14 11:22:20.737024	2023-06-14 11:22:20.737024	products/cb87b1f1-efe5-480b-a61e-b878d05aba58/heeksmdrleqs9fgftifs	heeksmdrleqs9fgftifs	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741740/products/cb87b1f1-efe5-480b-a61e-b878d05aba58/heeksmdrleqs9fgftifs.jpg	image	1256	1757
2f92b4bc-00b9-470f-90f1-635e404fffc4	2023-06-14 11:22:20.852062	2023-06-14 11:22:20.852062	products/cb87b1f1-efe5-480b-a61e-b878d05aba58/kr268jqje5viaienylc9	kr268jqje5viaienylc9	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741740/products/cb87b1f1-efe5-480b-a61e-b878d05aba58/kr268jqje5viaienylc9.jpg	image	1256	1757
afda20bd-cc52-4f98-9eea-eeae5a60408a	2023-06-14 11:23:12.140221	2023-06-14 11:23:12.140221	products/1bc4ca6e-600f-4062-8fbc-9ac339c11b82/raqoj2yrzmav0quzzsnu	raqoj2yrzmav0quzzsnu	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741791/products/1bc4ca6e-600f-4062-8fbc-9ac339c11b82/raqoj2yrzmav0quzzsnu.jpg	image	1256	1757
f0396e91-5d4b-4ae6-8b2d-6fdc184cb048	2023-06-14 11:23:12.21801	2023-06-14 11:23:12.21801	products/1bc4ca6e-600f-4062-8fbc-9ac339c11b82/hh5o7b5mfo19b8kcpbve	hh5o7b5mfo19b8kcpbve	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741791/products/1bc4ca6e-600f-4062-8fbc-9ac339c11b82/hh5o7b5mfo19b8kcpbve.jpg	image	1256	1757
141d0284-206f-445f-834c-93083d307b5e	2023-06-14 11:25:11.95542	2023-06-14 11:25:11.95542	products/b8f514bc-2226-47c5-bbb0-ee606b402c13/b3lvxmcwfp1oc00kknuv	b3lvxmcwfp1oc00kknuv	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741911/products/b8f514bc-2226-47c5-bbb0-ee606b402c13/b3lvxmcwfp1oc00kknuv.jpg	image	750	1125
8ac3c3ac-5272-4674-8a20-3af1a1554bb5	2023-06-14 11:25:12.003601	2023-06-14 11:25:12.003601	products/b8f514bc-2226-47c5-bbb0-ee606b402c13/f64qjklu66sxwzkirftw	f64qjklu66sxwzkirftw	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741911/products/b8f514bc-2226-47c5-bbb0-ee606b402c13/f64qjklu66sxwzkirftw.jpg	image	750	1125
71227662-5536-417c-bb94-1c5658cc3f10	2023-06-14 11:26:08.785332	2023-06-14 11:26:08.785332	products/00b4128d-efef-4e63-9764-b4cf0943d538/w53txjampqxjbehxkygh	w53txjampqxjbehxkygh	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741968/products/00b4128d-efef-4e63-9764-b4cf0943d538/w53txjampqxjbehxkygh.jpg	image	850	1275
66c63195-88f2-420b-b0e8-4fbca2986f1e	2023-06-14 11:26:08.898053	2023-06-14 11:26:08.898053	products/00b4128d-efef-4e63-9764-b4cf0943d538/pqeulxyctur6mbu1bsoa	pqeulxyctur6mbu1bsoa	http://res.cloudinary.com/e-commerce-example/image/upload/v1686741968/products/00b4128d-efef-4e63-9764-b4cf0943d538/pqeulxyctur6mbu1bsoa.jpg	image	850	1275
d7c580c7-c4e4-4c75-949c-0600a13643b3	2023-06-14 11:27:51.96572	2023-06-14 11:27:51.96572	products/013cf771-a260-46eb-85c6-60acbfd5cb32/lhl48vh7hu5iexrljjku	lhl48vh7hu5iexrljjku	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742071/products/013cf771-a260-46eb-85c6-60acbfd5cb32/lhl48vh7hu5iexrljjku.png	image	422	918
da9d83a4-caef-4423-bb47-4c2032e3d8b0	2023-06-14 11:27:52.170684	2023-06-14 11:27:52.170684	products/013cf771-a260-46eb-85c6-60acbfd5cb32/rmgkocc16okqfdhagdud	rmgkocc16okqfdhagdud	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742071/products/013cf771-a260-46eb-85c6-60acbfd5cb32/rmgkocc16okqfdhagdud.png	image	373	892
d74b21a1-3df1-4591-9f82-8ab9199794c7	2023-06-14 11:27:52.172	2023-06-14 11:27:52.172	products/013cf771-a260-46eb-85c6-60acbfd5cb32/dz9y8qyvhggdhtdyb9yw	dz9y8qyvhggdhtdyb9yw	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742071/products/013cf771-a260-46eb-85c6-60acbfd5cb32/dz9y8qyvhggdhtdyb9yw.png	image	387	911
82253de8-3497-4f53-8102-5e22528065a0	2023-06-14 11:29:25.179892	2023-06-14 11:29:25.179892	products/a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132/rhyjfyf4ghkf1baxom31	rhyjfyf4ghkf1baxom31	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742164/products/a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132/rhyjfyf4ghkf1baxom31.jpg	image	850	1275
5379fcd7-3fc2-4242-a034-1242db119d0f	2023-06-14 11:29:25.316116	2023-06-14 11:29:25.316116	products/a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132/lv4yd58bvb4s6ijtnjoh	lv4yd58bvb4s6ijtnjoh	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742164/products/a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132/lv4yd58bvb4s6ijtnjoh.jpg	image	850	1275
08ef0e1a-5616-4af2-ac7b-069f7148e7c2	2023-06-14 11:31:07.829963	2023-06-14 11:31:07.829963	products/cea86f16-3592-420f-92c6-f20c18ef4c25/jov9oyg356wvke30l7kb	jov9oyg356wvke30l7kb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742267/products/cea86f16-3592-420f-92c6-f20c18ef4c25/jov9oyg356wvke30l7kb.jpg	image	850	1275
bf1eb56f-b4e1-4e71-87bb-4e2a77aa57b3	2023-06-14 11:31:08.097816	2023-06-14 11:31:08.097816	products/cea86f16-3592-420f-92c6-f20c18ef4c25/ldwnwevuihfgcgtn3fac	ldwnwevuihfgcgtn3fac	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742267/products/cea86f16-3592-420f-92c6-f20c18ef4c25/ldwnwevuihfgcgtn3fac.jpg	image	850	1275
f8e720e1-5689-4035-b3fb-1c1c23642d20	2023-06-14 11:34:56.538413	2023-06-14 11:34:56.538413	products/d81e30de-c240-4300-ba21-5b8643792b2e/zd6w31eeggcc7c5foy7i	zd6w31eeggcc7c5foy7i	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742496/products/d81e30de-c240-4300-ba21-5b8643792b2e/zd6w31eeggcc7c5foy7i.jpg	image	850	1275
cb97292f-0b64-4883-9a7b-925107c5f1f9	2023-06-14 11:34:56.615556	2023-06-14 11:34:56.615556	products/d81e30de-c240-4300-ba21-5b8643792b2e/lqkslq6kor6cetgobvde	lqkslq6kor6cetgobvde	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742496/products/d81e30de-c240-4300-ba21-5b8643792b2e/lqkslq6kor6cetgobvde.jpg	image	850	1275
2bdd0f6e-2eda-4c99-863e-4724b3349891	2023-06-14 11:34:56.667631	2023-06-14 11:34:56.667631	products/d81e30de-c240-4300-ba21-5b8643792b2e/ywivyioaatemphug5ych	ywivyioaatemphug5ych	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742496/products/d81e30de-c240-4300-ba21-5b8643792b2e/ywivyioaatemphug5ych.jpg	image	850	1275
fcf6ade0-e486-42c7-a6c9-8cff97704cf0	2023-06-14 11:34:56.740075	2023-06-14 11:34:56.740075	products/d81e30de-c240-4300-ba21-5b8643792b2e/td0pjvhpxdmwppksisy4	td0pjvhpxdmwppksisy4	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742496/products/d81e30de-c240-4300-ba21-5b8643792b2e/td0pjvhpxdmwppksisy4.jpg	image	850	1275
8a1226fb-a3e2-4205-8424-e67d6870b273	2023-06-14 11:35:47.750049	2023-06-14 11:35:47.750049	products/c667567a-0801-4cd3-8924-0178261af329/twwz2ka2g1lruhcjs7rc	twwz2ka2g1lruhcjs7rc	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742547/products/c667567a-0801-4cd3-8924-0178261af329/twwz2ka2g1lruhcjs7rc.jpg	image	850	1275
dc4f1975-fc66-4664-a826-445db170db65	2023-06-14 11:35:47.785712	2023-06-14 11:35:47.785712	products/c667567a-0801-4cd3-8924-0178261af329/ouajuy4gor7wvbm2usfm	ouajuy4gor7wvbm2usfm	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742547/products/c667567a-0801-4cd3-8924-0178261af329/ouajuy4gor7wvbm2usfm.jpg	image	850	1275
d5dd7f81-3498-4883-a76b-f407ea152733	2023-06-14 11:35:47.862846	2023-06-14 11:35:47.862846	products/c667567a-0801-4cd3-8924-0178261af329/iprehp7mfkq6y0fdhteb	iprehp7mfkq6y0fdhteb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742547/products/c667567a-0801-4cd3-8924-0178261af329/iprehp7mfkq6y0fdhteb.jpg	image	850	1275
acaa566d-0cea-4361-b4c2-51d0be47e939	2023-06-14 11:37:50.431288	2023-06-14 11:37:50.431288	products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/twmgywgz8pyrr38bntg0	twmgywgz8pyrr38bntg0	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742669/products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/twmgywgz8pyrr38bntg0.jpg	image	850	1275
3b42f245-b772-4ed4-8156-88a9bb5893c7	2023-06-14 11:37:50.539765	2023-06-14 11:37:50.539765	products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/warislduqc9zyntsbjje	warislduqc9zyntsbjje	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742670/products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/warislduqc9zyntsbjje.jpg	image	850	1275
20d5c9f4-691e-4524-96aa-722e449508d9	2023-06-14 11:37:50.551763	2023-06-14 11:37:50.551763	products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/x67dadayyulf6ikqqaix	x67dadayyulf6ikqqaix	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742670/products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/x67dadayyulf6ikqqaix.jpg	image	850	1275
071cc6c3-dbdd-4d26-ac82-dbfd21a2bc9e	2023-06-14 11:37:50.568809	2023-06-14 11:37:50.568809	products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/h2c7cjx5t77tfshdytoi	h2c7cjx5t77tfshdytoi	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742670/products/cdf46532-6fc1-46c7-81a3-05fdbdf92dc0/h2c7cjx5t77tfshdytoi.jpg	image	850	1275
ce8f2abc-b2ac-4b4e-876a-5919ac4b7fc2	2023-06-14 11:39:03.053686	2023-06-14 11:39:03.053686	products/edfda6a2-f5cd-421b-b6e5-391f1e216143/t284fd44rxemofw8eoae	t284fd44rxemofw8eoae	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742742/products/edfda6a2-f5cd-421b-b6e5-391f1e216143/t284fd44rxemofw8eoae.jpg	image	850	1275
bf0141e2-935c-480b-9198-884761771545	2023-06-14 11:39:03.136702	2023-06-14 11:39:03.136702	products/edfda6a2-f5cd-421b-b6e5-391f1e216143/tzdjra6hfmypkbisvytr	tzdjra6hfmypkbisvytr	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742742/products/edfda6a2-f5cd-421b-b6e5-391f1e216143/tzdjra6hfmypkbisvytr.jpg	image	850	1275
fbb7640b-e6b5-4dc2-a36d-107a7be60168	2023-06-14 11:40:04.711918	2023-06-14 11:40:04.711918	products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/gxlfxs5kbqjym3cr6bmc	gxlfxs5kbqjym3cr6bmc	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742804/products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/gxlfxs5kbqjym3cr6bmc.jpg	image	850	1275
3b3d05bb-5d05-4857-bf34-a53de80aba45	2023-06-14 11:40:04.792346	2023-06-14 11:40:04.792346	products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/ayjixgb5zlspof1rmbsx	ayjixgb5zlspof1rmbsx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742804/products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/ayjixgb5zlspof1rmbsx.jpg	image	90	135
adc83b3c-0bbf-4c4e-a460-16ff820a7538	2023-06-14 11:40:04.969937	2023-06-14 11:40:04.969937	products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/lzgesl1xeqbld3d1xpon	lzgesl1xeqbld3d1xpon	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742804/products/88a43f86-ca7b-4b1a-a144-a08cb1764c48/lzgesl1xeqbld3d1xpon.jpg	image	850	1275
27cf2d29-a99b-446b-91f1-3e7178ea1935	2023-06-14 11:40:46.247114	2023-06-14 11:40:46.247114	products/820ea58b-9d9b-45bf-aef1-da5109cd8c52/lb2dqqrsst5luk7okmub	lb2dqqrsst5luk7okmub	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742845/products/820ea58b-9d9b-45bf-aef1-da5109cd8c52/lb2dqqrsst5luk7okmub.jpg	image	850	1275
75947c11-06ff-41a0-9ca6-c9b50fe34c01	2023-06-14 11:40:46.350082	2023-06-14 11:40:46.350082	products/820ea58b-9d9b-45bf-aef1-da5109cd8c52/xryzi6ggcrxbyguxwkar	xryzi6ggcrxbyguxwkar	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742845/products/820ea58b-9d9b-45bf-aef1-da5109cd8c52/xryzi6ggcrxbyguxwkar.jpg	image	850	1275
cdc565f7-3d5c-4d5b-b213-1d024d1ae820	2023-06-14 11:41:41.905243	2023-06-14 11:41:41.905243	products/b6e9a335-0b5c-4888-83a8-c346a8228482/pla08ki0vunvzxahe6jx	pla08ki0vunvzxahe6jx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742901/products/b6e9a335-0b5c-4888-83a8-c346a8228482/pla08ki0vunvzxahe6jx.jpg	image	850	1275
cc85a85f-9727-40c2-b7a8-1cb445f361da	2023-06-14 11:41:42.332091	2023-06-14 11:41:42.332091	products/b6e9a335-0b5c-4888-83a8-c346a8228482/pukbirrmk8u6ryf1rjgk	pukbirrmk8u6ryf1rjgk	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742901/products/b6e9a335-0b5c-4888-83a8-c346a8228482/pukbirrmk8u6ryf1rjgk.jpg	image	850	1275
a1efa22e-96b5-4625-a48a-92c20a0122b6	2023-06-14 11:43:03.671602	2023-06-14 11:43:03.671602	products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/fadvanvxw0lx0rqev6zl	fadvanvxw0lx0rqev6zl	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742983/products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/fadvanvxw0lx0rqev6zl.jpg	image	850	1275
6a81e89e-3876-4103-82b0-f3f04aa70079	2023-06-14 11:43:03.702921	2023-06-14 11:43:03.702921	products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/mzwluwcevkm3pedwynrj	mzwluwcevkm3pedwynrj	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742983/products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/mzwluwcevkm3pedwynrj.jpg	image	850	1275
878b1193-3ce5-46c7-bdcc-0b2b37c548bf	2023-06-14 11:43:03.7831	2023-06-14 11:43:03.7831	products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/fqxofcye7z6nwz4iqfdx	fqxofcye7z6nwz4iqfdx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686742983/products/fb73b4d7-afb2-43ac-8dd8-9efe368078a8/fqxofcye7z6nwz4iqfdx.jpg	image	850	1275
ff6b3554-3d44-49a0-ba19-f3f49dac4a5e	2023-06-14 11:43:51.746803	2023-06-14 11:43:51.746803	products/60dd91d0-9978-420b-abcf-a07f6d30aab7/znrswzrpbxynslhdfo2h	znrswzrpbxynslhdfo2h	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743031/products/60dd91d0-9978-420b-abcf-a07f6d30aab7/znrswzrpbxynslhdfo2h.jpg	image	850	1275
8e818e42-23ee-4884-92af-0b7630588fb6	2023-06-14 11:45:10.98379	2023-06-14 11:45:10.98379	products/5f859a61-765f-40fa-8b55-96e4ba5af723/fwotun77xe3q1pcxbhjh	fwotun77xe3q1pcxbhjh	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743110/products/5f859a61-765f-40fa-8b55-96e4ba5af723/fwotun77xe3q1pcxbhjh.jpg	image	850	1275
32e3892b-067f-413d-9deb-fe3a9530c37b	2023-06-14 11:45:11.107405	2023-06-14 11:45:11.107405	products/5f859a61-765f-40fa-8b55-96e4ba5af723/qvfqycjlqvqsunh7hpmb	qvfqycjlqvqsunh7hpmb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743110/products/5f859a61-765f-40fa-8b55-96e4ba5af723/qvfqycjlqvqsunh7hpmb.jpg	image	850	1275
613b173a-0b0d-43dd-b4a3-e25322a802fc	2023-06-14 11:45:11.158368	2023-06-14 11:45:11.158368	products/5f859a61-765f-40fa-8b55-96e4ba5af723/xcuurnmwduhyg9c4sren	xcuurnmwduhyg9c4sren	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743110/products/5f859a61-765f-40fa-8b55-96e4ba5af723/xcuurnmwduhyg9c4sren.jpg	image	850	1275
40f41bec-efd6-45fa-8ddb-92da54835688	2023-06-14 11:45:11.262249	2023-06-14 11:45:11.262249	products/5f859a61-765f-40fa-8b55-96e4ba5af723/ay56vaewavtiireniagn	ay56vaewavtiireniagn	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743110/products/5f859a61-765f-40fa-8b55-96e4ba5af723/ay56vaewavtiireniagn.jpg	image	850	1275
f897402e-21f6-493f-9495-41441d0e9884	2023-06-14 11:45:11.485246	2023-06-14 11:45:11.485246	products/5f859a61-765f-40fa-8b55-96e4ba5af723/jccwun77ztjxvivogf4g	jccwun77ztjxvivogf4g	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743110/products/5f859a61-765f-40fa-8b55-96e4ba5af723/jccwun77ztjxvivogf4g.jpg	image	850	1275
50280448-7617-4a96-8d85-dacc841a923a	2023-06-14 11:46:20.526901	2023-06-14 11:46:20.526901	products/0417f0e9-b015-4e57-926c-976f2dfbea69/afrkbvwwuazmytm9prwb	afrkbvwwuazmytm9prwb	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743180/products/0417f0e9-b015-4e57-926c-976f2dfbea69/afrkbvwwuazmytm9prwb.jpg	image	850	1275
994fa6d7-4891-4879-b8ba-55506e73a9cf	2023-06-14 11:46:20.5569	2023-06-14 11:46:20.5569	products/0417f0e9-b015-4e57-926c-976f2dfbea69/lq0yxfit6jwaooipgdhz	lq0yxfit6jwaooipgdhz	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743180/products/0417f0e9-b015-4e57-926c-976f2dfbea69/lq0yxfit6jwaooipgdhz.jpg	image	850	1275
22f7992e-2aec-4b15-850d-ca56dacdf8a2	2023-06-14 11:46:20.662437	2023-06-14 11:46:20.662437	products/0417f0e9-b015-4e57-926c-976f2dfbea69/v1xnj3jlvasqkpxdu0yq	v1xnj3jlvasqkpxdu0yq	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743180/products/0417f0e9-b015-4e57-926c-976f2dfbea69/v1xnj3jlvasqkpxdu0yq.jpg	image	850	1275
3bb711e5-9733-4d54-8869-adbf509986b3	2023-06-14 11:46:20.740958	2023-06-14 11:46:20.740958	products/0417f0e9-b015-4e57-926c-976f2dfbea69/dxhzskzyvf3aojiu83g7	dxhzskzyvf3aojiu83g7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743180/products/0417f0e9-b015-4e57-926c-976f2dfbea69/dxhzskzyvf3aojiu83g7.jpg	image	850	1275
bce235a9-73e6-40a5-9f29-3a491382fd11	2023-06-14 11:50:20.511237	2023-06-14 11:50:20.511237	products/4837b446-7cfe-400c-a902-270166c7fc3c/vj5jluwebjts8drnwjy7	vj5jluwebjts8drnwjy7	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743419/products/4837b446-7cfe-400c-a902-270166c7fc3c/vj5jluwebjts8drnwjy7.png	image	454	867
a45972a7-232f-4f2f-b15b-cf22d2436c44	2023-06-14 11:51:09.981393	2023-06-14 11:51:09.981393	products/d751f004-34d7-4b8a-b4fc-04130f491ef7/dycjipno9zdijfqnbzin	dycjipno9zdijfqnbzin	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743469/products/d751f004-34d7-4b8a-b4fc-04130f491ef7/dycjipno9zdijfqnbzin.jpg	image	748	1050
7d193fe5-df14-4b0c-8de5-ccf8e8125e34	2023-06-14 11:52:15.916641	2023-06-14 11:52:15.916641	products/89cf3f60-7d9c-444b-84a3-aab4e4029355/rpx2mdoodh8tuic9d9il	rpx2mdoodh8tuic9d9il	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743535/products/89cf3f60-7d9c-444b-84a3-aab4e4029355/rpx2mdoodh8tuic9d9il.png	image	648	933
6efc13ff-eeeb-4dbd-8d33-ba9a50043d7a	2023-06-14 11:52:16.041918	2023-06-14 11:52:16.041918	products/89cf3f60-7d9c-444b-84a3-aab4e4029355/of5hcwn7qxbf48gbfhje	of5hcwn7qxbf48gbfhje	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743535/products/89cf3f60-7d9c-444b-84a3-aab4e4029355/of5hcwn7qxbf48gbfhje.png	image	689	964
51a38071-f371-454d-a595-5ec3c55cf527	2023-06-14 11:53:35.138398	2023-06-14 11:53:35.138398	products/e1680808-2448-41f0-a8c5-3c8bc3afc5ac/so7vqyr6eyb0ywoe69xc	so7vqyr6eyb0ywoe69xc	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743614/products/e1680808-2448-41f0-a8c5-3c8bc3afc5ac/so7vqyr6eyb0ywoe69xc.png	image	562	893
208c72eb-e5d0-4c58-8cf5-17aa6e7ff81d	2023-06-14 11:53:35.18748	2023-06-14 11:53:35.18748	products/e1680808-2448-41f0-a8c5-3c8bc3afc5ac/yyeuulh4u2wmfybc9p1q	yyeuulh4u2wmfybc9p1q	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743614/products/e1680808-2448-41f0-a8c5-3c8bc3afc5ac/yyeuulh4u2wmfybc9p1q.png	image	626	924
8c445d31-d090-4ef5-a7ba-32b47e45cce8	2023-06-14 11:54:52.28819	2023-06-14 11:54:52.28819	products/de9f7682-600c-4c1e-a3e6-cd186865f036/psdmhct3f9qevkwgmuyq	psdmhct3f9qevkwgmuyq	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743691/products/de9f7682-600c-4c1e-a3e6-cd186865f036/psdmhct3f9qevkwgmuyq.png	image	458	897
3e56ce98-b988-40e0-8c21-1d8c65b625ce	2023-06-14 11:54:52.319912	2023-06-14 11:54:52.319912	products/de9f7682-600c-4c1e-a3e6-cd186865f036/wsahailzbdd3l7zait5l	wsahailzbdd3l7zait5l	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743691/products/de9f7682-600c-4c1e-a3e6-cd186865f036/wsahailzbdd3l7zait5l.png	image	483	869
aa2a5d97-c82f-4cd4-a470-72c5be1ea664	2023-06-14 11:54:52.385668	2023-06-14 11:54:52.385668	products/de9f7682-600c-4c1e-a3e6-cd186865f036/ihb7gs7g3hwbppextsso	ihb7gs7g3hwbppextsso	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743691/products/de9f7682-600c-4c1e-a3e6-cd186865f036/ihb7gs7g3hwbppextsso.png	image	458	891
9a90be36-8f12-461b-8eb0-d0b01bea9750	2023-06-14 11:55:34.841868	2023-06-14 11:55:34.841868	products/e4909e63-f547-4693-8457-9b197b80bae5/z5sqmjs36cxcccfwlmcy	z5sqmjs36cxcccfwlmcy	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743734/products/e4909e63-f547-4693-8457-9b197b80bae5/z5sqmjs36cxcccfwlmcy.png	image	661	770
5ec93d4c-366b-4468-8e69-32289dc38acb	2023-06-14 11:56:41.751327	2023-06-14 11:56:41.751327	products/0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5/uofdspvxdyhmnycvr8eh	uofdspvxdyhmnycvr8eh	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743800/products/0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5/uofdspvxdyhmnycvr8eh.png	image	780	953
2bcae184-20bc-4f73-8286-cc5ffd0afdd5	2023-06-14 11:57:48.439459	2023-06-14 11:57:48.439459	products/c01e432c-eae7-44cf-99ff-7abe70484ddd/zldqisatxnmvna9e5lla	zldqisatxnmvna9e5lla	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743867/products/c01e432c-eae7-44cf-99ff-7abe70484ddd/zldqisatxnmvna9e5lla.png	image	734	926
151f551e-69dd-4e57-8a70-1f19189cf821	2023-06-14 11:57:48.520762	2023-06-14 11:57:48.520762	products/c01e432c-eae7-44cf-99ff-7abe70484ddd/vubwxo8efs6ngf23hfby	vubwxo8efs6ngf23hfby	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743868/products/c01e432c-eae7-44cf-99ff-7abe70484ddd/vubwxo8efs6ngf23hfby.png	image	686	927
90b3abd2-8146-4c42-b933-ca06c6a0d8ea	2023-06-14 11:57:48.607033	2023-06-14 11:57:48.607033	products/c01e432c-eae7-44cf-99ff-7abe70484ddd/ph7iatpt4vd4qerwfknr	ph7iatpt4vd4qerwfknr	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743868/products/c01e432c-eae7-44cf-99ff-7abe70484ddd/ph7iatpt4vd4qerwfknr.png	image	736	933
1d48c16b-b354-4e38-9370-475c5dcc1d31	2023-06-14 11:57:48.822056	2023-06-14 11:57:48.822056	products/c01e432c-eae7-44cf-99ff-7abe70484ddd/qotr5qpd412whojtqwqe	qotr5qpd412whojtqwqe	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743868/products/c01e432c-eae7-44cf-99ff-7abe70484ddd/qotr5qpd412whojtqwqe.png	image	759	943
bc5c93b2-997c-4b7a-9288-4e9b342783f3	2023-06-14 11:58:41.346393	2023-06-14 11:58:41.346393	products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/c33jdyruqcwvmsnllioy	c33jdyruqcwvmsnllioy	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743920/products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/c33jdyruqcwvmsnllioy.png	image	821	949
6d69f875-5822-4eb4-ace2-72a0e274a9c5	2023-06-14 11:58:41.490064	2023-06-14 11:58:41.490064	products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/reeubh8c6uyn3boutcco	reeubh8c6uyn3boutcco	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743920/products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/reeubh8c6uyn3boutcco.png	image	807	945
22575fec-6948-4721-ab34-b9f1c252ae98	2023-06-14 11:58:41.498056	2023-06-14 11:58:41.498056	products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/l8usaegv36gimpc72ots	l8usaegv36gimpc72ots	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743920/products/ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1/l8usaegv36gimpc72ots.png	image	782	948
abd9b664-c5ed-4532-bed5-fc6ccfc60ac3	2023-06-14 11:59:45.22341	2023-06-14 11:59:45.22341	products/894ecf35-386b-40cc-8cf9-1735a26c293d/wz082rfjyqw5xhe6bxbw	wz082rfjyqw5xhe6bxbw	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743984/products/894ecf35-386b-40cc-8cf9-1735a26c293d/wz082rfjyqw5xhe6bxbw.png	image	785	938
ab656d5e-1f46-4ddf-b66a-765592658dd2	2023-06-14 11:59:45.226144	2023-06-14 11:59:45.226144	products/894ecf35-386b-40cc-8cf9-1735a26c293d/mgsxeeezpogikaxpgyov	mgsxeeezpogikaxpgyov	http://res.cloudinary.com/e-commerce-example/image/upload/v1686743984/products/894ecf35-386b-40cc-8cf9-1735a26c293d/mgsxeeezpogikaxpgyov.png	image	769	949
88e0bdf5-9799-458d-8c97-8d08d2eb99f3	2023-06-14 12:00:33.765535	2023-06-14 12:00:33.765535	products/ed17f7e9-ca19-4561-9274-047e68e535c8/vh6db2bdlst48e95fzpx	vh6db2bdlst48e95fzpx	http://res.cloudinary.com/e-commerce-example/image/upload/v1686744033/products/ed17f7e9-ca19-4561-9274-047e68e535c8/vh6db2bdlst48e95fzpx.png	image	793	939
1810a7ee-170c-4a18-8e7f-4029d770102f	2023-06-14 12:01:17.321415	2023-06-14 12:01:17.321415	products/3c8adec9-ee5c-45a8-a7a2-90a427ab7517/knpzbdtgjtarapxq3pdo	knpzbdtgjtarapxq3pdo	http://res.cloudinary.com/e-commerce-example/image/upload/v1686744076/products/3c8adec9-ee5c-45a8-a7a2-90a427ab7517/knpzbdtgjtarapxq3pdo.png	image	719	933
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, created_at, updated_at, user_id, status, payment_method_id, delivery_method_id, delivery_address_id, subtotal_price_id, delivery_price_id, tax_price_id, total_price_id, payment_intent_id) FROM stdin;
\.


--
-- Data for Name: order_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_history (id, created_at, updated_at, order_id, status) FROM stdin;
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_item (id, created_at, updated_at, order_id, product_variant_id, warehouse_id, price_id, quantity) FROM stdin;
\.


--
-- Data for Name: payment_intent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_intent (client_secret, payment_method_id, price_id, status, created_at, updated_at, intent_id, id) FROM stdin;
\.


--
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_method (id, created_at, updated_at, code, online, name, description, status, media_id) FROM stdin;
ad540435-58ce-4374-8fd8-7ad3aa3ddccf	2023-05-26 12:01:48.613105	2023-05-26 12:01:48.613105	cash	f	Cash	Pay by cash on delivery	active	644348fc-da37-4726-8c03-05f5c0e37363
6a8a92fe-954c-4a20-a2d6-72b26308a2e2	2023-06-01 21:44:20.283848	2023-06-01 21:44:20.283848	card	t	MasterCard, Maestro, Visa, Mir, Belkart Premium	Provide your credit card credentials to pay online	active	5d00fa7f-915c-4dac-9bf8-6c842ba9a1a5
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permission (id, created_at, updated_at, action, subject, conditions) FROM stdin;
6de46443-6f80-4abc-9d03-71ee512abefc	2023-06-01 12:18:07.567536	2023-06-01 12:18:07.567536	read	PaymentIntentEntity	\N
f20d63f3-645b-42b9-a4cc-043c02d9076b	2023-06-01 12:18:07.567536	2023-06-01 12:18:07.567536	create	PaymentIntentEntity	\N
5801cad9-3966-49bd-86b2-1265e297be11	2023-06-01 12:18:07.567536	2023-06-01 12:18:07.567536	update	PaymentIntentEntity	\N
3b8bb1b4-d56d-4126-b817-9f27102e99ef	2023-06-01 12:18:07.567536	2023-06-01 12:18:07.567536	delete	PaymentIntentEntity	\N
b1ebcd29-66f7-46c6-ac9b-725ba25709f9	2023-06-01 12:18:07.567536	2023-06-01 12:18:07.567536	manage	PaymentIntentEntity	\N
d59d6548-7267-453c-88e3-0ff2bfcfeb9c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	all	\N
7fbc60af-1c25-40b8-a110-42e58af81b9b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	AddressEntity	\N
5fe90246-e482-4f18-b4ef-9cd84e79f6a7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	BrandEntity	\N
b45b4785-de1e-49e0-a6c6-d0aa16c2486b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	BrandEntity	\N
f1e1be02-0773-4873-9e97-11c51d6fab54	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	BrandEntity	\N
deb485e0-ee72-45ad-8df0-a1ade597e52c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	BrandEntity	\N
821e8306-d610-40bc-ab3d-e992fdfa4174	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	BrandEntity	\N
a7c37b79-2e6d-4e4e-b7cb-8f5c9e0d13ac	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	BrandEntity	{"userId": {"$eq": "{{userId}}"}}
263786e0-860c-46a8-a541-5ab0bf7cd6aa	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	BrandEntity	\N
c06f994f-7426-4b7a-b90a-57394fb144de	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	BrandEntity	\N
bc9de25d-99d8-47ca-b670-29a1e49846ff	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	BrandEntity	{"userId": {"$eq": "{{userId}}"}}
5f8f1412-1951-406b-aa7a-6ae216512986	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	BrandEntity	\N
c5dd95c1-3c85-445a-a9f2-c869dd77106f	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	BrandEntity	{"userId": {"$eq": "{{userId}}"}}
3f868a02-c0ab-4b95-aa8d-bfbb94b10e2c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	BrandEntity	\N
df0122cd-4b90-403f-8826-a36b06f6c350	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CartEntity	\N
baac83e1-5b54-4e89-92c8-f343dd091744	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CartEntity	{"userId": {"$eq": "{{userId}}"}}
a4f90303-f359-4fc1-8c75-f774616ffa1a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CartEntity	\N
d2a0da79-bc04-439e-ad81-721e48acc0f6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CartEntity	\N
ca98c5ee-f58b-4a54-9b71-8ec0463fbced	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CartEntity	{"userId": {"$eq": "{{userId}}"}}
03b5bbdd-8cc3-4840-920f-7d353e1c9f68	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CartEntity	\N
a7f92807-3e6a-4680-820c-de55d9b693cd	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CartEntity	{"userId": {"$eq": "{{userId}}"}}
05f1c69b-8a97-4539-8162-b73ae55cdfc7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CartEntity	\N
adcd81b7-7564-4fd2-a72e-1205b263d05f	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CartItemEntity	\N
8290c169-9d0f-4fa6-8b15-2096f358be54	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CartItemEntity	{"cart.userId": {"$eq": "{{userId}}"}}
9601cd1b-d53b-4657-b2e0-4e0a5e21ccb9	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CartItemEntity	\N
0edee3db-0f84-4a8c-a5c6-ada2691f1e0a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CartItemEntity	\N
f272a2dd-c892-4aea-b805-a84d2c270b1b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CartItemEntity	\N
e5f06fa7-d5fe-4721-8c31-28da53e8a292	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CartItemEntity	\N
24bf8ca1-5b22-4a29-badb-b11082bafa56	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CategoryEntity	\N
157f0080-2a2e-4b25-91c1-00d236499182	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CategoryEntity	\N
fbbd9d42-9cd1-4e46-835a-bfb38d807a36	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CategoryEntity	\N
28fc99a4-c24e-4d94-87b3-ff958f7b0496	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CategoryEntity	\N
cd9e9ce8-9539-421e-860c-1848cf6cab20	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CategoryEntity	\N
dc42cadd-f343-4fd4-ae46-042429bb239a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CityEntity	\N
20167120-40c2-436e-9cf5-b7eee2265b25	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CityEntity	\N
cd609730-ea86-4598-919a-f8428e09e8a2	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CityEntity	\N
aa616f6d-3fff-44a8-9227-109d90bd124c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CityEntity	\N
122909e1-dc03-45d1-9b18-7282e3f1eefe	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CityEntity	\N
13c23de7-ff7f-4cca-b8ee-0e719ea6839a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	ColorEntity	\N
9ad338c6-625f-42d2-a76d-fb251d830fa4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	ColorEntity	\N
cbbba849-dd06-49b1-98c7-ab0e7a6b7fe4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	ColorEntity	\N
37404612-8a1d-4bca-9e77-1dc9f603c939	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	ColorEntity	\N
3349921b-24e2-499d-b43b-ee15baba29e4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	ColorEntity	\N
d9f4b212-4c50-4c67-835e-a2ddfe301c72	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CommentEntity	\N
ba860603-cf37-4a13-a49e-b42f6e17d22f	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CommentEntity	\N
8e71d452-2b6d-48a6-8fa8-599db709b3c6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CommentEntity	\N
6e80c775-a512-4aab-a866-999eb5a3cdde	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CommentEntity	{"userId": {"$eq": "{{userId}}"}}
616f5fac-bff4-4091-80f1-62acb07462a9	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CommentEntity	\N
0eabae92-28e3-4b31-ad6b-a6074e51e2ef	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CommentEntity	{"userId": {"$eq": "{{userId}}"}}
f0606508-ffe1-47b4-9df3-808a61bb17d4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CommentEntity	\N
c7f7c540-6a4e-40e4-bf88-8070c2ce606c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	CountryEntity	\N
e761d66e-0536-44cc-8def-886df082a607	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	CountryEntity	\N
09ec4d42-d4ae-4e28-a929-d617ff320c59	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	CountryEntity	\N
3372ddba-d86a-4457-b687-fcd4129129f5	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	CountryEntity	\N
78070b73-1f5a-4394-b302-acfa7b09c557	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	CountryEntity	\N
31f9cbbe-fef9-48de-a1a0-ce54f98dd51b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	DeliveryMethodEntity	\N
a3627904-c88a-4cee-a896-192abcb4c565	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	DeliveryMethodEntity	{"status": {"$eq": "active"}}
117c44ec-3a6a-4f14-9cf7-c2cba244d3f3	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	DeliveryMethodEntity	\N
175c3620-1097-44fc-a934-5118fbe990d1	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	DeliveryMethodEntity	\N
70637297-b9dd-4154-93f7-225c19f08c18	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	DeliveryMethodEntity	\N
de82121f-d472-49a0-a94c-7d18e7920f49	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	DeliveryMethodEntity	\N
153c1fae-c9d0-4e08-9b99-d2024e0291a0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	EmailAddressEntity	\N
3d8d1de4-3c7f-4128-97c2-550c5af728d0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	EmailAddressEntity	\N
ed3d8764-c1c8-4c47-b2f6-6eb83cb087e5	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	EmailAddressEntity	\N
3605b1f0-9a17-44ac-a19b-02230787af38	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	EmailAddressEntity	\N
1f817256-217c-48ff-af62-81f88e312cb4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	EmailAddressEntity	\N
4a053bad-3ff0-4f56-ae4d-fe45948a8e49	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	EmailAddressConfirmationEntity	\N
588abb3f-ad47-4beb-88ce-2085ec2c2ed4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	EmailAddressConfirmationEntity	{"userId": {"$eq": "{{userId}}"}}
ab4f3d9a-5a29-44e5-b1fd-497815070def	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	EmailAddressConfirmationEntity	\N
ea16b4cc-a613-4ae5-bd69-e09a4ab969be	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	EmailAddressConfirmationEntity	\N
0e1fc1d6-b144-4caa-989c-ea9e5f416b18	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	EmailAddressConfirmationEntity	{"userId": {"$eq": "{{userId}}"}}
f7a8a165-1073-4ccf-b0b9-157cfef3c0b6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	EmailAddressConfirmationEntity	\N
3ec04057-a1c7-4a7f-8332-1ae0850f098e	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	EmailAddressConfirmationEntity	{"userId": {"$eq": "{{userId}}"}}
6a0a9f64-6cc6-4918-a2a9-fe834ff350be	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	EmailAddressConfirmationEntity	\N
bcab13a5-658a-4f2d-9eff-82278993cd09	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	MediaEntity	\N
1693796e-6c5f-46bd-bc2e-29e13c55a49c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	MediaEntity	\N
692dc236-eead-4a31-8b7b-3150d1355f5f	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	MediaEntity	\N
1280ba09-6c34-48cb-98e3-81be5969cd31	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	MediaEntity	\N
b3c0ba99-6dcf-4383-a989-87907ea9bf7a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	MediaEntity	\N
e31e5531-849c-423d-b5f9-74edd3dcbc51	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	OrderEntity	\N
c4b30e6c-1d02-47cd-afc9-07163e527d33	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	OrderEntity	{"userId": {"$eq": "{{userId}}"}}
6be17249-8418-4544-a9b0-5f4d01671529	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	OrderEntity	\N
07679de9-7e8a-4930-ae64-89b10b8ffd7a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	OrderEntity	\N
fa93bf4a-ffe6-4ac7-86e6-155b47560673	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	OrderEntity	{"userId": {"$eq": "{{userId}}"}}
2365fe89-1082-46ae-bf45-12ca33a5f0ce	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	OrderEntity	\N
fb8eb149-3de4-4373-a7d5-0f25b3ae5f6e	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	OrderEntity	{"userId": {"$eq": "{{userId}}"}}
384d47df-bae2-44bc-bc98-750058cab901	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	OrderEntity	\N
91435081-1dbb-4250-a6fc-2d3204feeb81	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PaymentMethodEntity	\N
5380d792-8d4f-46ce-9cd1-af438e5306d0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PaymentMethodEntity	{"status": {"$eq": "active"}}
45ea4ff9-4419-47bb-bd14-f96acb5dadaa	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PaymentMethodEntity	\N
11774602-1085-433a-845c-9a3256168843	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PaymentMethodEntity	\N
7e4f16d8-7508-4906-9bf9-022418025f1c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PaymentMethodEntity	\N
fdffe808-b06f-4ea3-a9a0-9324dbc418f2	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PaymentMethodEntity	\N
dab26b9c-c894-406b-a347-b7d0c2f7f1fd	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PermissionEntity	\N
3c71b8db-15f7-4809-8d93-776f3fd6bab0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PermissionEntity	\N
413d240f-fe91-4d61-8ce4-00bba3016e8d	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PermissionEntity	\N
df024931-4f93-478f-9361-7c9f0e0ce1a0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PermissionEntity	\N
7f1e1ba5-4680-4d48-b87f-d830b5296409	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PermissionEntity	\N
ac3843e7-c362-4a69-9b9a-10fad1fe78a7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PickupPointEntity	\N
d09d768e-275e-4c16-b5dc-5ae31d2257ed	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PickupPointEntity	{"status": {"$eq": "active"}}
1f06ae13-c0bd-4b16-a943-ff16568ad395	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PickupPointEntity	\N
e64304f5-051c-4491-8199-b3481feaa116	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PickupPointEntity	\N
0d5367f7-7a72-4ba3-8c22-4e5a13eea6fd	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PickupPointEntity	\N
e96eb5fd-8213-4585-8414-b7892a61ca40	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PickupPointEntity	\N
f25932f6-23f2-4c2a-ae6c-63bd93d6bf0a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PriceEntity	\N
563876be-e349-46d7-8c2b-032eb7058af6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PriceEntity	\N
499d7c13-a3b0-4da9-9def-3d172f3e42a6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PriceEntity	\N
9f9d1df7-05dd-4b29-8e45-02af216976bc	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PriceEntity	\N
4a0e743d-ab01-45c1-8c93-086bdd403f1a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PriceEntity	\N
477a7d1f-5abc-48cf-a854-a90047ab7896	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	ProductEntity	\N
b1245961-f09c-4f9d-b599-1608adaf54e7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	ProductEntity	\N
569ddba9-1f88-42d8-bbbb-b6379a001bd4	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	ProductEntity	\N
25db6004-ad6e-419d-9336-b0f713469e34	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	ProductEntity	{"brandId": {"$in": "{{brandIds}}"}}
2de92a4e-c921-4b06-91ed-96698514b694	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	ProductEntity	\N
5e2b9403-6777-4e07-bad4-c87b1d452c91	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	ProductEntity	{"brandId": {"$in": "{{brandIds}}"}}
5c4fc674-fe4b-491b-93cb-fe3a8050d32e	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	ProductEntity	\N
a1043daf-f269-427c-ad5f-7fb7cfa936c3	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	ProductVariantEntity	\N
3cddf196-9424-4807-bce8-99cc063de1d8	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	ProductVariantEntity	\N
66c3b45c-bc0d-4483-ad3f-6c2ccdfd0d06	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	ProductVariantEntity	\N
a870cb9f-5e6a-4373-979f-396903e25796	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	ProductVariantEntity	{"product.brandId": {"$in": "{{brandIds}}"}}
42d029a1-96b2-49ce-9afc-171136e82da9	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	ProductVariantEntity	\N
f61f16b5-ddc5-4675-9f48-9e4874791a1d	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	ProductVariantEntity	{"product.brandId": {"$in": "{{brandIds}}"}}
72d7ee18-6ced-455b-bef5-4d5d688ad73c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	ProductVariantEntity	\N
6667f091-f595-4ea9-bf46-57ed04bd1c00	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	RoleEntity	\N
ec567a60-6d4d-47e7-a62a-ea435d2a05ab	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	RoleEntity	\N
505785fe-460d-4a1b-ab6b-44e04e0bb9f6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	RoleEntity	\N
7b5aaa90-c738-44dc-aa58-a9a4ef6604fa	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	RoleEntity	\N
41331881-9156-4048-9974-fa30885dd6fb	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	RoleEntity	\N
ac28c96f-6e19-4a85-93e0-2fb163640a9b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	SizeEntity	\N
e187308f-ed1e-4f6d-8856-51486f1adefc	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	SizeEntity	\N
75acedcc-c626-4833-ab92-5eb5b2dc4841	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	SizeEntity	\N
92d87599-3e37-48da-a62f-f6d757767265	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	SizeEntity	\N
01c45d11-0fac-4c34-942d-8701ea8490d6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	SizeEntity	\N
d001a38f-f09f-4cbf-bbbe-d2bc8ef6624b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	UserEntity	\N
538a55f2-30e7-4021-8fb8-07d38dcfb4fb	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	UserEntity	{"id": {"$eq": "{{userId}}"}}
116283b1-79d5-45d4-abdd-3ef8b01dbd06	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	UserEntity	\N
a4dbc019-4ce1-4d61-b40e-ac0e38f4f867	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	UserEntity	\N
7198103e-11fa-4b96-8851-4fa1eef51d96	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	UserEntity	{"id": {"$eq": "{{userId}}"}}
24e500fc-da46-4257-9fe1-520a400aace2	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	UserEntity	\N
7491610d-599a-4fd9-ba28-202126623558	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	UserEntity	{"id": {"$eq": "{{userId}}"}}
dafcf2c2-cb53-40f1-81d8-831f277304b7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	UserEntity	\N
7f551f11-53c5-4e09-be66-83869fd8a635	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	UserAddressEntity	\N
fd858c01-8970-4a7a-b48c-7480e9001f21	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	UserAddressEntity	{"userId": {"$eq": "{{userId}}"}}
00a118f9-738b-4673-a1b9-d4b722bf1bdc	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	UserAddressEntity	\N
76db5941-1328-4eee-ad6e-c02775b52cbb	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	UserAddressEntity	\N
12eb66bb-2034-4240-b80b-b4a6b27f0c55	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	UserAddressEntity	{"userId": {"$eq": "{{userId}}"}}
da4257a2-574e-44e4-8c1c-fdd6b20c68da	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	UserAddressEntity	\N
34fd8c0f-6486-4c5b-83e9-220e8cfae6f0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	UserAddressEntity	{"userId": {"$eq": "{{userId}}"}}
f7c25c26-2a65-4460-9075-ecabc6baead6	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	UserAddressEntity	\N
a2601675-5449-4eb7-b622-271d224e7b2d	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	WarehouseEntity	\N
34821ae8-04e6-4ef8-817c-80fafe0ccf95	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	WarehouseEntity	{"status": {"$eq": "active"}}
da3db541-ca82-4472-aa26-e91dd5517583	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	WarehouseEntity	\N
1ca5f263-1ddf-49cd-a26f-904a0181cc88	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	WarehouseEntity	\N
816f4997-8ffd-4e49-98cf-ddd65dc055f8	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	WarehouseEntity	\N
1c1e4604-ea32-4002-bae9-9408e7b6f6c7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	WarehouseEntity	\N
0e8c2ef9-7f85-4146-b2f3-9412e7fd205f	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	WarehouseItemEntity	\N
41f4c5a3-ffad-4647-ab07-4af18f8451f8	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	WarehouseItemEntity	\N
e8fd45cf-53c0-4c1b-bd03-33d32c69af79	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	WarehouseItemEntity	{"warehouseItem.productVariant.product.brandId": {"$in": "{{brandIds}}"}}
98e711f0-1aff-4b37-9d0b-fa8041b714c2	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	WarehouseItemEntity	\N
ba806741-d775-4eab-9387-a1a248dbb5ac	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	WarehouseItemEntity	\N
5d590068-8cd8-4ea9-aa74-9ae9e252b580	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	WishlistEntity	\N
c31f6a41-eae4-448a-a3ad-5dc8dab4204a	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	WishlistEntity	{"userId": {"$eq": "{{userId}}"}}
312ba2c1-be28-49d3-985d-59651a1b8ea1	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	WishlistEntity	\N
6d5c8181-da0c-4900-b398-c79fe0236b5c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	WishlistEntity	\N
abb95dfe-9f76-480d-ae44-1eeec32ae88b	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	WishlistEntity	{"userId": {"$eq": "{{userId}}"}}
5dad7bf1-5498-4bdf-b90c-45f7e41edfa7	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	WishlistEntity	\N
af46418e-d274-4910-b99c-677b0f46e089	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	WishlistEntity	{"userId": {"$eq": "{{userId}}"}}
0355d775-5bcb-45b8-bfd7-e7c6227822b5	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	WishlistEntity	\N
11b11f71-fab0-42db-b394-1e1aab4a7c81	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PromotionEntity	\N
49d4199e-58d7-4af0-89a8-978c20e4ee3e	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PromotionEntity	\N
2bc8a741-e6c0-4d28-ae52-132e8b88aa06	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PromotionEntity	\N
303dfe8e-76a9-41bc-b02f-278adf87ead5	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PromotionEntity	\N
7bb6c50e-df2a-4b7f-9b1f-880d03a461b0	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PromotionEntity	\N
a3514e5f-bef3-42d4-a5d5-06a4b4fa8893	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	read	PromotionProductEntity	\N
97dc6b0b-d2a4-4ffc-a4a7-87bd42910f2c	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	create	PromotionProductEntity	\N
2e93c23a-8596-4280-9407-b8c6771c7a98	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PromotionProductEntity	\N
e25adad2-0183-454d-aa48-df22da97c405	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	update	PromotionProductEntity	{"product.brandId": {"$in": "{{brandIds}}"}}
bf2ff777-ff16-4369-9099-f2a9fe346c20	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PromotionProductEntity	\N
12a7ef31-bc48-4de0-8465-d8fa215d2fee	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	delete	PromotionProductEntity	{"product.brandId": {"$in": "{{brandIds}}"}}
605fda18-3f68-479d-93d2-35b3d3a7a75d	2023-05-21 12:14:30.402929	2023-05-21 12:14:30.402929	manage	PromotionProductEntity	\N
86bc126f-7527-4c54-a83e-da1d4fcc2d82	2023-06-08 00:04:36.154292	2023-06-08 00:04:36.154292	cancel	OrderEntity	\N
39126c2d-b665-4e56-a233-1ba192db0284	2023-06-08 00:04:36.154292	2023-06-08 00:04:36.154292	reject	OrderEntity	\N
dd154d16-a6c5-482f-b6c0-ffaeb6ff58a5	2023-06-08 00:04:36.154292	2023-06-08 00:04:36.154292	transfer_to_delivery	OrderEntity	\N
7501a4f0-3221-4123-a1c3-81ae56fe8353	2023-06-08 00:04:36.154292	2023-06-08 00:04:36.154292	complete	OrderEntity	\N
3c051ac8-b491-442a-99fe-1763c55e2b90	2023-06-08 23:29:04.230536	2023-06-08 23:29:04.230536	create	AddressEntity	\N
92a8e3f7-d21f-4bc9-b15d-487950c96e86	2023-06-08 23:29:04.230536	2023-06-08 23:29:04.230536	update	AddressEntity	\N
af7c9b0d-af1e-4c0c-8115-76bc842d9dab	2023-06-08 23:29:04.230536	2023-06-08 23:29:04.230536	delete	AddressEntity	\N
87f8ebbd-b04a-4ff0-bd85-da2a6b715624	2023-06-08 23:29:04.230536	2023-06-08 23:29:04.230536	manage	AddressEntity	\N
\.


--
-- Data for Name: pickup_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pickup_point (id, created_at, updated_at, code, name, address_id, status) FROM stdin;
bd6449ff-0b96-40cc-b305-a27ef57261b8	2023-06-01 10:08:03.858732	2023-06-01 10:08:03.858732	BY0001	Test pickup point 1	fd7b8f8f-4289-45e3-b066-b6853a6e0ee2	active
edf2e787-686c-4f79-af89-25db046df6c7	2023-06-01 10:08:03.976651	2023-06-01 10:08:03.976651	BY0002	Test pickup point 2	12894cc0-7307-472e-ba36-edac92269296	active
95004201-268a-4f17-aa0d-5188067862cc	2023-06-01 10:08:04.017488	2023-06-01 10:08:04.017488	BY0003	Test pickup point 3	2c924e3a-a008-43f1-b72a-8eddb9fec708	inactive
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, created_at, updated_at, amount, currency) FROM stdin;
ee9b4a2e-37d4-498f-a663-e975b61a5536	2023-05-21 12:14:30.869505	2023-05-21 12:14:30.869505	0.00	byn
541af8ee-e9f2-4d86-8083-cd8a99033a05	2023-05-21 12:14:30.876876	2023-05-21 12:14:30.876876	0.00	byn
6e3bd346-85d1-4928-811e-aaf3cbdbe0ec	2023-05-21 12:14:30.883703	2023-05-21 12:14:30.883703	0.00	byn
efafd7a0-a547-47bd-b873-7a378cfb34ba	2023-05-21 12:14:30.88929	2023-05-21 12:14:30.88929	0.00	byn
eaf5992c-8e54-46a1-94a1-177983480116	2023-05-21 12:14:30.978036	2023-05-21 12:14:30.978036	0.00	byn
60098d32-0c4c-429a-9494-ab0946501cd8	2023-05-21 12:14:30.986062	2023-05-21 12:14:30.986062	0.00	byn
f188d659-f4d3-4522-82dc-d1bc6d297bd7	2023-05-21 12:14:30.993017	2023-05-21 12:14:30.993017	10.00	byn
f4e1f022-2b7b-41dd-9df4-f59a6f778c8c	2023-05-21 12:14:30.998336	2023-05-21 12:14:30.998336	5.00	byn
71e7aea7-5d10-4e24-a90d-4a31ce2532bc	2023-05-21 12:14:31.179286	2023-05-21 12:14:31.179286	1.29	byn
c50c37c2-3728-4b0d-bf66-413104f33e84	2023-05-21 12:14:31.186088	2023-05-21 12:14:31.186088	23.86	byn
5e477d81-fd6e-4c23-add0-3b1ea44e6674	2023-05-21 12:14:31.192671	2023-05-21 12:14:31.192671	20.98	byn
69bf8bcc-857c-447f-91ee-0cbee3af4c6d	2023-05-21 12:14:31.201675	2023-05-21 12:14:31.201675	3.89	byn
9aee99ab-1553-413f-b3e1-bdf800126e9f	2023-05-21 12:14:31.216809	2023-05-21 12:14:31.216809	5.00	byn
b7e8dbff-fee7-4e85-996c-ad0cbb093282	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	35.90	byn
852c4dbc-9ccd-49cc-aec8-7204dac4c85d	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	35.90	byn
ebff6cb2-a059-427e-b164-b2bd4add124f	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	35.90	byn
897f256a-64be-4a82-b768-3fb433a4cb3a	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	35.90	byn
31ceab18-3a95-4eee-8662-fcc3e8b47ab5	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	37.90	byn
01ccf8f7-cf82-4438-b38f-17e99a94da6e	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	37.90	byn
f2271839-a5e0-4183-9b57-1e5100b95705	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	37.90	byn
398480df-c8db-4a7c-8623-3cb22a7bb360	2023-05-21 12:20:55.276776	2023-05-21 12:20:55.276776	37.90	byn
2e4ff578-9c6b-4bf0-8499-96e80e06d19d	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	35.90	byn
969586d7-ea0d-42f0-80f3-7d2a2fd04cc3	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	35.90	byn
46c3806c-db71-4f57-8b22-a660e28d2767	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	35.90	byn
ff72b05c-520f-423c-8404-c9781dd71bbf	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	35.90	byn
f29b560c-477d-423b-b816-f958f6cb9034	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	37.90	byn
a63b3cab-eda3-4fd7-ab85-e3f0ebedd4be	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	37.90	byn
0e723616-2861-4fe5-86e3-7106d00f5699	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	37.90	byn
cf7daa02-74ae-4bcc-be1b-811d6524bb1f	2023-05-21 15:17:32.373543	2023-05-21 15:17:32.373543	37.90	byn
9a77f799-b14c-47d8-82b7-4112f5bd8061	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
fae6d266-b273-4d64-92b2-7199699f4db8	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
db73668a-0223-445a-935f-abc148240b3c	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
31e606ac-2d4c-4dec-aa01-83cdeee28763	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
07b1ea53-2d90-4c52-9ce6-e92749f3b377	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
17975a3b-6045-4eb8-aad3-3ac2c8326526	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
991bed0f-5b82-4f69-b932-551d33447358	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
f0c9b2c4-aeb7-4813-aa90-2fdcefe9a735	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
a9dcf938-50ee-4ba7-a43a-4ac263e7733e	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
8d218c43-05c7-490e-85d9-24acf4903452	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
348ee9d6-bd8e-4d3e-a9a9-34ed25b72f67	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
cb782303-9bc1-4228-8056-b1875b209696	2023-05-21 15:25:26.342384	2023-05-21 15:25:26.342384	25.90	byn
44574cf4-7b07-4b78-84b7-4deed9a30087	2023-05-29 21:17:57.222709	2023-05-29 21:17:57.222709	849.83	byn
51aae286-e2b6-4b82-945b-1d63386d19d6	2023-05-29 15:16:38.655082	2023-05-29 17:44:27.061584	249.95	byn
49a38001-3232-4f2a-9b45-427d4486d3e4	2023-05-24 13:41:43.686124	2023-05-24 13:41:43.686124	25.90	byn
ee6d20fd-068b-4cb4-a88e-04805b588aa6	2023-05-27 08:58:09.308801	2023-05-27 08:58:09.308801	191.48	byn
cd62e6f5-3dfb-4110-9ee7-91b8f73b4aa5	2023-05-29 04:46:49.822397	2023-05-29 04:46:49.822397	332.72	byn
74047b17-f6a6-4996-92db-5f33c0f37b91	2023-05-27 09:06:52.049176	2023-05-27 09:06:52.049176	191.48	byn
fd99a6d9-ad5d-45de-81e8-07a756536192	2023-05-29 14:53:52.227297	2023-05-29 14:53:52.227297	0.00	byn
77baa8e8-9220-47ba-adda-ad104e0d5dce	2023-05-24 13:43:01.685618	2023-05-24 13:44:35.357987	25.90	byn
6c18ca63-5841-4a6c-8ff2-9270eb05b77c	2023-05-28 10:20:25.579303	2023-05-28 10:20:25.579303	332.72	byn
2baa1379-60d7-4c97-8995-1d66b052b1a7	2023-05-29 21:17:57.222709	2023-05-29 21:17:57.222709	10.00	byn
018121f3-e468-4977-ba50-e957e4a32346	2023-05-29 21:17:57.222709	2023-05-29 21:17:57.222709	169.97	byn
18a6c078-e4f0-4477-95b0-9959335cd5ec	2023-06-01 11:44:27.243107	2023-06-01 11:44:27.243107	0.00	byn
8d37cac5-24ff-4d87-8833-7805553ec0e0	2023-05-27 09:23:01.461735	2023-05-27 09:23:01.461735	191.48	byn
e4ae1424-ca1c-4b18-8a3a-5c3f7bbb4907	2023-05-27 18:43:52.765956	2023-05-27 18:43:52.765956	0.00	byn
d9795611-d069-429d-bf34-fe3eaee606f6	2023-05-27 18:43:52.776542	2023-05-27 18:43:52.776542	0.00	byn
89b5fa8f-22b2-41b3-b7bd-a145950d4ae6	2023-05-27 09:28:04.58577	2023-05-27 09:28:04.58577	191.48	byn
df3f7230-f1ca-4d56-840e-3ebe42eb8f31	2023-05-24 13:44:44.160856	2023-05-24 13:44:46.495568	77.70	byn
a5bde2fb-24c0-433f-852a-ffcd94c45252	2023-05-21 12:14:30.894982	2023-05-24 13:44:46.55264	77.70	byn
05099d46-0a02-4957-8381-a72aefc70db9	2023-05-22 00:09:42.917434	2023-05-23 01:06:56.505059	25.90	byn
55c49378-b210-4f27-b838-bcf9888e4b97	2023-05-28 13:52:37.27889	2023-05-28 13:52:37.27889	332.72	byn
bc7007fd-ff61-4a76-ae93-ce5af3b08982	2023-05-29 14:53:52.227297	2023-05-29 14:53:52.227297	0.00	byn
31a6e36c-c19f-4788-9d4d-2941dc1b973c	2023-05-29 14:53:52.227297	2023-05-29 14:53:52.227297	0.00	byn
38e754e4-a089-42ab-b275-427cd95dcda4	2023-05-21 22:03:21.460821	2023-05-23 01:06:59.065758	35.90	byn
5f8d3596-4d9a-4864-aecf-4fa926f64fd2	2023-05-27 09:45:26.327971	2023-05-27 09:45:26.327971	191.48	byn
8431d9b4-ce03-47ff-bc1f-820a305ec64d	2023-05-27 08:33:20.842715	2023-05-27 08:33:20.842715	191.48	byn
8cb9a511-8841-48b6-bd52-e96bb68d0fa5	2023-05-23 01:13:16.665563	2023-05-23 01:13:16.665563	25.90	byn
b4f717e3-4241-4443-8d33-fadec96f065d	2023-05-26 20:54:48.320439	2023-05-26 20:54:48.320439	143.60	byn
b43c8abd-7f22-4c76-a5ee-3a081e87bf33	2023-05-29 20:58:34.323863	2023-05-29 20:58:34.323863	309.00	byn
d8c4acd0-92c4-4700-b28b-a4ace24fa58a	2023-05-27 08:42:31.682443	2023-05-27 08:42:31.682443	191.48	byn
81f27e28-3d84-40a9-aab7-4b8055daa2a6	2023-05-27 13:10:46.994233	2023-05-28 00:17:15.056958	35.90	byn
537f12b3-380e-49a7-aec9-2289776f5b85	2023-05-29 14:53:52.227297	2023-05-29 14:53:52.227297	0.00	byn
808b8f42-f73e-48d9-87b5-5d0fd538d0f2	2023-05-23 01:24:56.870511	2023-05-23 01:25:02.426162	77.70	byn
e208a681-c2a3-44a4-88c6-f9bd378f8464	2023-05-21 22:01:06.126671	2023-05-23 01:25:02.502553	77.70	byn
f6c2a616-bbdc-4629-9649-6fe7d4035c2d	2023-05-29 04:44:40.967809	2023-05-29 04:44:40.967809	301.64	byn
4f229333-5928-4c45-a44c-e6ae4645293d	2023-05-28 00:22:47.395489	2023-05-29 17:44:23.114665	179.50	byn
d4958b6e-3fcf-40e7-87ca-0224d9444af7	2023-05-28 13:33:10.738404	2023-05-28 13:33:10.738404	337.72	byn
6c431d4a-8d06-4507-96da-a1e17f5c39df	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
51290f54-fbf1-41ed-9bbe-00769a9445ae	2023-05-28 14:26:47.020381	2023-05-28 14:26:47.020381	332.72	byn
d970844d-1a49-4f69-b5fe-9fcd4d950b03	2023-05-28 17:57:02.206505	2023-05-28 17:57:02.206505	363.80	byn
58718d40-fd5a-48ac-ae4e-9f00bcbc4e9d	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
520fb88e-880e-440e-ac49-f7ad37089c57	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
a0bf3348-2e93-49aa-9e79-132c55cb362d	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
eba0ec98-7506-4d4b-bc08-530fa09b8151	2023-05-27 08:51:18.068013	2023-05-27 08:51:18.068013	191.48	byn
6b04af1c-2a92-4272-a853-71c20078827f	2023-05-24 13:37:33.82371	2023-05-24 13:41:20.393727	25.90	byn
d97f77f3-92d2-4e5c-8322-3b1f238bfb8f	2023-05-26 20:40:22.096061	2023-05-29 17:44:19.738207	129.50	byn
d5accee6-1a4b-48e9-8f54-6765a3eac5c5	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
3b268375-e16f-4228-9bdc-54a580a20436	2023-05-27 08:54:18.504991	2023-05-27 08:54:18.504991	191.48	byn
2a00bf13-4209-4ef2-be27-ef944e9f7a8b	2023-05-27 09:58:29.345023	2023-05-27 09:58:29.345023	191.48	byn
7dd0eb85-fa4b-46e4-9c2c-83c2e78f9c66	2023-05-28 18:34:16.077033	2023-05-28 18:34:16.077033	301.64	byn
05a911ab-20b3-4193-b02c-cca57463e0d9	2023-05-28 18:40:05.219945	2023-05-28 18:40:05.219945	301.64	byn
278076a6-ca75-4328-9976-f8cccb46aac1	2023-05-27 08:55:54.843654	2023-05-27 08:55:54.843654	191.48	byn
a8d41951-b049-4814-85f0-43912adb6a31	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
e9f0d8c0-d1fa-4f6a-b0ca-080805dc6c8d	2023-05-29 03:35:57.294566	2023-05-29 03:35:57.294566	301.64	byn
aee821a7-32da-42d2-8c89-7a0e9dad5ab3	2023-05-27 08:58:00.145731	2023-05-27 08:58:00.145731	191.48	byn
6636121f-2322-46f4-939e-f9bcb2e19ceb	2023-05-28 10:08:15.288099	2023-05-28 10:08:15.288099	332.72	byn
a9f86992-8ba8-4ee1-a92d-b8aba370b0e5	2023-05-28 00:49:05.829816	2023-05-28 00:49:05.829816	327.72	byn
d89397e7-084f-4cb7-9ebc-7c4ca2f97afe	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
e15fb8fb-c259-4bdd-8bf6-eeec2e59a745	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
7faaadb0-5df2-4e3e-8f82-8a1c66572215	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
f431be4a-614c-49ee-9c94-58b17ca8abed	2023-05-29 15:06:28.530311	2023-05-29 15:06:28.530311	49.99	byn
a832a6a1-0133-4100-b1e8-8275b6578eae	2023-05-29 20:58:34.323863	2023-05-29 20:58:34.323863	5.00	byn
42785362-a4dc-4f7a-a574-b9dc8bad1de1	2023-05-29 20:58:34.323863	2023-05-29 20:58:34.323863	61.80	byn
47bad832-d799-4eff-b531-f99bdd2c7ede	2023-05-29 20:58:34.323863	2023-05-29 20:58:34.323863	375.80	byn
8effed0e-b5c6-4611-a1b8-ec4a739aa873	2023-05-29 20:58:34.323983	2023-05-29 20:58:34.323983	249.95	byn
f7f3c9cb-55fd-4ec8-bb18-5ef06abb2293	2023-05-29 20:58:34.323983	2023-05-29 20:58:34.323983	5.00	byn
53e594af-35d2-4560-9687-8d4261cb3580	2023-05-29 20:58:34.323983	2023-05-29 20:58:34.323983	49.99	byn
7617e5e9-6ed4-4020-a6cf-8d9931171160	2023-05-29 20:58:34.323983	2023-05-29 20:58:34.323983	304.94	byn
6a7d5dd7-1ad1-486d-9acc-ff36e1b23f3e	2023-05-29 20:58:34.413314	2023-05-29 20:58:34.413314	149.97	byn
13f0ebcf-052d-4d7f-b3ad-045f73d06ba8	2023-05-29 20:58:34.413314	2023-05-29 20:58:34.413314	99.98	byn
643d22dd-f549-418f-aaa5-5938df40aaf8	2023-05-30 18:24:49.364202	2023-05-30 18:24:49.364202	49.99	byn
a4b69217-a860-4430-b565-4b4cb8b93d7c	2023-05-30 18:24:49.364202	2023-05-30 18:24:49.364202	5.00	byn
e830da8e-b33a-4049-9f5d-7bdaf55b2cf9	2023-05-30 18:24:49.364202	2023-05-30 18:24:49.364202	10.00	byn
1536bffe-2695-47f4-82e3-6a1a762a20a9	2023-05-30 18:24:49.364202	2023-05-30 18:24:49.364202	64.99	byn
37a534db-ec06-4736-8091-1da9893005dd	2023-05-31 00:05:08.497164	2023-05-31 00:05:08.497164	49.99	byn
dde57664-203c-4c36-a9c7-1b32dde66b36	2023-05-31 22:02:08.326563	2023-05-31 22:02:08.326563	64.99	byn
75e0aa2f-5d26-4a95-8bbc-96003f4ea30e	2023-05-29 21:17:57.222696	2023-05-29 21:17:57.222696	25.90	byn
0ebfa544-77a2-4f40-9b7c-ceffd6fefeda	2023-05-29 21:17:57.222696	2023-05-29 21:17:57.222696	10.00	byn
866f46c8-87d1-4444-babf-c60c306c1cd3	2023-05-29 21:17:57.222696	2023-05-29 21:17:57.222696	5.18	byn
41790b14-3328-451e-8ff2-15a2c259bd38	2023-05-29 21:17:57.222696	2023-05-29 21:17:57.222696	41.08	byn
cdfb33d8-f041-4e39-b59a-794b19fe50a7	2023-05-29 21:17:57.443808	2023-05-29 21:17:57.443808	25.90	byn
0e425fe3-6f01-49e9-9e4c-9a98f68023ee	2023-05-30 23:30:21.766315	2023-05-30 23:30:21.766315	49.99	byn
50378923-5515-45e7-ad0d-792a00b16422	2023-05-30 23:30:21.766315	2023-05-30 23:30:21.766315	5.00	byn
35981dca-6702-4924-8bb9-252f453587ec	2023-05-30 23:30:21.766315	2023-05-30 23:30:21.766315	10.00	byn
9c014281-5b93-44e5-907f-61b8631de32e	2023-05-30 18:27:01.945448	2023-05-30 18:27:01.945448	49.99	byn
9ce1a290-0ae1-482b-97ce-17e19fd48b2a	2023-05-30 23:30:21.766315	2023-05-30 23:30:21.766315	64.99	byn
d0fb7367-72f1-4f38-bbd9-cc667786ecc5	2023-05-30 23:30:21.793874	2023-05-30 23:30:21.793874	49.99	byn
2b1a3f3d-fb41-4d61-bffb-f2a4aaf3e045	2023-05-30 17:41:22.800487	2023-05-30 17:41:22.800487	49.99	byn
e85102fa-3fdf-4c54-beb0-38f2ba7ba7b3	2023-05-31 21:25:12.140472	2023-05-31 21:25:12.140472	64.99	byn
cd131de4-2a79-4ab9-b111-a301f4fea017	2023-05-31 21:47:43.132731	2023-05-31 21:47:43.132731	64.99	byn
9e1e8473-2b4d-4b54-9254-4c1a764074c5	2023-05-30 23:23:07.61491	2023-05-30 23:23:07.61491	49.99	byn
9f1ee45d-e18a-44bc-88ac-5a29dc0fb472	2023-05-30 23:23:07.61491	2023-05-30 23:23:07.61491	5.00	byn
8b6bec19-1186-4a94-9bf8-a5f913db4f45	2023-05-30 18:27:14.679974	2023-05-30 18:27:14.679974	49.99	byn
ec50da9e-a68a-4184-a8fb-9df511782526	2023-05-30 18:27:14.679974	2023-05-30 18:27:14.679974	5.00	byn
91764dc1-dc1e-404b-9a49-a99c0ed17a69	2023-05-30 18:27:14.679974	2023-05-30 18:27:14.679974	10.00	byn
241ff33b-bbd3-43b6-a4ca-074e822228d5	2023-05-30 18:27:14.679974	2023-05-30 18:27:14.679974	64.99	byn
a92c1d28-1d1c-47f0-a7e5-683a05aa33bb	2023-05-30 23:23:07.61491	2023-05-30 23:23:07.61491	10.00	byn
5f0b8273-e66d-4cb1-80c9-bef2e433304c	2023-05-30 23:23:07.61491	2023-05-30 23:23:07.61491	64.99	byn
9afb3e18-d7bf-4384-9173-062e4acf2fdf	2023-05-30 19:08:11.444557	2023-05-30 19:08:11.444557	49.99	byn
2ed12d37-311e-4cfd-a2d0-80c780cff357	2023-05-30 19:08:11.444557	2023-05-30 19:08:11.444557	5.00	byn
baba7187-3898-4e0f-935f-36b583b79076	2023-05-30 19:08:11.444557	2023-05-30 19:08:11.444557	10.00	byn
0ebdcea3-edfa-4de2-ac5a-51521759f593	2023-05-30 19:08:11.444557	2023-05-30 19:08:11.444557	64.99	byn
3f858837-108d-46b7-9852-6be84cef7fc8	2023-05-30 23:23:07.644194	2023-05-30 23:23:07.644194	49.99	byn
fe8432f6-d8a0-41ce-906e-c8d1e7dcdeee	2023-05-30 23:44:34.399047	2023-05-30 23:44:34.399047	49.99	byn
a8ab1f06-a35c-4a34-b2f7-ca749a84d93b	2023-05-30 23:44:34.399047	2023-05-30 23:44:34.399047	5.00	byn
9cad1f62-6058-48c1-963e-6e8ee315a59a	2023-05-30 23:44:34.399047	2023-05-30 23:44:34.399047	10.00	byn
41816f08-b239-412c-94e6-03ad47697e72	2023-05-30 23:44:34.399047	2023-05-30 23:44:34.399047	64.99	byn
bb0da0db-6bea-44b4-b3e6-35aa69c22331	2023-05-30 23:44:34.425329	2023-05-30 23:44:34.425329	49.99	byn
d3b1db1a-eced-4ba5-b832-dd0373174e7f	2023-05-30 19:09:10.125907	2023-05-30 19:09:10.125907	25.90	byn
0c16bfde-c83c-438f-a090-06f6aac3b15a	2023-05-30 19:09:10.125907	2023-05-30 19:09:10.125907	5.00	byn
c10d3b12-4e2f-47b8-8547-abadfe0cad9f	2023-05-30 19:09:10.125907	2023-05-30 19:09:10.125907	5.18	byn
9e026312-1ccd-4c94-b533-dab3fa00252b	2023-05-30 19:09:10.125907	2023-05-30 19:09:10.125907	36.08	byn
6a8de412-4518-4b3b-b645-217cd38b7ffd	2023-05-30 22:41:36.7839	2023-05-30 22:41:36.7839	25.90	byn
89417055-927f-4c75-8c90-8513e5bfc342	2023-05-30 22:41:36.7839	2023-05-30 22:41:36.7839	5.00	byn
79eefc7c-ddcf-4dcb-9bba-4819dbc2dae6	2023-05-30 22:41:36.7839	2023-05-30 22:41:36.7839	5.18	byn
0d902c51-8b66-49a5-817d-273ec5f4fe34	2023-05-30 22:41:36.7839	2023-05-30 22:41:36.7839	36.08	byn
6d7c886f-f3f6-4277-b5b7-a79091b529e4	2023-05-30 23:07:16.973438	2023-05-30 23:07:16.973438	25.90	byn
1beb0d4e-1180-4887-ac85-aece01dae05d	2023-05-30 23:07:16.973438	2023-05-30 23:07:16.973438	5.00	byn
9719a9b5-8292-4f26-9745-8a91a91a867c	2023-05-30 23:07:16.973438	2023-05-30 23:07:16.973438	5.18	byn
817ab996-bcea-4f1b-91ff-e21f6437f10b	2023-05-30 23:07:16.973438	2023-05-30 23:07:16.973438	36.08	byn
71da7267-d679-486b-aee6-12b18861c735	2023-05-30 23:09:04.9142	2023-05-30 23:09:04.9142	25.90	byn
1ed3fa91-99ca-4501-820a-23aa7d78bfbe	2023-05-30 23:09:04.9142	2023-05-30 23:09:04.9142	5.00	byn
e7e02241-40f5-45f9-ba71-0364f99ff3cb	2023-05-30 23:09:04.9142	2023-05-30 23:09:04.9142	5.18	byn
b3ad4891-c659-4d45-9f6e-1f1bf0d32d4a	2023-05-30 23:09:04.9142	2023-05-30 23:09:04.9142	36.08	byn
3431fdb6-ede0-464b-beab-60f5c2e6ae13	2023-05-26 20:36:44.604652	2023-05-31 00:05:57.32272	49.99	byn
42700b80-160a-4f32-a230-89b30aaa93a0	2023-05-26 20:36:44.604652	2023-06-01 09:42:00.066108	64.99	byn
bcc650a6-14cd-4a48-a2b5-28ac567e95f8	2023-05-30 18:24:09.708244	2023-05-30 18:24:09.708244	49.99	byn
443ef15f-216f-49a0-aac9-a5af79ced7f6	2023-05-30 18:24:09.708244	2023-05-30 18:24:09.708244	5.00	byn
f990f5ae-2571-445e-902a-8642a26515cc	2023-05-30 18:24:09.708244	2023-05-30 18:24:09.708244	10.00	byn
cecca333-b780-4e9b-82b6-e55af6c9d9f0	2023-05-30 18:24:09.708244	2023-05-30 18:24:09.708244	64.99	byn
cbe1281e-0d48-4074-a864-63b43709f067	2023-06-01 09:42:00.920498	2023-06-01 09:42:00.920498	64.99	byn
8056d591-331d-4e93-9b16-c9a6c5365e44	2023-05-30 23:42:44.989455	2023-05-30 23:42:44.989455	49.99	byn
9720dfb3-b3c9-46d5-9f9f-1d2579bf658b	2023-05-30 23:42:44.989455	2023-05-30 23:42:44.989455	5.00	byn
3586ef60-7a20-48a1-8a63-bcbd821e9997	2023-05-30 23:27:14.799043	2023-05-30 23:27:14.799043	49.99	byn
51d0cb11-7c41-4c9c-894a-22ab68877ae8	2023-05-30 23:27:14.799043	2023-05-30 23:27:14.799043	5.00	byn
5e7471ea-5e2c-4061-b26e-45610d9a520a	2023-05-30 23:27:14.799043	2023-05-30 23:27:14.799043	10.00	byn
ba2fcfe3-0d18-40df-8747-574a1573937d	2023-05-30 23:15:17.954444	2023-05-30 23:15:17.954444	49.99	byn
7f19a3ce-28db-4937-afcf-dc6e833b8a90	2023-05-30 23:15:17.954444	2023-05-30 23:15:17.954444	5.00	byn
54ee521b-7c50-46c0-8bee-4f8ed204346f	2023-05-30 23:15:17.954444	2023-05-30 23:15:17.954444	10.00	byn
86214739-f477-408b-bb67-25b054898bc0	2023-05-30 23:15:17.954444	2023-05-30 23:15:17.954444	64.99	byn
389a1809-eb5f-4c61-9425-edf873d3c32a	2023-05-30 23:15:17.981224	2023-05-30 23:15:17.981224	49.99	byn
ecd2778a-c32b-4acf-b04c-3a009ed904d5	2023-05-30 23:27:14.799043	2023-05-30 23:27:14.799043	64.99	byn
108d0a0a-57c5-4746-8ceb-63ffb80948a2	2023-05-30 23:27:14.833115	2023-05-30 23:27:14.833115	49.99	byn
a321fbc3-61fc-4e6b-9fe4-cfac7734f583	2023-05-30 23:42:44.989455	2023-05-30 23:42:44.989455	10.00	byn
1ccb6eb5-6c7e-4a00-a1c9-85a9b5a113b0	2023-05-30 23:42:44.989455	2023-05-30 23:42:44.989455	64.99	byn
ff5371a5-e1ea-4503-a757-a6b818ed2d9a	2023-05-30 23:42:45.045326	2023-05-30 23:42:45.045326	49.99	byn
ad2ce4e4-b16d-4ee2-9c26-447c9c0bdd4c	2023-06-01 09:09:18.84911	2023-06-01 09:09:18.84911	64.99	byn
3a612a52-20e6-450c-9550-5b0c31d402db	2023-05-31 21:57:18.714114	2023-05-31 21:57:18.714114	64.99	byn
93a1f07b-bd61-4817-9a2f-2ea6b27e0d61	2023-05-31 22:03:47.596931	2023-05-31 22:03:47.596931	64.99	byn
59a3bb78-67d7-40d0-8f5a-41b8d1cfc38b	2023-05-31 22:02:04.014574	2023-05-31 22:02:04.014574	64.99	byn
02c21055-0c23-4d7c-b381-1234dc3ceeec	2023-06-01 11:44:27.243107	2023-06-01 11:44:27.243107	0.00	byn
3927850a-59a0-4068-a00e-a5e8b9fa0f62	2023-06-01 11:44:27.243107	2023-06-01 11:44:27.243107	0.00	byn
25ee30d6-1f15-4aeb-b08c-556dc64e813c	2023-05-31 00:05:08.466503	2023-05-31 00:05:08.466503	49.99	byn
adf29b4b-ac7d-4a73-80a3-8622faf04f4d	2023-05-30 23:21:12.710679	2023-05-30 23:21:12.710679	49.99	byn
fe232931-3ded-4942-980b-7e8291a13e23	2023-05-30 23:21:12.710679	2023-05-30 23:21:12.710679	5.00	byn
9ca14fde-a43b-4127-afba-124ccde2705a	2023-05-30 23:21:12.710679	2023-05-30 23:21:12.710679	10.00	byn
a094a968-a1bb-4798-8b3f-d9db9d1fc83e	2023-05-30 23:21:12.710679	2023-05-30 23:21:12.710679	64.99	byn
db4ac3bd-8b4e-4c87-ab53-c751677b85ed	2023-05-30 23:21:12.747467	2023-05-30 23:21:12.747467	49.99	byn
e34e0901-949e-4b1a-a5df-4201259ba5b8	2023-05-26 20:36:44.604652	2023-06-01 09:42:00.066108	10.00	byn
791cabe4-7cf8-4ee0-91bf-9fae7b77f478	2023-06-01 11:44:27.243107	2023-06-01 11:44:27.243107	0.00	byn
39e8af89-7962-4c79-b583-894b82c64528	2023-05-31 00:05:08.466503	2023-05-31 00:05:08.466503	5.00	byn
ea585546-307f-4cfa-8796-d082c5140cf7	2023-05-31 00:05:08.466503	2023-05-31 00:05:08.466503	10.00	byn
6967c568-9b16-439f-aad9-e58ad88998d1	2023-05-31 00:05:08.466503	2023-05-31 00:05:08.466503	64.99	byn
250cf7e0-8910-4cf2-af05-a28beb1b8c58	2023-06-01 12:18:44.287404	2023-06-01 12:18:44.287404	64.99	byn
0b410b41-885b-484d-995f-5835f8c1143c	2023-06-01 12:30:44.14471	2023-06-01 12:30:44.14471	64.99	byn
35bd81ea-2d07-408e-8c89-b49c5b7445cb	2023-06-01 11:54:43.448883	2023-06-01 17:35:29.645173	5.00	byn
41d14ff0-5098-4da3-afd3-591fedd503ad	2023-06-01 12:34:06.006881	2023-06-01 12:34:06.006881	64.99	byn
11909418-b6be-435f-b666-8dd58b4f0f05	2023-06-01 11:54:43.448883	2023-06-01 18:58:38.262564	49.99	byn
a0bce051-b6ba-4ab9-8c19-311468e56cb3	2023-06-01 16:27:08.012326	2023-06-01 16:27:08.012326	64.99	byn
24b4fd60-fd50-4c5a-be81-2533c133dd9d	2023-05-29 20:58:34.424229	2023-05-29 20:58:34.424229	129.50	byn
8b23746f-da0a-4cdf-a2ce-15d583aed62b	2023-05-29 20:58:34.424229	2023-05-29 20:58:34.424229	179.50	byn
a67bb6bc-f281-4faa-8e17-c7d4976ae4f1	2023-05-29 21:15:47.156841	2023-05-29 21:15:47.156841	25.90	byn
2387387d-1a8e-459b-bb73-4c316501e7cb	2023-05-29 21:17:57.222709	2023-05-29 21:17:57.222709	1029.80	byn
104ed4c4-1c17-47ef-b59c-0239109dff10	2023-05-29 21:17:57.444126	2023-05-29 21:17:57.444126	0.00	byn
05478416-6185-4f0e-aed9-ef7b308d6844	2023-05-29 21:17:57.444126	2023-05-29 21:17:57.444126	849.83	byn
0292c383-870d-4154-ac9c-05d9ae0c0391	2023-05-26 20:36:44.604652	2023-05-30 17:43:43.848971	5.00	byn
68298159-6579-4cf4-87bd-2eda5ea9fbe7	2023-05-30 18:25:53.382481	2023-05-30 18:25:53.382481	49.99	byn
588d8e72-337e-4f64-96fc-2827674a34e2	2023-05-30 18:25:53.382481	2023-05-30 18:25:53.382481	5.00	byn
14b780dc-593d-444f-bb85-5c6d96d5e382	2023-05-30 18:25:53.382481	2023-05-30 18:25:53.382481	10.00	byn
c3b40900-cb0d-44f4-b103-fb641caaa538	2023-05-30 18:25:53.382481	2023-05-30 18:25:53.382481	64.99	byn
e59fd2ee-caa3-45aa-8997-fc0d1770ee1b	2023-05-30 19:07:36.41006	2023-05-30 19:07:36.41006	49.99	byn
e41cedaa-3b99-4bb3-9b45-4db3c8c7257b	2023-05-30 19:07:36.41006	2023-05-30 19:07:36.41006	5.00	byn
1465d1c1-4964-4808-93c4-bd8c7c2aad0b	2023-05-30 19:07:36.41006	2023-05-30 19:07:36.41006	10.00	byn
bf3cd034-15d2-4c4d-bb53-327bc4a29866	2023-05-30 19:07:36.41006	2023-05-30 19:07:36.41006	64.99	byn
fca95a0b-aa4a-4bab-9041-ec0ef2cee8a5	2023-05-30 19:08:52.555793	2023-05-30 19:08:52.555793	25.90	byn
57c3ea45-cfe1-4eca-b0c9-7393841f1dcc	2023-05-30 22:40:26.344399	2023-05-30 22:40:26.344399	25.90	byn
7e9ded58-7bcd-410a-9045-b15c8d3a0f4e	2023-05-30 22:40:26.344399	2023-05-30 22:40:26.344399	5.00	byn
4759f655-8bcd-4a9f-825f-f45eed4921af	2023-05-29 21:16:01.376098	2023-05-29 21:16:31.966824	849.83	byn
c40dc3c1-9efd-40ef-b491-5b03b184903b	2023-05-30 22:40:26.344399	2023-05-30 22:40:26.344399	5.18	byn
3961c682-7566-4864-8e13-78d7adb9218b	2023-05-30 22:40:26.344399	2023-05-30 22:40:26.344399	36.08	byn
539bc7c5-9cf9-4718-a221-383b46e2b24d	2023-05-30 22:41:58.453761	2023-05-30 22:41:58.453761	25.90	byn
36d1be4c-b2fd-42c5-b0dd-5309e9faa364	2023-05-30 22:41:58.453761	2023-05-30 22:41:58.453761	5.00	byn
fc96ba2a-8375-4b10-807e-60094284b9e6	2023-05-30 22:41:58.453761	2023-05-30 22:41:58.453761	5.18	byn
945641f5-7a51-42b2-95e5-4a6825a1b3c4	2023-05-30 22:41:58.453761	2023-05-30 22:41:58.453761	36.08	byn
6c2e7b4e-e961-48ef-95ca-509a24d26b17	2023-05-30 22:42:03.431393	2023-05-30 22:42:03.431393	25.90	byn
ea205235-b212-431f-ae8f-8c68e7e4498a	2023-05-30 22:42:03.431393	2023-05-30 22:42:03.431393	5.00	byn
e04a3097-4fd2-4cda-a456-22ec5cfeb7b7	2023-05-30 22:42:03.431393	2023-05-30 22:42:03.431393	5.18	byn
860e9890-4cf9-4490-961a-8eaef225909b	2023-05-30 22:42:03.431393	2023-05-30 22:42:03.431393	36.08	byn
407dd010-2d30-44bc-9c10-a788e2b8d60d	2023-05-30 23:07:46.240096	2023-05-30 23:07:46.240096	25.90	byn
ea9f202b-962d-4972-a248-cce14c6f30bc	2023-05-30 23:07:46.240096	2023-05-30 23:07:46.240096	5.00	byn
824d337b-156a-4c01-a84d-7f52d1a78bac	2023-05-30 23:07:46.240096	2023-05-30 23:07:46.240096	5.18	byn
e9176740-df89-49eb-9137-c1311c8352c3	2023-05-30 23:07:46.240096	2023-05-30 23:07:46.240096	36.08	byn
51b8c4eb-581e-45e4-a80b-5855f328f626	2023-05-30 23:14:55.296248	2023-05-30 23:14:55.296248	49.99	byn
28c15da4-e6fc-4959-a7e6-071c0f02be9f	2023-05-30 23:20:46.99839	2023-05-30 23:20:46.99839	49.99	byn
102250b8-a3c4-4fe7-b97b-849196d62778	2023-05-30 23:22:50.995937	2023-05-30 23:22:50.995937	49.99	byn
bed1c282-ecb3-48b7-a7ce-ec2d8d1f3738	2023-05-30 23:27:01.491766	2023-05-30 23:27:01.491766	49.99	byn
75dc4106-5a52-4861-920d-a8a43d9c2a6e	2023-05-30 23:30:07.780096	2023-05-30 23:30:07.780096	49.99	byn
a05b3bf7-5158-428c-8b1d-6755336eacb8	2023-05-30 23:41:53.36405	2023-05-30 23:41:53.36405	49.99	byn
42fe4cdf-04d6-47e4-84e6-7a2beb48936f	2023-05-30 23:44:22.067987	2023-05-30 23:44:22.067987	49.99	byn
5009d146-29d3-4be1-b5c1-029bb3a64c63	2023-05-31 00:03:58.187025	2023-05-31 00:03:58.187025	49.99	byn
ef54c41b-70f6-49c5-8833-747418a415f1	2023-05-31 00:05:57.302649	2023-05-31 00:05:57.302649	49.99	byn
7d88fde1-1c52-4048-908b-06c85326defe	2023-05-31 20:30:00.31051	2023-05-31 20:30:00.31051	64.99	byn
16cf27b2-ceb9-49f6-a50c-11e99bdefa6f	2023-05-31 21:20:04.03423	2023-05-31 21:20:04.03423	64.99	byn
25d72759-ee9f-45c0-8f01-2d4dff214df3	2023-05-31 21:29:09.322006	2023-05-31 21:29:09.322006	64.99	byn
feb57981-0312-41a1-b670-742dac429d04	2023-05-31 21:47:48.094884	2023-05-31 21:47:48.094884	64.99	byn
7db5ceab-f8f4-4085-9531-1eb01bef513f	2023-05-31 22:01:59.929734	2023-05-31 22:01:59.929734	64.99	byn
d08d110e-83d6-4d8f-bc8a-a2132d5ef02f	2023-05-31 22:03:29.34304	2023-05-31 22:03:29.34304	64.99	byn
cc41b6f6-633a-40bf-9c6d-29ff4b41e049	2023-05-31 22:06:53.794242	2023-05-31 22:06:53.794242	64.99	byn
1d03a79f-4084-4144-81c6-f2f7ffb1f473	2023-06-01 09:01:44.03998	2023-06-01 09:01:44.03998	64.99	byn
1794c79c-ccf6-4a68-b53b-2675b9974879	2023-06-01 09:40:08.116889	2023-06-01 09:40:08.116889	64.99	byn
7166ef19-32b8-451d-a85b-e045a83e6575	2023-06-01 11:36:22.104502	2023-06-01 11:36:22.104502	0.00	byn
67116cfb-1dc5-4251-a247-c0fb72142de4	2023-06-01 11:36:22.104502	2023-06-01 11:36:22.104502	0.00	byn
f94ff45c-4b78-4219-a4c6-60140804d44d	2023-06-01 11:36:22.104502	2023-06-01 11:36:22.104502	0.00	byn
36c1d268-9dd3-428d-a03f-e767a8948067	2023-06-01 11:36:22.104502	2023-06-01 11:36:22.104502	0.00	byn
5bbdf4c9-794a-48f4-9544-b4790c5fad2e	2023-06-01 11:47:55.695256	2023-06-01 11:47:55.695256	0.00	byn
9b406bd4-ed0c-4c30-a6ec-679fa8af18a9	2023-06-01 11:47:55.695256	2023-06-01 11:47:55.695256	0.00	byn
cb6ed91a-204d-48a6-bd1f-29a94975ea78	2023-06-01 11:47:55.695256	2023-06-01 11:47:55.695256	0.00	byn
2464e6d7-36af-4d00-83f7-461353bb0580	2023-06-01 11:47:55.695256	2023-06-01 11:47:55.695256	0.00	byn
a10848fc-64d7-4c8f-9088-dd2b663297ff	2023-06-01 12:09:29.055212	2023-06-01 12:09:29.055212	49.99	byn
fb2837fc-a24b-442d-9b90-b165bf3e98c7	2023-06-01 12:20:28.873476	2023-06-01 12:20:28.873476	64.99	byn
e442f290-2540-482a-bc81-9a2d86623802	2023-06-01 12:32:14.861327	2023-06-01 12:32:14.861327	64.99	byn
18a43b2a-dadd-4810-9e73-24223e34e0d5	2023-06-01 12:35:29.663499	2023-06-01 12:35:29.663499	64.99	byn
d60fb22b-aeee-471c-bddc-6039fb5f48b5	2023-06-01 17:35:34.132193	2023-06-01 17:35:34.132193	124.98	byn
93dfcc32-cc33-49a1-a8d9-1e6c0746aa0e	2023-06-01 17:35:49.471908	2023-06-01 17:35:49.471908	99.98	byn
dd5edc3c-fc21-42a8-9b6c-5947a63c0569	2023-06-01 16:28:16.994975	2023-06-01 16:28:16.994975	64.99	byn
bf2f8655-83a8-400a-989a-1e0f2f9f1b5c	2023-06-01 16:28:39.238502	2023-06-01 16:28:39.238502	49.99	byn
1d84adad-bcc2-4062-8fe1-3168cd2a5783	2023-06-01 16:28:39.238502	2023-06-01 16:28:39.238502	5.00	byn
21b675ca-8bf8-4c50-953f-51b991fad696	2023-06-01 16:28:39.238502	2023-06-01 16:28:39.238502	10.00	byn
884018af-3ebb-4919-a38b-41187a72b3bc	2023-06-01 16:28:39.238502	2023-06-01 16:28:39.238502	64.99	byn
70d85c54-05eb-425a-ac87-16c2d2a47f0b	2023-06-01 16:28:39.277584	2023-06-01 16:28:39.277584	49.99	byn
9cd97ea2-868c-4a8b-a55e-0b390ae8516d	2023-06-01 17:33:57.144989	2023-06-01 17:33:59.194804	99.98	byn
5859cd9e-8724-4e3c-88b8-028cd5fbe1d3	2023-06-01 17:35:49.471908	2023-06-01 17:35:49.471908	5.00	byn
3507515d-12bf-401d-aab0-2f2c8a3465af	2023-06-01 16:29:39.573482	2023-06-01 16:29:39.573482	64.99	byn
589162a0-2457-4688-8f08-55abf5d1188e	2023-06-01 16:29:49.70585	2023-06-01 16:29:49.70585	49.99	byn
6437c297-6641-4dbf-beb7-245057404097	2023-06-01 16:29:49.70585	2023-06-01 16:29:49.70585	5.00	byn
cdc019cc-bb2d-4dd1-bc4b-52904231e9c1	2023-06-01 16:29:49.70585	2023-06-01 16:29:49.70585	10.00	byn
392e578f-c89d-44b1-bca9-7ec03e2ed30a	2023-06-01 16:29:49.70585	2023-06-01 16:29:49.70585	64.99	byn
03f87850-b51c-4721-be54-2f05fd0af611	2023-06-01 16:29:49.733248	2023-06-01 16:29:49.733248	49.99	byn
0982a971-4a49-4664-9801-6cb58966afa8	2023-06-01 17:35:49.471908	2023-06-01 17:35:49.471908	20.00	byn
134402fc-a25e-41ee-9a53-4a7f4ac8d429	2023-06-01 17:35:49.471908	2023-06-01 17:35:49.471908	124.98	byn
f70d1e69-6c8b-4911-9fe5-ea1e50dc5894	2023-06-01 17:35:49.505657	2023-06-01 17:35:49.505657	99.98	byn
ae3d00fd-94b6-4f87-81f0-e2150a14ce90	2023-06-01 19:10:35.440211	2023-06-01 19:10:35.440211	49.99	byn
d110997d-38b3-4239-864f-cc1425152b30	2023-06-01 20:13:26.703617	2023-06-01 20:13:26.703617	35.90	byn
5a49a90f-35a6-4fbf-a8c7-8edf8a32af22	2023-06-01 18:58:38.229428	2023-06-01 18:58:38.229428	49.99	byn
22cce5f1-3cad-4b6e-8bea-d94b1a6af19e	2023-06-01 17:06:49.355684	2023-06-01 17:06:49.355684	64.99	byn
350db9e4-ca35-470a-b9eb-eab0216c6bc5	2023-06-01 17:07:02.875927	2023-06-01 17:07:02.875927	49.99	byn
0b207cce-5ec6-48b7-a233-0943a0f8a475	2023-06-01 17:07:02.875927	2023-06-01 17:07:02.875927	5.00	byn
1f5f0700-b8d9-47c1-994d-9b88082fefe4	2023-06-01 17:07:02.875927	2023-06-01 17:07:02.875927	10.00	byn
e5efa29c-97bf-4f1e-9dcb-9d4012ece8a7	2023-06-01 17:07:02.875927	2023-06-01 17:07:02.875927	64.99	byn
f648f394-7e53-4df2-837c-ff82fb810df8	2023-06-01 17:07:02.92028	2023-06-01 17:07:02.92028	49.99	byn
0cc408a2-0c7b-4957-9fac-ac5cb2163604	2023-06-01 19:57:06.131764	2023-06-01 19:57:06.131764	35.90	byn
8bfd5ac3-eb79-452a-89f4-ae44b41d9705	2023-06-01 11:54:43.448883	2023-06-01 18:58:56.932611	10.00	byn
7518831f-03d0-4466-8d67-7cf3d2a8fd9c	2023-06-01 11:54:43.448883	2023-06-01 18:58:56.932611	64.99	byn
d3514a34-1670-4338-a449-4fa37b326dd5	2023-06-01 19:07:40.978117	2023-06-11 18:58:44.592729	5.00	byn
47ba8a5b-3fd7-48be-ad6b-0bc410aa10c6	2023-06-01 20:13:26.703606	2023-06-01 20:13:26.703606	49.99	byn
c6de8cc0-0b47-488b-b448-4bf7cebf9ca5	2023-06-01 19:07:40.978117	2023-06-12 01:22:17.033338	0.00	byn
e38d164c-03e6-4d99-adfd-2d47f603b740	2023-06-01 20:13:26.703606	2023-06-01 20:13:26.703606	5.00	byn
f04cb471-7800-4ff1-a884-0db951f6d4f5	2023-06-01 20:13:26.703617	2023-06-01 20:13:26.703617	5.00	byn
436d7c33-e9fe-4f9c-b8ac-0172fc40d304	2023-06-01 20:13:26.703606	2023-06-01 20:13:26.703606	10.00	byn
5d38f9c8-def6-4b1b-8bc7-a6e587cbae22	2023-06-01 20:13:26.703617	2023-06-01 20:13:26.703617	7.18	byn
b7e680ba-be17-46ab-ba67-871c7d4f0e25	2023-06-01 20:13:26.703606	2023-06-01 20:13:26.703606	64.99	byn
284903f9-4301-435d-87ef-57a3a2c007b5	2023-06-01 20:13:26.703617	2023-06-01 20:13:26.703617	48.08	byn
60d2d94b-5a13-49cf-ae92-b528d4600270	2023-06-01 20:13:26.759881	2023-06-01 20:13:26.759881	49.99	byn
7338b223-0f7f-4255-bbd8-fa34cfdae7d0	2023-06-01 20:13:26.760278	2023-06-01 20:13:26.760278	35.90	byn
ddc61ab8-93fe-42e2-b6c3-337aec07a77d	2023-06-02 00:09:33.550179	2023-06-02 00:09:33.550179	49.99	byn
b2a1120b-5f56-47f3-8cdd-c3057a5ccbc7	2023-06-02 00:37:05.33012	2023-06-02 00:37:05.33012	49.99	byn
1a37d3d2-ca56-4097-b181-f313809548f6	2023-06-01 21:09:38.95105	2023-06-01 21:09:38.95105	49.99	byn
fbd87aa6-3146-4714-9aa5-07a6f79c1775	2023-06-02 09:14:30.824784	2023-06-02 09:14:30.824784	5.00	byn
37d4bc92-71aa-4e97-90ff-4f42aca50242	2023-06-02 00:10:44.753692	2023-06-02 00:10:44.753692	49.99	byn
a9136f5e-1f60-42ad-8343-b7c4061507b6	2023-06-02 00:25:46.489212	2023-06-02 00:25:46.489212	49.99	byn
adaa13c4-f347-4a4c-93c5-9a963ce7204a	2023-06-02 00:37:21.726906	2023-06-02 00:37:21.726906	64.99	byn
274ba069-8592-4711-a8bc-4f3d83a716c1	2023-06-02 00:01:45.208952	2023-06-02 00:01:45.208952	64.99	byn
a9a101d9-7b43-4070-be20-66eeddddf490	2023-06-02 00:01:56.173478	2023-06-02 00:01:56.173478	49.99	byn
ccfd1817-e065-4053-8074-b771eb402617	2023-06-02 00:01:56.173478	2023-06-02 00:01:56.173478	5.00	byn
e2637e43-8b8f-4ab7-ba7b-b6eda907243b	2023-06-02 00:01:56.173478	2023-06-02 00:01:56.173478	10.00	byn
8b75d8a0-cb9b-4cf4-8183-3f3381366a80	2023-06-02 00:01:56.173478	2023-06-02 00:01:56.173478	64.99	byn
f0124277-3939-447b-9908-dc00bc988919	2023-06-02 00:01:56.198569	2023-06-02 00:01:56.198569	49.99	byn
07745584-9d59-4257-8c03-1fc79abc53d2	2023-06-02 00:37:29.658865	2023-06-02 00:37:29.658865	49.99	byn
382bab6a-660d-4428-a0dd-c8e6ef148786	2023-06-02 00:37:29.658865	2023-06-02 00:37:29.658865	5.00	byn
d4e44b29-9d03-4e9b-aa59-6dbdc889525e	2023-06-02 00:03:25.499224	2023-06-02 00:03:25.499224	49.99	byn
1018395c-2bed-4232-8387-32f2c12fe7ff	2023-06-02 00:37:29.658865	2023-06-02 00:37:29.658865	10.00	byn
a7ceffd0-48a1-426e-bc63-1218d1ae5594	2023-06-02 00:37:29.658865	2023-06-02 00:37:29.658865	64.99	byn
64bd6238-6020-46dd-91fc-771db63bc00a	2023-06-02 07:51:50.304807	2023-06-02 07:51:50.304807	64.99	byn
99b13837-e41f-49c4-a199-3af8975818e4	2023-06-02 00:35:37.028808	2023-06-02 00:35:37.028808	64.99	byn
357fa7d6-4018-4dca-8c1e-ac24b9a0e4bd	2023-06-02 00:35:45.418036	2023-06-02 00:35:45.418036	49.99	byn
51e26e6a-2d69-4d8f-9db9-be273d8bba44	2023-06-02 00:35:45.418036	2023-06-02 00:35:45.418036	5.00	byn
7fe57a2a-18b3-4668-8286-36338e6c6cc7	2023-06-02 00:11:03.890837	2023-06-02 00:11:03.890837	64.99	byn
3a8e9e3c-2233-4a5b-b9c2-5ab5ec65406b	2023-06-01 21:44:46.156133	2023-06-01 21:44:46.156133	64.99	byn
0dbc5a86-750c-4314-8dad-ca93689c35e4	2023-06-02 00:11:15.103103	2023-06-02 00:11:15.103103	49.99	byn
81c1b8b0-4e95-4855-a83d-df7f8a991287	2023-06-02 00:11:15.103103	2023-06-02 00:11:15.103103	5.00	byn
5c949060-1fef-4ddf-ad4d-f021c3d4a093	2023-06-01 21:51:50.23812	2023-06-01 21:51:50.23812	64.99	byn
dec40e56-050e-407d-b28f-e29c9b307cad	2023-06-01 21:52:06.1806	2023-06-01 21:52:06.1806	49.99	byn
6bc833bd-b73f-4c1e-ade8-5629ed6fbb14	2023-06-01 21:52:06.1806	2023-06-01 21:52:06.1806	5.00	byn
b213c2e6-272a-43c6-bc56-ca84fd2d1dce	2023-06-01 21:52:06.1806	2023-06-01 21:52:06.1806	10.00	byn
d5c8457d-ad3d-41ba-900f-542fe062926c	2023-06-01 21:52:06.1806	2023-06-01 21:52:06.1806	64.99	byn
e12bd16d-35c5-4f38-a767-72a659be8a1b	2023-06-01 21:52:06.217363	2023-06-01 21:52:06.217363	49.99	byn
e0a5195e-5a3a-4e10-ba69-1e76ddd28e69	2023-06-02 00:11:15.103103	2023-06-02 00:11:15.103103	10.00	byn
8b7f078f-ea71-4d2a-9d42-8bac82cdb4cd	2023-06-02 00:04:03.004275	2023-06-02 00:04:03.004275	64.99	byn
a9802e01-60f7-47f0-8460-15357fdf58ae	2023-06-01 22:03:54.57994	2023-06-01 22:03:54.57994	49.99	byn
1f6ab871-fb72-4ed7-ae52-84afc673bb9d	2023-06-02 00:04:13.16892	2023-06-02 00:04:13.16892	49.99	byn
c6a1760e-354c-4643-9086-abf936281883	2023-06-02 00:04:13.16892	2023-06-02 00:04:13.16892	5.00	byn
29ceb0c2-f2cd-445c-a129-b3850d74e40f	2023-06-02 00:04:13.16892	2023-06-02 00:04:13.16892	10.00	byn
edc6e3bf-8a1e-4ed6-bc5c-f950a69a6336	2023-06-02 00:04:13.16892	2023-06-02 00:04:13.16892	64.99	byn
897012e9-29ad-46c1-87d2-b1fc0d8fd884	2023-06-02 00:04:13.220691	2023-06-02 00:04:13.220691	49.99	byn
14b066e1-e15f-46b7-883e-3b37df42aac6	2023-06-02 00:11:15.103103	2023-06-02 00:11:15.103103	64.99	byn
5bbbf0be-be02-4ca4-81d7-ef2c87c7e8c6	2023-06-02 00:11:15.13982	2023-06-02 00:11:15.13982	49.99	byn
ee2218ef-262d-4d22-bb42-7953a7c75bf8	2023-06-02 00:05:18.379307	2023-06-02 00:05:18.379307	49.99	byn
328105a1-aacd-4d0a-914b-de308ed39bf4	2023-06-02 00:35:45.418036	2023-06-02 00:35:45.418036	10.00	byn
7e18091a-b9f0-485f-9a30-b476dc6858c4	2023-06-02 00:26:08.232398	2023-06-02 00:26:08.232398	64.99	byn
b029f3b6-cc92-47a7-a109-b1eb8f1d1bfe	2023-06-01 22:04:19.907023	2023-06-01 22:04:19.907023	64.99	byn
32288d9a-0f78-4f2a-86a1-994a998e4290	2023-06-01 22:04:30.203065	2023-06-01 22:04:30.203065	49.99	byn
2fb8fc97-3e83-45c5-8eab-5ee63d0025eb	2023-06-01 22:04:30.203065	2023-06-01 22:04:30.203065	5.00	byn
bc79ec14-f06b-4300-bee1-4724b313937a	2023-06-01 22:04:30.203065	2023-06-01 22:04:30.203065	10.00	byn
98078ed4-508a-4211-a40f-236a1fcaa430	2023-06-01 22:04:30.203065	2023-06-01 22:04:30.203065	64.99	byn
714185b0-c7fd-4090-9c08-921832f4cc79	2023-06-01 22:04:30.235099	2023-06-01 22:04:30.235099	49.99	byn
a2881082-5836-4e1e-8129-148232ca1a40	2023-06-02 00:21:35.320578	2023-06-02 00:21:35.320578	49.99	byn
6fa75524-daa9-4267-8f54-92d1b10a31bf	2023-06-02 00:26:16.302812	2023-06-02 00:26:16.302812	49.99	byn
ac206bf0-f655-45a9-88e4-876a976407cc	2023-06-01 23:58:46.538165	2023-06-01 23:58:46.538165	49.99	byn
61ef91dd-e400-4ab9-9ee4-ad9b4f3d6864	2023-06-02 00:26:16.302812	2023-06-02 00:26:16.302812	5.00	byn
b0a58b23-b762-4916-af9b-17bf284b774a	2023-06-02 00:26:16.302812	2023-06-02 00:26:16.302812	10.00	byn
db55f1fb-4aa3-45d2-adab-116dca7021fb	2023-06-02 00:26:16.302812	2023-06-02 00:26:16.302812	64.99	byn
3ed9f2be-a5e7-4da7-8271-2d90cb3c9bc5	2023-06-02 00:26:16.326774	2023-06-02 00:26:16.326774	49.99	byn
249693c2-54b8-4448-bbef-5ca75485e808	2023-06-02 00:35:45.418036	2023-06-02 00:35:45.418036	64.99	byn
d3d95e8e-62b9-486c-97b8-e446bc771dce	2023-06-02 00:35:45.473622	2023-06-02 00:35:45.473622	49.99	byn
673889e4-d94d-430c-b055-96efc70687c6	2023-06-02 00:05:43.453956	2023-06-02 00:05:43.453956	64.99	byn
9498cc61-e3c4-4b44-86ca-df4d955d8d43	2023-06-02 00:05:54.485025	2023-06-02 00:05:54.485025	49.99	byn
25418c72-0b3d-4b1a-bd2d-d2fcddf76716	2023-06-02 00:05:54.485025	2023-06-02 00:05:54.485025	5.00	byn
499ac30b-0a4c-45e9-a84f-6b4e0c4fe73c	2023-06-02 00:05:54.485025	2023-06-02 00:05:54.485025	10.00	byn
e7428301-2642-4e41-8e59-bc174a474cad	2023-06-01 23:59:03.648424	2023-06-01 23:59:03.648424	64.99	byn
2d9c06d2-d10b-4af2-902a-522e2ad03396	2023-06-01 23:59:12.776196	2023-06-01 23:59:12.776196	49.99	byn
b7f8fc24-3540-412b-b4db-88a6efc2ee2e	2023-06-01 23:59:12.776196	2023-06-01 23:59:12.776196	5.00	byn
9f4a67ab-5f3f-4836-a9ac-258a9f6e482c	2023-06-01 23:59:12.776196	2023-06-01 23:59:12.776196	10.00	byn
4f1b6812-6f66-434e-8058-472ba26ac817	2023-06-01 23:59:12.776196	2023-06-01 23:59:12.776196	64.99	byn
456c4e96-802c-4e74-89a1-9d8436f5f416	2023-06-01 23:59:12.800802	2023-06-01 23:59:12.800802	49.99	byn
9aa9ea32-231e-4187-b6e9-8bd87805b6b2	2023-06-02 00:05:54.485025	2023-06-02 00:05:54.485025	64.99	byn
189876cb-a894-4610-8ef3-0447da55a26e	2023-06-02 00:05:54.520724	2023-06-02 00:05:54.520724	49.99	byn
e0540180-e03d-43a3-af46-c88433ed2a0f	2023-06-02 00:00:21.443139	2023-06-02 00:00:21.443139	49.99	byn
144987a0-e9a9-4a6f-a55f-bfb82bc34a93	2023-06-02 00:35:20.815188	2023-06-02 00:35:20.815188	49.99	byn
fa29909f-cf43-4bc9-ade8-506da30a553f	2023-06-02 00:37:29.685676	2023-06-02 00:37:29.685676	49.99	byn
a6f85513-a584-4cf1-b56d-5222a39f845b	2023-06-02 00:09:00.851299	2023-06-02 00:09:00.851299	49.99	byn
b35c9b29-5fd5-46a8-846b-baa3ed37fe5a	2023-06-02 07:52:00.405229	2023-06-02 07:52:00.405229	49.99	byn
6937977a-e4a0-454a-b5bd-48ac26a09652	2023-06-02 00:21:53.319416	2023-06-02 00:21:53.319416	64.99	byn
3bab3e65-94e3-4242-9ed2-9c9c87764462	2023-06-02 00:22:04.241047	2023-06-02 00:22:04.241047	49.99	byn
7be4bbae-bcb8-4a0e-90e4-876db0567092	2023-06-02 00:22:04.241047	2023-06-02 00:22:04.241047	5.00	byn
7547c64d-4eb0-43e8-ad9d-acefaf394512	2023-06-02 00:22:04.241047	2023-06-02 00:22:04.241047	10.00	byn
fb6b9eb5-556c-4c4e-8720-8842c52cc328	2023-06-02 00:22:04.241047	2023-06-02 00:22:04.241047	64.99	byn
b7d5ebf4-d175-4989-b68b-ce3bc656441c	2023-06-02 00:22:04.269458	2023-06-02 00:22:04.269458	49.99	byn
f841a713-90ed-4329-87ea-b1ef9c13cdfa	2023-06-02 00:00:39.070303	2023-06-02 00:00:39.070303	64.99	byn
30619fc9-6c29-4ca1-a5c1-85938bab2347	2023-06-02 00:00:57.82459	2023-06-02 00:00:57.82459	49.99	byn
0031e87a-000c-4511-9f47-5411ef365182	2023-06-02 00:00:57.82459	2023-06-02 00:00:57.82459	5.00	byn
5c9522a7-f9a0-4800-9e69-2a5997f75a6d	2023-06-02 00:00:57.82459	2023-06-02 00:00:57.82459	10.00	byn
38955e06-c463-484e-8618-238fa5b87192	2023-06-02 00:00:57.82459	2023-06-02 00:00:57.82459	64.99	byn
0f87bae6-9bfa-4171-b3dd-7c3a8d42cd7d	2023-06-02 00:00:57.862233	2023-06-02 00:00:57.862233	49.99	byn
bc168149-48a1-4d56-afba-e9dbf941c8d1	2023-06-02 07:50:02.794039	2023-06-02 07:50:02.794039	49.99	byn
5ef4a76c-2bf9-4a6d-801a-66cecda72400	2023-06-02 09:15:04.351926	2023-06-02 09:15:04.351926	5.00	byn
ceb3238b-8596-494e-b1f8-130723911954	2023-06-02 00:01:29.518663	2023-06-02 00:01:29.518663	49.99	byn
4785c9c6-e0f1-4f42-8fc1-9ed967b8e96c	2023-06-02 07:52:00.405229	2023-06-02 07:52:00.405229	5.00	byn
1b3a3eb6-6df1-4a2c-b792-dcc6426a35b4	2023-06-02 00:09:22.755469	2023-06-02 00:09:22.755469	64.99	byn
cf4b2452-92ff-4393-b4b6-fdddd631d495	2023-06-02 07:52:00.405229	2023-06-02 07:52:00.405229	10.00	byn
36719320-7325-44cb-812e-56aba2c80a2d	2023-06-02 07:52:00.405229	2023-06-02 07:52:00.405229	64.99	byn
83d813e0-b092-45e5-a01c-076c8b7045da	2023-06-02 00:09:33.523294	2023-06-02 00:09:33.523294	49.99	byn
977f1475-2f73-4c4e-8272-2664af554d49	2023-06-02 00:09:33.523294	2023-06-02 00:09:33.523294	5.00	byn
9a75b73a-6cf2-4424-b435-670e454cfb2b	2023-06-02 00:09:33.523294	2023-06-02 00:09:33.523294	10.00	byn
331806b6-732e-4f9e-8ffc-599e4871e220	2023-06-02 00:09:33.523294	2023-06-02 00:09:33.523294	64.99	byn
18793ba9-748d-4e19-a408-58681148a536	2023-06-02 07:52:00.453129	2023-06-02 07:52:00.453129	49.99	byn
a5f85b44-a97c-47ad-a2d1-477aec369c95	2023-06-02 09:27:10.810497	2023-06-02 09:27:10.810497	64.99	byn
51e689d0-bd85-4655-a760-fd800ef36ca9	2023-06-02 09:20:10.242529	2023-06-02 09:20:10.242529	5.00	byn
959e185b-3983-49f1-b0ca-c2a4f57acfbd	2023-06-02 09:26:38.596791	2023-06-02 09:26:38.596791	49.99	byn
496b52f4-546c-447e-8838-e347824e40fe	2023-06-01 19:07:40.978117	2023-06-12 01:22:17.033338	0.00	byn
7ac2de8d-4c38-4f7e-874b-9c4b723030ef	2023-06-02 09:27:42.476234	2023-06-02 09:27:42.476234	64.99	byn
db592467-a027-4bbb-aa05-513d311cea37	2023-06-14 08:33:25.643933	2023-06-14 08:33:25.643933	0.00	byn
2e1a935a-a3ac-40c5-8478-70b133f0aac1	2023-06-02 09:27:45.777766	2023-06-02 09:27:45.777766	64.99	byn
5d771d5f-b5c5-420e-b6df-a709c142376a	2023-06-12 01:21:35.755525	2023-06-12 01:21:35.755525	25.90	byn
e8a3d695-2af7-4872-94fb-a57f0860967f	2023-06-14 08:33:25.643933	2023-06-14 08:33:25.643933	0.00	byn
91239503-34fe-47e3-996e-f26b20796f63	2023-06-02 10:35:25.972343	2023-06-02 10:35:25.972343	64.99	byn
7161d78a-9cb7-4771-be6d-686bdefe0439	2023-06-02 10:35:36.035917	2023-06-02 10:35:36.035917	49.99	byn
9920dcc6-927b-4f64-aa32-c28d1eceb453	2023-06-02 10:35:36.035917	2023-06-02 10:35:36.035917	5.00	byn
c69dfd1f-a904-407b-b295-e0834dc9d272	2023-06-02 10:35:36.035917	2023-06-02 10:35:36.035917	10.00	byn
c538a587-dde9-46ae-8c52-3e0cfe6584a2	2023-06-02 10:35:36.035917	2023-06-02 10:35:36.035917	64.99	byn
874f61fa-b49a-4bc4-be3a-6f273627506d	2023-06-02 10:35:36.066518	2023-06-02 10:35:36.066518	49.99	byn
d1f07288-d7ac-4fe6-9e96-e753a199c5d5	2023-06-12 01:22:14.162433	2023-06-12 01:22:14.162433	36.08	byn
3b980990-9c12-436f-84e7-a3b21c363a44	2023-06-02 10:37:36.674736	2023-06-02 10:37:36.674736	49.99	byn
9167b785-ec94-4809-8966-8f1461130981	2023-06-12 01:22:16.966449	2023-06-12 01:22:16.966449	25.90	byn
d207778f-7909-407a-89bb-7a40734b8d06	2023-06-12 01:22:16.966449	2023-06-12 01:22:16.966449	5.00	byn
735e4cf8-a42c-4865-a4c8-76e2a6a0c20f	2023-06-12 01:22:16.966449	2023-06-12 01:22:16.966449	5.18	byn
c8b4b224-cf69-4959-9dcb-44ec48fb7a6b	2023-06-12 01:22:16.966449	2023-06-12 01:22:16.966449	36.08	byn
094304a2-c27b-4e37-8acf-1da7e3a875b2	2023-06-12 01:22:16.994164	2023-06-12 01:22:16.994164	25.90	byn
a3ab5a6f-2ae4-41b9-bec9-39e86db198ef	2023-06-02 10:37:52.625444	2023-06-02 10:37:52.625444	64.99	byn
ca058828-177b-4ba4-a2af-57dfc773a8f6	2023-06-02 10:38:00.555401	2023-06-02 10:38:00.555401	49.99	byn
9b1157eb-171a-4f95-8bcb-8144962d45d7	2023-06-02 10:38:00.555401	2023-06-02 10:38:00.555401	5.00	byn
bb8b8a77-d1b7-45ed-a845-59659f551b3a	2023-06-02 10:38:00.555401	2023-06-02 10:38:00.555401	10.00	byn
a01a5e0e-ad27-4fa5-892e-36a55b3eec7d	2023-06-02 10:38:00.555401	2023-06-02 10:38:00.555401	64.99	byn
a88d637e-5dac-4d27-98c8-c55f3bd21908	2023-06-02 10:38:00.584394	2023-06-02 10:38:00.584394	49.99	byn
87c1f0c1-3693-4aaa-ba1a-8d11078d5f13	2023-06-01 19:07:40.978117	2023-06-12 01:22:17.033338	5.00	byn
3392a0f7-a307-4180-8dff-78a886fe8c7b	2023-06-02 19:49:22.117743	2023-06-02 19:49:22.117743	49.99	byn
e3704177-d1bc-476c-874c-43cc35922816	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
c2da174d-e4bc-453c-bfb5-501d38293e42	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
efd09ebf-e226-4865-b9a2-978ed2e2dcde	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
733aae6a-353e-42ec-a74b-1c267636cc6d	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
daa8254f-d5c9-4b5a-9bc7-3b34c39ec66d	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
600dbf7f-8f0a-44bc-a054-3af2802c8471	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
f4fcebaf-f258-4e3a-aa2f-07e18520aab4	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
3136e7e1-ae87-46f7-b779-6ded91eeaecf	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
80f2ef56-7f90-4e17-9a8c-9b4d860185e5	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
0559b552-db1d-45d4-a1bb-1f6cdabd7a34	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
b3dfba24-684e-4dbd-bfe1-990b3e4e52ba	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
69fd7156-f91c-4013-a01c-6fa05dab0a21	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
93cd4844-1d31-4343-b415-eb5991705d35	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
457f62fa-f939-4a33-bb40-2166c6a534c4	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
a4b2add3-a651-4d67-af0c-585dc3582fd5	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
ad883e2c-44a8-4063-a7f6-ac2c8546f173	2023-06-08 17:08:47.134746	2023-06-08 17:08:47.134746	59.99	byn
704ed8d7-9c4b-4b49-b25c-de20b0a04963	2023-06-08 17:13:52.473186	2023-06-08 17:13:52.473186	59.99	byn
c4a64f52-1045-4d54-803a-05b27ce4a745	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
85add6bd-83f1-4ad1-bb42-e695e40ea286	2023-06-08 17:13:54.123014	2023-06-08 17:13:54.123014	59.99	byn
03bef2e4-d707-4b8c-92e9-647053531cd6	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
d608824c-cde0-4962-8942-676de8d256fb	2023-06-08 17:13:57.252365	2023-06-08 17:13:57.252365	59.99	byn
40219154-58f8-44fd-bbb2-4845a5c15cd8	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
036c0fad-5140-4f4b-83da-e11587f11bbc	2023-06-14 02:31:34.178201	2023-06-14 02:31:34.178201	14.80	byn
0da6dc72-cc08-4f24-aebe-2159ef312af0	2023-06-14 02:33:05.97804	2023-06-14 02:33:05.97804	35.18	byn
8e18c77d-f066-41c3-a364-27239a70be81	2023-06-14 02:33:05.97804	2023-06-14 02:33:05.97804	35.18	byn
93de2d6b-5c17-493e-b222-f1d6bb28b605	2023-06-08 17:16:16.783708	2023-06-08 17:16:16.783708	275.95	byn
0a9410c3-bc23-4cdd-9d01-9f0c78bf96b3	2023-06-08 17:16:55.58448	2023-06-08 17:16:55.58448	229.96	byn
ea580744-7f12-45ef-a707-94760a1fd8ac	2023-06-08 17:16:55.58448	2023-06-08 17:16:55.58448	0.00	byn
40c2761c-8bb5-47cc-bf5c-3a701dae2ab3	2023-06-08 17:16:55.58448	2023-06-08 17:16:55.58448	45.99	byn
05606283-eb62-4b39-9b91-1e895090448a	2023-06-08 17:16:55.58448	2023-06-08 17:16:55.58448	275.95	byn
58ba24bd-7273-4604-82d5-b38efbb459ce	2023-06-08 17:16:55.646143	2023-06-08 17:16:55.646143	49.99	byn
34ac0517-94d6-4ed0-abaf-78077ec5b20e	2023-06-08 17:16:55.646143	2023-06-08 17:16:55.646143	59.99	byn
35f8ab4d-6277-45c1-afc3-9c6467285a79	2023-06-08 17:16:55.646143	2023-06-08 17:16:55.646143	59.99	byn
cdadc6de-7226-4e15-ad09-93819e3d8cdc	2023-06-08 17:16:55.646143	2023-06-08 17:16:55.646143	59.99	byn
5a9cc153-b40b-459c-9257-1ad35616c913	2023-06-14 02:33:05.97804	2023-06-14 02:33:05.97804	35.18	byn
db879cba-6db9-48d1-824e-19c4bea372aa	2023-06-08 17:37:28.251084	2023-06-08 17:37:28.251084	49.99	byn
18730695-656f-4457-8928-fc8e6f846f3d	2023-06-14 02:33:05.97804	2023-06-14 02:33:05.97804	35.18	byn
de459ece-d656-4b50-95e8-cc7b8f60262b	2023-06-08 17:41:54.688182	2023-06-08 17:41:54.688182	59.99	byn
cfe61dfd-537f-4974-95f4-9182baec8677	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	18.00	byn
cd9ca804-536d-4d65-ba9f-15b86f5b6c08	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	18.00	byn
55037aa2-08ea-4c5d-9f8a-93f386353770	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	18.00	byn
d7b6ad4a-bd76-43dd-8f0d-dd41217abc68	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	22.00	byn
1ee78587-ae09-4c39-9cf9-070533dbb895	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	22.00	byn
38f910d4-b2b5-41d8-b4c8-beca6a8a11fb	2023-06-08 17:42:26.649222	2023-06-08 17:42:26.649222	136.98	byn
86f72678-62a9-4ed7-969f-dd1bb00033ab	2023-06-08 17:42:35.895549	2023-06-08 17:42:35.895549	109.98	byn
440004ec-0247-4d5b-9385-0f0ada2aee55	2023-06-08 17:42:35.895549	2023-06-08 17:42:35.895549	5.00	byn
43f153ef-1d94-4052-92ee-ef85cf94e736	2023-06-08 17:42:35.895549	2023-06-08 17:42:35.895549	22.00	byn
75d1b82f-d47b-4daa-8481-dcbe6ca6c929	2023-06-08 17:42:35.895549	2023-06-08 17:42:35.895549	136.98	byn
fc093661-805b-4d9e-8711-69ea6aebd5b9	2023-06-08 17:42:35.963108	2023-06-08 17:42:35.963108	49.99	byn
1f225b39-cb48-4e9b-abc3-21640f1955b0	2023-06-08 17:42:35.963108	2023-06-08 17:42:35.963108	59.99	byn
7f00cc24-91cd-40a5-8d01-21f19bb5b919	2023-06-14 03:11:15.438483	2023-06-14 03:11:15.438483	22.00	byn
febc0cf6-22c2-40cf-b643-8a95daa5ef19	2023-06-11 00:43:33.219244	2023-06-11 00:43:33.219244	25.90	byn
2479b436-06e4-4e2a-81b3-dba1988e2360	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	13.00	byn
b4b99d05-7ba5-4c3a-bc68-4c71e6a1753c	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	13.00	byn
e21352a0-6530-4e56-a14b-46812f547a2d	2023-06-11 00:52:42.10948	2023-06-11 00:52:42.10948	31.08	byn
b75ba498-4726-41f4-923f-00679702af09	2023-06-11 01:03:26.586565	2023-06-11 01:03:26.586565	25.90	byn
c9822faa-1010-4adc-bf5a-9821e26223a3	2023-06-11 01:03:26.586565	2023-06-11 01:03:26.586565	0.00	byn
d6e524bc-a727-4bdb-a8ff-e78f01d71581	2023-06-11 01:03:26.586565	2023-06-11 01:03:26.586565	5.18	byn
50fb01dc-3f6c-4847-89f1-4f73b93cc72c	2023-06-11 01:03:26.586565	2023-06-11 01:03:26.586565	31.08	byn
fa2dd437-1858-4d72-9d08-665561e1f1a3	2023-06-11 01:03:26.623662	2023-06-11 01:03:26.623662	25.90	byn
bc27ad5c-f5aa-40aa-9b7c-6b17e3dc74fe	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	18.00	byn
3ba0fdb8-3ec4-4539-b4ec-606c82bbaf08	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	18.00	byn
538f5b3b-16ec-49b9-abff-b5e9d4cd6f14	2023-06-11 12:15:41.382993	2023-06-11 18:58:09.776761	51.80	byn
55b0f7a1-92dd-4668-803a-79e95ff39b39	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	18.00	byn
f8b3efd4-a6dc-4f2d-8f9e-4273713d3ce2	2023-06-14 08:33:25.643933	2023-06-14 08:33:25.643933	0.00	byn
1484568e-a073-40a5-92b5-15b70c85da86	2023-06-11 18:58:48.95093	2023-06-11 18:58:48.95093	51.80	byn
b9fa3b0c-4d58-46c1-95f8-6e4d0fd47a53	2023-06-11 18:58:48.95093	2023-06-11 18:58:48.95093	5.00	byn
221f563f-4083-4edd-accb-b72e5fff3ef0	2023-06-11 18:58:48.95093	2023-06-11 18:58:48.95093	10.36	byn
4edbbcb4-088e-4c3b-a0ec-71a2e7081471	2023-06-11 18:58:48.95093	2023-06-11 18:58:48.95093	67.16	byn
67eab911-34ac-4372-8057-5905b193f41c	2023-06-11 18:58:48.982448	2023-06-11 18:58:48.982448	51.80	byn
a201170c-7a18-49b0-968b-53cbe1a7c566	2023-06-14 03:37:12.985764	2023-06-14 03:37:12.985764	18.00	byn
2283fdcb-0fd8-403f-878b-139ecfc7807f	2023-06-14 08:33:25.643933	2023-06-14 08:33:25.643933	0.00	byn
a96c8ec0-da65-4960-92de-9c876d2ebbd8	2023-06-14 09:01:36.203855	2023-06-14 09:01:36.203855	0.00	byn
b78236e5-9fd8-4ed0-8f51-d285db2e3656	2023-06-14 09:01:36.203855	2023-06-14 09:01:36.203855	0.00	byn
213fb2d9-33d2-442f-a2a0-5636dd71798c	2023-06-14 09:01:36.203855	2023-06-14 09:01:36.203855	0.00	byn
3dc00c49-7c2b-4be3-a458-ab2a41064e93	2023-06-14 09:01:36.203855	2023-06-14 09:01:36.203855	0.00	byn
786e0284-676b-482a-8935-f3097daee584	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
e45f5f14-e6fb-4019-9c6c-baf428c31126	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
f75031a1-d8c6-471f-a9f0-be8a27568f4d	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
eb057935-7a87-4bb1-9fd1-f4cc896fb6d7	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
7b4e4c5c-b895-4b76-a8c3-2f543191b81c	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
aac39a31-d220-4125-a7c6-eea4a8cbc1c8	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
b0783646-7fbb-432c-a2ec-b6647d8ce4a3	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
a1ad485a-6856-4d67-bd6b-a8998ceef8b6	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
53f83aa2-d618-4940-92b8-c3f66d6287f3	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
e4bde26f-278a-4190-b6f1-a6687ebcf3f9	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
11d8186e-e30a-4105-93b2-cdb80151c7ab	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
5a0b5517-7c10-434f-a7e7-9de2297ac855	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
088521eb-e471-4da7-b534-3005aaafcfdc	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
7dcd6305-f33c-4fe9-8478-6f0963a36aea	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
4886b648-aef8-43cd-89b0-f052791bb4bf	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
747aeb35-dc56-4d04-8935-dca5eb0e611c	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
fe68f156-3395-48ae-9fd1-97e2fbeeeb2b	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
a73a8df2-25f3-46c9-9751-2ce07486e85d	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
459e11ab-c507-434a-b23b-3642d41b43a5	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
46aceb73-d527-4d2b-9219-a1d13666ef66	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
43d9d42a-5bb6-4b9c-b131-62c0d609d91d	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	39.99	byn
3211f67d-44bc-4f36-86d8-a1be237d26ba	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	24.99	byn
117ec92b-e488-448d-902d-abf5a69d3e5b	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	24.99	byn
5193cbb6-223a-4168-bab7-a730b5e542ed	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	24.99	byn
eb7718f5-fe4b-48e1-959c-1b5b87c31824	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	24.99	byn
836709b3-ba40-4bab-9076-5f0376300288	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	25.99	byn
28ca5746-9bfd-4da5-9ad2-6474c64381f4	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	25.99	byn
ae2d6078-c0ad-4ee1-9682-a29412e055c7	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	25.99	byn
011d6d26-db7b-450a-97f5-c21d6aaaa5e1	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	25.99	byn
a2acc067-e0b2-4884-9035-639141c463b9	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	25.99	byn
073e4d6f-b9b5-4687-904d-53dcaaa41a46	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
4f0dc916-ba13-4675-96af-6bdeb34114e5	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
1d3532f2-4f38-4bab-a1f8-615629d927ae	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
d191e02d-1e5c-4338-9fbf-db832d6f7634	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
2dc1b1c9-a708-4a56-98f4-511292698050	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
16f12047-d230-4a34-ade5-8fe2b16d17ea	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
bc93aeef-9ecc-435a-b00c-617b45d47361	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
8766adc7-e4f3-4481-8059-2d3cdece0dd0	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
b2dfe444-463b-4ebb-a546-6d2340156de0	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
ecb5030f-6fa1-4044-950d-25759a6e4979	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
5145bfd7-20b9-4e3d-bd06-40067ccf077a	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
15832db0-f810-421b-ac2c-952cbc2a485e	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
908c1d90-55f0-473b-9ec1-a268ea95e44f	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
cc586cab-b922-44e2-bf99-f271892c3278	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
f82defa6-0013-41a5-aaa2-2f303168c120	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
dbc10e65-00d1-4f6b-8f79-9bd902b9d418	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
6fc633c0-9a7e-466a-aad8-c12ca743b5a1	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
dcc5a8e5-d2ce-4fd0-a936-6d0f3cc2f716	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
73713ad5-38f3-4779-8712-e04af975c34e	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
ee5ac824-2522-46ae-8439-3d0f69c75211	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	19.99	byn
400d6d9e-0c4f-436c-92d3-d62c3c34dcc4	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
8bde0116-b19c-4474-b1a2-34106fe3e1d1	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
2115af41-a25a-4526-adcf-a21d5a83dd11	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
ac5d3aa7-585d-48f6-a3da-3f0cf550f592	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
091a070e-3150-428b-928e-7d8ffc83f900	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
b737ebaa-7fcc-4636-85f7-1593875e4012	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
2743ae7e-9ecc-4ce5-a99b-b7e83dec6588	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
6c34dedb-b4d6-4f68-86e6-1b479ba7dd1c	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
bd61ebac-fb78-4dc7-98b6-0c3f0cc09522	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
8293635c-7722-4912-8c79-cb01873a934a	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
a8dfbbba-5930-429b-9a73-a971c73cb076	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
cbdb67b9-d06d-4352-8903-4cce707b2a40	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	34.99	byn
50fe868f-ae73-48f1-bb59-f0a13539a14d	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
f13c97a9-03d8-4534-8bd7-1aef74ab84ae	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
74c58253-db84-488b-830a-5361e1709d7e	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
eaf90ff3-e9a4-435b-b206-62e8f75507e1	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
5b5bf9af-4af1-424b-ad92-1a93e56b95e9	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
d974e6c0-0a7d-495c-a67b-16c116ca4232	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	14.99	byn
e70b0b57-a08d-4017-aebf-53b60ffb6ed9	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
e3d0cb72-da03-4b7a-94e8-36f077d6433b	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
00d7be17-e1e7-4706-b18f-8bb154b0ab13	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
22f9d8a9-206b-438d-abc6-034f7083288d	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
73ea4486-a05d-4b7e-bf63-4927e4a8c471	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
c5d80af3-3e97-44ba-8045-01b66b7b5f35	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
4651088a-f2da-4063-9db5-37823182e6ed	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
3d0f7fe6-3838-4d30-9ab4-3966b66b4a1e	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
d1331918-b317-4afd-b648-2c03d1d30032	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
8d3af3b9-e900-4198-a655-4ba5b15f822e	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
1173c055-b585-47f3-80b1-ad62ef4ca2f8	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
c74397f5-1e27-4e67-b824-8048a896e9a4	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	24.99	byn
b5d2b561-05b3-4152-b3b4-41e985a93d3a	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
574ed756-5506-456b-812e-d350ed384dbc	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
d718b592-d693-4fa7-bfeb-54422b8747d1	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
f0538c45-650c-4f1a-873d-dd013bbff7f3	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
0b30e4a3-7836-4e41-a82d-5682b0612d83	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
3c1d1609-1046-45e8-b28f-192c614403b4	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
b655ba9c-85a1-45b7-bf69-66849612a114	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
b9de2c5a-5b57-4ac2-9cf0-e2d25e9511e7	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
9594605d-28db-42b6-ae29-136d8015b547	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
160ff0fb-2361-4770-8429-54fd7edb4018	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	59.00	byn
2aabd6a7-8e11-4cf8-8ba2-3392d7b7a3cf	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
f6c3d79a-7bbe-4bdc-9cf1-aca73db51806	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
809660c5-f40e-4476-afe7-c531f46bb538	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
a6e87fb0-197c-4253-8f24-8f4b8c126a21	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
e160aa20-271a-4db5-8121-682744afd29e	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
0a1a85af-2a9e-430b-9e8f-45120d9c9685	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
569f453d-9795-47fe-8ace-6537e869b61b	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
3d270eb7-7fcd-4e75-9310-4bb016d74966	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
28c1636a-d2bc-4ecb-97c0-c5cede5b03e9	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
ec28e21c-4aaf-4fb8-9dd6-fcf5e3ff50cd	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
f2a80ad1-041b-4a1d-88a6-0c3dce748970	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
af44266d-d13f-43cf-89c8-ec28716ceda5	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
20863810-36e6-4f57-a454-93155391a845	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
c9e74ce2-db70-4add-944b-253cef6605b3	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
256a186e-e661-46cd-bd6b-3f5bb061860f	2023-06-14 09:35:00.960337	2023-06-14 09:35:00.960337	59.99	byn
b9dd3ba6-94a1-4e00-8ea9-e409de3db08e	2023-06-14 09:35:56.725433	2023-06-14 09:35:56.725433	24.99	byn
48f438b0-6c3c-455c-a37b-db426b6e258d	2023-06-14 09:35:56.725433	2023-06-14 09:35:56.725433	24.99	byn
c4eec29f-c241-482d-bdc1-e1d1de0857f7	2023-06-14 09:35:56.725433	2023-06-14 09:35:56.725433	24.99	byn
f82f3613-b534-48d1-9c8e-d0eaf575034d	2023-06-14 09:35:56.725433	2023-06-14 09:35:56.725433	24.99	byn
03ac3ff5-d477-4bc8-a17a-3691a4727158	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
8fd3af0e-c662-4c95-8c2c-d0fa129171f5	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
4ba56c5f-cfd6-43d8-9df5-f65de29d876a	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
52034cf6-deec-4e08-a628-61fdbb8a643a	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
41e5780d-de9b-43b3-8224-90f3f0b947aa	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
e787c1a7-3b7e-45a5-b36d-80d0bd707690	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
bce2fa53-fd97-47d8-a0cf-fb13cf638583	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
0ef466b9-843d-4c25-ac57-57408a8b847b	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
68b9a355-35bb-494c-b387-3e94a32b1a2c	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
f2d0c279-e5ab-4317-917e-6cc22e3cc2a9	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
9c25cf1d-001a-4d76-92a1-e834af4bf919	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
ba9418ee-063b-46bd-891f-a301385859ff	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
80d5530e-404a-4e54-8cf4-df46da338cf9	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
da726527-7f40-4c28-be77-1a065a6f78f1	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
d8afb071-7680-49a1-a7d1-d5ee83cbd890	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	59.99	byn
17f0aaf2-d6eb-4ebd-ad26-d53406480669	2023-06-14 09:43:12.155258	2023-06-14 09:43:12.155258	24.99	byn
1c41703a-ee28-4c2d-b82b-5bdf7b1d210a	2023-06-14 09:43:12.155258	2023-06-14 09:43:12.155258	24.99	byn
6865a61f-d155-4e1f-9cbf-1ca853fd9cc2	2023-06-14 09:43:12.155258	2023-06-14 09:43:12.155258	24.99	byn
2e327b36-c470-4e1c-9a3b-f1c4d6e20413	2023-06-14 09:43:12.155258	2023-06-14 09:43:12.155258	24.99	byn
b3fb24fa-c0a5-4994-8c56-c495badb86f3	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
7f6b887b-b748-496a-9816-e0b4bdd008b3	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
0fd24305-3218-4fde-bec5-65f33a133627	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
f48d6ff7-5e38-4cc9-b99f-ef5ac85dfe29	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
191a234c-f4ec-4e01-ba9b-17c0dea66f0c	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
58bd60ce-f25b-4f03-a0ab-5a84143f0216	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
ff09bf9d-a1d6-4a4d-ae34-0d92d005acb2	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
a6af79dc-bf02-4d9f-ab3e-739844e06d7b	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
35729e60-40cf-4974-8075-a63dbf3478f5	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
e5a4955d-4713-40c1-b14e-fd505a0e693c	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
7563f5d8-3d5a-49a7-953b-461df05a689e	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
54609bb6-03a8-4f7f-89f1-bad10917dbb3	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
810d7421-4190-4f61-a7fa-a077e545c6d2	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
2c5f4f7a-3af2-4c47-8e7b-105870121d41	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
ffa3a7fc-f0ec-489c-b1d5-98bba178a2b6	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
dbf3e6f2-4c94-4160-9b59-19d07727909f	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
4c8b2cda-ec8a-427c-bc20-af86bfd663b5	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
7896b136-b00e-4cb4-be49-e0243d342257	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
6789f031-5bcb-4d94-ba89-a1bdfb9cf01a	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
4514da5d-e9ed-4483-b35b-7b272dc6a193	2023-06-14 09:48:05.507844	2023-06-14 09:48:05.507844	12.99	byn
5635aedc-307b-4974-a3a1-75e0ab09b5d5	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
7ecc5964-bad0-47d0-89dd-1b5c1245f069	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
095affaa-aca7-4bc7-be13-c18793eb0ef3	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
91e3abc1-5a31-4fae-b511-496f2722ca47	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
1eafce45-1fe4-4310-894b-130c718120b2	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
7b1401a4-7d69-49ab-b457-3683e1430610	2023-06-14 09:52:57.739995	2023-06-14 09:52:57.739995	12.00	byn
5d5ef37d-e9e2-4596-b9ce-59aaeb91aeb6	2023-06-14 09:55:36.677145	2023-06-14 09:55:36.677145	15.00	byn
4f91c27b-8d88-44f8-88eb-3718600df022	2023-06-14 09:55:36.677145	2023-06-14 09:55:36.677145	15.00	byn
439bcd29-8301-4f81-9224-9cfda33b243c	2023-06-14 09:55:36.677145	2023-06-14 09:55:36.677145	15.00	byn
ba9baf0a-b1e2-4b65-a5e5-cf33cf21c499	2023-06-14 09:55:36.677145	2023-06-14 09:55:36.677145	15.00	byn
c59355de-f0af-40d6-9c50-657fab4502c0	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
9ab1296d-467c-48c1-8e6f-68ad6a5f4d44	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
2bb89963-5a4a-4c77-a4a4-246569b12f47	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
09f1dfaf-0bbd-4e72-b4ac-51c7a10a19d7	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
605c1627-c445-4629-9782-e2ab0e95c70a	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
d4bbf43b-8c96-45a3-af7d-324490ec0e64	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	24.59	byn
0d5726e6-5cf5-4917-869f-fde4dafe5c74	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
9a106b24-1ccf-47f0-9581-5e0c030ec0ed	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
35e5f02b-b797-4457-a897-64e0092983de	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
42385368-711b-415e-a4c0-e6bb9c06eb6e	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
848d0dc7-b731-40f2-a051-c5071d4e5eaf	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
f619460c-f1ca-42e5-91ee-73871e506c81	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
7c762833-438d-4c22-baa7-0b5ac30edf51	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
a752eee2-c9c7-48de-837f-289cf2492568	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
7080c60b-4be7-4c6d-be15-22e708c9fce0	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
e6fbbe13-c465-419a-a2d1-585fc58660b8	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
831c8254-7c2b-49da-b199-286422cc5d28	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
5e74fb1a-2e2b-4704-8825-da77bb3141d1	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
67dba2f3-080f-427d-a394-4a0f3199987f	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
f2f23c5a-95b2-4382-bed3-450069f22cd1	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
9ab2eb63-a8ca-4cba-8bcf-ec4a03873da5	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
12402883-2b1d-4f8a-aa3e-5ed59c6eb00a	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
27a23216-89cd-4283-9b3a-3d8bb087d180	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
d11e9c84-b0a9-4263-acda-f439005e965d	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
068edee9-38d0-4b2d-941c-ee4c74bb0a74	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
e87ebdaf-3068-42f9-97a0-823b1d95a687	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	12.99	byn
eabe38a7-924b-48be-b0b1-e9139000df8c	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
a2aafa01-41ca-4dd7-bb56-dc46d8455251	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
44ec7a97-a2e6-4ad9-8b82-cacfc5f5ebae	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
b4a36af5-70b1-42bc-bb5c-18e42c74f3ec	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
c2dc77d3-7708-48c6-a2c8-703a4c3b2580	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
496bd2f9-37dd-4ebc-ba32-c3ab2fa503ab	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
6f96777c-ad40-48c4-9bfb-87820e0d5f9c	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
6a3e3984-50ba-43be-bcfa-b604b3d68174	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
b572e313-8ca2-48ec-a639-3541714f720c	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
094727e4-c60d-4518-8e8d-3e7b94cc8461	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
9668330d-9b28-42cb-a013-49c40ceb28b3	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
23a9426d-6abb-48b5-942e-a7b36316805a	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	24.99	byn
f5b9ac7f-246a-4e5d-b59c-5c68ca79ae7e	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
0866618a-aa54-4a7c-af4e-dd7649f574b0	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
783d7b54-1376-46ab-9f5d-99dec6f68f1d	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
9e2a4946-b40a-448a-a975-ab2daede697a	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
c8e4499b-9d41-4f10-8dda-d5ca93a8e735	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
224cf4b1-39f9-4a2d-b346-bed7f7aa82fd	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
5d1fa421-a8eb-4b92-b263-d78905578cac	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
ab075138-a46f-449e-89ab-c363ab350263	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
665a16be-a6fc-4ff2-a845-fe9a8bbc7268	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
f3c4f242-e40e-439d-93d6-70222f7a0f10	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
c3b758ea-c936-4518-be72-9c1fbe3e6acd	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
f59c1f10-f10e-413a-afe9-5a1b68dea922	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
b4d232b8-8ca8-405e-8861-82739acff84e	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
1dedf450-a3c0-46a7-9bc8-b52b6280627d	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
296171be-fafb-4407-9261-a060f144f3e3	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
639feef3-554b-41e3-9787-eed35a2d0c6f	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
28276703-9db1-4dd8-be2a-1c4f17331a46	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
17755f4f-ad42-4b40-b6fa-f263801b9687	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
813e7c1b-4ec7-46ca-be88-779b0102138f	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
9a6792b5-68e6-4363-bd0e-1a3020982a78	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	34.99	byn
cdc09a72-5a65-430f-81ca-fcac4baf4180	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
edb752a7-4d6a-4ecb-a616-86a00f62ff73	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
87e52fde-f4e3-4f97-87c4-0052898fb475	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
25a398e9-720f-422b-85fa-a43764fdc36d	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
e5c20f91-67ba-4cc2-b22b-b6599134f8db	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
3c221055-395a-4e16-a1b2-cc3089b7631e	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
5ce4c3f1-ac11-46cc-a485-73f5fbf54907	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
ae8d6f8f-1c15-48b9-be98-c451bb87c1a5	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
3e26d3b3-c418-48b3-9e21-680d2710b5fb	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	24.99	byn
19e5b1e7-d4b8-4525-8fa4-bd2d9975f829	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
1ea3019c-5951-4da3-9b0e-2839da3ce783	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
c55364ac-4cbb-43e4-a9b0-834cb90cd8c0	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
8ccf1af8-bcd5-4688-9042-c57e34e17c55	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
91302c36-f7be-4b74-b558-0dacd41e11eb	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
e26041b1-1297-482f-9c7b-de09d861dda6	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
8e6b6648-93cb-4143-aed8-afde963cfaca	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
0731772b-8d9f-4a4e-bde0-dc3ffc2ba578	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
42c7b32a-ec6e-49ab-8bb2-2449d33fa287	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
7e2de07e-f51e-4e9c-861e-67a32a633d58	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
0dde7e4a-e26e-4db8-91b5-6b5ccbd68812	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
5d6a5177-8406-41d0-aee6-35d4f7033fad	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	17.99	byn
6fa2f1af-bcd7-4d8f-9fb5-f8f933622d9b	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
999cd0ee-f757-4e6b-b1ec-ea726c692e76	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
6d4f4192-0fbd-478a-98db-9fd0e7b42f5c	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
bf668f35-87f9-457d-81f3-c7e26305bd87	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
8ac63c78-9191-4b4d-b08a-ce55ec9fe474	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
4d18ce30-ce73-41ad-ba0b-17d99c3132b9	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
2a2af861-51a5-4b5b-914f-79d5d0b71bdc	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
09524fcc-6430-4b53-81b8-f14d1e016c99	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	12.99	byn
01f05a30-d73c-43b6-99a2-1154648cc911	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
28f86682-eb41-4688-bc1d-a404ecdf5d79	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
1bd92e28-dd9c-4f47-bd11-bf223a60daf3	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
8f4ff1c6-82d1-49b5-8cbc-991305a81f7b	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
afcc3c6c-6c68-4cca-820f-7deacee2ee53	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
d6cbd7ab-78bc-4ae0-8557-39c4e3cde405	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
88c4cb34-aeab-4836-8df4-eb07a5cfdb92	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
5a710bee-1fa9-4432-8132-5c0cc7eb0acc	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
70c1fb0f-3810-4d1e-b502-241b48004ee4	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
4755be59-3397-4099-a119-f62b508de18b	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
ae78ba1c-12fd-40db-83ac-fd4d487f452f	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
0421d34f-8ce6-4204-8de4-8ad4a8e19b80	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	24.99	byn
1f468fb3-74f8-4ad1-8f4e-32bb7559ef87	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
7fd01069-37c3-4332-95a8-f9ab43a76e75	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
e1f4efdd-a2e4-4792-81a6-04bc8f7ec757	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
e559d97b-eb50-4372-8924-d9af690db9a7	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
eb81f83e-88fd-498b-ba18-fa7becd59e5b	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
23d794df-917b-4e25-8072-759bfa1b3503	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
8c8a898e-dfb2-492d-87b0-f52e92bb3e4d	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
d2e494ec-73e0-41d2-9612-4b931b7eb391	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
de682e24-b3eb-43b2-a944-b8026343d399	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
2c22567b-18ba-4511-88e2-32c846ead2f3	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	24.99	byn
1b4b240a-f1f0-4617-8b6e-77d2fd87fe9d	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	24.99	byn
8c364aa9-72de-4b5d-97d2-a23b4efcd97d	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	24.99	byn
b64d1113-f74c-41da-be82-4a7c843c02af	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	24.99	byn
4549210e-7f5e-4e25-a220-98fbcc237b25	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	24.99	byn
0260dfa8-a429-4ca0-80a1-83af04609031	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	24.99	byn
aac9e322-f7a5-4660-83f0-401ee56fdb1a	2023-06-14 10:48:58.029176	2023-06-14 10:48:58.029176	0.00	byn
0ae919d4-4ad7-4138-b609-dc209023c464	2023-06-14 10:48:58.029176	2023-06-14 10:48:58.029176	0.00	byn
c0ab9362-47da-4d4e-8ca0-4740a1422a84	2023-06-14 10:48:58.029176	2023-06-14 10:48:58.029176	0.00	byn
365b3253-8b28-42b0-8db4-9b7d5d01c743	2023-06-14 10:48:58.029176	2023-06-14 10:48:58.029176	0.00	byn
c340b02e-1e7d-4653-b0e4-ddd8b89aa0e7	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
0abe654e-0d19-424b-83f1-2cb9f2e6d6b0	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
34f9ed73-1171-4389-86e9-79f4df80908a	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
c238c63d-1aa7-4eff-97c0-6ae7ffda1606	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
2a99d29b-7f1b-4c03-8c99-1dd51555e417	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
d7a818a5-3555-4eb0-aa63-c0cf5494e797	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
35ef1b0b-2183-4a35-8d41-aa484d65651c	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
b0d46e3f-175b-4c8e-86f0-eac1d0e28616	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
22987785-ce28-4a87-aa79-d73ea5ef34bf	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
221c85e4-e264-4be9-983b-e240512f43a7	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	69.99	byn
982b7e3d-6e73-4ac7-81bb-a5d58b0f9eba	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
8b1a8d43-9579-4f1c-bb8f-e4daa5737aa5	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
468458c1-2cf9-4168-94ec-2af1a444481e	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
c218e4bd-fe1f-4b6f-850b-bee250914282	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
217cf3e6-7cd8-44a7-b5fe-30631786c909	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
76e33302-ca59-4c81-b2d8-304c84b87657	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
5cf9221f-1c86-4cd1-8705-065c36620ea5	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
f70f13fe-2eff-4d93-869b-7bdf35bc906b	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
be6c73c9-cd3a-4b59-9ad9-133cf0fed9bc	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
c33c06a8-a2e3-47cb-8ae8-c78029adbb89	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
ec0392f2-481d-4749-a9b2-6e081c66778f	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
29bffb72-dc43-4758-a9a1-d5e3fac101db	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
53da0a09-42d6-4248-8f41-af10a8d1f08c	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
3615e50d-b5c0-46f2-9127-bb95e184dee5	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
43ba2493-fb7a-47d2-94b3-393ad63f6198	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	69.99	byn
d40fc354-3620-4e32-92e9-fbda1e192bae	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
8b83ab71-a125-40d4-9863-a5dd1441bb27	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
eaab4920-8d9c-451d-abba-0b815cb96f3f	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
7ff4714b-87b5-4181-9d6d-d82143598044	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
32573edf-a5de-4e16-9920-1b9c602c7409	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
1e1025b9-aa23-4adf-88b5-547c805a02d0	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
7fc7fdeb-89b6-44fd-ad2a-37b3623da852	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
f5a8716c-107d-4b55-b1c8-ab6e485f3318	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
382512a8-bad3-40e9-b9b2-996063fad68b	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
cad96977-8b2c-4763-b27b-62d10c42f7d5	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
4011eae3-c6ff-425c-85fc-3b69b6b34f71	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
2b23254d-6ccf-48f3-9d39-b8f54f5cee49	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
64685517-9d26-4c82-b2c6-8f8259432a68	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
4d677495-2d2c-4cfe-808f-348c20211c37	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
bc905a21-52ad-4ec7-a49a-7f3c41ede16a	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
d1f18847-ec3b-4b53-8b5c-2ab0732a9b09	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
7b7720ae-e9b9-44bb-b052-4f1ed9f230cf	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
7afe49f6-1bad-48af-82fb-4636a4256cf7	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
0a61590e-fa28-47e3-bdfb-626c178fc942	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
ae91162e-7be9-40a9-8dd7-bb5b579cbc21	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	69.99	byn
bb086ab3-f67d-446e-9bce-f44d4bbbb0d9	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
75139da0-4869-478e-8670-d6e08b24a278	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
6887b906-df9e-4638-af58-3f0c391b383e	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
09522a44-20ab-4d5a-9a78-7d38a08d3a5a	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
7ab4cf55-af58-4826-802c-763446232c76	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
9f2aeef9-6a72-480e-83ca-6aaee7d02f94	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
e2fab39a-b7ac-47bf-a482-641988d8f8aa	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	69.99	byn
c7c6da2b-63d7-4442-8ec3-d606131721cc	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
0adf1416-b076-4c37-a202-76b1aab05d3b	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
7166d53e-daf7-499f-95fb-78880f49929b	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
357ea210-2e63-4623-91eb-b3b502cc98c6	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
0683c905-aa48-46c1-b18f-7eb37ea9b1e2	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
8c723f45-e4af-4c46-aba2-47fb37d7e6bd	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
fffdb4e3-9aec-4ec2-b133-82fa5e8f53ce	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
a333fbce-9f19-498a-8571-e59dd5d056e3	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
db04c9fc-efe5-4e49-938a-d939c4ab9659	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
fe7a6678-65a1-443e-8353-55f91d5f7cc0	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	49.99	byn
27c3ff93-2de9-42b2-89dd-cf94778f8b5d	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
8b345d6f-8420-408d-a615-8297a8461306	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
5898e9be-75a5-48d0-a8a0-e9e2cd6ad2b4	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
ade7c53e-a66d-4b9e-99b0-8ec2b2219d59	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
58bd77d5-06d7-4026-abaf-6b714071661d	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
27b11047-22ea-4fa1-80af-a9ced4e49591	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
4f844b76-9ef5-4d7c-a308-95f0714ea8a7	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
4b6565c7-8497-48ed-959b-0794455d6481	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	39.99	byn
d49d7324-454e-44fa-ae72-4bee441e44f9	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
9f32eee3-6a17-405c-9b12-8d73bda5ad72	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
46722437-1f83-4c84-bdea-e34f2c605104	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
0ed15362-05f9-439e-9467-ad1ff687a8d0	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
80720517-efb5-4ebe-9969-ecb7cdc0e6a2	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
b8a16561-41aa-4e9e-b898-16ded71cd9d6	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
5b5f4aae-82f7-4b3e-9015-bc51c4f9c3c7	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
69ed82d3-c48e-442b-ab41-976b1ca1d113	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
e029fefe-83be-4a75-a22d-1824544558f9	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
f214463f-1748-4c44-aa4b-12424fb4f3ef	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
758d6a6e-3540-47ba-a994-3684366b9044	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
8bd5a587-20a6-4891-92b8-d62c7bbf684a	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
4964c243-b19d-4a23-a36d-15dc851ce54a	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
da8b4089-e4dd-4a2a-a549-c41b2d0b65d3	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
ecb52d49-b58b-4ad8-99f6-60e91ba64937	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
77762c41-ac02-4432-a68f-4fa85c165d5f	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
d1ab5811-dfbc-4ca0-9b7c-e142bcc8488c	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
76d705d1-da16-4b1c-9dc6-66a53166e361	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
9c5be229-7f9a-48c1-adee-5b5f213a102d	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
853f6721-a913-46fe-8891-f7cd79fa4fba	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	39.99	byn
ad093395-b50b-401b-9e3f-9bd1f42fe563	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
e078f52a-5aaa-45cb-8ff8-63dd1d89409b	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
7d70862e-065f-4693-bfad-0d70daadc6fd	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
f9e83e4f-9656-4d4d-b237-fbccf403be86	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
435fc0e1-4239-48d9-9342-794b914e5a10	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
40e6972a-4b3e-4309-aea3-19f7dcb0f638	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
c5f10212-6e02-4721-8b4c-cdc490fb7ce0	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
d2a98c09-b81d-4ded-add0-afe9be24f8d4	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
15f908c0-635e-41b9-b04a-a189021b5f80	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
9019e6cf-0b75-4936-8016-9258f99374bb	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	49.99	byn
f1b47797-5baa-4f0f-a0ea-0eebd664a0c5	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
4db9b0a1-7f70-4459-a6fd-8f0cb0b0b1d4	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
b2d51722-d238-4d6b-b867-224716c11870	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
39fd7fc9-a4b5-4ed5-8b80-e9b73028cc8d	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
f8f74b69-02b6-4235-8663-8c3dfca9552c	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
3c269680-e521-4e56-b884-2c782629c09c	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
15d46bb1-07de-449a-a885-e5d822db8f17	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
a148f6fc-8e18-4700-aaf3-ad92482c2fad	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
d66cf70d-f7f1-4be6-8750-0c3e1c153c77	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
8d016dd2-6880-4710-9531-bd64cfe6f7e1	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
4ff3d13d-81c7-43bb-880c-59c2e7a9045a	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
6d510ac7-5b3c-4557-bb94-03b1807ec782	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	69.99	byn
cd574ef6-9b37-488f-a714-d673bc01ad55	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
8d8e474e-a603-47b3-89fa-bef0c7d65518	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
c0b08ed0-76ff-4205-b86d-6a966a60deb5	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
43a0918b-de3a-490c-addd-91201af6e29a	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
237fa1dc-c9db-484a-bb24-3de02fdc047f	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
995a934d-4c3d-4e31-93ae-d6b79883f45e	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
ff354de8-569b-471b-a754-89c39362ca28	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
c87f6e6d-9e1b-4228-b5e7-4a5e183a8be3	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	69.99	byn
398b5922-b4c7-45a7-9eee-ae26806c714a	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
da4cefac-5cfb-4c8d-9ff7-2e77cb30e51e	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
65089464-a880-4d9a-a9f3-5d1712227330	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
1264cb1c-bcac-4ff2-a369-ba22ff06e51f	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
acbdf6d0-40aa-4d80-9074-19a956e6bd63	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
a46da767-c549-44e2-9c6a-7beba7fd0410	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
04a81e7d-28b1-4e13-9ee4-391b8a155568	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
22191a8a-c5df-4303-a32d-b5514868c009	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
4840123b-2a8e-49e1-92a5-fd1564c9885e	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
00aeffef-d6b8-490f-8aa2-53a5220e0317	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
c1a5cf7a-7ca0-4713-a88a-90a8f7424844	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
f9105235-6b3c-45bb-9585-0a00897a53f1	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	59.99	byn
d7953a10-b7ad-454b-ad79-dcbf513bdaf5	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
0c761f77-cf9d-47f4-96fb-dc96741df9fb	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
74828d5d-94b6-436c-b769-4d6e2bf7ac57	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
56cc5920-16b0-4da9-9c32-77f8a4d22be8	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
8270391c-ee7b-4ae3-811d-97f6efdee099	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
4ae392e8-487a-4f63-bf7d-4c006ab35e36	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
16f1c8e2-6288-4b2a-92c9-7da1eeb2955d	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
19c9f87e-d83b-465f-a406-3e712ef350e3	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
69b835ef-45d5-450d-bf94-414b518a82b3	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
6981e322-d2a8-4bd8-9fca-f65ec003816b	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
6568effd-594d-42f2-862e-20c04f0d4a32	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
3ea741a6-2960-441a-b189-60ff1ae33670	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	89.99	byn
a111dd45-443d-458e-bea1-912754c94241	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
9d5cb03b-6d4f-4391-9097-029a919c308c	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
2f34e531-c953-4998-96e9-1c3bcb7861d8	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
24030fb9-be72-4daa-975d-8c0b6c4a9c57	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
1c9c31df-85f6-4404-b172-7b357fadb20b	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
abb829b1-8c48-4e45-981b-92de96fcf5a0	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
cd9bf1b9-70e0-4591-bcd9-b7594bb1e467	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
68ac0e1a-c073-415e-a6b1-c88f7209da1a	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
98fbc60f-7b09-416e-b4f4-dfea1cd169b1	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
11d52cc9-46cb-42e8-a071-4f04ae02649e	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	79.99	byn
2e40ad31-029b-48b7-9e9f-9a74eb7f0d9c	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
50c51c3e-3cb1-425f-8141-949cd7c17a4c	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
be77f54f-5fd3-4bb3-8fb1-833212244438	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
b3677e47-cc9f-4f75-8357-6fe92a264bcd	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
01e8f3bc-1fc7-43b7-b1e3-4c0b419e0fb6	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
e353c9ab-a18e-43df-afaf-60b448eec4be	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
7f2016b7-deed-4c5f-9eaf-c47582b740d5	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
d1d097fa-d41f-46c1-af63-13888623859a	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
0e13469e-c905-436c-8411-44190a8d3a78	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
5e69232a-5885-4ff5-bc18-6efd111f4aee	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
caab0baa-5451-477f-af65-691debb6acc6	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
47705b58-edfd-4adb-852a-999d8299feff	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	55.99	byn
1280da57-5e2e-474f-899f-fdf3a4f06554	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
8a8a9ba0-05db-4a43-a786-20a625519eba	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
698dd32b-e8ee-45ed-b6c3-5cb8c2b8bbc6	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
1a00bbb1-e8db-4de1-804f-1e78d117ff62	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
a76ac8b0-232a-4d30-8410-f7660afe4b2e	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
99dcd033-4474-4c17-a425-99018c1fb558	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
1cc6cbc5-7e94-4a9d-b6a3-f47503f4d0b1	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
c7dfa68e-4cb3-4eb6-b5b7-90beab8209e7	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
4a1bc02f-db22-4289-abf2-3c91f1fba3f1	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
74922597-314e-4dbb-bc36-2f5f8260c988	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
168de0f1-8d0c-4b67-b056-7d21f1620365	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
de1f6138-71f9-470a-8b96-f3a28c535758	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	39.99	byn
35054a67-263f-479d-9bb7-bf151e7368cf	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
941ad9c6-075d-4dc5-aedc-c6ce3087fed1	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
25f3e1b6-abf6-4453-9914-7165002ebc9e	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
edb3368a-d747-460b-83c8-85c54b18ef31	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
819617ad-714e-402c-b4dc-f7e928bd9313	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
e3c3a768-0925-4333-bce9-6f69770db796	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
02590925-3a85-496a-8517-607d32deb1ce	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
dae77295-98db-416a-8fc4-ae54d0a8ff0e	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
3755cf77-43d7-4bb9-89f7-bc885546e5e2	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
c1ca93e6-3b26-431b-a724-b9575717b4dd	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
22d2d92c-2cab-4110-a979-b5a34b0271b0	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
ba578ee3-44df-4845-922b-1e43e14665ab	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	49.99	byn
84cbc8bc-89b8-4635-bdbd-37fc4af1064e	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
23587e26-37a3-477f-8967-76099b823bea	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
2db0cdcd-372a-495a-b0ca-c5fff27573fa	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
85a44cf6-649f-4389-896a-caaff0cbcdc5	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
cad95f78-3e1f-406b-b4ca-52d3d0292941	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
70fac9eb-bdb1-4c73-8e5c-408e3ae46f70	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
3f968612-3709-4d25-8e4f-64aee8ca7af8	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
0e7463a1-4ae1-461b-ad3c-4f1113e6bc22	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
6d256598-f745-4965-be1d-f42995c35ac0	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
ac755fdd-dedb-46ad-80b5-8b75e8e6237a	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
74140477-930c-4001-a10a-a3e315fae284	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
16a2edc5-555a-424f-9185-abfa6af097c4	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	39.99	byn
0e731e20-f45d-4ee9-af2a-44dd45b0c54c	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
c33c6470-2921-44f4-b2bd-b605b2093bee	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
b2a48d74-d2ae-41f6-bef8-67daf1756147	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
3b6bdb43-0f56-44cd-b80d-cd900600336d	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
b97d9b84-9a31-4d1d-846e-dec2cad03ecc	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
60c275be-d35b-419f-8bc7-eaac76d7a0bd	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
ed8a9231-0fed-4aa0-9b52-939f4642f0f6	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
9a3a3df7-ff08-4003-bf72-63dee7bca0f2	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
90a6c415-efc4-421d-8a4d-2648a26adf4e	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
16d7d7af-2e92-4a9c-b633-23e402c73425	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	49.99	byn
6a456e2e-9d53-46b7-a9ff-16a61d254bca	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
7449cd74-0d0e-425e-b0fc-fd69a7a877ca	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
8151443c-3a9d-4550-8e7c-bcfceafae32a	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
3b1d99e5-2b12-481a-b34a-aef4680808c2	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
d7600a1b-21bc-4b0d-a909-70901a057a1a	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
1e35ffb7-4629-4d5d-bcc4-f6ce4baded2a	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
218a580e-8798-4162-b640-45988d02faf4	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
bd1a4e2b-2800-409f-9fb0-757f90d23369	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
62a0a9e2-0e68-43c5-b25b-d375d4524753	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
7d4396c6-8034-45e8-b6cb-877483eca8b4	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	59.99	byn
be07ddc2-4381-4c4c-8115-1118246cd98f	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
8f49911b-a41e-4c2f-a47b-f457ebc821ee	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
d264f7e4-a891-41c9-a0ee-d7be6567aab6	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
aa226c4e-93b9-4134-afcb-6d47b8510352	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
a0c9ce2f-c82e-400b-ad07-c51c27e01d8e	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
d6ff1fd6-064b-4df2-a416-60e718ea0d62	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
a9e61819-de62-4cf1-b0ae-bcfb71cc0f75	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
df348605-9011-41b3-b0d3-5cafdbe5053c	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
736e8f39-7c40-49c1-ba23-a852f3f418f5	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
f6444e1c-eaba-4271-876f-abe8e8b6f8b1	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	59.99	byn
433abab9-7395-453b-82e5-2ba3e2d286b8	2023-06-14 11:24:02.478589	2023-06-14 11:24:02.478589	0.00	byn
c25def1e-1fb6-4e82-8591-dec021d9fc9a	2023-06-14 11:24:02.478589	2023-06-14 11:24:02.478589	0.00	byn
9b9976d0-1aac-4378-8d80-a2c19385d3c1	2023-06-14 11:24:02.478589	2023-06-14 11:24:02.478589	0.00	byn
0698614d-c097-4e92-aa94-05da98d4cc53	2023-06-14 11:24:02.478589	2023-06-14 11:24:02.478589	0.00	byn
6a922ecc-92b2-4242-b1e9-7ccf57a9dd06	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
35742f45-067a-452a-a160-b7114d411838	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
1f25d1f6-2b26-449b-bfa3-c59496fa3b73	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
cce5b140-c1e7-4a32-a614-b73f6ba6f043	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
2823b6ac-957d-41f6-8eeb-082f9953fe04	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
1048244b-17c9-45fa-ba8e-052aefd5cf9d	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
352ced05-7e59-4c9a-9f46-0c6db5a747e8	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
d5293024-4e6c-499e-bbaa-ab562671a524	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	49.05	byn
0a568033-8ccf-422e-ba58-cceef7dd38a3	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
cbb8052d-4415-4dff-8150-19e8de7772a4	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
f83bd8d9-6cf4-47bf-aa9d-06703949c437	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
1d23ceee-a31b-48db-bde7-b820d4dc1722	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
77519a90-b82c-470e-99a9-eb8877dad0cf	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
96e5ec03-ebfa-468b-a40a-1af201caf45c	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
a274951d-2875-46c9-a9a8-11a82d9e3e27	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
730bd35c-f0b8-418f-8208-5edf005b2c31	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
a2c09357-502a-4f6a-9c52-8eea373c9a44	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
87775e64-1cef-4c69-ad10-d21db08609e7	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	49.05	byn
0acf7bc9-ab34-4a91-83ed-9da703d3c894	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
98b2361d-f45e-4bbf-a0d5-03999b7327f9	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
27201354-4d0e-487d-8a04-cbbbcc50cd52	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
464707b1-bfb4-4de3-a3d2-0fcfb9e2f73a	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
75199d36-057b-4445-9b55-508cc75e468b	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
6cb9c348-d66c-4ca7-8b19-73875022f017	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
abd83f4c-cecf-4950-bdb2-4730e2ee5069	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
aaff39ee-dca3-4511-b677-476a5ccb02ee	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
2b178c0d-5240-4db1-99f7-0629a6764725	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
532699b7-87fb-4d71-9ea0-a1c16d2eaa88	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
58fdc22d-d241-47bb-b92b-898f2fe2a3bc	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
daf01b0c-19e8-4cc6-a2f4-7f478a8355eb	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
be4d8243-37e1-40df-b5b9-5131fe9cbbd9	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
a36587a0-eb0c-46c3-a310-59614bef0c68	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
a57d166f-a0f4-4650-a4d3-9ea3625d6395	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	26.61	byn
d8926c8b-8dfe-45a6-92e0-bee9d56b5d6c	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
ee7a2363-c53f-4726-97f4-cdc3370eefab	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
f8e97f84-ebc3-4003-bfe4-24ea8c5f756b	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
c8b0b3b4-58c2-4877-8a6f-7ebe96fbfb3e	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
2c7f150a-1087-474c-a1b1-f3026ea62a0e	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
cfa12e35-89a3-49a7-947a-cd0a839a74f2	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
bdfee1e3-f259-4b8e-a648-5761dd85bd6b	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
d65f1f98-720d-410a-9c7e-8587abf8d2fb	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	49.05	byn
8ccdb33b-d8b7-4137-a099-063965e418a2	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
2c8b4e78-eeb4-4766-ae64-4bc5687b53ae	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
64b7f614-3ec7-468e-a153-2ec9424a4bb0	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
19771e48-6231-4438-957d-91e9d8a5194a	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
7c70a83b-4d31-4a43-bf60-238c7cd75bc0	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
f7c37b43-2238-488f-ac85-0d3bd8568e62	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
28962e64-4af8-416d-9b22-7598b0c0341f	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
319aa159-25c5-424d-a14f-d8389a23126c	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
017acf0b-181d-4632-9e63-6bd8faaf7fb0	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
705be3e8-e2d5-40b5-b889-9865916dc630	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
6037401e-34ba-485a-9097-1da71538da42	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
e186cc35-12c8-48d6-b0f6-c0c491f70518	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	45.25	byn
6601fc31-b4fb-429f-851c-5aeeb66efc15	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
be3d628b-07f6-458d-b41b-808233ecb5e4	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
bc8fcddb-0b81-4b3e-92e6-2374d839a8b1	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
0582346a-8557-4ace-b956-7049dfa5ca97	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
05657ee3-4361-4737-82b5-22ab84c7f62f	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
25ca3f3c-d23a-46cb-bf02-9eced9791a64	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
24a1dc34-040c-4c55-8006-2ef122237fbf	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
5e66330a-30dc-4c58-8194-7b631bb49810	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	38.02	byn
3911ec9d-b1c0-4cd1-b2cb-6cca25f21950	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
2c0e5a52-35fb-42d6-8de2-8d01c4e1364f	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
23507a69-6961-49fa-9b09-6a24f2e65cf2	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
542032ed-2f04-4933-ae9d-24f19975f665	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
323fe4e2-fb00-4087-835d-5009b73dbaf4	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
2da38555-2a4e-40d7-9d27-efbe2acbafc1	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
4aba9e63-74ff-470d-88d4-6cb5619b5e21	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
85bce2e7-f0d3-4121-ad84-a48df35b1ee0	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
24be3f9b-5e47-46d4-982a-1a2a958e24fd	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
164b17c9-16f0-4f0d-bb12-81043bc2eadd	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
aa83b4c9-c4c7-467d-ab1a-9431722592fc	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
bc90c6bc-e383-46c7-9d1f-5917a33aff8d	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
0a3bf174-dd4e-4f27-a734-126c15725e0e	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
f7a6682f-bfd0-4856-9518-15f7c2ae0f97	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
ba1f9662-06ac-4cb6-adc2-8a19aa22ac41	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
a37d871b-5c21-44c1-bf17-f765a7010f90	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
305e97ac-8ac0-404b-a642-19e12c2c77a6	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
97b770a1-4fa0-46c9-a017-331b353cf0ea	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
337ab809-eadc-415a-a208-4062d2e5233e	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
da2da711-700f-46c1-ba3a-c97b41856100	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
7d58c696-9376-4768-b00c-82ecfe85b45e	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
ba1e94ca-e3f9-4226-8350-589eecef9ab4	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
f600014c-38eb-4c71-8570-20461e7dadfd	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
839aee10-6e8e-4508-96f6-de595061b99c	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	13.68	byn
1a37b5c3-e313-4d23-b1a7-2a3fc19e7d89	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
a067ec40-e332-4b69-810b-b2d164d400e2	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
3d300c5b-6327-49b9-9614-2936beb4649b	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
69f6b64b-b80a-4767-be2a-d4a11fea9dab	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
c7a841af-a7f6-4a61-a8ed-2b9b322cf5a7	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
fcee8a73-1c10-4a56-b7e8-8c35bfd9edfd	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
2ce9b8e7-1dcf-44f9-a93c-e35ff45cdafd	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
c5e8646a-1a5c-44f1-ae87-0cd9045e1ed9	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
bb010df9-b43d-4772-93f0-cb00edb0f5f7	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
14ff1730-74ff-4207-9492-a3822434ca82	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
4f9ad93a-2db0-4c9e-965d-89bfa305a18a	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
319bacab-e9f4-4030-aac0-31904cac6044	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
4f0b5648-fc6f-4add-8d79-bf5d3679c68d	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
123d3241-b58a-4cfd-a285-e6e37889d9cd	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
4180f07d-255e-411b-bf91-15f4702c5227	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
55a38746-4e81-4b0d-8603-93587089c1f3	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
2d02e2a1-0b5a-4794-b297-661cc9b405a3	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
c3af230d-2474-4ffb-8d2a-f882902dbc53	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	13.68	byn
a305ca6a-d145-4ecc-a2b1-15b7ddc1ebad	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
c0b8268a-b238-411e-8e95-e69f455107c8	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
af3fb63b-f2ac-42d0-91e7-2696309eee5e	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
e6363518-4631-4496-897e-49618a704304	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
5a2d7aff-160b-4255-afff-4a41a8b6d281	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
3de96f85-21f3-44a5-9e82-462f5e8a3c7c	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
561cfff0-2212-411c-8756-add9f1429603	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
761d092d-a368-4e9b-9ff1-0da750b14fe3	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
b6eefb8c-1951-4b09-9c82-5a4002b06b6c	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
f70ea57c-6d0a-49df-bbdc-5d6f009c8b50	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
e9d482e3-de72-4722-a977-15e3bbcb9487	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
a7df9e37-ca06-4f1d-8e2e-2d1121ec4f35	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
d919cec7-c8b8-4600-98ec-2c1e2900fa16	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
6e8ac359-7620-4582-b884-728337b56809	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
95c307f1-a1e1-45dc-a7fb-49b69b0edb8e	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
51cd6ebf-3501-464d-857c-478c8a1949f9	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
bc0629ae-940b-48c5-8fea-35d8b7a079d3	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
12735398-9ebf-4710-b0cd-26b51c300be7	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
32353683-03f5-491e-be5c-e30f6d1dd561	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
4679da16-e3c7-45d8-94cf-e6b44e77a9a5	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
9af14d3b-8850-4db3-afac-edfa10a5fe34	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
34fdb3c7-1fcf-4259-a62c-7c210276ef08	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
490f0c6f-de43-488f-979b-3237ecfd3bb2	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
bda05b6f-ac1b-4c83-b16e-61048f193aec	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	17.49	byn
6f98f6df-6922-44bb-8af1-681ff6602ba6	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
044d3a1d-f450-4a99-bdb9-528ea710b577	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
1aa8a526-c773-4549-b5db-a0ae094c7470	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
ae189348-4fa3-4b76-a26d-f28f8b2c392e	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
034593e8-6a58-4b7e-af87-2e6e9c06dced	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
0b93fc55-7742-4145-85f3-f9d77967ece2	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
31403aa1-c474-4559-8878-c2d8a1185e02	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
1b0f4072-2732-4066-ab61-f547613c1ee9	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
3beac0a0-6435-4356-b086-5152b642d4ca	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
1b98f318-a319-440a-a424-4134c0e6dbb1	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	49.90	byn
589b9df1-bd33-4e07-967d-6593571acc2f	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
7e1d4e14-ef2b-4dfd-b9f4-61279e798601	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
1b2c8652-8f2a-4131-95f1-b8fcf77f1643	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
975201cd-10e3-4bef-8f03-564086c6a7f9	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
ff7caaa9-e376-4f35-9e49-3b3469b90429	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
a21afe09-07cf-4f41-a8ba-61870ef03bef	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
55ab512f-3978-4799-bf36-ea53c40fb129	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
544d11ba-b03b-43c8-8a08-a6d69bad2858	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
c91006f6-81b1-4ad7-b79a-9abbdecca068	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
1e1e770f-822c-4a8e-982d-7baecd059c6c	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
fd827f5d-fe7e-4741-b714-d95c16eff325	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
f9d1ca04-9465-4af1-ad74-9a705f543b5e	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	45.90	byn
8b727a07-f552-4264-8204-0aae845c6490	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
8ae0f950-ff4f-40b8-bab0-51237fa51af5	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
6e249123-0577-4bca-a703-c324fb355ce1	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
85c29219-6d47-4773-9b5d-a17c0aa10ad0	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
8b794418-ccc4-4181-8fb6-3f1b2f05dc82	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
29d5dc6e-ec0a-4197-be80-09c65c4ae6b5	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
85672dee-7b35-4cb1-8b5f-2269f877ae28	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
c3e6a3ab-4797-446f-a2c7-c48d2157f6bd	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
00afa5a9-7c5e-4747-8892-2cbd1caec76a	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
72f3a40b-80d1-40c4-b8a3-b54c015a9b35	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	29.90	byn
88b3c783-a4a2-4ca3-985e-3996be650f08	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
e02f0192-167a-4799-b44b-d9de0cfe9542	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
c490a5f5-5809-4c76-8ed1-c719129f169c	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
7ca00fd8-6707-4e76-9513-6c115e72b9d3	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
3508bf4a-2287-4aa4-899c-b820883794fe	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
10f163d1-ca82-45b1-b2ec-015f14ce5bf3	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
d6561e82-d6b2-404e-9324-1a4f9c3aac13	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
2fab3ea8-00fb-4fd8-bf3f-a24bf876597f	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
a422a7d0-01dc-47b4-bd1b-6feea36da84c	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
69a771f2-044e-46c3-8f43-cc92e930539d	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	35.90	byn
17f4d21a-f00e-4b15-a7dc-1f68251c5397	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
0f32d833-109e-42cb-9464-89a8c60185c5	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
7863a336-b0e5-400e-a4e1-3605f8d535c0	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
5bcf02dd-cdab-4351-8e01-590c7fb73d03	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
796799df-ceba-4b56-a3b3-242e104b4043	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
4be22d99-5b08-45b3-8518-027a6aeeec34	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
7338381b-8b03-4c4e-bc3c-4911523738e3	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
aa98d5ff-9db4-47a4-be3a-4d06d88060b4	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
322b7d4d-5b8b-41bf-b7eb-a3b99dd1dd1e	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
58753fff-a58d-42d8-9f62-bf219daf4eb9	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
cdd385a8-9e3e-4d6e-b8d1-8abda87a3045	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
06eecefa-5c2f-4eea-8de5-eb221523c4b9	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
3487dd71-3799-4cfe-a969-796dcb4fafa3	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
dd3af16b-1300-4cf2-8352-7a52fd9b59af	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
8830e8be-3072-4981-8805-7b80037f5e17	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	25.90	byn
71c2fd8c-e7d4-41c4-85d7-8aaa91b81416	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	39.90	byn
ce37d1db-767c-49d6-bdde-b23986d14e4c	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	39.90	byn
0c64a254-1925-4eca-a9d5-4f5c49947705	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	39.90	byn
17cf54c3-734a-4c55-9869-510836208502	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	39.90	byn
3195d0da-7f80-4921-9e45-51c84c4ef75b	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	39.90	byn
df7b6c95-b95a-4251-b2b0-308583c4b8df	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
9aaae642-61c8-47b7-9b44-a29c0c75b865	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
446bc773-5779-4c5d-9b20-a96dc412a324	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
b18b3273-13d7-4f65-b654-73eaf547ed20	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
de11b961-c067-4b15-ab8c-880472d3a28e	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
9d90ed89-c777-44dc-92fc-94d7da54afb9	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
bac63c40-ee36-4ab2-ad8f-4ef19fbead4e	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
87c4d42f-67eb-4197-a8c6-2e20fca2f223	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
70601909-e28e-4d3d-8e51-93860286c439	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
f8a3be92-1746-41b8-8023-80058323d52f	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
ccf90fef-2dc7-4a10-ab86-e0d5465388f6	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
fa2f1fdd-016c-425c-8289-96a1f2681fe3	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
81dcaba7-f156-463b-bd2f-f8fe11318d0f	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
76e87266-d94b-4341-8bf7-5f2727ebbc31	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
e1e13c90-e80c-4862-b935-62bf8f14be46	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
8bf5f6f4-fc04-4313-915d-5c06b1203b83	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
c308675b-4682-4a11-b86c-3516655a40ef	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
5b47cce4-068b-458b-a6ee-9174c7ccaa1a	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
b6980410-3455-411f-a87d-4a69360e737b	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
a45282f8-4ce1-442b-8bf9-1e77a9c8bfaf	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
209b283e-f9f0-4212-801e-24e402d8fcf7	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
24bc8010-d3cf-4086-9aa6-2a23176459cc	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
1f7f599f-7be4-4e65-87af-b1c2d7667f33	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
fc06fcc0-a93f-4b4d-9559-f1f9fbadd057	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
f69e1187-b25d-44ce-bac7-bf7a5f2fce46	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	25.90	byn
d03061f6-7f90-4185-a1aa-321de0228310	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
7cff4ffd-97ad-4a10-9274-d4b31e0cbbf2	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
189d7641-5af3-412b-9626-94de26e86d66	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
8c47e27d-b61a-4337-8b58-0119b0258401	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
65e0a727-bf39-4d16-8bd8-fe8a5a1fa72c	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
c772028a-790a-4a31-92b4-c863d29a6f7b	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
0cf831d8-b050-4ad2-a60d-959aadc4a157	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
b6e37341-cb59-4f73-9d7c-3924a8709075	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
dd5df489-c7e7-44ab-b9a6-4e0a522e075e	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
878b6f24-84eb-454d-9da6-f7f932aae0fe	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
fcb63416-7881-4fe8-a828-683444a0ef4a	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
78329c48-d6e3-4b9c-9e4d-0f1e02ccd435	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
90dd151a-1d98-46da-8c66-9b298e85b8bb	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
fbf1db5d-cd0b-47f5-93f7-ef8b181befe0	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
6dd0230f-24e4-4b23-b02e-f573e52939e6	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
713126ee-ad8d-45c6-8bd1-a2d519ea974b	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
ef2b02d8-a61a-4ee7-a0fd-aff56df0dedf	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
b5475afe-1ee7-4c33-8396-65cb476f3c0b	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
9af97315-5058-48e7-9eae-370f292294cd	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
d77dfc54-b147-4e3c-b091-8e21f4e4b51a	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	29.90	byn
83e100d5-f255-4373-bab8-219cbcecda1b	2023-06-14 11:49:13.662179	2023-06-14 11:49:13.662179	0.00	byn
b3749535-8147-4f1b-9690-861a0bc8f150	2023-06-14 11:49:13.662179	2023-06-14 11:49:13.662179	0.00	byn
91a159d8-04f9-488c-a12c-5d9bcfb198db	2023-06-14 11:49:13.662179	2023-06-14 11:49:13.662179	0.00	byn
41e1e4b3-c960-4aab-90ce-ca6009dc3e0b	2023-06-14 11:49:13.662179	2023-06-14 11:49:13.662179	0.00	byn
e0a45bb4-0792-4268-9b25-acd49506ca76	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	75.00	byn
6c5bf045-7987-4430-9349-419e4fccf5e6	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	75.00	byn
1aaf2cb4-5ab1-450b-93d1-3e9303a61db7	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	75.00	byn
3e202cde-1319-4d2d-ae59-b408e9624056	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	75.00	byn
61b35c23-3065-4954-9d6a-2af1b6a528d0	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	85.00	byn
d437e519-a907-4e7b-b459-9fb00930f648	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	85.00	byn
dbc78f42-8bdb-462a-9e64-56d7aa46e250	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	85.00	byn
967acd8b-5465-4a56-9d93-c5339a43edd6	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	85.00	byn
a3e340dc-5710-4705-a475-778533ed0ee6	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
3186c213-f01f-4346-a93c-d05afb6e9882	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
821b5201-570f-4731-ae14-a6cf64377889	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
41a19eff-22e8-4ea1-ac06-14146bff2510	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
84554ac9-4c51-4ee1-8719-3df5f1f15e6a	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
7447e4b9-f499-4243-9d5e-b2982d2d34cd	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
739d4911-343e-40ff-9fed-497afe8ff4b9	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
fa3d0c1d-75ca-4aca-ad7c-8893e78c4ec0	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	92.50	byn
28ce45ef-a598-416e-a08c-3b1e66a93bbc	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
75ea29f5-e08e-4233-85b2-9921aa6a308b	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
442d2942-6367-4b4a-b478-170cedcd7fb6	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
874213ef-945a-4537-b41d-17e8b9d7bfe3	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
990e6407-46ad-45d9-8189-c6053b094daa	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
db54560d-269c-4194-8534-c290c0dd9432	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
f4a53b3d-ab83-47ac-a5fd-4b7d3d1e2522	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
f9f08694-71a8-47af-b340-c50fcdb11e89	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
646c6e6b-6800-4f83-a5d0-5134160eefd1	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
2c84f592-abe5-48e9-abef-692dd36071a6	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	65.90	byn
06cda03b-4efb-44c2-98c3-d8bc8fc2e6e5	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
5492e5ea-0f7b-49bf-b521-acafbb3e709c	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
3f5ce2eb-dbde-4334-881b-75f7446ab7b7	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
dca1c142-1e11-40ac-b634-7a0f4fde5beb	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
42ed594d-6e2a-49ab-8aed-a727ae1cf83b	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
7920e24f-45c5-40e2-9d65-06e3b479d50a	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
7b80f9da-ed3b-4fcc-bec9-6e830904f03d	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
90813ccd-b10f-4189-bd57-8ba28426b56b	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
3db059af-c397-4ee5-a85f-1f96a9f8a010	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
e0cac4e6-d649-4cde-844a-f8a1a6d82c70	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
e24ebb23-866a-446f-bdb9-b82968db3f6f	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
3e449711-46f9-4e5d-9e8a-d1ff85429557	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
e7b94225-a92b-4013-8f30-bbd6597ac862	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
26ecd7a9-e100-4f1c-a169-4a59c62df703	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
75f6f371-beb2-4b7a-8688-b5c93f0b5750	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	25.00	byn
1a585b09-c29c-4bf3-9e67-70c808033936	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
4e27a17c-dfe2-41c5-b0bb-85327fb20564	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
6c80f03f-b817-4270-9676-ce2a5c0190fc	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
e9d5a84c-3341-488b-8a15-ad7841c21e90	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
25a44fb2-1a49-44ce-9571-060552e6de50	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
869d49df-0b72-4b5d-bb0f-172b7688e8f7	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	79.00	byn
d55f094d-b557-4b01-88fd-4a15bfb21823	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	42.50	byn
cbf4f8f0-8024-4bf9-aae1-fafba5b8c31b	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	42.50	byn
29be723d-746c-4e51-8938-7efa3e239a1d	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	42.50	byn
c1894d73-1352-434a-9220-234926ef14f9	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	42.50	byn
2253dc40-64f7-4364-adec-8bbaa74e921b	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	42.50	byn
0298500e-1b5e-4667-b4ce-d7b7bb7fc10b	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
bbb3943d-c3f0-4831-a5e7-3739f65b745e	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
7d8771fb-dc74-418d-ad1a-2daeeeaee3c0	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
fbfa5229-4f23-46e2-bde8-1e1d11bc7bb7	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
286c3fc1-8dec-4aa5-ad1a-58f1572f15dd	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
d0baaab7-ea51-43e4-8d7f-f042e22e3b7c	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
0b6d26e0-0651-4253-89a4-1a24532869e7	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
c85a1870-183c-41ab-ad0b-0f139bcb7f56	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
9783eff4-3590-46fd-bc64-8d5e371ebb5d	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
8aaef08b-c898-4671-a335-bfcb3c9abcc6	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
ff709dd9-b4cf-4ca6-8418-73a9f26e4792	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
09dc4ce6-7576-493b-9f66-ccd413b46384	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
bc9928c9-9625-4791-900f-92abe1ad0fe3	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
476bfa42-5d30-4d2f-b65a-db20fee22aa0	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
536afb36-3ea6-4ffa-8719-309aa1bf58d2	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
350b8c5d-4183-4c5d-8999-49e5477c9f3b	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
0d48c182-429e-41a4-91e6-4b35354fb686	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
9e938c49-f316-4c93-b4d5-2abdf256dc16	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
37e320ac-7815-4ec8-9e52-34c17feae496	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
464b7832-af4c-4b51-9637-f92d290457d9	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	25.00	byn
1e41f0be-9741-4f84-b048-fc2d18ad0c9a	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
7f4c4a32-732f-4022-b6b5-abff8547cf68	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
5a1880df-6fda-4422-9dba-4aa3c7114056	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
6f440614-dcba-4983-8d92-2c11b85ad865	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
17190684-fa53-400f-87c0-d6fc536058d8	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
030a3a99-4f70-4026-bc37-551419acac05	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
c60bd1ff-5022-4ed3-8540-0afe69dfef24	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
9968fe7e-1359-4c46-b497-c86f069429c1	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
920b16f6-0e9c-45ca-a11e-c1e1ce9c7635	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
a2d304bb-c6f5-40ee-bcdf-159735bd03ed	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
16b2f05b-4ae7-4fdc-aaa6-922480c9e8a6	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
df9ee079-b556-4549-9e71-b4930e38888e	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
9bf3220a-301e-4b69-bc9d-cf5dbec82e80	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
c3332799-51ca-420e-96a5-4a56231dca7f	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
c16c637b-6623-4dcb-b160-da4f8d5d1bd7	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	23.00	byn
0270cf64-f806-4978-a435-27451df1977e	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
16d6a139-d109-4bd9-b04a-0a34e837ab91	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
825274c0-1cd0-4506-847b-a85b66ca1b0a	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
cd36a809-eef7-492e-a07c-13194532113d	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
d476861d-72f9-4933-8d63-9dfd7ded43c7	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
24598c1d-165c-4905-9f16-179a4b7b6f2b	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
fd86bcb1-6b2f-4c9a-a6e9-f9dc140b7a28	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
37e57553-1569-4c5a-8f2e-2c22fc8980db	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
23b6fcfb-b810-407f-b50b-c872964c9e7e	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
40e383e1-b149-495b-b53a-a5c7719da544	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	37.50	byn
579999a0-0c7a-4f11-98ac-9b776a7965f7	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	52.50	byn
0fb3d069-23f5-40f2-97e8-ecd31d99ffdd	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	52.50	byn
14349601-150e-4a4c-af96-4996a788f506	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	52.50	byn
a9effe87-7a99-4036-ba5a-6586aec9ad58	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	52.50	byn
73a13040-a498-4afa-8c60-f234b36ed0e0	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	52.50	byn
32ea7d41-024d-4dab-b5ae-1f79dfe984b2	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	27.50	byn
3b2e842e-0501-4293-b260-87823e1022a1	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	27.50	byn
c7af3a74-bcef-4fcb-b01a-aef9efbefd68	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	27.50	byn
b9386662-8f0e-4a05-bf5d-98e77faf08fe	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	27.50	byn
b9eb6363-c8d6-421d-8a78-54b25309fde3	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	27.50	byn
d4b7ddbf-bc31-4ef4-bb38-43f3447c1f5b	2023-06-14 13:14:39.501419	2023-06-14 13:14:39.501419	0.00	byn
5f261fb1-5c2d-4daa-bc46-563375448cbc	2023-06-14 13:14:39.501419	2023-06-14 13:14:39.501419	0.00	byn
a5f3deed-b143-4108-bf27-ecedf79d8f49	2023-06-14 13:14:39.501419	2023-06-14 13:14:39.501419	0.00	byn
b44be66c-58f7-4f13-87e8-2b15fd068059	2023-06-14 13:14:39.501419	2023-06-14 13:14:39.501419	0.00	byn
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, created_at, updated_at, title, description, category_id, brand_id) FROM stdin;
9f6bea20-bbd2-43db-bc89-4e2b32fae406	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	Oversized Fit Cotton hoodie	Blank Staples is a timeless collection of high-quality, minimalistic streetwear. This sweatshirt hoodie is made from heavy, 460 GSM cotton fabric with oversized fit for comfort and a relaxed silhouette. Double-layered, drawstring hood, kangaroo pocket, heavily dropped shoulders, and long sleeves. Ribbing at cuffs and hem. Style with other pieces from the collection for a pared back, on-trend look.	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	e8ef7e01-40d9-4738-b0df-5857ed93c32b
64ba5389-494f-45a0-abb9-691e3d6ce763	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	Relaxed Fit Hooded Jacket	Sweatshirt jacket with a jersey-lined drawstring hood. Zipper at front, diagonal welt side pockets, and ribbing at cuffs and hem. Soft, brushed inside.\n	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	e8ef7e01-40d9-4738-b0df-5857ed93c32b
611e9037-7498-4696-8688-8b6997816a74	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	Relaxed Fit Sweatshirt	H&M Essentials. No. 5: The Sweatshirt. Relaxed-fit sweatshirt in cotton-blend fabric with soft, brushed inside. Dropped shoulders and ribbing at neck, cuffs, and hem.	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	e8ef7e01-40d9-4738-b0df-5857ed93c32b
840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	Oversized Fit Corduroy Overshirt	Oversized overshirt in soft cotton corduroy. Turn-down collar, classic button placket, and yoke at back. Open chest pocket, long sleeves, and cuffs with button and a sleeve placket with link button. Gently rounded hem.	0899a897-620c-446f-88b7-1cde3ed896fd	e8ef7e01-40d9-4738-b0df-5857ed93c32b
1e43d324-bdec-4247-acff-eea4af35beff	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	Patterned Resort Shirt	Short-sleeved shirt in woven viscose fabric with a printed pattern. Resort collar, buttons without placket, and straight-cut hem. Relaxed Fit – a straight-cut fit with good room for movement for a comfortable, relaxed silhouette.	0899a897-620c-446f-88b7-1cde3ed896fd	e8ef7e01-40d9-4738-b0df-5857ed93c32b
a9dcbd11-a664-44b8-b670-b65cffc1df36	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	Regular Fit Linen-blend Shirt	Short-sleeved shirt in a woven linen and cotton blend. Resort collar, buttons without placket, an open chest pocket, and yoke at back with darts. Straight-cut hem. Regular Fit – classic fit with good room for movement and a gently tapered waist for a comfortable, tailored silhouette.	0899a897-620c-446f-88b7-1cde3ed896fd	e8ef7e01-40d9-4738-b0df-5857ed93c32b
d4600980-2b88-47fd-9db4-367bc55a3308	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	Regular Fit Unconstructed Linen Jacket	Unconstructed, single-breasted jacket in linen with a regular fit. Notched lapels. Open chest pocket, open front pockets, and straight-cut hem with slit at sides. Unlined.	ca5ed990-1497-4427-8eb5-1ad445b8e0de	e8ef7e01-40d9-4738-b0df-5857ed93c32b
3c59856c-9e30-464e-b753-ae63a0d8e75d	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	Skinny Fit Blazer	Single-breasted blazer in woven stretch fabric with narrow, notched lapels. Chest pocket, front pockets with flap, and an inner pocket. Decorative buttons at cuffs and a vent at back. Lined. Skinny Fit – slightly shorter style, shaped at chest, tapered sharply at waist, combined with narrow shoulders and sleeves for a completely tailored silhouette.	ca5ed990-1497-4427-8eb5-1ad445b8e0de	e8ef7e01-40d9-4738-b0df-5857ed93c32b
a5703a54-782a-4e59-9ac3-3a4eac93c4cc	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	Slim Fit Suit Vest	Suit vest in woven fabric with shiny woven fabric at back. Buttons at front, a chest pocket, welt front pockets, and adjustable tab at back. Lined.\n	ca5ed990-1497-4427-8eb5-1ad445b8e0de	e8ef7e01-40d9-4738-b0df-5857ed93c32b
62f17240-a3f4-472e-ba06-205de4cad742	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	Cotton Dress	Short, fitted, sleeveless dress in soft cotton jersey with a narrow cut at top. Narrow shoulder straps. Unlined.	f722ed55-b189-4633-8479-5582b860c0f7	e8ef7e01-40d9-4738-b0df-5857ed93c32b
06e6feb1-bba0-492e-acdf-d3a664be350e	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	Draped Shirt Dress	Short dress in woven fabric. Collar, buttons at front with draped button placket, extra-long sleeves, and wide cuffs with a slit. Unlined.	f722ed55-b189-4633-8479-5582b860c0f7	e8ef7e01-40d9-4738-b0df-5857ed93c32b
ea6eeabe-25df-4250-a9dd-3a0ad9606480	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	Off-the-shoulder Dress	Short, off-the-shoulder dress in softly draped, woven fabric. Elasticized, ruffle-trimmed upper edge, long, wide sleeves with covered elastic at cuffs, and concealed elastic below bust and at waist for a defined silhouette. Partly lined.	f722ed55-b189-4633-8479-5582b860c0f7	e8ef7e01-40d9-4738-b0df-5857ed93c32b
503710a0-09b0-4732-b329-56c5ab449e00	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	High Waist Denim Shorts	5-pocket shorts in thick cotton denim. High waist, zip fly with button, and raw-edge hems.	33c02fee-d891-4ddd-a45b-5d79810d2602	e8ef7e01-40d9-4738-b0df-5857ed93c32b
cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	Pull-on Shorts	Shorts in woven fabric with a slight sheen. High waist, waistband with covered elastic, and discreet side-seam pockets. Short slits at sides.	99bbfded-7bd1-4f75-b848-f213f2a28ad3	e8ef7e01-40d9-4738-b0df-5857ed93c32b
85274b42-6f1f-475f-b9b5-9ceb0b837720	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	Twill Shorts	Shorts in lightweight twill. High waist with ruffle trim at top, covered elastic at waistband, mock fly, and side pockets.	33c02fee-d891-4ddd-a45b-5d79810d2602	e8ef7e01-40d9-4738-b0df-5857ed93c32b
1c2956c8-4808-453a-b2e6-f546cc8435aa	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	Pajama Camisole Top and Shorts	Pajamas with a camisole top and shorts in woven, crêped cotton fabric. Top with narrow, adjustable shoulder straps and narrow elastic at top with an overlocked edge. Shorts with narrow elastic and overlocked edge at waistband.	3217ca56-8298-47e3-b502-46449f385e45	e8ef7e01-40d9-4738-b0df-5857ed93c32b
43adcae7-93b6-4894-85f4-c006d820769b	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	Patterned Cotton Pajamas	Pajamas in soft cotton jersey with a printed pattern. Top with a ribbed crew neck, dropped shoulders, and long, wide sleeves. Pants with covered elastic at waistband and straight, wide legs.	3217ca56-8298-47e3-b502-46449f385e45	e8ef7e01-40d9-4738-b0df-5857ed93c32b
595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	Satin Nightgown	Short, sleeveless nightgown in softly draped satin. Narrow, adjustable shoulder straps crossed at back. V-neck at front and slightly lower-cut, lace-trimmed V-neck at back.	3217ca56-8298-47e3-b502-46449f385e45	e8ef7e01-40d9-4738-b0df-5857ed93c32b
8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	Slim fit double-breasted suit blazer	Tailored line. Wrap detail. Slim fit. Recycled polyester blend fabric. Lapel with notch. Long buttoned sleeve. Welt pocket on the chest. Two pockets with flaps on the front. Double back slit. Button up.	ca5ed990-1497-4427-8eb5-1ad445b8e0de	e2f60624-a7d4-4799-a64b-50c42a74116c
b3888a76-a491-48c0-9383-784242ab4199	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	Slim fit linen suit blazer	Front closure. Long sleeve. Light fabric. Slim fit. Regular neck. Standard design. Lining only. Linen fabric. Peaked lapel. Structured shoulders. Welt pocket on the chest. Long sleeve with buttoned cuffs. Two side pockets with flaps. Back slits. Two buttons fastening. Inner pockets. 	ca5ed990-1497-4427-8eb5-1ad445b8e0de	e2f60624-a7d4-4799-a64b-50c42a74116c
bc9a686e-17eb-4355-8721-07175dde489b	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	Ben tapered-fit jeans	Tapered fit: wide cut at the top that narrows from the knee to the ankle. Cropped design. Sustainable cotton blend fabric. Loops. Two side pockets. Coin pocket. Two patch pockets on the back. Zip and one button fastening. The model is 190 cm tall and is wearing a size 42.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	e2f60624-a7d4-4799-a64b-50c42a74116c
f2725de1-5816-49b4-b7e8-7e4d4bcc1913	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	Loose carpenter jeans	Cropped design. Loose fit: relaxed at hips, thighs and legs. Carpenter style. Organic cotton-blend fabric. Recycled cotton-blend fabric. Loops. Zip and one button fastening. Two side pockets. Coin pocket. Patch pocket on the side. Two patch pockets on the back. Button up.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	e2f60624-a7d4-4799-a64b-50c42a74116c
831453bd-bb1f-4c45-b11f-15d16f7f1236	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	Skinny dark wash Jude jeans	Skinny fit. Sustainable cotton blend fabric. Loops. Five pockets. Zip and one button fastening. The model is 185 cm tall and is wearing a size 42.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	e2f60624-a7d4-4799-a64b-50c42a74116c
773353c3-1ed0-4bc6-9e32-63f0b4f481e8	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	Cotton pique polo shirt	Sustainable cotton fabric. Polo neck. Short sleeve with elastic cuffs. Button up. The model is 187 cm tall and is wearing a size M.	0899a897-620c-446f-88b7-1cde3ed896fd	e2f60624-a7d4-4799-a64b-50c42a74116c
4ae30169-15f3-4c97-8a96-66934b2294c9	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	Knit cotton polo shirt	Knitted fabric. Cotton-blend fabric. Polo neck. Short sleeve. Button up. Elastic finish.	0899a897-620c-446f-88b7-1cde3ed896fd	e2f60624-a7d4-4799-a64b-50c42a74116c
82f01998-4fbd-4269-8e38-2a25ac8bf3d3	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	Ribbed knit polo shirt	Online Exclusive. Standard design. Straight design. Ribbed design. Fine knit fabric. Cotton and modal mix. Polo neck. Neck closure. Short sleeve. Contrasting finish. The model is 183 cm and wears a size M.	0899a897-620c-446f-88b7-1cde3ed896fd	e2f60624-a7d4-4799-a64b-50c42a74116c
af92aa49-22fd-4390-a1ee-649596b12d65	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	100% linen shorts	100% Linen. Slim fit. Loops. Zip and one button fastening. Two side pockets. Coin pocket. Two welt pockets with button on the back.	99bbfded-7bd1-4f75-b848-f213f2a28ad3	e2f60624-a7d4-4799-a64b-50c42a74116c
bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	Checked linen Bermuda shorts	Slim fit. Check-pattern. Cotton and linen mix. Loops. Two side pockets. Two welt pockets with button on the back.	99bbfded-7bd1-4f75-b848-f213f2a28ad3	e2f60624-a7d4-4799-a64b-50c42a74116c
96e852ca-79e6-438a-9d90-a560fc44fd92	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	Regular-fit denim Bermuda shorts	Regular fit. Straight design. Denim fabric. Loops. Two side pockets. Coin pocket. Two patch pockets on the back. The model is 187 cm tall and is wearing a size 42.	99bbfded-7bd1-4f75-b848-f213f2a28ad3	e2f60624-a7d4-4799-a64b-50c42a74116c
519fc9bb-58d0-4342-80d2-bce9ca2bceef	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	Classic belted trench	Committed Collection. Flowy fabric. Oversize design. Medium design. Lapel-collar. Long sleeve with loops. Two side pockets. Back-slit hem. Loops. Removable belt. Inner lining. Plus Size Available.	01d680bd-ccda-48ff-905a-21eb33009b24	e2f60624-a7d4-4799-a64b-50c42a74116c
daf599f9-6641-41da-9d88-427cd0aff377	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	Lapels wool coat	Long sleeve. Lapels. Front closure. Lining only. Cloth. Standard design. Committed Collection. Heavy structure. Recycled wool mix fabric. Straight design. Medium design. Lapel-collar V-neck collar. Long buttoned sleeve. Decorative pockets on the front. Double button fastening. Inner lining. Plus Size Available.	01d680bd-ccda-48ff-905a-21eb33009b24	e2f60624-a7d4-4799-a64b-50c42a74116c
ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	Ultralight button down jacket	Light fabric. Front closure. Oversize design. Water-repellent. Quilted design. Straight design. Short design. Rounded neck. Long sleeve. Press stud fastening on the front. Recycled polyester padding.	01d680bd-ccda-48ff-905a-21eb33009b24	e2f60624-a7d4-4799-a64b-50c42a74116c
f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	Buttons satin blouse	Standard design. Long sleeve. Satin. Front closure. Shirt-style collar. Light fabric. Flowy fabric. Straight design. Long design. Lapel-collar V-neck collar. Long buttoned sleeve. Button fastening on the front section. Plus Size Available. Party collection.	89d9c446-d149-4133-8384-40e97394663f	e2f60624-a7d4-4799-a64b-50c42a74116c
38f65e3f-1f41-4b23-a63e-eb31378b3dd0	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	Oversize cotton shirt	Long design. Long sleeve. Front closure. Light fabric. Cotton poplin. Oversize design. Shirt-style collar. Long buttoned sleeve. Patch pocket on the chest. Button fastening on the front section.	89d9c446-d149-4133-8384-40e97394663f	e2f60624-a7d4-4799-a64b-50c42a74116c
60449c96-7736-429c-b8a6-0696dfa6dd28	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	Satin finish flowy shirt	Committed Collection. Satin. Straight design. Lapel-collar V-neck collar. Short sleeve. Button fastening on the front section. Plus Size Available.	89d9c446-d149-4133-8384-40e97394663f	e2f60624-a7d4-4799-a64b-50c42a74116c
88532d4c-e55d-4281-84b8-93b258138002	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	Gingham pleated skirt	Committed Collection. Gingham checked print. Straight design. Midi design. Medium waist. Gathered detail. Decorative bow. Zip fastening on the back section.	4d294ae9-ebe6-40c3-91a9-b177f952db86	e2f60624-a7d4-4799-a64b-50c42a74116c
cb87b1f1-efe5-480b-a61e-b878d05aba58	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	Linen-blend wrap skirt	Committed Collection. 100% Linen. Midi design. Pencil design. High waist. Elastic pleated on the waist. Side bow fastening.	4d294ae9-ebe6-40c3-91a9-b177f952db86	e2f60624-a7d4-4799-a64b-50c42a74116c
1bc4ca6e-600f-4062-8fbc-9ac339c11b82	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	Pleated midi skirt	Committed Collection. Pleated design. Midi design. Evasé design. Elastic waist.	4d294ae9-ebe6-40c3-91a9-b177f952db86	e2f60624-a7d4-4799-a64b-50c42a74116c
b8f514bc-2226-47c5-bbb0-ee606b402c13	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	BASIC JEANS-JOGGERS	Basic jogger jeans with elastic waistband, pockets and raw edges. They are fastened with a zipper and a button.	618b2b04-ed8b-43b2-bd86-e640c9498622	ae898734-c399-4444-bcfb-c5dce7ed3b9b
00b4128d-efef-4e63-9764-b4cf0943d538	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	Jeans in the style of the 90s	Jeans in the style of the 90s with slits. Narrow cut, five pockets, belt loops. They are tightened with a zipper and a button.	618b2b04-ed8b-43b2-bd86-e640c9498622	ae898734-c399-4444-bcfb-c5dce7ed3b9b
013cf771-a260-46eb-85c6-60acbfd5cb32	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	Basic joggers with elastic drawstring	Basic joggers with elastic drawstring waistband and elastic cuffs. The model is presented in several colors.	618b2b04-ed8b-43b2-bd86-e640c9498622	ae898734-c399-4444-bcfb-c5dce7ed3b9b
a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	JACKET-SHIRT	The shirt is made of light faux suede with front pockets. Fastens with buttons.	0899a897-620c-446f-88b7-1cde3ed896fd	ae898734-c399-4444-bcfb-c5dce7ed3b9b
3777487f-a3b4-4aea-b04c-445c72be2c47	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	LONG SLEEVE SHIRT	Plain shirt with long sleeves and collar. It fastens with buttons. Made of a blend of cotton and linen.	0899a897-620c-446f-88b7-1cde3ed896fd	ae898734-c399-4444-bcfb-c5dce7ed3b9b
cea86f16-3592-420f-92c6-f20c18ef4c25	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	Striped shirt	Basic shirt with contrasting vertical stripes. It fastens with buttons.	0899a897-620c-446f-88b7-1cde3ed896fd	ae898734-c399-4444-bcfb-c5dce7ed3b9b
d81e30de-c240-4300-ba21-5b8643792b2e	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	ELONGATED T-SHIRT	Basic elongated top with short sleeves and round neck. The model is presented in several colors.	220352ab-466d-4ade-ae75-9dcf787008c1	ae898734-c399-4444-bcfb-c5dce7ed3b9b
c667567a-0801-4cd3-8924-0178261af329	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	SLEEVELESS T-SHIRT	Basic sleeveless T-shirt. Round neck, embroidered patch at the bottom. 100% cotton.	220352ab-466d-4ade-ae75-9dcf787008c1	ae898734-c399-4444-bcfb-c5dce7ed3b9b
cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	WITH A BUTTON-DOWN COLLAR	T-shirt made of 100% cotton. Made of 100% cotton. The model is presented in several colors.	220352ab-466d-4ade-ae75-9dcf787008c1	ae898734-c399-4444-bcfb-c5dce7ed3b9b
edfda6a2-f5cd-421b-b6e5-391f1e216143	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	Cropped blazer with flap detail	Cropped blazer with flap detail, a double-breasted button fastening and lapel collar.	bc4fe48d-6e5b-48f1-9a0b-cb66d88ecdfb	ae898734-c399-4444-bcfb-c5dce7ed3b9b
88a43f86-ca7b-4b1a-a144-a08cb1764c48	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	Faux suede jacket with roll-up sleeves	Long faux suede jacket with roll-up sleeves, a lapel collar and front pockets.	bc4fe48d-6e5b-48f1-9a0b-cb66d88ecdfb	ae898734-c399-4444-bcfb-c5dce7ed3b9b
820ea58b-9d9b-45bf-aef1-da5109cd8c52	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	Formal buttoned vest	Formal vest with front button fastening. Available in several colors.	bc4fe48d-6e5b-48f1-9a0b-cb66d88ecdfb	ae898734-c399-4444-bcfb-c5dce7ed3b9b
b6e9a335-0b5c-4888-83a8-c346a8228482	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	Basic box pleat mini skirt	Basic box pleat mini skirt with zipper fastening.	4d294ae9-ebe6-40c3-91a9-b177f952db86	ae898734-c399-4444-bcfb-c5dce7ed3b9b
fb73b4d7-afb2-43ac-8dd8-9efe368078a8	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	Mid-rise mini skirt with slit	Mid-rise mini skirt with side slit.	4d294ae9-ebe6-40c3-91a9-b177f952db86	ae898734-c399-4444-bcfb-c5dce7ed3b9b
60dd91d0-9978-420b-abcf-a07f6d30aab7	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	Vintage denim mini skirt	Vintage-style denim mini skirt with diagonal seam at the front, frayed hem, belt loops, pockets and zipper fly and top button fastening.	4d294ae9-ebe6-40c3-91a9-b177f952db86	ae898734-c399-4444-bcfb-c5dce7ed3b9b
5f859a61-765f-40fa-8b55-96e4ba5af723	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	Cropped open cardigan	Cropped knit cardigan with an open front and single-button fastening.	d96ce1c5-5521-4d91-874c-e07afc54fa82	ae898734-c399-4444-bcfb-c5dce7ed3b9b
0417f0e9-b015-4e57-926c-976f2dfbea69	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	Multi-way knit crossed sweater	Cropped multi-way knit sweater with crossed detail, long sleeves and a V-neck.	d96ce1c5-5521-4d91-874c-e07afc54fa82	ae898734-c399-4444-bcfb-c5dce7ed3b9b
4837b446-7cfe-400c-a902-270166c7fc3c	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	REGULAR-FIT JEANS	Crafted from no-stretch cotton denim, these jeans are designed with a regular fit and come in pastel lilac shade. They fasten using our iconic Medusa button.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	b022b741-95ad-451d-9aa4-a4c6ed2a9324
d751f004-34d7-4b8a-b4fc-04130f491ef7	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	STRAIGHT-LEG DENIM JEANS	Finished in a classic straight-leg shape, these denim jeans feature leather trim detailing and a distressed look.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	b022b741-95ad-451d-9aa4-a4c6ed2a9324
89cf3f60-7d9c-444b-84a3-aab4e4029355	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	WATER-PAINTED DENIM JEANS	A water-painted finish gives these denim jeans a 1970s-inspired psychedelic look. The buttons feature the iconic Medusa.	31fc8c74-3cc1-42a8-9f5c-3b26cdd9b3e2	b022b741-95ad-451d-9aa4-a4c6ed2a9324
e1680808-2448-41f0-a8c5-3c8bc3afc5ac	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	BAROCCO GODDESS HOODIE	This hoodie features a large pocket and is crafted from the softest cotton. The design features a silk insert of the Barocco Goddess motif and ultra-soft fleece interior.	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	b022b741-95ad-451d-9aa4-a4c6ed2a9324
de9f7682-600c-4c1e-a3e6-cd186865f036	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	LOGO SHEARLING SWEATER	A classic design that complements an array of on- and off-duty looks, this cotton sweater is embellished with shearling Versace logo lettering	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	b022b741-95ad-451d-9aa4-a4c6ed2a9324
e4909e63-f547-4693-8457-9b197b80bae5	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	MEDUSA EMBROIDERED SWEATSHIRT	A Versace classic, this relaxed sweatshirt boast a thread-embroidered Medusa motif emblazoned across the chest. The versatile style is crafted from pure organic cotton.	b5dbb42c-8252-4b96-b58d-d6a6384b5f10	b022b741-95ad-451d-9aa4-a4c6ed2a9324
0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	BAROCCO PRINT BIKINI TOP	A classic beach style, this glamorous bikini top boasts an all-over Barocco print.	cd177efe-b398-4049-be9b-ed8848253681	b022b741-95ad-451d-9aa4-a4c6ed2a9324
c01e432c-eae7-44cf-99ff-7abe70484ddd	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	GRECA BORDER TRIANGLE BIKINI TOP	Instantly recognizable, this triangle bikini top is embellished with Greca patterned shoulder and back straps.	cd177efe-b398-4049-be9b-ed8848253681	b022b741-95ad-451d-9aa4-a4c6ed2a9324
ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	GRECA CHAIN ONE-PIECE SWIMSUIT	An eye-catching style, this one-piece swimsuit is designed with a low backline an high leg line. The exceptional beach and pool style is enriched with Greca chain hardware on the shoulder straps.	cd177efe-b398-4049-be9b-ed8848253681	b022b741-95ad-451d-9aa4-a4c6ed2a9324
894ecf35-386b-40cc-8cf9-1735a26c293d	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	DREAM LOGO T-SHIRT	Quintessentially Versace, this classic t-shirt features the Dream Via Gesù logo printed across the chest.	ed6b4883-9d16-4d12-9ac0-b0e6b5cd8a13	b022b741-95ad-451d-9aa4-a4c6ed2a9324
ed17f7e9-ca19-4561-9274-047e68e535c8	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	GRECA GYM SWEATSHIRT	Whether you are working out or lounging at home, this plush jersey sweatshirt is a must-have. The high neck style features the iconic Greca on the waistline and pairs perfectly with matching leggings or sweatpants.	ed6b4883-9d16-4d12-9ac0-b0e6b5cd8a13	b022b741-95ad-451d-9aa4-a4c6ed2a9324
3c8adec9-ee5c-45a8-a7a2-90a427ab7517	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	SAFETY PIN LA GRECA T-SHIRT	A Versace classic, this cotton cropped t-shirt features the brand logo emblazoned across the chest in La Greca print lettering. The style features a gathered hemline, accentuated with statement Safety Pin hardware.	ed6b4883-9d16-4d12-9ac0-b0e6b5cd8a13	b022b741-95ad-451d-9aa4-a4c6ed2a9324
\.


--
-- Data for Name: product_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_media (product_id, media_id) FROM stdin;
9f6bea20-bbd2-43db-bc89-4e2b32fae406	90721eb7-02a6-40ad-9a27-9e7745149abb
9f6bea20-bbd2-43db-bc89-4e2b32fae406	4011145a-b03c-4b68-83a6-63db43902ed8
9f6bea20-bbd2-43db-bc89-4e2b32fae406	a24ff9fa-e01e-45a8-ab7f-706d94653456
64ba5389-494f-45a0-abb9-691e3d6ce763	bc335e42-acc2-4ddd-be20-31b4bbf573cf
64ba5389-494f-45a0-abb9-691e3d6ce763	907700f5-d8ca-457e-b675-00b9b2f55ad4
611e9037-7498-4696-8688-8b6997816a74	493d5651-e4fd-4f56-8ba8-9b8e4baeb106
611e9037-7498-4696-8688-8b6997816a74	b954897f-45d8-408e-aefe-8a8955ba445c
611e9037-7498-4696-8688-8b6997816a74	440a735c-40f7-4f6f-919e-582be7487f21
611e9037-7498-4696-8688-8b6997816a74	30cd0b12-28df-40e1-ba01-40e056b0823e
840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	92ee662a-6165-46a8-a802-53541b2ca456
840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	faff7d73-09ce-4f56-972c-1981c94dce53
1e43d324-bdec-4247-acff-eea4af35beff	ad2beebc-21f0-42d8-93ed-80845082ef09
1e43d324-bdec-4247-acff-eea4af35beff	b7c57d1b-df96-4cb6-ab95-85e897955c02
a9dcbd11-a664-44b8-b670-b65cffc1df36	9ac58b3f-3122-4b11-9907-ddc6912a5ba7
a9dcbd11-a664-44b8-b670-b65cffc1df36	633f650c-2a1d-4966-8471-db9cd5e2bc79
a9dcbd11-a664-44b8-b670-b65cffc1df36	aabb6415-6fd6-4850-866a-fd6017bf7aad
d4600980-2b88-47fd-9db4-367bc55a3308	7abb17c8-cc24-4f2a-81cc-98e5d4c74015
d4600980-2b88-47fd-9db4-367bc55a3308	b54a2e6a-6f7e-4b9e-bcfc-f0ebbabe28e9
3c59856c-9e30-464e-b753-ae63a0d8e75d	1d7e3c82-51c6-42f9-83d4-3722b6bc017b
3c59856c-9e30-464e-b753-ae63a0d8e75d	4270167d-d91f-4ef4-96d1-23f05f13c2f2
3c59856c-9e30-464e-b753-ae63a0d8e75d	6887e4fe-67db-4155-9d20-529f6fa613f5
a5703a54-782a-4e59-9ac3-3a4eac93c4cc	efaa5a65-4ddd-4fe3-983d-c27a0259aff3
a5703a54-782a-4e59-9ac3-3a4eac93c4cc	2ef25073-f52e-4e79-8b48-7e4ff12cacb4
62f17240-a3f4-472e-ba06-205de4cad742	0c4e9083-58d3-41c4-b405-ac54cf7c690e
62f17240-a3f4-472e-ba06-205de4cad742	8fbf96a3-681b-46d4-bbbd-693c2865db38
62f17240-a3f4-472e-ba06-205de4cad742	fe196361-47ed-44f1-93bf-a42b59daa31d
62f17240-a3f4-472e-ba06-205de4cad742	7f625358-d156-41a7-86e9-a315fa40a738
62f17240-a3f4-472e-ba06-205de4cad742	b8cce727-6334-48df-ac53-e87c22972757
06e6feb1-bba0-492e-acdf-d3a664be350e	3d1c3312-9a04-4e6c-825d-e57cd2eedf66
06e6feb1-bba0-492e-acdf-d3a664be350e	7b22f438-b01e-4373-83c8-0471debbcf89
06e6feb1-bba0-492e-acdf-d3a664be350e	feac8995-61a5-4328-972b-617380273849
ea6eeabe-25df-4250-a9dd-3a0ad9606480	4754f32e-b856-49d9-a9ce-b90aef476116
ea6eeabe-25df-4250-a9dd-3a0ad9606480	73478bc8-7c12-4370-9bee-95e97af057fe
ea6eeabe-25df-4250-a9dd-3a0ad9606480	f217ff36-fb0c-4cc3-aa86-e2bf7ffdd189
ea6eeabe-25df-4250-a9dd-3a0ad9606480	7b5db65d-aa71-411c-b537-447e394bd8ed
503710a0-09b0-4732-b329-56c5ab449e00	3a03fab9-eb37-4296-bc15-ffdba22bd100
503710a0-09b0-4732-b329-56c5ab449e00	72bd75c4-d25c-447a-9931-f8f599afe3bf
503710a0-09b0-4732-b329-56c5ab449e00	a2821da2-e054-4ca7-9e37-193effd2ddf4
cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	283fde90-0ca3-497f-87e5-6133700b564b
cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	fd933304-363a-4f0b-ba6b-bf8c4e0884bb
cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	bfd1f3cd-0315-4c06-8e24-d9ae127cdc3e
cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	2c1a0924-7122-4473-80f4-f374a4d2fe93
85274b42-6f1f-475f-b9b5-9ceb0b837720	02e3b4aa-61b8-4910-b4db-23f630b82f52
85274b42-6f1f-475f-b9b5-9ceb0b837720	11cd3059-27c5-49bd-b0f0-a1be62568f19
1c2956c8-4808-453a-b2e6-f546cc8435aa	6535a54a-75d8-4e6b-a1a2-14624ee193f4
1c2956c8-4808-453a-b2e6-f546cc8435aa	e9ecaa67-bc85-4e45-ae12-b49813dfb3db
595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	06d48f8b-067f-46c9-b40f-4122e6473ab3
8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	c558935e-0dd8-4402-b6e6-3fac5ceb1726
8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	99b8fa13-02d3-4fbb-8605-e43ea0d1d8ce
b3888a76-a491-48c0-9383-784242ab4199	a3930095-1a9e-4ed7-94c4-4225c463dff4
b3888a76-a491-48c0-9383-784242ab4199	e624ccf4-faed-4f5e-9e07-ba2252bec21a
b3888a76-a491-48c0-9383-784242ab4199	541a6bdc-a119-4954-9117-12729aecfbba
bc9a686e-17eb-4355-8721-07175dde489b	e4f2717e-1ab9-48c1-86f3-c8b98af7d277
bc9a686e-17eb-4355-8721-07175dde489b	caf79924-7b4a-4131-808e-5ce34b135496
bc9a686e-17eb-4355-8721-07175dde489b	8ae1bf1c-1e42-4c1c-b7dc-f39a9e46d171
bc9a686e-17eb-4355-8721-07175dde489b	1df577ff-7cb6-4150-98ba-d5b2150c7692
f2725de1-5816-49b4-b7e8-7e4d4bcc1913	95437858-a38c-48b1-8c05-021333ad451e
831453bd-bb1f-4c45-b11f-15d16f7f1236	37c8b337-95bd-434e-98fc-60e8d7cdf97e
831453bd-bb1f-4c45-b11f-15d16f7f1236	403aff45-45fd-4f77-9dc7-19c532f2b26f
773353c3-1ed0-4bc6-9e32-63f0b4f481e8	dcbe944c-0727-42fa-aed9-40d0e3412c78
773353c3-1ed0-4bc6-9e32-63f0b4f481e8	a2f4ae5c-9561-4bb1-ab57-d772ac420cb2
4ae30169-15f3-4c97-8a96-66934b2294c9	f90aee5b-586f-4c39-a9f5-75dbf7a10109
4ae30169-15f3-4c97-8a96-66934b2294c9	1db83119-cbb6-44af-8ef0-7f70d79a8f33
4ae30169-15f3-4c97-8a96-66934b2294c9	2338b1f9-5ee6-4210-b5a3-2c44d6cc5416
4ae30169-15f3-4c97-8a96-66934b2294c9	d99c01cf-d21d-4fd5-8cc0-aa545c7d1996
82f01998-4fbd-4269-8e38-2a25ac8bf3d3	fbcc6b47-ebfe-4767-8efa-a73056331cac
82f01998-4fbd-4269-8e38-2a25ac8bf3d3	5d053b61-db11-434e-8c1f-5a9f8e5887ed
af92aa49-22fd-4390-a1ee-649596b12d65	e4627a5f-6df2-4fd5-97ed-a0a46f3fbb09
af92aa49-22fd-4390-a1ee-649596b12d65	b3e83f8c-dde6-438b-b044-8264aad9da52
af92aa49-22fd-4390-a1ee-649596b12d65	2b756a8b-e1ea-4002-9f05-f67b221ec946
bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	61d98d10-831a-4135-9225-f25887fad276
bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	e0933229-09a4-4662-8d98-962f106abd45
96e852ca-79e6-438a-9d90-a560fc44fd92	a9258a90-c6c3-4125-9627-4aab5908a571
96e852ca-79e6-438a-9d90-a560fc44fd92	21fbc260-245c-4afc-af30-436913189d92
96e852ca-79e6-438a-9d90-a560fc44fd92	ebd06549-e998-4d67-a965-e41fd91fc423
519fc9bb-58d0-4342-80d2-bce9ca2bceef	1092b4ae-b0cf-4f7d-8f88-b9626ce42780
519fc9bb-58d0-4342-80d2-bce9ca2bceef	7636de03-5310-4683-ab1c-e9f28bacd987
519fc9bb-58d0-4342-80d2-bce9ca2bceef	bc3c6090-b143-4872-bb2d-2f0cf0432f7f
daf599f9-6641-41da-9d88-427cd0aff377	22fbe5e2-7936-4de8-952c-b2f2664b6838
daf599f9-6641-41da-9d88-427cd0aff377	bd86bb88-e9c4-4e05-82a2-9d7f882ead8b
ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	fb6252f2-d67c-4a3c-b4fd-4b8673f1d544
ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	f864350d-a24e-468c-b410-b917b7d86886
ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	654ff88a-4a32-4e4e-b3c3-41022ff7d72b
f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	34d53598-1b2c-489d-8ea4-7f321f2b7811
f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	d420df3b-b81e-44ad-9816-d70f4f710b71
f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	129d93e6-c173-4cb4-8d10-72037f67c78a
38f65e3f-1f41-4b23-a63e-eb31378b3dd0	6bb5b56e-e5e4-4d7e-bdf8-45a46247df9d
38f65e3f-1f41-4b23-a63e-eb31378b3dd0	f9847ccc-5f84-448c-9204-1e727c20ab04
38f65e3f-1f41-4b23-a63e-eb31378b3dd0	0463abde-afac-4acb-9367-dd6a9cbac1d7
60449c96-7736-429c-b8a6-0696dfa6dd28	311a16b9-0a72-45a5-a9ca-ecba2f4bc771
60449c96-7736-429c-b8a6-0696dfa6dd28	30614da7-87c6-4d35-a37a-5b5ef1975962
60449c96-7736-429c-b8a6-0696dfa6dd28	179d4496-27b4-402b-8a0f-a6c1c7a9e08e
88532d4c-e55d-4281-84b8-93b258138002	17533aa6-3654-401a-b50f-6ca3d54aa201
88532d4c-e55d-4281-84b8-93b258138002	2d36f9e4-ae26-4a69-ae2c-825d7f8f160e
cb87b1f1-efe5-480b-a61e-b878d05aba58	2f92b4bc-00b9-470f-90f1-635e404fffc4
cb87b1f1-efe5-480b-a61e-b878d05aba58	39d747d4-7289-4d04-bcd8-c71450882666
1bc4ca6e-600f-4062-8fbc-9ac339c11b82	afda20bd-cc52-4f98-9eea-eeae5a60408a
1bc4ca6e-600f-4062-8fbc-9ac339c11b82	f0396e91-5d4b-4ae6-8b2d-6fdc184cb048
b8f514bc-2226-47c5-bbb0-ee606b402c13	141d0284-206f-445f-834c-93083d307b5e
b8f514bc-2226-47c5-bbb0-ee606b402c13	8ac3c3ac-5272-4674-8a20-3af1a1554bb5
00b4128d-efef-4e63-9764-b4cf0943d538	66c63195-88f2-420b-b0e8-4fbca2986f1e
00b4128d-efef-4e63-9764-b4cf0943d538	71227662-5536-417c-bb94-1c5658cc3f10
013cf771-a260-46eb-85c6-60acbfd5cb32	d74b21a1-3df1-4591-9f82-8ab9199794c7
013cf771-a260-46eb-85c6-60acbfd5cb32	da9d83a4-caef-4423-bb47-4c2032e3d8b0
013cf771-a260-46eb-85c6-60acbfd5cb32	d7c580c7-c4e4-4c75-949c-0600a13643b3
a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	5379fcd7-3fc2-4242-a034-1242db119d0f
a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	82253de8-3497-4f53-8102-5e22528065a0
cea86f16-3592-420f-92c6-f20c18ef4c25	bf1eb56f-b4e1-4e71-87bb-4e2a77aa57b3
cea86f16-3592-420f-92c6-f20c18ef4c25	08ef0e1a-5616-4af2-ac7b-069f7148e7c2
d81e30de-c240-4300-ba21-5b8643792b2e	fcf6ade0-e486-42c7-a6c9-8cff97704cf0
d81e30de-c240-4300-ba21-5b8643792b2e	f8e720e1-5689-4035-b3fb-1c1c23642d20
d81e30de-c240-4300-ba21-5b8643792b2e	cb97292f-0b64-4883-9a7b-925107c5f1f9
d81e30de-c240-4300-ba21-5b8643792b2e	2bdd0f6e-2eda-4c99-863e-4724b3349891
c667567a-0801-4cd3-8924-0178261af329	8a1226fb-a3e2-4205-8424-e67d6870b273
c667567a-0801-4cd3-8924-0178261af329	d5dd7f81-3498-4883-a76b-f407ea152733
c667567a-0801-4cd3-8924-0178261af329	dc4f1975-fc66-4664-a826-445db170db65
cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	20d5c9f4-691e-4524-96aa-722e449508d9
cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	3b42f245-b772-4ed4-8156-88a9bb5893c7
cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	acaa566d-0cea-4361-b4c2-51d0be47e939
cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	071cc6c3-dbdd-4d26-ac82-dbfd21a2bc9e
edfda6a2-f5cd-421b-b6e5-391f1e216143	ce8f2abc-b2ac-4b4e-876a-5919ac4b7fc2
edfda6a2-f5cd-421b-b6e5-391f1e216143	bf0141e2-935c-480b-9198-884761771545
88a43f86-ca7b-4b1a-a144-a08cb1764c48	adc83b3c-0bbf-4c4e-a460-16ff820a7538
88a43f86-ca7b-4b1a-a144-a08cb1764c48	3b3d05bb-5d05-4857-bf34-a53de80aba45
88a43f86-ca7b-4b1a-a144-a08cb1764c48	fbb7640b-e6b5-4dc2-a36d-107a7be60168
820ea58b-9d9b-45bf-aef1-da5109cd8c52	75947c11-06ff-41a0-9ca6-c9b50fe34c01
820ea58b-9d9b-45bf-aef1-da5109cd8c52	27cf2d29-a99b-446b-91f1-3e7178ea1935
b6e9a335-0b5c-4888-83a8-c346a8228482	cc85a85f-9727-40c2-b7a8-1cb445f361da
b6e9a335-0b5c-4888-83a8-c346a8228482	cdc565f7-3d5c-4d5b-b213-1d024d1ae820
fb73b4d7-afb2-43ac-8dd8-9efe368078a8	6a81e89e-3876-4103-82b0-f3f04aa70079
fb73b4d7-afb2-43ac-8dd8-9efe368078a8	878b1193-3ce5-46c7-bdcc-0b2b37c548bf
fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1efa22e-96b5-4625-a48a-92c20a0122b6
60dd91d0-9978-420b-abcf-a07f6d30aab7	ff6b3554-3d44-49a0-ba19-f3f49dac4a5e
5f859a61-765f-40fa-8b55-96e4ba5af723	32e3892b-067f-413d-9deb-fe3a9530c37b
5f859a61-765f-40fa-8b55-96e4ba5af723	40f41bec-efd6-45fa-8ddb-92da54835688
5f859a61-765f-40fa-8b55-96e4ba5af723	8e818e42-23ee-4884-92af-0b7630588fb6
5f859a61-765f-40fa-8b55-96e4ba5af723	613b173a-0b0d-43dd-b4a3-e25322a802fc
5f859a61-765f-40fa-8b55-96e4ba5af723	f897402e-21f6-493f-9495-41441d0e9884
0417f0e9-b015-4e57-926c-976f2dfbea69	22f7992e-2aec-4b15-850d-ca56dacdf8a2
0417f0e9-b015-4e57-926c-976f2dfbea69	3bb711e5-9733-4d54-8869-adbf509986b3
0417f0e9-b015-4e57-926c-976f2dfbea69	50280448-7617-4a96-8d85-dacc841a923a
0417f0e9-b015-4e57-926c-976f2dfbea69	994fa6d7-4891-4879-b8ba-55506e73a9cf
4837b446-7cfe-400c-a902-270166c7fc3c	bce235a9-73e6-40a5-9f29-3a491382fd11
d751f004-34d7-4b8a-b4fc-04130f491ef7	a45972a7-232f-4f2f-b15b-cf22d2436c44
89cf3f60-7d9c-444b-84a3-aab4e4029355	6efc13ff-eeeb-4dbd-8d33-ba9a50043d7a
89cf3f60-7d9c-444b-84a3-aab4e4029355	7d193fe5-df14-4b0c-8de5-ccf8e8125e34
e1680808-2448-41f0-a8c5-3c8bc3afc5ac	208c72eb-e5d0-4c58-8cf5-17aa6e7ff81d
e1680808-2448-41f0-a8c5-3c8bc3afc5ac	51a38071-f371-454d-a595-5ec3c55cf527
de9f7682-600c-4c1e-a3e6-cd186865f036	aa2a5d97-c82f-4cd4-a470-72c5be1ea664
de9f7682-600c-4c1e-a3e6-cd186865f036	3e56ce98-b988-40e0-8c21-1d8c65b625ce
de9f7682-600c-4c1e-a3e6-cd186865f036	8c445d31-d090-4ef5-a7ba-32b47e45cce8
e4909e63-f547-4693-8457-9b197b80bae5	9a90be36-8f12-461b-8eb0-d0b01bea9750
0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	5ec93d4c-366b-4468-8e69-32289dc38acb
c01e432c-eae7-44cf-99ff-7abe70484ddd	2bcae184-20bc-4f73-8286-cc5ffd0afdd5
c01e432c-eae7-44cf-99ff-7abe70484ddd	1d48c16b-b354-4e38-9370-475c5dcc1d31
c01e432c-eae7-44cf-99ff-7abe70484ddd	90b3abd2-8146-4c42-b933-ca06c6a0d8ea
c01e432c-eae7-44cf-99ff-7abe70484ddd	151f551e-69dd-4e57-8a70-1f19189cf821
ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	bc5c93b2-997c-4b7a-9288-4e9b342783f3
ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	6d69f875-5822-4eb4-ace2-72a0e274a9c5
ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	22575fec-6948-4721-ab34-b9f1c252ae98
894ecf35-386b-40cc-8cf9-1735a26c293d	abd9b664-c5ed-4532-bed5-fc6ccfc60ac3
894ecf35-386b-40cc-8cf9-1735a26c293d	ab656d5e-1f46-4ddf-b66a-765592658dd2
ed17f7e9-ca19-4561-9274-047e68e535c8	88e0bdf5-9799-458d-8c97-8d08d2eb99f3
3c8adec9-ee5c-45a8-a7a2-90a427ab7517	1810a7ee-170c-4a18-8e7f-4029d770102f
\.


--
-- Data for Name: product_variant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_variant (id, created_at, updated_at, sku, product_id, color_id, size_id, price_id) FROM stdin;
c0b6298e-b559-47d5-9e83-adfa52244a1f	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HAE7E2EAF7/B/2XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	786e0284-676b-482a-8935-f3097daee584
01c12e23-2522-4cb3-93ba-477e77ee9331	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HAE3C24F67/B/XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	e45f5f14-e6fb-4019-9c6c-baf428c31126
61a3a536-2d53-4336-9625-0701e07a1708	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA541AC514/B/S	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	f75031a1-d8c6-471f-a9f0-be8a27568f4d
6bdfc185-76e7-42d7-9a08-9e91981e27b9	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HADCB16A93/B/M	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	eb057935-7a87-4bb1-9fd1-f4cc896fb6d7
d31c8d9c-f282-4d20-b8a1-c8696ee54482	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA8BFB83A8/B/L	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	7b4e4c5c-b895-4b76-a8c3-2f543191b81c
84ceef24-6a66-493c-b6be-d91205fd95ab	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA93D7AD48/B/XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	aac39a31-d220-4125-a7c6-eea4a8cbc1c8
8fe0f769-d722-4ec3-94c2-33d55e567e55	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA48772C3B/B/2XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	b0783646-7fbb-432c-a2ec-b6647d8ce4a3
7fd2f317-182d-44e7-92cd-2b0596edf0e7	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA98E9617B/G/2XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	0b287c5c-ebca-485d-b648-3eeeb26f4c74	a1ad485a-6856-4d67-bd6b-a8998ceef8b6
9ed67372-ce0a-4965-b1c8-75827f53b778	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA24D5A9A2/G/XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	53f83aa2-d618-4940-92b8-c3f66d6287f3
9782de77-d533-4d29-9812-d46e9c9c58fb	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HAC9E954D5/G/S	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e4bde26f-278a-4190-b6f1-a6687ebcf3f9
3159e54c-4343-4ad6-85fc-26bf65c2c3d5	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA527F5BAE/G/M	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	11d8186e-e30a-4105-93b2-cdb80151c7ab
6e476672-5e11-4bee-9768-eb19256120f3	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA99281256/G/L	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	5a0b5517-7c10-434f-a7e7-9de2297ac855
619b681e-cfea-40e9-b89e-8950b0618c8c	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HAE45E1BAB/G/XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	088521eb-e471-4da7-b534-3005aaafcfdc
6b95df1e-3597-4c08-899a-ad883e570a5a	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HADD5C6FF8/G/2XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	3c314204-70d9-414f-899f-11dac5eb6b12	2d7ed52d-ad40-4942-a107-88a4a3006e57	7dcd6305-f33c-4fe9-8478-6f0963a36aea
0e25f461-12a8-45f8-b6ba-0a7c39c8cb29	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA45C7848C/W/2XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	4886b648-aef8-43cd-89b0-f052791bb4bf
816ac2f8-6d69-4fa6-8551-4b58b2c33731	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA59DCFAD8/W/XS	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	747aeb35-dc56-4d04-8935-dca5eb0e611c
0710ebf2-8e7f-4f20-a318-92f48b7cedc5	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA4F2B7D72/W/S	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	fe68f156-3395-48ae-9fd1-97e2fbeeeb2b
e13a75d9-2463-464c-a59c-7c35d05a8494	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA9C42265D/W/M	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	a73a8df2-25f3-46c9-9751-2ce07486e85d
7c0cb1c5-0bdb-4020-aef1-403cf19876d1	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HACE5ACCCB/W/L	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	459e11ab-c507-434a-b23b-3642d41b43a5
1a3c0b15-ac9d-487e-9b38-2e660227e718	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HABEB14F72/W/XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	46aceb73-d527-4d2b-9219-a1d13666ef66
5278bd17-f8d0-4dbb-8756-6f76b50222bc	2023-06-14 09:05:28.827169	2023-06-14 09:05:28.827169	HD-HA83FDC2C1/W/2XL	9f6bea20-bbd2-43db-bc89-4e2b32fae406	e8f39507-8e79-41ff-9f74-890067a6d468	2d7ed52d-ad40-4942-a107-88a4a3006e57	43d9d42a-5bb6-4b9c-b131-62c0d609d91d
dd319b71-80ef-4037-88ad-778f5a14d8a9	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HAF7654395/G/S	64ba5389-494f-45a0-abb9-691e3d6ce763	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	3211f67d-44bc-4f36-86d8-a1be237d26ba
318853fe-c574-4617-816a-7e17de901d0d	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HAC358EC2B/G/M	64ba5389-494f-45a0-abb9-691e3d6ce763	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	117ec92b-e488-448d-902d-abf5a69d3e5b
b6f3c553-5f22-4ea8-844c-2cdb532cc437	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HADABF39E4/G/L	64ba5389-494f-45a0-abb9-691e3d6ce763	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	5193cbb6-223a-4168-bab7-a730b5e542ed
69609421-e10a-4392-ac70-cce8bcc98e93	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HAF1BB37A7/G/XL	64ba5389-494f-45a0-abb9-691e3d6ce763	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	eb7718f5-fe4b-48e1-959c-1b5b87c31824
3b33ab57-e451-4c4e-a807-9be6d96f86f2	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HA45DEE6C6/B/S	64ba5389-494f-45a0-abb9-691e3d6ce763	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	836709b3-ba40-4bab-9076-5f0376300288
215c2058-7c46-4a1f-a18d-b990a9f98e0d	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HAE19C82ED/B/M	64ba5389-494f-45a0-abb9-691e3d6ce763	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	28ca5746-9bfd-4da5-9ad2-6474c64381f4
7de63bf0-6976-474f-87f9-debf79ac9c98	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HA6B2994BC/B/L	64ba5389-494f-45a0-abb9-691e3d6ce763	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	ae2d6078-c0ad-4ee1-9682-a29412e055c7
1526b265-cf7d-488a-80b7-bc57844f486c	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HA99C67DBC/B/XL	64ba5389-494f-45a0-abb9-691e3d6ce763	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	011d6d26-db7b-450a-97f5-c21d6aaaa5e1
17104ad6-1287-4f73-bf13-9d4ec79c43d4	2023-06-14 09:07:29.16045	2023-06-14 09:07:29.16045	HD-HA77F6425B/B/2XL	64ba5389-494f-45a0-abb9-691e3d6ce763	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	a2acc067-e0b2-4884-9035-639141c463b9
cb7ee2e2-d34e-462a-a001-f27bb361464f	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA98C2E976/B/S	611e9037-7498-4696-8688-8b6997816a74	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	073e4d6f-b9b5-4687-904d-53dcaaa41a46
a87945ef-e9bb-4f43-86c3-f581ec1f094a	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA2B4CE85E/B/M	611e9037-7498-4696-8688-8b6997816a74	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4f0dc916-ba13-4675-96af-6bdeb34114e5
e4400e10-317a-49d9-bb90-55c90ec48a08	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAE614526D/B/L	611e9037-7498-4696-8688-8b6997816a74	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	1d3532f2-4f38-4bab-a1f8-615629d927ae
c8f641d6-7fb2-41f9-8efa-f3f207d57ea4	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA7FDC76F2/B/XL	611e9037-7498-4696-8688-8b6997816a74	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	d191e02d-1e5c-4338-9fbf-db832d6f7634
dd987331-0b16-49ec-bfd9-2f53b4bac88e	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAFA478573/B/S	611e9037-7498-4696-8688-8b6997816a74	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2dc1b1c9-a708-4a56-98f4-511292698050
a4bd190e-0973-45bc-ba14-fc56f64dea1e	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA36AB913F/B/M	611e9037-7498-4696-8688-8b6997816a74	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	16f12047-d230-4a34-ade5-8fe2b16d17ea
d9fa12ce-33f4-43eb-8be8-300d7954c9c1	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HABC8C66F3/B/L	611e9037-7498-4696-8688-8b6997816a74	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	bc93aeef-9ecc-435a-b00c-617b45d47361
ef5a2780-0148-4dfd-8f01-1b7f1d232b49	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA8A7CDA41/B/XL	611e9037-7498-4696-8688-8b6997816a74	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	8766adc7-e4f3-4481-8059-2d3cdece0dd0
e0c0f7dd-cd3e-46d0-aa50-5e4a932f68b0	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAFA679218/P/S	611e9037-7498-4696-8688-8b6997816a74	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b2dfe444-463b-4ebb-a546-6d2340156de0
2dfc0ca2-ce3c-45a6-80d8-5184fcfb58fc	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAF237D3D7/P/M	611e9037-7498-4696-8688-8b6997816a74	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	ecb5030f-6fa1-4044-950d-25759a6e4979
afa449f7-9c86-4eae-a176-d3cf10dea2ac	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAC5BE5F2D/P/L	611e9037-7498-4696-8688-8b6997816a74	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	5145bfd7-20b9-4e3d-bd06-40067ccf077a
751b632d-e6db-4d42-9504-e0d170734396	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA913AEEE5/P/XL	611e9037-7498-4696-8688-8b6997816a74	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	15832db0-f810-421b-ac2c-952cbc2a485e
ae4432aa-bcfe-4809-b2a9-d1506eadc0e9	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAD5A6751C/P/S	611e9037-7498-4696-8688-8b6997816a74	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	908c1d90-55f0-473b-9ec1-a268ea95e44f
4594fd69-f2dc-4257-ae01-8f7fbee0ebc5	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAA2CD8164/P/M	611e9037-7498-4696-8688-8b6997816a74	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	cc586cab-b922-44e2-bf99-f271892c3278
5bc33850-9e33-4842-9661-b27b8ed0a246	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA78A37C53/P/L	611e9037-7498-4696-8688-8b6997816a74	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	f82defa6-0013-41a5-aaa2-2f303168c120
31d61d11-d01f-4326-9e56-fbf5be2352b1	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA93559696/P/XL	611e9037-7498-4696-8688-8b6997816a74	68c94815-02e1-43e5-9495-dc40cbd994f2	2ed55aba-1311-4e78-a262-2712ad7896a9	dbc10e65-00d1-4f6b-8f79-9bd902b9d418
f97fba7a-0811-4965-9a46-a22d4f55999b	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HAE46CA2E7/W/S	611e9037-7498-4696-8688-8b6997816a74	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6fc633c0-9a7e-466a-aad8-c12ca743b5a1
918e83d2-aaf7-47f2-b932-b34a47452d71	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA4EADFC25/W/M	611e9037-7498-4696-8688-8b6997816a74	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	dcc5a8e5-d2ce-4fd0-a936-6d0f3cc2f716
d32db56c-9b36-4fbe-a6cf-3ad1dbcf2bdd	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA3273BF4B/W/L	611e9037-7498-4696-8688-8b6997816a74	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	73713ad5-38f3-4779-8712-e04af975c34e
d2563efa-1b3a-45f5-aecd-2a89c3561d28	2023-06-14 09:28:34.282983	2023-06-14 09:28:34.282983	HD-HA11DEBA75/W/XL	611e9037-7498-4696-8688-8b6997816a74	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	ee5ac824-2522-46ae-8439-3d0f69c75211
07c4e5e9-5715-4043-9522-2f1f61f238c1	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA49EE8DD4/G/XS	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	400d6d9e-0c4f-436c-92d3-d62c3c34dcc4
3b8690ae-07a1-409c-ad8e-2f7cc03f6f02	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HAC8B9C46E/G/S	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8bde0116-b19c-4474-b1a2-34106fe3e1d1
ba5149c5-56e6-4e73-b058-50119b45110f	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA6A4C1B95/G/M	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2115af41-a25a-4526-adcf-a21d5a83dd11
e13f2b01-9df6-4b84-80ff-4611bbfea847	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA8A975ECE/G/L	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	ac5d3aa7-585d-48f6-a3da-3f0cf550f592
d150d884-11aa-4f62-94af-ca99bd26bc42	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA3767E628/G/XL	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	091a070e-3150-428b-928e-7d8ffc83f900
e8b58730-62bb-423d-b56c-2f61a949eea7	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA15DA2364/G/2XL	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	b737ebaa-7fcc-4636-85f7-1593875e4012
c9720c2a-0d29-4a26-9cdc-7cb362f9fdc7	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA85C5CFD6/P/XS	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	2743ae7e-9ecc-4ce5-a99b-b7e83dec6588
31f31955-677b-4059-8e2c-b97a6b420062	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA1CFCE55B/P/S	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6c34dedb-b4d6-4f68-86e6-1b479ba7dd1c
0f9be04d-fe7a-496f-82f6-73a3e366fdbd	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HAFB3BBDA8/P/M	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	bd61ebac-fb78-4dc7-98b6-0c3f0cc09522
f0881a81-9b54-4987-a7b3-534b6862fa14	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HAF1C57AEE/P/L	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	8293635c-7722-4912-8c79-cb01873a934a
132caf9f-7f31-4ec8-a8d7-2d16acdfc317	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HA7DE2CACE/P/XL	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	2ed55aba-1311-4e78-a262-2712ad7896a9	a8dfbbba-5930-429b-9a73-a971c73cb076
f1dbb727-5fd4-46d8-865f-7ea478746506	2023-06-14 09:30:00.469728	2023-06-14 09:30:00.469728	SH-HAAC15B9E3/P/2XL	840aa0e1-0d2d-48b6-ae67-9dd1bfc1a61c	68c94815-02e1-43e5-9495-dc40cbd994f2	2d7ed52d-ad40-4942-a107-88a4a3006e57	cbdb67b9-d06d-4352-8903-4cce707b2a40
5a874e51-768b-4a67-95b8-dc7a70e6018a	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HA3CE6A76B/B/XS	1e43d324-bdec-4247-acff-eea4af35beff	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	50fe868f-ae73-48f1-bb59-f0a13539a14d
77051650-e2ea-422c-be59-d97464a2b9c7	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HA9B2E917B/B/S	1e43d324-bdec-4247-acff-eea4af35beff	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	f13c97a9-03d8-4534-8bd7-1aef74ab84ae
7974912b-3e1c-414d-b045-bf4297dbd7d1	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HA2A8727D3/B/M	1e43d324-bdec-4247-acff-eea4af35beff	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	74c58253-db84-488b-830a-5361e1709d7e
5341bc73-2524-43e3-9904-0a63619ac349	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HAB93B3AE4/W/XS	1e43d324-bdec-4247-acff-eea4af35beff	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	eaf90ff3-e9a4-435b-b206-62e8f75507e1
749b39f9-ea4a-4d2a-b2bb-5974cb71dbb3	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HAE6EA5E24/W/S	1e43d324-bdec-4247-acff-eea4af35beff	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5b5bf9af-4af1-424b-ad92-1a93e56b95e9
403fa8fb-b580-4d72-9662-9671ec05ee9b	2023-06-14 09:30:56.843638	2023-06-14 09:30:56.843638	SH-HA9476D6AA/W/M	1e43d324-bdec-4247-acff-eea4af35beff	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	d974e6c0-0a7d-495c-a67b-16c116ca4232
b19adbc1-e0fa-4481-b18e-d0582215b80b	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HACB4DB5A7/B/S	a9dcbd11-a664-44b8-b670-b65cffc1df36	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e70b0b57-a08d-4017-aebf-53b60ffb6ed9
d1f7aef6-268e-4b7c-8909-dfd6221e7177	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA6237ABBC/B/M	a9dcbd11-a664-44b8-b670-b65cffc1df36	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e3d0cb72-da03-4b7a-94e8-36f077d6433b
ac2bac82-2a1b-4871-887c-2ee49c6c69a2	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA55477AF2/B/L	a9dcbd11-a664-44b8-b670-b65cffc1df36	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	00d7be17-e1e7-4706-b18f-8bb154b0ab13
f5e07784-aafb-4dad-b436-e52069512747	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA17954B8F/B/XL	a9dcbd11-a664-44b8-b670-b65cffc1df36	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	22f9d8a9-206b-438d-abc6-034f7083288d
ff341211-ec80-4947-9641-c5d7fe2266ef	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA2FCE21AE/B/S	a9dcbd11-a664-44b8-b670-b65cffc1df36	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	73ea4486-a05d-4b7e-bf63-4927e4a8c471
1f5bab02-5928-4d2b-b8f2-a674289af864	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA62A78BED/B/M	a9dcbd11-a664-44b8-b670-b65cffc1df36	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c5d80af3-3e97-44ba-8045-01b66b7b5f35
2d20b1f2-da8b-4316-a3b5-7b0d00a3972c	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA2A967791/B/L	a9dcbd11-a664-44b8-b670-b65cffc1df36	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	4651088a-f2da-4063-9db5-37823182e6ed
ef71e5f8-92d0-446e-a830-0d2b72883d6d	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA563C5A8D/B/XL	a9dcbd11-a664-44b8-b670-b65cffc1df36	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	3d0f7fe6-3838-4d30-9ab4-3966b66b4a1e
480da89b-9903-4770-8be6-4d02640293e8	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HAC239637E/W/S	a9dcbd11-a664-44b8-b670-b65cffc1df36	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d1331918-b317-4afd-b648-2c03d1d30032
f45735d9-f834-40dd-b2e7-acbe0e173da6	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HA87796C3E/W/M	a9dcbd11-a664-44b8-b670-b65cffc1df36	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	8d3af3b9-e900-4198-a655-4ba5b15f822e
ef18a3b8-0106-431b-97a1-b7f2c1461d12	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HAC1DD2AE8/W/L	a9dcbd11-a664-44b8-b670-b65cffc1df36	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	1173c055-b585-47f3-80b1-ad62ef4ca2f8
68d5bfaf-7a32-42e2-a1c0-615a1e78941f	2023-06-14 09:32:07.17153	2023-06-14 09:32:07.17153	SH-HAB5484B7F/W/XL	a9dcbd11-a664-44b8-b670-b65cffc1df36	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	c74397f5-1e27-4e67-b824-8048a896e9a4
c16f6519-12a4-464a-98de-b1e89a71d527	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HA349BAA1C/B/XS	d4600980-2b88-47fd-9db4-367bc55a3308	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	b5d2b561-05b3-4152-b3b4-41e985a93d3a
87fe41ef-85a1-4fe0-a5cd-ce3736d6642f	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HA19B9A9ED/B/S	d4600980-2b88-47fd-9db4-367bc55a3308	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	574ed756-5506-456b-812e-d350ed384dbc
e7f04f42-0560-4e96-a283-e5f5ca474fc7	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HA4A14A88A/B/M	d4600980-2b88-47fd-9db4-367bc55a3308	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	d718b592-d693-4fa7-bfeb-54422b8747d1
014aa062-9760-4226-bdeb-301cbcf5d6de	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HA2C413527/B/L	d4600980-2b88-47fd-9db4-367bc55a3308	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	f0538c45-650c-4f1a-873d-dd013bbff7f3
9277b122-1a88-4191-bd53-8767a9454255	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HAEA25124A/B/XL	d4600980-2b88-47fd-9db4-367bc55a3308	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	0b30e4a3-7836-4e41-a82d-5682b0612d83
1a34f187-4b03-46a0-a7b3-3727faa855ef	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HAAE5D9B32/B/XS	d4600980-2b88-47fd-9db4-367bc55a3308	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	3c1d1609-1046-45e8-b28f-192c614403b4
990124a8-91d9-48d7-ac7b-c27a713ffd88	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HAA7CF4DF9/B/S	d4600980-2b88-47fd-9db4-367bc55a3308	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b655ba9c-85a1-45b7-bf69-66849612a114
10e9b68f-d232-4d7f-92f2-23a3bfe73b1f	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HAD882CE7C/B/M	d4600980-2b88-47fd-9db4-367bc55a3308	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	b9de2c5a-5b57-4ac2-9cf0-e2d25e9511e7
04dd1edb-8e53-47cd-bd40-8abeaf280e9c	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HAFFBB2682/B/L	d4600980-2b88-47fd-9db4-367bc55a3308	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	9594605d-28db-42b6-ae29-136d8015b547
66e4be33-ac06-4bd8-af92-081ad5124d7b	2023-06-14 09:33:31.229736	2023-06-14 09:33:31.229736	BL-HA5AFE32A7/B/XL	d4600980-2b88-47fd-9db4-367bc55a3308	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	160ff0fb-2361-4770-8429-54fd7edb4018
f00aec06-d0e6-434d-9e1e-92f819e91898	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA329376AE/B/XS	3c59856c-9e30-464e-b753-ae63a0d8e75d	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	03ac3ff5-d477-4bc8-a17a-3691a4727158
8731d67d-9b0e-4a23-b63f-e253b6cdfc2a	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAA7677F2F/B/S	3c59856c-9e30-464e-b753-ae63a0d8e75d	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8fd3af0e-c662-4c95-8c2c-d0fa129171f5
89f96ff5-7dcb-4d0d-bc70-96a673944299	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA461F2CBE/B/M	3c59856c-9e30-464e-b753-ae63a0d8e75d	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4ba56c5f-cfd6-43d8-9df5-f65de29d876a
a301a57b-6a4c-4923-8b5b-b643d2548e37	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA8BDBEE29/B/L	3c59856c-9e30-464e-b753-ae63a0d8e75d	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	52034cf6-deec-4e08-a628-61fdbb8a643a
c2cc8a44-7b8f-4c3d-8cf5-d9481abb8330	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAFAFCB18F/B/XL	3c59856c-9e30-464e-b753-ae63a0d8e75d	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	41e5780d-de9b-43b3-8224-90f3f0b947aa
27f711b1-ec19-4cc5-9d93-fbbb29f18686	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA5347D5CF/B/XS	3c59856c-9e30-464e-b753-ae63a0d8e75d	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	e787c1a7-3b7e-45a5-b36d-80d0bd707690
ba1afaf7-a611-4814-8d20-4570e3f2d0b4	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA5E1BF3B7/B/S	3c59856c-9e30-464e-b753-ae63a0d8e75d	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	bce2fa53-fd97-47d8-a0cf-fb13cf638583
39313de0-0760-4aee-b2f2-091e5e18ac84	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAB963895F/B/M	3c59856c-9e30-464e-b753-ae63a0d8e75d	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	0ef466b9-843d-4c25-ac57-57408a8b847b
925d72ae-bd2c-405a-a5fb-69bda58d468e	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA24DC67CD/B/L	3c59856c-9e30-464e-b753-ae63a0d8e75d	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	68b9a355-35bb-494c-b387-3e94a32b1a2c
d004197d-e5a5-4ff8-9fa5-dd3cdc982441	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAB9F3B1CE/B/XL	3c59856c-9e30-464e-b753-ae63a0d8e75d	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	f2d0c279-e5ab-4317-917e-6cc22e3cc2a9
bfbb134f-196c-43fd-b025-5696b91c9448	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA83286F69/B/XS	3c59856c-9e30-464e-b753-ae63a0d8e75d	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	9c25cf1d-001a-4d76-92a1-e834af4bf919
cdec7ec2-4203-485c-85a9-09cfa2cff494	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA978996BE/B/S	3c59856c-9e30-464e-b753-ae63a0d8e75d	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	ba9418ee-063b-46bd-891f-a301385859ff
3e6608c6-6485-40dd-a3fe-80fb4e1817ca	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HA11845B4F/B/M	3c59856c-9e30-464e-b753-ae63a0d8e75d	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	80d5530e-404a-4e54-8cf4-df46da338cf9
1d4a75bb-5b95-4399-976a-330644b0c815	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAD1985FD6/B/L	3c59856c-9e30-464e-b753-ae63a0d8e75d	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	da726527-7f40-4c28-be77-1a065a6f78f1
b83e31ed-5a2c-47fe-949f-9d375ff64985	2023-06-14 09:41:39.123362	2023-06-14 09:41:39.123362	BL-HAE3E8E3AA/B/XL	3c59856c-9e30-464e-b753-ae63a0d8e75d	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	d8afb071-7680-49a1-a7d1-d5ee83cbd890
5f4b6e84-202d-43d6-9696-806df235f15b	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HA93123177/B/M	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c59355de-f0af-40d6-9c50-657fab4502c0
b6588b44-d9d9-4d51-98fb-4b2f796e035d	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HA22ED4799/B/L	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	9ab1296d-467c-48c1-8e6f-68ad6a5f4d44
d7c164fc-4b63-4fa0-a353-5d004efd48b8	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HA3E419366/B/S	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2bb89963-5a4a-4c77-a4a4-246569b12f47
f6298c80-8cb8-4634-aa0d-00666c288409	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HAD9EE716F/B/M	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	09f1dfaf-0bbd-4e72-b4ac-51c7a10a19d7
bf5e1984-2728-4039-944b-047a583b01fc	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HA86AB1166/B/L	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	605c1627-c445-4629-9782-e2ab0e95c70a
84531568-b6e7-460e-81a8-b1e26f570651	2023-06-14 10:39:29.01556	2023-06-14 10:39:29.01556	BL-HAF799949F/B/S	a5703a54-782a-4e59-9ac3-3a4eac93c4cc	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d4bbf43b-8c96-45a3-af7d-324490ec0e64
5b3d92ff-acd8-45a3-987d-c99b54ec9fd8	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HADD64BCBB/B/2XS	62f17240-a3f4-472e-ba06-205de4cad742	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	0d5726e6-5cf5-4917-869f-fde4dafe5c74
e7b2f4a7-fc6c-477d-9d46-edcdf5ce9abb	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA1A24719C/B/XS	62f17240-a3f4-472e-ba06-205de4cad742	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	9a106b24-1ccf-47f0-9581-5e0c030ec0ed
6fddf2b6-4b85-4b4c-85f6-6abc8707345d	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA41A2322C/B/S	62f17240-a3f4-472e-ba06-205de4cad742	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	35e5f02b-b797-4457-a897-64e0092983de
5f46b1ae-f556-4699-b21c-4a4e8f1b87d1	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA43E81623/B/M	62f17240-a3f4-472e-ba06-205de4cad742	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	42385368-711b-415e-a4c0-e6bb9c06eb6e
eb893924-f18d-4ee9-a5ff-d783e735b8b8	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAD1EC23AB/G/2XS	62f17240-a3f4-472e-ba06-205de4cad742	3c314204-70d9-414f-899f-11dac5eb6b12	0b287c5c-ebca-485d-b648-3eeeb26f4c74	848d0dc7-b731-40f2-a051-c5071d4e5eaf
8a61524c-0823-42e7-a5d9-3a87ff913572	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAA929F468/G/XS	62f17240-a3f4-472e-ba06-205de4cad742	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	f619460c-f1ca-42e5-91ee-73871e506c81
ea3f3e91-4c31-47bf-9d19-7a7c505ffc80	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA463D6B32/G/S	62f17240-a3f4-472e-ba06-205de4cad742	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7c762833-438d-4c22-baa7-0b5ac30edf51
d6e86f2b-4e13-4270-bee8-f4937fb52436	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA55568F6B/G/M	62f17240-a3f4-472e-ba06-205de4cad742	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	a752eee2-c9c7-48de-837f-289cf2492568
cfaca2c7-7fd9-4e4d-abc2-5b23116eb97f	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAD8DF38D8/O/2XS	62f17240-a3f4-472e-ba06-205de4cad742	1f96fa55-5c94-44b7-8069-764dcf8f947a	0b287c5c-ebca-485d-b648-3eeeb26f4c74	7080c60b-4be7-4c6d-be15-22e708c9fce0
371d1bc3-3989-403f-8ecf-13492f2f876a	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA147AFB58/O/XS	62f17240-a3f4-472e-ba06-205de4cad742	1f96fa55-5c94-44b7-8069-764dcf8f947a	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	e6fbbe13-c465-419a-a2d1-585fc58660b8
9c807b9d-3e32-4e14-9570-189728f70241	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAC263BB33/O/S	62f17240-a3f4-472e-ba06-205de4cad742	1f96fa55-5c94-44b7-8069-764dcf8f947a	925dc306-1fee-4985-83ba-c3ffe1d6fa37	831c8254-7c2b-49da-b199-286422cc5d28
57719823-4646-437c-bad4-c018125a212e	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA968B9437/O/M	62f17240-a3f4-472e-ba06-205de4cad742	1f96fa55-5c94-44b7-8069-764dcf8f947a	f3a2b97e-1dba-4a7b-8067-f89e8400d227	5e74fb1a-2e2b-4704-8825-da77bb3141d1
437b7515-b327-4bb1-aa38-3e205bb68453	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAECD969B6/P/2XS	62f17240-a3f4-472e-ba06-205de4cad742	f16d53c0-7ece-435c-87d8-068186398eae	0b287c5c-ebca-485d-b648-3eeeb26f4c74	67dba2f3-080f-427d-a394-4a0f3199987f
03638e95-b6b5-4407-a3ff-0bacb02d30f3	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA76BC6F42/P/XS	62f17240-a3f4-472e-ba06-205de4cad742	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	f2f23c5a-95b2-4382-bed3-450069f22cd1
8d04a386-047b-49f1-be3b-890f1edb437b	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA221E1E93/P/S	62f17240-a3f4-472e-ba06-205de4cad742	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9ab2eb63-a8ca-4cba-8bcf-ec4a03873da5
915c142a-52dc-4a2b-860f-b245182d089e	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA3F72C2E6/P/M	62f17240-a3f4-472e-ba06-205de4cad742	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	12402883-2b1d-4f8a-aa3e-5ed59c6eb00a
927717ae-5225-4593-b320-3c001cba29be	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA6FA9D3F1/W/2XS	62f17240-a3f4-472e-ba06-205de4cad742	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	27a23216-89cd-4283-9b3a-3d8bb087d180
6a635aeb-b3d1-4c05-b868-18ed7957131a	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA3291D51E/W/XS	62f17240-a3f4-472e-ba06-205de4cad742	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d11e9c84-b0a9-4263-acda-f439005e965d
b330fe59-42ed-42c6-b440-fda3c14bbc38	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HA3CC7E999/W/S	62f17240-a3f4-472e-ba06-205de4cad742	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	068edee9-38d0-4b2d-941c-ee4c74bb0a74
8be4b795-40bd-45c3-bd3e-6f9d97dbeda8	2023-06-14 10:40:46.972141	2023-06-14 10:40:46.972141	DR-HAF822B641/W/M	62f17240-a3f4-472e-ba06-205de4cad742	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e87ebdaf-3068-42f9-97a0-823b1d95a687
78e8d05f-3439-46d9-881b-1c6dbaf28d9a	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA81F72EBC/G/2XS	06e6feb1-bba0-492e-acdf-d3a664be350e	3c314204-70d9-414f-899f-11dac5eb6b12	0b287c5c-ebca-485d-b648-3eeeb26f4c74	eabe38a7-924b-48be-b0b1-e9139000df8c
58b15cd2-b013-4de1-85e2-4c8919e3103d	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA352B521C/G/XS	06e6feb1-bba0-492e-acdf-d3a664be350e	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	a2aafa01-41ca-4dd7-bb56-dc46d8455251
db68b5a7-431d-43b4-85ea-7e1bce2e8739	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HAA89749B1/G/S	06e6feb1-bba0-492e-acdf-d3a664be350e	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	44ec7a97-a2e6-4ad9-8b82-cacfc5f5ebae
27bbc5bb-02a3-465a-82a6-5340a6fcadc7	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA363933F3/G/M	06e6feb1-bba0-492e-acdf-d3a664be350e	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	b4a36af5-70b1-42bc-bb5c-18e42c74f3ec
66db18ee-7419-419c-8937-be4906aa4eb4	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA423EC22D/B/2XS	06e6feb1-bba0-492e-acdf-d3a664be350e	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	c2dc77d3-7708-48c6-a2c8-703a4c3b2580
4ca3c26e-5ca1-4ebf-a7c9-3ed50ff24a01	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA1C64CB99/B/XS	06e6feb1-bba0-492e-acdf-d3a664be350e	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	496bd2f9-37dd-4ebc-ba32-c3ab2fa503ab
e88dfad9-229c-4d2c-8fda-3c0cb727ede6	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HAE5354187/B/S	06e6feb1-bba0-492e-acdf-d3a664be350e	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6f96777c-ad40-48c4-9bfb-87820e0d5f9c
a2df3e30-a4ef-4e37-b5c4-4d0e37bd9b83	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA4162CD74/B/M	06e6feb1-bba0-492e-acdf-d3a664be350e	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6a3e3984-50ba-43be-bcfa-b604b3d68174
3b1c880d-9418-4480-83e0-16ecd46aab77	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA7A5CD8CC/B/2XS	06e6feb1-bba0-492e-acdf-d3a664be350e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	0b287c5c-ebca-485d-b648-3eeeb26f4c74	b572e313-8ca2-48ec-a639-3541714f720c
7fc06404-e7e1-43d8-a3a5-0553630d35c2	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HAC926B114/B/XS	06e6feb1-bba0-492e-acdf-d3a664be350e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	094727e4-c60d-4518-8e8d-3e7b94cc8461
1976c033-0a3b-4eff-91a0-3e2c5e64fca1	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA5C57FA1B/B/S	06e6feb1-bba0-492e-acdf-d3a664be350e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9668330d-9b28-42cb-a013-49c40ceb28b3
4608b309-fd6e-4c75-a700-491f9b62eb3a	2023-06-14 10:42:02.938683	2023-06-14 10:42:02.938683	DR-HA13488C2D/B/M	06e6feb1-bba0-492e-acdf-d3a664be350e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	23a9426d-6abb-48b5-942e-a7b36316805a
ecf7bd76-aea4-4817-964c-3973495bddd7	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA4AD48DE5/B/2XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	f5b9ac7f-246a-4e5d-b59c-5c68ca79ae7e
c52701a0-4c85-4c7e-92ab-712f7e8cc760	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAD9E2D75D/B/XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0866618a-aa54-4a7c-af4e-dd7649f574b0
2135855a-af35-46ef-858e-4665c1c67ae5	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAD996F51C/B/S	ea6eeabe-25df-4250-a9dd-3a0ad9606480	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	783d7b54-1376-46ab-9f5d-99dec6f68f1d
8a39e12e-b831-40ec-9165-8c97e155e363	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAC6CABAE8/B/M	ea6eeabe-25df-4250-a9dd-3a0ad9606480	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	9e2a4946-b40a-448a-a975-ab2daede697a
1bc6019d-0862-4b0a-ab5f-e8e4125e24c1	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA6C8446F5/B/L	ea6eeabe-25df-4250-a9dd-3a0ad9606480	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	c8e4499b-9d41-4f10-8dda-d5ca93a8e735
9586bbb9-3889-420a-9be0-c3032503cb75	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA13AF28E1/P/2XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	f16d53c0-7ece-435c-87d8-068186398eae	0b287c5c-ebca-485d-b648-3eeeb26f4c74	224cf4b1-39f9-4a2d-b346-bed7f7aa82fd
10db35d0-f7b7-4895-abfb-beafe15bb153	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA3E9D8C52/P/XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	5d1fa421-a8eb-4b92-b263-d78905578cac
a4a6d6a3-6b1b-4af9-af0a-57f4880b2522	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAC7B54C43/P/S	ea6eeabe-25df-4250-a9dd-3a0ad9606480	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	ab075138-a46f-449e-89ab-c363ab350263
cd009330-a310-433d-8c50-2f0e7b114b92	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA3EAD8AE5/P/M	ea6eeabe-25df-4250-a9dd-3a0ad9606480	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	665a16be-a6fc-4ff2-a845-fe9a8bbc7268
873c58e0-f3c3-460a-9e8e-6088709a9d13	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA7665953A/P/L	ea6eeabe-25df-4250-a9dd-3a0ad9606480	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	f3c4f242-e40e-439d-93d6-70222f7a0f10
87d440fe-e46a-4b2d-909b-19c713a99cd6	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA5F8EB1C8/P/2XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	68c94815-02e1-43e5-9495-dc40cbd994f2	0b287c5c-ebca-485d-b648-3eeeb26f4c74	c3b758ea-c936-4518-be72-9c1fbe3e6acd
08b3dfe1-c14f-44c4-82f4-700f4f0536fc	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAAEDC4648/P/XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	68c94815-02e1-43e5-9495-dc40cbd994f2	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	f59c1f10-f10e-413a-afe9-5a1b68dea922
dcc83263-fd41-4be9-99e6-c8cd03650bb6	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA2C62241B/P/S	ea6eeabe-25df-4250-a9dd-3a0ad9606480	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b4d232b8-8ca8-405e-8861-82739acff84e
767d92df-a003-4e6f-a4d4-959c7c826a08	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA1381AB96/P/M	ea6eeabe-25df-4250-a9dd-3a0ad9606480	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	1dedf450-a3c0-46a7-9bc8-b52b6280627d
a5f242f9-a43a-4e6f-91bd-1b40ce2ad405	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA86716D8B/P/L	ea6eeabe-25df-4250-a9dd-3a0ad9606480	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	296171be-fafb-4407-9261-a060f144f3e3
8c3c0b49-0008-4ea5-bd08-3c9548519e77	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA4D918CA9/W/2XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	639feef3-554b-41e3-9787-eed35a2d0c6f
cc742c3b-6962-47c4-a326-a5e6d220857d	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA9E4E37AC/W/XS	ea6eeabe-25df-4250-a9dd-3a0ad9606480	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	28276703-9db1-4dd8-be2a-1c4f17331a46
fcf44527-3939-4347-b1b1-043231fe766a	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA5967D959/W/S	ea6eeabe-25df-4250-a9dd-3a0ad9606480	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	17755f4f-ad42-4b40-b6fa-f263801b9687
785b8d44-758c-4134-b127-889fda70039b	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HAB2A4E8D4/W/M	ea6eeabe-25df-4250-a9dd-3a0ad9606480	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	813e7c1b-4ec7-46ca-be88-779b0102138f
5d8b9b99-59c5-4d17-a6eb-46117b070ee5	2023-06-14 10:43:33.308278	2023-06-14 10:43:33.308278	DR-HA96C6472A/W/L	ea6eeabe-25df-4250-a9dd-3a0ad9606480	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	9a6792b5-68e6-4363-bd0e-1a3020982a78
5fa39f08-8f97-42c2-9096-c75a655e4a6c	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HAB77FD434/B/S	503710a0-09b0-4732-b329-56c5ab449e00	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	cdc09a72-5a65-430f-81ca-fcac4baf4180
47626bc9-f832-4881-aabc-b015cd049dcd	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HABF3FCB9C/B/M	503710a0-09b0-4732-b329-56c5ab449e00	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	edb752a7-4d6a-4ecb-a616-86a00f62ff73
53917a97-2725-40d1-aab9-c10733b517ba	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HA969D2972/B/L	503710a0-09b0-4732-b329-56c5ab449e00	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	87e52fde-f4e3-4f97-87c4-0052898fb475
dfe47615-d946-44cf-9983-b2d5aee7bfde	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HAF6E91D3C/B/S	503710a0-09b0-4732-b329-56c5ab449e00	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	25a398e9-720f-422b-85fa-a43764fdc36d
e9875f9f-c5d8-49ea-9c5f-0c0b73585b6d	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HA82D9AA7A/B/M	503710a0-09b0-4732-b329-56c5ab449e00	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e5c20f91-67ba-4cc2-b22b-b6599134f8db
69e846f7-15bd-40b0-8c94-ce050c6c8f0d	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HAB59CB84A/B/L	503710a0-09b0-4732-b329-56c5ab449e00	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	3c221055-395a-4e16-a1b2-cc3089b7631e
6156cbd1-4fa8-452f-b014-2509f04596dd	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HA973245F3/G/S	503710a0-09b0-4732-b329-56c5ab449e00	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5ce4c3f1-ac11-46cc-a485-73f5fbf54907
6d3333d2-3946-4856-a0ce-45105a05394d	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HA8F72A2ED/G/M	503710a0-09b0-4732-b329-56c5ab449e00	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	ae8d6f8f-1c15-48b9-be98-c451bb87c1a5
85ea8bff-35d0-4b40-afeb-8b9506130633	2023-06-14 10:44:29.303072	2023-06-14 10:44:29.303072	SH-HA216AFB66/G/L	503710a0-09b0-4732-b329-56c5ab449e00	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	3e26d3b3-c418-48b3-9e21-680d2710b5fb
1b8c2648-ca5e-44c8-98a3-e31c1af6e1a4	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HAA4DCC4A2/B/S	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	19e5b1e7-d4b8-4525-8fa4-bd2d9975f829
5d5987fb-a226-4e15-b233-104b1be3fec3	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA39E9A1D1/B/XS	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	1ea3019c-5951-4da3-9b0e-2839da3ce783
9307337d-beae-4ff6-8557-71939e62a49a	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA6EBB537C/B/M	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c55364ac-4cbb-43e4-a9b0-834cb90cd8c0
53a09e56-32f7-4a3e-9f3c-223b50b936a8	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA4BE2C4CC/B/S	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8ccf1af8-bcd5-4688-9042-c57e34e17c55
57fc617b-8a38-49bd-a6b6-4ed82434a446	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA835213BB/B/XS	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	91302c36-f7be-4b74-b558-0dacd41e11eb
2a38d89b-1b4e-4069-952d-c420ae9cedb6	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA5429D8EF/B/M	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e26041b1-1297-482f-9c7b-de09d861dda6
4bf1a77b-88bb-4c14-a1d3-757d05805382	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HAE5D2113A/B/S	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8e6b6648-93cb-4143-aed8-afde963cfaca
9383b337-fedc-4ed7-8d77-d56ec23358bf	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA6FE6223D/B/XS	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0731772b-8d9f-4a4e-bde0-dc3ffc2ba578
38d9171a-1b8e-4341-880b-b27335d4dda7	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA94B7ACEC/B/M	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	42c7b32a-ec6e-49ab-8bb2-2449d33fa287
d1df4f79-628e-435f-8f09-4a1ae49eb48b	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA2611E263/G/S	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7e2de07e-f51e-4e9c-861e-67a32a633d58
38615d41-58ac-4c06-8aa9-ce95d88a5bd6	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA41853A87/G/XS	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0dde7e4a-e26e-4db8-91b5-6b5ccbd68812
e7e443f8-b62d-4e74-be69-18ee3dc0c849	2023-06-14 10:45:32.519661	2023-06-14 10:45:32.519661	SH-HA4C3659DC/G/M	cb17b7fc-3fd0-4f7d-b681-98a2fcedbda3	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	5d6a5177-8406-41d0-aee6-35d4f7033fad
0bfbd6ba-50d2-437b-8a36-a79014ccb05d	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HA85526397/B/S	85274b42-6f1f-475f-b9b5-9ceb0b837720	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6fa2f1af-bcd7-4d8f-9fb5-f8f933622d9b
90bcb2b3-693a-4919-a640-6f834a90bbcd	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HACF28C1B8/B/M	85274b42-6f1f-475f-b9b5-9ceb0b837720	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	999cd0ee-f757-4e6b-b1ec-ea726c692e76
06f39711-dab6-4bef-bfe9-35277bee411d	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HA38FCF82E/B/L	85274b42-6f1f-475f-b9b5-9ceb0b837720	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	6d4f4192-0fbd-478a-98db-9fd0e7b42f5c
56bf82ec-0c14-4c7a-b7e2-df2ffc42bfbb	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HADA7624C7/B/XS	85274b42-6f1f-475f-b9b5-9ceb0b837720	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	bf668f35-87f9-457d-81f3-c7e26305bd87
a8caf3b5-7e1b-4e4a-b203-f7b707565ec7	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HA8B81CB12/Y/S	85274b42-6f1f-475f-b9b5-9ceb0b837720	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8ac63c78-9191-4b4d-b08a-ce55ec9fe474
f45dfb6b-a148-4fe8-a785-176d32918dcb	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HAB22F4DFC/Y/M	85274b42-6f1f-475f-b9b5-9ceb0b837720	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4d18ce30-ce73-41ad-ba0b-17d99c3132b9
a9ce6d66-e51d-40e2-a6d2-9842b47408b8	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HA7912569E/Y/L	85274b42-6f1f-475f-b9b5-9ceb0b837720	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	def52206-45aa-48b9-bb32-9f05c45e7461	2a2af861-51a5-4b5b-914f-79d5d0b71bdc
bfdadc35-ae10-435f-90d8-7ed72ba8c2a2	2023-06-14 10:46:14.636344	2023-06-14 10:46:14.636344	SH-HA91CD2432/Y/XS	85274b42-6f1f-475f-b9b5-9ceb0b837720	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	09524fcc-6430-4b53-81b8-f14d1e016c99
defe5ad4-4154-436a-aee0-e075dc8c27fa	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA7AAA1A32/G/XS	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	01f05a30-d73c-43b6-99a2-1154648cc911
923373e6-cd1b-4c38-9bd6-a2be18ab0053	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HACDA5152A/G/S	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	28f86682-eb41-4688-bc1d-a404ecdf5d79
6b8c0d82-bab0-409e-9180-b212b65566d4	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA81FA8DC2/G/M	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	1bd92e28-dd9c-4f47-bd11-bf223a60daf3
4735282b-0cf7-43c0-acea-b72cb5a43338	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA6ADDD1F4/G/L	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	8f4ff1c6-82d1-49b5-8cbc-991305a81f7b
46e7e865-aa1c-451e-86e2-c46da6cb05d9	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA98353764/G/XL	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	afcc3c6c-6c68-4cca-820f-7deacee2ee53
580032dc-c239-44da-8bc2-d2f8cc0cc816	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HAE5CDA3AB/G/2XL	1c2956c8-4808-453a-b2e6-f546cc8435aa	3c314204-70d9-414f-899f-11dac5eb6b12	2d7ed52d-ad40-4942-a107-88a4a3006e57	d6cbd7ab-78bc-4ae0-8557-39c4e3cde405
9f7a602d-4567-4d70-a372-91b0088e9ffe	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HAA445ECE8/P/XS	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	88c4cb34-aeab-4836-8df4-eb07a5cfdb92
76870b55-fd3b-46ea-9129-d38def18e7f6	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HAE83D9928/P/S	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5a710bee-1fa9-4432-8132-5c0cc7eb0acc
e28845cf-4026-4642-be1e-f9d8f790d346	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA6914F653/P/M	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	70c1fb0f-3810-4d1e-b502-241b48004ee4
58cd3d82-fa96-469e-ba77-46a8618fb60e	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA45E55FAB/P/L	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	4755be59-3397-4099-a119-f62b508de18b
520dfa18-82c2-41bd-9a50-140ebeeac7ab	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HA5C34285B/P/XL	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	2ed55aba-1311-4e78-a262-2712ad7896a9	ae78ba1c-12fd-40db-83ac-fd4d487f452f
df429d0d-2c19-4858-adb3-c10309040ba9	2023-06-14 10:47:01.409575	2023-06-14 10:47:01.409575	SL-HAA18459BB/P/2XL	1c2956c8-4808-453a-b2e6-f546cc8435aa	68c94815-02e1-43e5-9495-dc40cbd994f2	2d7ed52d-ad40-4942-a107-88a4a3006e57	0421d34f-8ce6-4204-8de4-8ad4a8e19b80
ba715ad8-9880-44b4-8f74-cc32c46edeb5	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HACEE1BAD3/B/XS	43adcae7-93b6-4894-85f4-c006d820769b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	1f468fb3-74f8-4ad1-8f4e-32bb7559ef87
bf6b6ecf-2158-462e-bffd-e12763a2adde	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA5AA98EB3/B/S	43adcae7-93b6-4894-85f4-c006d820769b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7fd01069-37c3-4332-95a8-f9ab43a76e75
30e8574d-e792-4e89-b6e1-60b991009d3d	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA71AFB7E2/B/M	43adcae7-93b6-4894-85f4-c006d820769b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e1f4efdd-a2e4-4792-81a6-04bc8f7ec757
4750fdb6-2efd-464f-b47c-7733721ad215	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HAEBFC8294/B/L	43adcae7-93b6-4894-85f4-c006d820769b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	e559d97b-eb50-4372-8924-d9af690db9a7
f4e6dcc7-0cc5-4a49-b91f-f90354afbff8	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA52F6F39F/B/XL	43adcae7-93b6-4894-85f4-c006d820769b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	eb81f83e-88fd-498b-ba18-fa7becd59e5b
ff3a5ee5-1df6-4be9-aff4-4171234b0022	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA1EC4E434/G/XS	43adcae7-93b6-4894-85f4-c006d820769b	b768b2b3-5576-4e50-b317-6243d69453fb	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	23d794df-917b-4e25-8072-759bfa1b3503
5c2d07dd-e170-4c6f-89d6-d2608583dae8	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA3EB37B18/G/S	43adcae7-93b6-4894-85f4-c006d820769b	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8c8a898e-dfb2-492d-87b0-f52e92bb3e4d
aa8a6ce6-d93d-49c7-a493-ed957293a688	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HA4F329271/G/M	43adcae7-93b6-4894-85f4-c006d820769b	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	d2e494ec-73e0-41d2-9612-4b931b7eb391
45d2fbb9-c774-4752-b63e-fa30da87ac66	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HACD75753E/G/L	43adcae7-93b6-4894-85f4-c006d820769b	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	de682e24-b3eb-43b2-a944-b8026343d399
94504cfd-9497-470d-b2ec-dc90eb453889	2023-06-14 10:47:45.673908	2023-06-14 10:47:45.673908	SL-HADB28B3F2/G/XL	43adcae7-93b6-4894-85f4-c006d820769b	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	2c22567b-18ba-4511-88e2-32c846ead2f3
89e98b6c-9c4d-46fa-a5ee-69f2df5187a0	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	SL-HA32B91685/B/XS	595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	1b4b240a-f1f0-4617-8b6e-77d2fd87fe9d
1704d156-f51b-475a-8b2e-20b36fdd337f	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	SL-HAFAC9427D/B/S	595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8c364aa9-72de-4b5d-97d2-a23b4efcd97d
6adcd9e5-8c5c-41a8-9221-ecf6f5aab8e1	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	SL-HA7E483A17/B/M	595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	b64d1113-f74c-41da-be82-4a7c843c02af
f5ea54df-25bc-4a69-86d6-5b2fef2438ee	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	SL-HA89247BCF/B/L	595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	4549210e-7f5e-4e25-a220-98fbcc237b25
d27326cf-0eb1-486e-8bff-4c6776cd9465	2023-06-14 10:48:25.371949	2023-06-14 10:48:25.371949	SL-HA8B36F52E/B/XL	595ab7b8-2c74-4e35-98af-a9ae8cf8e3fe	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	0260dfa8-a429-4ca0-80a1-83af04609031
e32410ad-23b9-4679-8566-7e7677f9a6ed	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MAF43FE6AF/B/S	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	c340b02e-1e7d-4653-b0e4-ddd8b89aa0e7
fbc67359-6181-4832-b221-09d4e1f00cc7	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MA133D7F77/B/M	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	0abe654e-0d19-424b-83f1-2cb9f2e6d6b0
2b148c10-f5c7-496d-b801-35bff99640b8	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MADDA82167/B/L	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	34f9ed73-1171-4389-86e9-79f4df80908a
0145b9c5-30c9-4bb9-b962-3069e40befe1	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MA9DBE27D4/B/XL	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	c238c63d-1aa7-4eff-97c0-6ae7ffda1606
b4a46924-7fb5-4c3c-a891-87b2e3ae7081	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MACD64BE6A/B/2XL	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	2a99d29b-7f1b-4c03-8c99-1dd51555e417
b2ce3dcb-4251-4656-8b8a-ecba1e5eba05	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MABABC2C1A/G/S	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d7a818a5-3555-4eb0-aa63-c0cf5494e797
0ab058d1-eeb2-4b08-a13e-8f261c644433	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MA579C5696/G/M	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	35ef1b0b-2183-4a35-8d41-aa484d65651c
29dc19a2-4962-448d-b576-28cca4b9e588	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MAF8511382/G/L	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	b0d46e3f-175b-4c8e-86f0-eac1d0e28616
11b3c664-56b2-41fd-888a-4844143f910c	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MA79C814E7/G/XL	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	22987785-ce28-4a87-aa79-d73ea5ef34bf
ef3cd368-e7e1-4226-87cd-a900782bdd44	2023-06-14 10:50:02.545682	2023-06-14 10:50:02.545682	BL-MA1962856E/G/2XL	8dfd5af9-68d2-483f-be7b-d3b53f6c2f43	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	221c85e4-e264-4be9-983b-e240512f43a7
5b03c5ab-d636-495e-85b0-00cf2a5d013f	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MAFB156CAC/B/XS	b3888a76-a491-48c0-9383-784242ab4199	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	982b7e3d-6e73-4ac7-81bb-a5d58b0f9eba
3793f5b5-d208-4f7d-8bda-54010765a146	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA244643B1/B/S	b3888a76-a491-48c0-9383-784242ab4199	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8b1a8d43-9579-4f1c-bb8f-e4daa5737aa5
c2675a47-d808-494b-8fd6-72abdd67495f	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA9C4D371F/B/M	b3888a76-a491-48c0-9383-784242ab4199	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	468458c1-2cf9-4168-94ec-2af1a444481e
ac5ceee8-867b-4efb-a4ca-e636551c404f	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MAB4A5DD53/B/L	b3888a76-a491-48c0-9383-784242ab4199	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	c218e4bd-fe1f-4b6f-850b-bee250914282
950d413e-2d7a-4aa8-86ba-beef2c649193	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MADFA92BEA/B/XL	b3888a76-a491-48c0-9383-784242ab4199	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	217cf3e6-7cd8-44a7-b5fe-30631786c909
a8420641-2d39-4b30-a5f0-74e59c34ab8d	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MAC23667E2/B/XS	b3888a76-a491-48c0-9383-784242ab4199	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	76e33302-ca59-4c81-b2d8-304c84b87657
cc67fddc-7315-496d-a585-50afb16665f0	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA584BE9AC/B/S	b3888a76-a491-48c0-9383-784242ab4199	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5cf9221f-1c86-4cd1-8705-065c36620ea5
41c142f6-ebea-4ae4-9694-e56f9c805d38	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA97F92658/B/M	b3888a76-a491-48c0-9383-784242ab4199	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	f70f13fe-2eff-4d93-869b-7bdf35bc906b
c3bf9e22-8920-4ff4-a630-987d27062d8c	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA7EE52697/B/L	b3888a76-a491-48c0-9383-784242ab4199	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	be6c73c9-cd3a-4b59-9ad9-133cf0fed9bc
6bdd0121-3ace-4af2-946a-52fe5a2be624	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MAC7698716/B/XL	b3888a76-a491-48c0-9383-784242ab4199	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2ed55aba-1311-4e78-a262-2712ad7896a9	c33c06a8-a2e3-47cb-8ae8-c78029adbb89
49208f19-87d4-48a6-b287-e6fbad844619	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MACC6E21A6/W/XS	b3888a76-a491-48c0-9383-784242ab4199	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	ec0392f2-481d-4749-a9b2-6e081c66778f
7e70af5a-0fb5-4fdb-9fbf-99ecb6462212	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MAFF6DE3C6/W/S	b3888a76-a491-48c0-9383-784242ab4199	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	29bffb72-dc43-4758-a9a1-d5e3fac101db
c15679ae-7024-45e5-b9f8-55546b6a4592	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MADCA52A8A/W/M	b3888a76-a491-48c0-9383-784242ab4199	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	53da0a09-42d6-4248-8f41-af10a8d1f08c
c4a79afb-9f5f-4004-8940-9ecf4fe4d266	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA7D57F241/W/L	b3888a76-a491-48c0-9383-784242ab4199	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	3615e50d-b5c0-46f2-9127-bb95e184dee5
add2f465-dcfb-41b3-b367-ab5618d9f25e	2023-06-14 10:51:21.015229	2023-06-14 10:51:21.015229	BL-MA48FE96A4/W/XL	b3888a76-a491-48c0-9383-784242ab4199	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	43ba2493-fb7a-47d2-94b3-393ad63f6198
1a319790-dc88-41f2-8e12-b3ddb7cd62b3	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA7C987F96/B/XS	bc9a686e-17eb-4355-8721-07175dde489b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d40fc354-3620-4e32-92e9-fbda1e192bae
7dee9863-dfb3-4a44-8ee9-fea1b773dfc9	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA3B63128C/B/S	bc9a686e-17eb-4355-8721-07175dde489b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8b83ab71-a125-40d4-9863-a5dd1441bb27
55386a3b-c277-4536-aa3f-cbbb90742c36	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA33359AC4/B/M	bc9a686e-17eb-4355-8721-07175dde489b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	eaab4920-8d9c-451d-abba-0b815cb96f3f
cb1c292f-ec2c-4ff0-aedd-064783a9e698	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA9A121CFC/B/L	bc9a686e-17eb-4355-8721-07175dde489b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	7ff4714b-87b5-4181-9d6d-d82143598044
ac3cfdf9-3e34-4d8a-85a6-ac9cd17b9ab4	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA21F5D7D7/B/XL	bc9a686e-17eb-4355-8721-07175dde489b	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	32573edf-a5de-4e16-9920-1b9c602c7409
5facb40f-c8a6-4daa-b882-50d27d6c06d9	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MAEB2D9FBF/B/XS	bc9a686e-17eb-4355-8721-07175dde489b	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	1e1025b9-aa23-4adf-88b5-547c805a02d0
466c8475-3d83-4451-a5a6-5213f8902407	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MAC7BA1CB5/B/S	bc9a686e-17eb-4355-8721-07175dde489b	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7fc7fdeb-89b6-44fd-ad2a-37b3623da852
3c6f63ce-032a-4422-8a62-75ca82493981	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA3E8F7C75/B/M	bc9a686e-17eb-4355-8721-07175dde489b	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	f5a8716c-107d-4b55-b1c8-ab6e485f3318
bf42089a-4c59-4501-87b1-a519f0c7f0cc	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA9B85285B/B/L	bc9a686e-17eb-4355-8721-07175dde489b	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	382512a8-bad3-40e9-b9b2-996063fad68b
2ccec85a-987a-47c0-b621-187218db69ef	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MAA5E7DC55/B/XL	bc9a686e-17eb-4355-8721-07175dde489b	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	cad96977-8b2c-4763-b27b-62d10c42f7d5
58f3474f-cf04-495a-82c9-95d21006d59d	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MADE595B5A/B/XS	bc9a686e-17eb-4355-8721-07175dde489b	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	4011eae3-c6ff-425c-85fc-3b69b6b34f71
3b512bef-6471-4bea-8329-ebc85592ee32	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA984DDF34/B/S	bc9a686e-17eb-4355-8721-07175dde489b	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2b23254d-6ccf-48f3-9d39-b8f54f5cee49
542d8be5-dbcd-4a61-bbe7-a7a5c75dd6f8	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA9E7CFAB6/B/M	bc9a686e-17eb-4355-8721-07175dde489b	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	64685517-9d26-4c82-b2c6-8f8259432a68
6d8a4e46-d34c-4f19-bbc3-a6f4fc0195be	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA6B2BAF1A/B/L	bc9a686e-17eb-4355-8721-07175dde489b	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	4d677495-2d2c-4cfe-808f-348c20211c37
e26ad1fe-3c9f-44d0-85be-6c0fafe1b70d	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA3FA4C9C2/B/XL	bc9a686e-17eb-4355-8721-07175dde489b	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	bc905a21-52ad-4ec7-a49a-7f3c41ede16a
fa0c2504-0f3d-4910-a903-4539a004d9b5	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MAC95B7BF7/W/XS	bc9a686e-17eb-4355-8721-07175dde489b	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d1f18847-ec3b-4b53-8b5c-2ab0732a9b09
0e742277-16a2-42b0-8b53-c024ee4cffb8	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA91AB857E/W/S	bc9a686e-17eb-4355-8721-07175dde489b	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7b7720ae-e9b9-44bb-b052-4f1ed9f230cf
eb0eecdb-1dae-43a1-9531-216260f03160	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA87ECE4DD/W/M	bc9a686e-17eb-4355-8721-07175dde489b	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	7afe49f6-1bad-48af-82fb-4636a4256cf7
b854ab76-8b4e-4ebb-9699-7ebea2090b36	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA1B4982A8/W/L	bc9a686e-17eb-4355-8721-07175dde489b	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	0a61590e-fa28-47e3-bdfb-626c178fc942
be96d802-069d-4d31-b509-a6e5c8ebf414	2023-06-14 10:52:46.362259	2023-06-14 10:52:46.362259	JN-MA32E9CE87/W/XL	bc9a686e-17eb-4355-8721-07175dde489b	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	ae91162e-7be9-40a9-8dd7-bb5b579cbc21
fcb0a9a6-cabf-4cf6-a7d9-e3a4e9e6bc9a	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MA95C3DBA1/B/XS	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	bb086ab3-f67d-446e-9bce-f44d4bbbb0d9
87afc521-326d-4a00-91ff-37e10f7da551	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MABD95FD2A/B/S	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	75139da0-4869-478e-8670-d6e08b24a278
539c19cf-1811-41e5-90ad-bcfffbaa6825	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MA433CFA5C/B/M	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6887b906-df9e-4638-af58-3f0c391b383e
22ce2328-aed0-4dec-b82e-6317e52223e3	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MA795C5D84/B/L	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	09522a44-20ab-4d5a-9a78-7d38a08d3a5a
83b4bcea-073e-4634-aea2-aa15e6f534dc	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MAE928BA3C/B/XL	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	7ab4cf55-af58-4826-802c-763446232c76
67fb78cf-77a8-486e-b57e-ff345d883984	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MA7FFB1463/B/2XL	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2d7ed52d-ad40-4942-a107-88a4a3006e57	9f2aeef9-6a72-480e-83ca-6aaee7d02f94
0a6fbd8e-cda5-4b3d-bdfc-53d58ccdf591	2023-06-14 10:53:29.418282	2023-06-14 10:53:29.418282	JN-MAF655DC4A/B/3XL	f2725de1-5816-49b4-b7e8-7e4d4bcc1913	7a4a9d95-1c71-4af9-98a7-b0fee348c945	fc500351-9486-4043-8198-77f4c2b58dc0	e2fab39a-b7ac-47bf-a482-641988d8f8aa
3b133781-9092-4d7c-8ee8-b0ec191d4e42	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA4959DFCC/B/S	831453bd-bb1f-4c45-b11f-15d16f7f1236	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	c7c6da2b-63d7-4442-8ec3-d606131721cc
a28a9ccf-a291-420b-890e-a302805fbfa0	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA1817636E/B/M	831453bd-bb1f-4c45-b11f-15d16f7f1236	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	0adf1416-b076-4c37-a202-76b1aab05d3b
994ad22f-2132-4e28-b46f-eb625a897dad	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA8476515A/B/L	831453bd-bb1f-4c45-b11f-15d16f7f1236	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	7166d53e-daf7-499f-95fb-78880f49929b
cee076fd-6480-4389-9644-001c3af8b521	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MAADEDCE22/B/XL	831453bd-bb1f-4c45-b11f-15d16f7f1236	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	357ea210-2e63-4623-91eb-b3b502cc98c6
5c61384a-1d74-4dff-a47a-e70ad9bbdf9f	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA3B6AC9A7/B/2XL	831453bd-bb1f-4c45-b11f-15d16f7f1236	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	0683c905-aa48-46c1-b18f-7eb37ea9b1e2
e159a92a-c065-4e60-8666-af74e36d358c	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA7BC92E79/B/S	831453bd-bb1f-4c45-b11f-15d16f7f1236	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8c723f45-e4af-4c46-aba2-47fb37d7e6bd
6791a7cc-8282-472d-898f-acbfc3b71730	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MAED361981/B/M	831453bd-bb1f-4c45-b11f-15d16f7f1236	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	fffdb4e3-9aec-4ec2-b133-82fa5e8f53ce
65793762-9315-45e1-8bd4-409a29931560	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA5573677C/B/L	831453bd-bb1f-4c45-b11f-15d16f7f1236	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	a333fbce-9f19-498a-8571-e59dd5d056e3
c7bc021a-6b41-4d84-af2d-f1041ebdfa60	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA8779A9AF/B/XL	831453bd-bb1f-4c45-b11f-15d16f7f1236	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	db04c9fc-efe5-4e49-938a-d939c4ab9659
87fc613b-c79b-40bc-ac3f-02fe39d5f6fc	2023-06-14 10:54:39.074533	2023-06-14 10:54:39.074533	JN-MA8971451A/B/2XL	831453bd-bb1f-4c45-b11f-15d16f7f1236	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2d7ed52d-ad40-4942-a107-88a4a3006e57	fe7a6678-65a1-443e-8353-55f91d5f7cc0
14c8ab97-a1aa-4e80-b278-12e733b32907	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA643D6B7D/B/S	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	27c3ff93-2de9-42b2-89dd-cf94778f8b5d
54ff72ed-477b-419f-a2f4-be5f33ce6d14	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA825C23B6/B/M	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	8b345d6f-8420-408d-a615-8297a8461306
6378c134-cf9c-418b-952b-3c086dd2ab16	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA577A8362/B/L	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	5898e9be-75a5-48d0-a8a0-e9e2cd6ad2b4
fa59b45c-9fa5-4419-8493-50ab9af547ad	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA3D8FB4BD/B/XL	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	ade7c53e-a66d-4b9e-99b0-8ec2b2219d59
cc3e9d8b-442d-4365-a3ca-39fca696ebe2	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA2396ED94/G/S	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	58bd77d5-06d7-4026-abaf-6b714071661d
1adc6b08-d4de-444b-9496-dc38bbc6e07f	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MAAEFB1F89/G/M	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	27b11047-22ea-4fa1-80af-a9ced4e49591
7a47e1fd-89e5-4842-aec6-5470e5f8ef56	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MAECB9C24A/G/L	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	4f844b76-9ef5-4d7c-a308-95f0714ea8a7
0047831b-0c8b-4210-ba86-154b5314c89e	2023-06-14 10:55:42.405326	2023-06-14 10:55:42.405326	SH-MA2927B91C/G/XL	773353c3-1ed0-4bc6-9e32-63f0b4f481e8	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	4b6565c7-8497-48ed-959b-0794455d6481
5b373bd2-4a63-445c-bf37-dc11abbe90f4	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA1A62B538/B/S	4ae30169-15f3-4c97-8a96-66934b2294c9	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d49d7324-454e-44fa-ae72-4bee441e44f9
c14e3097-e826-4ca5-9518-03e533ea197e	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA62ED2FC1/B/XS	4ae30169-15f3-4c97-8a96-66934b2294c9	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	9f32eee3-6a17-405c-9b12-8d73bda5ad72
3053c28c-7622-4b6e-87a5-69c1c988d8f0	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAD941A9F1/B/M	4ae30169-15f3-4c97-8a96-66934b2294c9	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	46722437-1f83-4c84-bdea-e34f2c605104
fcf5c708-a92d-4824-ad91-97f5304a06ac	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA33C598BF/B/L	4ae30169-15f3-4c97-8a96-66934b2294c9	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	0ed15362-05f9-439e-9467-ad1ff687a8d0
8473c1a6-8473-4ad9-b89e-7dcbf2a75c09	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAA5178C16/B/XL	4ae30169-15f3-4c97-8a96-66934b2294c9	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	80720517-efb5-4ebe-9969-ecb7cdc0e6a2
e22ab727-124c-4996-b875-d9af4bfc64ea	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA1BAD5615/B/S	4ae30169-15f3-4c97-8a96-66934b2294c9	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b8a16561-41aa-4e9e-b898-16ded71cd9d6
95f52c26-6e0e-4e21-8d8a-e7f20db9f3ed	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA56A79294/B/XS	4ae30169-15f3-4c97-8a96-66934b2294c9	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	5b5f4aae-82f7-4b3e-9015-bc51c4f9c3c7
ac1fe976-74d0-4078-804d-ad56644f0f38	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAE154738B/B/M	4ae30169-15f3-4c97-8a96-66934b2294c9	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	69ed82d3-c48e-442b-ab41-976b1ca1d113
6fe0f5d3-7b6f-40bc-901a-d3c2f52a5864	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA5134636E/B/L	4ae30169-15f3-4c97-8a96-66934b2294c9	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	e029fefe-83be-4a75-a22d-1824544558f9
afb4c260-93eb-411b-8bef-3fc89563a1c7	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAD258CA68/B/XL	4ae30169-15f3-4c97-8a96-66934b2294c9	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	f214463f-1748-4c44-aa4b-12424fb4f3ef
15642ded-e0f8-410e-ad60-408c85e69b65	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA8323225B/G/S	4ae30169-15f3-4c97-8a96-66934b2294c9	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	758d6a6e-3540-47ba-a994-3684366b9044
db068315-b615-491e-b20f-e014749c1ee9	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA582131EF/G/XS	4ae30169-15f3-4c97-8a96-66934b2294c9	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	8bd5a587-20a6-4891-92b8-d62c7bbf684a
6cfd797e-f4ac-4c57-a522-3e1d6e3f583d	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAD22C4B5F/G/M	4ae30169-15f3-4c97-8a96-66934b2294c9	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4964c243-b19d-4a23-a36d-15dc851ce54a
141e360d-f7d6-4007-bc22-a6c7a9aa8137	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA8F9CCBA1/G/L	4ae30169-15f3-4c97-8a96-66934b2294c9	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	da8b4089-e4dd-4a2a-a549-c41b2d0b65d3
a625b6ce-ae2a-4b12-8ed1-4692a353f7f9	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAE6223A3E/G/XL	4ae30169-15f3-4c97-8a96-66934b2294c9	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	ecb52d49-b58b-4ad8-99f6-60e91ba64937
882951b7-ffee-4fbb-9142-b8f653bffe81	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAF9CC21C8/P/S	4ae30169-15f3-4c97-8a96-66934b2294c9	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	77762c41-ac02-4432-a68f-4fa85c165d5f
3e481a89-5a51-4d91-9243-28f0b0b0e6c0	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA6CA1F253/P/XS	4ae30169-15f3-4c97-8a96-66934b2294c9	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d1ab5811-dfbc-4ca0-9b7c-e142bcc8488c
4f76270b-834d-4355-bec2-75389d6d8a72	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAA174FCD4/P/M	4ae30169-15f3-4c97-8a96-66934b2294c9	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	76d705d1-da16-4b1c-9dc6-66a53166e361
8d34fdff-d54e-499d-a6cf-07c15075c268	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MA86A9A17A/P/L	4ae30169-15f3-4c97-8a96-66934b2294c9	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	9c5be229-7f9a-48c1-adee-5b5f213a102d
735e8504-7723-4587-930d-198b59bf9c5a	2023-06-14 10:56:41.233442	2023-06-14 10:56:41.233442	SH-MAF6FFBFC8/P/XL	4ae30169-15f3-4c97-8a96-66934b2294c9	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	853f6721-a913-46fe-8891-f7cd79fa4fba
cf5644a0-a631-4027-8ebf-5a643567a3f6	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA36D61A6A/B/S	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	ad093395-b50b-401b-9e3f-9bd1f42fe563
f06eabe1-274a-4915-91ab-b03a59c2a5df	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA81C31DA5/B/M	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	e078f52a-5aaa-45cb-8ff8-63dd1d89409b
4e968cbd-8f8e-4df4-a30c-f30ebec997ac	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MAD78EF1F9/B/L	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	7d70862e-065f-4693-bfad-0d70daadc6fd
48de6412-a245-43c3-9c38-9adf54ba730c	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MADE5245C2/B/XL	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	f9e83e4f-9656-4d4d-b237-fbccf403be86
d5ca9cc5-cb75-42a9-b639-b2f182c67494	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA4F2529A7/B/XS	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	435fc0e1-4239-48d9-9342-794b914e5a10
fffd90d9-9758-414a-9dd1-55e089b6f74b	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA4F4D29B7/W/S	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	40e6972a-4b3e-4309-aea3-19f7dcb0f638
fe3578a8-edcf-46a7-84e0-28fc9927656b	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA683F9A36/W/M	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c5f10212-6e02-4721-8b4c-cdc490fb7ce0
0f37420a-7731-453a-962d-3a8d8894e6f2	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA1AE959D6/W/L	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	d2a98c09-b81d-4ded-add0-afe9be24f8d4
08628773-e282-4226-abde-b4b91d6c3711	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA9C2D8779/W/XL	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	15f908c0-635e-41b9-b04a-a189021b5f80
d2534e9a-cf94-48a5-b024-510aeadae3df	2023-06-14 10:57:47.797283	2023-06-14 10:57:47.797283	SH-MA443E2F33/W/XS	82f01998-4fbd-4269-8e38-2a25ac8bf3d3	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	9019e6cf-0b75-4936-8016-9258f99374bb
b20d5a30-7725-47f3-ae62-c805facf3951	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MAB2A57D8B/B/S	af92aa49-22fd-4390-a1ee-649596b12d65	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	f1b47797-5baa-4f0f-a0ea-0eebd664a0c5
15e9aaff-6c46-442c-ac17-37e7b1efa255	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MA16F69892/B/M	af92aa49-22fd-4390-a1ee-649596b12d65	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4db9b0a1-7f70-4459-a6fd-8f0cb0b0b1d4
5cd3f205-d62d-458a-bc6f-0814522d997d	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MA171A59C2/B/L	af92aa49-22fd-4390-a1ee-649596b12d65	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	b2d51722-d238-4d6b-b867-224716c11870
c3604bf6-6134-4a63-acc4-297ea6ae159f	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MABD57EA3C/B/XL	af92aa49-22fd-4390-a1ee-649596b12d65	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	39fd7fc9-a4b5-4ed5-8b80-e9b73028cc8d
e0f1551d-107c-4816-a2a6-cd47a6625f06	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MA8348F79F/B/S	af92aa49-22fd-4390-a1ee-649596b12d65	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	f8f74b69-02b6-4235-8663-8c3dfca9552c
ce718497-af42-44ae-9c0f-4b53136bb8d2	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MACCAADEC1/B/M	af92aa49-22fd-4390-a1ee-649596b12d65	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3c269680-e521-4e56-b884-2c782629c09c
f0c08032-878c-42c2-b871-36ebab6649d4	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MA2B81EDDF/B/L	af92aa49-22fd-4390-a1ee-649596b12d65	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	15d46bb1-07de-449a-a885-e5d822db8f17
b6b0ea7c-d057-4387-b7c3-4b3640f4f96a	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MAB1C39714/B/XL	af92aa49-22fd-4390-a1ee-649596b12d65	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	a148f6fc-8e18-4700-aaf3-ad92482c2fad
91779165-1422-4de1-bfb4-a2c70114a32a	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MAD74ADD22/W/S	af92aa49-22fd-4390-a1ee-649596b12d65	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d66cf70d-f7f1-4be6-8750-0c3e1c153c77
8726a925-214f-48e6-81a2-e7b145cfc518	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MAAC6156D4/W/M	af92aa49-22fd-4390-a1ee-649596b12d65	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	8d016dd2-6880-4710-9531-bd64cfe6f7e1
9dcd5ad3-e8e4-424c-a46a-d9aa38e8d83f	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MA51D9CB7E/W/L	af92aa49-22fd-4390-a1ee-649596b12d65	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	4ff3d13d-81c7-43bb-880c-59c2e7a9045a
4da03868-d1b5-4f9e-8f01-af8b35985898	2023-06-14 10:58:46.333582	2023-06-14 10:58:46.333582	SH-MAB6E576B2/W/XL	af92aa49-22fd-4390-a1ee-649596b12d65	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	6d510ac7-5b3c-4557-bb94-03b1807ec782
7d5fc599-9509-4411-a03e-73fab78f354a	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MADC5AA52E/B/S	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	cd574ef6-9b37-488f-a714-d673bc01ad55
5c391c82-cec6-4370-9ae8-03a695e1bbad	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MA62346846/B/M	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	8d8e474e-a603-47b3-89fa-bef0c7d65518
d9e89919-cfba-492c-8f90-7796cb9d0013	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MAB9727332/B/L	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	c0b08ed0-76ff-4205-b86d-6a966a60deb5
ba442b94-f060-4b38-af05-4c3bc78ccfca	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MA866C5342/B/XL	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2ed55aba-1311-4e78-a262-2712ad7896a9	43a0918b-de3a-490c-addd-91201af6e29a
cbdba194-0556-4fb6-be97-a10fe47da643	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MAC46F2789/G/S	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	237fa1dc-c9db-484a-bb24-3de02fdc047f
d4e08d7a-19a0-469d-80d5-e59bffed439e	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MA212F8C6E/G/M	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	995a934d-4c3d-4e31-93ae-d6b79883f45e
0d220fd2-cf15-417c-ae3a-992bbc5f5a61	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MA9E25F53A/G/L	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	ff354de8-569b-471b-a754-89c39362ca28
8dcfc4e9-bcbe-4624-a96e-74216ced15ec	2023-06-14 10:59:27.537233	2023-06-14 10:59:27.537233	SH-MAC1863FB6/G/XL	bb8a5f9b-f5c6-4967-9166-5ece96bf4c5b	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	c87f6e6d-9e1b-4228-b5e7-4a5e183a8be3
657a5a39-4d36-4b4d-b2c5-72077fbbbab2	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MAF7782A36/B/S	96e852ca-79e6-438a-9d90-a560fc44fd92	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	398b5922-b4c7-45a7-9eee-ae26806c714a
c6962660-4674-4916-bf91-312bb1bf8643	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MABF464455/B/M	96e852ca-79e6-438a-9d90-a560fc44fd92	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	da4cefac-5cfb-4c8d-9ff7-2e77cb30e51e
8964297b-3cb4-4c25-a722-e831d53cd2b4	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA559D3878/B/L	96e852ca-79e6-438a-9d90-a560fc44fd92	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	65089464-a880-4d9a-a9f3-5d1712227330
50f5dd6a-f3bb-495b-ae36-681c1bbddde4	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA388A2C55/B/XL	96e852ca-79e6-438a-9d90-a560fc44fd92	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	1264cb1c-bcac-4ff2-a369-ba22ff06e51f
988f1604-3598-467e-815a-6f5514e8a27f	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MAAD7518A5/B/S	96e852ca-79e6-438a-9d90-a560fc44fd92	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	acbdf6d0-40aa-4d80-9074-19a956e6bd63
605cb990-4fac-4ce8-a282-b8cb8457014f	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MAD915B4AF/B/M	96e852ca-79e6-438a-9d90-a560fc44fd92	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	a46da767-c549-44e2-9c6a-7beba7fd0410
c806c291-7039-4837-a607-6686eacd49a8	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA69DA85F1/B/L	96e852ca-79e6-438a-9d90-a560fc44fd92	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	04a81e7d-28b1-4e13-9ee4-391b8a155568
41a35c39-7551-4a22-8a03-1a18566f81d6	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA43574BC6/B/XL	96e852ca-79e6-438a-9d90-a560fc44fd92	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	22191a8a-c5df-4303-a32d-b5514868c009
7636ae8b-7780-49bd-86cc-6be21ec50669	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MACFBD3A96/W/S	96e852ca-79e6-438a-9d90-a560fc44fd92	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	4840123b-2a8e-49e1-92a5-fd1564c9885e
900d1ad7-7135-4500-b28d-8f909be642d1	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MADAFDDE22/W/M	96e852ca-79e6-438a-9d90-a560fc44fd92	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	00aeffef-d6b8-490f-8aa2-53a5220e0317
e9937398-b3df-4a34-ae44-acd22e306bc7	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA71AAA83E/W/L	96e852ca-79e6-438a-9d90-a560fc44fd92	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	c1a5cf7a-7ca0-4713-a88a-90a8f7424844
0ee86dec-e7b9-496a-abe6-3080c162c6ab	2023-06-14 11:01:05.245137	2023-06-14 11:01:05.245137	SH-MA2AF621C2/W/XL	96e852ca-79e6-438a-9d90-a560fc44fd92	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	f9105235-6b3c-45bb-9585-0a00897a53f1
1baf2cbd-11d7-4346-b9c2-d86e115bc073	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA6D345F2B/B/XS	519fc9bb-58d0-4342-80d2-bce9ca2bceef	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d7953a10-b7ad-454b-ad79-dcbf513bdaf5
caf3e345-2cb4-471c-91ad-7a0d9d7f8e1c	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MAD862B25E/B/S	519fc9bb-58d0-4342-80d2-bce9ca2bceef	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0c761f77-cf9d-47f4-96fb-dc96741df9fb
07b6d57a-fd51-4863-a072-9f914936d541	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA794189AA/B/M	519fc9bb-58d0-4342-80d2-bce9ca2bceef	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	74828d5d-94b6-436c-b769-4d6e2bf7ac57
437173ec-dc36-45e8-b6fd-e306f795af33	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA37A9D9A2/B/L	519fc9bb-58d0-4342-80d2-bce9ca2bceef	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	56cc5920-16b0-4da9-9c32-77f8a4d22be8
abbec967-97b4-48dc-8f7b-42d561b0b167	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA43F3772B/G/XS	519fc9bb-58d0-4342-80d2-bce9ca2bceef	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	8270391c-ee7b-4ae3-811d-97f6efdee099
2b0eb253-eebf-4538-8e88-c96e5471eb56	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MAA756E6D1/G/S	519fc9bb-58d0-4342-80d2-bce9ca2bceef	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	4ae392e8-487a-4f63-bf7d-4c006ab35e36
e024d6bb-e9ed-443d-828f-994058eb5762	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA48212A17/G/M	519fc9bb-58d0-4342-80d2-bce9ca2bceef	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	16f1c8e2-6288-4b2a-92c9-7da1eeb2955d
7af1f33b-cf76-4646-8cf1-67bb88861473	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA466F1914/G/L	519fc9bb-58d0-4342-80d2-bce9ca2bceef	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	19c9f87e-d83b-465f-a406-3e712ef350e3
6a79f066-ed0d-486c-b63d-59ecf41f4734	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA7B2B6D72/W/XS	519fc9bb-58d0-4342-80d2-bce9ca2bceef	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	69b835ef-45d5-450d-bf94-414b518a82b3
ca09934a-706f-4b08-969c-f63aa2fef047	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MA75FC2651/W/S	519fc9bb-58d0-4342-80d2-bce9ca2bceef	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6981e322-d2a8-4bd8-9fca-f65ec003816b
b022aecd-fbe2-4eb1-b43b-a41b27d4933d	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MAB544BD26/W/M	519fc9bb-58d0-4342-80d2-bce9ca2bceef	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6568effd-594d-42f2-862e-20c04f0d4a32
28f865d4-b5db-4612-b756-cfa9f888aef6	2023-06-14 11:14:18.811731	2023-06-14 11:14:18.811731	CT-MAAAD93264/W/L	519fc9bb-58d0-4342-80d2-bce9ca2bceef	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	3ea741a6-2960-441a-b189-60ff1ae33670
de57dfc7-ef59-47e4-b4d6-860a5eaf49ee	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MAA3BF1E54/B/XS	daf599f9-6641-41da-9d88-427cd0aff377	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	a111dd45-443d-458e-bea1-912754c94241
074b3c97-f15b-465a-957d-d0644688e254	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MA639536FB/B/S	daf599f9-6641-41da-9d88-427cd0aff377	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9d5cb03b-6d4f-4391-9097-029a919c308c
d0fd0891-1dfc-4b5a-b94e-ce0bfe341c53	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MAFEBEC625/B/M	daf599f9-6641-41da-9d88-427cd0aff377	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2f34e531-c953-4998-96e9-1c3bcb7861d8
aac59431-f113-4476-9695-6bc0263f13e4	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MABDD853B2/B/L	daf599f9-6641-41da-9d88-427cd0aff377	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	24030fb9-be72-4daa-975d-8c0b6c4a9c57
5b327ac9-a6ba-4c70-9776-de5fa52434a2	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MA3F53242E/B/XL	daf599f9-6641-41da-9d88-427cd0aff377	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	1c9c31df-85f6-4404-b172-7b357fadb20b
f68d4832-6de8-460e-8e50-c6f097630ced	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MA2774A6DB/P/XS	daf599f9-6641-41da-9d88-427cd0aff377	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	abb829b1-8c48-4e45-981b-92de96fcf5a0
3ab78b9c-0edf-4a79-a4c8-5ae82a786234	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MA38A94BF8/P/S	daf599f9-6641-41da-9d88-427cd0aff377	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	cd9bf1b9-70e0-4591-bcd9-b7594bb1e467
4ffe6631-ce5a-4bc2-b5d6-e613c3d1cfff	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MA1447E38E/P/M	daf599f9-6641-41da-9d88-427cd0aff377	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	68ac0e1a-c073-415e-a6b1-c88f7209da1a
01f3ad6a-1f56-47f4-bc19-204f2d63a81f	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MAEE236C3D/P/L	daf599f9-6641-41da-9d88-427cd0aff377	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	98fbc60f-7b09-416e-b4f4-dfea1cd169b1
3a47462c-b60d-433a-9b68-f8278634c4be	2023-06-14 11:15:52.129549	2023-06-14 11:15:52.129549	CT-MAA3DB37E6/P/XL	daf599f9-6641-41da-9d88-427cd0aff377	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	11d52cc9-46cb-42e8-a071-4f04ae02649e
2deb75f7-42d2-4170-a90a-2a777d709c9d	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA35965C81/B/XS	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	2e40ad31-029b-48b7-9e9f-9a74eb7f0d9c
9079d1f6-ad63-4fe0-af48-720b7ed325bb	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA924555D6/B/S	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	50c51c3e-3cb1-425f-8141-949cd7c17a4c
61abeecb-ef65-4d61-a12b-7811aa3f7d2b	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA7B46F732/B/M	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	be77f54f-5fd3-4bb3-8fb1-833212244438
19305ca2-edaa-4421-84fe-45cad3c20852	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAC8835994/B/L	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	b3677e47-cc9f-4f75-8357-6fe92a264bcd
26e6d7fe-35be-4b5c-9ae2-b531675099df	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA48CDBCB3/P/XS	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	68c94815-02e1-43e5-9495-dc40cbd994f2	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	01e8f3bc-1fc7-43b7-b1e3-4c0b419e0fb6
6289c4d9-0c1d-470b-895e-0dd28f8e010b	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAA72AA7A4/P/S	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e353c9ab-a18e-43df-afaf-60b448eec4be
9cb0fa9f-c8bf-4bdc-88df-bd761d078f30	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAED44E135/P/M	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	7f2016b7-deed-4c5f-9eaf-c47582b740d5
9b97c665-0886-4038-af6e-12161a07187a	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA9A56CB4D/P/L	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	d1d097fa-d41f-46c1-af63-13888623859a
9fc86abb-8c2a-4614-80b9-91a48786d5cf	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAAD895871/Y/XS	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0e13469e-c905-436c-8411-44190a8d3a78
afeb3475-6db9-4987-a587-ad4522ef32ca	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAD4B7FC36/Y/S	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5e69232a-5885-4ff5-bc18-6efd111f4aee
a51b46e3-51b0-48be-b73c-5344f8b77b45	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MAACDEFC87/Y/M	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	f3a2b97e-1dba-4a7b-8067-f89e8400d227	caab0baa-5451-477f-af65-691debb6acc6
55009532-c18c-4dec-8e94-ee8a463e97fa	2023-06-14 11:16:49.001917	2023-06-14 11:16:49.001917	CT-MA575BFE5D/Y/L	ba3c0b6b-35e4-41e7-9263-dd7b163c9d66	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	def52206-45aa-48b9-bb32-9f05c45e7461	47705b58-edfd-4adb-852a-999d8299feff
3617ad2d-3d2d-4403-9932-a5a45e90b877	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA1E8895FE/B/XS	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	1280da57-5e2e-474f-899f-fdf3a4f06554
c2432f13-770b-4576-838f-0ff5201888d1	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MADF9475DC/B/S	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8a8a9ba0-05db-4a43-a786-20a625519eba
6371cdd0-159b-4789-a09f-690a790bb50d	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA6DB25669/B/M	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	698dd32b-e8ee-45ed-b6c3-5cb8c2b8bbc6
c550fc66-66fb-42c5-9230-c6e23a2a5265	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA1BC3FF5C/B/L	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	1a00bbb1-e8db-4de1-804f-1e78d117ff62
3708e532-84a0-4644-b6f4-56aa1cb6e138	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA71B61AB6/B/XS	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	a76ac8b0-232a-4d30-8410-f7660afe4b2e
c07baee9-7e5e-4da3-92bf-f00ff0dd9250	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA3936DCDC/B/S	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	99dcd033-4474-4c17-a425-99018c1fb558
6662ead5-c781-4b44-993a-066495836a8c	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MAC5657DA2/B/M	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	1cc6cbc5-7e94-4a9d-b6a3-f47503f4d0b1
b8413736-73eb-49ba-b10a-c342423c1eae	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA7E2245EC/B/L	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	c7dfa68e-4cb3-4eb6-b5b7-90beab8209e7
f5c67fbe-246c-4047-ba62-306d4e73f0c2	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA6B145218/W/XS	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	4a1bc02f-db22-4289-abf2-3c91f1fba3f1
c8be8e37-381d-4a38-8eae-b9d3b64d7fbc	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MA66226256/W/S	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	74922597-314e-4dbb-bc36-2f5f8260c988
97f5f7c9-553f-4970-8504-4acbdb07bcb1	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MADBCB82DA/W/M	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	168de0f1-8d0c-4b67-b056-7d21f1620365
25b40ff2-b162-4c55-8191-45d855d7c6f9	2023-06-14 11:17:44.396757	2023-06-14 11:17:44.396757	SH-MADBA5E73D/W/L	f6be6332-6ed2-4f55-812c-4a3a89d9a0d3	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	de1f6138-71f9-470a-8b96-f3a28c535758
84d34480-b0d6-499a-8df2-460eb2f34e4c	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MACF3CDB4F/G/XS	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	35054a67-263f-479d-9bb7-bf151e7368cf
4a845532-dbb3-477d-b36b-f757fe81706f	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA42CE9A74/G/S	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	941ad9c6-075d-4dc5-aedc-c6ce3087fed1
191234c6-8d27-4618-b98d-7f23743ee336	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA14B4B334/G/M	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	25f3e1b6-abf6-4453-9914-7165002ebc9e
3a87fb90-826d-43fd-b366-f92383048b9d	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MAC1AA18A4/G/L	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	edb3368a-d747-460b-83c8-85c54b18ef31
9a6a6cae-e793-4506-801d-aae5fe2afe6a	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA63E3423E/R/XS	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	819617ad-714e-402c-b4dc-f7e928bd9313
845674e9-0b94-48f1-8221-5c9f145754eb	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MACD5E1781/R/S	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e3c3a768-0925-4333-bce9-6f69770db796
7cab06a5-82dc-435d-a215-6c29d2b184a1	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA2D561142/R/M	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	02590925-3a85-496a-8517-607d32deb1ce
ded73db0-d8bf-4aff-9877-99c8af442b86	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA471EC525/R/L	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	dae77295-98db-416a-8fc4-ae54d0a8ff0e
46ffb907-f0e7-4f31-84b4-1e65fa8b5512	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA3EE14CDD/W/XS	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	3755cf77-43d7-4bb9-89f7-bc885546e5e2
0415d99a-df7c-4e07-8e0c-73a99e125aaf	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MAD9FB9B29/W/S	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	c1ca93e6-3b26-431b-a724-b9575717b4dd
cb4689e3-f6a0-461d-b4ec-4fe9f72866c2	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA73B8347A/W/M	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	22d2d92c-2cab-4110-a979-b5a34b0271b0
dd42c8fa-f8d1-4030-ab77-e55d5dee970f	2023-06-14 11:19:05.291	2023-06-14 11:19:05.291	SH-MA19DBA6F2/W/L	38f65e3f-1f41-4b23-a63e-eb31378b3dd0	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	ba578ee3-44df-4845-922b-1e43e14665ab
acb44bec-70cb-41bb-a6f7-993c3101086c	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MAFFAEB37D/B/XS	60449c96-7736-429c-b8a6-0696dfa6dd28	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	84cbc8bc-89b8-4635-bdbd-37fc4af1064e
00f217fd-f25d-48da-bfe5-9743dc9582c6	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA8ED18FA6/B/S	60449c96-7736-429c-b8a6-0696dfa6dd28	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	23587e26-37a3-477f-8967-76099b823bea
1c9284b8-6f8f-4adc-bf1a-377afcee8f09	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MAA7C1F1BB/B/M	60449c96-7736-429c-b8a6-0696dfa6dd28	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2db0cdcd-372a-495a-b0ca-c5fff27573fa
e790f609-1d04-4c0e-b1ed-c31053325e7d	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA4FF77191/B/L	60449c96-7736-429c-b8a6-0696dfa6dd28	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	85a44cf6-649f-4389-896a-caaff0cbcdc5
c3edb51b-a367-418d-9b2e-e8eca383f560	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MAA2EA31CB/R/XS	60449c96-7736-429c-b8a6-0696dfa6dd28	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	cad95f78-3e1f-406b-b4ca-52d3d0292941
415c2679-fcf7-401d-ad98-dfe7469353d9	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA299E688B/R/S	60449c96-7736-429c-b8a6-0696dfa6dd28	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	70fac9eb-bdb1-4c73-8e5c-408e3ae46f70
298bc945-c5c6-4e0b-91dd-0acbbc45e418	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA13F3BF13/R/M	60449c96-7736-429c-b8a6-0696dfa6dd28	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3f968612-3709-4d25-8e4f-64aee8ca7af8
a2bd82e3-49f2-4d14-acfb-015812695590	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA77819A2F/R/L	60449c96-7736-429c-b8a6-0696dfa6dd28	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	0e7463a1-4ae1-461b-ad3c-4f1113e6bc22
4ebddec1-6396-4b02-baed-208c0866a496	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA8DB56CD6/W/XS	60449c96-7736-429c-b8a6-0696dfa6dd28	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	6d256598-f745-4965-be1d-f42995c35ac0
fce01efd-05fc-481e-b871-27debc991865	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA9C22C88E/W/S	60449c96-7736-429c-b8a6-0696dfa6dd28	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	ac755fdd-dedb-46ad-80b5-8b75e8e6237a
dff0e2af-530a-45de-9746-85ccde1afc0a	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MABC4468CF/W/M	60449c96-7736-429c-b8a6-0696dfa6dd28	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	74140477-930c-4001-a10a-a3e315fae284
5c643606-6631-47cc-98f9-1c076fc51e6f	2023-06-14 11:20:13.729286	2023-06-14 11:20:13.729286	SH-MA8A9B4BD1/W/L	60449c96-7736-429c-b8a6-0696dfa6dd28	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	16a2edc5-555a-424f-9185-abfa6af097c4
42e5e8d3-9246-4860-ab95-b7e8c2487874	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA4EF48529/B/XS	88532d4c-e55d-4281-84b8-93b258138002	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0e731e20-f45d-4ee9-af2a-44dd45b0c54c
ecbc9f8e-8a4c-4a8e-9ba1-b3a22731f793	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA4438F7F4/B/2XS	88532d4c-e55d-4281-84b8-93b258138002	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	c33c6470-2921-44f4-b2bd-b605b2093bee
e030f1ce-3a7a-4cec-8d45-38d141ede95e	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA38B6B141/B/S	88532d4c-e55d-4281-84b8-93b258138002	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b2a48d74-d2ae-41f6-bef8-67daf1756147
2516cc1c-45f8-4c80-9091-ed3fb0f73429	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA2A1423E3/B/M	88532d4c-e55d-4281-84b8-93b258138002	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3b6bdb43-0f56-44cd-b80d-cd900600336d
6545d17e-70a9-4326-b3ce-866fce00d645	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA77EA9196/B/L	88532d4c-e55d-4281-84b8-93b258138002	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	b97d9b84-9a31-4d1d-846e-dec2cad03ecc
a9b1735f-3b44-4370-92f7-f262b220055d	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MAC3B66514/P/XS	88532d4c-e55d-4281-84b8-93b258138002	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	60c275be-d35b-419f-8bc7-eaac76d7a0bd
072ca0ad-14b8-4296-b601-b453f8314045	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA27B36574/P/2XS	88532d4c-e55d-4281-84b8-93b258138002	f16d53c0-7ece-435c-87d8-068186398eae	0b287c5c-ebca-485d-b648-3eeeb26f4c74	ed8a9231-0fed-4aa0-9b52-939f4642f0f6
27f6f2ad-4161-4f92-9f17-2e4cfd026fae	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MAA1C34F28/P/S	88532d4c-e55d-4281-84b8-93b258138002	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9a3a3df7-ff08-4003-bf72-63dee7bca0f2
2e86fe0d-83d3-408c-8095-dd9ab7e83ec5	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MAB4554721/P/M	88532d4c-e55d-4281-84b8-93b258138002	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	90a6c415-efc4-421d-8a4d-2648a26adf4e
d4c5fceb-c02f-4559-9b16-0cd1636cf904	2023-06-14 11:21:39.720697	2023-06-14 11:21:39.720697	SK-MA579213CD/P/L	88532d4c-e55d-4281-84b8-93b258138002	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	16d7d7af-2e92-4a9c-b633-23e402c73425
9c7a78e0-8228-4321-a93a-e3f84132f31a	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA53B1979C/B/2XS	cb87b1f1-efe5-480b-a61e-b878d05aba58	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	6a456e2e-9d53-46b7-a9ff-16a61d254bca
8d183143-f1f0-4e0d-bc3a-74971615a241	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA4FC5C56A/B/XS	cb87b1f1-efe5-480b-a61e-b878d05aba58	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	7449cd74-0d0e-425e-b0fc-fd69a7a877ca
10a7a558-1902-495a-bd4f-2fc0ee29e263	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA97C1A4AB/B/S	cb87b1f1-efe5-480b-a61e-b878d05aba58	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8151443c-3a9d-4550-8e7c-bcfceafae32a
efb0541a-7368-476e-965e-954344e37c98	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MAE76AF5CE/B/M	cb87b1f1-efe5-480b-a61e-b878d05aba58	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3b1d99e5-2b12-481a-b34a-aef4680808c2
bd1e3cf4-e5bd-483f-8fa4-3a6bacd0b2ec	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA9FAF82DB/B/L	cb87b1f1-efe5-480b-a61e-b878d05aba58	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	d7600a1b-21bc-4b0d-a909-70901a057a1a
ddaa086d-9d01-456b-83dd-36cb5daec33f	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MAAE7AC556/B/2XS	cb87b1f1-efe5-480b-a61e-b878d05aba58	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	1e35ffb7-4629-4d5d-bcc4-f6ce4baded2a
5e4ba5de-2979-4a8e-adc9-e8614ecca27a	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MAF1C36E74/B/XS	cb87b1f1-efe5-480b-a61e-b878d05aba58	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	218a580e-8798-4162-b640-45988d02faf4
b579ebfd-ad5e-409d-b00f-fcf62ebcb83e	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MAE8788267/B/S	cb87b1f1-efe5-480b-a61e-b878d05aba58	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	bd1a4e2b-2800-409f-9fb0-757f90d23369
82a6bcad-d483-49b2-906d-fdc4de04f1d4	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA4E55A957/B/M	cb87b1f1-efe5-480b-a61e-b878d05aba58	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	62a0a9e2-0e68-43c5-b25b-d375d4524753
f291c455-5568-4d4e-919a-beefbaa85c5f	2023-06-14 11:22:19.620151	2023-06-14 11:22:19.620151	SK-MA3F1CBB43/B/L	cb87b1f1-efe5-480b-a61e-b878d05aba58	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	7d4396c6-8034-45e8-b6cb-877483eca8b4
7985a377-9a30-4b02-b47f-ce6cbfaec810	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA9C6FC5F1/B/XS	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	be07ddc2-4381-4c4c-8115-1118246cd98f
0383bc94-9394-4e8a-873e-35531e49b974	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA1CC17D2C/B/2XS	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	8f49911b-a41e-4c2f-a47b-f457ebc821ee
a4964eaa-bd44-4b34-bb52-cb791f464999	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA214E1767/B/S	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d264f7e4-a891-41c9-a0ee-d7be6567aab6
26f28605-2aac-4c17-8a11-1930de588385	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA8F5B7A8F/B/M	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	aa226c4e-93b9-4134-afcb-6d47b8510352
c4db9e4b-48f3-4ac2-b1b1-19aff18f633b	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA55F95439/B/L	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	a0c9ce2f-c82e-400b-ad07-c51c27e01d8e
4e6297ca-a0c0-4051-83ff-3f34bacf3738	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA481B455E/O/XS	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	1f96fa55-5c94-44b7-8069-764dcf8f947a	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	d6ff1fd6-064b-4df2-a416-60e718ea0d62
4d73b56a-2069-4e8a-9c1a-43125fb71be0	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA6CA15485/O/2XS	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	1f96fa55-5c94-44b7-8069-764dcf8f947a	0b287c5c-ebca-485d-b648-3eeeb26f4c74	a9e61819-de62-4cf1-b0ae-bcfb71cc0f75
1eb4cd89-7bb2-4a93-82ba-fc9b0f29408c	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MAAE39AB74/O/S	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	1f96fa55-5c94-44b7-8069-764dcf8f947a	925dc306-1fee-4985-83ba-c3ffe1d6fa37	df348605-9011-41b3-b0d3-5cafdbe5053c
7a5a8450-9074-4adb-8e3f-b2c2512d6fb2	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MA8E5FD5DB/O/M	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	1f96fa55-5c94-44b7-8069-764dcf8f947a	f3a2b97e-1dba-4a7b-8067-f89e8400d227	736e8f39-7c40-49c1-ba23-a852f3f418f5
8be91579-a8a4-4954-a744-856f8c5a4e7e	2023-06-14 11:23:10.91413	2023-06-14 11:23:10.91413	SK-MAD4BD4721/O/L	1bc4ca6e-600f-4062-8fbc-9ac339c11b82	1f96fa55-5c94-44b7-8069-764dcf8f947a	def52206-45aa-48b9-bb32-9f05c45e7461	f6444e1c-eaba-4271-876f-abe8e8b6f8b1
d6338590-ea37-406e-9e93-9efe0a72c863	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PU7A4E2E3C/B/S	b8f514bc-2226-47c5-bbb0-ee606b402c13	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6a922ecc-92b2-4242-b1e9-7ccf57a9dd06
854e96c4-3f80-411e-af4f-5d9ff0f78f8b	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PU49515E38/B/M	b8f514bc-2226-47c5-bbb0-ee606b402c13	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	35742f45-067a-452a-a160-b7114d411838
6029bdf6-85da-41da-82fa-cd52a1c8e8dd	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PU6E356253/B/L	b8f514bc-2226-47c5-bbb0-ee606b402c13	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	1f25d1f6-2b26-449b-bfa3-c59496fa3b73
0f57b727-cdb2-4315-8ade-6f96094befa6	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PU5DBD783E/B/XL	b8f514bc-2226-47c5-bbb0-ee606b402c13	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	cce5b140-c1e7-4a32-a614-b73f6ba6f043
1c05ac4e-e08c-4f2a-890e-7aa4f71cc4da	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PUF1A71A6F/B/S	b8f514bc-2226-47c5-bbb0-ee606b402c13	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2823b6ac-957d-41f6-8eeb-082f9953fe04
7022804e-b804-42d9-a553-29593173cbe4	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PUB66782CB/B/M	b8f514bc-2226-47c5-bbb0-ee606b402c13	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	1048244b-17c9-45fa-ba8e-052aefd5cf9d
b9cbac8e-12ab-48f4-b7b4-80926078828b	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PUC22BB1E2/B/L	b8f514bc-2226-47c5-bbb0-ee606b402c13	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	352ced05-7e59-4c9a-9f46-0c6db5a747e8
155ea33b-e403-4c6d-a51f-1913a3faa34a	2023-06-14 11:25:10.935164	2023-06-14 11:25:10.935164	PN-PU5B31FA97/B/XL	b8f514bc-2226-47c5-bbb0-ee606b402c13	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	d5293024-4e6c-499e-bbaa-ab562671a524
98a13958-fc99-436a-b94c-fb44f7764f0c	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUAA6CC337/B/S	00b4128d-efef-4e63-9764-b4cf0943d538	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0a568033-8ccf-422e-ba58-cceef7dd38a3
103631cd-b1a3-47ff-93b2-1058b015e318	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUE6ABB531/B/M	00b4128d-efef-4e63-9764-b4cf0943d538	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	cbb8052d-4415-4dff-8150-19e8de7772a4
20242e97-93da-4a36-aa66-7c4eb153cc0c	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUB5AE3D89/B/L	00b4128d-efef-4e63-9764-b4cf0943d538	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	f83bd8d9-6cf4-47bf-aa9d-06703949c437
6cdea3c8-64b5-4a4e-b1ec-d3f3359414e6	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUB4671656/B/XL	00b4128d-efef-4e63-9764-b4cf0943d538	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	1d23ceee-a31b-48db-bde7-b820d4dc1722
0c92e23a-4010-4944-947f-556820ca81a4	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUFEFE2D8C/B/2XL	00b4128d-efef-4e63-9764-b4cf0943d538	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2d7ed52d-ad40-4942-a107-88a4a3006e57	77519a90-b82c-470e-99a9-eb8877dad0cf
b90ced41-46d4-4b57-b5d7-f2f1dccfb9b9	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUBFE61AAE/G/S	00b4128d-efef-4e63-9764-b4cf0943d538	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	96e5ec03-ebfa-468b-a40a-1af201caf45c
ea86a0d0-33a6-441f-bfb2-cf421617c052	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PU2C6CE8AE/G/M	00b4128d-efef-4e63-9764-b4cf0943d538	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	a274951d-2875-46c9-a9a8-11a82d9e3e27
48ace9e9-4219-4994-bdbf-d4515edbbc7d	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PUDA319C7F/G/L	00b4128d-efef-4e63-9764-b4cf0943d538	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	730bd35c-f0b8-418f-8208-5edf005b2c31
31f16b28-aa5d-46dc-b197-9b47b38dae4a	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PU1317D221/G/XL	00b4128d-efef-4e63-9764-b4cf0943d538	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	a2c09357-502a-4f6a-9c52-8eea373c9a44
844edbe4-2a3c-42ee-b043-4649fc111eb5	2023-06-14 11:26:07.715955	2023-06-14 11:26:07.715955	PN-PU56CEB642/G/2XL	00b4128d-efef-4e63-9764-b4cf0943d538	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	87775e64-1cef-4c69-ad10-d21db08609e7
baf4131b-d65a-4ffd-86b5-103775e2b00b	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU51CE652C/B/S	013cf771-a260-46eb-85c6-60acbfd5cb32	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0acf7bc9-ab34-4a91-83ed-9da703d3c894
9c489be3-158e-481d-a70a-2b8c8b230c52	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU66688D83/B/M	013cf771-a260-46eb-85c6-60acbfd5cb32	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	98b2361d-f45e-4bbf-a0d5-03999b7327f9
1b93abdd-0c09-4434-ac57-6d0d9012de00	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUE642BEE5/B/L	013cf771-a260-46eb-85c6-60acbfd5cb32	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	27201354-4d0e-487d-8a04-cbbbcc50cd52
f3d75683-3372-4e89-a2b0-870620977a9e	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUF14E5F58/B/XL	013cf771-a260-46eb-85c6-60acbfd5cb32	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	464707b1-bfb4-4de3-a3d2-0fcfb9e2f73a
f48498ad-a613-4913-9841-4057cb046eae	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU4D484ACE/B/2XL	013cf771-a260-46eb-85c6-60acbfd5cb32	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	75199d36-057b-4445-9b55-508cc75e468b
defe9fe5-a265-4759-aedb-1270c742e0ab	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUA6DE229B/G/S	013cf771-a260-46eb-85c6-60acbfd5cb32	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6cb9c348-d66c-4ca7-8b19-73875022f017
9b233b81-ecbc-4f19-b27c-77dfbe056e23	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUDF6CE5B4/G/M	013cf771-a260-46eb-85c6-60acbfd5cb32	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	abd83f4c-cecf-4950-bdb2-4730e2ee5069
b38a4ca5-a1fd-4f75-88c4-9c63d2a715f6	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUE71BB33F/G/L	013cf771-a260-46eb-85c6-60acbfd5cb32	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	aaff39ee-dca3-4511-b677-476a5ccb02ee
bba6ffbb-3aec-4a3a-8549-a11016c51ec3	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUB1AD32D1/G/XL	013cf771-a260-46eb-85c6-60acbfd5cb32	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	2b178c0d-5240-4db1-99f7-0629a6764725
2058d869-0738-4a68-9cf8-fc3c201bfd37	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU28577EFB/G/2XL	013cf771-a260-46eb-85c6-60acbfd5cb32	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	532699b7-87fb-4d71-9ea0-a1c16d2eaa88
383970de-407b-4c64-b454-7983c44115e0	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUC8CB2EF7/W/S	013cf771-a260-46eb-85c6-60acbfd5cb32	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	58fdc22d-d241-47bb-b92b-898f2fe2a3bc
4d170d0d-5811-4c14-8b73-ad469a58dda2	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU2FCA78F7/W/M	013cf771-a260-46eb-85c6-60acbfd5cb32	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	daf01b0c-19e8-4cc6-a2f4-7f478a8355eb
9aca4eee-d90f-40ff-adf9-1f1efca265e8	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PUF99C77D9/W/L	013cf771-a260-46eb-85c6-60acbfd5cb32	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	be4d8243-37e1-40df-b5b9-5131fe9cbbd9
1c5a8357-b032-4577-8915-a4773b68654f	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU5D1F9321/W/XL	013cf771-a260-46eb-85c6-60acbfd5cb32	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	a36587a0-eb0c-46c3-a310-59614bef0c68
a54462e2-f326-444d-a2e8-09cbdb3fe09f	2023-06-14 11:27:50.617536	2023-06-14 11:27:50.617536	PN-PU8C9E2922/W/2XL	013cf771-a260-46eb-85c6-60acbfd5cb32	e8f39507-8e79-41ff-9f74-890067a6d468	2d7ed52d-ad40-4942-a107-88a4a3006e57	a57d166f-a0f4-4650-a4d3-9ea3625d6395
5474ba82-093e-4163-8d96-a0e4ffe5809f	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PU48BC8877/B/S	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d8926c8b-8dfe-45a6-92e0-bee9d56b5d6c
3d13ca34-209f-4e47-9ded-4e836ef83e80	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PUFEAD1BBE/B/M	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	ee7a2363-c53f-4726-97f4-cdc3370eefab
dd24a29d-f9a8-40e2-8c23-bade94555d5a	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PU48F4E69A/B/L	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	f8e97f84-ebc3-4003-bfe4-24ea8c5f756b
9b43489d-a50f-485d-835d-20d56aef8a0c	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PUDE9A114E/B/XL	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	c8b0b3b4-58c2-4877-8a6f-7ebe96fbfb3e
c2c6a1b3-d060-403b-b6ff-dcee8da07f73	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PUE7D8CB71/B/S	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2c7f150a-1087-474c-a1b1-f3026ea62a0e
8c0b2baa-bb64-4970-be9a-c10ce3e591ff	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PU291CA83B/B/M	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	cfa12e35-89a3-49a7-947a-cd0a839a74f2
cea4bc34-ea77-4479-b3d1-2b5c271c6cba	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PUE2534196/B/L	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	bdfee1e3-f259-4b8e-a648-5761dd85bd6b
dcf82387-51c9-49ac-bb00-f243ec214244	2023-06-14 11:29:24.089164	2023-06-14 11:29:24.089164	SH-PU3D8CD18D/B/XL	a2bc74c9-f9fe-4a92-9dd8-8f69e0d11132	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	d65f1f98-720d-410a-9c7e-8587abf8d2fb
ee8f15e0-8b3d-45cf-aae2-9179b44126a4	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU7DCB2DDD/B/S	3777487f-a3b4-4aea-b04c-445c72be2c47	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	8ccdb33b-d8b7-4137-a099-063965e418a2
91f542ad-9b60-43c6-b0a5-223d5ebfc214	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU7F3ABCEB/B/M	3777487f-a3b4-4aea-b04c-445c72be2c47	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2c8b4e78-eeb4-4766-ae64-4bc5687b53ae
668f5115-cf37-4007-81ea-ad6dd602c8bb	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PUBA4A99DE/B/L	3777487f-a3b4-4aea-b04c-445c72be2c47	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	64b7f614-3ec7-468e-a153-2ec9424a4bb0
f1da18d9-2488-47f0-bc04-b7b1a38aa5d4	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PUBAFFBB87/B/XL	3777487f-a3b4-4aea-b04c-445c72be2c47	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	19771e48-6231-4438-957d-91e9d8a5194a
276a40ed-fb89-4d15-9bea-b2ba15afeaab	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU632FE1DA/B/S	3777487f-a3b4-4aea-b04c-445c72be2c47	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7c70a83b-4d31-4a43-bf60-238c7cd75bc0
9c7856f9-4e7a-43b5-82a8-870c89ccec0b	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU4ADD6E37/B/M	3777487f-a3b4-4aea-b04c-445c72be2c47	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	f7c37b43-2238-488f-ac85-0d3bd8568e62
dec6fc10-5e38-4b46-9215-d9272ca311d8	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU48E43643/B/L	3777487f-a3b4-4aea-b04c-445c72be2c47	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	28962e64-4af8-416d-9b22-7598b0c0341f
09c2881b-6843-421e-8132-8630a45c1576	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU711ABA89/B/XL	3777487f-a3b4-4aea-b04c-445c72be2c47	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2ed55aba-1311-4e78-a262-2712ad7896a9	319aa159-25c5-424d-a14f-d8389a23126c
9ed38252-b6d8-40ee-8149-6de76e9ab595	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PUACE29E77/W/S	3777487f-a3b4-4aea-b04c-445c72be2c47	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	017acf0b-181d-4632-9e63-6bd8faaf7fb0
6f3bffb5-6626-4779-ba6e-799123f84ec6	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU8248FEF1/W/M	3777487f-a3b4-4aea-b04c-445c72be2c47	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	705be3e8-e2d5-40b5-b889-9865916dc630
1d31aba6-665a-440b-afd0-94cadb187177	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU29981326/W/L	3777487f-a3b4-4aea-b04c-445c72be2c47	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	6037401e-34ba-485a-9097-1da71538da42
2bba7f97-418a-4bf1-ad7f-88da70b29691	2023-06-14 11:30:14.266358	2023-06-14 11:30:14.266358	SH-PU15D2377F/W/XL	3777487f-a3b4-4aea-b04c-445c72be2c47	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	e186cc35-12c8-48d6-b0f6-c0c491f70518
4fc5272a-3707-4667-90b4-ada56e7d7f38	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PUA591E165/B/S	cea86f16-3592-420f-92c6-f20c18ef4c25	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6601fc31-b4fb-429f-851c-5aeeb66efc15
356ecf52-96b7-4a31-bb36-cf942e6831c3	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PUFD33D9C1/B/M	cea86f16-3592-420f-92c6-f20c18ef4c25	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	be3d628b-07f6-458d-b41b-808233ecb5e4
c16527a7-5cbc-4f48-8157-383a0ee31371	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PUCFFEBAD2/B/L	cea86f16-3592-420f-92c6-f20c18ef4c25	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	bc8fcddb-0b81-4b3e-92e6-2374d839a8b1
7ec6dfad-92ab-443c-b1ab-b8fad3a51bbe	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PU573B5D31/B/XL	cea86f16-3592-420f-92c6-f20c18ef4c25	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	0582346a-8557-4ace-b956-7049dfa5ca97
54427a9f-04cb-4c57-8052-3f0eb7790eac	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PU5D1B37DC/P/S	cea86f16-3592-420f-92c6-f20c18ef4c25	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	05657ee3-4361-4737-82b5-22ab84c7f62f
bdf0920a-9479-43ea-80c1-2db6f6709259	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PU96836FD8/P/M	cea86f16-3592-420f-92c6-f20c18ef4c25	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	25ca3f3c-d23a-46cb-bf02-9eced9791a64
d6796088-acad-4b8b-8347-c169ef49117b	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PU66D755A3/P/L	cea86f16-3592-420f-92c6-f20c18ef4c25	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	24a1dc34-040c-4c55-8006-2ef122237fbf
d712b0cf-fcf3-434f-b7c3-0e5e6af57766	2023-06-14 11:31:06.613099	2023-06-14 11:31:06.613099	SH-PUEFA28497/P/XL	cea86f16-3592-420f-92c6-f20c18ef4c25	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	5e66330a-30dc-4c58-8194-7b631bb49810
43fc07f1-99c1-4f40-8122-026976dbd574	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUBB9B14AF/B/S	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	3911ec9d-b1c0-4cd1-b2cb-6cca25f21950
3435885c-b23f-4ba5-973f-7e1422187037	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUA3ACDF19/B/M	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2c0e5a52-35fb-42d6-8de2-8d01c4e1364f
6c6fb6f0-d84d-4d66-998f-aa9bd4925c2a	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU621F3185/B/L	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	23507a69-6961-49fa-9b09-6a24f2e65cf2
68d57831-34ac-4693-b9b5-cb9a6a259c6e	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUE4EFA788/B/XL	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	542032ed-2f04-4933-ae9d-24f19975f665
80b6aa4d-5eb8-4958-8175-515c85d74ca4	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU3DEF78C6/B/2XL	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2d7ed52d-ad40-4942-a107-88a4a3006e57	323fe4e2-fb00-4087-835d-5009b73dbaf4
891e2fe0-989b-4c2c-b4bd-f4113b264b52	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU475B1BB8/B/3XL	d81e30de-c240-4300-ba21-5b8643792b2e	545a2a6e-b4f3-491b-856a-4d8008fd8f75	fc500351-9486-4043-8198-77f4c2b58dc0	2da38555-2a4e-40d7-9d27-efbe2acbafc1
2d55c598-cf95-4c74-b634-c3deb54b7850	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUEAA91C13/B/S	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	4aba9e63-74ff-470d-88d4-6cb5619b5e21
187b97fa-3c8c-4a8e-9530-f4e721cbbb1b	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUA4385183/B/M	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	85bce2e7-f0d3-4121-ad84-a48df35b1ee0
938854e2-4153-43eb-9d39-49efe5a4b2f9	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU8C726A9D/B/L	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	24be3f9b-5e47-46d4-982a-1a2a958e24fd
90743359-b07a-48ac-93ea-15a71c02f276	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUFCFA6C62/B/XL	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2ed55aba-1311-4e78-a262-2712ad7896a9	164b17c9-16f0-4f0d-bb12-81043bc2eadd
85f3924b-77e3-4d87-b39f-72a8e60d2350	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUDB9C359C/B/2XL	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	2d7ed52d-ad40-4942-a107-88a4a3006e57	aa83b4c9-c4c7-467d-ab1a-9431722592fc
21dd9e58-718b-402d-a2fc-213b7e0e4132	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU9754874C/B/3XL	d81e30de-c240-4300-ba21-5b8643792b2e	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	fc500351-9486-4043-8198-77f4c2b58dc0	bc90c6bc-e383-46c7-9d1f-5917a33aff8d
a9041e6f-0b7e-4ea8-92c4-2cf8756227b9	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU79FB96FE/G/S	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0a3bf174-dd4e-4f27-a734-126c15725e0e
c71e7919-6c5a-4b46-8f06-f8837005cfe5	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU27F8DD85/G/M	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	f7a6682f-bfd0-4856-9518-15f7c2ae0f97
31944a69-6d13-403f-b641-0e2276b56927	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU5356F98A/G/L	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	ba1f9662-06ac-4cb6-adc2-8a19aa22ac41
9034431d-3a75-47f9-a50b-7793f77dc1d2	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUAAECFCA9/G/XL	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	a37d871b-5c21-44c1-bf17-f765a7010f90
0bd3c2b6-d5dd-4426-9637-646e11eabee2	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU6641F2A5/G/2XL	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	305e97ac-8ac0-404b-a642-19e12c2c77a6
1e7235d8-4155-46f1-bcf3-c43e630d8d20	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUDB88B574/G/3XL	d81e30de-c240-4300-ba21-5b8643792b2e	b768b2b3-5576-4e50-b317-6243d69453fb	fc500351-9486-4043-8198-77f4c2b58dc0	97b770a1-4fa0-46c9-a017-331b353cf0ea
e01dc65c-061d-4572-ba06-ac832f593de9	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU764E6657/W/S	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	337ab809-eadc-415a-a208-4062d2e5233e
e77adcb0-6d78-4789-adfa-4efcc0e1cd04	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU5B5DC2E7/W/M	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	da2da711-700f-46c1-ba3a-c97b41856100
457ae2ae-6ab8-4958-917d-c4ad6d93e6c1	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PU1B1EA927/W/L	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	7d58c696-9376-4768-b00c-82ecfe85b45e
f10a8069-0e32-4b15-ad4c-e82be79f30eb	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUF4D2EB9B/W/XL	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	ba1e94ca-e3f9-4226-8350-589eecef9ab4
35e103b2-c7c7-443c-a086-f64cf4ae9c9a	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUC1F92A9A/W/2XL	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	2d7ed52d-ad40-4942-a107-88a4a3006e57	f600014c-38eb-4c71-8570-20461e7dadfd
b1281d10-cf59-400d-bc9a-4e400612e3df	2023-06-14 11:34:55.280562	2023-06-14 11:34:55.280562	T_-PUAF6AFD28/W/3XL	d81e30de-c240-4300-ba21-5b8643792b2e	e8f39507-8e79-41ff-9f74-890067a6d468	fc500351-9486-4043-8198-77f4c2b58dc0	839aee10-6e8e-4508-96f6-de595061b99c
af245f40-74bd-48bb-8a00-e04596e005ea	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU66736FF9/G/S	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1a37b5c3-e313-4d23-b1a7-2a3fc19e7d89
c927a4a9-62d8-4892-80fb-73b0ab23d78f	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU8F1C47C5/G/M	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	a067ec40-e332-4b69-810b-b2d164d400e2
50dbac27-bab0-4a85-94cb-286a2edfa57a	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU12FB84C5/G/L	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	3d300c5b-6327-49b9-9614-2936beb4649b
468c69d8-0ec8-49e7-a556-f479999e07c8	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU1C49691B/G/XL	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	69f6b64b-b80a-4767-be2a-d4a11fea9dab
8ae10dcc-b2bb-42bf-8908-d3c4c7c89d58	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU11687E52/G/2XL	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	2d7ed52d-ad40-4942-a107-88a4a3006e57	c7a841af-a7f6-4a61-a8ed-2b9b322cf5a7
dbf86bdd-7a31-4615-a2e1-bf2147ca18c2	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU44AD4DDC/G/3XL	c667567a-0801-4cd3-8924-0178261af329	3c314204-70d9-414f-899f-11dac5eb6b12	fc500351-9486-4043-8198-77f4c2b58dc0	fcee8a73-1c10-4a56-b7e8-8c35bfd9edfd
34e38c5b-a947-4de5-a4bb-f2bff3b7a72c	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU798AA572/G/S	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	2ce9b8e7-1dcf-44f9-a93c-e35ff45cdafd
b245afe9-e586-41b7-b020-b9f4f9dfc4ac	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PUED18688E/G/M	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c5e8646a-1a5c-44f1-ae87-0cd9045e1ed9
20859146-5cb1-4172-986f-8e574eeed356	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU5DF36615/G/L	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	bb010df9-b43d-4772-93f0-cb00edb0f5f7
b1ab2d20-a5ee-45e9-b386-5433afa3d90d	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU5F32CC67/G/XL	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	14ff1730-74ff-4207-9492-a3822434ca82
1210819c-706e-46e1-8ec1-04004169f13a	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU7348E93B/G/2XL	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	4f9ad93a-2db0-4c9e-965d-89bfa305a18a
7004bcbe-be8e-4821-a9f4-a2fcb9423829	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PUCF15B28F/G/3XL	c667567a-0801-4cd3-8924-0178261af329	b768b2b3-5576-4e50-b317-6243d69453fb	fc500351-9486-4043-8198-77f4c2b58dc0	319bacab-e9f4-4030-aac0-31904cac6044
3c345929-d73e-4a2b-b182-a07423986701	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU3711F6B2/P/S	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	4f0b5648-fc6f-4add-8d79-bf5d3679c68d
4e0a565e-4045-4189-9251-f021d011d264	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PUFFC52D4B/P/M	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	123d3241-b58a-4cfd-a285-e6e37889d9cd
69ed1b18-3d3c-42c1-9273-e9100c4c6304	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU35945442/P/L	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	4180f07d-255e-411b-bf91-15f4702c5227
65d70740-be36-4928-ba73-a25df8e74934	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PU3F918D9D/P/XL	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	55a38746-4e81-4b0d-8603-93587089c1f3
82417ee2-679f-4ff7-bcfa-338b05319a74	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PUDC8B79E3/P/2XL	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	2d7ed52d-ad40-4942-a107-88a4a3006e57	2d02e2a1-0b5a-4794-b297-661cc9b405a3
cedf9a85-bc1e-4a6c-9e65-30284af958af	2023-06-14 11:35:46.493031	2023-06-14 11:35:46.493031	T_-PUC6ED69A7/P/3XL	c667567a-0801-4cd3-8924-0178261af329	f16d53c0-7ece-435c-87d8-068186398eae	fc500351-9486-4043-8198-77f4c2b58dc0	c3af230d-2474-4ffb-8d2a-f882902dbc53
1d34fd12-208a-41a4-8feb-a1c5e0c69b31	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU897D1975/B/S	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	a305ca6a-d145-4ecc-a2b1-15b7ddc1ebad
d1614aa6-1675-4455-b3fe-cb0063f6b5f1	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUD6447C1A/B/M	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c0b8268a-b238-411e-8e95-e69f455107c8
91c47e0d-118d-4151-9375-274a98045967	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU9358DF6D/B/L	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	af3fb63b-f2ac-42d0-91e7-2696309eee5e
85247c8d-5529-4eec-8203-545aea8121c4	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUD47BC8A8/B/XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	e6363518-4631-4496-897e-49618a704304
11b429ff-6997-4b14-a637-8107e47b0311	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUDD2F864C/B/2XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	5a2d7aff-160b-4255-afff-4a41a8b6d281
43a26d4d-881f-462c-bee7-db115c383853	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUC8EFDB75/B/3XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	a1b54494-0e51-4801-bcfa-9dbdf2466e97	fc500351-9486-4043-8198-77f4c2b58dc0	3de96f85-21f3-44a5-9e82-462f5e8a3c7c
6fe20c1f-7efb-45cf-a308-040b00fb7198	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUFD479A15/G/S	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	925dc306-1fee-4985-83ba-c3ffe1d6fa37	561cfff0-2212-411c-8756-add9f1429603
c60e1dec-f733-4446-b806-2a16d5672db5	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUC9E16618/G/M	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	f3a2b97e-1dba-4a7b-8067-f89e8400d227	761d092d-a368-4e9b-9ff1-0da750b14fe3
e436f892-5d13-450a-9fe2-4a43a9b07c8d	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUFAA399EC/G/L	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	def52206-45aa-48b9-bb32-9f05c45e7461	b6eefb8c-1951-4b09-9c82-5a4002b06b6c
f6be8720-3aaa-4caf-adb9-bb2029ecb103	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU345D637E/G/XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	2ed55aba-1311-4e78-a262-2712ad7896a9	f70ea57c-6d0a-49df-bbdc-5d6f009c8b50
2216a78c-04a4-4e30-a55d-fab6c12a1ed1	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUC64E68A9/G/2XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	2d7ed52d-ad40-4942-a107-88a4a3006e57	e9d482e3-de72-4722-a977-15e3bbcb9487
8ade2587-e29e-43b2-9afd-465fabd05510	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU43829E5E/G/3XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	b768b2b3-5576-4e50-b317-6243d69453fb	fc500351-9486-4043-8198-77f4c2b58dc0	a7df9e37-ca06-4f1d-8e2e-2d1121ec4f35
a8abe764-0533-4e6f-be11-0177765259de	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUA885A358/R/S	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d919cec7-c8b8-4600-98ec-2c1e2900fa16
70791555-1326-418b-aace-0de5936cb96d	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU28B2AE4A/R/M	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6e8ac359-7620-4582-b884-728337b56809
70b9e604-775d-4957-b30b-99d6e0e9dbbb	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUC29ACD15/R/L	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	95c307f1-a1e1-45dc-a7fb-49b69b0edb8e
d9a4f6d9-6716-43a2-86d5-d2e3635eab61	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PUDD62623F/R/XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	2ed55aba-1311-4e78-a262-2712ad7896a9	51cd6ebf-3501-464d-857c-478c8a1949f9
7eb9a0b6-50ee-4555-9ee8-9be0579e70f7	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU1F61EEC7/R/2XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	2d7ed52d-ad40-4942-a107-88a4a3006e57	bc0629ae-940b-48c5-8fea-35d8b7a079d3
ff6cd864-027f-4c37-a2d9-0bcda080507d	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU3BF6716A/R/3XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	fc500351-9486-4043-8198-77f4c2b58dc0	12735398-9ebf-4710-b0cd-26b51c300be7
59adc816-c645-411d-a05f-69406635cdb0	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU829D78E1/W/S	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	32353683-03f5-491e-be5c-e30f6d1dd561
b59588f7-41c9-440e-b109-0c26c5ed3efc	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU34E1D134/W/M	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4679da16-e3c7-45d8-94cf-e6b44e77a9a5
1dde5134-b2e8-4320-9311-6da728adbb7e	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU14A2BE92/W/L	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	9af14d3b-8850-4db3-afac-edfa10a5fe34
64dcbfca-c03e-4a16-94e6-4d996268f3a8	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU7D4DBC16/W/XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	34fdb3c7-1fcf-4259-a62c-7c210276ef08
ca961274-4427-4831-859a-3af0b7d63cdb	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU562D66A7/W/2XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	2d7ed52d-ad40-4942-a107-88a4a3006e57	490f0c6f-de43-488f-979b-3237ecfd3bb2
be3f2600-c53e-4f44-b713-9d349b5e22b9	2023-06-14 11:37:49.044005	2023-06-14 11:37:49.044005	T_-PU8DD8D6F6/W/3XL	cdf46532-6fc1-46c7-81a3-05fdbdf92dc0	e8f39507-8e79-41ff-9f74-890067a6d468	fc500351-9486-4043-8198-77f4c2b58dc0	bda05b6f-ac1b-4c83-b16e-61048f193aec
f6b87866-2e3d-4162-b3a2-906586ec4e59	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUC7C19FED/B/XS	edfda6a2-f5cd-421b-b6e5-391f1e216143	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	6f98f6df-6922-44bb-8af1-681ff6602ba6
44ff1044-ecbf-4586-a9ab-fb2ac8f3453f	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PU1E7A6B3A/B/2XS	edfda6a2-f5cd-421b-b6e5-391f1e216143	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	044d3a1d-f450-4a99-bdb9-528ea710b577
6e6f4afd-e052-4a5e-9a6d-10bee8a6f46f	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PU471EE51A/B/S	edfda6a2-f5cd-421b-b6e5-391f1e216143	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1aa8a526-c773-4549-b5db-a0ae094c7470
699fef74-35a4-445e-98a0-f8f0a3a0ef5b	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUDAA251BE/B/M	edfda6a2-f5cd-421b-b6e5-391f1e216143	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	ae189348-4fa3-4b76-a26d-f28f8b2c392e
7c0773b5-fb96-4b9f-a73f-34e6920fb491	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PU4114A1E9/B/L	edfda6a2-f5cd-421b-b6e5-391f1e216143	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	034593e8-6a58-4b7e-af87-2e6e9c06dced
7ee07f50-08e5-41b7-bce3-1e4bcacf05b6	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PU719E2B9B/B/XS	edfda6a2-f5cd-421b-b6e5-391f1e216143	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0b93fc55-7742-4145-85f3-f9d77967ece2
8e0d552a-bd86-4428-a587-f848f4d0872d	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUB525C2C8/B/2XS	edfda6a2-f5cd-421b-b6e5-391f1e216143	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	31403aa1-c474-4559-8878-c2d8a1185e02
79e5603e-682f-496e-af16-31b7f5ee306a	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUA5F86B84/B/S	edfda6a2-f5cd-421b-b6e5-391f1e216143	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1b0f4072-2732-4066-ab61-f547613c1ee9
0e400893-7ffb-4d70-9f05-f10c98c99039	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUF175FD75/B/M	edfda6a2-f5cd-421b-b6e5-391f1e216143	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3beac0a0-6435-4356-b086-5152b642d4ca
72cd8436-16a2-4c62-b929-2a4c9ae59b0c	2023-06-14 11:39:01.897765	2023-06-14 11:39:01.897765	BL-PUC1CB76C9/B/L	edfda6a2-f5cd-421b-b6e5-391f1e216143	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	1b98f318-a319-440a-a424-4134c0e6dbb1
41aee008-a794-4085-b27d-210c2bf0c65e	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PUBAE1ECE9/B/XS	88a43f86-ca7b-4b1a-a144-a08cb1764c48	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	589b9df1-bd33-4e07-967d-6593571acc2f
987c2537-5996-4a09-97c2-414435448dd4	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU214EC86D/B/S	88a43f86-ca7b-4b1a-a144-a08cb1764c48	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7e1d4e14-ef2b-4dfd-b9f4-61279e798601
5fc105d2-90d8-4635-b8e4-65bca1bf4171	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU75DE31FB/B/M	88a43f86-ca7b-4b1a-a144-a08cb1764c48	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	1b2c8652-8f2a-4131-95f1-b8fcf77f1643
89b5952c-b536-4f3b-acfd-d2aa2124b305	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PUA1C1194C/B/L	88a43f86-ca7b-4b1a-a144-a08cb1764c48	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	975201cd-10e3-4bef-8f03-564086c6a7f9
f8d75f73-b112-40d3-a0e4-19c7b2e628fa	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU1E68E97A/B/XS	88a43f86-ca7b-4b1a-a144-a08cb1764c48	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	ff7caaa9-e376-4f35-9e49-3b3469b90429
978cd35b-82fd-42cc-9781-cbe11080ad96	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU18F8BC4A/B/S	88a43f86-ca7b-4b1a-a144-a08cb1764c48	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	a21afe09-07cf-4f41-a8ba-61870ef03bef
2eab46d0-6d1c-4701-bf17-8f33db101f85	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU71D655A7/B/M	88a43f86-ca7b-4b1a-a144-a08cb1764c48	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	55ab512f-3978-4799-bf36-ea53c40fb129
cbbccfaa-f2da-46ac-801a-5b75315636cf	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU9B7FC7B2/B/L	88a43f86-ca7b-4b1a-a144-a08cb1764c48	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	544d11ba-b03b-43c8-8a08-a6d69bad2858
72fa9837-7298-4d6b-86af-a0936279489c	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU5DBAE741/W/XS	88a43f86-ca7b-4b1a-a144-a08cb1764c48	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	c91006f6-81b1-4ad7-b79a-9abbdecca068
bcfb7c7c-0f12-4221-9c81-ddf6ca7c6577	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PUE9F5B797/W/S	88a43f86-ca7b-4b1a-a144-a08cb1764c48	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1e1e770f-822c-4a8e-982d-7baecd059c6c
78efcbed-1537-4a32-bd4c-0bd6a9764819	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU1573D222/W/M	88a43f86-ca7b-4b1a-a144-a08cb1764c48	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	fd827f5d-fe7e-4741-b714-d95c16eff325
61bd8fb9-4af2-48ef-b79a-fb1167a1d33d	2023-06-14 11:40:03.640011	2023-06-14 11:40:03.640011	BL-PU372E5825/W/L	88a43f86-ca7b-4b1a-a144-a08cb1764c48	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	f9d1ca04-9465-4af1-ad74-9a705f543b5e
c9d4e31c-f29e-4f17-83b6-355be24fb9a0	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU5384A829/B/2XS	820ea58b-9d9b-45bf-aef1-da5109cd8c52	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	8b727a07-f552-4264-8204-0aae845c6490
891e2dbc-0904-4ad5-bd18-80df73ff7ed9	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU44C6292D/B/XS	820ea58b-9d9b-45bf-aef1-da5109cd8c52	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	8ae0f950-ff4f-40b8-bab0-51237fa51af5
396761ba-c755-4a1f-a06f-fc9d4ba842a6	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU2B162A3E/B/S	820ea58b-9d9b-45bf-aef1-da5109cd8c52	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	6e249123-0577-4bca-a703-c324fb355ce1
9f6fa1b1-6e82-4025-ad9c-9129ea32f699	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU8F2B4337/B/M	820ea58b-9d9b-45bf-aef1-da5109cd8c52	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	85c29219-6d47-4773-9b5d-a17c0aa10ad0
e84f3050-16c8-4355-a12f-c421c3f30e83	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU958A6DC8/B/L	820ea58b-9d9b-45bf-aef1-da5109cd8c52	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	8b794418-ccc4-4181-8fb6-3f1b2f05dc82
95482212-2b44-4aa1-b1be-cdf84a91c4b9	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PUDC7DCA97/B/2XS	820ea58b-9d9b-45bf-aef1-da5109cd8c52	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	0b287c5c-ebca-485d-b648-3eeeb26f4c74	29d5dc6e-ec0a-4197-be80-09c65c4ae6b5
fe2dd981-49f7-44d3-b597-60ed93a1c47f	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU799FB9B3/B/XS	820ea58b-9d9b-45bf-aef1-da5109cd8c52	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	85672dee-7b35-4cb1-8b5f-2269f877ae28
704d33ed-a2f2-4774-917c-f71908ce93ea	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PUC9BB73AD/B/S	820ea58b-9d9b-45bf-aef1-da5109cd8c52	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	c3e6a3ab-4797-446f-a2c7-c48d2157f6bd
6e25fdc5-7413-480b-9ca8-37ab566bf479	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PUE92A5DBB/B/M	820ea58b-9d9b-45bf-aef1-da5109cd8c52	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	00afa5a9-7c5e-4747-8892-2cbd1caec76a
d76e20a7-fcba-4d7f-af3b-dc9e44f0dd7f	2023-06-14 11:40:45.149144	2023-06-14 11:40:45.149144	BL-PU69A2D384/B/L	820ea58b-9d9b-45bf-aef1-da5109cd8c52	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	72f3a40b-80d1-40c4-b8a3-b54c015a9b35
3e58910f-b46a-4ef0-aec7-4a9b3c94e66d	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUEF7B8C98/B/XS	b6e9a335-0b5c-4888-83a8-c346a8228482	545a2a6e-b4f3-491b-856a-4d8008fd8f75	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	88b3c783-a4a2-4ca3-985e-3996be650f08
9617d238-ac7a-4770-95ca-abb8da5d9a7e	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUC2571C62/B/S	b6e9a335-0b5c-4888-83a8-c346a8228482	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e02f0192-167a-4799-b44b-d9de0cfe9542
d108e61d-a27f-4e14-a745-b5afbdc16501	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUA38FCD67/B/M	b6e9a335-0b5c-4888-83a8-c346a8228482	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c490a5f5-5809-4c76-8ed1-c719129f169c
14d907c1-3bd9-4b7c-b127-c4be2c7f0dc0	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUA767B5D2/B/2XS	b6e9a335-0b5c-4888-83a8-c346a8228482	545a2a6e-b4f3-491b-856a-4d8008fd8f75	0b287c5c-ebca-485d-b648-3eeeb26f4c74	7ca00fd8-6707-4e76-9513-6c115e72b9d3
50cd1910-6c76-4641-98f5-89ffc44aa76f	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PU5562D87A/B/L	b6e9a335-0b5c-4888-83a8-c346a8228482	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	3508bf4a-2287-4aa4-899c-b820883794fe
80bfd564-0b71-444f-9743-a7fd6636f1ee	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUBDBBE1B1/W/XS	b6e9a335-0b5c-4888-83a8-c346a8228482	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	10f163d1-ca82-45b1-b2ec-015f14ce5bf3
47d39381-94bb-4146-a8d0-16c8da017d8b	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PU9222D942/W/S	b6e9a335-0b5c-4888-83a8-c346a8228482	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	d6561e82-d6b2-404e-9324-1a4f9c3aac13
a6fe5d8e-ea7b-4f83-b434-7f9541234e04	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PU6AD43DE6/W/M	b6e9a335-0b5c-4888-83a8-c346a8228482	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	2fab3ea8-00fb-4fd8-bf3f-a24bf876597f
b13f25c8-4573-4473-9aca-328eff61c2d2	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PU43D83956/W/2XS	b6e9a335-0b5c-4888-83a8-c346a8228482	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	a422a7d0-01dc-47b4-bd1b-6feea36da84c
3ba5b143-999a-499f-a4c2-142553b6c211	2023-06-14 11:41:40.923629	2023-06-14 11:41:40.923629	SK-PUFB43D516/W/L	b6e9a335-0b5c-4888-83a8-c346a8228482	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	69a771f2-044e-46c3-8f43-cc92e930539d
8593a2bd-53dd-45e6-bc42-fc0cf50d024b	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU54BA6858/G/2XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	3c314204-70d9-414f-899f-11dac5eb6b12	0b287c5c-ebca-485d-b648-3eeeb26f4c74	17f4d21a-f00e-4b15-a7dc-1f68251c5397
b9cb8190-4a1a-4111-a2fa-6a857bea2cc4	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUDCFEF4F9/G/XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0f32d833-109e-42cb-9464-89a8c60185c5
022f3b83-f107-42d4-8c92-ccb468c61d42	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUC935A2F1/G/S	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7863a336-b0e5-400e-a4e1-3605f8d535c0
78152eae-70c2-4d38-94b2-b158713740b6	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUB76E6866/G/M	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	5bcf02dd-cdab-4351-8e01-590c7fb73d03
3a875b3e-1cf9-4706-bbf1-39344287f57a	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUC6C28D4B/G/L	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	796799df-ceba-4b56-a3b3-242e104b4043
e4850875-4a88-4c8e-8049-ea01e07bbcc7	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU9DBA21FA/B/2XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	0b287c5c-ebca-485d-b648-3eeeb26f4c74	4be22d99-5b08-45b3-8518-027a6aeeec34
9ef4cefb-d852-4912-ac08-7a53cea94d91	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU56C779EB/B/XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	7338381b-8b03-4c4e-bc3c-4911523738e3
c01068e7-06e7-4273-ad32-65b238dc28a8	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUDB424B3E/B/S	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	aa98d5ff-9db4-47a4-be3a-4d06d88060b4
b77d73cc-9371-42e1-b9b4-8f262b5df3a4	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUD2651EFD/B/M	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	322b7d4d-5b8b-41bf-b7eb-a3b99dd1dd1e
e250e6a9-1a8e-4ed4-896d-6952b75ba1cc	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU7199E827/B/L	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	58753fff-a58d-42d8-9f62-bf219daf4eb9
bd8bd5d6-848b-4080-95de-0364f9840125	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU99BAA9EB/B/2XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	cdd385a8-9e3e-4d6e-b8d1-8abda87a3045
3e2a4ca1-9d6b-4b79-bd32-787980163895	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUAB62D95D/B/XS	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	06eecefa-5c2f-4eea-8de5-eb221523c4b9
d08160b4-7e1a-4938-a800-7d0e57d36ba0	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU18825485/B/S	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	3487dd71-3799-4cfe-a969-796dcb4fafa3
9174b927-1e25-4ec3-8991-f2b185b17d72	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PUFCB91D67/B/M	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	dd3af16b-1300-4cf2-8352-7a52fd9b59af
9ed67c7a-72af-4923-9e98-09183786b5d2	2023-06-14 11:43:02.503467	2023-06-14 11:43:02.503467	SK-PU6F758528/B/L	fb73b4d7-afb2-43ac-8dd8-9efe368078a8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	8830e8be-3072-4981-8805-7b80037f5e17
93c9eaba-ed5c-4737-b50f-80c12dcf931e	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	SK-PU865FEFA9/B/2XS	60dd91d0-9978-420b-abcf-a07f6d30aab7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	71c2fd8c-e7d4-41c4-85d7-8aaa91b81416
24274026-2d68-4aa6-8c18-79032ec639e8	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	SK-PUD2CF3BED/B/XS	60dd91d0-9978-420b-abcf-a07f6d30aab7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	ce37d1db-767c-49d6-bdde-b23986d14e4c
c757f61a-43e5-4acd-9485-e39d89c14005	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	SK-PUEB1ACD2B/B/S	60dd91d0-9978-420b-abcf-a07f6d30aab7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0c64a254-1925-4eca-a9d5-4f5c49947705
c05a3bba-9de7-4988-a0cf-7f313d9c38ec	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	SK-PUEA72F9FF/B/M	60dd91d0-9978-420b-abcf-a07f6d30aab7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	17cf54c3-734a-4c55-9869-510836208502
54042493-7b62-4e01-91ae-16142508e0a2	2023-06-14 11:43:50.418482	2023-06-14 11:43:50.418482	SK-PUED12A323/B/L	60dd91d0-9978-420b-abcf-a07f6d30aab7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	3195d0da-7f80-4921-9e45-51c84c4ef75b
e3b24fe0-d084-46b5-9414-8e455f37403a	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUF5C4E781/G/2XS	5f859a61-765f-40fa-8b55-96e4ba5af723	3c314204-70d9-414f-899f-11dac5eb6b12	0b287c5c-ebca-485d-b648-3eeeb26f4c74	df7b6c95-b95a-4251-b2b0-308583c4b8df
93d82a65-f586-4a6f-9448-cb9dc0de5685	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU36C3657F/G/XS	5f859a61-765f-40fa-8b55-96e4ba5af723	3c314204-70d9-414f-899f-11dac5eb6b12	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	9aaae642-61c8-47b7-9b44-a29c0c75b865
6bbe5ec9-7c86-45dd-a056-9ce6bd023fb1	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU3B54DDB5/G/S	5f859a61-765f-40fa-8b55-96e4ba5af723	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	446bc773-5779-4c5d-9b20-a96dc412a324
ac0c513c-4b15-45b0-b42b-66ac8a9d1296	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUDBA542F1/G/M	5f859a61-765f-40fa-8b55-96e4ba5af723	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	b18b3273-13d7-4f65-b654-73eaf547ed20
ad895dd1-1f0f-43b6-a5c8-8e951d7113bb	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU7539F21A/G/L	5f859a61-765f-40fa-8b55-96e4ba5af723	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	de11b961-c067-4b15-ab8c-880472d3a28e
03f63f9c-c302-49dd-8699-891a1cc662cb	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU81A82D7A/P/2XS	5f859a61-765f-40fa-8b55-96e4ba5af723	68c94815-02e1-43e5-9495-dc40cbd994f2	0b287c5c-ebca-485d-b648-3eeeb26f4c74	9d90ed89-c777-44dc-92fc-94d7da54afb9
d63034c6-16be-4bbd-b6cb-b4e31b539781	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUA9A7F6D5/P/XS	5f859a61-765f-40fa-8b55-96e4ba5af723	68c94815-02e1-43e5-9495-dc40cbd994f2	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	bac63c40-ee36-4ab2-ad8f-4ef19fbead4e
d059855b-1bec-48ec-bb39-1a9888cffaf9	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU778472AC/P/S	5f859a61-765f-40fa-8b55-96e4ba5af723	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	87c4d42f-67eb-4197-a8c6-2e20fca2f223
871b58c2-f099-4431-889f-00de9c2ea6db	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU1F2A16FE/P/M	5f859a61-765f-40fa-8b55-96e4ba5af723	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	70601909-e28e-4d3d-8e51-93860286c439
b1fdd24a-1665-4b24-bc3c-e868cdd70f1a	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU22481A5F/P/L	5f859a61-765f-40fa-8b55-96e4ba5af723	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	f8a3be92-1746-41b8-8023-80058323d52f
cc5f3c74-9e0b-4038-82cb-aeeec1aaa586	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUACD41C49/B/2XS	5f859a61-765f-40fa-8b55-96e4ba5af723	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	0b287c5c-ebca-485d-b648-3eeeb26f4c74	ccf90fef-2dc7-4a10-ab86-e0d5465388f6
36fa4119-b509-4829-a3a4-0c62be9eb9b8	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUDD42746C/B/XS	5f859a61-765f-40fa-8b55-96e4ba5af723	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	fa2f1fdd-016c-425c-8289-96a1f2681fe3
4aab23d9-3173-4550-8a88-90c1e9516d51	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU3D1118DE/B/S	5f859a61-765f-40fa-8b55-96e4ba5af723	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	925dc306-1fee-4985-83ba-c3ffe1d6fa37	81dcaba7-f156-463b-bd2f-f8fe11318d0f
a0c1d442-2a21-411e-b176-acb8f670b5b5	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU38C7E7F7/B/M	5f859a61-765f-40fa-8b55-96e4ba5af723	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	f3a2b97e-1dba-4a7b-8067-f89e8400d227	76e87266-d94b-4341-8bf7-5f2727ebbc31
1720e0c0-7ee3-4ca9-982d-f3568b20e032	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU14ABDDDB/B/L	5f859a61-765f-40fa-8b55-96e4ba5af723	97302b3f-0dc5-4bc3-82f5-2573a7f3d27d	def52206-45aa-48b9-bb32-9f05c45e7461	e1e13c90-e80c-4862-b935-62bf8f14be46
07ab7bfe-1725-4eef-8c19-6b790a7cd384	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUFDEED99D/W/2XS	5f859a61-765f-40fa-8b55-96e4ba5af723	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	8bf5f6f4-fc04-4313-915d-5c06b1203b83
e564b681-a202-41cc-ae12-74a922ef0e30	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUB2A3B38E/W/XS	5f859a61-765f-40fa-8b55-96e4ba5af723	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	c308675b-4682-4a11-b86c-3516655a40ef
2d4ef8da-3923-429a-9d5b-112862066715	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUE3ED3958/W/S	5f859a61-765f-40fa-8b55-96e4ba5af723	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5b47cce4-068b-458b-a6ee-9174c7ccaa1a
0493e1e5-c5f6-4f27-854b-e0f35aa26419	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUDD654D27/W/M	5f859a61-765f-40fa-8b55-96e4ba5af723	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	b6980410-3455-411f-a87d-4a69360e737b
2cebda2d-e402-43ab-9811-7ee4e650a2ad	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU655956F1/W/L	5f859a61-765f-40fa-8b55-96e4ba5af723	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	a45282f8-4ce1-442b-8bf9-1e77a9c8bfaf
2574c0c3-1892-41c6-a79f-b7975eb68053	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUBA15C166/B/2XS	5f859a61-765f-40fa-8b55-96e4ba5af723	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	209b283e-f9f0-4212-801e-24e402d8fcf7
f680b3b3-9528-4aab-9529-faeb50b2474a	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PU8967A4C1/B/XS	5f859a61-765f-40fa-8b55-96e4ba5af723	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	24bc8010-d3cf-4086-9aa6-2a23176459cc
e9f9ff0e-539a-4b28-b6c8-962c4e0a6d81	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUDC9114C7/B/S	5f859a61-765f-40fa-8b55-96e4ba5af723	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1f7f599f-7be4-4e65-87af-b1c2d7667f33
71bd38c1-7892-4643-a07f-215054a96923	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUE3C7FA4D/B/M	5f859a61-765f-40fa-8b55-96e4ba5af723	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	fc06fcc0-a93f-4b4d-9559-f1f9fbadd057
63332293-ae3f-4db1-9f95-484e69c49b24	2023-06-14 11:45:09.916672	2023-06-14 11:45:09.916672	TP-PUEE8AC817/B/L	5f859a61-765f-40fa-8b55-96e4ba5af723	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	f69e1187-b25d-44ce-bac7-bf7a5f2fce46
51d4e50b-222a-4402-8a38-a7256ce8a880	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU684C1B91/B/2XS	0417f0e9-b015-4e57-926c-976f2dfbea69	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	d03061f6-7f90-4185-a1aa-321de0228310
14e8d7fa-41ad-4e3d-8ab6-46ac926e1417	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUD2BBF418/B/XS	0417f0e9-b015-4e57-926c-976f2dfbea69	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	7cff4ffd-97ad-4a10-9274-d4b31e0cbbf2
bc5d015f-28fc-4369-beed-6d52ba7e645b	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUA8C4A44D/B/S	0417f0e9-b015-4e57-926c-976f2dfbea69	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	189d7641-5af3-412b-9626-94de26e86d66
6996bed6-30a3-4b67-85c7-0967386782b5	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU8616B534/B/M	0417f0e9-b015-4e57-926c-976f2dfbea69	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	8c47e27d-b61a-4337-8b58-0119b0258401
3b7de85d-749c-4d16-8f6f-2a0c8b1d33b9	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU47EA5B4B/B/L	0417f0e9-b015-4e57-926c-976f2dfbea69	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	65e0a727-bf39-4d16-8bd8-fe8a5a1fa72c
e92be669-ab6b-4ba9-b4d4-63717f23aab7	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU5FDAC6BC/R/2XS	0417f0e9-b015-4e57-926c-976f2dfbea69	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	0b287c5c-ebca-485d-b648-3eeeb26f4c74	c772028a-790a-4a31-92b4-c863d29a6f7b
4d4f315f-e4da-4d37-bc91-a94abd3f4176	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU8F3EA4F5/R/XS	0417f0e9-b015-4e57-926c-976f2dfbea69	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0cf831d8-b050-4ad2-a60d-959aadc4a157
5aad7909-8d59-48c0-8ee1-d0b0ce077942	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU425D1F5F/R/S	0417f0e9-b015-4e57-926c-976f2dfbea69	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b6e37341-cb59-4f73-9d7c-3924a8709075
3107ba76-4565-4653-aead-850086b92c19	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU424B8361/R/M	0417f0e9-b015-4e57-926c-976f2dfbea69	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	dd5df489-c7e7-44ab-b9a6-4e0a522e075e
99fca6ef-3778-4d72-98af-5051127cd7b1	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUEA463E47/R/L	0417f0e9-b015-4e57-926c-976f2dfbea69	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	878b6f24-84eb-454d-9da6-f7f932aae0fe
a23a567a-1c60-44ea-aa2a-5003faf38582	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUE81546F2/B/2XS	0417f0e9-b015-4e57-926c-976f2dfbea69	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	fcb63416-7881-4fe8-a828-683444a0ef4a
1eb78d79-d50a-4b4c-9657-c89882bdcc69	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUE8667C79/B/XS	0417f0e9-b015-4e57-926c-976f2dfbea69	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	78329c48-d6e3-4b9c-9e4d-0f1e02ccd435
9caf9ab0-6355-4c1f-9d62-d3a79013456b	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU94F87ACD/B/S	0417f0e9-b015-4e57-926c-976f2dfbea69	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	90dd151a-1d98-46da-8c66-9b298e85b8bb
307c17cc-11ed-47c5-98fe-3dae5ef5a18d	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU19C6E274/B/M	0417f0e9-b015-4e57-926c-976f2dfbea69	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	fbf1db5d-cd0b-47f5-93f7-ef8b181befe0
2fffc849-152b-463e-986c-9932e478e238	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU33BF8736/B/L	0417f0e9-b015-4e57-926c-976f2dfbea69	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	6dd0230f-24e4-4b23-b02e-f573e52939e6
d3c1f5b8-5ecc-4808-92a2-fde676fc0eac	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUA59DAADE/W/2XS	0417f0e9-b015-4e57-926c-976f2dfbea69	e8f39507-8e79-41ff-9f74-890067a6d468	0b287c5c-ebca-485d-b648-3eeeb26f4c74	713126ee-ad8d-45c6-8bd1-a2d519ea974b
520c2cff-5352-4736-b8ef-f402312eebfb	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU492829DA/W/XS	0417f0e9-b015-4e57-926c-976f2dfbea69	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	ef2b02d8-a61a-4ee7-a0fd-aff56df0dedf
b08fa8a7-8416-4256-b715-f45dcb7818e0	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU3A2468E3/W/S	0417f0e9-b015-4e57-926c-976f2dfbea69	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	b5475afe-1ee7-4c33-8396-65cb476f3c0b
abed2129-792a-4428-b148-5965c71741e6	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PUFD8DC425/W/M	0417f0e9-b015-4e57-926c-976f2dfbea69	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	9af97315-5058-48e7-9eae-370f292294cd
e6958e8f-483c-41e2-bd07-e8dc578d1c6c	2023-06-14 11:46:19.204073	2023-06-14 11:46:19.204073	TP-PU9B55F1B3/W/L	0417f0e9-b015-4e57-926c-976f2dfbea69	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	d77dfc54-b147-4e3c-b091-8e21f4e4b51a
9fd88857-3375-420e-8e67-95efa1b94935	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	JN-VEA6DC2862/P/S	4837b446-7cfe-400c-a902-270166c7fc3c	68c94815-02e1-43e5-9495-dc40cbd994f2	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e0a45bb4-0792-4268-9b25-acd49506ca76
6d1f575d-b95e-48d3-a72f-693b57233dbc	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	JN-VE95D6EFEC/P/M	4837b446-7cfe-400c-a902-270166c7fc3c	68c94815-02e1-43e5-9495-dc40cbd994f2	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6c5bf045-7987-4430-9349-419e4fccf5e6
b6c103b2-1ef2-4791-b0c5-a4a293665a6d	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	JN-VE858C59BC/P/L	4837b446-7cfe-400c-a902-270166c7fc3c	68c94815-02e1-43e5-9495-dc40cbd994f2	def52206-45aa-48b9-bb32-9f05c45e7461	1aaf2cb4-5ab1-450b-93d1-3e9303a61db7
32aed357-3c02-4266-a123-fb1218c0e15b	2023-06-14 11:50:19.016212	2023-06-14 11:50:19.016212	JN-VE8492DF9E/P/XL	4837b446-7cfe-400c-a902-270166c7fc3c	68c94815-02e1-43e5-9495-dc40cbd994f2	2ed55aba-1311-4e78-a262-2712ad7896a9	3e202cde-1319-4d2d-ae59-b408e9624056
c54a378a-59a8-4157-bb73-830f246d8bfa	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	JN-VE2FA39E6D/B/S	d751f004-34d7-4b8a-b4fc-04130f491ef7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	61b35c23-3065-4954-9d6a-2af1b6a528d0
6cdbfb6e-a180-4403-b451-94deae408f0e	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	JN-VE55AA6656/B/M	d751f004-34d7-4b8a-b4fc-04130f491ef7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	d437e519-a907-4e7b-b459-9fb00930f648
146a647c-fef9-403a-8873-a5b5aef5b807	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	JN-VECED578A3/B/L	d751f004-34d7-4b8a-b4fc-04130f491ef7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	dbc78f42-8bdb-462a-9e64-56d7aa46e250
db1c76f7-701c-4449-95d6-1d241d8e2b48	2023-06-14 11:51:08.867059	2023-06-14 11:51:08.867059	JN-VEB8C7517E/B/XL	d751f004-34d7-4b8a-b4fc-04130f491ef7	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	967acd8b-5465-4a56-9d93-c5339a43edd6
5dead41b-b518-4710-b59e-8617ac1d11e4	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VEB49C349F/G/S	89cf3f60-7d9c-444b-84a3-aab4e4029355	3c314204-70d9-414f-899f-11dac5eb6b12	925dc306-1fee-4985-83ba-c3ffe1d6fa37	a3e340dc-5710-4705-a475-778533ed0ee6
6a52cbd7-a596-46fe-b6dd-839e56844400	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE5E7D21C1/G/M	89cf3f60-7d9c-444b-84a3-aab4e4029355	3c314204-70d9-414f-899f-11dac5eb6b12	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3186c213-f01f-4346-a93c-d05afb6e9882
3fb29e13-82f5-4cc4-9b0d-44c35770195d	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE7B6B7A51/G/L	89cf3f60-7d9c-444b-84a3-aab4e4029355	3c314204-70d9-414f-899f-11dac5eb6b12	def52206-45aa-48b9-bb32-9f05c45e7461	821b5201-570f-4731-ae14-a6cf64377889
6afc8b0f-9983-4560-96f7-f4b64721c1ca	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE86ADD1A6/G/XL	89cf3f60-7d9c-444b-84a3-aab4e4029355	3c314204-70d9-414f-899f-11dac5eb6b12	2ed55aba-1311-4e78-a262-2712ad7896a9	41a19eff-22e8-4ea1-ac06-14146bff2510
7668fd25-b89f-4d07-8241-82dde23eee8b	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE3842FD73/R/S	89cf3f60-7d9c-444b-84a3-aab4e4029355	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	84554ac9-4c51-4ee1-8719-3df5f1f15e6a
716e3196-e3c9-4074-8a6e-266391dcbe9a	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE2DDE3C6A/R/M	89cf3f60-7d9c-444b-84a3-aab4e4029355	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	7447e4b9-f499-4243-9d5e-b2982d2d34cd
bd228006-9f57-4876-bdc4-85bfaaf93aa9	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VE711CA788/R/L	89cf3f60-7d9c-444b-84a3-aab4e4029355	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	739d4911-343e-40ff-9fed-497afe8ff4b9
96d3f96d-c978-4e1e-b1ae-9bb6ce05301e	2023-06-14 11:52:14.448526	2023-06-14 11:52:14.448526	JN-VEE616C75F/R/XL	89cf3f60-7d9c-444b-84a3-aab4e4029355	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	2ed55aba-1311-4e78-a262-2712ad7896a9	fa3d0c1d-75ca-4aca-ad7c-8893e78c4ec0
b21f9448-bfdf-4d76-a963-5952e6fbc366	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE685A5F5A/B/S	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	545a2a6e-b4f3-491b-856a-4d8008fd8f75	925dc306-1fee-4985-83ba-c3ffe1d6fa37	28ce45ef-a598-416e-a08c-3b1e66a93bbc
1c53a4be-ae8d-498d-bda3-79a1dc245af3	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE58A13637/B/M	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	545a2a6e-b4f3-491b-856a-4d8008fd8f75	f3a2b97e-1dba-4a7b-8067-f89e8400d227	75ea29f5-e08e-4233-85b2-9921aa6a308b
228cda0b-6410-443e-90ef-32cd0e3ba913	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VEAE172DC6/B/L	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	545a2a6e-b4f3-491b-856a-4d8008fd8f75	def52206-45aa-48b9-bb32-9f05c45e7461	442d2942-6367-4b4a-b478-170cedcd7fb6
cf274623-cea3-4010-8c56-89d1fe82c7a6	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE15CEC733/B/XL	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2ed55aba-1311-4e78-a262-2712ad7896a9	874213ef-945a-4537-b41d-17e8b9d7bfe3
8d56f1f0-76c4-4ca6-8e56-fa9b84c708d6	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE1D23BBA4/B/2XL	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	545a2a6e-b4f3-491b-856a-4d8008fd8f75	2d7ed52d-ad40-4942-a107-88a4a3006e57	990e6407-46ad-45d9-8189-c6053b094daa
2e93e54a-da02-409d-bf9c-62e526ae004d	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE75586FE7/B/S	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	db54560d-269c-4194-8534-c290c0dd9432
1af98258-c578-44fb-aa6b-5cc0ed0a5b99	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE51DCDD78/B/M	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	f4a53b3d-ab83-47ac-a5fd-4b7d3d1e2522
28029900-0319-4ce6-8202-2f01c864f7ce	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VECF3D7EAA/B/L	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	f9f08694-71a8-47af-b340-c50fcdb11e89
8dac4520-a7d9-4ce8-b78c-c2e12dff8c07	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE7F87E6A6/B/XL	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	646c6e6b-6800-4f83-a5d0-5134160eefd1
28bc69ac-70ed-457d-8f25-1fb19ecb53e9	2023-06-14 11:53:33.527002	2023-06-14 11:53:33.527002	HD-VE164536C9/B/2XL	e1680808-2448-41f0-a8c5-3c8bc3afc5ac	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	2c84f592-abe5-48e9-abef-692dd36071a6
ff68b0c4-1d71-49e9-8912-833b206ebb94	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE59D312CD/B/S	de9f7682-600c-4c1e-a3e6-cd186865f036	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	06cda03b-4efb-44c2-98c3-d8bc8fc2e6e5
b903119a-1a44-4d2c-b3db-aa0f814f62d3	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE76325C33/B/M	de9f7682-600c-4c1e-a3e6-cd186865f036	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	5492e5ea-0f7b-49bf-b521-acafbb3e709c
26ba3451-0948-4def-a15e-623a9da1a825	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE57ED3742/B/L	de9f7682-600c-4c1e-a3e6-cd186865f036	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	3f5ce2eb-dbde-4334-881b-75f7446ab7b7
70602f08-699d-4f75-826e-e740327c2f3a	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE8D12B19C/B/XL	de9f7682-600c-4c1e-a3e6-cd186865f036	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	dca1c142-1e11-40ac-b634-7a0f4fde5beb
1a60387f-e3a9-4f69-9de7-b42f546413f8	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEAD74C548/B/2XL	de9f7682-600c-4c1e-a3e6-cd186865f036	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	42ed594d-6e2a-49ab-8aed-a727ae1cf83b
61dfa57a-c7c4-4916-81d3-7efb9c01b6b3	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEA677BACA/B/S	de9f7682-600c-4c1e-a3e6-cd186865f036	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7920e24f-45c5-40e2-9d65-06e3b479d50a
649d95dc-863e-439d-8cf1-6237c873a651	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEF5F91B19/B/M	de9f7682-600c-4c1e-a3e6-cd186865f036	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	7b80f9da-ed3b-4fcc-bec9-6e830904f03d
342449e8-ac69-4698-ac54-5768862be1d6	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEC3F91898/B/L	de9f7682-600c-4c1e-a3e6-cd186865f036	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	90813ccd-b10f-4189-bd57-8ba28426b56b
8028b0d6-336d-40d9-bc18-0ff8553a935d	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEC3E5526E/B/XL	de9f7682-600c-4c1e-a3e6-cd186865f036	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2ed55aba-1311-4e78-a262-2712ad7896a9	3db059af-c397-4ee5-a85f-1f96a9f8a010
f3f23862-cbd8-484a-903b-19d321d35f2f	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEC3E98E4E/B/2XL	de9f7682-600c-4c1e-a3e6-cd186865f036	7a4a9d95-1c71-4af9-98a7-b0fee348c945	2d7ed52d-ad40-4942-a107-88a4a3006e57	e0cac4e6-d649-4cde-844a-f8a1a6d82c70
b5146d32-c1c0-4fd8-8359-ae22b05038ec	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE53667CC2/P/S	de9f7682-600c-4c1e-a3e6-cd186865f036	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	e24ebb23-866a-446f-bdb9-b82968db3f6f
17170dab-512f-4249-b34b-15f6dbd10a00	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE3D8155E9/P/M	de9f7682-600c-4c1e-a3e6-cd186865f036	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	3e449711-46f9-4e5d-9e8a-d1ff85429557
03739240-4b3c-4c6b-b4a4-b21ce01d5c12	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEC542D866/P/L	de9f7682-600c-4c1e-a3e6-cd186865f036	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	e7b94225-a92b-4013-8f30-bbd6597ac862
39bc7b4f-f320-483e-85c4-9a5f5bf93d20	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VE863343DB/P/XL	de9f7682-600c-4c1e-a3e6-cd186865f036	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	26ecd7a9-e100-4f1c-a169-4a59c62df703
91e43725-f2df-4dfc-baec-49d5bd58d614	2023-06-14 11:54:50.849275	2023-06-14 11:54:50.849275	HD-VEE64B7FFE/P/2XL	de9f7682-600c-4c1e-a3e6-cd186865f036	f16d53c0-7ece-435c-87d8-068186398eae	2d7ed52d-ad40-4942-a107-88a4a3006e57	75f6f371-beb2-4b7a-8688-b5c93f0b5750
db96cd6c-94d6-4268-9137-d9e609e18377	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VE6BFC14CF/B/S	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	1a585b09-c29c-4bf3-9e67-70c808033936
9ad58b89-d0e8-4306-95bf-9c887d4a54ef	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VEF5155EBA/B/M	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	4e27a17c-dfe2-41c5-b0bb-85327fb20564
7f73da36-a602-4435-80ef-476258be24bf	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VE4A96857C/B/L	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	6c80f03f-b817-4270-9676-ce2a5c0190fc
98303ca1-a0c6-44b6-a2a6-b45a61567da4	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VEFEF8875F/B/XL	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	e9d5a84c-3341-488b-8a15-ad7841c21e90
84a531f5-3287-45af-983b-4ad8c91e5fa6	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VEBCA4C7B6/B/2XL	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2d7ed52d-ad40-4942-a107-88a4a3006e57	25a44fb2-1a49-44ce-9571-060552e6de50
63df6755-a84b-4ba9-8647-6f731c62b366	2023-06-14 11:55:33.639919	2023-06-14 11:55:33.639919	HD-VE8DCCCB2C/B/3XL	e4909e63-f547-4693-8457-9b197b80bae5	a1b54494-0e51-4801-bcfa-9dbdf2466e97	fc500351-9486-4043-8198-77f4c2b58dc0	869d49df-0b72-4b5d-bb0f-172b7688e8f7
c8b5be74-78c9-4dae-ac4f-8cd2156148b6	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	SW-VE7E25CA4F/Y/2XS	0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	0b287c5c-ebca-485d-b648-3eeeb26f4c74	d55f094d-b557-4b01-88fd-4a15bfb21823
67c47baf-9620-4e4f-9e74-73f6107ecd96	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	SW-VEBC1D5B85/Y/XS	0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	cbf4f8f0-8024-4bf9-aae1-fafba5b8c31b
3ad09d5b-47af-4224-81b7-5da5683efd6f	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	SW-VE24B37FB2/Y/S	0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	925dc306-1fee-4985-83ba-c3ffe1d6fa37	29be723d-746c-4e51-8938-7efa3e239a1d
8139246c-93c3-41aa-98b1-9d8e206959f5	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	SW-VE2AC26CB9/Y/M	0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c1894d73-1352-434a-9220-234926ef14f9
f3168c36-fd3d-4fae-87d3-ffe0e4b0ebcf	2023-06-14 11:56:39.894124	2023-06-14 11:56:39.894124	SW-VE441CD414/Y/L	0eff251f-9b2a-4f00-8f3f-6bb56dd52ca5	a620da0a-a51f-4db3-b1d0-1c533a0d87d0	def52206-45aa-48b9-bb32-9f05c45e7461	2253dc40-64f7-4364-adec-8bbaa74e921b
3a4c3b88-65aa-4a98-9e43-65d1c5132e25	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE563BA4DD/B/2XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	0298500e-1b5e-4667-b4ce-d7b7bb7fc10b
adc75d94-aaea-43f5-8686-6f984bfe3541	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE4C3F598D/B/XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	bbb3943d-c3f0-4831-a5e7-3739f65b745e
261acf74-9df9-4bfe-ac2c-7c0199832831	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE972A9F1C/B/S	c01e432c-eae7-44cf-99ff-7abe70484ddd	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	7d8771fb-dc74-418d-ad1a-2daeeeaee3c0
678d5124-e51a-4da8-9c0b-34907a21ea6a	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE856F27D2/B/M	c01e432c-eae7-44cf-99ff-7abe70484ddd	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	fbfa5229-4f23-46e2-bde8-1e1d11bc7bb7
75c8115c-968e-4ee2-9b9a-0ba6cd676b00	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE768FBE53/B/L	c01e432c-eae7-44cf-99ff-7abe70484ddd	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	286c3fc1-8dec-4aa5-ad1a-58f1572f15dd
6ac640f6-26e2-4928-8b2b-04bfb46c90f5	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE5B8A8895/B/2XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	7a4a9d95-1c71-4af9-98a7-b0fee348c945	0b287c5c-ebca-485d-b648-3eeeb26f4c74	d0baaab7-ea51-43e4-8d7f-f042e22e3b7c
8c8d7e09-bc89-4f84-9c91-6341d8e5fd63	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VEAEAF35FC/B/XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	7a4a9d95-1c71-4af9-98a7-b0fee348c945	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0b6d26e0-0651-4253-89a4-1a24532869e7
9870ac93-0b86-404d-8743-977292ffddea	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VEA8251926/B/S	c01e432c-eae7-44cf-99ff-7abe70484ddd	7a4a9d95-1c71-4af9-98a7-b0fee348c945	925dc306-1fee-4985-83ba-c3ffe1d6fa37	c85a1870-183c-41ab-ad0b-0f139bcb7f56
4e8ab392-b2fe-4740-b794-f98cdf846d0c	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE186D82AF/B/M	c01e432c-eae7-44cf-99ff-7abe70484ddd	7a4a9d95-1c71-4af9-98a7-b0fee348c945	f3a2b97e-1dba-4a7b-8067-f89e8400d227	9783eff4-3590-46fd-bc64-8d5e371ebb5d
d861d131-311f-43a4-a3c2-62b896dc91d8	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE53A7C363/B/L	c01e432c-eae7-44cf-99ff-7abe70484ddd	7a4a9d95-1c71-4af9-98a7-b0fee348c945	def52206-45aa-48b9-bb32-9f05c45e7461	8aaef08b-c898-4671-a335-bfcb3c9abcc6
62b2e111-7331-4f13-b4df-7bb28259b7a0	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE833C1C1D/P/2XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	f16d53c0-7ece-435c-87d8-068186398eae	0b287c5c-ebca-485d-b648-3eeeb26f4c74	ff709dd9-b4cf-4ca6-8418-73a9f26e4792
efdcf0b8-1c4e-439e-ab69-6cccf3c08b1f	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE75CC24A7/P/XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	09dc4ce6-7576-493b-9f66-ccd413b46384
bd8003b8-6616-41ed-a2e7-ba44bc5c34bc	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VEC6436E4F/P/S	c01e432c-eae7-44cf-99ff-7abe70484ddd	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	bc9928c9-9625-4791-900f-92abe1ad0fe3
5a21f2a8-2509-4f85-8d49-12efaacbe907	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE6F536B1D/P/M	c01e432c-eae7-44cf-99ff-7abe70484ddd	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	476bfa42-5d30-4d2f-b65a-db20fee22aa0
465b901c-7dff-4db8-b35d-d3a1c96e9f94	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE37F252DD/P/L	c01e432c-eae7-44cf-99ff-7abe70484ddd	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	536afb36-3ea6-4ffa-8719-309aa1bf58d2
e865dc61-13a4-4828-ac98-56c5a6dfd9a1	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE76D7B927/R/2XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	0b287c5c-ebca-485d-b648-3eeeb26f4c74	350b8c5d-4183-4c5d-8999-49e5477c9f3b
51b85237-634c-4e66-aac0-088ce43185af	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE62B3E763/R/XS	c01e432c-eae7-44cf-99ff-7abe70484ddd	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0d48c182-429e-41a4-91e6-4b35354fb686
f13519f2-9c88-4f11-a497-f3af3699dafd	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VE65EFACCF/R/S	c01e432c-eae7-44cf-99ff-7abe70484ddd	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9e938c49-f316-4c93-b4d5-2abdf256dc16
80dc3c79-7240-4c1d-865a-8620247ad3df	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VED1B5A7E1/R/M	c01e432c-eae7-44cf-99ff-7abe70484ddd	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	37e320ac-7815-4ec8-9e52-34c17feae496
bc3fdf5f-b9d4-44e9-9ce9-8429aadd965c	2023-06-14 11:57:46.866434	2023-06-14 11:57:46.866434	SW-VEC597FEEE/R/L	c01e432c-eae7-44cf-99ff-7abe70484ddd	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	464b7832-af4c-4b51-9637-f92d290457d9
ca4c804e-3214-4db2-87c6-ed4c1a678903	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE3564BF3A/B/2XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	a1b54494-0e51-4801-bcfa-9dbdf2466e97	0b287c5c-ebca-485d-b648-3eeeb26f4c74	1e41f0be-9741-4f84-b048-fc2d18ad0c9a
ed9f99bb-a1bb-4a1c-a59e-4460101a16f4	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEF596E473/B/XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	7f4c4a32-732f-4022-b6b5-abff8547cf68
fd4bedcd-b11f-49c8-bb28-5862179fd279	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEEE1876D2/B/S	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	5a1880df-6fda-4422-9dba-4aa3c7114056
e9f46caa-4fb1-450a-a12a-c7f34a90f364	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE75C79857/B/M	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	6f440614-dcba-4983-8d92-2c11b85ad865
6a1835d1-fe1f-4569-a343-8a42301c465c	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE35BF6FF4/B/L	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	17190684-fa53-400f-87c0-d6fc536058d8
92a7ec31-d9df-46af-b14d-40c6e195203a	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE8943E56E/P/2XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	f16d53c0-7ece-435c-87d8-068186398eae	0b287c5c-ebca-485d-b648-3eeeb26f4c74	030a3a99-4f70-4026-bc37-551419acac05
b2ecdaaf-087a-4f17-a41d-5875813a40da	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE472429C6/P/XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	c60bd1ff-5022-4ed3-8540-0afe69dfef24
f35da17a-de30-4640-8291-90d51cc1c89c	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VE7BD1C335/P/S	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9968fe7e-1359-4c46-b497-c86f069429c1
4a336e66-50f9-4a72-beec-7c8c69d65132	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEE9119D27/P/M	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	920b16f6-0e9c-45ca-a11e-c1e1ce9c7635
12175910-9000-4606-a304-7f9b37f98a19	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEE495AEB6/P/L	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	a2d304bb-c6f5-40ee-bcdf-159735bd03ed
d95b09cb-10d1-43f7-9b58-3d68a739dc21	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEC9958B1A/R/2XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	0b287c5c-ebca-485d-b648-3eeeb26f4c74	16b2f05b-4ae7-4fdc-aaa6-922480c9e8a6
e4f2f0dd-0e67-462b-a606-ea20512aa2f4	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEDA69DCFC/R/XS	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	df9ee079-b556-4549-9e71-b4930e38888e
8e15e88e-3024-46b0-b303-7864126a5a74	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEB1B98817/R/S	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	925dc306-1fee-4985-83ba-c3ffe1d6fa37	9bf3220a-301e-4b69-bc9d-cf5dbec82e80
ada70bb2-bfe6-4b03-83a6-27e88cb5d759	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VED482DAA2/R/M	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c3332799-51ca-420e-96a5-4a56231dca7f
2931da62-4adf-4c23-9484-5dfb0fc7c008	2023-06-14 11:58:39.754656	2023-06-14 11:58:39.754656	SW-VEB497D78E/R/L	ac29b155-ec6a-4385-9bb4-15f7e5f8e7c1	62e119ea-e41e-4c7c-a91a-c0cdd297a4a8	def52206-45aa-48b9-bb32-9f05c45e7461	c16c637b-6623-4dcb-b160-da4f8d5d1bd7
c9462048-23e9-4ca6-8e49-edadb1ab85f8	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VED7B72DC4/P/XS	894ecf35-386b-40cc-8cf9-1735a26c293d	f16d53c0-7ece-435c-87d8-068186398eae	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	0270cf64-f806-4978-a435-27451df1977e
b8542703-d91f-4e08-8b27-4fc9e858c1d5	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VE324B9DFE/P/S	894ecf35-386b-40cc-8cf9-1735a26c293d	f16d53c0-7ece-435c-87d8-068186398eae	925dc306-1fee-4985-83ba-c3ffe1d6fa37	16d6a139-d109-4bd9-b04a-0a34e837ab91
56e8f979-d962-4ccd-bc59-d10861402b81	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VEB398F6C7/P/M	894ecf35-386b-40cc-8cf9-1735a26c293d	f16d53c0-7ece-435c-87d8-068186398eae	f3a2b97e-1dba-4a7b-8067-f89e8400d227	825274c0-1cd0-4506-847b-a85b66ca1b0a
c78cfd17-c6da-40f2-95dd-409304823e0b	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VE3A4CC4C5/P/L	894ecf35-386b-40cc-8cf9-1735a26c293d	f16d53c0-7ece-435c-87d8-068186398eae	def52206-45aa-48b9-bb32-9f05c45e7461	cd36a809-eef7-492e-a07c-13194532113d
dbaae932-beea-435c-978f-4cbc6194e28b	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VEC5794AF5/P/XL	894ecf35-386b-40cc-8cf9-1735a26c293d	f16d53c0-7ece-435c-87d8-068186398eae	2ed55aba-1311-4e78-a262-2712ad7896a9	d476861d-72f9-4933-8d63-9dfd7ded43c7
2f7906ea-7993-454b-b2ed-5b15ef67c8ec	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VEBBAE5FD8/W/XS	894ecf35-386b-40cc-8cf9-1735a26c293d	e8f39507-8e79-41ff-9f74-890067a6d468	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	24598c1d-165c-4905-9f16-179a4b7b6f2b
8203dafd-b7fb-41c1-ae65-1cb5b51bd016	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VE66483BD5/W/S	894ecf35-386b-40cc-8cf9-1735a26c293d	e8f39507-8e79-41ff-9f74-890067a6d468	925dc306-1fee-4985-83ba-c3ffe1d6fa37	fd86bcb1-6b2f-4c9a-a6e9-f9dc140b7a28
644d7867-00ef-4220-af79-c4ec66f4bccd	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VEC6951E27/W/M	894ecf35-386b-40cc-8cf9-1735a26c293d	e8f39507-8e79-41ff-9f74-890067a6d468	f3a2b97e-1dba-4a7b-8067-f89e8400d227	37e57553-1569-4c5a-8f2e-2c22fc8980db
e2a6263c-e484-4288-9933-52ae1a874dd5	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VE5138F825/W/L	894ecf35-386b-40cc-8cf9-1735a26c293d	e8f39507-8e79-41ff-9f74-890067a6d468	def52206-45aa-48b9-bb32-9f05c45e7461	23b6fcfb-b810-407f-b50b-c872964c9e7e
b91d8082-10fe-4d5a-b3f0-ad02681f9539	2023-06-14 11:59:43.599947	2023-06-14 11:59:43.599947	T_-VE6C55494E/W/XL	894ecf35-386b-40cc-8cf9-1735a26c293d	e8f39507-8e79-41ff-9f74-890067a6d468	2ed55aba-1311-4e78-a262-2712ad7896a9	40e383e1-b149-495b-b53a-a5c7719da544
cb88a21d-684c-440a-b70c-2121ed7391be	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	T_-VEA2778BBC/B/XS	ed17f7e9-ca19-4561-9274-047e68e535c8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	579999a0-0c7a-4f11-98ac-9b776a7965f7
773c3c51-b6e4-46ba-92fe-026562166644	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	T_-VECE29553F/B/S	ed17f7e9-ca19-4561-9274-047e68e535c8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	0fb3d069-23f5-40f2-97e8-ecd31d99ffdd
58d27aca-bc1c-43c6-a8fe-9a6e6a4fb214	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	T_-VEB6BD5FF1/B/M	ed17f7e9-ca19-4561-9274-047e68e535c8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	14349601-150e-4a4c-af96-4996a788f506
e54e43ea-5ab9-4782-b254-9d014e059317	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	T_-VED1E59826/B/L	ed17f7e9-ca19-4561-9274-047e68e535c8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	a9effe87-7a99-4036-ba5a-6586aec9ad58
080c808d-25fd-4d3e-8598-f7633c723aa4	2023-06-14 12:00:32.372219	2023-06-14 12:00:32.372219	T_-VEC2CCCFE1/B/XL	ed17f7e9-ca19-4561-9274-047e68e535c8	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	73a13040-a498-4afa-8c60-f234b36ed0e0
6b005628-293f-409c-aad9-a87fd8bdb1df	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	T_-VEB3889E66/B/XS	3c8adec9-ee5c-45a8-a7a2-90a427ab7517	a1b54494-0e51-4801-bcfa-9dbdf2466e97	73f222f9-cf20-4b02-92c3-60de3eb8e5f0	32ea7d41-024d-4dab-b5ae-1f79dfe984b2
f5d80cff-afe2-413f-9b4e-9a313971a929	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	T_-VE7FDB8B6F/B/S	3c8adec9-ee5c-45a8-a7a2-90a427ab7517	a1b54494-0e51-4801-bcfa-9dbdf2466e97	925dc306-1fee-4985-83ba-c3ffe1d6fa37	3b2e842e-0501-4293-b260-87823e1022a1
5e5664dc-f5ed-435c-86aa-86d6c00618a5	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	T_-VE64648699/B/M	3c8adec9-ee5c-45a8-a7a2-90a427ab7517	a1b54494-0e51-4801-bcfa-9dbdf2466e97	f3a2b97e-1dba-4a7b-8067-f89e8400d227	c7af3a74-bcef-4fcb-b01a-aef9efbefd68
2ce25678-5b62-4555-aee4-36c420591049	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	T_-VECE78592A/B/L	3c8adec9-ee5c-45a8-a7a2-90a427ab7517	a1b54494-0e51-4801-bcfa-9dbdf2466e97	def52206-45aa-48b9-bb32-9f05c45e7461	b9386662-8f0e-4a05-bf5d-98e77faf08fe
1b4dbc2e-abb0-432d-bb5d-77ddd8f0336a	2023-06-14 12:01:15.670104	2023-06-14 12:01:15.670104	T_-VEAE5927AE/B/XL	3c8adec9-ee5c-45a8-a7a2-90a427ab7517	a1b54494-0e51-4801-bcfa-9dbdf2466e97	2ed55aba-1311-4e78-a262-2712ad7896a9	b9eb6363-c8d6-421d-8a78-54b25309fde3
\.


--
-- Data for Name: promotion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion (id, created_at, updated_at, code, name, price_id) FROM stdin;
ff6b67be-fbba-49cc-8bef-425bb6edf719	2023-05-21 12:14:31.216809	2023-05-21 12:14:31.216809	top_filtered	Top Filtered	9aee99ab-1553-413f-b3e1-bdf800126e9f
\.


--
-- Data for Name: promotion_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_product (id, created_at, updated_at, product_id, promotion_id, expire_at, payment_intent_id) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, created_at, updated_at, code, name) FROM stdin;
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	2023-05-21 12:14:30.380354	2023-05-21 12:14:30.380354	customer	Customer
a1b50707-140f-4228-992d-afa6c622a706	2023-05-21 12:14:30.380354	2023-05-21 12:14:30.380354	partner	Partner
9978c24a-20a9-48c0-8cf0-398673adc2bf	2023-05-21 12:14:30.380354	2023-05-21 12:14:30.380354	customer_support	Customer support
ec88e599-fdff-4e95-9f70-cd7d6050ad05	2023-05-21 12:14:30.380354	2023-05-21 12:14:30.380354	admin	Admin
\.


--
-- Data for Name: role_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_permission (role_id, permission_id) FROM stdin;
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	baac83e1-5b54-4e89-92c8-f343dd091744
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	ca98c5ee-f58b-4a54-9b71-8ec0463fbced
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	24bf8ca1-5b22-4a29-badb-b11082bafa56
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	dc42cadd-f343-4fd4-ae46-042429bb239a
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	13c23de7-ff7f-4cca-b8ee-0e719ea6839a
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	d9f4b212-4c50-4c67-835e-a2ddfe301c72
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	ba860603-cf37-4a13-a49e-b42f6e17d22f
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	6e80c775-a512-4aab-a866-999eb5a3cdde
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	0eabae92-28e3-4b31-ad6b-a6074e51e2ef
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	c7f7c540-6a4e-40e4-bf88-8070c2ce606c
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	31f9cbbe-fef9-48de-a1a0-ce54f98dd51b
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	a3627904-c88a-4cee-a896-192abcb4c565
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	153c1fae-c9d0-4e08-9b99-d2024e0291a0
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	ab4f3d9a-5a29-44e5-b1fd-497815070def
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	c4b30e6c-1d02-47cd-afc9-07163e527d33
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	6be17249-8418-4544-a9b0-5f4d01671529
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	fa93bf4a-ffe6-4ac7-86e6-155b47560673
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	5380d792-8d4f-46ce-9cd1-af438e5306d0
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	d09d768e-275e-4c16-b5dc-5ae31d2257ed
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	477a7d1f-5abc-48cf-a854-a90047ab7896
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	a1043daf-f269-427c-ad5f-7fb7cfa936c3
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	ac28c96f-6e19-4a85-93e0-2fb163640a9b
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	538a55f2-30e7-4021-8fb8-07d38dcfb4fb
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	7198103e-11fa-4b96-8851-4fa1eef51d96
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	7491610d-599a-4fd9-ba28-202126623558
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	fd858c01-8970-4a7a-b48c-7480e9001f21
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	00a118f9-738b-4673-a1b9-d4b722bf1bdc
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	12eb66bb-2034-4240-b80b-b4a6b27f0c55
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	34fd8c0f-6486-4c5b-83e9-220e8cfae6f0
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	c31f6a41-eae4-448a-a3ad-5dc8dab4204a
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	abb95dfe-9f76-480d-ae44-1eeec32ae88b
a1b50707-140f-4228-992d-afa6c622a706	a3514e5f-bef3-42d4-a5d5-06a4b4fa8893
a1b50707-140f-4228-992d-afa6c622a706	b1245961-f09c-4f9d-b599-1608adaf54e7
a1b50707-140f-4228-992d-afa6c622a706	25db6004-ad6e-419d-9336-b0f713469e34
a1b50707-140f-4228-992d-afa6c622a706	5e2b9403-6777-4e07-bad4-c87b1d452c91
a1b50707-140f-4228-992d-afa6c622a706	3cddf196-9424-4807-bce8-99cc063de1d8
a1b50707-140f-4228-992d-afa6c622a706	a870cb9f-5e6a-4373-979f-396903e25796
a1b50707-140f-4228-992d-afa6c622a706	f61f16b5-ddc5-4675-9f48-9e4874791a1d
a1b50707-140f-4228-992d-afa6c622a706	34821ae8-04e6-4ef8-817c-80fafe0ccf95
a1b50707-140f-4228-992d-afa6c622a706	e8fd45cf-53c0-4c1b-bd03-33d32c69af79
a1b50707-140f-4228-992d-afa6c622a706	11b11f71-fab0-42db-b394-1e1aab4a7c81
a1b50707-140f-4228-992d-afa6c622a706	97dc6b0b-d2a4-4ffc-a4a7-87bd42910f2c
a1b50707-140f-4228-992d-afa6c622a706	e25adad2-0183-454d-aa48-df22da97c405
a1b50707-140f-4228-992d-afa6c622a706	12a7ef31-bc48-4de0-8465-d8fa215d2fee
ec88e599-fdff-4e95-9f70-cd7d6050ad05	d59d6548-7267-453c-88e3-0ff2bfcfeb9c
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	f20d63f3-645b-42b9-a4cc-043c02d9076b
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	5801cad9-3966-49bd-86b2-1265e297be11
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	86bc126f-7527-4c54-a83e-da1d4fcc2d82
a1b50707-140f-4228-992d-afa6c622a706	39126c2d-b665-4e56-a233-1ba192db0284
a1b50707-140f-4228-992d-afa6c622a706	dd154d16-a6c5-482f-b6c0-ffaeb6ff58a5
a1b50707-140f-4228-992d-afa6c622a706	7501a4f0-3221-4123-a1c3-81ae56fe8353
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	5fe90246-e482-4f18-b4ef-9cd84e79f6a7
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	263786e0-860c-46a8-a541-5ab0bf7cd6aa
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	bc9de25d-99d8-47ca-b670-29a1e49846ff
34e646dc-f69d-4e59-a5ff-d58bdbeb3afe	c5dd95c1-3c85-445a-a9f2-c869dd77106f
a1b50707-140f-4228-992d-afa6c622a706	0e8c2ef9-7f85-4146-b2f3-9412e7fd205f
\.


--
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.size (id, created_at, updated_at, code, name, priority) FROM stdin;
f3a2b97e-1dba-4a7b-8067-f89e8400d227	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	M	M	4
2d7ed52d-ad40-4942-a107-88a4a3006e57	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	XXL	2XL	7
fc500351-9486-4043-8198-77f4c2b58dc0	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	XXXL	3XL	8
0b287c5c-ebca-485d-b648-3eeeb26f4c74	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	XXS	2XS	1
def52206-45aa-48b9-bb32-9f05c45e7461	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	L	L	5
73f222f9-cf20-4b02-92c3-60de3eb8e5f0	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	XS	XS	2
925dc306-1fee-4985-83ba-c3ffe1d6fa37	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	S	S	3
2ed55aba-1311-4e78-a262-2712ad7896a9	2023-05-21 12:14:30.972807	2023-05-21 12:14:30.972807	XL	XL	6
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, created_at, updated_at, email_address_id, avatar_id, phone, first_name, last_name, password, deleted_at) FROM stdin;
6ec1b21e-ca15-478c-8a6f-2a8f8c821dc5	2023-05-21 12:14:30.784813	2023-05-21 12:14:30.784813	bf769c76-c611-4fab-96e4-3f3b0c58d289	\N	\N	User	Customer	$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0	\N
cdbb6239-4647-4f71-9ded-b0df5db65e25	2023-05-21 12:14:30.798119	2023-05-21 12:14:30.798119	7cd53a52-8a1a-4255-b903-b97d70f919a2	\N	\N	User	Partner	$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0	\N
a1ab8f68-ae6e-4199-8ced-4ea044d877eb	2023-05-21 12:14:30.809203	2023-05-21 12:14:30.809203	d485ac0d-67cf-4771-8f80-dbeb9a710c48	\N	\N	User	Partner 2	$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0	\N
8ba98462-d20b-45cd-88fb-518b44b6b17c	2023-05-21 12:14:30.823516	2023-05-21 12:14:30.823516	c242acd5-f77f-4826-8ae5-46cc8dc38e5d	\N	\N	User	Customer Support	$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0	\N
a0fbdc0b-2120-41ee-b661-bbd625473e43	2023-05-21 12:14:30.856955	2023-05-27 14:53:22.813977	6f5f2e0a-b27f-4969-b972-f4cd32ad0f72	\N	+375251111111	User	Admin	$argon2id$v=19$m=65536,t=3,p=4$513t2PfDXwcVaWJy1ycC$gJhSyuk+EzHbQ3aoSv4KfTad0o1VrsCB+jg9tVeyyH0	\N
ce681f11-2efe-4f25-ba51-9778552c7222	2023-06-14 09:01:36.020051	2023-06-14 09:01:36.020051	fde1daa3-5501-45f8-b2a6-e13abd95bbb9	\N	\N	H&M	Partner	$argon2id$v=19$m=65536,t=3,p=4$/1ICQyBoyHjXIQToldcT$5VL+OUCERuahfBmmzpaz3avq/VMmXlxqFCGKKtZ2xo8	\N
a4659cb7-be52-427a-9e3c-cbfc1f080a54	2023-06-14 10:48:57.935297	2023-06-14 10:48:57.935297	e2764f91-fee5-429b-911f-752265f48036	\N	\N	MANGO	Partner	$argon2id$v=19$m=65536,t=3,p=4$/5v6r6DNOnVwQw+LpyYR$nzQrz7giBkHTfO1lPtB2YzHyrWSgMc9mEg3jH8cRKO4	\N
0cf4be63-7ff0-4def-af17-d77946063a18	2023-06-14 11:24:02.385476	2023-06-14 11:24:02.385476	953b762d-335c-469a-a37d-571e20b9436c	\N	\N	PULL&BEAR	Partner	$argon2id$v=19$m=65536,t=3,p=4$yZc4NXc2KBrpaYA6cwpT$L6gzxLtjN8DtsUemNg4G3siKdR+7REewR0vdCsgSGXE	\N
19a90e53-5288-410e-b340-c48be90d8a3c	2023-06-14 11:49:13.486661	2023-06-14 11:49:13.486661	f0bbbf9e-c4ab-49fc-aceb-b9c5cc904f09	\N	\N	VERSAGE	Partner	$argon2id$v=19$m=65536,t=3,p=4$ynW9udGOFiXmYxV3Pny2$Sh+G1XW0HARG7dV6/A6D8kk3B7pik/E2d80yxKe94oI	\N
c7b4b668-6128-4e7d-b8cd-fabe1ed71cf9	2023-06-14 13:14:39.399989	2023-06-14 13:14:39.399989	c6e1994d-bc63-4f0e-9dda-169806cb4ccd	\N	\N	Дарья	Букина	$argon2id$v=19$m=65536,t=3,p=4$aJ7D1h5fLFhsOa4+dMWj$hNqYqMuFtRz1J0BnXKyKQYr0UA967y2NXZl0sHKwtls	\N
\.


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_address (id, created_at, updated_at, user_id, address_id) FROM stdin;
\.


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (user_id, role_id) FROM stdin;
6ec1b21e-ca15-478c-8a6f-2a8f8c821dc5	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
cdbb6239-4647-4f71-9ded-b0df5db65e25	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
cdbb6239-4647-4f71-9ded-b0df5db65e25	a1b50707-140f-4228-992d-afa6c622a706
a1ab8f68-ae6e-4199-8ced-4ea044d877eb	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
a1ab8f68-ae6e-4199-8ced-4ea044d877eb	a1b50707-140f-4228-992d-afa6c622a706
8ba98462-d20b-45cd-88fb-518b44b6b17c	9978c24a-20a9-48c0-8cf0-398673adc2bf
a0fbdc0b-2120-41ee-b661-bbd625473e43	ec88e599-fdff-4e95-9f70-cd7d6050ad05
ce681f11-2efe-4f25-ba51-9778552c7222	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
ce681f11-2efe-4f25-ba51-9778552c7222	a1b50707-140f-4228-992d-afa6c622a706
a4659cb7-be52-427a-9e3c-cbfc1f080a54	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
a4659cb7-be52-427a-9e3c-cbfc1f080a54	a1b50707-140f-4228-992d-afa6c622a706
0cf4be63-7ff0-4def-af17-d77946063a18	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
0cf4be63-7ff0-4def-af17-d77946063a18	a1b50707-140f-4228-992d-afa6c622a706
19a90e53-5288-410e-b340-c48be90d8a3c	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
19a90e53-5288-410e-b340-c48be90d8a3c	a1b50707-140f-4228-992d-afa6c622a706
c7b4b668-6128-4e7d-b8cd-fabe1ed71cf9	34e646dc-f69d-4e59-a5ff-d58bdbeb3afe
\.


--
-- Data for Name: warehouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse (id, created_at, updated_at, code, name, status, address_id) FROM stdin;
2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	2023-05-21 12:14:30.925624	2023-05-21 12:14:30.925624	BY0001	Test Warehouse BY 1	active	\N
162b16af-afb4-4a78-9a37-fd2f444d8330	2023-05-21 12:14:30.925624	2023-05-21 12:14:30.925624	BY0002	Test Warehouse BY 2	active	\N
bea1efa3-19ab-46f1-b1d6-72652f466dea	2023-05-21 12:14:30.925624	2023-05-21 12:14:30.925624	BY0003	Test Warehouse BY 3	inactive	\N
\.


--
-- Data for Name: warehouse_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouse_item (id, created_at, updated_at, warehouse_id, product_variant_id, stock, reserved, available) FROM stdin;
a6d39331-5a3e-46e6-8cf6-c4316efd9570	2023-06-14 13:12:55.607775	2023-06-14 13:12:55.607775	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	84d34480-b0d6-499a-8df2-460eb2f34e4c	8	0	8
9e238f3c-b695-443b-aec5-6e0371ea70dc	2023-06-14 13:12:58.57966	2023-06-14 13:12:58.57966	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	4a845532-dbb3-477d-b36b-f757fe81706f	12	0	12
81d26ed9-8ee9-4d91-a0ca-a1d4c515cd2d	2023-06-14 13:13:01.32815	2023-06-14 13:13:01.32815	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	191234c6-8d27-4618-b98d-7f23743ee336	4	0	4
94a9fe04-6630-408b-95d7-ccbf7f4477f8	2023-06-14 13:13:03.81421	2023-06-14 13:13:03.81421	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	3a87fb90-826d-43fd-b366-f92383048b9d	1	0	1
634a1615-622a-4db7-b847-107690d4c14f	2023-06-14 13:13:10.697443	2023-06-14 13:13:10.697443	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	845674e9-0b94-48f1-8221-5c9f145754eb	16	0	16
d3c95728-f3e5-4959-9270-fc3160e49847	2023-06-14 13:13:14.385115	2023-06-14 13:13:14.385115	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	7cab06a5-82dc-435d-a215-6c29d2b184a1	18	0	18
1c479040-55b0-4d4c-9a76-cf52129752f9	2023-06-14 13:13:18.693207	2023-06-14 13:13:18.693207	2b01c91a-bc89-464c-9bd4-9fe8bdd6260c	cb4689e3-f6a0-461d-b4ec-4fe9f72866c2	28	0	28
\.


--
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist (id, created_at, updated_at, user_id) FROM stdin;
250311d1-a64d-4a7d-a5ba-42891f8a1125	2023-05-21 12:14:30.900004	2023-05-21 12:14:30.900004	6ec1b21e-ca15-478c-8a6f-2a8f8c821dc5
ee509d92-76a0-4171-9d98-09607033051f	2023-05-21 12:14:30.905183	2023-05-21 12:14:30.905183	cdbb6239-4647-4f71-9ded-b0df5db65e25
a4daae3c-60f5-4438-b20b-7102587b1ba3	2023-05-21 12:14:30.910347	2023-05-21 12:14:30.910347	a1ab8f68-ae6e-4199-8ced-4ea044d877eb
620cd4cd-9c9d-466c-a887-258dccca1c8d	2023-05-21 12:14:30.915289	2023-05-21 12:14:30.915289	8ba98462-d20b-45cd-88fb-518b44b6b17c
95b4e3f2-6586-4b34-8fe8-051bf543d987	2023-05-21 12:14:30.920647	2023-05-21 12:14:30.920647	a0fbdc0b-2120-41ee-b661-bbd625473e43
7ce5662d-fe39-474f-9e22-5dbbc4840a98	2023-06-14 09:01:36.194041	2023-06-14 09:01:36.194041	ce681f11-2efe-4f25-ba51-9778552c7222
730632bc-cb66-49e3-836b-cf5c7fb4d0fe	2023-06-14 10:48:58.023225	2023-06-14 10:48:58.023225	a4659cb7-be52-427a-9e3c-cbfc1f080a54
3d06153a-de26-496a-a6e4-3954755bebab	2023-06-14 11:24:02.47078	2023-06-14 11:24:02.47078	0cf4be63-7ff0-4def-af17-d77946063a18
47ba3f27-e619-4c1e-a757-48dbc36b9386	2023-06-14 11:49:13.612541	2023-06-14 11:49:13.612541	19a90e53-5288-410e-b340-c48be90d8a3c
b3920130-5f72-4850-aea9-96ddf730b759	2023-06-14 13:14:39.497624	2023-06-14 13:14:39.497624	c7b4b668-6128-4e7d-b8cd-fabe1ed71cf9
\.


--
-- Data for Name: wishlist_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wishlist_item (wishlist_id, product_id) FROM stdin;
\.


--
-- Name: comment PK_0b0e4bbc8415ec426f87f3a88e2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "PK_0b0e4bbc8415ec426f87f3a88e2" PRIMARY KEY (id);


--
-- Name: email_address PK_0ee0cc1951e62fbc007003b8db4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT "PK_0ee0cc1951e62fbc007003b8db4" PRIMARY KEY (id);


--
-- Name: order PK_1031171c13130102495201e3e20; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_1031171c13130102495201e3e20" PRIMARY KEY (id);


--
-- Name: wishlist_item PK_149868d624824f0fad907f4732f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist_item
    ADD CONSTRAINT "PK_149868d624824f0fad907f4732f" PRIMARY KEY (wishlist_id, product_id);


--
-- Name: role_permission PK_19a94c31d4960ded0dcd0397759; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT "PK_19a94c31d4960ded0dcd0397759" PRIMARY KEY (role_id, permission_id);


--
-- Name: product_variant PK_1ab69c9935c61f7c70791ae0a9f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "PK_1ab69c9935c61f7c70791ae0a9f" PRIMARY KEY (id);


--
-- Name: user_address PK_302d96673413455481d5ff4022a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT "PK_302d96673413455481d5ff4022a" PRIMARY KEY (id);


--
-- Name: permission PK_3b8b97af9d9d8807e41e6f48362; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "PK_3b8b97af9d9d8807e41e6f48362" PRIMARY KEY (id);


--
-- Name: wishlist PK_620bff4a240d66c357b5d820eaa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT "PK_620bff4a240d66c357b5d820eaa" PRIMARY KEY (id);


--
-- Name: promotion_product PK_63567e833c47688b0d2a1e40ceb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "PK_63567e833c47688b0d2a1e40ceb" PRIMARY KEY (id);


--
-- Name: size PK_66e3a0111d969aa0e5f73855c7a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT "PK_66e3a0111d969aa0e5f73855c7a" PRIMARY KEY (id);


--
-- Name: payment_method PK_7744c2b2dd932c9cf42f2b9bc3a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "PK_7744c2b2dd932c9cf42f2b9bc3a" PRIMARY KEY (id);


--
-- Name: delivery_method PK_8bad1c538ff561c66e1db629c5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_method
    ADD CONSTRAINT "PK_8bad1c538ff561c66e1db629c5e" PRIMARY KEY (id);


--
-- Name: pickup_point PK_9433b0417c214a3cd2fd39d402c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT "PK_9433b0417c214a3cd2fd39d402c" PRIMARY KEY (id);


--
-- Name: warehouse PK_965abf9f99ae8c5983ae74ebde8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "PK_965abf9f99ae8c5983ae74ebde8" PRIMARY KEY (id);


--
-- Name: category PK_9c4e4a89e3674fc9f382d733f03; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9c4e4a89e3674fc9f382d733f03" PRIMARY KEY (id);


--
-- Name: product_media PK_9cd87ddf6e55e7eb21ca22901b2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_media
    ADD CONSTRAINT "PK_9cd87ddf6e55e7eb21ca22901b2" PRIMARY KEY (product_id, media_id);


--
-- Name: warehouse_item PK_9db3c002318afa54d84094100b5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_item
    ADD CONSTRAINT "PK_9db3c002318afa54d84094100b5" PRIMARY KEY (id);


--
-- Name: brand PK_a5d20765ddd942eb5de4eee2d7f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "PK_a5d20765ddd942eb5de4eee2d7f" PRIMARY KEY (id);


--
-- Name: email_address_confirmation PK_a6389287f6f18b5a3ac74fe4ecf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "PK_a6389287f6f18b5a3ac74fe4ecf" PRIMARY KEY (id);


--
-- Name: city PK_b222f51ce26f7e5ca86944a6739; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "PK_b222f51ce26f7e5ca86944a6739" PRIMARY KEY (id);


--
-- Name: role PK_b36bcfe02fc8de3c57a8b2391c2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY (id);


--
-- Name: comment_media PK_bd12ad9e083aebfb79c127e1368; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_media
    ADD CONSTRAINT "PK_bd12ad9e083aebfb79c127e1368" PRIMARY KEY (comment_id, media_id);


--
-- Name: cart_item PK_bd94725aa84f8cf37632bcde997; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "PK_bd94725aa84f8cf37632bcde997" PRIMARY KEY (id);


--
-- Name: product PK_bebc9158e480b949565b4dc7a82; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_bebc9158e480b949565b4dc7a82" PRIMARY KEY (id);


--
-- Name: country PK_bf6e37c231c4f4ea56dcd887269; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "PK_bf6e37c231c4f4ea56dcd887269" PRIMARY KEY (id);


--
-- Name: cart PK_c524ec48751b9b5bcfbf6e59be7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "PK_c524ec48751b9b5bcfbf6e59be7" PRIMARY KEY (id);


--
-- Name: user PK_cace4a159ff9f2512dd42373760; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);


--
-- Name: order_history PK_cc71513680d03ecb01b96655b0c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT "PK_cc71513680d03ecb01b96655b0c" PRIMARY KEY (id);


--
-- Name: order_item PK_d01158fe15b1ead5c26fd7f4e90; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "PK_d01158fe15b1ead5c26fd7f4e90" PRIMARY KEY (id);


--
-- Name: color PK_d15e531d60a550fbf23e1832343; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT "PK_d15e531d60a550fbf23e1832343" PRIMARY KEY (id);


--
-- Name: price PK_d163e55e8cce6908b2e0f27cea4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT "PK_d163e55e8cce6908b2e0f27cea4" PRIMARY KEY (id);


--
-- Name: address PK_d92de1f82754668b5f5f5dd4fd5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "PK_d92de1f82754668b5f5f5dd4fd5" PRIMARY KEY (id);


--
-- Name: payment_intent PK_dfca7a184ac4bccfccd817a13e4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_intent
    ADD CONSTRAINT "PK_dfca7a184ac4bccfccd817a13e4" PRIMARY KEY (id);


--
-- Name: media PK_f4e0fcac36e050de337b670d8bd; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "PK_f4e0fcac36e050de337b670d8bd" PRIMARY KEY (id);


--
-- Name: user_role PK_f634684acb47c1a158b83af5150; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "PK_f634684acb47c1a158b83af5150" PRIMARY KEY (user_id, role_id);


--
-- Name: promotion PK_fab3630e0789a2002f1cadb7d38; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "PK_fab3630e0789a2002f1cadb7d38" PRIMARY KEY (id);


--
-- Name: email_address_confirmation REL_020b0d824df44dfe1087f9d096; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "REL_020b0d824df44dfe1087f9d096" UNIQUE (user_id);


--
-- Name: order REL_0385c8f9ac80617a8434db660d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_0385c8f9ac80617a8434db660d" UNIQUE (subtotal_price_id);


--
-- Name: user REL_0db6ae09f20a66bb52f0b6c304; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "REL_0db6ae09f20a66bb52f0b6c304" UNIQUE (email_address_id);


--
-- Name: order REL_2c1fa6ebea7b1fe1392305c1de; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_2c1fa6ebea7b1fe1392305c1de" UNIQUE (delivery_price_id);


--
-- Name: payment_method REL_3aeca493407fe33a79605f9a70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "REL_3aeca493407fe33a79605f9a70" UNIQUE (media_id);


--
-- Name: wishlist REL_512bf776587ad5fc4f804277d7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT "REL_512bf776587ad5fc4f804277d7" UNIQUE (user_id);


--
-- Name: cart REL_5cc42e069bb85452e3925e6944; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_5cc42e069bb85452e3925e6944" UNIQUE (total_price_id);


--
-- Name: email_address_confirmation REL_5e1503f39f23c2bafbebc7f852; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "REL_5e1503f39f23c2bafbebc7f852" UNIQUE (email_address_id);


--
-- Name: cart REL_73375730095a20d71bf4c52e1a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_73375730095a20d71bf4c52e1a" UNIQUE (delivery_price_id);


--
-- Name: cart REL_7c115d5634f46d40539eaf67c5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_7c115d5634f46d40539eaf67c5" UNIQUE (subtotal_price_id);


--
-- Name: order REL_804420f24049a1a9483f10df39; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_804420f24049a1a9483f10df39" UNIQUE (tax_price_id);


--
-- Name: order_item REL_96061445fe14aa45cdfc1770e2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "REL_96061445fe14aa45cdfc1770e2" UNIQUE (price_id);


--
-- Name: pickup_point REL_9b549df6e07a128e5a2649c013; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT "REL_9b549df6e07a128e5a2649c013" UNIQUE (address_id);


--
-- Name: cart REL_a739d95db97835129782e8f7fe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_a739d95db97835129782e8f7fe" UNIQUE (tax_price_id);


--
-- Name: user REL_b777e56620c3f1ac0308514fc4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "REL_b777e56620c3f1ac0308514fc4" UNIQUE (avatar_id);


--
-- Name: order REL_b8a2e9f9bdb35688d5ede4acaf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "REL_b8a2e9f9bdb35688d5ede4acaf" UNIQUE (total_price_id);


--
-- Name: product_variant REL_ba659ff2940702124e799c5c85; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "REL_ba659ff2940702124e799c5c85" UNIQUE (price_id);


--
-- Name: warehouse REL_e3166be4143d134babc789bef1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "REL_e3166be4143d134babc789bef1" UNIQUE (address_id);


--
-- Name: cart REL_f091e86a234693a49084b4c2c8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "REL_f091e86a234693a49084b4c2c8" UNIQUE (user_id);


--
-- Name: cart_item REL_f7fa99d5c584b9658504c2b59a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "REL_f7fa99d5c584b9658504c2b59a" UNIQUE (price_id);


--
-- Name: promotion REL_ffc9457f6dee1bd7f564a9edc8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "REL_ffc9457f6dee1bd7f564a9edc8" UNIQUE (price_id);


--
-- Name: brand UNQ_brand_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "UNQ_brand_code" UNIQUE (code);


--
-- Name: cart_item UNQ_cart_product_variant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "UNQ_cart_product_variant" UNIQUE (cart_id, product_variant_id);


--
-- Name: category UNQ_category_code_parent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "UNQ_category_code_parent" UNIQUE (code, parent_id);


--
-- Name: city UNQ_city_name_and_county; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "UNQ_city_name_and_county" UNIQUE (name, country_id);


--
-- Name: color UNQ_color_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT "UNQ_color_code" UNIQUE (code);


--
-- Name: country UNQ_country_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT "UNQ_country_code" UNIQUE (code);


--
-- Name: delivery_method UNQ_delivery_method_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_method
    ADD CONSTRAINT "UNQ_delivery_method_code" UNIQUE (code);


--
-- Name: email_address UNQ_email_address_address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT "UNQ_email_address_address" UNIQUE (address);


--
-- Name: email_address_confirmation UNQ_email_address_confirmation_token; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "UNQ_email_address_confirmation_token" UNIQUE (token);


--
-- Name: media UNQ_media_secure_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "UNQ_media_secure_id" UNIQUE (public_id);


--
-- Name: media UNQ_media_url; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT "UNQ_media_url" UNIQUE (url);


--
-- Name: order_item UNQ_order_item_order_product_variant_warehouse; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "UNQ_order_item_order_product_variant_warehouse" UNIQUE (order_id, product_variant_id, warehouse_id);


--
-- Name: payment_intent UNQ_payment_intent_client_secret; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_intent
    ADD CONSTRAINT "UNQ_payment_intent_client_secret" UNIQUE (client_secret);


--
-- Name: payment_method UNQ_payment_method_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "UNQ_payment_method_code" UNIQUE (code);


--
-- Name: permission UNQ_permission_action_subject_conditions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT "UNQ_permission_action_subject_conditions" UNIQUE (action, subject, conditions);


--
-- Name: pickup_point UNQ_pickup_point_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT "UNQ_pickup_point_code" UNIQUE (code);


--
-- Name: product_variant UNQ_product_variant_sku; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "UNQ_product_variant_sku" UNIQUE (sku);


--
-- Name: promotion UNQ_promotion_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "UNQ_promotion_code" UNIQUE (code);


--
-- Name: promotion_product UNQ_promotion_product_product_and_promotion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "UNQ_promotion_product_product_and_promotion" UNIQUE (product_id, promotion_id);


--
-- Name: role UNQ_role_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "UNQ_role_code" UNIQUE (code);


--
-- Name: size UNQ_size_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT "UNQ_size_code" UNIQUE (code);


--
-- Name: user_address UNQ_user_address; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT "UNQ_user_address" UNIQUE (user_id, address_id);


--
-- Name: warehouse UNQ_warehouse_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "UNQ_warehouse_code" UNIQUE (code);


--
-- Name: warehouse_item UNQ_warehouse_item_warehouse_and_product_variant; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_item
    ADD CONSTRAINT "UNQ_warehouse_item_warehouse_and_product_variant" UNIQUE (warehouse_id, product_variant_id);


--
-- Name: payment_intent UQ_b9cebf650ca7085ee0d9e354c06; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_intent
    ADD CONSTRAINT "UQ_b9cebf650ca7085ee0d9e354c06" UNIQUE (price_id);


--
-- Name: promotion_product UQ_e3da666ad54b1f52a74ff22e5ef; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "UQ_e3da666ad54b1f52a74ff22e5ef" UNIQUE (payment_intent_id);


--
-- Name: IDX_2b8372157eb9d8ead079ae2464; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_2b8372157eb9d8ead079ae2464" ON public.comment_media USING btree (comment_id);


--
-- Name: IDX_32a6fc2fcb019d8e3a8ace0f55; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_32a6fc2fcb019d8e3a8ace0f55" ON public.user_role USING btree (role_id);


--
-- Name: IDX_3d0a7155eafd75ddba5a701336; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_3d0a7155eafd75ddba5a701336" ON public.role_permission USING btree (role_id);


--
-- Name: IDX_836547538c99a9e36a9323a6fd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_836547538c99a9e36a9323a6fd" ON public.comment_media USING btree (media_id);


--
-- Name: IDX_928fbf35568fcab9681d827079; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_928fbf35568fcab9681d827079" ON public.wishlist_item USING btree (product_id);


--
-- Name: IDX_ac00077fd9942e77c6ad2b5bf7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ac00077fd9942e77c6ad2b5bf7" ON public.wishlist_item USING btree (wishlist_id);


--
-- Name: IDX_b0895b1d84d747625a54b7fe9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_b0895b1d84d747625a54b7fe9c" ON public.product_media USING btree (media_id);


--
-- Name: IDX_d0e5815877f7395a198a4cb0a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_d0e5815877f7395a198a4cb0a4" ON public.user_role USING btree (user_id);


--
-- Name: IDX_e3a3ba47b7ca00fd23be4ebd6c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e3a3ba47b7ca00fd23be4ebd6c" ON public.role_permission USING btree (permission_id);


--
-- Name: IDX_e6bb4a69096db4f6a1f5bada15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_e6bb4a69096db4f6a1f5bada15" ON public.product_media USING btree (product_id);


--
-- Name: INX_address_city; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_address_city" ON public.address USING btree (city_id);


--
-- Name: INX_cart_item_cart; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_cart_item_cart" ON public.cart_item USING btree (cart_id);


--
-- Name: INX_cart_item_product_variant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_cart_item_product_variant" ON public.cart_item USING btree (product_variant_id);


--
-- Name: INX_cart_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_cart_user" ON public.cart USING btree (user_id);


--
-- Name: INX_comment_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_comment_product" ON public.comment USING btree (product_id);


--
-- Name: INX_comment_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_comment_user" ON public.comment USING btree (user_id);


--
-- Name: INX_delivery_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_delivery_address" ON public.cart USING btree (delivery_address_id);


--
-- Name: INX_delivery_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_delivery_method" ON public.cart USING btree (delivery_method_id);


--
-- Name: INX_delivery_method_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_delivery_method_status" ON public.delivery_method USING btree (status);


--
-- Name: INX_email_address_confirmation_email_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_email_address_confirmation_email_address" ON public.email_address_confirmation USING btree (email_address_id);


--
-- Name: INX_email_address_confirmation_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_email_address_confirmation_user" ON public.email_address_confirmation USING btree (user_id);


--
-- Name: INX_email_address_email_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_email_address_email_name" ON public.email_address USING btree (address, name);


--
-- Name: INX_order_deliveryAddress; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_deliveryAddress" ON public."order" USING btree (delivery_address_id);


--
-- Name: INX_order_deliveryMethod; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_deliveryMethod" ON public."order" USING btree (delivery_method_id);


--
-- Name: INX_order_history_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_history_order" ON public.order_history USING btree (order_id);


--
-- Name: INX_order_history_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_history_status" ON public.order_history USING btree (status);


--
-- Name: INX_order_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_index" ON public."order" USING btree (user_id);


--
-- Name: INX_order_item_order; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_item_order" ON public.order_item USING btree (order_id);


--
-- Name: INX_order_item_product_variant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_item_product_variant" ON public.order_item USING btree (product_variant_id);


--
-- Name: INX_order_item_warehouse; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_item_warehouse" ON public.order_item USING btree (warehouse_id);


--
-- Name: INX_order_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_order_status" ON public."order" USING btree (status);


--
-- Name: INX_payment_intent_payment_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_payment_intent_payment_method" ON public.payment_intent USING btree (payment_method_id);


--
-- Name: INX_payment_method; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_payment_method" ON public.cart USING btree (payment_method_id);


--
-- Name: INX_pickup_point_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_pickup_point_status" ON public.pickup_point USING btree (status);


--
-- Name: INX_price_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_price_currency" ON public.price USING btree (currency);


--
-- Name: INX_product_brand; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_product_brand" ON public.product USING btree (brand_id);


--
-- Name: INX_product_category; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_product_category" ON public.product USING btree (category_id);


--
-- Name: INX_product_variant_color; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_product_variant_color" ON public.product_variant USING btree (color_id);


--
-- Name: INX_product_variant_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_product_variant_product" ON public.product_variant USING btree (product_id);


--
-- Name: INX_product_variant_size; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_product_variant_size" ON public.product_variant USING btree (size_id);


--
-- Name: INX_promotion_product_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_promotion_product_product" ON public.promotion_product USING btree (product_id);


--
-- Name: INX_promotion_product_promotion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_promotion_product_promotion" ON public.promotion_product USING btree (promotion_id);


--
-- Name: INX_user_email_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_user_email_address" ON public."user" USING btree (email_address_id);


--
-- Name: INX_warehouse_item_productVariant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_warehouse_item_productVariant" ON public.warehouse_item USING btree (product_variant_id);


--
-- Name: INX_warehouse_item_warehouse; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_warehouse_item_warehouse" ON public.warehouse_item USING btree (warehouse_id);


--
-- Name: INX_warehouse_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_warehouse_status" ON public.warehouse USING btree (status);


--
-- Name: INX_wishlist_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "INX_wishlist_user" ON public.wishlist USING btree (user_id);


--
-- Name: warehouse_item FK_00b28f50b20c561838eb5882587; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_item
    ADD CONSTRAINT "FK_00b28f50b20c561838eb5882587" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: email_address_confirmation FK_020b0d824df44dfe1087f9d0961; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "FK_020b0d824df44dfe1087f9d0961" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order FK_0385c8f9ac80617a8434db660d8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_0385c8f9ac80617a8434db660d8" FOREIGN KEY (subtotal_price_id) REFERENCES public.price(id);


--
-- Name: city FK_08af2eeb576770524fa05e26f39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "FK_08af2eeb576770524fa05e26f39" FOREIGN KEY (country_id) REFERENCES public.country(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user FK_0db6ae09f20a66bb52f0b6c3040; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_0db6ae09f20a66bb52f0b6c3040" FOREIGN KEY (email_address_id) REFERENCES public.email_address(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product FK_0dce9bc93c2d2c399982d04bef1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_0dce9bc93c2d2c399982d04bef1" FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: cart FK_0eaeeeee07350c6e50a98550ae3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_0eaeeeee07350c6e50a98550ae3" FOREIGN KEY (delivery_address_id) REFERENCES public.address(id);


--
-- Name: category FK_1117b4fcb3cd4abb4383e1c2743; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "FK_1117b4fcb3cd4abb4383e1c2743" FOREIGN KEY (parent_id) REFERENCES public.category(id);


--
-- Name: order FK_199e32a02ddc0f47cd93181d8fd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_199e32a02ddc0f47cd93181d8fd" FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: order_item FK_19fe8036263238b4fb3866243bf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_19fe8036263238b4fb3866243bf" FOREIGN KEY (product_variant_id) REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_address FK_29d6df815a78e4c8291d3cf5e53; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT "FK_29d6df815a78e4c8291d3cf5e53" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment_media FK_2b8372157eb9d8ead079ae24642; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_media
    ADD CONSTRAINT "FK_2b8372157eb9d8ead079ae24642" FOREIGN KEY (comment_id) REFERENCES public.comment(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order FK_2c1fa6ebea7b1fe1392305c1de6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_2c1fa6ebea7b1fe1392305c1de6" FOREIGN KEY (delivery_price_id) REFERENCES public.price(id);


--
-- Name: product FK_2eb5ce4324613b4b457c364f4a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_2eb5ce4324613b4b457c364f4a2" FOREIGN KEY (brand_id) REFERENCES public.brand(id);


--
-- Name: user_role FK_32a6fc2fcb019d8e3a8ace0f55f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "FK_32a6fc2fcb019d8e3a8ace0f55f" FOREIGN KEY (role_id) REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_method FK_3aeca493407fe33a79605f9a708; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT "FK_3aeca493407fe33a79605f9a708" FOREIGN KEY (media_id) REFERENCES public.media(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: role_permission FK_3d0a7155eafd75ddba5a7013368; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT "FK_3d0a7155eafd75ddba5a7013368" FOREIGN KEY (role_id) REFERENCES public.role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_history FK_3e8ecdec907bbf6d4cceb3ab2a4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_history
    ADD CONSTRAINT "FK_3e8ecdec907bbf6d4cceb3ab2a4" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart FK_3ffd417b8ae99906712b4f4024e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_3ffd417b8ae99906712b4f4024e" FOREIGN KEY (delivery_method_id) REFERENCES public.delivery_method(id);


--
-- Name: order FK_451b11cb12bc07db00d19c5a511; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_451b11cb12bc07db00d19c5a511" FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(id);


--
-- Name: cart_item FK_4651c6301c4cfa7c9c8d79df060; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_4651c6301c4cfa7c9c8d79df060" FOREIGN KEY (product_variant_id) REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: wishlist FK_512bf776587ad5fc4f804277d76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT "FK_512bf776587ad5fc4f804277d76" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: delivery_method FK_5c8871fd7684ff5d740c7c0bad1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery_method
    ADD CONSTRAINT "FK_5c8871fd7684ff5d740c7c0bad1" FOREIGN KEY (price_id) REFERENCES public.price(id);


--
-- Name: cart FK_5cc42e069bb85452e3925e69440; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_5cc42e069bb85452e3925e69440" FOREIGN KEY (total_price_id) REFERENCES public.price(id);


--
-- Name: email_address_confirmation FK_5e1503f39f23c2bafbebc7f852c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_address_confirmation
    ADD CONSTRAINT "FK_5e1503f39f23c2bafbebc7f852c" FOREIGN KEY (email_address_id) REFERENCES public.email_address(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comment FK_66a8816397e580b819e78d974dd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_66a8816397e580b819e78d974dd" FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: address FK_714a4ca3cfd66a718b5f7c3fee5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_714a4ca3cfd66a718b5f7c3fee5" FOREIGN KEY (city_id) REFERENCES public.city(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart FK_73375730095a20d71bf4c52e1a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_73375730095a20d71bf4c52e1a2" FOREIGN KEY (delivery_price_id) REFERENCES public.price(id);


--
-- Name: cart FK_7c115d5634f46d40539eaf67c5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_7c115d5634f46d40539eaf67c5c" FOREIGN KEY (subtotal_price_id) REFERENCES public.price(id);


--
-- Name: address FK_7fc5b7774d17d6824c5938d20be; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_7fc5b7774d17d6824c5938d20be" FOREIGN KEY (country_id) REFERENCES public.country(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order FK_804420f24049a1a9483f10df395; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_804420f24049a1a9483f10df395" FOREIGN KEY (tax_price_id) REFERENCES public.price(id);


--
-- Name: comment_media FK_836547538c99a9e36a9323a6fd3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_media
    ADD CONSTRAINT "FK_836547538c99a9e36a9323a6fd3" FOREIGN KEY (media_id) REFERENCES public.media(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart FK_841501bfe622fcac2b722820e59; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_841501bfe622fcac2b722820e59" FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(id);


--
-- Name: order FK_8a47e1e61181fd72a477a68cafd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_8a47e1e61181fd72a477a68cafd" FOREIGN KEY (payment_intent_id) REFERENCES public.payment_intent(id);


--
-- Name: wishlist_item FK_928fbf35568fcab9681d8270792; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist_item
    ADD CONSTRAINT "FK_928fbf35568fcab9681d8270792" FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item FK_96061445fe14aa45cdfc1770e2f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_96061445fe14aa45cdfc1770e2f" FOREIGN KEY (price_id) REFERENCES public.price(id);


--
-- Name: pickup_point FK_9b549df6e07a128e5a2649c013c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pickup_point
    ADD CONSTRAINT "FK_9b549df6e07a128e5a2649c013c" FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- Name: promotion_product FK_a16e17a90c2106ee13dad46b3f2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "FK_a16e17a90c2106ee13dad46b3f2" FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item FK_a1a72fe223527f6002382f0fdc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_a1a72fe223527f6002382f0fdc1" FOREIGN KEY (warehouse_id) REFERENCES public.warehouse(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart FK_a739d95db97835129782e8f7fe8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_a739d95db97835129782e8f7fe8" FOREIGN KEY (tax_price_id) REFERENCES public.price(id);


--
-- Name: wishlist_item FK_ac00077fd9942e77c6ad2b5bf71; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist_item
    ADD CONSTRAINT "FK_ac00077fd9942e77c6ad2b5bf71" FOREIGN KEY (wishlist_id) REFERENCES public.wishlist(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_media FK_b0895b1d84d747625a54b7fe9cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_media
    ADD CONSTRAINT "FK_b0895b1d84d747625a54b7fe9cf" FOREIGN KEY (media_id) REFERENCES public.media(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: payment_intent FK_b308a8207f95c5335cf093f4c24; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_intent
    ADD CONSTRAINT "FK_b308a8207f95c5335cf093f4c24" FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_address FK_b3bdd98c49956021c44c23a48c4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_address
    ADD CONSTRAINT "FK_b3bdd98c49956021c44c23a48c4" FOREIGN KEY (address_id) REFERENCES public.address(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_item FK_b6b2a4f1f533d89d218e70db941; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_b6b2a4f1f533d89d218e70db941" FOREIGN KEY (cart_id) REFERENCES public.cart(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user FK_b777e56620c3f1ac0308514fc4c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_b777e56620c3f1ac0308514fc4c" FOREIGN KEY (avatar_id) REFERENCES public.media(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order FK_b8a2e9f9bdb35688d5ede4acaff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_b8a2e9f9bdb35688d5ede4acaff" FOREIGN KEY (total_price_id) REFERENCES public.price(id);


--
-- Name: payment_intent FK_b9cebf650ca7085ee0d9e354c06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_intent
    ADD CONSTRAINT "FK_b9cebf650ca7085ee0d9e354c06" FOREIGN KEY (price_id) REFERENCES public.price(id);


--
-- Name: product_variant FK_ba659ff2940702124e799c5c854; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_ba659ff2940702124e799c5c854" FOREIGN KEY (price_id) REFERENCES public.price(id);


--
-- Name: comment FK_bbfe153fa60aa06483ed35ff4a7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_bbfe153fa60aa06483ed35ff4a7" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order FK_c2174656c906b095156101a3fa9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_c2174656c906b095156101a3fa9" FOREIGN KEY (delivery_method_id) REFERENCES public.delivery_method(id);


--
-- Name: product_variant FK_ca67dd080aac5ecf99609960cd2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_ca67dd080aac5ecf99609960cd2" FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_role FK_d0e5815877f7395a198a4cb0a46; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT "FK_d0e5815877f7395a198a4cb0a46" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order FK_d562b5e496bc155370de04e7d94; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_d562b5e496bc155370de04e7d94" FOREIGN KEY (delivery_address_id) REFERENCES public.address(id);


--
-- Name: product_variant FK_dd903be8fad7a34695ac233c288; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_dd903be8fad7a34695ac233c288" FOREIGN KEY (color_id) REFERENCES public.color(id);


--
-- Name: product_variant FK_ddb5b746c0284a1f85d76236453; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_variant
    ADD CONSTRAINT "FK_ddb5b746c0284a1f85d76236453" FOREIGN KEY (size_id) REFERENCES public.size(id);


--
-- Name: brand FK_dec543a30fbb37acf417d90be3c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "FK_dec543a30fbb37acf417d90be3c" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: warehouse FK_e3166be4143d134babc789bef1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT "FK_e3166be4143d134babc789bef1c" FOREIGN KEY (address_id) REFERENCES public.address(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: role_permission FK_e3a3ba47b7ca00fd23be4ebd6cf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permission
    ADD CONSTRAINT "FK_e3a3ba47b7ca00fd23be4ebd6cf" FOREIGN KEY (permission_id) REFERENCES public.permission(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_product FK_e3da666ad54b1f52a74ff22e5ef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "FK_e3da666ad54b1f52a74ff22e5ef" FOREIGN KEY (payment_intent_id) REFERENCES public.payment_intent(id);


--
-- Name: product_media FK_e6bb4a69096db4f6a1f5bada151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_media
    ADD CONSTRAINT "FK_e6bb4a69096db4f6a1f5bada151" FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_item FK_e9674a6053adbaa1057848cddfa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_item
    ADD CONSTRAINT "FK_e9674a6053adbaa1057848cddfa" FOREIGN KEY (order_id) REFERENCES public."order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: warehouse_item FK_ea7d865bb1d8c8febfaeeb12675; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouse_item
    ADD CONSTRAINT "FK_ea7d865bb1d8c8febfaeeb12675" FOREIGN KEY (product_variant_id) REFERENCES public.product_variant(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart FK_f091e86a234693a49084b4c2c86; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT "FK_f091e86a234693a49084b4c2c86" FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion_product FK_f0dd6457938a3adabdb3c9b95f3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_product
    ADD CONSTRAINT "FK_f0dd6457938a3adabdb3c9b95f3" FOREIGN KEY (promotion_id) REFERENCES public.promotion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cart_item FK_f7fa99d5c584b9658504c2b59ab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT "FK_f7fa99d5c584b9658504c2b59ab" FOREIGN KEY (price_id) REFERENCES public.price(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: promotion FK_ffc9457f6dee1bd7f564a9edc8e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion
    ADD CONSTRAINT "FK_ffc9457f6dee1bd7f564a9edc8e" FOREIGN KEY (price_id) REFERENCES public.price(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

