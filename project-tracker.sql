--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13 (Ubuntu 13.13-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.13 (Ubuntu 13.13-1.pgdg22.04+1)

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
-- Name: grades; Type: TABLE; Schema: public; Owner: nicole
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_github character varying(30),
    project_title character varying(30),
    grade integer
);


ALTER TABLE public.grades OWNER TO nicole;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: nicole
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grades_id_seq OWNER TO nicole;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicole
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: nicole
--

CREATE TABLE public.projects (
    title character varying NOT NULL,
    description text,
    max_grade integer
);


ALTER TABLE public.projects OWNER TO nicole;

--
-- Name: students; Type: TABLE; Schema: public; Owner: nicole
--

CREATE TABLE public.students (
    github character varying(30) NOT NULL,
    first_name character varying(30),
    last_name character varying(30)
);


ALTER TABLE public.students OWNER TO nicole;

--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: nicole
--

COPY public.grades (id, student_github, project_title, grade) FROM stdin;
1	jhacks	Markov	10
2	jhacks	Blockly	2
3	sdevelops	Markov	50
4	sdevelops	Blockly	100
5	LegendGlassBreaker	Carpool_Karaoke	1000
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: nicole
--

COPY public.projects (title, description, max_grade) FROM stdin;
Markov	Tweets generated from Markov chains	50
Blockly	Programmatic Logic Puzzle Game	100
Carpool_Karaoke	Sing to your hearts content!	1000
Growing_Plants	Keeping plants alive	1
100_Meter_Dash	Running IRL or in the meta verse	100
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: nicole
--

COPY public.students (github, first_name, last_name) FROM stdin;
jhacks	Jane	Hacker
sdevelops	Sarah	Developer
LegendGlassBreaker	Mariah	Carrey
\.


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicole
--

SELECT pg_catalog.setval('public.grades_id_seq', 6, true);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (title);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (github);


--
-- Name: grades grades_project_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_project_title_fkey FOREIGN KEY (project_title) REFERENCES public.projects(title);


--
-- Name: grades grades_student_github_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nicole
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_github_fkey FOREIGN KEY (student_github) REFERENCES public.students(github);


--
-- PostgreSQL database dump complete
--

