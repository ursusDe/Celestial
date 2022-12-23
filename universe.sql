--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.event (
    event_id integer NOT NULL,
    name character varying(50) NOT NULL,
    celestial_type character varying(50) NOT NULL
);


ALTER TABLE public.event OWNER TO freecodecamp;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO freecodecamp;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.event.event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_type text,
    description character varying(140)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200),
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    star_id integer,
    planet_type text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer,
    description character varying(140)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: event event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.event VALUES (1, 'solar eclipse', 'star');
INSERT INTO public.event VALUES (2, 'solar flare', 'star');
INSERT INTO public.event VALUES (3, 'moon eclipse', 'mon');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13610000, 'spiral', 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10010000, 'spiral', 'Closest big galay to Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 200, 'colliding spiral', 'Pair of interacting galaxies in starburst phase. Undergoing galactic collision');
INSERT INTO public.galaxy VALUES (4, 'Black eye galaxy', 13280000, 'spiral', 'spectacular dark band od absorbing dust in front of bright nucleus');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxies', 94, 'unbarred spiral', '2 galaxies in the process of colliding and merging');
INSERT INTO public.galaxy VALUES (6, 'Cigar galaxy', 13300000, 'starburst', 'Shape similar to cigar');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earths only natural satellite', true, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Smaller and outermost Mars satellite', false, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Intermost nad larger Mars satellite', false, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'Smallest Jupiter moon', true, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'Forth largest in solar system', true, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 'Largest Saturn moon', true, 6);
INSERT INTO public.moon VALUES (7, 'Hyperion', 'Irregular shaped, chaotic rotation, sponge like apperance', false, 6);
INSERT INTO public.moon VALUES (8, 'Ariel', 'Fourth largest Uranius moon', true, 7);
INSERT INTO public.moon VALUES (9, 'Cordelia', 'Inner most Uranius moon', false, 7);
INSERT INTO public.moon VALUES (10, 'Triton', 'Largest Neptun natural satellite', true, 8);
INSERT INTO public.moon VALUES (11, 'Proteus', 'Neptuns largest inner satellite', false, 8);
INSERT INTO public.moon VALUES (12, 'Callisto', 'Third largest moon in solar system', true, 5);
INSERT INTO public.moon VALUES (13, 'Thebe', 'Named after mythological nymph', false, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Second largest Saturn moon', true, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'Smallest Uranus satellite', true, 7);
INSERT INTO public.moon VALUES (16, 'Larissa', 'Named after lover of Posaidon', false, 8);
INSERT INTO public.moon VALUES (17, 'Cyllene', 'Jupiter natural satellite', true, 5);
INSERT INTO public.moon VALUES (18, 'Tethys', 'Mid-sized Saturn moon', true, 6);
INSERT INTO public.moon VALUES (19, 'Juliet', 'Inner Uranus satellite', false, 7);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 'Small moon of Neptune', false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 143.03, false, 4, 'terrestial');
INSERT INTO public.planet VALUES (2, 'Venus', 243.97, true, 4, 'terrestial');
INSERT INTO public.planet VALUES (3, 'Earth', 0, true, 4, 'terrestial');
INSERT INTO public.planet VALUES (4, 'Mars', 90.273, false, 4, 'terrestial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 729.55, false, 4, 'gass giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1559.8, false, 4, 'gass giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 2838.1, false, 4, 'ice giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 4493.8, false, 4, 'ice giant');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4.246, false, 1, 'Exoplanet');
INSERT INTO public.planet VALUES (10, 'Bernards star b', 5.978, false, 6, 'exoplanet');
INSERT INTO public.planet VALUES (11, 'Proxima centuri c', 4.246, false, 1, 'exoplanet');
INSERT INTO public.planet VALUES (12, 'Proxima centuri d', 4.246, false, 1, 'exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4853, 1, 'small, low mass star');
INSERT INTO public.star VALUES (2, 'Delta Andromedae', 600, 2, 'Triple star system');
INSERT INTO public.star VALUES (3, 'Alpha Centuri', 4853, 1, 'Proxima Centuri closest to Sun');
INSERT INTO public.star VALUES (4, 'Sun', 4603, 1, 'Our star');
INSERT INTO public.star VALUES (5, 'Nembus', 1700, 2, 'Red giant star');
INSERT INTO public.star VALUES (6, 'Bernard star', 10010, 1, 'red dwarf');


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.events_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: event events_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT events_name_key UNIQUE (name);


--
-- Name: event events_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: moon name_unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_unique_moon UNIQUE (name);


--
-- Name: planet name_unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique_planet UNIQUE (name);


--
-- Name: star name_unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_unique_star UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

