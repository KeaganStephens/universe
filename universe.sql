--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    size integer NOT NULL,
    mass integer NOT NULL,
    distance numeric NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    parent_planet character varying(50) NOT NULL,
    orbit_period numeric NOT NULL,
    surface_features text NOT NULL,
    exploration_missions text NOT NULL,
    discovery_date character varying(30),
    is_habitable boolean NOT NULL,
    planet_id integer,
    diameter numeric,
    mass numeric
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    type character varying(20) NOT NULL,
    orbit_period numeric NOT NULL,
    surface_temperature integer NOT NULL,
    atmosphere_composition text NOT NULL,
    discovery_date character varying NOT NULL,
    has_ring boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    spectral_type character varying(2) NOT NULL,
    apparent_magnitude double precision NOT NULL,
    absolute_magnitude double precision NOT NULL,
    temperature integer NOT NULL,
    constellation character varying(50) NOT NULL,
    is_binary boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: universe_relations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_relations (
    universe_relations_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    relationship_type character varying(30),
    name character varying(50)
);


ALTER TABLE public.universe_relations OWNER TO freecodecamp;

--
-- Name: universe_relations_universe_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_relations_universe_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_relations_universe_relation_id_seq OWNER TO freecodecamp;

--
-- Name: universe_relations_universe_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_relations_universe_relation_id_seq OWNED BY public.universe_relations.universe_relations_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: universe_relations universe_relations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations ALTER COLUMN universe_relations_id SET DEFAULT nextval('public.universe_relations_universe_relation_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 50000, 25000, 'Our galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 55000, 30000, 'Nearest spiral galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 150000, 70000, 60000, 'Elliptical galaxy in the Virgo cluster', true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 90000, 45000, 28000, 'Third-largest galaxy in the Local Group', true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 110000, 52000, 29000, 'Spiral galaxy interacting with NGC 5195', true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 95000, 48000, 31000, 'Spiral galaxy with prominent bulge resembling a sombrero', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Luna', 'Earth', 27.3, 'Craters, maria', 'Apollo 11, Chang''e 5', NULL, false, 1, 3475, 73000000000000000000000);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 0.31891, 'Regolith', 'None', '1877-01-01', false, 4, 22.2, 1080000000000);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Mars', 1.26244, 'Regolith', 'None', '1877-01-01', false, 4, 12.4, 200000000000);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Jupiter', 7.155, 'Craters, grooves, ridges', 'Galileo spacecraft', '1610-01-01', false, 5, 5268, 25000000000000000000000);
INSERT INTO public.moon VALUES (6, 'Titan', 'Saturn', 15.945, 'Lakes, dunes, rivers', 'Cassini-Huygens', '1655-01-01', true, 6, 5150, 23500000000000000000000);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 16.689, 'Craters, ancient plains', 'Galileo spacecraft', '1610-01-01', false, 5, 4820, 18000000000000000000000);
INSERT INTO public.moon VALUES (8, 'Europa', 'Jupiter', 3.551, 'Ice crust, subsurface ocean', 'Galileo spacecraft', '1610-01-01', true, 5, 3121, 8000000000000000000000);
INSERT INTO public.moon VALUES (9, 'Io', 'Jupiter', 1.769, 'Volcanoes, sulfur plains', 'Galileo spacecraft', '1610-01-01', false, 5, 3637, 15000000000000000000000);
INSERT INTO public.moon VALUES (10, 'Triton', 'Neptune', -5.877, 'Cryovolcanoes, icy plains', 'Voyager 2', '1846-01-01', false, 8, 2706, 3600000000000000000000);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Saturn', 1.37, 'Geysers, subsurface ocean', 'Cassini-Huygens', '1789-01-01', true, 6, 504, 120000000000);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn', 4.518, 'Craters, mountains', 'Cassini-Huygens', '1672-01-01', false, 6, 1529, 1000000000000);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Saturn', 79.3215, 'Dark and light regions', 'Cassini-Huygens', '1671-01-01', false, 6, 1436, 390000000000);
INSERT INTO public.moon VALUES (14, 'Charon', 'Pluto', 6.387, 'Craters, canyons', 'New Horizons', '1978-01-01', false, 9, 1212, 1586000000000);
INSERT INTO public.moon VALUES (15, 'Europa', 'Jupiter', 3.551, 'Icy surface', 'None', '1979-01-01', true, 7, 1563, 100000000000);
INSERT INTO public.moon VALUES (16, 'Ganymede', 'Jupiter', 7.155, 'Craters, grooves', 'None', '1979-01-01', false, 7, 2634, 160000000000);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Saturn', 0.942, 'Impact crater (Herschel)', 'None', '1789-01-01', false, 7, 396, 38000000000);
INSERT INTO public.moon VALUES (18, 'Dione', 'Saturn', 2.7369, 'Craters, icy cliffs', 'None', '1684-01-01', false, 7, 1123, 100000000000);
INSERT INTO public.moon VALUES (19, 'Triton', 'Neptune', -5.877, 'Geysers, nitrogen ice', 'None', '1846-01-01', false, 8, 1353, 420000000000);
INSERT INTO public.moon VALUES (20, 'Proteus', 'Neptune', 1.122, 'Craters, irregular shape', 'None', '1989-01-01', false, 8, 420, 500000000000);
INSERT INTO public.moon VALUES (21, 'Nereid', 'Neptune', 360.13, 'Irregular shape, retrograde orbit', 'None', '1949-01-01', false, 8, 340, 100000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 88, 440, 'Minimal', '14th century BC', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 225, 737, 'Carbon dioxide, nitrogen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 365, 288, 'Nitrogen, oxygen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 687, 210, 'Carbon dioxide, nitrogen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4333, 165, 'Hydrogen, helium', 'Antiquity', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 10759, 134, 'Hydrogen, helium', 'Antiquity', true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 30687, 76, 'Hydrogen, helium', '1781', true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 60190, 72, 'Hydrogen, helium', '1846', true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf', 90560, 44, 'Nitrogen, methane', '1930', false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Terrestrial', 384.84, 288, 'Unknown', '2015', false, 2);
INSERT INTO public.planet VALUES (11, 'TrES-2b', 'Gas Giant', 2.47063, 1340, 'Sodium, potassium', '2011', false, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Gas Giant', 3.52474, 1130, 'Unknown', '1999', false, 4);
INSERT INTO public.planet VALUES (13, 'Mercury', 'Terrestrial', 88, 440, 'Minimal', '14th century BC', false, 1);
INSERT INTO public.planet VALUES (14, 'Venus', 'Terrestrial', 225, 737, 'Carbon dioxide, nitrogen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (15, 'Earth', 'Terrestrial', 365, 288, 'Nitrogen, oxygen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (16, 'Mars', 'Terrestrial', 687, 210, 'Carbon dioxide, nitrogen', 'Prehistory', false, 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 'Gas Giant', 4333, 165, 'Hydrogen, helium', 'Antiquity', true, 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 'Gas Giant', 10759, 134, 'Hydrogen, helium', 'Antiquity', true, 1);
INSERT INTO public.planet VALUES (19, 'Uranus', 'Ice Giant', 30687, 76, 'Hydrogen, helium', '1781', true, 1);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Ice Giant', 60190, 72, 'Hydrogen, helium', '1846', true, 1);
INSERT INTO public.planet VALUES (21, 'Pluto', 'Dwarf', 90560, 44, 'Nitrogen, methane', '1930', false, 1);
INSERT INTO public.planet VALUES (22, 'Kepler-452b', 'Terrestrial', 384.84, 288, 'Unknown', '2015', false, 2);
INSERT INTO public.planet VALUES (23, 'TrES-2b', 'Gas Giant', 2.47063, 1340, 'Sodium, potassium', '2011', false, 3);
INSERT INTO public.planet VALUES (24, 'HD 209458 b', 'Gas Giant', 3.52474, 1130, 'Unknown', '1999', false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', -26.74, 4.83, 5778, 'None', false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M', 11.13, 15.53, 3042, 'Centaurus', false, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A', -1.46, 1.42, 9940, 'Canis Major', false, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'G', 0.01, 4.38, 5790, 'Centaurus', false, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 'K', 1.33, 5.71, 5260, 'Centaurus', false, 1);
INSERT INTO public.star VALUES (6, 'Barnard''s Star', 'M', 9.54, 13.22, 3134, 'Ophiuchus', false, 1);


--
-- Data for Name: universe_relations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_relations VALUES (1, 1, 1, 'Orbiting', 'Mercury Orbits Sun');
INSERT INTO public.universe_relations VALUES (2, 1, 2, 'Orbiting', 'Venus Orbits Sun');
INSERT INTO public.universe_relations VALUES (3, 1, 3, 'Orbiting', 'Earth Orbits Sun');
INSERT INTO public.universe_relations VALUES (4, 1, 4, 'Orbiting', 'Mars Orbits Sun');
INSERT INTO public.universe_relations VALUES (5, 1, 5, 'Orbiting', 'Jupiter Orbits Sun');
INSERT INTO public.universe_relations VALUES (6, 1, 6, 'Orbiting', 'Saturn Orbits Sun');
INSERT INTO public.universe_relations VALUES (7, 1, 7, 'Orbiting', 'Uranus Orbits Sun');
INSERT INTO public.universe_relations VALUES (8, 1, 8, 'Orbiting', 'Neptune Orbits Sun');
INSERT INTO public.universe_relations VALUES (9, 1, 9, 'Orbiting', 'Pluto Orbits Sun');
INSERT INTO public.universe_relations VALUES (10, 2, 10, 'Orbiting', 'Kepler-452b Orbits Star 2');
INSERT INTO public.universe_relations VALUES (11, 3, 11, 'Orbiting', 'TrES-2b Orbits Star 3');
INSERT INTO public.universe_relations VALUES (12, 4, 12, 'Orbiting', 'HD 209458 b Orbits Star 4');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 24, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: universe_relations_universe_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_relations_universe_relation_id_seq', 12, true);


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
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: universe_relations unique_universe_relation_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT unique_universe_relation_id UNIQUE (universe_relations_id);


--
-- Name: universe_relations universe_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT universe_relations_pkey PRIMARY KEY (universe_relations_id);


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
-- Name: universe_relations universe_relations_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT universe_relations_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universe_relations universe_relations_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_relations
    ADD CONSTRAINT universe_relations_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

