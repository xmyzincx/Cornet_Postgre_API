--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.5

-- Started on 2018-10-09 13:07:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE vttdb;
--
-- TOC entry 2835 (class 1262 OID 16393)
-- Name: vttdb; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE vttdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Finnish_Finland.1252' LC_CTYPE = 'Finnish_Finland.1252';


\connect vttdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16424)
-- Name: lsa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lsa (
);


--
-- TOC entry 197 (class 1259 OID 16418)
-- Name: nodes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nodes (
    id integer NOT NULL,
    "nodeId" character varying(45) NOT NULL,
    "nodeName" character varying(45),
    freq double precision,
    latitude double precision,
    longitude double precision
);


--
-- TOC entry 196 (class 1259 OID 16416)
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nodes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 196
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nodes_id_seq OWNED BY public.nodes.id;


--
-- TOC entry 200 (class 1259 OID 16438)
-- Name: sensing; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sensing (
    id integer NOT NULL,
    sensorid character varying(45) NOT NULL,
    channel integer NOT NULL,
    power double precision DEFAULT '-110'::integer NOT NULL,
    "timestamp" bigint,
    latitude double precision,
    longitude double precision,
    ant_height double precision,
    ant_gain double precision,
    area_type character varying(45)
);


--
-- TOC entry 199 (class 1259 OID 16436)
-- Name: sensing_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sensing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 199
-- Name: sensing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sensing_id_seq OWNED BY public.sensing.id;


--
-- TOC entry 202 (class 1259 OID 16502)
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sensors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 201 (class 1259 OID 16492)
-- Name: sensors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sensors (
    id integer DEFAULT nextval('public.sensors_id_seq'::regclass) NOT NULL,
    sensorid character varying(45) NOT NULL,
    channel integer NOT NULL,
    power double precision NOT NULL,
    earfcn integer NOT NULL,
    freq double precision NOT NULL,
    ch_scan_bw double precision NOT NULL,
    "timestamp" bigint NOT NULL,
    latitude double precision,
    longitude double precision,
    ant_height double precision,
    ant_gain double precision,
    area_type character varying(45)
);


--
-- TOC entry 2686 (class 2604 OID 16421)
-- Name: nodes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nodes ALTER COLUMN id SET DEFAULT nextval('public.nodes_id_seq'::regclass);


--
-- TOC entry 2687 (class 2604 OID 16441)
-- Name: sensing id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensing ALTER COLUMN id SET DEFAULT nextval('public.sensing_id_seq'::regclass);


--
-- TOC entry 2825 (class 0 OID 16424)
-- Dependencies: 198
-- Data for Name: lsa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2824 (class 0 OID 16418)
-- Dependencies: 197
-- Data for Name: nodes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nodes (id, "nodeId", "nodeName", freq, latitude, longitude) VALUES (1, '1', 'Oulu', 2650, 65.0128263, 25.4605833);
INSERT INTO public.nodes (id, "nodeId", "nodeName", freq, latitude, longitude) VALUES (2, '2', 'helsinki', 2600, 60.168353500000002, 24.925707899999999);
INSERT INTO public.nodes (id, "nodeId", "nodeName", freq, latitude, longitude) VALUES (3, '3', 'jyvaskyla', 2600, 62.2440718, 25.741394700000001);
INSERT INTO public.nodes (id, "nodeId", "nodeName", freq, latitude, longitude) VALUES (4, '4', 'tampere', 2575, 61.631967500000002, 23.5501231);
INSERT INTO public.nodes (id, "nodeId", "nodeName", freq, latitude, longitude) VALUES (5, '5', 'turku', 2250, 60.479045800000002, 22.165092699999999);


--
-- TOC entry 2827 (class 0 OID 16438)
-- Dependencies: 200
-- Data for Name: sensing; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (14, 'cwcOulu', 17, -200, 1526893359088, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (15, 'cwcOulu', 16, -200, 1526893359098, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (16, 'cwcOulu', 19, -200, 1526893359109, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (17, 'cwcOulu', 18, -200, 1526893359137, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (20, 'cwcOulu', 15, -200, 1526893359180, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (21, 'cwcOulu', 14, -200, 1526893359198, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (13, 'cwcOulu', 10, -77.671999999999997, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (11, 'cwcOulu', 11, -77.516000000000005, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (19, 'cwcOulu', 12, -77.111999999999995, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (18, 'cwcOulu', 13, -77.471999999999994, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (9, 'cwcOulu', 8, -62.432000000000002, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (12, 'cwcOulu', 9, -68.272000000000006, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (7, 'cwcOulu', 6, -62.116, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (10, 'cwcOulu', 7, -61.299999999999997, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (5, 'cwcOulu', 4, -58.719999999999999, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (8, 'cwcOulu', 5, -59.231999999999999, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (3, 'cwcOulu', 2, -64.599999999999994, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (6, 'cwcOulu', 3, -60.271999999999998, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (2, 'cwcOulu', 0, -79.599999999999994, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensing (id, sensorid, channel, power, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (4, 'cwcOulu', 1, -79.488, 1526992334609, 65.059888000000001, 25.466251, 100, -3, 'city');


--
-- TOC entry 2828 (class 0 OID 16492)
-- Dependencies: 201
-- Data for Name: sensors; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (1, 'cwcOulu', 0, -79.599999999999994, 2750, 2620, 5, 1527253699700, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (2, 'cwcOulu', 2, -64.599999999999994, 2850, 2630, 5, 1527253699702, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (3, 'cwcOulu', 1, -79.488, 2800, 2625, 5, 1527253699705, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (14, 'cwcOulu', 12, -77.111999999999995, 3350, 2680, 5, 1527253699707, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (4, 'cwcOulu', 4, -58.719999999999999, 2950, 2640, 5, 1527253699709, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (13, 'cwcOulu', 13, -77.471999999999994, 3400, 2685, 5, 1527253699711, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (5, 'cwcOulu', 3, -60.271999999999998, 2900, 2635, 5, 1527253699714, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (6, 'cwcOulu', 6, -62.116, 3050, 2650, 5, 1527253699716, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (7, 'cwcOulu', 5, -59.231999999999999, 3000, 2645, 5, 1527253699718, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (8, 'cwcOulu', 8, -62.432000000000002, 3150, 2660, 5, 1527253699721, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (9, 'cwcOulu', 7, -61.299999999999997, 3100, 2655, 5, 1527253699723, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (11, 'cwcOulu', 9, -68.272000000000006, 3200, 2665, 5, 1527253699725, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (12, 'cwcOulu', 10, -77.671999999999997, 3250, 2670, 5, 1527253699727, 65.059888000000001, 25.466251, 100, -3, 'city');
INSERT INTO public.sensors (id, sensorid, channel, power, earfcn, freq, ch_scan_bw, "timestamp", latitude, longitude, ant_height, ant_gain, area_type) VALUES (10, 'cwcOulu', 11, -77.516000000000005, 3300, 2675, 5, 1527253699729, 65.059888000000001, 25.466251, 100, -3, 'city');


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 196
-- Name: nodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nodes_id_seq', 1, false);


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 199
-- Name: sensing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sensing_id_seq', 276, true);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 202
-- Name: sensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sensors_id_seq', 14, true);


--
-- TOC entry 2691 (class 2606 OID 16423)
-- Name: nodes nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 16444)
-- Name: sensing sensing_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensing
    ADD CONSTRAINT sensing_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 16497)
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 16501)
-- Name: sensors uk2ujxojyo2x2i1yr5nm7lmr3og; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensors
    ADD CONSTRAINT uk2ujxojyo2x2i1yr5nm7lmr3og UNIQUE (sensorid, channel);


--
-- TOC entry 2695 (class 2606 OID 16505)
-- Name: sensing ukmtf6je3cxkujfw15pnpuepwq4; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensing
    ADD CONSTRAINT ukmtf6je3cxkujfw15pnpuepwq4 UNIQUE (sensorid, channel);


--
-- TOC entry 2697 (class 2606 OID 16476)
-- Name: sensing unique_sensorId_channel; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sensing
    ADD CONSTRAINT "unique_sensorId_channel" UNIQUE (sensorid, channel);


--
-- TOC entry 2837 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-10-09 13:07:02

--
-- PostgreSQL database dump complete
--

