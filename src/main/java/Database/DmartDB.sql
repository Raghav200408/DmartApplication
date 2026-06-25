--
-- PostgreSQL database dump
--

\restrict xaxS0rKhYY1dv6OwM9PYxUajE8KYpBj912i2mE6iqQCvmyLFrf2yuE8ggB0AwEE

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-06-25 11:35:48

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
-- TOC entry 219 (class 1259 OID 24764)
-- Name: bill_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_items (
    bill_item_id integer NOT NULL,
    bill_id integer NOT NULL,
    product_id character varying(20) NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    gst numeric(5,2) NOT NULL
);


ALTER TABLE public.bill_items OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24773)
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
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 220
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_items_bill_item_id_seq OWNED BY public.bill_items.bill_item_id;


--
-- TOC entry 221 (class 1259 OID 24774)
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
-- TOC entry 222 (class 1259 OID 24782)
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
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 222
-- Name: bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bills_bill_id_seq OWNED BY public.bills.bill_id;


--
-- TOC entry 223 (class 1259 OID 24783)
-- Name: cashier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cashier (
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.cashier OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24788)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    customer_name character varying(100) NOT NULL,
    mobile_number character varying(10) NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24794)
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
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 225
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 228 (class 1259 OID 24834)
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
-- TOC entry 227 (class 1259 OID 24833)
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
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 226 (class 1259 OID 24795)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id character varying(20) NOT NULL,
    product_name character varying(100) NOT NULL,
    category character varying(50),
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    gst numeric(5,2) NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 4879 (class 2604 OID 24803)
-- Name: bill_items bill_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items ALTER COLUMN bill_item_id SET DEFAULT nextval('public.bill_items_bill_item_id_seq'::regclass);


--
-- TOC entry 4880 (class 2604 OID 24804)
-- Name: bills bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills ALTER COLUMN bill_id SET DEFAULT nextval('public.bills_bill_id_seq'::regclass);


--
-- TOC entry 4882 (class 2604 OID 24805)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4883 (class 2604 OID 24837)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 5050 (class 0 OID 24764)
-- Dependencies: 219
-- Data for Name: bill_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bill_items (bill_item_id, bill_id, product_id, quantity, price, gst) FROM stdin;
\.


--
-- TOC entry 5052 (class 0 OID 24774)
-- Dependencies: 221
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bills (bill_id, customer_id, bill_date, total_amount, payment_type) FROM stdin;
\.


--
-- TOC entry 5054 (class 0 OID 24783)
-- Dependencies: 223
-- Data for Name: cashier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cashier (username, password) FROM stdin;
cashier1	1234
\.


--
-- TOC entry 5055 (class 0 OID 24788)
-- Dependencies: 224
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, customer_name, mobile_number) FROM stdin;
1	Charan	9876543210
\.


--
-- TOC entry 5059 (class 0 OID 24834)
-- Dependencies: 228
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, category, price, quantity, manufacturer_name, manufacture_date, expiry_date, image_path, created_by, created_date, updated_by, updated_date) FROM stdin;
1	Amul Milk	Dairy	30.00	100	Amul	2026-06-25	2026-06-26	1b353fba-cef0-4cec-b832-4e3552ee23be_Amulmilk.webp	1	2026-06-25 01:26:15.560766	1	2026-06-25 01:26:15.560766
\.


--
-- TOC entry 5057 (class 0 OID 24795)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_id, product_name, category, quantity, price, gst) FROM stdin;
P101	Rice	Grocery	100	60.00	5.00
P102	Sugar	Grocery	50	45.00	5.00
P103	Milk	Dairy	30	28.00	5.00
\.


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 220
-- Name: bill_items_bill_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_items_bill_item_id_seq', 1, false);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 222
-- Name: bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bills_bill_id_seq', 1, false);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 225
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, true);


--
-- TOC entry 5072 (class 0 OID 0)
-- Dependencies: 227
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, true);


--
-- TOC entry 4887 (class 2606 OID 24807)
-- Name: bill_items bill_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT bill_items_pkey PRIMARY KEY (bill_item_id);


--
-- TOC entry 4889 (class 2606 OID 24809)
-- Name: bills bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 4891 (class 2606 OID 24811)
-- Name: cashier cashier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cashier
    ADD CONSTRAINT cashier_pkey PRIMARY KEY (username);


--
-- TOC entry 4893 (class 2606 OID 24813)
-- Name: customers customers_mobile_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_mobile_number_key UNIQUE (mobile_number);


--
-- TOC entry 4895 (class 2606 OID 24815)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4899 (class 2606 OID 24847)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4897 (class 2606 OID 24817)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4900 (class 2606 OID 24818)
-- Name: bill_items fk_bill; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_bill FOREIGN KEY (bill_id) REFERENCES public.bills(bill_id);


--
-- TOC entry 4902 (class 2606 OID 24823)
-- Name: bills fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bills
    ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4901 (class 2606 OID 24828)
-- Name: bill_items fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_items
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(product_id);


-- Completed on 2026-06-25 11:35:48

--
-- PostgreSQL database dump complete
--

\unrestrict xaxS0rKhYY1dv6OwM9PYxUajE8KYpBj912i2mE6iqQCvmyLFrf2yuE8ggB0AwEE

