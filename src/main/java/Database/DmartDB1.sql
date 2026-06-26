--
-- PostgreSQL database dump
--

\restrict o0bQ6gRZpKLxhTmBtmM8TGf8ofa0Hb6Tt3y5zdaexWtaGvE0S84pr45yffYHFun

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-06-26 16:24:12

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
-- TOC entry 227 (class 1259 OID 33093)
-- Name: bill_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_items (
    bill_item_id integer NOT NULL,
    bill_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    gst numeric(5,2) NOT NULL
);


ALTER TABLE public.bill_items OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 33092)
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
-- Dependencies: 226
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_items_bill_item_id_seq OWNED BY public.bill_items.bill_item_id;


--
-- TOC entry 225 (class 1259 OID 33076)
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
-- TOC entry 224 (class 1259 OID 33075)
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
-- Dependencies: 224
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_bill_id_seq OWNED BY public.bills.bill_id;


--
-- TOC entry 229 (class 1259 OID 33116)
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
-- TOC entry 228 (class 1259 OID 33115)
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
-- Dependencies: 228
-- Name: cart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;


--
-- TOC entry 219 (class 1259 OID 33041)
-- Name: cashier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cashier (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.cashier OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33049)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    mobile_number character varying(10) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33048)
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
-- TOC entry 223 (class 1259 OID 33061)
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
-- TOC entry 222 (class 1259 OID 33060)
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
-- TOC entry 4886 (class 2604 OID 33096)
-- Name: bill_items bill_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items ALTER COLUMN bill_item_id SET DEFAULT nextval('public.bill_items_bill_item_id_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 33079)
-- Name: bills bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN bill_id SET DEFAULT nextval('public.bills_bill_id_seq'::regclass);


--
-- TOC entry 4887 (class 2604 OID 33119)
-- Name: cart cart_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 33052)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4881 (class 2604 OID 33064)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 5063 (class 0 OID 33093)
-- Dependencies: 227
-- Data for Name: bill_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_items (bill_item_id, bill_id, product_id, quantity, price, gst) FROM stdin;
\.


--
-- TOC entry 5061 (class 0 OID 33076)
-- Dependencies: 225
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (bill_id, customer_id, bill_date, total_amount, payment_type) FROM stdin;
\.


--
-- TOC entry 5065 (class 0 OID 33116)
-- Dependencies: 229
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (cart_id, customer_id, product_id, quantity, price, total, added_date) FROM stdin;
3	5	1	1	30.00	30.00	2026-06-26 14:50:12.388765
4	5	3	1	20.00	20.00	2026-06-26 14:50:26.673183
5	5	5	1	30.00	30.00	2026-06-26 14:50:35.719486
\.


--
-- TOC entry 5055 (class 0 OID 33041)
-- Dependencies: 219
-- Data for Name: cashier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cashier (username, password) FROM stdin;
cashier1	1234
\.


--
-- TOC entry 5057 (class 0 OID 33049)
-- Dependencies: 221
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, mobile_number) FROM stdin;
1	Charan	9876543210
5	raghavender	9876543218
2	shiva kumar	9876543213
\.


--
-- TOC entry 5059 (class 0 OID 33061)
-- Dependencies: 223
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, category, price, quantity, manufacturer_name, manufacture_date, expiry_date, image_path, created_by, created_date, updated_by, updated_date) FROM stdin;
1	Amul Milk	Dairy	30.00	100	Amul	2026-06-25	2026-06-26	1b353fba-cef0-4cec-b832-4e3552ee23be_Amulmilk.webp	1	2026-06-25 01:26:15.560766	1	2026-06-25 01:26:15.560766
3	Water Bottle	Grocery	20.00	100	TATA	2026-06-25	2027-10-13	80179e8c-d31b-41a8-a6de-da47d1f4c060_tataWaterBottle.png	1	2026-06-25 12:47:59.653224	1	2026-06-25 12:47:59.653224
4	Water Bottle	Grocery	10.00	0	TATA	2026-06-11	2026-06-25	5f96a80f-13e4-4094-ba50-c732c444ca2e_tataWaterBottle.png	1	2026-06-25 12:50:15.21357	1	2026-06-25 13:22:40.258521
5	Bread	Grocery	30.00	100	TATA	2026-07-01	2026-06-30	95f5dc29-a31a-4a78-b2cb-03bf059a9a9b_bread.jpg	1	2026-06-26 14:47:02.276032	1	2026-06-26 14:47:20.545461
\.


--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 226
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_items_bill_item_id_seq', 1, false);


--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 224
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_bill_id_seq', 1, false);


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 228
-- Name: cart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_cart_id_seq', 5, true);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 6, true);


--
-- TOC entry 5080 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 5, true);


--
-- TOC entry 4900 (class 2606 OID 33104)
-- Name: bill_items bill_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT bill_items_pkey PRIMARY KEY (bill_item_id);


--
-- TOC entry 4898 (class 2606 OID 33086)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 4902 (class 2606 OID 33128)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);


--
-- TOC entry 4890 (class 2606 OID 33047)
-- Name: cashier cashier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_pkey PRIMARY KEY (username);


--
-- TOC entry 4892 (class 2606 OID 33059)
-- Name: customers customers_mobile_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_mobile_number_key UNIQUE (mobile_number);


--
-- TOC entry 4894 (class 2606 OID 33057)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4896 (class 2606 OID 33074)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4904 (class 2606 OID 33105)
-- Name: bill_items fk_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_bill FOREIGN KEY (bill_id) REFERENCES public.bills(bill_id);


--
-- TOC entry 4906 (class 2606 OID 33129)
-- Name: cart fk_cart_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE CASCADE;


--
-- TOC entry 4907 (class 2606 OID 33134)
-- Name: cart fk_cart_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT fk_cart_product FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE;


--
-- TOC entry 4903 (class 2606 OID 33087)
-- Name: bills fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4905 (class 2606 OID 33110)
-- Name: bill_items fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.product(product_id);


-- Completed on 2026-06-26 16:24:13

--
-- PostgreSQL database dump complete
--

\unrestrict o0bQ6gRZpKLxhTmBtmM8TGf8ofa0Hb6Tt3y5zdaexWtaGvE0S84pr45yffYHFun

