--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE bella;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:KO6fDa8NBdt5QUuXAnpApQ==$g5ajfsSE5TmcXltl1O2glY1eUGFzMMGxC0l0E7Mrhkw=:MU6UD3ACsxQ11pQfiFXtMHF5gmca4R/8Z7Fhczwk2Po=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Database "bella" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: bella; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bella WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE bella OWNER TO postgres;

\connect bella

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO postgres;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO postgres;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: articles_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articles_article (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    date timestamp with time zone NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.articles_article OWNER TO postgres;

--
-- Name: articles_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.articles_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_article_id_seq OWNER TO postgres;

--
-- Name: articles_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.articles_article_id_seq OWNED BY public.articles_article.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_order (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    address character varying(250) NOT NULL,
    postal_code character varying(20) NOT NULL,
    city character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    paid boolean NOT NULL,
    client_id integer NOT NULL
);


ALTER TABLE public.orders_order OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: orders_orderitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_orderitem (
    id bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT orders_orderitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.orders_orderitem OWNER TO postgres;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderitem_id_seq OWNER TO postgres;

--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderitem_id_seq OWNED BY public.orders_orderitem.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.shop_category OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_category_id_seq OWNER TO postgres;

--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_category_id_seq OWNED BY public.shop_category.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_product (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    image character varying(100) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    available boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.shop_product OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO postgres;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: articles_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_article ALTER COLUMN id SET DEFAULT nextval('public.articles_article_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: orders_orderitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem ALTER COLUMN id SET DEFAULT nextval('public.orders_orderitem_id_seq'::regclass);


--
-- Name: shop_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category ALTER COLUMN id SET DEFAULT nextval('public.shop_category_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: articles_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.articles_article (id, title, body, date, author_id) FROM stdin;
1	How To Choose The Right Tyres	Tyres can make or break your daily drive, so choosing the best tyres is vital for your driving experience.\r\nThey are the only part of your vehicle touching the road and it's essential to get the best set when it's time to replace your tyres.\r\nIf you don't find the right tyres for your car, you're risking the safety of other drivers on the road. Here's how you can choose the right tyre for your car:\r\n\r\n1. Check your tyre size\r\nTo find out which model is available for your car, you need to know your tyre size. With Tyroola, just enter your Rego and your size will be displayed.\r\nenter your Rego and your size will be displayed.Your new tyres should have the same tyre size, load rating and speed rating as the OEM tyres/recommended by the vehicle manufacturer.\r\n\r\n2. Choose tyres that match the kind of vehicle you drive.\r\nDo you drive an Suv / Commercial van / Ute / Mini-car / Sports car / 4x4 / Sedan? If you drive an SUV, for example, you will need to choose SUV tyres for your vehicle - and so on. Choosing an aggressive mud-terrain tyre might not be the best choice for your Sports car.\r\n\r\n3. Should you stick with the OEMs or try a new brand?\r\nAll cars come with original equipment tyres handpicked by the car manufacturer. If you are satisfied with the OEM's performance, then, by all means, purchase a fresh set. Technically, these tyres are the optimum choice since they were designed specifically for your car model. Simply look through your driver's manual or check Tyroola for more details about the exact tyre model you need.\r\nHowever, you might want to switch your OEM tyres out for aftermarket tyres - a new tyre brand or model. There are many reasons not to stick to your OEMs:\r\nYour OEM tyres are no longer available in the market.\r\nYour OEMs don't satisfy you and can't deliver what you need.\r\nUpgrading your tyres to a more reliable, long-lasting tyre with better handling and traction.\r\nDowngrading to a tyre that might not be as high-performance but is more fuel-efficient.\r\nTyroola's cheap prices and regular promotions also make it attractive to change your OEMs.\r\nWhatever you decide - sticking to the Original Equipment or changing them for aftermarket tires, you’ll definitely find them at Tyroola.	2022-07-08 08:09:17.535299+00	1
2	7 Essential Factors You Must Consider to Choose the Best Tyres for Your Car	Changing car tyres is an essential part of maintenance that every driver has to face. The tyres you choose can determine your whole driving experience—tyres affect how well your car handles, the speed which you can drive at, and the conditions you can drive in.\r\nBut most importantly, they affect your car's safety. The best tyre is not a universal one-size-fits-all item—it depends on your personal driving style. Using these seven criteria, you can judge which tyres will be most suitable for your own requirements.	2022-07-08 08:10:08.550605+00	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add article	9	add_article
34	Can change article	9	change_article
35	Can delete article	9	delete_article
36	Can view article	9	view_article
37	Can add product	10	add_product
38	Can change product	10	change_product
39	Can delete product	10	delete_product
40	Can view product	10	view_product
41	Can add category	11	add_category
42	Can change category	11	change_category
43	Can delete category	11	delete_category
44	Can view category	11	view_category
45	Can add order	12	add_order
46	Can change order	12	change_order
47	Can delete order	12	delete_order
48	Can view order	12	view_order
49	Can add order item	13	add_orderitem
50	Can change order item	13	change_orderitem
51	Can delete order item	13	delete_orderitem
52	Can view order item	13	view_orderitem
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$0uipWrRwMCkIQSimjFGuKd$8k/7f1QkYJK4ZsTuglaB5O3vZ8x+JP5KzqR5+r23UjI=	2022-07-15 17:31:01.43332+00	t	admin			admin@admin.com	t	t	2022-06-27 06:56:03.119882+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-07-08 05:00:20.674036+00	1	Tyre	1	[{"added": {}}]	11	1
2	2022-07-08 05:01:29.203385+00	1	Tyre Winter	2	[{"changed": {"fields": ["Name"]}}]	11	1
3	2022-07-08 05:01:42.43923+00	2	Tyre Summer	1	[{"added": {}}]	11	1
4	2022-07-08 05:02:16.017227+00	3	Tyre All Season	1	[{"added": {}}]	11	1
5	2022-07-08 05:06:05.773724+00	1	Шини Goodyear Eagle Sport 2	1	[{"added": {}}]	10	1
6	2022-07-08 05:07:37.793134+00	2	Goodyear Eagle Sport TZ	1	[{"added": {}}]	10	1
7	2022-07-08 05:07:55.065481+00	1	Goodyear Eagle Sport 2	2	[{"changed": {"fields": ["Name", "Slug"]}}]	10	1
8	2022-07-08 05:09:07.12808+00	3	Goodyear EfficientGrip Performance	1	[{"added": {}}]	10	1
9	2022-07-10 05:47:41.361835+00	1	Order 1	3		12	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	account	emailaddress
8	account	emailconfirmation
9	articles	article
10	shop	product
11	shop	category
12	orders	order
13	orders	orderitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-27 06:55:10.539669+00
2	auth	0001_initial	2022-06-27 06:55:10.936287+00
3	account	0001_initial	2022-06-27 06:55:11.112074+00
4	account	0002_email_max_length	2022-06-27 06:55:11.149221+00
5	admin	0001_initial	2022-06-27 06:55:11.250218+00
6	admin	0002_logentry_remove_auto_add	2022-06-27 06:55:11.262595+00
7	admin	0003_logentry_add_action_flag_choices	2022-06-27 06:55:11.281409+00
8	contenttypes	0002_remove_content_type_name	2022-06-27 06:55:11.312202+00
9	auth	0002_alter_permission_name_max_length	2022-06-27 06:55:11.327001+00
10	auth	0003_alter_user_email_max_length	2022-06-27 06:55:11.358634+00
11	auth	0004_alter_user_username_opts	2022-06-27 06:55:11.37408+00
12	auth	0005_alter_user_last_login_null	2022-06-27 06:55:11.411771+00
13	auth	0006_require_contenttypes_0002	2022-06-27 06:55:11.416183+00
14	auth	0007_alter_validators_add_error_messages	2022-06-27 06:55:11.429175+00
15	auth	0008_alter_user_username_max_length	2022-06-27 06:55:11.469795+00
16	auth	0009_alter_user_last_name_max_length	2022-06-27 06:55:11.486081+00
17	auth	0010_alter_group_name_max_length	2022-06-27 06:55:11.515511+00
18	auth	0011_update_proxy_permissions	2022-06-27 06:55:11.528525+00
19	auth	0012_alter_user_first_name_max_length	2022-06-27 06:55:11.54056+00
20	sessions	0001_initial	2022-06-27 06:55:11.626828+00
21	articles	0001_initial	2022-07-07 11:14:46.087012+00
22	shop	0001_initial	2022-07-07 15:39:20.21554+00
25	orders	0001_initial	2022-07-10 05:56:26.702897+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2289vk1y7mnhyhl2qkue73f4x1w5e8it	.eJxVjEEOwiAQRe_C2pDC0A64dN8zkAEGqRqalHZlvLtt0oVu33v_v4WnbS1-a7z4KYmrUOLyywLFJ9dDpAfV-yzjXNdlCvJI5GmbHOfEr9vZ_h0UamVfM-vAiHZwkHKOvQKDMSMQBee0tYZYmb4LpG3mmCDsHIbYISWbQaH4fAEAYDif:1o5il5:PQT494t4PaJJjshnc-gPG9ej7XkstmwVhhSlzSMx57s	2022-07-11 07:02:07.231374+00
aen364z8krtz0rctqgg8cff8w5oqx204	.eJxVjcsOwiAQRf-FtWl4tAW60x8hwzCkxIYaoYnG-O9S04Uu77kz576Yg63Obit0dymwiQl2-mUe8Ep5L2BZdtwB4rrl2n1vjrp055Yo14RQ05ovx9efaoYyNw-R9KS1Ga0KMeIgVK8xagXgrZXG9ECiH7gHaSJhUL5xNSLXEExUQu_SQqW0GUePW7o_2SQktyPn7w-EmkWC:1o9PdT:yd4lnIREHZAF92nJpA0HssLeI2fUB1k30ZtD9s5Mjac	2022-07-21 11:25:31.85401+00
swgacqi32o299os2a4pj5zgyasie8yjj	.eJxVT0uOgzAMvYvXCCUESGDXXgQ5xhHRtECTILWquHuTURczG8vv42f7DRMeaZmOyGHyM4wgofrLWaQfXouAt1uhayTajjXVv56vHOtLRrwmT5j8tl6_U_-iFoxLzmFuLGtt-kHNzlEnVavJaYVoh6ExpkWWbScsNsYxzcpmXvUkNM7GKalLaOQY85qJn7sPLxhlI4ZeiApou-8YGMb3mQGGlDtQpTwOzOelYq5gD564PGs6UQsB53l-ALRQV4s:1oAtff:ma0_B5LwiI-dheGIfHZM49Cyuefk7LU8LQKLNSBCbDw	2022-07-25 13:41:55.857366+00
jwk3in2mty7qmabhtd9qh7mnrepl5ack	eyJjYXJ0Ijp7fSwiY29tcGFyZSI6e319:1oAvab:3xecDfto8gaSkmyKnX4SHeuzf5uL-RC79ZC4tW0EMj4	2022-07-25 15:44:49.871572+00
7dvinoz5iwro3s8emllk82z7imqrls3e	eyJjYXJ0Ijp7fSwiY29tcGFyZSI6e319:1oAznh:ovSnBm4Ajexai5vcQwbZ8JfXiDfZtBcCkWU09j7-C3U	2022-07-25 20:14:37.729857+00
9lhuq1h4pvj9gd1m37a9q2hn4bonzd54	.eJxdj8EKgzAQRP8lZ5HEqIne2h-RzbpBqVWbRGgR_71J8WIvC_tmZ5bZGS7PFRyxdmcijdcGcxjDh7XiyJj8R5F1sIWh2zy5buxZG20XZgAfNCcBpinhHBCXbQ757-aUfX6LG8VchDAu8_10XaIG8EPMISoMKaXrRvbWYiVkqdAqCWCaptC6BBJlxQ0U2hL20kQua-QKem2lUCnUk_fxTUfvdXSpScGbmvOMIbgQSx7HF9VFWS8:1oDOpF:VqEw2jWQ2MgyoPGD_CLyjSCsUtEiUcMiktLvVPlGLHY	2022-08-01 11:22:09.189946+00
ho9ow2f6ysqfg97ufk4b9mdc7ferdep7	.eJxVj8EKgzAQRP9lzyKJURO9tT8im3WDUqutidAi_nuT4sXLws7svmF2oOX5wpWh3UGl8d5wDmP4QiuPI4MOtzB0m-e1G3toQcJFs0gPnpOB05TkHImWbQ75_-a0fX6LG0cuYRiX-X5-XVAD-iFymAvLWpu6Ub1zVElVanJaIdqmKYwpkWVZCYuFcUy9slFXNQmNvXFK6gT17H2M6fjzGtfUpBBNLUQGhGuIJY_jB7_nUy4:1oBBim:tEmZr-zKiSkj311FWAi3V4jPi77aRrXb7DY5aDDCyTA	2022-07-26 08:58:20.931772+00
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_order (id, first_name, last_name, email, address, postal_code, city, created, updated, paid, client_id) FROM stdin;
5	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-10 06:23:18.609706+00	2022-07-10 06:23:18.609722+00	f	1
6	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-10 07:12:32.82587+00	2022-07-10 07:12:32.825883+00	f	1
7	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-10 16:44:10.531991+00	2022-07-10 16:44:10.532004+00	f	1
8	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 13:39:12.526846+00	2022-07-11 13:39:12.52686+00	f	1
9	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 19:22:16.864877+00	2022-07-11 19:22:16.864891+00	f	1
10	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 19:23:40.711447+00	2022-07-11 19:23:40.711461+00	f	1
11	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:07:31.568854+00	2022-07-11 20:07:31.568866+00	f	1
12	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:43:50.729087+00	2022-07-11 20:43:50.729104+00	f	1
13	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:43:52.41701+00	2022-07-11 20:43:52.417023+00	f	1
14	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:43:53.602788+00	2022-07-11 20:43:53.602801+00	f	1
15	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:54:50.211283+00	2022-07-11 20:54:50.211297+00	f	1
16	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:54:55.678125+00	2022-07-11 20:54:55.678307+00	f	1
17	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-11 20:55:33.378235+00	2022-07-11 20:55:33.378249+00	f	1
18	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:30:44.77468+00	2022-07-12 08:30:44.774695+00	f	1
19	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:31:56.573486+00	2022-07-12 08:31:56.573502+00	f	1
20	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:33:45.4988+00	2022-07-12 08:33:45.498823+00	f	1
21	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:48:55.739884+00	2022-07-12 08:48:55.73996+00	f	1
22	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:55:27.634981+00	2022-07-12 08:55:27.635056+00	f	1
23	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-12 08:58:10.883332+00	2022-07-12 08:58:10.883345+00	f	1
24	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 17:31:10.800149+00	2022-07-15 17:31:10.800163+00	f	1
25	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 17:35:54.074175+00	2022-07-15 17:35:54.074188+00	f	1
26	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 17:44:34.095966+00	2022-07-15 17:44:34.095979+00	f	1
27	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 17:53:00.988381+00	2022-07-15 17:53:00.988397+00	f	1
28	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:03:45.324838+00	2022-07-15 18:03:45.324898+00	f	1
29	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:07:42.893854+00	2022-07-15 18:07:42.893869+00	f	1
30	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:14:32.222635+00	2022-07-15 18:14:32.222648+00	f	1
31	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:20:21.386129+00	2022-07-15 18:20:21.386181+00	f	1
32	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:33:11.061943+00	2022-07-15 18:33:11.06196+00	f	1
33	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 18:59:44.423139+00	2022-07-15 18:59:44.423159+00	f	1
34	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 19:11:55.239165+00	2022-07-15 19:11:55.23918+00	f	1
35	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 19:14:31.017803+00	2022-07-15 19:14:31.017816+00	f	1
36	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 19:16:46.081367+00	2022-07-15 19:16:46.081381+00	f	1
37	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 19:17:04.510301+00	2022-07-15 19:17:04.51032+00	f	1
38	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-15 19:19:22.778108+00	2022-07-15 19:19:22.77824+00	f	1
71	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-16 06:01:36.095483+00	2022-07-16 06:01:36.095506+00	f	1
72	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-16 06:10:06.0335+00	2022-07-16 06:10:06.033514+00	f	1
73	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-18 11:10:29.410056+00	2022-07-18 11:10:29.41007+00	f	1
74	Vasyl	Piasetskyi	vasylpiasetskij@gmail.com	Kulparkivska 230a/6, app.57,	79071	Lviv	2022-07-18 11:15:22.954164+00	2022-07-18 11:15:22.954185+00	f	1
\.


--
-- Data for Name: orders_orderitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_orderitem (id, price, quantity, order_id, product_id) FROM stdin;
1	3226.00	1	5	1
2	1850.00	1	5	3
3	3226.00	9	6	1
4	3226.00	1	7	1
5	1850.00	1	7	3
6	3226.00	1	8	1
7	2234.00	1	8	2
8	1850.00	1	9	3
9	1850.00	1	10	3
10	1850.00	1	11	3
11	1850.00	1	12	3
12	1850.00	1	13	3
13	1850.00	1	14	3
14	1850.00	1	15	3
15	1850.00	1	16	3
16	1850.00	1	17	3
17	1850.00	1	18	3
18	3226.00	1	19	1
19	3226.00	1	20	1
20	3226.00	1	21	1
21	1850.00	1	21	3
22	3226.00	1	22	1
23	1850.00	1	22	3
24	1850.00	1	23	3
25	3226.00	1	24	1
26	1850.00	1	25	3
27	1850.00	1	26	3
28	1850.00	1	27	3
29	1850.00	1	28	3
30	1850.00	1	29	3
31	1850.00	1	30	3
32	1850.00	1	31	3
33	1850.00	1	32	3
34	1850.00	1	33	3
35	3226.00	1	34	1
36	1850.00	1	35	3
37	3226.00	1	37	1
38	3226.00	1	38	1
71	1850.00	1	71	3
72	1850.00	1	72	3
73	1850.00	1	73	3
74	1850.00	1	74	3
\.


--
-- Data for Name: shop_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_category (id, name, slug, is_active, created, updated) FROM stdin;
1	Tyre Winter	tyre	t	2022-07-08 05:00:20.63331+00	2022-07-08 05:01:29.201894+00
2	Tyre Summer	tyre-summer	t	2022-07-08 05:01:42.437148+00	2022-07-08 05:01:42.437168+00
3	Tyre All Season	tyre-all-season	t	2022-07-08 05:02:16.011771+00	2022-07-08 05:02:16.011791+00
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shop_product (id, name, slug, image, description, price, available, created, updated, category_id) FROM stdin;
2	Goodyear Eagle Sport TZ	goodyear-eagle-sport-tz		Ширина:\r\n235\r\nПрофіль:\r\n45\r\nДіаметр:\r\nR18\r\nТип Т/З:\r\nлегковий\r\nІндекс навантаження:\r\n98 - до 750 кг\r\nІндекс швидкості:\r\nY - до 300 км/год	2234.00	t	2022-07-08 05:07:37.787829+00	2022-07-08 05:07:37.787846+00	2
1	Goodyear Eagle Sport 2	goodyear-eagle-sport-2	products/2022/07/08/Goodyear_Eagle_Sport_TZ.500x500.jpg	Ширина:\r\n235\r\nПрофіль:\r\n45\r\nДіаметр:\r\nR18\r\nТип Т/З:\r\nлегковий\r\nІндекс навантаження:\r\n98 - до 750 кг\r\nІндекс швидкості:\r\nY - до 300 км/год	3226.00	t	2022-07-08 05:06:05.750516+00	2022-07-08 05:07:55.063061+00	2
3	Goodyear EfficientGrip Performance	goodyear-efficientgrip-performance	products/2022/07/08/ba5454510004fa83764140f00bc4a046ffb30173cdce595cc2e9a4eadec0a8bd.500x500.jpg	Ширина:\r\n195\r\nПрофіль:\r\n65\r\nДіаметр:\r\nR15\r\nТип Т/З:\r\nлегковий\r\nІндекс навантаження:\r\n91 - до 615 кг\r\nІндекс швидкості:\r\nV - до 240 км/год	1850.00	t	2022-07-08 05:09:07.117486+00	2022-07-08 05:09:07.117506+00	1
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: articles_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.articles_article_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 52, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 9, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 13, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 74, true);


--
-- Name: orders_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderitem_id_seq', 74, true);


--
-- Name: shop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_category_id_seq', 3, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 3, true);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: articles_article articles_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_article
    ADD CONSTRAINT articles_article_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: orders_orderitem orders_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_slug_key UNIQUE (slug);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: articles_article_author_id_059aea7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX articles_article_author_id_059aea7d ON public.articles_article USING btree (author_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_order_client_id_67117a15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_client_id_67117a15 ON public.orders_order USING btree (client_id);


--
-- Name: orders_orderitem_order_id_fe61a34d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderitem_order_id_fe61a34d ON public.orders_orderitem USING btree (order_id);


--
-- Name: orders_orderitem_product_id_afe4254a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_orderitem_product_id_afe4254a ON public.orders_orderitem USING btree (product_id);


--
-- Name: shop_category_name_11b68823; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_name_11b68823 ON public.shop_category USING btree (name);


--
-- Name: shop_category_name_11b68823_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_name_11b68823_like ON public.shop_category USING btree (name varchar_pattern_ops);


--
-- Name: shop_category_slug_4508178e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_category_slug_4508178e_like ON public.shop_category USING btree (slug varchar_pattern_ops);


--
-- Name: shop_product_category_id_14d7eea8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_category_id_14d7eea8 ON public.shop_product USING btree (category_id);


--
-- Name: shop_product_id_slug_68aad32e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_id_slug_68aad32e_idx ON public.shop_product USING btree (id, slug);


--
-- Name: shop_product_name_b8d5e94c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_b8d5e94c ON public.shop_product USING btree (name);


--
-- Name: shop_product_name_b8d5e94c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_name_b8d5e94c_like ON public.shop_product USING btree (name varchar_pattern_ops);


--
-- Name: shop_product_slug_30bd2d5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_slug_30bd2d5d ON public.shop_product USING btree (slug);


--
-- Name: shop_product_slug_30bd2d5d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX shop_product_slug_30bd2d5d_like ON public.shop_product USING btree (slug varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: articles_article articles_article_author_id_059aea7d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articles_article
    ADD CONSTRAINT articles_article_author_id_059aea7d_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_client_id_67117a15_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_client_id_67117a15_fk_auth_user_id FOREIGN KEY (client_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_order_id_fe61a34d_fk_orders_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_order_id_fe61a34d_fk_orders_order_id FOREIGN KEY (order_id) REFERENCES public.orders_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_orderitem orders_orderitem_product_id_afe4254a_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_orderitem
    ADD CONSTRAINT orders_orderitem_product_id_afe4254a_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_category_id_14d7eea8_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_category_id_14d7eea8_fk_shop_category_id FOREIGN KEY (category_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

