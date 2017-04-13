--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: animals; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE animals (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE animals OWNER TO "Guest";

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animals_id_seq OWNER TO "Guest";

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE animals_id_seq OWNED BY animals.id;


--
-- Name: endangered_animals; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE endangered_animals (
    id integer NOT NULL,
    name character varying,
    health character varying,
    age character varying
);


ALTER TABLE endangered_animals OWNER TO "Guest";

--
-- Name: endangered_animals_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE endangered_animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endangered_animals_id_seq OWNER TO "Guest";

--
-- Name: endangered_animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE endangered_animals_id_seq OWNED BY endangered_animals.id;


--
-- Name: rangers; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE rangers (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE rangers OWNER TO "Guest";

--
-- Name: rangers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE rangers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rangers_id_seq OWNER TO "Guest";

--
-- Name: rangers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE rangers_id_seq OWNED BY rangers.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE sightings (
    id integer NOT NULL,
    animal_id integer,
    location character varying,
    ranger_name character varying,
    "timestamp" character varying
);


ALTER TABLE sightings OWNER TO "Guest";

--
-- Name: sightings_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE sightings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sightings_id_seq OWNER TO "Guest";

--
-- Name: sightings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE sightings_id_seq OWNED BY sightings.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq'::regclass);


--
-- Name: endangered_animals id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY endangered_animals ALTER COLUMN id SET DEFAULT nextval('endangered_animals_id_seq'::regclass);


--
-- Name: rangers id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY rangers ALTER COLUMN id SET DEFAULT nextval('rangers_id_seq'::regclass);


--
-- Name: sightings id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY sightings ALTER COLUMN id SET DEFAULT nextval('sightings_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY animals (id, name) FROM stdin;
1	Lemming
2	T-Rex
3	Red Bird
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('animals_id_seq', 3, true);


--
-- Data for Name: endangered_animals; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY endangered_animals (id, name, health, age) FROM stdin;
1	Fox	Okay	Young
2	Green Rino	Ill	Young
3	Evan	Okay	Young
4	DoDo	Healthy	Adult
\.


--
-- Name: endangered_animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('endangered_animals_id_seq', 4, true);


--
-- Data for Name: rangers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY rangers (id, name) FROM stdin;
1	Liam
2	Liam
3	Sam
4	Ted
5	Ted
6	Tom
\.


--
-- Name: rangers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('rangers_id_seq', 6, true);


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY sightings (id, animal_id, location, ranger_name, "timestamp") FROM stdin;
1	1	the Pool	Liam	\N
2	2	The Barn	Liam	\N
3	2	The Barn	Liam	\N
4	1	Pool	Liam	\N
5	2	The Barn	Liam	\N
6	1	The Pool	\N	\N
7	3	The Barn	\N	\N
8	3	The Barn	\N	\N
9	1	The Pool	\N	\N
10	3	The Pool	\N	\N
12	2	The Road	\N	2017-04-12 19:37:56.324000 -07:00:00
13	3	The Friar Patch	\N	08:00 PM Wednesday April 2017
14	1	The Barn	\N	09:10 PM Wednesday April 2017
15	2	The Friar Patch	\N	09:15 PM Wednesday April 2017
16	3	the Pool	\N	09:16 PM Wednesday April 2017
17	3	The Road	\N	09:16 PM Wednesday April 2017
18	1		\N	09:19 PM Wednesday April 2017
19	3	the Pool	\N	09:21 PM Wednesday April 2017
20	3	The Barn	\N	09:32 PM Wednesday April 2017
21	2	the Pool	\N	09:33 PM Wednesday April 2017
22	3	the Pool	$animal.getId()	09:35 PM Wednesday April 2017
23	2	The Friar Patch	$animal.getId()	09:35 PM Wednesday April 2017
24	3	Liam	$ranger.getId()	09:44 PM Wednesday April 2017
25	2	the Pool	$ranger.getId()	09:44 PM Wednesday April 2017
26	3	the Pool	3	09:46 PM Wednesday April 2017
27	3	the Pool	6	09:46 PM Wednesday April 2017
28	3	the Pool	Ted	09:52 PM Wednesday April 2017
29	2	The Friar Patch	Ted	09:53 PM Wednesday April 2017
30	3	the Pool	Tom	09:55 PM Wednesday April 2017
31	3	The Friar Patch	Sam	09:58 PM Wednesday April 2017
32	3	The Mall	Ted	09:58 PM Wednesday April 2017
33	3	the Pool	Ted	10:06 PM Wednesday April 2017
\.


--
-- Name: sightings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('sightings_id_seq', 33, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: endangered_animals endangered_animals_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY endangered_animals
    ADD CONSTRAINT endangered_animals_pkey PRIMARY KEY (id);


--
-- Name: rangers rangers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY rangers
    ADD CONSTRAINT rangers_pkey PRIMARY KEY (id);


--
-- Name: sightings sightings_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY sightings
    ADD CONSTRAINT sightings_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

