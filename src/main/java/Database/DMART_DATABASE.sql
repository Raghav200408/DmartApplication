--
-- PostgreSQL database dump
--

\restrict i4ZimXifCSPlPEVbMBY4xQv1L2nVi2VoDWUWtFhqvvjbANrKkPDPD3pRmlRTmaB

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-27 12:45:13

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 17027)
-- Name: bill_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_items (
    bill_item_id integer NOT NULL,
    bill_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    gst numeric(5,2) NOT NULL,
    total numeric(10,2)
);


ALTER TABLE public.bill_items OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17026)
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_items_bill_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bill_items_bill_item_id_seq OWNER TO postgres;

--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 228
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_items_bill_item_id_seq OWNED BY public.bill_items.bill_item_id;


--
-- TOC entry 227 (class 1259 OID 17010)
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bills (
    bill_id integer NOT NULL,
    customer_id integer NOT NULL,
    bill_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_amount numeric(10,2) NOT NULL,
    payment_type character varying(20) NOT NULL
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17009)
-- Name: bills_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bills_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bills_bill_id_seq OWNER TO postgres;

--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 226
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_bill_id_seq OWNED BY public.bills.bill_id;


--
-- TOC entry 225 (class 1259 OID 16986)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    added_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16985)
-- Name: cart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_cart_id_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 224
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- TOC entry 219 (class 1259 OID 16951)
-- Name: cashier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cashier (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.cashier OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16959)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    mobile_number character varying(10) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16958)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 223 (class 1259 OID 16971)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(100) NOT NULL,
    category character varying(50),
    price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    manufacturer_name character varying(100),
    manufacture_date date,
    expiry_date date,
    image_path character varying(255),
    created_by integer,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_by integer,
    updated_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16970)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

--
-- TOC entry 5075 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 4888 (class 2604 OID 17030)
-- Name: bill_items bill_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items ALTER COLUMN bill_item_id SET DEFAULT nextval('public.bill_items_bill_item_id_seq'::regclass);


--
-- TOC entry 4886 (class 2604 OID 17013)
-- Name: bills bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN bill_id SET DEFAULT nextval('public.bills_bill_id_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 16989)
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 16962)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4881 (class 2604 OID 16974)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 5065 (class 0 OID 17027)
-- Dependencies: 229
-- Data for Name: bill_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_items (bill_item_id, bill_id, product_id, quantity, price, gst, total) FROM stdin;
1	3	1	5	10.00	5.00	50.00
2	5	1	5	10.00	5.00	50.00
3	2	1	5	10.00	5.00	50.00
4	1	1	5	10.00	5.00	50.00
5	6	1	5	10.00	5.00	50.00
6	4	1	5	10.00	5.00	50.00
7	7	1	1	10.00	5.00	10.00
8	8	1	1	10.00	5.00	10.00
9	9	1	1	10.00	5.00	10.00
10	12	1	1	10.00	5.00	10.00
11	14	1	6	10.00	5.00	60.00
12	15	1	10	10.00	5.00	100.00
13	16	2	3	30.00	5.00	90.00
14	16	1	1	10.00	5.00	10.00
\.


--
-- TOC entry 5063 (class 0 OID 17010)
-- Dependencies: 227
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (bill_id, customer_id, bill_date, total_amount, payment_type) FROM stdin;
2	1	2026-06-26 21:19:08.068988	50.00	UPI
1	1	2026-06-26 21:19:08.04707	50.00	UPI
3	1	2026-06-26 21:19:08.091243	50.00	UPI
4	1	2026-06-26 21:19:08.190312	50.00	UPI
6	1	2026-06-26 21:19:08.20456	50.00	UPI
5	1	2026-06-26 21:19:08.193821	50.00	UPI
7	1	2026-06-26 21:21:18.160005	10.00	Cash
8	2	2026-06-26 21:22:04.872151	10.00	Cash
9	3	2026-06-26 21:35:18.4305	10.00	Cash
10	3	2026-06-26 21:36:59.563572	0.00	Cash
11	3	2026-06-26 21:41:21.497665	0.00	Cash
12	4	2026-06-26 21:43:10.432158	10.00	Cash
13	4	2026-06-26 21:45:09.550199	0.00	Cash
14	1	2026-06-26 22:53:47.462042	60.00	Cash
15	1	2026-06-26 23:12:21.739741	100.00	UPI
16	1	2026-06-27 11:51:25.398573	100.00	Cash
\.


--
-- TOC entry 5061 (class 0 OID 16986)
-- Dependencies: 225
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cart_id, customer_id, product_id, quantity, price, total, added_date) FROM stdin;
6	3	1	3	10.00	30.00	2026-06-26 22:41:22.273276
\.


--
-- TOC entry 5055 (class 0 OID 16951)
-- Dependencies: 219
-- Data for Name: cashier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cashier (username, password) FROM stdin;
cashier1	1234
ragha	1234
charan	1234
\.


--
-- TOC entry 5057 (class 0 OID 16959)
-- Dependencies: 221
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, mobile_number) FROM stdin;
1	charan	987654321
2	ragha	123456789
3	shiva	9876789876
4	siddharth	567856782
\.


--
-- TOC entry 5059 (class 0 OID 16971)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, category, price, quantity, manufacturer_name, manufacture_date, expiry_date, image_path, created_by, created_date, updated_by, updated_date) FROM stdin;
1	Water Bottle	Grocery 	10.00	0	TATA	2026-06-20	2026-06-28	b17d1a05-4d23-4810-bfb1-863083495fe4_tataWaterBottle.png	1	2026-06-26 16:56:50.688447	1	2026-06-27 11:02:47.387692
2	Bread	Grocery	30.00	97	TATA	2026-06-20	2026-06-30	597487e1-db11-4a8b-8af1-473731486f77_IMG_4692.jpg	2	2026-06-27 11:40:47.937412	2	2026-06-27 12:10:28.043641
\.


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 228
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_items_bill_item_id_seq', 14, true);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 226
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_bill_id_seq', 16, true);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 224
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 10, true);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 2, true);


--
-- TOC entry 4902 (class 2606 OID 17038)
-- Name: bill_items bill_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT bill_items_pkey PRIMARY KEY (bill_item_id);


--
-- TOC entry 4900 (class 2606 OID 17020)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 4898 (class 2606 OID 16998)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- TOC entry 4890 (class 2606 OID 16957)
-- Name: cashier cashier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_pkey PRIMARY KEY (username);


--
-- TOC entry 4892 (class 2606 OID 16969)
-- Name: customers customers_mobile_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_mobile_number_key UNIQUE (mobile_number);


--
-- TOC entry 4894 (class 2606 OID 16967)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4896 (class 2606 OID 16984)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4906 (class 2606 OID 17039)
-- Name: bill_items fk_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_bill FOREIGN KEY (bill_id) REFERENCES public.bills(bill_id);


--
-- TOC entry 4903 (class 2606 OID 16999)
-- Name: cart fk_cart_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4904 (class 2606 OID 17004)
-- Name: cart fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 4905 (class 2606 OID 17021)
-- Name: bills fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4907 (class 2606 OID 17044)
-- Name: bill_items fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.product(product_id);


-- Completed on 2026-06-27 12:45:13

--
-- PostgreSQL database dump complete
--

\unrestrict i4ZimXifCSPlPEVbMBY4xQv1L2nVi2VoDWUWtFhqvvjbANrKkPDPD3pRmlRTmaB

