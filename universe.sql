--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth numeric,
    nebula_id integer
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
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    moon_type character varying(255),
    size_in_km integer,
    has_oxygen boolean NOT NULL
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    distance_from_earth numeric
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_type character varying(255),
    is_spherical boolean NOT NULL,
    has_moons boolean NOT NULL,
    distance_from_star numeric
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
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_type character varying(255),
    age_in_millions_of_years integer,
    has_planets boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A spiral galaxy containing our solar system', true, 0, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A neighboring galaxy to the Milky Way', false, 2.5, 2);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'An elliptical galaxy in the Virgo cluster', false, 50, 3);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A spiral galaxy located in the Canes Venatici constellation', false, 23.2, 1);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A spiral galaxy in the Virgo cluster', false, 28.9, 3);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'A spiral galaxy in the Local Group', false, 3.0, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (59, 1, 'Selene', 'Natural Satellite', 3474, false);
INSERT INTO public.moon VALUES (60, 2, 'Phobos-1', 'Natural Satellite', 22, false);
INSERT INTO public.moon VALUES (61, 2, 'Deimos-2', 'Natural Satellite', 12, false);
INSERT INTO public.moon VALUES (62, 6, 'Titan-Moon', 'Natural Satellite', 5150, false);
INSERT INTO public.moon VALUES (63, 7, 'Rhea-Saturn', 'Natural Satellite', 1528, false);
INSERT INTO public.moon VALUES (64, 1, 'Io-Jupiter', 'Natural Satellite', 3643, false);
INSERT INTO public.moon VALUES (65, 1, 'Europa-Prime', 'Natural Satellite', 3121, false);
INSERT INTO public.moon VALUES (66, 4, 'Triton-Neptune', 'Natural Satellite', 2706, false);
INSERT INTO public.moon VALUES (67, 3, 'Fobos-Mars', 'Natural Satellite', 24, false);
INSERT INTO public.moon VALUES (68, 5, 'Mimas-Saturn', 'Natural Satellite', 396, false);
INSERT INTO public.moon VALUES (69, 7, 'Enceladus-Saturn', 'Natural Satellite', 504, false);
INSERT INTO public.moon VALUES (70, 2, 'Ganymede-Solaris', 'Natural Satellite', 5262, false);
INSERT INTO public.moon VALUES (71, 6, 'Titania-Saturn', 'Natural Satellite', 1577, false);
INSERT INTO public.moon VALUES (72, 8, 'Charon-Pluto', 'Natural Satellite', 1212, false);
INSERT INTO public.moon VALUES (73, 9, 'Umbriel-Uranus', 'Natural Satellite', 1169, false);
INSERT INTO public.moon VALUES (74, 10, 'Miranda-Uranus', 'Natural Satellite', 471, false);
INSERT INTO public.moon VALUES (75, 5, 'Titania-Uranus', 'Natural Satellite', 1577, false);
INSERT INTO public.moon VALUES (76, 1, 'Callisto-Jupiter', 'Natural Satellite', 4821, false);
INSERT INTO public.moon VALUES (77, 4, 'Iapetus-Saturn', 'Natural Satellite', 1469, false);
INSERT INTO public.moon VALUES (78, 3, 'Hyperion-Saturn', 'Natural Satellite', 270, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', 'A bright nebula located in the Milky Way', 1344);
INSERT INTO public.nebula VALUES (2, 'Eagle Nebula', 'A star-forming nebula in the constellation Serpens', 7000);
INSERT INTO public.nebula VALUES (3, 'Crab Nebula', 'A supernova remnant in the constellation Taurus', 6500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 'Terrestrial', true, true, 1.52);
INSERT INTO public.planet VALUES (3, 2, 'Proxima b', 'Exoplanet', true, false, 0.21);
INSERT INTO public.planet VALUES (4, 3, 'Red Planet', 'Exoplanet', true, false, 10);
INSERT INTO public.planet VALUES (5, 4, 'Neptune', 'Gas Giant', true, true, 4.5);
INSERT INTO public.planet VALUES (6, 1, 'Venus', 'Terrestrial', true, false, 0.72);
INSERT INTO public.planet VALUES (7, 5, 'Jupiter', 'Gas Giant', true, true, 5.2);
INSERT INTO public.planet VALUES (8, 6, 'Saturn', 'Gas Giant', true, true, 9.5);
INSERT INTO public.planet VALUES (9, 1, 'Mercury', 'Terrestrial', true, false, 0.39);
INSERT INTO public.planet VALUES (10, 1, 'Uranus', 'Ice Giant', true, true, 19.2);
INSERT INTO public.planet VALUES (11, 2, 'Alpha Centauri B', 'Exoplanet', true, false, 0.13);
INSERT INTO public.planet VALUES (12, 2, 'Alpha Centauri C', 'Exoplanet', true, true, 0.25);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G-type main-sequence', 4600, true);
INSERT INTO public.star VALUES (2, 2, 'Andromeda A', 'B-type giant', 2000, true);
INSERT INTO public.star VALUES (3, 3, 'M87 Star 1', 'M-type red dwarf', 5000, false);
INSERT INTO public.star VALUES (4, 4, 'Whirlpool 1', 'F-type main-sequence', 3000, true);
INSERT INTO public.star VALUES (5, 5, 'Sombrero Star', 'K-type main-sequence', 7000, true);
INSERT INTO public.star VALUES (6, 6, 'Alpha Centauri A', 'G-type main-sequence', 5000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 78, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_nebula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_nebula_id_fkey FOREIGN KEY (nebula_id) REFERENCES public.nebula(nebula_id);


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

