--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-04 00:21:27

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
-- TOC entry 220 (class 1259 OID 16407)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id integer NOT NULL,
    voo_id integer NOT NULL,
    nome_comprador character varying NOT NULL,
    data_nasc date NOT NULL,
    cpf character varying NOT NULL,
    email character varying NOT NULL,
    ida date NOT NULL,
    volta date NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16406)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- TOC entry 218 (class 1259 OID 16389)
-- Name: voos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voos (
    id integer NOT NULL,
    companhia character varying NOT NULL,
    origem character varying NOT NULL,
    destino character varying NOT NULL,
    horario_partida time without time zone NOT NULL,
    horario_chegada time without time zone NOT NULL,
    data_voo date NOT NULL,
    valor real NOT NULL
);


ALTER TABLE public.voos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16388)
-- Name: voos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voos_id_seq OWNER TO postgres;

--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 217
-- Name: voos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voos_id_seq OWNED BY public.voos.id;


--
-- TOC entry 4748 (class 2604 OID 16410)
-- Name: reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16392)
-- Name: voos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos ALTER COLUMN id SET DEFAULT nextval('public.voos_id_seq'::regclass);


--
-- TOC entry 4902 (class 0 OID 16407)
-- Dependencies: 220
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, voo_id, nome_comprador, data_nasc, cpf, email, ida, volta) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 16389)
-- Dependencies: 218
-- Data for Name: voos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voos (id, companhia, origem, destino, horario_partida, horario_chegada, data_voo, valor) FROM stdin;
1	LATAM	Jaguaruana	São Paulo	08:30:00	12:00:00	2025-02-10	750
2	GOL	Jaguaruana	Rio de Janeiro	10:15:00	14:00:00	2025-02-11	820.5
3	Azul	Jaguaruana	Brasília	14:00:00	17:20:00	2025-02-12	690.75
4	LATAM	Jaguaruana	Salvador	16:45:00	18:30:00	2025-02-13	500
5	GOL	Jaguaruana	Recife	07:00:00	08:30:00	2025-02-14	450
6	Azul	Jaguaruana	Manaus	22:10:00	02:30:00	2025-02-15	980.25
7	LATAM	Jaguaruana	Curitiba	11:50:00	15:20:00	2025-02-16	720.4
8	GOL	Jaguaruana	Belo Horizonte	13:30:00	16:45:00	2025-02-17	680
9	Azul	Jaguaruana	Porto Alegre	09:00:00	13:40:00	2025-02-18	890.6
10	LATAM	Jaguaruana	Belém	18:20:00	20:00:00	2025-02-19	480.9
\.


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 1, false);


--
-- TOC entry 4911 (class 0 OID 0)
-- Dependencies: 217
-- Name: voos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voos_id_seq', 10, true);


--
-- TOC entry 4752 (class 2606 OID 16414)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 4750 (class 2606 OID 16396)
-- Name: voos voos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voos
    ADD CONSTRAINT voos_pkey PRIMARY KEY (id);


--
-- TOC entry 4753 (class 2606 OID 16415)
-- Name: reservas reservas_voo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_voo_id_fkey FOREIGN KEY (voo_id) REFERENCES public.voos(id) ON DELETE CASCADE;


-- Completed on 2025-02-04 00:21:28

--
-- PostgreSQL database dump complete
--

