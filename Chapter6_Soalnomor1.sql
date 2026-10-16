--
-- PostgreSQL database dump
--

\restrict OPQR493MkMWItAJbrs436PQklHkEfIN49ZKMkJN6DUHjfMsiBsEbQIEY26VBhOI

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-16 09:04:02

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
-- TOC entry 2 (class 3079 OID 33051)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 33808)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    hotelno character varying(10) NOT NULL,
    guestno character varying(10) NOT NULL,
    datefrom date NOT NULL,
    dateto date,
    roomno integer,
    CONSTRAINT booking_datefrom_check CHECK ((datefrom > CURRENT_DATE)),
    CONSTRAINT booking_dateto_check CHECK ((dateto > CURRENT_DATE)),
    CONSTRAINT check_date_order CHECK ((dateto > datefrom))
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33785)
-- Name: guest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guest (
    guestno character varying(10) NOT NULL,
    guestname character varying(50) NOT NULL,
    guestaddress character varying(100) NOT NULL
);


ALTER TABLE public.guest OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33777)
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    hotelno character varying(10) NOT NULL,
    hotelname character varying(50) NOT NULL,
    city character varying(50) NOT NULL
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33793)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    roomno integer NOT NULL,
    hotelno character varying(10) NOT NULL,
    type character varying(10),
    price numeric(5,2),
    CONSTRAINT room_price_check CHECK (((price >= (10)::numeric) AND (price <= (100)::numeric))),
    CONSTRAINT room_roomno_check CHECK (((roomno >= 1) AND (roomno <= 100))),
    CONSTRAINT room_type_check CHECK (((type)::text = ANY ((ARRAY['Single'::character varying, 'Double'::character varying, 'Family'::character varying])::text[])))
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 5327 (class 0 OID 33808)
-- Dependencies: 223
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (hotelno, guestno, datefrom, dateto, roomno) FROM stdin;
\.


--
-- TOC entry 5325 (class 0 OID 33785)
-- Dependencies: 221
-- Data for Name: guest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guest (guestno, guestname, guestaddress) FROM stdin;
\.


--
-- TOC entry 5324 (class 0 OID 33777)
-- Dependencies: 220
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (hotelno, hotelname, city) FROM stdin;
\.


--
-- TOC entry 5326 (class 0 OID 33793)
-- Dependencies: 222
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room (roomno, hotelno, type, price) FROM stdin;
\.


--
-- TOC entry 5169 (class 2606 OID 33818)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (hotelno, guestno, datefrom);


--
-- TOC entry 5165 (class 2606 OID 33792)
-- Name: guest guest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (guestno);


--
-- TOC entry 5163 (class 2606 OID 33784)
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (hotelno);


--
-- TOC entry 5171 (class 2606 OID 33820)
-- Name: booking no_double_booking; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT no_double_booking EXCLUDE USING gist (roomno WITH =, hotelno WITH =, daterange(datefrom, dateto) WITH &&);


--
-- TOC entry 5173 (class 2606 OID 33822)
-- Name: booking no_overlap_guest; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT no_overlap_guest EXCLUDE USING gist (guestno WITH =, daterange(datefrom, dateto) WITH &&);


--
-- TOC entry 5167 (class 2606 OID 33802)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (roomno, hotelno);


--
-- TOC entry 5175 (class 2606 OID 33823)
-- Name: booking booking_guestno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_guestno_fkey FOREIGN KEY (guestno) REFERENCES public.guest(guestno);


--
-- TOC entry 5176 (class 2606 OID 33828)
-- Name: booking booking_roomno_hotelno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_roomno_hotelno_fkey FOREIGN KEY (roomno, hotelno) REFERENCES public.room(roomno, hotelno);


--
-- TOC entry 5174 (class 2606 OID 33803)
-- Name: room room_hotelno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_hotelno_fkey FOREIGN KEY (hotelno) REFERENCES public.hotel(hotelno);


-- Completed on 2026-10-16 09:04:02

--
-- PostgreSQL database dump complete
--

\unrestrict OPQR493MkMWItAJbrs436PQklHkEfIN49ZKMkJN6DUHjfMsiBsEbQIEY26VBhOI

