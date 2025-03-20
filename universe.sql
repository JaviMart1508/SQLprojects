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
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    distance_in_millions_of_ly numeric(5,2),
    number_of_billions_of_stars integer
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
    name character varying(30) NOT NULL,
    radius_in_moons numeric(5,4),
    mass_in_moons numeric(8,7),
    orbital_period_in_days numeric(7,4),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    planet_type character varying(60),
    moons_number integer,
    is_in_goldilocks_zone boolean,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    star_class_id integer NOT NULL,
    distance_in_ly numeric(12,2),
    radius_in_suns numeric(6,2),
    mass_in_suns numeric(6,2),
    number_of_planets integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_class (
    star_class_id integer NOT NULL,
    name character varying(1) NOT NULL,
    min_temp_in_k integer,
    color character varying(30),
    max_temp_in_k integer
);


ALTER TABLE public.star_class OWNER TO freecodecamp;

--
-- Name: star_classes_star_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_classes_star_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_classes_star_class_id_seq OWNER TO freecodecamp;

--
-- Name: star_classes_star_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_classes_star_class_id_seq OWNED BY public.star_class.star_class_id;


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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_class star_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class ALTER COLUMN star_class_id SET DEFAULT nextval('public.star_classes_star_class_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0.00, 100);
INSERT INTO public.galaxy VALUES (2, 'Andromeda (M31)', 'Spiral', 2.50, 1000);
INSERT INTO public.galaxy VALUES (3, 'M87', 'Elliptical', 53.50, 1000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 13.00, 100);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 0.16, 10);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', 0.20, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1.0000, 1.0000000, 27.3200, 3);
INSERT INTO public.moon VALUES (2, 'Io', 1.0500, 1.2200000, 1.7700, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 0.9000, 0.6600000, 3.5500, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1.5100, 2.0400000, 7.1500, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 1.3800, 1.4700000, 16.6900, 5);
INSERT INTO public.moon VALUES (6, 'Titan', 1.4900, 1.8700000, 15.9500, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', 0.4500, 0.0300000, 4.5200, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 0.5600, 0.0100000, 79.3300, 6);
INSERT INTO public.moon VALUES (9, 'Dione', 0.3100, 0.0150000, 2.7400, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 0.2700, 0.0050000, 1.8900, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 0.1400, 0.0005000, 1.3700, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 0.1200, 0.0002000, 0.9400, 6);
INSERT INTO public.moon VALUES (13, 'Triton', 0.7800, 0.2900000, 5.8800, 8);
INSERT INTO public.moon VALUES (14, 'Deimos', 0.0018, 0.0000018, 1.2600, 4);
INSERT INTO public.moon VALUES (15, 'Miranda', 0.0780, 0.0040000, 1.4100, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 0.2100, 0.0780000, 2.5200, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 0.1900, 0.0700000, 4.1400, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 0.2900, 0.1800000, 8.7100, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 0.2800, 0.1600000, 13.4600, 7);
INSERT INTO public.moon VALUES (20, 'Phobos', 0.0023, 0.0000014, 0.3200, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Planet closest to the Sun, with no significant atmosphere.', 'Rocky', 0, false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planet with a dense atmosphere and extremely hot surface temperatures.', 'Rocky', 0, false, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Only known planet with life, rich in oxygen and liquid water.', 'Rocky', 1, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Planet with a thin atmosphere, icy poles, and possible subsurface water.', 'Rocky', 2, true, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest gaseous giant in the solar system, with cloud bands and storms.', 'Gas giant', 95, false, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its stunning rings, a gaseous giant with low density.', 'Gas giant', 83, false, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant with a bluish-green atmosphere and tilted rotation axis.', 'Ice giant', 27, false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant with extremely fast winds and intense blue color.', 'Ice giant', 14, false, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 'Rocky', NULL, true, NULL, 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', NULL, 'Rocky', NULL, true, NULL, 5);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1f', NULL, 'Rocky', NULL, true, NULL, 5);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1g', NULL, 'Rocky', NULL, true, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 3, 0.00, 1.00, 1.00, 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4.24, 0.14, 0.12, 3, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 5, 8.60, 1.71, 2.02, 0, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 642.50, 887.00, 11.60, 0, 1);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 1, 39.00, 0.12, 0.09, 7, 1);
INSERT INTO public.star VALUES (6, 'Vega', 5, 25.05, 2.36, 2.14, 0, 1);


--
-- Data for Name: star_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_class VALUES (1, 'M', NULL, 'Red', 3700);
INSERT INTO public.star_class VALUES (2, 'K', 3700, 'Orange', 5200);
INSERT INTO public.star_class VALUES (3, 'G', 5200, 'Yellow', 6000);
INSERT INTO public.star_class VALUES (4, 'F', 6000, 'Yellowish White', 7500);
INSERT INTO public.star_class VALUES (5, 'A', 7500, 'White', 10000);
INSERT INTO public.star_class VALUES (7, 'O', 33000, 'Blue', NULL);
INSERT INTO public.star_class VALUES (6, 'B', 10000, 'Bluish White', 33000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_classes_star_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_classes_star_class_id_seq', 7, true);


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
-- Name: star_class star_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_class_name_key UNIQUE (name);


--
-- Name: star_class star_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_class
    ADD CONSTRAINT star_classes_pkey PRIMARY KEY (star_class_id);


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
-- Name: star star_star_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_class_id_fkey FOREIGN KEY (star_class_id) REFERENCES public.star_class(star_class_id);


--
-- PostgreSQL database dump complete
--

