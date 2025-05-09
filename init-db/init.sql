--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: admin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: admin
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL PRIMARY KEY,
    "userId" integer NOT NULL,
    "productId" integer NOT NULL,
    quantity integer NOT NULL,
    "productColorId" integer NOT NULL,
    "productSizeId" integer NOT NULL
);


ALTER TABLE public.carts OWNER TO admin;

--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."carts_cartId_seq" OWNER TO admin;

--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: categories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.categories (
    "categoryId" integer NOT NULL PRIMARY KEY,
    name character varying(255) NOT NULL,
    image character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO admin;

--
-- Name: categories_categoryId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."categories_categoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."categories_categoryId_seq" OWNER TO admin;

--
-- Name: categories_categoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."categories_categoryId_seq" OWNED BY public.categories."categoryId";


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.notifications (
    "notificationId" integer NOT NULL PRIMARY KEY,
    "userId" integer NOT NULL,
    "orderId" integer NOT NULL,
    title character varying(255) NOT NULL,
    message character varying(255) NOT NULL,
    read boolean DEFAULT false NOT NULL,
    "notificationDate" timestamp with time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO admin;

--
-- Name: notifications_notificationId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."notifications_notificationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."notifications_notificationId_seq" OWNER TO admin;

--
-- Name: notifications_notificationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."notifications_notificationId_seq" OWNED BY public.notifications."notificationId";


--
-- Name: orderItems; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."orderItems" (
    "orderItemId" integer NOT NULL PRIMARY KEY,
    "orderId" integer NOT NULL,
    "productId" integer NOT NULL,
    "productColorId" integer NOT NULL,
    "productSizeId" integer NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public."orderItems" OWNER TO admin;

--
-- Name: orderItems_orderItemId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."orderItems_orderItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orderItems_orderItemId_seq" OWNER TO admin;

--
-- Name: orderItems_orderItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."orderItems_orderItemId_seq" OWNED BY public."orderItems"."orderItemId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL PRIMARY KEY,
    "userId" integer NOT NULL,
    "orderDate" timestamp with time zone NOT NULL,
    "orderStatus" integer NOT NULL,
    address character varying(255) NOT NULL,
    province character varying(255) NOT NULL,
    district character varying(255) NOT NULL,
    ward character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    quantity integer NOT NULL,
    total integer NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL
);


ALTER TABLE public.orders OWNER TO admin;

--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orders_orderId_seq" OWNER TO admin;

--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: productCategories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productCategories" (
    "productCategoryId" integer NOT NULL PRIMARY KEY,
    "productId" integer NOT NULL,
    "categoryId" integer NOT NULL
);


ALTER TABLE public."productCategories" OWNER TO admin;

--
-- Name: productCategories_productCategoryId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productCategories_productCategoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productCategories_productCategoryId_seq" OWNER TO admin;

--
-- Name: productCategories_productCategoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productCategories_productCategoryId_seq" OWNED BY public."productCategories"."productCategoryId";


--
-- Name: productColors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productColors" (
    "productColorId" integer NOT NULL PRIMARY KEY,
    name character varying(255) NOT NULL,
    hex character varying(255) NOT NULL
);


ALTER TABLE public."productColors" OWNER TO admin;

--
-- Name: productColors_productColorId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productColors_productColorId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productColors_productColorId_seq" OWNER TO admin;

--
-- Name: productColors_productColorId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productColors_productColorId_seq" OWNED BY public."productColors"."productColorId";


--
-- Name: productGeneralImages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productGeneralImages" (
    "productGeneralImageId" integer NOT NULL PRIMARY KEY,
    image character varying(255) NOT NULL,
    "productId" integer NOT NULL
);


ALTER TABLE public."productGeneralImages" OWNER TO admin;

--
-- Name: productGeneralImages_productGeneralImageId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productGeneralImages_productGeneralImageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productGeneralImages_productGeneralImageId_seq" OWNER TO admin;

--
-- Name: productGeneralImages_productGeneralImageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productGeneralImages_productGeneralImageId_seq" OWNED BY public."productGeneralImages"."productGeneralImageId";


--
-- Name: productImages; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productImages" (
    "productImageId" integer NOT NULL PRIMARY KEY,
    image character varying(255) NOT NULL,
    "productId" integer NOT NULL,
    "productColorId" integer NOT NULL
);


ALTER TABLE public."productImages" OWNER TO admin;

--
-- Name: productImages_productImageId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productImages_productImageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productImages_productImageId_seq" OWNER TO admin;

--
-- Name: productImages_productImageId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productImages_productImageId_seq" OWNED BY public."productImages"."productImageId";


--
-- Name: productInventories; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productInventories" (
    "productInventoryId" integer NOT NULL PRIMARY KEY,
    "productSizeId" integer NOT NULL,
    "productColorId" integer NOT NULL,
    "productId" integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    "priceDiscount" numeric,
    sold integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."productInventories" OWNER TO admin;

--
-- Name: productInventories_productInventoryId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productInventories_productInventoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productInventories_productInventoryId_seq" OWNER TO admin;

--
-- Name: productInventories_productInventoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productInventories_productInventoryId_seq" OWNED BY public."productInventories"."productInventoryId";


--
-- Name: productSizes; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."productSizes" (
    "productSizeId" integer NOT NULL PRIMARY KEY,
    name character varying(255) NOT NULL
);


ALTER TABLE public."productSizes" OWNER TO admin;

--
-- Name: productSizes_productSizeId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."productSizes_productSizeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."productSizes_productSizeId_seq" OWNER TO admin;

--
-- Name: productSizes_productSizeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."productSizes_productSizeId_seq" OWNED BY public."productSizes"."productSizeId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.products (
    "productId" integer NOT NULL PRIMARY KEY,
    quantity integer NOT NULL,
    sold integer DEFAULT 0 NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.products OWNER TO admin;

--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."products_productId_seq" OWNER TO admin;

--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: roles; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.roles (
    "roleId" integer NOT NULL PRIMARY KEY,
    name character varying(45) NOT NULL
);


ALTER TABLE public.roles OWNER TO admin;

--
-- Name: roles_roleId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."roles_roleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."roles_roleId_seq" OWNER TO admin;

--
-- Name: roles_roleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."roles_roleId_seq" OWNED BY public.roles."roleId";


--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    "userId" integer NOT NULL PRIMARY KEY,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "roleId" integer DEFAULT 3 NOT NULL,
    image character varying(255),
    status boolean DEFAULT true NOT NULL,
    address character varying(255)
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_userId_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."users_userId_seq" OWNER TO admin;

--
-- Name: users_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: categories categoryId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories ALTER COLUMN "categoryId" SET DEFAULT nextval('public."categories_categoryId_seq"'::regclass);


--
-- Name: notifications notificationId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.notifications ALTER COLUMN "notificationId" SET DEFAULT nextval('public."notifications_notificationId_seq"'::regclass);


--
-- Name: orderItems orderItemId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems" ALTER COLUMN "orderItemId" SET DEFAULT nextval('public."orderItems_orderItemId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: productCategories productCategoryId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productCategories" ALTER COLUMN "productCategoryId" SET DEFAULT nextval('public."productCategories_productCategoryId_seq"'::regclass);


--
-- Name: productColors productColorId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productColors" ALTER COLUMN "productColorId" SET DEFAULT nextval('public."productColors_productColorId_seq"'::regclass);


--
-- Name: productGeneralImages productGeneralImageId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productGeneralImages" ALTER COLUMN "productGeneralImageId" SET DEFAULT nextval('public."productGeneralImages_productGeneralImageId_seq"'::regclass);


--
-- Name: productImages productImageId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productImages" ALTER COLUMN "productImageId" SET DEFAULT nextval('public."productImages_productImageId_seq"'::regclass);


--
-- Name: productInventories productInventoryId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productInventories" ALTER COLUMN "productInventoryId" SET DEFAULT nextval('public."productInventories_productInventoryId_seq"'::regclass);


--
-- Name: productSizes productSizeId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productSizes" ALTER COLUMN "productSizeId" SET DEFAULT nextval('public."productSizes_productSizeId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Name: roles roleId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles ALTER COLUMN "roleId" SET DEFAULT nextval('public."roles_roleId_seq"'::regclass);


--
-- Name: users userId; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);



--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.carts ("cartId", "userId", "productId", quantity, "productColorId", "productSizeId") FROM stdin;
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.categories ("categoryId", name, image) FROM stdin;
13	Armchair	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1711439465/category/aq26zxa1p1xj3zftfv0u.png
14	Table	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1712235551/category/table.png
15	Chair	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1712235530/category/chair.png
16	Bed	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333368/category/bed_j5o5cr.png
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.notifications ("notificationId", "userId", "orderId", title, message, read, "notificationDate") FROM stdin;
\.


--
-- Data for Name: orderItems; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."orderItems" ("orderItemId", "orderId", "productId", "productColorId", "productSizeId", quantity, price) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.orders ("orderId", "userId", "orderDate", "orderStatus", address, province, district, ward, phone, quantity, total, "firstName", "lastName") FROM stdin;
\.


--
-- Data for Name: productCategories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productCategories" ("productCategoryId", "productId", "categoryId") FROM stdin;
25	25	13
26	26	13
27	27	14
28	28	14
29	29	15
30	30	15
31	31	16
32	32	16
33	33	16
34	34	16
35	35	16
36	36	16
37	37	16
38	38	16
39	39	16
40	40	16
41	41	16
42	42	16
43	43	16
44	44	16
45	45	16
46	46	16
47	47	16
48	48	16
49	49	16
50	50	16
51	51	16
52	52	16
53	53	16
54	56	16
\.


--
-- Data for Name: productColors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productColors" ("productColorId", name, hex) FROM stdin;
21	Red	#FF0000
22	Green	#008000
23	Blue	#0000FF
24	Yellow	#FFFF00
25	Black	#000000
26	White	#FFFFFF
27	Orange	#FFA500
28	Purple	#800080
29	Pink	#FFC0CB
30	Brown	#A52A2A
31	Gray	#808080
32	Cyan	#00FFFF
33	Magenta	#FF00FF
34	Lime	#00FF00
35	Teal	#008080
36	Indigo	#4B0082
37	Violet	#EE82EE
38	Maroon	#800000
39	Aquamarine	#7FFFD4
40	Coral	#FF7F50
\.


--
-- Data for Name: productGeneralImages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productGeneralImages" ("productGeneralImageId", image, "productId") FROM stdin;
50	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-djuparp-dark-blue__1127755_pe876320_s5_n43yyp.jpg	25
51	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/uppland-armchair-blekinge-white__0818462_pe774422_s5_qazaqa.jpg	25
52	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-skiftebo-yellow__0837297_pe601176_s5_u0uozj.jpg	25
53	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-skiftebo-yellow__0837297_pe601176_s5_u0uozj.jpg	26
54	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/oskarshamn-wing-chair-with-ottoman-tonerud-red__1123980_pe874950_s5_nrmojg.jpg	26
55	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/uppland-armchair-remmarn-light-gray__0818472_pe774429_s5_puylcc.jpg	26
56	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333148/Table/73e7b5bacf940523692bffe1223369fb_wsdrlu.jpg	27
57	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/docksta-table-white-white__1067641_ph182537_s5_mtnoun.jpg	27
58	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/ingo-table-pine__1054555_ph159464_s5_dxq04u.jpg	27
59	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/jokkmokk-table-and-4-chairs-antique-stain__0870916_pe716638_s5_oq3kmg.jpg	28
60	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/skogsta-dining-table-acacia__1015064_ph176248_s5_q6qgnc.jpg	28
61	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333146/Table/vangsta-extendable-table-white__1028697_pe835494_s5_ulv1qw.jpg	28
62	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333167/Chair/flinshult-armchair-beige__1010601_pe828157_s5_bwc7qe.jpg	29
63	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333166/Chair/flinshult-armchair-gunnared-dark-gray__0980377_pe814921_s5_gg13np.jpg	29
64	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333166/Chair/kivik-1-seat-sleeper-sofa-gunnared-blue__1165825_pe890983_s5_oocxnp.jpg	29
65	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333165/Chair/kivik-1-seat-sleeper-sofa-gunnared-light-brown-pink__1165811_pe890963_s5_uhoe4y.jpg	30
66	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333165/Chair/linnebaeck-chair-orrsta-olive-green__0940727_pe795130_s5_usw6nw.jpg	30
67	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333164/Chair/sakarias-armchair-black-sporda-dark-gray__0729767_pe737131_s5_pqcvmq.jpg	30
68	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	31
69	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	31
70	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	31
71	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	32
72	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	32
73	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	32
74	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	33
75	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	33
76	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	33
77	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	34
78	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	34
79	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	34
80	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	35
81	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	35
82	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	35
83	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	36
84	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	36
85	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	36
86	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	37
87	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	37
88	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	37
89	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	38
90	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	38
91	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	38
92	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	39
93	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	39
94	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	39
95	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	40
96	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	40
97	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	40
98	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	41
99	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	41
100	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	41
101	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	42
102	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	42
103	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	42
104	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	43
105	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	43
106	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	43
107	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	44
108	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	44
109	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	44
110	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	45
111	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	45
112	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	45
113	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	46
114	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	46
115	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	46
116	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	47
117	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	47
118	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	47
119	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	48
120	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	48
121	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	48
122	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	49
123	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	49
124	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	49
125	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	50
126	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	50
127	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	50
128	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	51
129	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	51
130	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	51
131	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	52
132	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	52
133	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	52
134	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	53
135	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	53
136	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	53
137	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	56
138	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	56
139	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	56
\.


--
-- Data for Name: productImages; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productImages" ("productImageId", image, "productId", "productColorId") FROM stdin;
50	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-djuparp-dark-blue__1127755_pe876320_s5_n43yyp.jpg	25	31
51	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/uppland-armchair-blekinge-white__0818462_pe774422_s5_qazaqa.jpg	25	34
52	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-skiftebo-yellow__0837297_pe601176_s5_u0uozj.jpg	25	28
53	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/uppland-armchair-remmarn-light-gray__0818472_pe774429_s5_puylcc.jpg	26	31
54	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/oskarshamn-wing-chair-with-ottoman-tonerud-red__1123980_pe874950_s5_nrmojg.jpg	26	34
55	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333051/Armchair/strandmon-wing-chair-skiftebo-yellow__0837297_pe601176_s5_u0uozj.jpg	26	28
56	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333148/Table/73e7b5bacf940523692bffe1223369fb_wsdrlu.jpg	27	31
57	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/docksta-table-white-white__1067641_ph182537_s5_mtnoun.jpg	27	34
58	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/ingo-table-pine__1054555_ph159464_s5_dxq04u.jpg	27	28
59	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/jokkmokk-table-and-4-chairs-antique-stain__0870916_pe716638_s5_oq3kmg.jpg	28	31
60	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333147/Table/skogsta-dining-table-acacia__1015064_ph176248_s5_q6qgnc.jpg	28	34
61	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333146/Table/vangsta-extendable-table-white__1028697_pe835494_s5_ulv1qw.jpg	28	28
62	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333167/Chair/flinshult-armchair-beige__1010601_pe828157_s5_bwc7qe.jpg	29	31
63	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333166/Chair/flinshult-armchair-gunnared-dark-gray__0980377_pe814921_s5_gg13np.jpg	29	34
64	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333166/Chair/kivik-1-seat-sleeper-sofa-gunnared-blue__1165825_pe890983_s5_oocxnp.jpg	29	28
65	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333165/Chair/kivik-1-seat-sleeper-sofa-gunnared-light-brown-pink__1165811_pe890963_s5_uhoe4y.jpg	30	31
66	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333165/Chair/linnebaeck-chair-orrsta-olive-green__0940727_pe795130_s5_usw6nw.jpg	30	34
67	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333164/Chair/sakarias-armchair-black-sporda-dark-gray__0729767_pe737131_s5_pqcvmq.jpg	30	28
68	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	31	31
69	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	31	34
70	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	31	28
71	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	32	31
72	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	32	34
73	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	32	28
74	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	33	31
75	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	33	34
76	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	33	28
77	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	34	31
78	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	34	34
79	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	34	28
80	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	35	31
81	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	35	34
82	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	35	28
83	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	36	31
84	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	36	34
85	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	36	28
86	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	37	31
87	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	37	34
88	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	37	28
89	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	38	31
90	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	38	34
91	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	38	28
92	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	39	31
93	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	39	34
94	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	39	28
95	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	40	31
96	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	40	34
97	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	40	28
98	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	41	31
99	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	41	34
100	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	41	28
101	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/songesand-bed-frame-white-luroey__0800861_ph162919_s5_kj27km.jpg	42	31
102	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333181/Bed/slattum-upholstered-bed-frame-knisa-light-gray__1101373_pe866633_s5_hmgeff.jpg	42	34
103	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333180/Bed/tufjord-upholstered-bed-frame-djuparp-dark-green__1101321_pe866585_s5_wbqcxi.jpg	42	28
104	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	43	31
105	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	43	34
106	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	43	28
107	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	44	31
108	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	44	34
109	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	44	28
110	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	45	31
111	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	45	34
112	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	45	28
113	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	46	31
114	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	46	34
115	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	46	28
116	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	47	31
117	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	47	34
118	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	47	28
119	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	48	31
120	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	48	34
121	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	48	28
122	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	49	31
123	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	49	34
124	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	49	28
125	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	50	31
126	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	50	34
127	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	50	28
128	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	51	31
129	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	51	34
130	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	51	28
131	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	52	31
132	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	52	34
133	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	52	28
134	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	53	31
135	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	53	34
136	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	53	28
137	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/kleppstad-bed-frame-white-vissle-beige__1035341_pe840528_s5_qc4w1c.jpg	56	31
138	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5_sglmkn.jpg	56	34
139	https://res.cloudinary.com/dpjmvy4ij/image/upload/v1715333182/Bed/sagstua-bed-frame-black-luroey__0800859_ph163664_s5_xfnnhj.jpg	56	28
\.


--
-- Data for Name: productInventories; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productInventories" ("productInventoryId", "productSizeId", "productColorId", "productId", quantity, price, "priceDiscount", sold) FROM stdin;
61	9	31	25	100	350	\N	0
74	8	34	27	100	200	\N	0
75	9	31	27	100	350	\N	0
78	9	28	27	100	400	\N	0
84	8	28	28	100	350	\N	0
86	7	31	29	100	250	\N	0
87	7	34	29	100	300	\N	0
88	8	34	29	100	200	\N	0
89	9	31	29	100	350	\N	0
91	8	28	29	100	350	\N	0
92	9	28	29	100	400	\N	0
93	7	31	30	100	250	\N	0
94	7	34	30	100	300	\N	0
95	8	34	30	100	200	\N	0
96	9	31	30	100	350	\N	0
99	9	28	30	100	400	\N	0
100	7	31	31	100	250	\N	0
101	7	34	31	100	300	\N	0
102	8	34	31	100	200	\N	0
104	7	28	31	100	450	\N	0
105	8	28	31	100	350	\N	0
106	9	28	31	100	400	\N	0
108	7	34	32	100	300	\N	0
109	8	34	32	100	200	\N	0
110	9	31	32	100	350	\N	0
111	7	28	32	100	450	\N	0
112	8	28	32	100	350	\N	0
113	9	28	32	100	400	\N	0
114	7	31	33	100	250	\N	0
115	7	34	33	100	300	\N	0
116	8	34	33	100	200	\N	0
117	9	31	33	100	350	\N	0
118	7	28	33	100	450	\N	0
119	8	28	33	100	350	\N	0
120	9	28	33	100	400	\N	0
121	7	31	34	100	250	\N	0
122	7	34	34	100	300	\N	0
123	8	34	34	100	200	\N	0
124	9	31	34	100	350	\N	0
125	7	28	34	100	450	\N	0
126	8	28	34	100	350	\N	0
127	9	28	34	100	400	\N	0
128	7	31	35	100	250	\N	0
129	7	34	35	100	300	\N	0
130	8	34	35	100	200	\N	0
131	9	31	35	100	350	\N	0
132	7	28	35	100	450	\N	0
133	8	28	35	100	350	\N	0
134	9	28	35	100	400	\N	0
135	7	31	36	100	250	\N	0
136	7	34	36	100	300	\N	0
137	8	34	36	100	200	\N	0
138	9	31	36	100	350	\N	0
139	7	28	36	100	450	\N	0
140	8	28	36	100	350	\N	0
141	9	28	36	100	400	\N	0
142	7	31	37	100	250	\N	0
143	7	34	37	100	300	\N	0
144	8	34	37	100	200	\N	0
145	9	31	37	100	350	\N	0
146	7	28	37	100	450	\N	0
147	8	28	37	100	350	\N	0
148	9	28	37	100	400	\N	0
149	7	31	38	100	250	\N	0
150	7	34	38	100	300	\N	0
151	8	34	38	100	200	\N	0
152	9	31	38	100	350	\N	0
153	7	28	38	100	450	\N	0
154	8	28	38	100	350	\N	0
155	9	28	38	100	400	\N	0
156	7	31	39	100	250	\N	0
157	7	34	39	100	300	\N	0
158	8	34	39	100	200	\N	0
159	9	31	39	100	350	\N	0
160	7	28	39	100	450	\N	0
161	8	28	39	100	350	\N	0
162	9	28	39	100	400	\N	0
163	7	31	40	100	250	\N	0
164	7	34	40	100	300	\N	0
165	8	34	40	100	200	\N	0
166	9	31	40	100	350	\N	0
167	7	28	40	100	450	\N	0
168	8	28	40	100	350	\N	0
169	9	28	40	100	400	\N	0
170	7	31	41	100	250	\N	0
171	7	34	41	100	300	\N	0
172	8	34	41	100	200	\N	0
173	9	31	41	100	350	\N	0
174	7	28	41	100	450	\N	0
175	8	28	41	100	350	\N	0
176	9	28	41	100	400	\N	0
177	7	31	42	100	250	\N	0
178	7	34	42	100	300	\N	0
179	8	34	42	100	200	\N	0
180	9	31	42	100	350	\N	0
181	7	28	42	100	450	\N	0
182	8	28	42	100	350	\N	0
183	9	28	42	100	400	\N	0
184	7	31	43	100	250	\N	0
185	7	34	43	100	300	\N	0
186	8	34	43	100	200	\N	0
68	9	31	26	95	350	\N	5
90	7	28	29	97	450	\N	3
103	9	31	31	99	350	\N	1
97	7	28	30	92	450	\N	8
65	7	31	26	100	250	\N	0
80	7	34	28	84	300	\N	16
72	7	31	27	98	250	\N	2
79	7	31	28	99	250	\N	1
81	8	34	28	95	200	\N	5
64	9	28	25	99	400	\N	1
70	8	28	26	98	350	\N	2
73	7	34	27	97	300	\N	3
83	7	28	28	95	450	\N	5
67	8	34	26	99	200	\N	1
66	7	34	26	99	300	\N	1
82	9	31	28	91	350	\N	9
107	7	31	32	99	250	\N	1
63	8	28	25	98	350	\N	2
85	9	28	28	80	400	\N	20
98	8	28	30	97	350	\N	3
77	8	28	27	98	350	\N	2
58	7	31	25	92	250	\N	8
71	9	28	26	99	400	\N	1
187	9	31	43	100	350	\N	0
188	7	28	43	100	450	\N	0
189	8	28	43	100	350	\N	0
190	9	28	43	100	400	\N	0
191	7	31	44	100	250	\N	0
192	7	34	44	100	300	\N	0
193	8	34	44	100	200	\N	0
194	9	31	44	100	350	\N	0
195	7	28	44	100	450	\N	0
196	8	28	44	100	350	\N	0
197	9	28	44	100	400	\N	0
198	7	31	45	100	250	\N	0
199	7	34	45	100	300	\N	0
200	8	34	45	100	200	\N	0
201	9	31	45	100	350	\N	0
202	7	28	45	100	450	\N	0
203	8	28	45	100	350	\N	0
204	9	28	45	100	400	\N	0
205	7	31	46	100	250	\N	0
206	7	34	46	100	300	\N	0
207	8	34	46	100	200	\N	0
208	9	31	46	100	350	\N	0
209	7	28	46	100	450	\N	0
210	8	28	46	100	350	\N	0
211	9	28	46	100	400	\N	0
212	7	31	47	100	250	\N	0
213	7	34	47	100	300	\N	0
214	8	34	47	100	200	\N	0
215	9	31	47	100	350	\N	0
216	7	28	47	100	450	\N	0
217	8	28	47	100	350	\N	0
218	9	28	47	100	400	\N	0
219	7	31	48	100	250	\N	0
220	7	34	48	100	300	\N	0
221	8	34	48	100	200	\N	0
222	9	31	48	100	350	\N	0
223	7	28	48	100	450	\N	0
224	8	28	48	100	350	\N	0
225	9	28	48	100	400	\N	0
226	7	31	49	100	250	\N	0
227	7	34	49	100	300	\N	0
228	8	34	49	100	200	\N	0
229	9	31	49	100	350	\N	0
230	7	28	49	100	450	\N	0
231	8	28	49	100	350	\N	0
232	9	28	49	100	400	\N	0
233	7	31	50	100	250	\N	0
234	7	34	50	100	300	\N	0
235	8	34	50	100	200	\N	0
236	9	31	50	100	350	\N	0
237	7	28	50	100	450	\N	0
238	8	28	50	100	350	\N	0
239	9	28	50	100	400	\N	0
240	7	31	51	100	250	\N	0
241	7	34	51	100	300	\N	0
242	8	34	51	100	200	\N	0
243	9	31	51	100	350	\N	0
244	7	28	51	100	450	\N	0
245	8	28	51	100	350	\N	0
246	9	28	51	100	400	\N	0
247	7	31	52	100	250	\N	0
248	7	34	52	100	300	\N	0
249	8	34	52	100	200	\N	0
250	9	31	52	100	350	\N	0
251	7	28	52	100	450	\N	0
252	8	28	52	100	350	\N	0
253	9	28	52	100	400	\N	0
254	7	31	53	100	250	\N	0
255	7	34	53	100	300	\N	0
256	8	34	53	100	200	\N	0
257	9	31	53	100	350	\N	0
258	7	28	53	100	450	\N	0
259	8	28	53	100	350	\N	0
260	9	28	53	100	400	\N	0
263	7	31	56	100	250	\N	0
264	7	34	56	100	300	\N	0
265	8	34	56	100	200	\N	0
266	9	31	56	100	350	\N	0
267	7	28	56	100	450	\N	0
268	8	28	56	100	350	\N	0
269	9	28	56	100	400	\N	0
76	7	28	27	97	450	\N	3
59	7	34	25	58	300	\N	42
60	8	34	25	96	200	\N	4
62	7	28	25	81	450	\N	19
69	7	28	26	77	450	\N	23
\.


--
-- Data for Name: productSizes; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public."productSizes" ("productSizeId", name) FROM stdin;
6	S
7	M
8	L
9	XL
10	XXL
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.products ("productId", quantity, sold, name, description, "createdAt", "updatedAt") FROM stdin;
25	700	0	UPPLAND	You know the feeling when you sit, kick back or hang out in an armchair, rather than on it. That’s how embracing this deep, generous armchair is, your new favorite place for cozy evenings and lazy days!	2024-05-10 09:46:08.982+00	2024-05-10 09:46:08.982+00
26	700	0	MORABO	Warm and welcoming, neat and stylish. The supporting seat cushions, the cover’s soft finish and the tight fit gives this sofa a perfect balance between its comfort, functions and look.	2024-05-10 09:47:40.397+00	2024-05-10 09:47:40.397+00
27	700	0	SANDSBERG	This table for 4 blends a warm wood expression with sturdy metal in a slim design that’s pleasing to the eye even in smaller spaces. Pair it with SANDSBERG chair to create a welcoming and coordinated look.	2024-05-10 09:49:19.094+00	2024-05-10 09:49:19.094+00
28	700	0	VANGSTA	Extendable dining table with 1 extra leaf seats 2-4; makes it possible to adjust the table size according to need.	2024-05-10 09:51:13.328+00	2024-05-10 09:51:13.328+00
29	700	0	TEODORES	A comfy chair that’s sturdy, yet lightweight and stackable too. An easy match with different tables and styles and eager to please, whether it’s in the dining room, in the entrance or by your bed.	2024-05-10 09:52:39.63+00	2024-05-10 09:52:39.63+00
30	700	0	SAKARIAS	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:53:39.387+00	2024-05-10 09:53:39.387+00
31	700	0	TUFJORD	TUFJORD will make you long for bedtime. The headboard’s embracing curves help you to unwind, and make lazy mornings spent in bed even cozier. The soft velvet with a beautiful luster adds a luxurious feel.	2024-05-10 09:55:11.602+00	2024-05-10 09:55:11.602+00
32	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:12.653+00	2024-05-10 09:56:12.653+00
33	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:39.091+00	2024-05-10 09:56:39.091+00
34	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:44.305+00	2024-05-10 09:56:44.305+00
35	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:47.508+00	2024-05-10 09:56:47.508+00
36	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:50.732+00	2024-05-10 09:56:50.732+00
37	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:54.388+00	2024-05-10 09:56:54.388+00
38	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:56:57.452+00	2024-05-10 09:56:57.452+00
39	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:57:00.961+00	2024-05-10 09:57:00.961+00
40	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:57:03.969+00	2024-05-10 09:57:03.969+00
41	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:57:07.138+00	2024-05-10 09:57:07.138+00
42	700	0	SONGESAND	A sturdy bed frame with soft, profile edges and high legs. A classic shape that will last for many years. Add SONGESAND bed underbed storage boxes to store extra bedding without taking up more space.	2024-05-10 09:57:09.926+00	2024-05-10 09:57:09.926+00
43	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:24.371+00	2024-05-10 09:57:24.371+00
44	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:27.506+00	2024-05-10 09:57:27.506+00
45	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:30.54+00	2024-05-10 09:57:30.54+00
46	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:33.64+00	2024-05-10 09:57:33.64+00
47	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:36.68+00	2024-05-10 09:57:36.68+00
48	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:39.908+00	2024-05-10 09:57:39.908+00
49	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:42.944+00	2024-05-10 09:57:42.944+00
50	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:45.892+00	2024-05-10 09:57:45.892+00
51	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:48.868+00	2024-05-10 09:57:48.868+00
52	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:51.868+00	2024-05-10 09:57:51.868+00
53	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-10 09:57:54.857+00	2024-05-10 09:57:54.857+00
56	700	0	TUFJORD	You can easily change look and style of both your chair and room whenever you feel like with this extra cover for SAKARIAS upholstered chair with armrests.	2024-05-17 09:36:25.665+00	2024-05-17 09:36:25.665+00
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.roles ("roleId", name) FROM stdin;
0	superAdmin
1	admin
2	shipper
3	user
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users ("userId", name, phone, email, password, "roleId", image, status, address) FROM stdin;
0	admin	0123456789	admin@gmail.com	$2b$10$1Ao.lHtiLOHK96.4Qev/2uNpRIAdQN76wZNL19BcRf/P9m7TFyidS	0	\N	t	\N
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 1, false);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 9, true);


--
-- Name: categories_categoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."categories_categoryId_seq"', 16, true);


--
-- Name: colors_colorId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."colors_colorId_seq"', 1, false);


--
-- Name: notifications_notificationId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."notifications_notificationId_seq"', 23, true);


--
-- Name: orderItems_orderItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."orderItems_orderItemId_seq"', 6, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 6, true);


--
-- Name: productCategories_productCategoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productCategories_productCategoryId_seq"', 66, true);


--
-- Name: productColors_productColorId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productColors_productColorId_seq"', 40, true);


--
-- Name: productGeneralImages_productGeneralImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productGeneralImages_productGeneralImageId_seq"', 156, true);


--
-- Name: productImages_productImageId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productImages_productImageId_seq"', 151, true);


--
-- Name: productInventories_productInventoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productInventories_productInventoryId_seq"', 291, true);


--
-- Name: productSizes_productSizeId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."productSizes_productSizeId_seq"', 10, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."products_productId_seq"', 65, true);


--
-- Name: roles_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."roles_roleId_seq"', 1, false);


--
-- Name: users_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."users_userId_seq"', 3, true);



--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY ("categoryId");


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY ("notificationId");


--
-- Name: orderItems orderItems_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems"
    ADD CONSTRAINT "orderItems_pkey" PRIMARY KEY ("orderItemId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: productCategories productCategories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productCategories"
    ADD CONSTRAINT "productCategories_pkey" PRIMARY KEY ("productCategoryId");


--
-- Name: productColors productColors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productColors"
    ADD CONSTRAINT "productColors_pkey" PRIMARY KEY ("productColorId");


--
-- Name: productGeneralImages productGeneralImages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productGeneralImages"
    ADD CONSTRAINT "productGeneralImages_pkey" PRIMARY KEY ("productGeneralImageId");


--
-- Name: productImages productImages_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productImages"
    ADD CONSTRAINT "productImages_pkey" PRIMARY KEY ("productImageId");


--
-- Name: productInventories productInventories_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productInventories"
    ADD CONSTRAINT "productInventories_pkey" PRIMARY KEY ("productInventoryId");


--
-- Name: productSizes productSizes_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productSizes"
    ADD CONSTRAINT "productSizes_pkey" PRIMARY KEY ("productSizeId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY ("roleId");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");


--
-- Name: carts carts_productColorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_productColorId_fkey" FOREIGN KEY ("productColorId") REFERENCES public."productColors"("productColorId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: carts carts_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: carts carts_productSizeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_productSizeId_fkey" FOREIGN KEY ("productSizeId") REFERENCES public."productSizes"("productSizeId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: carts carts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT "carts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE;


--
-- Name: notifications notifications_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "notifications_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders("orderId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notifications notifications_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT "notifications_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderItems orderItems_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems"
    ADD CONSTRAINT "orderItems_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders("orderId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orderItems orderItems_productColorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems"
    ADD CONSTRAINT "orderItems_productColorId_fkey" FOREIGN KEY ("productColorId") REFERENCES public."productColors"("productColorId") ON UPDATE CASCADE;


--
-- Name: orderItems orderItems_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems"
    ADD CONSTRAINT "orderItems_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE;


--
-- Name: orderItems orderItems_productSizeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."orderItems"
    ADD CONSTRAINT "orderItems_productSizeId_fkey" FOREIGN KEY ("productSizeId") REFERENCES public."productSizes"("productSizeId") ON UPDATE CASCADE;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productCategories productCategories_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productCategories"
    ADD CONSTRAINT "productCategories_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories("categoryId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productCategories productCategories_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productCategories"
    ADD CONSTRAINT "productCategories_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productGeneralImages productGeneralImages_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productGeneralImages"
    ADD CONSTRAINT "productGeneralImages_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productImages productImages_productColorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productImages"
    ADD CONSTRAINT "productImages_productColorId_fkey" FOREIGN KEY ("productColorId") REFERENCES public."productColors"("productColorId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productImages productImages_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productImages"
    ADD CONSTRAINT "productImages_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productInventories productInventories_productColorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productInventories"
    ADD CONSTRAINT "productInventories_productColorId_fkey" FOREIGN KEY ("productColorId") REFERENCES public."productColors"("productColorId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productInventories productInventories_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productInventories"
    ADD CONSTRAINT "productInventories_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products("productId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: productInventories productInventories_productSizeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."productInventories"
    ADD CONSTRAINT "productInventories_productSizeId_fkey" FOREIGN KEY ("productSizeId") REFERENCES public."productSizes"("productSizeId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users users_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public.roles("roleId") ON UPDATE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: admin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

