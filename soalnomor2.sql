--
-- PostgreSQL database dump
--

\restrict Cx6DHbbxoRPMXWWhmtwsyDatxlydMnIqxNU03qPvvCKlkY6NXhTezFdwY0UweTR

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-16 08:53:15

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
-- TOC entry 219 (class 1259 OID 33834)
-- Name: advert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advert (
    dateadvert date NOT NULL,
    propertyforrent_propertyno character varying(10) NOT NULL,
    newspaper_newspapername character varying(50) NOT NULL
);


ALTER TABLE public.advert OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33848)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branchno character varying(10) NOT NULL,
    manager_staff_staff_id integer NOT NULL
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33860)
-- Name: bussiness_owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bussiness_owner (
    ownerno character varying(10) NOT NULL
);


ALTER TABLE public.bussiness_owner OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33866)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    clientno character varying(10) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33934)
-- Name: lease; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lease (
    leaseno character varying(10) NOT NULL,
    client_clientno character varying(10) NOT NULL,
    propertyforrent_propertyno character varying(10) NOT NULL
);


ALTER TABLE public.lease OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33842)
-- Name: manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.manager (
    staff_staff_id integer NOT NULL
);


ALTER TABLE public.manager OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 33872)
-- Name: newspaper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.newspaper (
    newspapername character varying(50) NOT NULL
);


ALTER TABLE public.newspaper OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33878)
-- Name: privateowner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privateowner (
    ownerno character varying(10) NOT NULL
);


ALTER TABLE public.privateowner OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 33904)
-- Name: propertyforrent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.propertyforrent (
    propertyno character varying(10) NOT NULL,
    branch_branchno character varying(10) NOT NULL,
    privateowner_ownerno character varying(10) NOT NULL,
    bussiness_owner_ownerno character varying(10) NOT NULL,
    staff_staff_id integer NOT NULL
);


ALTER TABLE public.propertyforrent OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 33952)
-- Name: registration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration (
    branch_branchno character varying(10) NOT NULL,
    client_clientno character varying(10) NOT NULL,
    staff_staff_id integer NOT NULL
);


ALTER TABLE public.registration OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33885)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    staffno character varying(10),
    branch_branchno character varying(10) NOT NULL,
    staff_staff_id integer NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 33884)
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_staff_id_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 226
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;


--
-- TOC entry 231 (class 1259 OID 33975)
-- Name: telephone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.telephone (
    telno character varying(10) NOT NULL,
    branch_branchno character varying(10) NOT NULL
);


ALTER TABLE public.telephone OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 33987)
-- Name: viewing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewing (
    client_clientno character varying(10) NOT NULL,
    propertyforrent_propertyno character varying(10) NOT NULL
);


ALTER TABLE public.viewing OWNER TO postgres;

--
-- TOC entry 4904 (class 2604 OID 33888)
-- Name: staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- TOC entry 5095 (class 0 OID 33834)
-- Dependencies: 219
-- Data for Name: advert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.advert (dateadvert, propertyforrent_propertyno, newspaper_newspapername) FROM stdin;
\.


--
-- TOC entry 5097 (class 0 OID 33848)
-- Dependencies: 221
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (branchno, manager_staff_staff_id) FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 33860)
-- Dependencies: 222
-- Data for Name: bussiness_owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bussiness_owner (ownerno) FROM stdin;
\.


--
-- TOC entry 5099 (class 0 OID 33866)
-- Dependencies: 223
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (clientno) FROM stdin;
\.


--
-- TOC entry 5105 (class 0 OID 33934)
-- Dependencies: 229
-- Data for Name: lease; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lease (leaseno, client_clientno, propertyforrent_propertyno) FROM stdin;
\.


--
-- TOC entry 5096 (class 0 OID 33842)
-- Dependencies: 220
-- Data for Name: manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.manager (staff_staff_id) FROM stdin;
\.


--
-- TOC entry 5100 (class 0 OID 33872)
-- Dependencies: 224
-- Data for Name: newspaper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.newspaper (newspapername) FROM stdin;
\.


--
-- TOC entry 5101 (class 0 OID 33878)
-- Dependencies: 225
-- Data for Name: privateowner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privateowner (ownerno) FROM stdin;
\.


--
-- TOC entry 5104 (class 0 OID 33904)
-- Dependencies: 228
-- Data for Name: propertyforrent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.propertyforrent (propertyno, branch_branchno, privateowner_ownerno, bussiness_owner_ownerno, staff_staff_id) FROM stdin;
\.


--
-- TOC entry 5106 (class 0 OID 33952)
-- Dependencies: 230
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registration (branch_branchno, client_clientno, staff_staff_id) FROM stdin;
\.


--
-- TOC entry 5103 (class 0 OID 33885)
-- Dependencies: 227
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, staffno, branch_branchno, staff_staff_id) FROM stdin;
\.


--
-- TOC entry 5107 (class 0 OID 33975)
-- Dependencies: 231
-- Data for Name: telephone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.telephone (telno, branch_branchno) FROM stdin;
\.


--
-- TOC entry 5108 (class 0 OID 33987)
-- Dependencies: 232
-- Data for Name: viewing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewing (client_clientno, propertyforrent_propertyno) FROM stdin;
\.


--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 226
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 1, false);


--
-- TOC entry 4906 (class 2606 OID 33841)
-- Name: advert advert_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_pk PRIMARY KEY (dateadvert, propertyforrent_propertyno, newspaper_newspapername);


--
-- TOC entry 4910 (class 2606 OID 33854)
-- Name: branch branch_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pk PRIMARY KEY (branchno);


--
-- TOC entry 4912 (class 2606 OID 33865)
-- Name: bussiness_owner bussiness_owner_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bussiness_owner
    ADD CONSTRAINT bussiness_owner_pk PRIMARY KEY (ownerno);


--
-- TOC entry 4914 (class 2606 OID 33871)
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (clientno);


--
-- TOC entry 4924 (class 2606 OID 33941)
-- Name: lease lease_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lease
    ADD CONSTRAINT lease_pk PRIMARY KEY (leaseno);


--
-- TOC entry 4908 (class 2606 OID 33847)
-- Name: manager manager_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY (staff_staff_id);


--
-- TOC entry 4916 (class 2606 OID 33877)
-- Name: newspaper newspaper_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.newspaper
    ADD CONSTRAINT newspaper_pk PRIMARY KEY (newspapername);


--
-- TOC entry 4918 (class 2606 OID 33883)
-- Name: privateowner privateowner_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privateowner
    ADD CONSTRAINT privateowner_pk PRIMARY KEY (ownerno);


--
-- TOC entry 4922 (class 2606 OID 33913)
-- Name: propertyforrent propertyforrent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_pk PRIMARY KEY (propertyno);


--
-- TOC entry 4926 (class 2606 OID 33959)
-- Name: registration registration_client_clientno_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_client_clientno_key UNIQUE (client_clientno);


--
-- TOC entry 4920 (class 2606 OID 33893)
-- Name: staff staff_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pk PRIMARY KEY (staff_id);


--
-- TOC entry 4928 (class 2606 OID 33981)
-- Name: telephone telephone_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telephone
    ADD CONSTRAINT telephone_pk PRIMARY KEY (telno);


--
-- TOC entry 4930 (class 2606 OID 33993)
-- Name: viewing viewing_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_pk PRIMARY KEY (client_clientno, propertyforrent_propertyno);


--
-- TOC entry 4931 (class 2606 OID 34004)
-- Name: advert advert_newspaper_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_newspaper_fk FOREIGN KEY (newspaper_newspapername) REFERENCES public.newspaper(newspapername);


--
-- TOC entry 4932 (class 2606 OID 34009)
-- Name: advert advert_propertyforrent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advert
    ADD CONSTRAINT advert_propertyforrent_fk FOREIGN KEY (propertyforrent_propertyno) REFERENCES public.propertyforrent(propertyno);


--
-- TOC entry 4933 (class 2606 OID 33855)
-- Name: branch branch_manager_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_manager_fk FOREIGN KEY (manager_staff_staff_id) REFERENCES public.manager(staff_staff_id);


--
-- TOC entry 4936 (class 2606 OID 33919)
-- Name: propertyforrent fk_prop_busowner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT fk_prop_busowner FOREIGN KEY (bussiness_owner_ownerno) REFERENCES public.bussiness_owner(ownerno);


--
-- TOC entry 4937 (class 2606 OID 33924)
-- Name: propertyforrent fk_prop_privowner; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT fk_prop_privowner FOREIGN KEY (privateowner_ownerno) REFERENCES public.privateowner(ownerno);


--
-- TOC entry 4940 (class 2606 OID 33942)
-- Name: lease lease_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lease
    ADD CONSTRAINT lease_client_fk FOREIGN KEY (client_clientno) REFERENCES public.client(clientno);


--
-- TOC entry 4941 (class 2606 OID 33947)
-- Name: lease lease_propertyforrent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lease
    ADD CONSTRAINT lease_propertyforrent_fk FOREIGN KEY (propertyforrent_propertyno) REFERENCES public.propertyforrent(propertyno);


--
-- TOC entry 4938 (class 2606 OID 33914)
-- Name: propertyforrent propertyforrent_branch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_branch_fk FOREIGN KEY (branch_branchno) REFERENCES public.branch(branchno);


--
-- TOC entry 4939 (class 2606 OID 33929)
-- Name: propertyforrent propertyforrent_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.propertyforrent
    ADD CONSTRAINT propertyforrent_staff_fk FOREIGN KEY (staff_staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 4942 (class 2606 OID 33960)
-- Name: registration registration_branch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_branch_fk FOREIGN KEY (branch_branchno) REFERENCES public.branch(branchno);


--
-- TOC entry 4943 (class 2606 OID 33965)
-- Name: registration registration_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_client_fk FOREIGN KEY (client_clientno) REFERENCES public.client(clientno);


--
-- TOC entry 4944 (class 2606 OID 33970)
-- Name: registration registration_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_staff_fk FOREIGN KEY (staff_staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 4934 (class 2606 OID 33894)
-- Name: staff staff_branch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_branch_fk FOREIGN KEY (branch_branchno) REFERENCES public.branch(branchno);


--
-- TOC entry 4935 (class 2606 OID 33899)
-- Name: staff staff_staff_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_staff_fk FOREIGN KEY (staff_staff_id) REFERENCES public.staff(staff_id);


--
-- TOC entry 4945 (class 2606 OID 33982)
-- Name: telephone telephone_branch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.telephone
    ADD CONSTRAINT telephone_branch_fk FOREIGN KEY (branch_branchno) REFERENCES public.branch(branchno);


--
-- TOC entry 4946 (class 2606 OID 33994)
-- Name: viewing viewing_client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_client_fk FOREIGN KEY (client_clientno) REFERENCES public.client(clientno);


--
-- TOC entry 4947 (class 2606 OID 33999)
-- Name: viewing viewing_propertyforrent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewing
    ADD CONSTRAINT viewing_propertyforrent_fk FOREIGN KEY (propertyforrent_propertyno) REFERENCES public.propertyforrent(propertyno);


-- Completed on 2026-10-16 08:53:16

--
-- PostgreSQL database dump complete
--

\unrestrict Cx6DHbbxoRPMXWWhmtwsyDatxlydMnIqxNU03qPvvCKlkY6NXhTezFdwY0UweTR

