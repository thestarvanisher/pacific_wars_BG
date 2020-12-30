--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO myapp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO myapp;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO myapp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO myapp;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO myapp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO myapp;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO myapp;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO myapp;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO myapp;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO myapp;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO myapp;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO myapp;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO myapp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO myapp;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO myapp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO myapp;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO myapp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO myapp;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO myapp;

--
-- Name: search_bannedips; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_bannedips (
    ip_addr character varying(40) NOT NULL,
    banned_on date
);


ALTER TABLE search_bannedips OWNER TO myapp;

--
-- Name: search_battle; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_battle (
    battle_id character varying(20) NOT NULL,
    battle_name character varying(500) NOT NULL,
    starting_date date NOT NULL,
    ending_date date NOT NULL,
    description text,
    result character varying(300) NOT NULL,
    total_strength integer NOT NULL,
    total_losses integer NOT NULL,
    real_location character varying(500) NOT NULL,
    coord_top double precision,
    coord_left double precision,
    size_width double precision,
    size_height double precision
);


ALTER TABLE search_battle OWNER TO myapp;

--
-- Name: search_battlegroups; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_battlegroups (
    group_code integer NOT NULL,
    glocation_left double precision,
    glocation_top double precision
);


ALTER TABLE search_battlegroups OWNER TO myapp;

--
-- Name: search_groupedbattles; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_groupedbattles (
    id integer NOT NULL,
    group_id_id integer NOT NULL,
    battle_tag_id integer NOT NULL
);


ALTER TABLE search_groupedbattles OWNER TO myapp;

--
-- Name: search_battlegroups_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE search_battlegroups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE search_battlegroups_id_seq OWNER TO myapp;

--
-- Name: search_battlegroups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE search_battlegroups_id_seq OWNED BY search_groupedbattles.id;


--
-- Name: search_battleparticipants; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_battleparticipants (
    id integer NOT NULL,
    strength integer,
    casualties integer,
    commander_code_id character varying(100),
    battle_code_id character varying(20) NOT NULL,
    country_code_id character varying(2) NOT NULL
);


ALTER TABLE search_battleparticipants OWNER TO myapp;

--
-- Name: search_battleparticipants_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE search_battleparticipants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE search_battleparticipants_id_seq OWNER TO myapp;

--
-- Name: search_battleparticipants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE search_battleparticipants_id_seq OWNED BY search_battleparticipants.id;


--
-- Name: search_battlephotos; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_battlephotos (
    photo_id character varying(200) NOT NULL,
    description character varying(500),
    batle_code_id character varying(20),
    used_as character varying(50)
);


ALTER TABLE search_battlephotos OWNER TO myapp;

--
-- Name: search_battletag; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_battletag (
    id integer NOT NULL,
    battle_year integer,
    location_left double precision,
    location_top double precision,
    battle_code_id character varying(20) NOT NULL,
    in_a_group character varying(1),
    description character varying(500)
);


ALTER TABLE search_battletag OWNER TO myapp;

--
-- Name: search_battletag_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE search_battletag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE search_battletag_id_seq OWNER TO myapp;

--
-- Name: search_battletag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE search_battletag_id_seq OWNED BY search_battletag.id;


--
-- Name: search_countries; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_countries (
    country_id character varying(2) NOT NULL,
    country_name character varying(50) NOT NULL,
    shortened character varying(50) NOT NULL
);


ALTER TABLE search_countries OWNER TO myapp;

--
-- Name: search_countriescoords; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_countriescoords (
    battle_year integer NOT NULL,
    coordinates text
);


ALTER TABLE search_countriescoords OWNER TO myapp;

--
-- Name: search_messages; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_messages (
    id integer NOT NULL,
    person_name character varying(500) NOT NULL,
    person_email character varying(500) NOT NULL,
    person_subject character varying(500) NOT NULL,
    person_description text NOT NULL,
    person_ip_addr character varying(40) NOT NULL
);


ALTER TABLE search_messages OWNER TO myapp;

--
-- Name: search_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: myapp
--

CREATE SEQUENCE search_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE search_messages_id_seq OWNER TO myapp;

--
-- Name: search_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: myapp
--

ALTER SEQUENCE search_messages_id_seq OWNED BY search_messages.id;


--
-- Name: search_people; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_people (
    name_id character varying(100) NOT NULL,
    name text,
    shortened_name text,
    achievements text,
    fate text,
    country_code_id character varying(2) NOT NULL
);


ALTER TABLE search_people OWNER TO myapp;

--
-- Name: search_peoplephotos; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_peoplephotos (
    photo_id character varying(200) NOT NULL,
    description character varying(500),
    used_as character varying(50),
    person_code_id character varying(100)
);


ALTER TABLE search_peoplephotos OWNER TO myapp;

--
-- Name: search_suggestedlinks; Type: TABLE; Schema: public; Owner: myapp
--

CREATE TABLE search_suggestedlinks (
    link character varying(2000) NOT NULL,
    name character varying(1000) NOT NULL,
    domain character varying(1000) NOT NULL,
    language character varying(100) NOT NULL,
    description character varying(3000) NOT NULL
);


ALTER TABLE search_suggestedlinks OWNER TO myapp;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: search_battleparticipants id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battleparticipants ALTER COLUMN id SET DEFAULT nextval('search_battleparticipants_id_seq'::regclass);


--
-- Name: search_battletag id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battletag ALTER COLUMN id SET DEFAULT nextval('search_battletag_id_seq'::regclass);


--
-- Name: search_groupedbattles id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_groupedbattles ALTER COLUMN id SET DEFAULT nextval('search_battlegroups_id_seq'::regclass);


--
-- Name: search_messages id; Type: DEFAULT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_messages ALTER COLUMN id SET DEFAULT nextval('search_messages_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add battle	1	add_battle
2	Can change battle	1	change_battle
3	Can delete battle	1	delete_battle
4	Can add log entry	2	add_logentry
5	Can change log entry	2	change_logentry
6	Can delete log entry	2	delete_logentry
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add group	4	add_group
11	Can change group	4	change_group
12	Can delete group	4	delete_group
13	Can add user	5	add_user
14	Can change user	5	change_user
15	Can delete user	5	delete_user
16	Can add content type	6	add_contenttype
17	Can change content type	6	change_contenttype
18	Can delete content type	6	delete_contenttype
19	Can add session	7	add_session
20	Can change session	7	change_session
21	Can delete session	7	delete_session
22	Can add countries	8	add_countries
23	Can change countries	8	change_countries
24	Can delete countries	8	delete_countries
25	Can add battle_ participants	9	add_battle_participants
26	Can change battle_ participants	9	change_battle_participants
27	Can delete battle_ participants	9	delete_battle_participants
28	Can add battle participants	10	add_battleparticipants
29	Can change battle participants	10	change_battleparticipants
30	Can delete battle participants	10	delete_battleparticipants
31	Can add battle photos	11	add_battlephotos
32	Can change battle photos	11	change_battlephotos
33	Can delete battle photos	11	delete_battlephotos
34	Can add countries coords	12	add_countriescoords
35	Can change countries coords	12	change_countriescoords
36	Can delete countries coords	12	delete_countriescoords
37	Can add people	13	add_people
38	Can change people	13	change_people
39	Can delete people	13	delete_people
40	Can add people photos	14	add_peoplephotos
41	Can change people photos	14	change_peoplephotos
42	Can delete people photos	14	delete_peoplephotos
43	Can add battle tag	15	add_battletag
44	Can change battle tag	15	change_battletag
45	Can delete battle tag	15	delete_battletag
46	Can add battle groups	16	add_battlegroups
47	Can change battle groups	16	change_battlegroups
48	Can delete battle groups	16	delete_battlegroups
49	Can add grouped battles	16	add_groupedbattles
50	Can change grouped battles	16	change_groupedbattles
51	Can delete grouped battles	16	delete_groupedbattles
52	Can add battle groups	17	add_battlegroups
53	Can change battle groups	17	change_battlegroups
54	Can delete battle groups	17	delete_battlegroups
55	Can add suggested links	18	add_suggestedlinks
56	Can change suggested links	18	change_suggestedlinks
57	Can delete suggested links	18	delete_suggestedlinks
58	Can add banned ips	19	add_bannedips
59	Can change banned ips	19	change_bannedips
60	Can delete banned ips	19	delete_bannedips
61	Can add messages	20	add_messages
62	Can change messages	20	change_messages
63	Can delete messages	20	delete_messages
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$0DJDRLfPA6Bt$f6TAaeBsifgd4A3N89OXLqJU2obYyP8n1i9yJek8AxE=	2018-06-16 18:39:01.46012+03	t	admin			ivalinml@gmail.com	t	t	2018-04-02 23:22:02.460785+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	search	battle
2	admin	logentry
3	auth	permission
4	auth	group
5	auth	user
6	contenttypes	contenttype
7	sessions	session
8	search	countries
9	search	battle_participants
10	search	battleparticipants
11	search	battlephotos
12	search	countriescoords
13	search	people
14	search	peoplephotos
15	search	battletag
16	search	groupedbattles
17	search	battlegroups
18	search	suggestedlinks
19	search	bannedips
20	search	messages
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-04-02 21:29:15.40611+03
2	auth	0001_initial	2018-04-02 21:29:16.210018+03
3	admin	0001_initial	2018-04-02 21:29:16.373709+03
4	admin	0002_logentry_remove_auto_add	2018-04-02 21:29:16.394033+03
5	contenttypes	0002_remove_content_type_name	2018-04-02 21:29:16.41555+03
6	auth	0002_alter_permission_name_max_length	2018-04-02 21:29:16.421167+03
7	auth	0003_alter_user_email_max_length	2018-04-02 21:29:16.432489+03
8	auth	0004_alter_user_username_opts	2018-04-02 21:29:16.440492+03
9	auth	0005_alter_user_last_login_null	2018-04-02 21:29:16.465887+03
10	auth	0006_require_contenttypes_0002	2018-04-02 21:29:16.467376+03
11	auth	0007_alter_validators_add_error_messages	2018-04-02 21:29:16.474885+03
12	auth	0008_alter_user_username_max_length	2018-04-02 21:29:16.586131+03
13	auth	0009_alter_user_last_name_max_length	2018-04-02 21:29:16.609338+03
15	sessions	0001_initial	2018-04-02 21:29:16.846459+03
21	search	0001_initial	2018-04-05 01:41:28.217282+03
22	search	0002_battleparticipants	2018-04-05 01:41:28.393701+03
23	search	0003_battlephotos	2018-04-05 19:10:34.073884+03
24	search	0004_battlephotos_used_as	2018-04-05 19:14:10.187583+03
25	search	0005_auto_20180414_0016	2018-04-14 00:17:09.369075+03
26	search	0006_countriescoords	2018-05-27 23:51:33.097984+03
27	search	0007_auto_20180531_0139	2018-05-31 01:39:46.717578+03
28	search	0008_people	2018-06-06 22:33:57.831351+03
29	search	0009_auto_20180606_2300	2018-06-06 23:01:37.22606+03
30	search	0010_peoplephotos	2018-06-08 00:57:57.66013+03
31	search	0011_battletag	2018-06-10 13:36:03.008678+03
32	search	0012_battlegroups	2018-06-10 18:36:03.977692+03
33	search	0013_auto_20180610_1844	2018-06-10 18:44:11.448272+03
34	search	0014_auto_20180610_1846	2018-06-10 18:47:10.061963+03
35	search	0015_battletag_in_a_group	2018-06-10 19:05:48.021127+03
36	search	0016_battletag_description	2018-06-12 00:09:40.218717+03
37	search	0017_suggestedlinks	2018-06-14 11:49:10.657554+03
38	search	0018_bannedips	2018-06-15 19:20:40.903757+03
39	search	0019_messages	2018-06-15 19:29:58.07505+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: search_bannedips; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_bannedips (ip_addr, banned_on) FROM stdin;
\.


--
-- Data for Name: search_battle; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_battle (battle_id, battle_name, starting_date, ending_date, description, result, total_strength, total_losses, real_location, coord_top, coord_left, size_width, size_height) FROM stdin;
jpcn130837	Битка за Шанхай	1937-08-13	1937-11-26	Това е първата от общо 22 масови битки между Националната китайска революционна армия и Империалната японска армия във втората Китайско-японската война. Наречен „Сталинград на Яндзъ“, конфликтът е един от най-кървавите в цялата война. Военни сблъсквания между Китай и Япония без официално обявяване на война започват още през 1931г., но инцидентът на моста Марко Поло (7 – 9 юли 1937г.) влошава отношенията между двете страни и предизвиква началото на японската инвазия в Китай. Самата битка продължава 3 месеца и се води в Шанхай, околните села и на бреговете на р. Яндзъ. Военната техника на китайците се състояла предимно от малкокалибрени оръжия и не можела да се мери с японската вълна от военноморски и въздушни атаки. Главната цел на китайската отбрана е била да забави японските войски и да осигури време на китайското правителство, чиято задача била да привлече вниманието на западните сили на своя страна. Това завършва с неуспех и Китай губи значителна част от военните си сили. Битката може да се раздели на три части: Първата част продължава от 13 до 22 август и се състои от опити на революционната армия да отстрани японски войски от Шанхай. Втората част продължава от 23 август до 26 октомври, като през този период японците осъществяват своя десант на р. Яндзъ и битката прераства в азиатски вариант на Сталинград. Последният период продължава от 27 октомври до 26 ноември и включва отстъплението на китайската армия и последвалите боеве по пътя към тогавашната столица – Нанкин.	Японска победа	1000000	309493	Шанхай, Китай	\N	\N	\N	\N
jpcn011237	Битка за Нанкин 	1937-12-01	1937-12-13	След китайския разгром в Шанхай, привържениците на японската експанзия увеличават влиянието си в армията и на 1 декември бива авторизирана кампания за нападение на китайската столица Нанкин. Задачата е дадена на ген. Иване Мацуи, командира на японските войски в централната китайска област. Мацуи е убеден, че превземането на града ще доведе до неизбежната абдикация на Китай и ще завърши втората Китайско-японска война. Китайският Лидер Чан Кайшъ назначава Танг Шенджи за защитник на града и командир на Нанкинския гарнизон, набързо сглобена армия от военнослужещи и оцелели от битката в Шанхай. Японците прекосяват пътя между двата града с поразяваща скорост и на 9 декември достигат последната отбранителна линия. На следващия ден Мацуи стартира безмилостна офанзива и градът пада след по-малко от 48 часа. Танг нарежда изпълняването на съгласувана атака срещу японската обсада, но изтощените китайски войници, осъзнавайки безсмислеността на отбраната, захвърлят оръжията и униформите си в опит да се слеят с гражданското общество и да бъдат пощадени от японците. Последвалото Нанкинско клане представлява едно от най-шокиращите военни престъпления в цялата война. В период от 6 седмици жителите на града стават жертви на масови убийства и изнасилвания, като общият брой на загиналите е между 40 000 и 300 000. Събитието силно опетнява репутацията на Япония в очите на целия свят.	Японска победа	300000	51953	Нанкин, провинция Дзянсу, Китай	\N	\N	\N	\N
jpcn240338	Битка за Тайержуанг	1938-03-24	1938-04-07	Битката за Тайержуанг бележи първата китайска победа във втората Китайско-японска война и последвалото унижение на японската армия. Тогава Тайержуанг е бил малък град североизточно от Сюджоу, а в днешно време е един от шестте района на град Заожуанг. Японският план включва превземането на Сюджоу, но не предвижда намеренията на генералите Ли Цунжен и Бай Чонгкси да обкръжат японските войски в Тайержуанг. Японците правят грешката да игнорират неподозрителните „фермери“ в областта, на които Ли Цунжен нарежда да отрежат противниковите комуникационни линии. Впоследствие японците не получават достатъчно провизии. На 29 март малка група японски войници правят опит да прокарат тунел под стените на Тайержуанг с цел да превземат града отвътре, но национални защитници ги залавят и убиват. След седмица от ожесточени единични боеве японците решават да атакуват фронтално, но не предвиждат по-многобройните китайски войски. На 6 април масово китайско обкръжаване принуждава нападателите да отстъпят. Китайската стратегия е шокираща: Множество войници са въоръжени единствено с мечове, а други връзват гранати или динамит към жилетките си и се самовзривяват в близост до японските танкове. Подобни саможертвени атаки са резултат от липсата на противотанкови оръжия. Китайците претърпяват тежки загуби и в края на битката успяват да заловят само 719 японски войници, но победата успява да приповдигне духа им и опровергава идеята за непобедимостта на японската заплаха.	Китайска победа	305000	31198	Тайержуанг, провинция Шандун, Китай	\N	\N	\N	\N
jpcn110638	Битка за Ухан 	1938-06-11	1938-10-27	Битката за Ухан, още известна като защитата на Ухан, е едно от най продължителните военни сражения в ранния стадий на Китайско-японската война. След превземането на Нанкин и последвалото Нанкинско клане, националистите изоставят защитата на града и предприемат мерки за преместване на китайската столица в Чунцин. Поради множество проблеми в транспортните системи опитът е неуспешен и Ухан е провъзгласен за преждевременна столица заради икономическото и индустриалното му значение. От японската страна империалните войски са изтощени след многобройните кампании в Китай и държавната хазна е силно ощетена от военната икономика и средствата, вложени в конфликтите със СССР на север. Поради това император Хирохито изказва необходимостта от финален, решителен удар срещу Ухан, който да принуди окончателната капитулация на Китай. Битката е предходена от 2 японски въздушни атаки и отварянето на дигите на р. Хуанхъ от китайците с цел забавяне на противника. Последвалото наводнение убива ок. 700 000 цивилни. Самата битка продължава 4 месеца и 16 дни и се води в областите северно и южно от р. Яндзъ, планинските райони около град Хуанган и накрая в град Гуанджоу. На юг японците последователно завземат Дзюдзян (26 юли) и Ручан (24 август), а на север – Тай (3 август), Тяндзя (29 август) и Хуанбо (24 октомври), но претърпяват тежки загуби в Уандзялин след обкръжаване от китайците под ръководството на Ксюе Юи, като само 1500 души се измъкват. Въпреки това японците достигат Ухан в края на октомври и Чан Кайшъ решава да отстъпи на юг, изоставяйки града. Накрая китайците губят 400 000 души, но значително забавят японската офанзива.	Японска победа	1350000	540000	Ухан, Хубей и провинциите Анхуей, Хънан и Дзянси, Китай	\N	\N	\N	\N
jpcn170339	Битка за Нанчан 	1939-03-17	1939-05-09	След победата в Ухан, градът е преустроен като база за единадесетата армия на Империалните японски войски. Нанчан е следващата цел, тъй като служи като западна гара на жп-линията Шанхай-Кунмин, основна връзка между третата и деветата военни зони на Китайската национално-революционна армия. Наред с това градът притежава и военновъздушни бази, които застрашават устроените японски снабдителни маршрути по р. Яндзъ. Малко преди началото на кампанията китайците успяват да съберат армия от 200 000 души начело с ген. Ксюе Юи, но липсата на добра организация води до лоша подготовка за офанзивата. Японците стартират атаката си на 20 март 1939г. начело с ген. Ясуд Окамура, като военната им техника се състои от тежка артилерия и токсични газове. Китайската отбрана е потушена и японските войски достигат западната порта на Нанчан на 26 март. Войските на Ясуд Окамура са подкрепени от отделен полк, атакуващ от север. Градът пада на следващия ден, но китайски войски в Дзянси решават да предприемат контраатака. В края на април част от японските сили в Нанкин са преместени и китайците стартират изненадваща атака на 21 април, последвана от 5-дневно настъпление към Нанкин. На 27 април японците отвръщат на офанзивата и нападат южните противникови войски. В следващата седмица и двете страни заемат защитни позиции и битката остава в застой. Надявайки се на бърз край на конфликта, Чан Кайшъ нарежда градът да бъде превзет до 5 май, но след ожесточени боеве и множество загуби китайците са принудени да отстъпят. Изтощените японци не предприемат преследване, но успяват да задържат града и да усилят контрола си в Дзянси.	Японска победа	320000	75328	Нанчан, провинция Дзянси, Китай	\N	\N	\N	\N
jpcn170939	Първа битка за Чанша 	1939-09-17	1939-10-06	Битката представлява първият от общо 4 опита за превземане на град Чанша от японците. Наред с това е и първата битка в Китайско-японската война, която попада в периода на Втората световна. По това време войната между двете страни е в застой, като китайците успяват частично да възвърнат военните си сили, докато японците претърпяват загуба срещу СССР в битката при Халхин Гол и са допълнително обезкуражени от сключения пакт Рибентроп-Молотов между съюзничката Германия и противниковия Съветски съюз. Освен тактически предимства, успешното нападение над Чанша би приповдигнало и духа на японските войници. Офанзивата е стартирана на 17 септември 1939г. 101-ва и 106-та дивизии започват настъпление на запад срещу Чанша в съседната провинция Хунан, докато 3-та, 6-та, 13-та и 33-та дивизии завладяват северните части на провинцията и оказват допълнителен натиск на града. Японците обаче проникват твърде на запад и срещат китайска контраатака, която ги изтласква на изток. На 19 септември японските войски атакуват китайските защитни позиции с токсични газове, а на 23 септември 6-та и 13-та дивизия продължават по р. Милуо под прикритието на артилерийски обстрел. На 29 септември авангардните войски на 6-та дивизия достигат покрайнините на Чанша, но претърпяват тежки загуби и са принудени да отстъпят. На 3 октомври генерал Ксюе Юи нарежда контраатака срещу японците южно от град Юъян. До 6 октомври японските войски край Чанша са претърпели над 40 000 загуби и са принудени да отстъпят. До 10 октомври китайските сили си възвръщат всички изгубени територии в северен Хунан, южен Хубей и северен Дзянси. Чанша е първият голям китайски град, който успешно отблъсква японска атака.	Китайска победа	340000	80000	Чанша, провинция Хунан, Китай	\N	\N	\N	\N
jpus071241	Нападение над Пърл Харбър 	1941-12-07	1941-12-07	Нападението над Пърл Харбър е изненадваща японска атака над американската военноморска база Пърл Харбър на о. Хонолулу, Хавай. Първоначалният замисъл на нападението е предотвратителна мярка срещу навлизането на американския тихоокеански флот в югоизточна Азия, където Япония провежда множество военни кампании срещу британски и холандски колонии. Атаката започва на 7 декември 1941г. в 7:48 часа сутринта. Базата е внезапно нападната от 353 японски самолета, включително изтребители, бомбардировачи и торпедоносци, разпределени в 2 вълни. Нанесени са щети върху всички 8 американски кораба в базата, като 4 от тях са потопени. Наред с това японците повреждат 3 крайцера, 3 разрушителя, минен заградител и унищожават 188 самолета. Общо 2403 американци загиват в нападението и още 1178 са ранени. От японската страна загубите са леки: 29 свалени самолета, 5 унищожени малки подводници и убити 64 души. Атаката е предприета без официално обявяване на война, което не било намерението на адмирал Ямамото. Токио предава съобщението на японското посолство във Вашингтон, но транскрибирането отнема твърде много време и посланикът успява да го достави едва час след началото на атаката. Поради това нападението шокира американското население и САЩ обявяват война на Япония още на следващия ден, а на 11 декември Германия и Италия обявяват война на САЩ. Събитието слага край на политиката на антиинтервенционизма и причинява включването на американците във Втората световна война.	Японска победа	25000	2399	Пърл Харбър, Хонолулу, Хавай, САЩ	\N	\N	\N	\N
jpuk081241N1	Японска окупация на Хонг Конг 	1941-12-08	1941-12-25	Японската окупация на Хонг Конг е един от първите военни конфликти в тихоокеанския фронт по време на Втората световна война. Атаката започва на същата сутрин като нападението над Пърл Харбър и, също като него, е предприета без официално обявяване на война. Неподготвеният гарнизон в Хонг Конг се състои от британски, индийски и канадски военни части наред с китайски военнослужещи извън територията. Великобритания започва да подозира японската заплаха още с прекъсването на англо-японския съюз през 20-те години, а с настъпването на Китайско-японската война защитата на Хонг Конг се оказва непрактична задача. Преди атаката колонията се брани от по-малко от 15 000 души. Японците бързо прегазват защитните линии и до 13 декември всички британски войници са се оттеглили на о. Хонг Конг. Още в началото на нападението британците губят малкото си военни самолети. Японците последователно настояват 3 пъти за капитулация на противника, на 13, 15 и 17 декември, но получават отказ всеки път. На 19 декември японците навлизат в центъра на острова и разполовяват британската защита, а на 20 декември вече контролират западната половина на града. В следващите дни японците извършват масови убийства на граждани, най-жестоко от които е измъчването и убийството на 60 души в болницата в колежа „Св. Стефан“, включително ранени войници и медицински сестри. На 25 декември, известен днес като „Черната Коледа“, ген. Марк Айтисън Йънг се предава на третия етаж на хотела „Полуостров Хонг Конг“. В следващите дни очевидци описват масови убийства и изнасилвания на местното население от японски войници.	Японска победа	44264	2788	Хонг Конг	\N	\N	\N	\N
jpus070142	Битка за Батаан 	1942-01-07	1942-04-09	Битката за Батаан представлява най-ожесточеният период от японската кампания за завладяване на Филипините. Офанзивата започва на 8 декември – само ден след нападението над Пърл Харбър. Съкрушителният удар върху американския флот осигурява необходимото на японците време за превземане на о. Лусон наред с още няколко острова във Филипинския архипелаг. До 7 януари единствените останали Съюзнически укрепления в цяла Югоизточна Азия са на о. Батаан и п-в Корегидор. Американският командир на съюзническите части в региона Дъглас Макартър организира отбрана срещу нахлуващите към о. Батаан японски войски. Въпреки недостига на средства обединените американски и филипински военни части оказват съпротива в продължение на 3 месеца, което значително забавя японската инвазия на източноазиатските територии. Японците достигат западния бряг на Батаан на 22 януари, но са отблъснати от защитниците. Това налага изпращането на японски артилерийски части в островите, които преобръщат хода на битката. На 12 март Макартър, семейството му и още няколко висши офицери отплават за о. Минданао, а Макартър по-късно пристига в Австралия, където предава известното си съобщение на филипинското население с обещанието „Ще се върна“. В края на март 14-тата армия на генерал Масахару Хома увеличава броя си и японците се подготвят за втора, финална атака срещу Батаан. На 3 април съюзническите защитни линии са подложени на тежък артилерийски обстрел и продължителни въздушни нападения. Изтощените американци и филипинци се предават на 9 април, като общо са пленени 76 000 души. Последвалият Батаански марш на смъртта представлява мъчително прехвърляне на затворниците от Батаан до Сан Фернандо и от жп-гарата в Капас до лагера О‘Донел, като общото разстояние е над 100км. Според някои източници броят на загиналите достига 18 650.	Японска победа	195000	13107	п-в Батаан, Манилски залив, Филипини	\N	\N	\N	\N
jpnl270242	Битка в Яванско море	1942-02-27	1942-02-27	Битката в Яванско море е един от най-големите военноморски конфликти в ранния етап на Втората световна война. Обединен флот от холандски, американски, британски и австралийски кораби претърпява тежка загуба срещу японския империален флот. С японската инвазия на Нидерландска Индия съюзниците правят множество неуспешни опити да спрат нападението, сред които са битките за Палембанг (13-15 февруари) и в протока Бадунг (18-20 февруари). Още преди началото на битката в Яванско море лошата координация и нанесеният удар от предишните загуби драстично намаляват съюзническите шансове за победа. Японският флот е по-многоброен и качеството на империалните тежки крайцери е превъзходно в този етап на войната. Поради лошата метеорологична обстановка японските военновъздушни сили не могат да се присъединят в битката и съюзниците получават въздушно превъзходство, но времето повлиява на комуникациите им. Британският крайцер Ексетър е единственият съюзнически кораб с радар. Битката продължава 7 часа и включва многобройни неуспешни опити на съюзниците да достигнат противниковите ескортни кораби, претърпявайки голям брой жертви всеки път. В началото на битката Ексетер е повреден и отплава, а разрушителите Кортенар и Електра са потопени след масова атака с торпеда. В ок. 18:00 часа съюзническият флот се разпокъсва и се оттегля под прикритието на димна завеса от американските разрушители. В 21:25 разрушителят Юпитер потъва при удар с мина, а след повторна среща с японците холандските крайцери Ява и Де Ройтер са потопени, а адмирал Карел Дорман е убит. Накрая остават само крайцерите Перт и Хюстън, които се оттеглят на следващия ден. Японците успешно завземат о. Джава и погромът нанася изключително тежък удар върху холандския флот.	Японска победа	8400	2336	Яванско море	\N	\N	\N	\N
jpus050542	Битка за Корегидор 	1942-05-05	1942-05-06	Битката за Корегидор представлява кулминацията на японската инвазия на Филипините, както и една от последните битки на кампанията. След падането на Батаан на 9 април 1942г. Корегидор остава единственото съюзническо укрепление в цяла Югоизточна Азия, както и единственото препятствие, делящо японците от пълен контрол над залива Манила. Наред с това Корегидор е най-добре защитеното укрепление на Филипините заради огромната система от подземни тунели, многобройните минохвъргачки и противовъздушни оръжия. Преди превземането на Батаан Корегидор е подложен на продължителна обсада, по време на която бранителите са принудени да се хранят с труповете на убити коне. След 9 април артилерийският обстрел и бомбардировките срещу укреплението се засилват (пуснати са общо 1701 бомби). Японците уверено пропагандират на населението в империята, че Корегидор ще падне бързо, но защитата успешно отблъсква противника до края на месеца. На 5 май е предприета финална офанзива срещу обединените американци и филипинци. Малко преди полунощ японците започват своя десант на острова и въпреки големия брой жертви въоръжените с гранатомети войници успешно изтласкват защитниците. Американците предприемат контраатака, но японски снайперисти рязко увеличават риска на отбраната. От своя страна японците също срещат проблем: голяма част от мунициите не са пренесени на острова и множество войници са принудени да се бият единствено с щикове. В 9:30 сутринта на 6 май японски танкове достигат острова и ген.-лейт. Уейнрайт се предава с цел да спаси 1000-та ранени в тунела Малинта. Японската победа бележи падането на Филипините, но цялата кампания отнема 3 месеца повече от предвиденото и значително забавя военните действия в тихоокеанския театър.	Японска победа	88000	1700	о.Корегидор, Манилски залив, Филипини	\N	\N	\N	\N
jpus040642	Битка при Мидуей 	1942-06-04	1942-06-07	Битката при Мидуей е един от най-масовите военни конфликти между САЩ и Япония и преобръща хода на войната в тихоокеанския театър. След бомбардировката „Дулитъл“ над Токио на 18 април 1942г. японците са шокирани от достъпността на източноазиатските територии за американските бомбардировачи. Адмирал Ямамото цели да неутрализира американските самолетоносачи чрез второ нападение над Пърл Харбър, но засилените военновъздушни сили на Хавайските острови правят тази стратегия твърде рискована. Затова Ямамото обръща вниманието си към атола Мидуей, който не само би послужил като опорен пункт за бъдещи операции срещу Хавай, но и е извън обсега на американските самолети. Изпратени са 21 японски кораба, сред които 4 тежки самолетоносача. Американците обаче разшифрират закодираната заповед за атака и успяват да организират своевременна защита, поставяйки своя флот 560 км североизточно от атола. На 3 юни американски бомбардировачи неуспешно нападат японските сили, разположени 350 км на югозапад. Истинската битка започва на 4 юни, когато японските самолети стартират бомбардировката над Мидуей. Вълна от американски торпедоносци е почти унищожена, но час по-късно група от 36 пикиращи бомбардировачи успешно потопява 3 японски самолетоносача и 1 тежък крайцер. Японците потопяват самолетоносача „Йорктаун“, но огромната загуба на кораби ги принуждава да започнат своето отстъпление в следващите дни, без да достигнат сушата на атола. Американската победа представлява първата масова съюзническа победа в тихоокеанския театър и силно ощетява японската тихоокеанска кампания.	Американска победа	60000	3564	острови Мидуей, Северен Тих океан	\N	\N	\N	\N
jpus180443	Операция „Отмъщение“ 	1943-04-18	1943-04-18	Операция „Отмъщение“ е американско военно действие с цел убийството на японския адмирал Исороку Ямамото, главния заподозрян от американското правителство в нападението над Пърл Харбър. На 14 април 1943г. военноморското разузнаване на САЩ дешифрира японски съобщения, които разкриват намеренията на Ямамото да присъства на инспекция на японските военновъздушни части на Соломоновите острови. Американците откриват, че Ямамото ще лети на 18 април от Рабаул до летището Балалее край о. Бугенвил в бомбардировач G4M, придружен от още един бомбардировач и 6 военноморски изтребителя. Мисията за убийството на адмирала е авторизирана на 17 април. Избрани са 18 P-38G изтребителя от 339-та ескадрила и 347-ма въздушна група, като пилотите не са информирани, че Ямамото е мишената на атаката. С цел избягване на радарите и японския персонал на Соломоновите острови, мисията налага заобиколен полет югозападно от осровите, последван от обратен полет. Самолетите излитат на 18 април в 7:25 сутринта от о. Гуадалканал, като два от тях са принудени да се оттеглят поради технически неизправности. Въпреки предупреждения на местни командири за потенциална атака бомбардировачите на Ямамото излитат заедно с изтребителите придружители, разпределени в две V-формации от по 3 самолета. Адмирал Митчел умело навигира групата и американците достигат Ямамото 1 минута по-рано от очакваното. И двата бомбардировача са свалени, първият от които, носещ Ямамото, се разбива в джунглата на о. Бугенвил. Вторият, носещ адмирал Матоме Угаки, се разбива във водата. Угаки и още двама оцелели са спасени по-късно. Тялото на Ямамото е намерено на 19 април с две изходни рани от куршуми, една от които е над дясното му око. Става ясно, че адмиралът е убит още преди самолетът да се разбие. Смъртта на Ямамото шокира японското население и нанася силен удар върху военноморските сили на империята.	Американска победа	60	20	о.Бугенвил, Папуа Нова Гвинея	\N	\N	\N	\N
jpus150644	Битка за Сайпан 	1944-06-15	1944-07-09	След успешното превземане на Соломоновите, Гилбъртовите и Маршаловите острови през 1943-1944г., съюзниците се насочват към японските територии на Марианските острови, островите Палау и Филипините. На 13 юни 1944г. започва масова бомбардировка на о. Сайпан с участието на 15 линейни кораба. Атаката изненадва японското управление, което до този момент е очаквало нападение на юг. Американците осъществяват своя десант на острова на 15 юни в 7:00 сутринта. За 2 часа са приземени 8000 пехотинци. Японците отвръщат с артилерийски и картчен обстрел, но към полунощ американците вече разполагат с брегови плацдарм с ширина 1 км и дължина 10 км. След погрома в битката във Филипинско море гарнизоните на острова остават без подкрепления, но японците не се предават и използват пещерите на вулканичния планински релеф на централен Сайпан за дневно укритие и среднощни атаки. Американците пречистват пещерите с огнехвъргачки и картечници, но претърпяват голям брой жертви. Затова развиват тактика, в която един батальон защитава територията докато други два заграждат японците. На 7 юли японското положение е вече безнадеждно и ген. Саито нарежда финална банзаи-атака, в която участват последните 3000 войници и всички ранени. Американците губят 2 батальона от 105-ти пехотен полк (650 души), но за сметка на това убиват над 4300 японци. На 9 юли островът е вече под съюзнически контрол. Оцелелите японски командири се самоубиват. Накрая 75% от цялата японска войска на острова (32 000 души) загиват. Американците също дават голям брой жертви – 2949 убити и над 10 000 ранени. Наред с тях умират и ок. 7000 японски цивилни на острова, голяма част от които се самоубиват. Победата е една от най-важните в целия тихоокеански театър, тъй като базата в Сайпан осигурява пряк достъп на съюзниците до Филипините, останалите Мариански острови, и най-вече Япония.	Американска победа	103000	32426	о.Сайпан, Мариански острови	\N	\N	\N	\N
jpcn220644	Защита на Хънян 	1944-06-22	1944-08-08	Защитата на Хънян представлява най-продължителната отбрана на единствен град в цялата Китайско-японска война. След четвъртата поредна атака срещу Чанша и успешното превземане на града на 19 юни 1944г., японците се насочват към Хънян, в който се намира летището, използвано като опорна точка за американски бомбардировки над Япония. Загубата на града би отворила пътя към китайската военна столица Чунцин, но тъй като 15 дивизии са изпратени в Бирма на помощ на Джоузеф Стилуел, китайците успяват да съберат армия от едва 17 000 души. Освен своята малочисленост защитниците срещат още един проблем: японците превземат Чанша само 16 дни след пристигането на войските в Хънян, което едва им осигурява време да евакуират жителите на града. Комбинираните 68-ма и 116-та дивизии (общо 30 000 войници) стартират своята офанзива на 22 юни, атакувайки със запалителни бомби и артилерийски огън. Китайците удържат в продължение на 2 дни, но липсата на муниции ги принуждава да се бият в опасна близост до противника. След седмица ожесточени боеве ген. Йокояма прекъсва атаката на 2 юли. На този етап Хънян е почти изцяло унищожен от продължителните бомбардировки. На 11 юли японците продължават офанзивата, но не постигат големи успехи. Китайците обаче са вече почти лишени от муниции и посрещат нападателите с гранати. До средата на месеца жертвите са толкова много, че японците използват купчините тела, за да изкачат стените на града. На 4 август се включват още 3 дивизии и японската армия достига 110 000 души. Японците навлизат в града и се съгласяват да третират оцелелите хуманно. Китайците се предават на 8 август. Въпреки победата Япония губи значително количество средства и не успява да придобие допълнителни територии в провинцията заради активното участие на партизани.	Японска победа	127000	26600	Хънян, провинция Хунан, Китай	\N	\N	\N	\N
jpus150944	Битка за Пелелиу 	1944-09-15	1944-11-27	Битката за Пелелиу е продължението на американската кампания за превземането на Марианските острови и островите Палау. След успехите на юг и устойването на постоянни бази на Марианските острови САЩ се насочва към островите Палау, на които са устроени множество японски военни летища, застрашаващи кампаниите на юг. След погрома на о. Сайпан японците драстично променят тактиката си, разчитайки вече на концентрирана защита във вътрешността на територията, докато американската тактика остава непроменена. Американците осъществяват десант на 15 септември и веднага са посрещнати от артилерийски обстрел. Японската отбрана се оказва непробиваема и до края на деня американците владеят само 3,2-километрова плажна ивица. На втория ден завземат летището на острова, но претърпяват голям брой загуби заради високите температури (до 46°C). В следващите дни летището служи като опорен пункт за американските военноморски самолети, които на 26 септември бомбардират японските укрепления в пещерите. Кулминацията на битката се състои в областта, наречена от американските войници „Билото Кървав нос“. Японците умело използват терена и обсипват американците със снайперистки огън. Някои батальони губят над 70% от войниците си. В защитното укрепление на кап. Поуп войнците са принудени да се бият с ножове заради липсата на муниции. След 6 дни ожесточени боеве части на 81-ва пехотна дивизия се приземяват на острова и спомагат за отблъскването на японците. Американците използват булдозери и танкове с огнехвъргачки, за да притиснат противника на север. На 24 ноември командирът на японските войски Кунио Накагава извършва ритуално сепуку и на 27 ноември островът е под американски контрол. Битката дава най-големия брой американски жертви по време на десант в цялата война и стратегическото й значение се оспорва и днес.	Американска победа	58461	13031	о.Пелелиу, острови Палау	\N	\N	\N	\N
jpus090145	Битка за Лусон 	1945-01-09	1945-08-15	След американските победи в битките за островите Лейте и Миндоро САЩ се подготвят за нападение на третия главен остров във Филипинския архипелаг – Лусон. След превземането на Миндоро американците се сдобиват с опорен пункт южно от Лусон и в голяма близост до острова, но ген. Макартър намира това за недостатъчно и възнамерява да премести отрядите си в по-северната позиция Лингайен. Американците бомбардират южен Лусон с цел да заблудят японците, че атаката идва от юг. Това не попречва на ген. Ямашита да устрои ефикасна отбрана на острова. Десантът започва на 9 януари 1945г., когато флот от 70 кораба навлиза в залива Лингайен. Японците отвръщат с продължителна камикадзе вълна и потопяват ескортен самолетоносач, разрушител и няколко по-малки кораба. За по-малко от седмица американците приземяват 175 000 души на острова, които до 23 януари навлизат във вътрешността на територията без значителна съпротива. На 23 януари двете страни започват битка край военното летище „Кларк“, която продължава до края на месеца. Американците побеждават и продължават настъплението към Манила. Междувременно се осъществява втори десант на 15 януари, на 72 км югозападно от Манила. На 31 януари и 3 февруари напредват съответно два полка на 11-та въздушнодесантна войска и 1-ва кавалерийска дивизия. Вечерта градът е вече обкръжен и започва битката за Манила, последната масова битка в кампанията за възвръщане на Филипините. Битката за Лусон бележи една от най-тежките загуби на Япония в цялата война – над 200 000 убити и почти 10 000 заловени. Със загубата на Филипините империята губи и контрол над целия югозападен Тих океан, включително търговските пътища, осигуряващи на страната нужния във военно време петрол. Погромът предвещава съдбата на Япония в края на Втората световна. 	Съюзническа победа	555000	216175	о.Лусон, Филипини	\N	\N	\N	\N
jpcn060445	Битка за западен Хунан 	1945-04-06	1945-06-09	Битката за западен Хунан е последният масов военен конфликт в Китайско-японската война, както и един от последните в китайския фронт на Втората световна. На този етап враждата между двете страни е продължила почти 8 години. През 1941-1943г. се наблюдава период на застой във военните действия, а през 1944г. японците стартират операция „Ичи-Го“, която им осигурява значителни територии в провинциите Хънан, Хунан и Гуанси. Победата обаче предоставя много малко реални стратегически предимства. Липсата на гориво принуждава японските войници да прекосяват пътя пеша, а многобройните срещи с партизани бързо ги изтощават. На 4 февруари 1945г. първите съюзнически камиони пристигат в Кунмин по новоизградения път „Стулуел“ и китайците започват да получават по 50 000 тона петрол ежемесечно. През април е планирана масова контраатака. Японците изграждат чрез принудителен труд две магистрали до Шаоян, съответно от Хенян и от Сянтан, събирайки армия от общо 80 000 души. Китайците от своя страна разпределят 110 000 войници в 20 дивизии само в Хунан. Японците лесно превземат покрайнините на провинцията, но не предвиждат тактическите предимства на планинския терен за китайците, които отвръщат със засади и обстрел от минохвъргачки. Наред с това китайците добиват и превъзходство във въздуха, тъй като притежават общо 400 самолета в 5 въздушни групи. Японците са принудени да отстъпят, а китайците предприемат преследване и си връщат голяма част от загубените през 1944г. територии. Япония губи над една трета от армията си и влиянието й в китайския фронт на Втората световна е силно ощетено.	Съюзническа победа	280000	34828	западен Хунан, близо до Ичан, Китай	\N	\N	\N	\N
jpus060845	Атомни бомбардировки на Хирошима и Нагасаки 	1945-08-06	1945-08-09	Двете атомни бомби „Малчугана“ и „Дебелака“, пуснати съответно над японските градове Хирошима и Нагасаки, все още остават единствените атомни оръжия в историята, използвани във военен конфликт. След капитулацията на Германия на 8 май 1945г. Съюзниците се подготвят за ожесточена и кървава инвазия на Япония. Многобройните въздушни нападения срещу страната, започнали още през 1942г., водят до унищожението на 67 японски града и смъртта на поне 240 000 души, но не слагат край на войната в източноазиатския фронт. Съюзниците настояват за безусловна капитулация на Япония в Постдамската декларация на 26 юли 1945г. с предупреждението, че отказът би довел до „незабавно и пълно унищожение“. Японците игнорират заплахата и САЩ прибягват до употреба на новополучените при проекта Манхатан атомни бомби. Първоначалният списък на мишените включва 5 града: Хирошима, Кокура, Йокохама, Ниигата и Киото, който по-късно бива премахнат от списъка по молба на Хенри Л. Стимсън. На негово място е сложен Нагасаки. Произведени са 2 бомби за атаката: артилерийската уранова бомба „Малчугана“ и имплозионната плутониева бомба „Дебелака“. Бомбите са пренесени от американски бомбардировач B29 „Суперфортрес“ от о. Тиниан до Марианските острови. Американците извършват бомбардировката със съгласието на Великобритания, изисквано по договора в Квебек. „Малчугана“ е пуснат над Хирошима на 6 август, а „Дебелака“ е пуснат над Нагасаки 3 дни по-късно. Унищожителните последици на бомбите водят до смъртта на 90-146 хил. души в Хирошима и 39-80 хил. в Нагасаки, като според някои източници общият брой на жертвите достига 226 хиляди, повечето от които са цивилни. В резултат на съкрушителната загуба на двата града и последвалото обявяване на война от СССР Япония подписва капитулацията си на 2 септември, което бележи края на Втората световна война.	Съюзническа победа	50770	180000	Хирошима и Нагасаки, Япония	\N	\N	\N	\N
jpsu120845	Битка за Мудандзян 	1945-08-12	1945-08-16	Битката за Мудандзян е една от единствените битки, водени между СССР и Япония по време на краткотрайната Съветска инвазия на Манджурия. По време на Ялтенската конференция през февруари 1945г. Йосиф Сталин изказва съгласието си Съветският съюз да обяви война на Япония до 3 месеца след капитулацията на Германия. Японците наблюдават подготовката за атака, но не очакват тя да започне преди средата на септември. Защитата на Манджурия е възложена на Квантунската армия, която в началото на войната израства в най-силната армия на японските империални военни сили, но е вече принизена до малобройна войска от едва 60 000 души. СССР от своя страна събира армия от 290 000 войници с военен опит в Европа. Съветската стратегия се състои от светкавично обкръжаване на Мудандзян, предотвратяващо отстъплението на армията на ген. Сеичи Кита. Битката за града започва на 12 август. Въпреки успешното заграждане съветските войски претърпяват значителни загуби, като 58 от 65-те танка на 257-ма бригада са унищожени. Японците също дават много жертви, губейки 900 войници на 13 август по време на засада от съветски танкове. В следващите дни японците се възползват от хълмистия терен на региона, обсипвайки противника с артилерийски обстрел. Съветските войски са принудени да завземат хълмовите укрепления едно по едно. Маршал Мерецков решава да заобиколи града и да остави офанзивата на 1-ва Червенознаменна армия, действие, което силно застрашава японската стратегия. На 16 август е стартирана последната атака срещу Мудандзян. 22-ра дивизия осъществява изненадваща атака от север и позволява на армията безопасно да прекоси реката край града. По-голямата част от японските войски изоставя града и Мудандзян пада в края на деня. Малко след това Квантунската армия се предава и военните действия окончателно приключват.	Съветска победа	345000	16391	Мудандзян, Манджурия, Китай	\N	\N	\N	\N
\.


--
-- Data for Name: search_battlegroups; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_battlegroups (group_code, glocation_left, glocation_top) FROM stdin;
1	0.249	0.64100000000000001
\.


--
-- Data for Name: search_battleparticipants; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_battleparticipants (id, strength, casualties, commander_code_id, battle_code_id, country_code_id) FROM stdin;
763	17000	7600	FX	jpcn220644	cn
764	110000	19000	IYo	jpcn220644	jp
663	700000	250000	CChe	jpcn130837	cn
664	700000	250000	CK	jpcn130837	cn
665	700000	250000	FY	jpcn130837	cn
666	700000	250000	ZZh	jpcn130837	cn
765	47561	2336	HHan	jpus150944	us
766	47561	2336	HHar	jpus150944	us
767	47561	2336	LP	jpus150944	us
768	47561	2336	PM	jpus150944	us
769	47561	2336	RG	jpus150944	us
770	47561	2336	WR	jpus150944	us
771	10900	10695	KNakag	jpus150944	jp
772	10900	10695	SIn	jpus150944	jp
667	300000	59493	HYan	jpcn130837	jp
668	300000	59493	IM	jpcn130837	jp
669	300000	59493	KH	jpcn130837	jp
670	100000	50000	TSh	jpcn011237	cn
671	200000	1953	IM	jpcn011237	jp
672	250000	20000	BC	jpcn240338	cn
673	250000	20000	GL	jpcn240338	cn
674	250000	20000	HD	jpcn240338	cn
675	250000	20000	LZ	jpcn240338	cn
676	250000	20000	PB	jpcn240338	cn
677	250000	20000	SL	jpcn240338	cn
678	250000	20000	SZ	jpcn240338	cn
679	250000	20000	TE	jpcn240338	cn
680	250000	20000	ZZi	jpcn240338	cn
681	65000	11198	SIta	jpcn240338	jp
682	65000	11198	RI	jpcn240338	jp
683	1000000	400000	BC	jpcn110638	cn
684	1000000	400000	CChe	jpcn110638	cn
685	1000000	400000	CK	jpcn110638	cn
686	1000000	400000	LZ	jpcn110638	cn
687	1000000	400000	SL	jpcn110638	cn
688	1000000	400000	XY	jpcn110638	cn
689	1000000	400000	ZF	jpcn110638	cn
690	350000	140000	KNakaj	jpcn110638	jp
691	350000	140000	NH	jpcn110638	jp
692	350000	140000	SHa	jpcn110638	jp
693	350000	140000	STa	jpcn110638	jp
694	350000	140000	YO	jpcn110638	jp
695	200000	51328	XY	jpcn170339	cn
696	120000	24000	YO	jpcn170339	jp
697	240000	40000	CChe	jpcn170939	cn
698	240000	40000	GL	jpcn170939	cn
699	240000	40000	XY	jpcn170939	cn
700	240000	40000	YSen	jpcn170939	cn
701	100000	40000	STa	jpcn170939	jp
702	100000	40000	YO	jpcn170939	jp
703	8000	2335	HK	jpus071241	us
704	8000	2335	WS	jpus071241	us
705	17000	64	CNa	jpus071241	jp
706	17000	64	IYa	jpus071241	jp
707	17000	64	MF	jpus071241	jp
708	1564	163	JL	jpuk081241N1	ca
709	3000	450	CCha	jpuk081241N1	cn
710	10000	1500	CM	jpuk081241N1	uk
711	10000	1500	MY	jpuk081241N1	uk
712	29700	675	MK	jpuk081241N1	jp
713	29700	675	TKurib	jpuk081241N1	jp
714	29700	675	TSa	jpuk081241N1	jp
793	280000	10640	DM	jpus090145	us
794	280000	10640	WK	jpus090145	us
795	275000	205535	TY	jpus090145	jp
722	100000	8500	DM	jpus070142	us
723	100000	8500	EK	jpus070142	us
724	100000	8500	GP	jpus070142	us
725	100000	8500	JW	jpus070142	us
726	20000	1500	VL	jpus070142	ph
727	75000	3107	MH	jpus070142	jp
734	1259	1100	CH	jpnl270242	nl
735	1259	1100	KD	jpnl270242	nl
736	4099	36	TT	jpnl270242	jp
737	10000	600	GM	jpus050542	us
738	10000	600	JW	jpus050542	us
739	10000	600	SHo	jpus050542	us
740	75000	900	MH	jpus050542	jp
741	25000	307	CNi	jpus040642	us
742	25000	307	FF	jpus040642	us
743	25000	307	RS	jpus040642	us
744	35000	3057	CNa	jpus040642	jp
824	200000	7817	HYi	jpcn060445	cn
825	200000	7817	LY	jpcn060445	cn
826	200000	7817	TE	jpcn060445	cn
745	35000	3057	IYo	jpus040642	jp
746	35000	3057	NKo	jpus040642	jp
747	20	1	JM	jpus180443	us
748	20	1	WH	jpus180443	us
749	40	19	IYa	jpus180443	jp
750	40	19	MUg	jpus180443	jp
827	200000	7817	WY	jpcn060445	cn
828	200000	7817	ZL	jpcn060445	cn
754	71000	3426	HSm	jpus150644	us
755	71000	3426	RT	jpus150644	us
756	71000	3426	CNa	jpus150644	jp
757	32000	29000	TT	jpus150644	jp
758	32000	29000	YSa	jpus150644	jp
830	1770	20	CSw	jpus060845	us
831	1770	20	FA	jpus060845	us
832	1770	20	PT	jpus060845	us
833	1770	20	WP	jpus060845	us
834	290000	7000	AB	jpsu120845	su
835	290000	7000	KM	jpsu120845	su
836	290000	7000	NKr	jpsu120845	su
837	55000	9391	SK	jpsu120845	jp
\.


--
-- Data for Name: search_battlephotos; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_battlephotos (photo_id, description, batle_code_id, used_as) FROM stdin;
default.png	\N	\N	default
thumbnail-nankin.jpg	\N	jpcn011237	thumbnail
thumbnail-wuhan.jpg	\N	jpcn110638	thumbnail
thumbnail-shanghai.png	\N	jpcn130837	thumbnail
thumbnail-taierzhuang.jpg	\N	jpcn240338	thumbnail
jpcn170339_2.jpeg	\N	jpcn170339	thumbnail
jpcn170939_1.jpg	\N	jpcn170939	thumbnail
jpuk081241N1_1.jpg	\N	jpuk081241N1	thumbnail
jpus070142_1.jpeg	\N	jpus070142	thumbnail
jpnl270242_2.jpeg	\N	jpnl270242	thumbnail
jpus050542_2.jpg	\N	jpus050542	thumbnail
jpus040642_2.jpg	\N	jpus040642	thumbnail
jpus180443_2.jpg	\N	jpus180443	thumbnail
jpus150644_1.jpg	\N	jpus150644	thumbnail
jpcn220644_3.jpg	\N	jpcn220644	thumbnail
jpus150944_1.jpg	\N	jpus150944	thumbnail
jpus090145_2.jpg	\N	jpus090145	thumbnail
jpcn060445_3.jpeg	\N	jpcn060445	thumbnail
jpus060845_1.jpg	\N	jpus060845	thumbnail
jpsu120845_2.jpg	\N	jpsu120845	thumbnail
thumbnail-pearlharbor.jpg	\N	jpus071241	thumbnail
\.


--
-- Data for Name: search_battletag; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_battletag (id, battle_year, location_left, location_top, battle_code_id, in_a_group, description) FROM stdin;
1	2018	0.26800000000000002	0.36499999999999999	jpcn130837	0	Битка за Шанхай
2	2018	0.255	0.35499999999999998	jpcn011237	0	Битка за Нанкин
3	2018	0.23499999999999999	0.28999999999999998	jpcn240338	0	Битка за Тайержуанг
4	2018	0.20999999999999999	0.38	jpcn110638	0	Битка за Ухан
5	2018	0.245	0.40000000000000002	jpcn170339	0	Битка за Нанчан
6	2018	0.20499999999999999	0.40999999999999998	jpcn170939	0	Първа битка за Чанша
7	2018	0.93200000000000005	0.53000000000000003	jpus071241	0	Нападение над Пърл Харбър
8	2018	0.19500000000000001	0.52000000000000002	jpuk081241N1	0	Японска окупация на Хонг Конг
9	2018	0.248	0.64000000000000001	jpus070142	1	Битка за Батаан
10	2018	0.19	0.95999999999999996	jpnl270242	0	Битка за Яванско море
11	2018	0.249	0.64100000000000001	jpus050542	1	Битка за Корегидор
12	2018	0.80000000000000004	0.45000000000000001	jpus040642	0	Битка при Мидуей
13	2018	0.53900000000000003	0.95999999999999996	jpus180443	0	Операция "Отмъщение"
14	2018	0.46000000000000002	0.56999999999999995	jpus150644	0	Битка за Сайпан
15	2018	0.20000000000000001	0.42999999999999999	jpcn220644	0	Защита на Хънян
16	2018	0.35999999999999999	0.75	jpus150944	0	Битка за Пелелиу
17	2018	0.252	0.63500000000000001	jpus090145	1	Битка за Лусон
18	2018	0.19	0.39000000000000001	jpcn060445	0	Битка за западен Хунан
20	2018	0.32700000000000001	0.32800000000000001	jpus060845	0	Атомна бомбардировка над Нагасаки
19	2018	0.34999999999999998	0.30499999999999999	jpus060845	0	Атомна бомбардировка над Хирошима
21	2018	0.32000000000000001	0.10000000000000001	jpsu120845	0	Битка за Мудандзян
\.


--
-- Data for Name: search_countries; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_countries (country_id, country_name, shortened) FROM stdin;
jp	Япония	Япония
us	Съединени Американски Щати	САЩ
cn	Република Китай	Китай
su	Съюз на социалистическите съветски републики	СССР
uk	Обединено кралство Великобритания	Великобритания
au	Австралия	Австралия
ph	Филипини	Филипини
nl	Холандия	Холандия
ca	Канада	Канада
\.


--
-- Data for Name: search_countriescoords; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_countriescoords (battle_year, coordinates) FROM stdin;
2018	<area shape="poly" data-key="japan" id="japan1" alt="Япония" title="Япония" href="#"  coords="4327,720,4328,734,4327,750,4323,767,4322,778,4321,794,4319,807,4314,817,4310,821,4303,826,4298,837,4299,850,4302,865,4299,878,4291,889,4279,890,4271,890,4264,890,4256,890,4250,885,4245,878,4242,872,4234,871,4228,873,4222,882,4224,893,4233,903,4234,914,4230,921,4222,930,4212,937,4202,940,4194,946,4187,954,4188,967,4186,978,4184,984,4193,991,4202,999,4211,1012,4213,1026,4210,1042,4208,1053,4206,1061,4213,1066,4220,1064,4225,1059,4229,1052,4234,1042,4241,1040,4246,1037,4247,1034,4254,1030,4262,1038,4270,1038,4281,1037,4288,1030,4272,1027,4266,1021,4260,1015,4256,1011,4250,1007,4244,1004,4240,1000,4235,997,4227,993,4223,987,4220,981,4217,976,4216,969,4220,963,4222,958,4227,954,4233,952,4240,951,4248,952,4256,956,4263,965,4269,974,4275,971,4278,968,4284,966,4290,962,4294,957,4298,954,4304,952,4310,950,4320,949,4330,948,4340,948,4348,950,4358,956,4368,964,4378,970,4392,977,4408,986,4422,994,4432,1000,4442,1009,4448,1006,4448,1004,4448,996,4449,990,4450,984,4449,978,4449,973,4451,969,4452,964,4453,960,4456,955,4460,949,4464,944,4469,936,4473,927,4479,922,4484,915,4490,912,4496,908,4500,904,4506,900,4513,898,4520,896,4529,894,4540,896,4549,896,4558,894,4564,892,4572,888,4582,886,4588,880,4592,877,4601,875,4608,871,4614,865,4620,862,4624,858,4625,854,4620,852,4614,852,4610,854,4602,855,4599,856,4595,852,4593,848,4588,845,4586,843,4580,837,4578,833,4574,827,4570,823,4569,816,4570,808,4572,800,4576,792,4579,783,4582,778,4588,770,4589,762,4584,762,4577,763,4572,770,4570,777,4560,784,4550,792,4540,798,4533,802,4520,799,4516,796,4514,788,4510,784,4502,782,4494,786,4490,788,4477,782,4469,777,4460,772,4452,769,4444,766,4431,756,4420,751,4410,744,4405,738,4399,731,4394,726,4391,720,4386,712,4382,706,4376,702,4370,698,4364,693,4361,688,4354,679,4347,672,4344,666,4341,661,4337,656,4334,651,4329,650,4321,651,4316,658,4310,664,4307,668,4306,674,4310,685,4316,696,4322,708"       />\n<area shape="poly" data-key="japan" id="japan2" alt="Япония" title="Япония" href="#"  coords="4271.000244140625,1065.0000610351562,4268.000244140625,1074.0000610351562,4266.000244140625,1082.0000610351562,4266.000244140625,1090.0000610351562,4274.000244140625,1095.0000610351562,4282.000244140625,1092.0000610351562,4288.000244140625,1090.0000610351562,4298.000244140625,1093.0000610351562,4300.000244140625,1103.0000610351562,4297.000244140625,1112.0000610351562,4296.000244140625,1120.0000610351562,4291.000244140625,1124.0000610351562,4284.000244140625,1122.0000610351562,4277.000244140625,1121.0000610351562,4270.000244140625,1118.0000610351562,4267.000244140625,1125.0000610351562,4265.000244140625,1127.0000610351562,4258.000244140625,1129.0000610351562,4255.000244140625,1124.0000610351562,4247.000244140625,1112.0000610351562,4246.000244140625,1103.0000610351562,4243.000244140625,1096.0000610351562,4237.000244140625,1092.0000610351562,4232.000244140625,1089.0000610351562,4223.000244140625,1091.0000610351562,4220.000244140625,1095.0000610351562,4220.000244140625,1108.0000610351562,4220.000244140625,1116.0000610351562,4218.000244140625,1128.0000610351562,4212.000244140625,1136.0000610351562,4204.000244140625,1142.0000610351562,4198.000244140625,1147.0000610351562,4193.000244140625,1150.0000610351562,4188.000244140625,1156.0000610351562,4188.000244140625,1167.0000610351562,4194.000244140625,1176.0000610351562,4200.000244140625,1185.0000610351562,4201.000244140625,1194.0000610351562,4201.000244140625,1204.0000610351562,4200.000244140625,1212.0000610351562,4196.000244140625,1218.0000610351562,4192.000244140625,1221.0000610351562,4183.000244140625,1224.0000610351562,4178.000244140625,1226.0000610351562,4180.000244140625,1234.0000610351562,4188.000244140625,1235.0000610351562,4198.000244140625,1235.0000610351562,4206.000244140625,1241.0000610351562,4210.000244140625,1250.0000610351562,4211.000244140625,1262,4212.000244140625,1271,4208.000244140625,1280,4202.000244140625,1291,4199.000244140625,1303,4197.000244140625,1314,4193.000244140625,1324,4190.000244140625,1336,4185.000244140625,1347,4178.000244140625,1361,4168.000244140625,1372,4164.000244140625,1386,4160.000244140625,1397,4161.000244140625,1406,4155.000244140625,1418,4148.000244140625,1428,4140.000244140625,1433,4131.000244140625,1439,4120.000244140625,1446,4114.000244140625,1453,4110.000244140625,1459,4106.000244140625,1466,4102.000244140625,1472,4098.000244140625,1482,4094.000244140625,1492,4084.000244140625,1504,4075.000244140625,1509,4064.000244140625,1514,4053.000244140625,1518,4045.000244140625,1524,4034.000244140625,1528,4027.000244140625,1533,4013.000244140625,1540,4004.000244140625,1544,3995.000244140625,1548,3990.000244140625,1554,3984.000244140625,1561,3972.000244140625,1561,3966.000244140625,1559,3964.000244140625,1552,3963.000244140625,1543,3962.000244140625,1536,3962.000244140625,1530,3954.000244140625,1526,3954.000244140625,1522,3955.000244140625,1517,3963.000244140625,1515,3970.000244140625,1514,3976.000244140625,1511,3978.000244140625,1507,3978.000244140625,1502,3980.000244140625,1498,3982.000244140625,1496,3987.000244140625,1492,3987.000244140625,1488,3983.000244140625,1482,3979.000244140625,1482,3971.000244140625,1484,3962.000244140625,1485,3953.000244140625,1490,3945.000244140625,1496,3940.000244140625,1499,3936.000244140625,1504,3935.000244140625,1511,3935.000244140625,1519,3936.000244140625,1526,3938.000244140625,1534,3940.000244140625,1544,3938.000244140625,1553,3934.000244140625,1562,3927.000244140625,1571,3920.000244140625,1584,3912.000244140625,1594,3902.000244140625,1604,3896.000244140625,1611,3892.000244140625,1616,3881.000244140625,1624,3876.000244140625,1632,3872.000244140625,1640,3874.000244140625,1651,3878.000244140625,1662,3877.000244140625,1669,3866.000244140625,1680,3857,1684,3844,1690,3830,1688,3818,1688,3814,1684,3811,1680,3812,1673,3812,1667,3812,1662,3805,1664,3798,1664,3790,1668,3781,1666,3773,1666,3769,1663,3762,1665,3750,1670,3740,1674,3734,1677,3726,1679,3718,1680,3706,1682,3697,1682,3688,1682,3676,1682,3666,1682,3661,1681,3654,1681,3651,1680,3647,1676,3646,1674,3642,1670,3635,1670,3631,1672,3624,1673,3614,1674,3608,1674,3604,1676,3597,1677,3593,1679,3590,1686,3589,1692,3586,1698,3580,1706,3573,1715,3568,1718,3558,1725,3552,1729,3541,1738,3536,1740,3529,1744,3518,1750,3510,1756,3503,1762,3495,1768,3488,1772,3476,1776,3464,1776,3454,1774,3448,1772,3439,1773,3434,1783,3436,1790,3438,1800,3440,1807,3436,1818,3426,1823,3417,1824,3411,1826,3408,1835,3398,1842,3390,1845,3383,1850,3374,1854,3366,1852,3362,1846,3359,1852,3350,1857,3345,1859,3336,1859,3328,1861,3322,1868,3320,1872,3323,1882,3331,1888.0001220703125,3336,1897.0001220703125,3336,1909.0001220703125,3340,1923.0001220703125,3344,1940.0001220703125,3354,1940.0001220703125,3360,1937.0001220703125,3368,1932.0001220703125,3378,1938.0001220703125,3386,1942.0001220703125,3393,1936.0001220703125,3389,1925.0001220703125,3382,1915.0001220703125,3380,1906.0001220703125,3382,1899.0001220703125,3387,1894.0001220703125,3396,1897.0001220703125,3403,1904.0001220703125,3405,1916.0001220703125,3412,1926.0001220703125,3412,1935.0001220703125,3410,1940.0001220703125,3408,1949.0001220703125,3408,1957.0001220703125,3407,1964.0001220703125,3400,1964.0001220703125,3394,1964.0001220703125,3386,1968.0001220703125,3382,1974.0001220703125,3376,1978.0001220703125,3374,1984.0001220703125,3375,1995.0001220703125,3380,2006,3381,2016,3384,2032,3389,2042,3388,2051,3384,2056,3378,2062,3375,2065,3380,2072,3386,2079,3397,2085,3404,2083,3406,2074,3406,2070,3408,2064,3411,2057,3417,2053,3423,2060,3423,2070,3422,2078,3420,2088,3424,2098,3432,2096,3441,2094,3443,2088,3442,2082,3444,2077,3450,2072,3460,2070,3468,2070,3476,2068,3480,2064,3480,2053,3480,2046,3480,2036,3482,2030,3483,2022,3485,2015,3487,2007,3489,2000,3493,1988,3497,1983,3504,1976,3510,1966,3514,1958,3522,1949,3528,1942,3530,1936,3530,1930.0001220703125,3528,1921.0001220703125,3526,1912.0001220703125,3525,1906.0001220703125,3523,1902.0001220703125,3521,1900.0001220703125,3512,1897.0001220703125,3503,1894.0001220703125,3496,1892.0001220703125,3492,1888.0001220703125,3500,1882.0001220703125,3508,1878.0001220703125,3513,1872.0001220703125,3514,1864.0001220703125,3512,1856.0001220703125,3504,1854.0001220703125,3494,1854.0001220703125,3486,1857.0001220703125,3480,1858.0001220703125,3468,1856.0001220703125,3458,1854.0001220703125,3455,1848.0001220703125,3451,1840.0001220703125,3452,1834.0001220703125,3451,1824.0001220703125,3456,1819.0001220703125,3468,1820.0001220703125,3482,1824.0001220703125,3491,1824.0001220703125,3501,1826.0001220703125,3516,1827.0001220703125,3527,1829.0001220703125,3536,1837.0001220703125,3546,1840.0001220703125,3550,1830.0001220703125,3553,1818.0001220703125,3556,1810.0001220703125,3560,1796.0001220703125,3571,1796.0001220703125,3580,1807.0001220703125,3589,1813.0001220703125,3601,1812.0001220703125,3611,1808.0001220703125,3622,1808.0001220703125,3630,1804.0001220703125,3637,1800.0001220703125,3642,1797.0001220703125,3653,1792.0001220703125,3662,1789.0001220703125,3671,1789.0001220703125,3678,1789.0001220703125,3689,1788.0001220703125,3695,1788.0001220703125,3700,1785.0001220703125,3703,1780.0001220703125,3707,1778.0001220703125,3710,1776.0001220703125,3714,1773.0001220703125,3727,1769.0001220703125,3739,1764.0001220703125,3752,1763.0001220703125,3764,1765.0001220703125,3776,1768.0001220703125,3788,1770.0001220703125,3800,1772.0001220703125,3812,1775.0001220703125,3820,1776.0001220703125,3821,1788.0001220703125,3818,1799.0001220703125,3810,1806.0001220703125,3804,1808.0001220703125,3800,1816.0001220703125,3796,1826.0001220703125,3795,1837.0001220703125,3796,1845.0001220703125,3800,1856.0001220703125,3808,1866.0001220703125,3814,1874,3820,1882,3825,1890,3834,1892,3846,1896,3856,1896,3864,1889,3869,1878,3877,1870,3882,1864,3886,1856,3888,1850,3891,1841,3895,1836,3900,1833,3906,1828,3910,1825,3916,1822,3923,1819,3928,1817,3936,1815,3948,1816,3956,1813,3957,1804,3955,1798,3949,1796,3944,1794,3937,1790,3926,1782,3921,1777,3919,1772,3920,1767,3922,1759,3923,1753,3924,1749,3927,1746,3930,1744,3936,1740,3942,1752,3945,1763,3954,1763,3964,1761,3975,1762,3979,1770,3977,1780,3985,1784,3998,1783,4012,1782,4020,1781,4030,1781,4045,1781,4054,1782,4060,1780,4066,1773,4072,1767,4076,1758,4082,1751,4084,1743,4090,1739,4096,1736,4104,1734,4112,1733,4116,1743,4113,1752,4111,1764,4111,1779,4120,1780,4132,1776,4140,1768,4142,1754,4142,1740,4141,1732,4144,1723,4154,1720,4165,1717,4175,1717,4184,1723,4190,1717,4188,1704,4188,1694,4192,1688,4196,1684,4202,1680,4207,1678,4214,1676,4217,1685,4214,1696,4208,1705,4204,1714,4201,1724,4200,1737,4201,1746,4212,1744,4224,1738,4234,1732,4244,1727,4246,1719,4246,1710,4246,1700,4248,1693,4250,1686,4256,1682,4263,1678,4272,1675,4278,1672,4284,1668,4283,1659,4279,1646,4272.000244140625,1640,4264.000244140625,1631,4260.000244140625,1622,4258.000244140625,1608,4261.000244140625,1592,4264.000244140625,1580,4269.000244140625,1568,4276.000244140625,1557,4280.000244140625,1548,4284.000244140625,1538,4289.000244140625,1528,4292.000244140625,1515,4294.000244140625,1504,4295.000244140625,1492,4296.000244140625,1476,4293.000244140625,1460,4288.000244140625,1452,4282.000244140625,1438,4282.000244140625,1430,4284.000244140625,1415,4288.000244140625,1408,4292.000244140625,1400,4300.000244140625,1394,4307.000244140625,1391,4312.000244140625,1388,4320.000244140625,1390,4329.000244140625,1398,4336.000244140625,1393,4332.000244140625,1381,4328.000244140625,1369,4329.000244140625,1358,4333.000244140625,1346,4338.000244140625,1339,4341.000244140625,1334,4342.000244140625,1330,4345.000244140625,1321,4348.000244140625,1314,4351.000244140625,1308,4356.000244140625,1302,4357.000244140625,1295,4361.000244140625,1284,4364.000244140625,1278,4364.000244140625,1270,4365.000244140625,1256,4364.000244140625,1242,4362.000244140625,1231,4359.000244140625,1220,4354.000244140625,1210,4351.000244140625,1197,4345.000244140625,1187,4334.000244140625,1175,4327.000244140625,1166,4322.000244140625,1154.0000610351562,4317.000244140625,1144.0000610351562,4312.000244140625,1133.0000610351562,4314.000244140625,1126.0000610351562,4313.000244140625,1114.0000610351562,4313.000244140625,1102.0000610351562,4313.000244140625,1087.0000610351562,4312.000244140625,1072.0000610351562,4294.000244140625,1070.0000610351562,4286.000244140625,1068.0000610351562,4281.000244140625,1064.0000610351562,4275.000244140625,1060.0000610351562"       />\n<area shape="poly" data-key="japan" id="japan3" alt="Япония" title="Япония" href="#"  coords="3562,1874,3562,1883,3568,1892,3567,1900,3567,1910,3567,1922,3574,1934,3580,1944,3588,1954,3600,1957,3610,1958,3615,1953,3619,1945,3617,1939,3622,1935,3628,1928,3632,1924,3637,1918,3638,1910,3640,1905,3645,1901,3654,1896,3661,1893,3670,1891,3678,1889,3686,1890,3698,1893,3706,1900,3712,1910,3722,1904,3725,1896,3731,1888,3738,1883,3746,1877,3754,1870,3760,1866,3766,1860,3768,1852,3764,1843,3759,1838,3758,1830,3760,1824,3756,1816,3747,1812,3734,1810,3726,1807,3720,1802,3715,1800,3704,1799,3697,1800,3689,1802,3682,1814,3680,1823,3674,1834,3665,1840,3646,1840,3636,1838,3630,1832,3621,1828,3614,1828,3607,1830,3596,1840,3592,1852,3590,1859,3578,1868,3568,1870"       />\n<area shape="poly" data-key="japan" id="japan4" alt="Япония" title="Япония" href="#"  coords="3290.000244140625,1891.0001220703125,3282.000244140625,1900.0001220703125,3272.000244140625,1908.0001220703125,3262.000244140625,1914.0001220703125,3252.000244140625,1919.0001220703125,3248.000244140625,1928.0001220703125,3258.000244140625,1934.0001220703125,3271.000244140625,1932.0001220703125,3281.000244140625,1928.0001220703125,3288.000244140625,1924.0001220703125,3297.000244140625,1916.0001220703125,3304.000244140625,1908.0001220703125,3305.000244140625,1896.0001220703125,3302.000244140625,1888.0001220703125,3292.000244140625,1884.0001220703125"       />\n<area shape="poly" data-key="japan" id="japan5" alt="Япония" title="Япония" href="#"  coords="3310.000244140625,1804,3308.000244140625,1819,3305.000244140625,1828,3305.000244140625,1839,3304.000244140625,1848,3314.000244140625,1849,3320.000244140625,1839,3322.000244140625,1825,3324.000244140625,1811,3326.000244140625,1800,3318.000244140625,1797,3311.000244140625,1797"       />\n<area shape="poly" data-key="japan" id="japan6" alt="Япония" title="Япония" href="#"  coords="4068,1407,4062,1414,4058,1423,4059,1433,4060,1445,4065,1452,4075,1449,4082,1445,4082,1435,4080,1424,4082,1416,4082,1408,4077,1406"       />\n<area shape="poly" data-key="japan" id="japan7" alt="Япония" title="Япония" href="#"  coords="3638,1592,3639,1606,3644,1615,3656,1610,3661,1603,3656,1592,3646,1590"       />\n<area shape="poly" data-key="japan" id="japan8" alt="Япония" title="Япония" href="#"  coords="3396.000244140625,2156,3392.000244140625,2163,3391.000244140625,2174,3401.000244140625,2178,3409.000244140625,2174,3414.000244140625,2166,3408.000244140625,2161,3404.000244140625,2156"       />\n<area shape="poly" data-key="japan" id="japan9" alt="Япония" title="Япония" href="#"  coords="3440.000244140625,2128.0001220703125,3433.000244140625,2136.0001220703125,3429.000244140625,2151.0001220703125,3430.000244140625,2168.0001220703125,3440.000244140625,2163.0001220703125,3444.000244140625,2152.0001220703125,3446.000244140625,2145.0001220703125,3451.000244140625,2137.0001220703125,3447.000244140625,2126.0001220703125"       />\n<area shape="poly" data-key="japan" id="japan10" alt="Япония" title="Япония" href="#"  coords="3290.000244140625,2338.0001220703125,3290.000244140625,2357.0001220703125,3300.000244140625,2365.0001220703125,3310.000244140625,2356.0001220703125,3319.000244140625,2350.0001220703125,3331.000244140625,2344.0001220703125,3334.000244140625,2329.0001220703125,3329.000244140625,2322.0001220703125,3312.000244140625,2329.0001220703125,3298.000244140625,2332.0001220703125"       />\n<area shape="poly" data-key="japan" id="japan11" alt="Япония" title="Япония" href="#"  coords="3180.000244140625,2453.000244140625,3178.000244140625,2464.000244140625,3176.000244140625,2475.000244140625,3166.000244140625,2480.000244140625,3163.000244140625,2492.000244140625,3162.000244140625,2508.000244140625,3173.000244140625,2510.000244140625,3181.000244140625,2504.000244140625,3186.000244140625,2494.000244140625,3192.000244140625,2487.000244140625,3200.000244140625,2481.000244140625,3209.000244140625,2476.000244140625,3216.000244140625,2471.000244140625,3222.000244140625,2466.000244140625,3224.000244140625,2456.000244140625,3216.000244140625,2454.000244140625,3208.000244140625,2454.000244140625,3200.000244140625,2458.000244140625,3193.000244140625,2456.000244140625,3190.000244140625,2454.000244140625"       />\n<area shape="poly" data-key="japan" id="japan12" alt="Япония" title="Япония" href="#"  coords="3244.000244140625,2402.0001220703125,3235.000244140625,2407.0001220703125,3233.000244140625,2418.0001220703125,3248.000244140625,2417.0001220703125,3254.000244140625,2411.0001220703125,3253.000244140625,2404.0001220703125"       />\n<area shape="poly" data-key="japan" id="japan13" alt="Япония" title="Япония" href="#"  coords="3258.000244140625,2381.0001220703125,3264.000244140625,2395.0001220703125,3272.000244140625,2393.0001220703125,3278.000244140625,2386.0001220703125,3277.000244140625,2374.0001220703125,3270.000244140625,2368.0001220703125,3262.000244140625,2368.0001220703125"       />\n<area shape="poly" data-key="japan" id="japan14" alt="Япония" title="Япония" href="#"  coords="3624,1612,3618,1622,3628,1626,3636,1623,3640,1614,3632,1610"       />\n<area shape="poly" data-key="japan" id="japan15" alt="Япония" title="Япония" href="#"  coords="3763,1808,3764,1819,3775,1816,3778,1809,3780,1799,3780,1792,3772,1796,3768,1798"       />\n\n<area shape="poly" data-key="usa" id="usa1" alt="САЩ" title="САЩ" href="#"  coords="9564.0009765625,3248,9562.0009765625,3238,9566.0009765625,3230,9572.0009765625,3222,9576.0009765625,3214,9578.0009765625,3201,9580.0009765625,3192,9588.0009765625,3189,9599.0009765625,3195,9612.0009765625,3203,9626.0009765625,3212,9638.0009765625,3222,9647.0009765625,3231,9654.0009765625,3240,9661.0009765625,3253,9652.0009765625,3265,9635.0009765625,3266,9622.0009765625,3271,9610.0009765625,3282,9607.0009765625,3296,9598.0009765625,3306,9586.0009765625,3308,9576.0009765625,3298,9571.0009765625,3290,9573.0009765625,3274,9573.0009765625,3263"       />\n<area shape="poly" data-key="usa" id="usa2" alt="САЩ" title="САЩ" href="#"  coords="9541.0009765625,3147,9530.0009765625,3137,9524.0009765625,3128,9525.0009765625,3115,9540.0009765625,3113,9552.0009765625,3120,9562.0009765625,3132,9564.0009765625,3145,9554.0009765625,3153"       />\n<area shape="poly" data-key="usa" id="usa3" alt="САЩ" title="САЩ" href="#"  coords="9483.0009765625,3140,9476.0009765625,3133,9476.0009765625,3124,9481.0009765625,3119,9495.0009765625,3122,9499.0009765625,3132,9492.0009765625,3141"       />\n<area shape="poly" data-key="usa" id="usa4" alt="САЩ" title="САЩ" href="#"  coords="9513.0009765625,3148,9508.0009765625,3152,9509.0009765625,3164,9520.0009765625,3168,9524.0009765625,3164,9522.0009765625,3157,9521.0009765625,3154"       />\n<area shape="poly" data-key="usa" id="usa5" alt="САЩ" title="САЩ" href="#"  coords="9461.0009765625,3102,9474.0009765625,3106,9485.0009765625,3106,9496.0009765625,3105,9497.0009765625,3097,9487.0009765625,3090,9479.0009765625,3085,9468.0009765625,3086,9460.0009765625,3092"       />\n<area shape="poly" data-key="usa" id="usa6" alt="САЩ" title="САЩ" href="#"  coords="9380.0009765625,3090,9393.0009765625,3092,9405.0009765625,3092,9421.0009765625,3094,9431.0009765625,3093,9423.0009765625,3078,9420.0009765625,3064,9416.0009765625,3054,9411.0009765625,3044,9399.0009765625,3042,9386.0009765625,3050,9378.0009765625,3056,9381.0009765625,3068,9381.0009765625,3080"       />\n<area shape="poly" data-key="usa" id="usa7" alt="САЩ" title="САЩ" href="#"  coords="9247.0009765625,3014,9256.0009765625,3021,9263.0009765625,3027,9278.0009765625,3030,9287.0009765625,3029,9287.0009765625,3024,9287.0009765625,3018,9288.0009765625,3012,9291.0009765625,3005,9291.0009765625,2996,9288.0009765625,2992,9280.0009765625,2992,9273.0009765625,2991,9264.0009765625,2991,9260.0009765625,2991,9253.0009765625,2994,9248.0009765625,2998,9245.0009765625,3007"       />\n<area shape="poly" data-key="usa" id="usa8" alt="САЩ" title="САЩ" href="#"  coords="9222.0009765625,3010,9212.0009765625,3013,9203.0009765625,3020,9200.0009765625,3030,9208.0009765625,3041,9218.0009765625,3038,9226.0009765625,3033,9234.0009765625,3028,9232.0009765625,3020,9231.0009765625,3008"       />\n\n<area shape="poly" data-key="china" id="china1" alt="Китай" title="Китай" href="#"  coords="0,323,4,335,14,344,16,360,16,379,16,392,18,407,25,419,37,442,42,456,40,472,40,483,39,492,36,504,36,516,36,529,32,542,32,558,29,578,12,592,4,602,2,615,4,634,7,648,8,659,12,669,19,675,28,680,35,683,40,690,47,696,58,700,68,704,82,706,92,713,104,722,120,724,136,728,151,728,164,728,177,732,192,736,206,740,220,752,228,758,236,768,240,779,252,795,262,802,271,807,278,816,288,829,297,836,311,843,319,850,329,860,343,863,353,859,358,868,353,877,354,887,358,895,368,900,371,911,372,922,376,931,380,939,381,946,382,953,384,960,387,968,387,976,384,982,394,994,397,1005,404,1016,410,1028,417,1038,424,1048,432,1056,435,1069,443,1081,457,1086,469,1088,480,1086,490,1083,503,1088,518,1091,535,1094,553,1100,568,1104,583,1104,599,1106,613,1109,628,1110,646,1114,660,1117,676,1120,690,1126,700,1132,714,1133,732,1134,740,1134,748,1132,758,1132,768,1130,780,1130,794,1129,808,1131,826,1133,838,1136,850,1140,864,1141,876,1145,889,1151,901,1156,915,1159,926,1162,935,1170,941,1178,948,1184,956,1193,970,1201,981,1204,992,1204,1008,1208,1021,1215,1036,1224,1044,1230,1055,1237,1066,1245,1077,1242,1084,1244,1093,1248,1104,1251,1117,1256,1133,1262,1146,1263,1154,1264,1169,1262,1176,1260,1180,1258,1191,1258,1196,1268,1199,1276,1204,1284,1212,1285,1220,1284,1228,1285,1237,1292,1248,1292,1252,1286,1254,1282,1260,1274,1266,1269,1279,1266,1287,1264,1293,1261,1302,1256,1306,1253,1312,1248,1320,1244,1330,1238,1340,1232,1349,1228,1359,1224,1373,1218,1383,1214,1392,1209,1404,1204,1413,1198,1428,1192,1436,1187,1446,1185,1457,1182,1470,1178,1482,1175,1496,1176,1508,1181,1518,1181,1528,1181,1538,1178,1546,1175,1550,1172,1564,1172,1575,1174,1589,1174,1610,1174,1620,1175,1632,1172,1639,1170,1649,1168,1659,1167,1669,1166,1675,1165,1683,1164,1692,1161,1696,1158,1702,1154,1710,1148,1716,1144,1724,1140,1735,1135,1743,1133,1753,1130,1764,1124,1770,1116,1778,1112,1788,1104,1794,1094,1796,1086,1796,1076,1798,1071,1802,1064,1807,1059,1812,1054,1817,1048,1822,1044,1830,1040,1834,1035,1839,1030,1846,1025,1852,1020,1858,1016,1865,1012,1873,1008,1880,1004,1887,1000,1891,994,1894,986,1899,980,1906,974,1914,970,1920,965,1922,959,1917,955,1912,949,1906,942,1900,936,1891,926,1884,920,1876,912,1872,907,1866,897,1860,893,1855,886,1854,878,1854,872,1857,866,1860,860,1862,856,1868,850,1870,842,1870,831,1870,826,1872,819,1874,813,1876,808,1878,803,1881,798,1885,795,1890,791,1896,786,1901,784,1905,782,1921,784,1930,784,1940,782.0000305175781,1948,780.0000305175781,1955,782.0000305175781,1965,789.0000305175781,1973,792.0000305175781,1991,798.0000305175781,2000,800.0000305175781,2010,800.0000305175781,2020,802.0000305175781,2029,803.0000305175781,2038,805.0000305175781,2048,804.0000305175781,2058,803.0000305175781,2069,801.0000305175781,2077,797.0000305175781,2084,793.0000305175781,2090,789.0000305175781,2097,784.0000305175781,2101,781.0000305175781,2106,777.0000305175781,2110,773.0000305175781,2114,768.0000305175781,2120,761.0000305175781,2124.0001220703125,758.0000305175781,2131.0001220703125,748.0000305175781,2134.0001220703125,741.0000305175781,2136.0001220703125,736.0000305175781,2140.0001220703125,729.0000305175781,2140.0001220703125,724.0000305175781,2142.0001220703125,716.0000305175781,2142.0001220703125,712.0000305175781,2148.0001220703125,710.0000305175781,2154.0001220703125,706.0000305175781,2165.0001220703125,706.0000305175781,2172.0001220703125,705.0000305175781,2180.0001220703125,705.0000305175781,2190.0001220703125,709.0000305175781,2198.0001220703125,706.0000305175781,2208.0001220703125,704.0000305175781,2216.0001220703125,701.0000305175781,2227.0001220703125,697.0000305175781,2236.0001220703125,693.0000305175781,2244.0001220703125,688.0000305175781,2250.0001220703125,683.0000305175781,2254.0001220703125,678.0000305175781,2260.0001220703125,671.0000305175781,2265.0001220703125,665.0000305175781,2270.0001220703125,658.0000305175781,2274.0001220703125,652.0000305175781,2280.0001220703125,648.0000305175781,2286.0001220703125,640.0000305175781,2290.0001220703125,636.0000305175781,2297.0001220703125,629.0000305175781,2298.0001220703125,624.0000305175781,2298.0001220703125,616.0000305175781,2300.0001220703125,608.0000305175781,2301.0001220703125,599.0000305175781,2302.0001220703125,592.0000305175781,2304.0001220703125,583.0000305175781,2304.0001220703125,576.0000305175781,2306.0001220703125,568.0000305175781,2308.0001220703125,562.0000305175781,2308.0001220703125,556.0000305175781,2312.0001220703125,552.0000305175781,2321.0001220703125,547.0000305175781,2330.0001220703125,542.0000305175781,2340.0001220703125,538.0000305175781,2348.0001220703125,535.0000305175781,2356.0001220703125,532.0000305175781,2365.0001220703125,533.0000305175781,2372.0001220703125,532.0000305175781,2380.0001220703125,532.0000305175781,2384.0001220703125,529.0000305175781,2389.0001220703125,521.0000305175781,2389.0001220703125,512.0000305175781,2390.0001220703125,504.0000305175781,2392.0001220703125,499.0000305175781,2399.0001220703125,498.0000305175781,2411.0001220703125,500.0000305175781,2422.0001220703125,502.0000305175781,2430.0001220703125,501.0000305175781,2435.0001220703125,494.0000305175781,2439.0001220703125,486.0000305175781,2444.0001220703125,480.0000305175781,2449.0001220703125,474.0000305175781,2456.0001220703125,471.0000305175781,2462.0001220703125,470.0000305175781,2470.0001220703125,467.0000305175781,2479.0001220703125,466.0000305175781,2486.0001220703125,464.0000305175781,2494.0001220703125,458.0000305175781,2502.0001220703125,455.0000305175781,2508.0001220703125,453.0000305175781,2518.0001220703125,452.0000305175781,2536.0001220703125,453.0000305175781,2545.0001220703125,456.0000305175781,2556.0001220703125,460.0000305175781,2565.0001220703125,460.0000305175781,2573.0001220703125,460.0000305175781,2581.0001220703125,458.0000305175781,2589.0001220703125,456.0000305175781,2594.0001220703125,454.0000305175781,2600.0001220703125,450.0000305175781,2603.0001220703125,446.0000305175781,2605.0001220703125,440.0000305175781,2605.0001220703125,432.0000305175781,2604.0001220703125,422.0000305175781,2602.0001220703125,412.0000305175781,2599.0001220703125,404.0000305175781,2593.0001220703125,398.0000305175781,2589.0001220703125,394.0000305175781,2583.0001220703125,389.0000305175781,2578.0001220703125,384.0000305175781,2573.0001220703125,379.0000305175781,2570.0001220703125,374.0000305175781,2567.0001220703125,369.0000305175781,2564.0001220703125,366.0000305175781,2560.0001220703125,362.0000305175781,2554.0001220703125,359.0000305175781,2549.0001220703125,356.0000305175781,2544.0001220703125,351.0000305175781,2542.0001220703125,346.0000305175781,2536.0001220703125,344.0000305175781,2528.0001220703125,341.0000305175781,2520.0001220703125,336.0000305175781,2514.0001220703125,332.0000305175781,2512.0001220703125,328.0000305175781,2504.0001220703125,324.0000305175781,2500.0001220703125,321.0000305175781,2494.0001220703125,317.0000305175781,2490.0001220703125,313.0000305175781,2484.0001220703125,310.0000305175781,2478.0001220703125,308.0000305175781,2470.0001220703125,305.0000305175781,2464.0001220703125,300.0000305175781,2459.0001220703125,296.0000305175781,2453.0001220703125,291.0000305175781,2448.0001220703125,288.0000305175781,2430.0001220703125,286.0000305175781,2415.0001220703125,286.0000305175781,2410.0001220703125,286.0000305175781,2406.0001220703125,288.0000305175781,2399.0001220703125,291.0000305175781,2393.0001220703125,296.0000305175781,2388.0001220703125,303.0000305175781,2386.0001220703125,306.0000305175781,2384.0001220703125,314.0000305175781,2379.0001220703125,318.0000305175781,2376.0001220703125,324.0000305175781,2374.0001220703125,330.0000305175781,2372.0001220703125,337.0000305175781,2368.0001220703125,344.0000305175781,2362.0001220703125,348.0000305175781,2358.0001220703125,350.0000305175781,2354.0001220703125,350.0000305175781,2348.0001220703125,349.0000305175781,2341.0001220703125,348.0000305175781,2334.0001220703125,344.0000305175781,2328.0001220703125,335.0000305175781,2323.0001220703125,330.0000305175781,2319.0001220703125,328.0000305175781,2313.0001220703125,328.0000305175781,2308.0001220703125,329.0000305175781,2301.0001220703125,330.0000305175781,2294.0001220703125,330.0000305175781,2290.0001220703125,330.0000305175781,2285.0001220703125,331.0000305175781,2279.0001220703125,332.0000305175781,2272.0001220703125,332.0000305175781,2262.0001220703125,333.0000305175781,2254.0001220703125,334.0000305175781,2248.0001220703125,336.0000305175781,2245.0001220703125,343.0000305175781,2244.0001220703125,352.0000305175781,2242.0001220703125,356.0000305175781,2240.0001220703125,361.0000305175781,2236.0001220703125,362.0000305175781,2228.0001220703125,362.0000305175781,2220.0001220703125,362.0000305175781,2215.0001220703125,362.0000305175781,2208.0001220703125,360.0000305175781,2201.0001220703125,354.0000305175781,2198.0001220703125,352.0000305175781,2194.0001220703125,346.0000305175781,2190.0001220703125,338.0000305175781,2189.0001220703125,332.0000305175781,2188.0001220703125,326.0000305175781,2188.0001220703125,322.0000305175781,2190.0001220703125,312.0000305175781,2192.0001220703125,306.0000305175781,2194.0001220703125,301.0000305175781,2196.0001220703125,298.0000305175781,2202.0001220703125,291.0000305175781,2206.0001220703125,282.0000305175781,2206.0001220703125,278,2205.0001220703125,268,2203.0001220703125,256,2201.0001220703125,246,2202.0001220703125,239,2210.0001220703125,234,2214.0001220703125,230,2219.0001220703125,219,2220.0001220703125,210,2219.0001220703125,204,2218.0001220703125,192,2218.0001220703125,182,2218.0001220703125,174,2219.0001220703125,170,2220.0001220703125,166,2223.0001220703125,158,2226.0001220703125,152,2230.0001220703125,144,2233.0001220703125,135,2239.0001220703125,126,2244.0001220703125,118,2247.0001220703125,104,2248.0001220703125,96,2250.0001220703125,86,2250.0001220703125,80,2251.0001220703125,76,2252.0001220703125,72,2254.0001220703125,67,2258.0001220703125,64,2270.0001220703125,68,2282.0001220703125,78,2291.0001220703125,82,2303.0001220703125,84,2314.0001220703125,87,2326.0001220703125,88,2338.0001220703125,88,2349.0001220703125,88,2358.0001220703125,88,2366.0001220703125,80,2370.0001220703125,76,2378.0001220703125,70,2384.0001220703125,66,2390.0001220703125,59,2394.0001220703125,52,2397.0001220703125,47,2401.0001220703125,41,2408.0001220703125,34,2420.0001220703125,27,2431.0001220703125,21,2444.0001220703125,15,2449.0001220703125,10,2451.0001220703125,6,2453.0001220703125,2,2457,0,3246,0,3257,7,3264,16,3274,26,3284,30,3296,30,3310,33,3313,41,3314,50,3314,58,3314,68,3318,78,3322,88,3325,99,3325,108,3328,122,3324,133,3327,148,3330,159,3335,170,3342,180,3346,189,3357,196,3370,199,3387,200,3400,203,3410,202,3420,197,3432,198,3444,198,3452,198,3462,194,3470,194,3478,189,3484,183,3490,178,3496,172,3500,165,3506,159,3512,152,3519,146,3524,140,3532,134,3542,130,3553,129,3562,128,3572,128,3584,128,3588,124,3590,116,3592,106,3595,99,3609,90,3620,88,3628,85,3636,83,3644,80,3652,79,3664,76,3671,76,3680,83,3681,94,3682,105,3680,116,3678,128,3678,138,3680,149,3683,160,3684,172,3682,186,3677,194,3668,201,3661,210,3654,220,3649,227,3646,237,3646,254,3645,265,3644,280,3643,290,3640,308,3638,319,3637,330,3634,337,3631,348,3631,360,3633,373,3633,382,3632,393,3630,403,3627,414,3626,424,3622,438,3618,447,3613,456,3608,464,3606,474,3606,486,3605,494,3598,500,3594,506,3590,513,3584,521,3582,527,3579,537,3578,547,3578,557,3577,566,3576,574,3570,578,3562,580,3551,580,3542,576,3538,574,3527,570,3519,567,3512,565,3504,562,3496,560,3488,558,3481,554,3476,554,3461,552,3452,554,3449,561,3446,570,3432,583,3421,588,3415,597,3408,600,3398,604,3389,609,3385,618,3387,631,3390,639,3394,647,3397,654,3399,663,3404,674,3405,682,3407,691,3409,701,3412,708,3415,715,3416,722,3416,728,3416,739,3418,746,3420,754,3420,767,3420,778,3420,787,3420,798,3421,807,3421,817,3422,830,3423,839,3424,847,3424,855,3425,866,3426,876,3425,889,3424,895,3420,903,3412,909,3404,914,3394,918,3386,921,3372,926,3365,931,3362,939,3366,950,3367,960,3364,968,3357,968,3346,964,3345,959,3342,952,3341,944,3339,938,3334,932,3329,929,3320,926,3313,928,3308,933,3306,942,3305,950,3304,956,3302,964,3300,970,3297,978,3292,985,3282,989,3272,989,3265,993,3260,1002,3257,1009,3254,1015,3250,1020,3245,1023,3240,1026,3233,1026,3221,1026,3215,1026,3207,1027,3199,1028,3187,1028,3182,1029,3176,1036,3175,1041,3177,1048,3183,1058,3189,1067,3191,1078,3186,1086,3180,1091,3169,1096,3158,1096,3150,1094,3142,1093,3134,1092,3126,1091,3117,1086,3114,1080,3111,1077,3105,1071,3101,1067,3097,1063,3092,1060,3085,1060,3079,1060,3074,1063,3067,1071,3063,1076,3061,1080,3056,1087,3053,1092,3050,1098,3046,1103,3043,1108,3038,1115,3036,1119,3032,1124,3029,1127,3024,1133,3020,1139,3017,1143,3012,1147,3008,1150,3003,1151,2992,1157,2983,1160,2978,1164,2966,1171,2960,1174,2956,1176,2948,1180,2941,1185,2934,1190,2925,1195,2918,1200,2915,1204,2911,1208,2906,1215,2900,1224,2896,1231,2896,1238,2905,1244,2911,1254,2906,1261,2896,1265,2886,1269,2868,1270,2855,1274,2841,1276,2829,1279,2819,1283,2811,1287,2804,1290,2797,1294,2789,1300,2778,1306,2768,1311,2759,1319,2753,1326,2747,1332,2739,1340,2730,1348,2723,1354,2715,1358,2708,1361,2699,1362,2691,1361,2686,1358,2684,1353,2688,1347,2692,1345,2702,1341,2708,1338,2710,1334,2713,1324,2711,1314,2707,1308,2703,1301,2702,1293,2704,1284,2707,1277,2712,1270,2716,1265,2720,1260,2725,1253,2732,1246,2739,1237,2744,1230,2746,1221,2749,1209,2747,1198,2740,1190,2728,1184,2712,1179,2695,1173,2677,1172,2660,1174,2650,1184,2643,1194,2636,1205,2630,1215,2625,1225,2619,1233,2610,1240,2602,1243,2594,1246,2583,1249,2575,1252,2564,1256,2556,1263,2553,1271,2548,1278,2544,1290,2540,1296,2533,1304,2527,1311,2519,1317,2501,1321,2493,1324,2475,1325,2462,1322,2454,1319,2446,1313,2443,1316,2436,1320,2430,1323,2427,1329,2425,1334,2424,1340,2423,1346,2422,1353,2422,1358,2422,1365,2424,1373,2426,1380,2430,1386,2434,1393,2442,1402,2450,1406,2458,1409,2466,1412,2478,1416,2489,1420,2496,1420,2504,1420,2514,1423,2521,1429,2522,1440,2526,1450,2528,1457,2528,1465,2529,1478.0001220703125,2532,1488.0001220703125,2538,1497.0001220703125,2553,1506.0001220703125,2571,1509.0001220703125,2585,1508.0001220703125,2598,1501.0001220703125,2609,1492.0001220703125,2618,1482.0001220703125,2628,1468.0001220703125,2640,1462.0001220703125,2658,1456.0001220703125,2676,1458.0001220703125,2688,1464.0001220703125,2703,1471.0001220703125,2721,1477.0001220703125,2739,1484.0001220703125,2751,1489.0001220703125,2766,1492.0001220703125,2782,1493.0001220703125,2802,1494.0001220703125,2812,1498.0001220703125,2814,1512.0001220703125,2814,1524.0001220703125,2807,1534.0001220703125,2803,1542.0001220703125,2792,1546.0001220703125,2773,1548.0001220703125,2756,1550.0001220703125,2745,1556.0001220703125,2725,1560.0001220703125,2707,1565.0001220703125,2690,1573.0001220703125,2680,1580.0001220703125,2673,1590.0001220703125,2666,1602.0001220703125,2662,1615.0001220703125,2644,1619.0001220703125,2635,1628.0001220703125,2624,1638.0001220703125,2616,1646.0001220703125,2606,1656.0001220703125,2595,1665.0001220703125,2583,1677.0001220703125,2574,1688.0001220703125,2564,1700.0001220703125,2557,1708.0001220703125,2548,1720.0001220703125,2545,1732.0001220703125,2545,1740.0001220703125,2550,1753.0001220703125,2558,1763.0001220703125,2569,1772.0001220703125,2585,1780.0001220703125,2600,1788.0001220703125,2610,1794.0001220703125,2624,1798.0001220703125,2636,1810.0001220703125,2642,1829.0001220703125,2648,1848.0001220703125,2652,1860.0001220703125,2658,1872.0001220703125,2662,1882.0001220703125,2666,1897.0001220703125,2670,1909.0001220703125,2673,1921.0001220703125,2677,1932.0001220703125,2681,1942.0001220703125,2686,1952.0001220703125,2695,1964.0001220703125,2704,1972.0001220703125,2711,1976.0001220703125,2722,1982.0001220703125,2730,1986.0001220703125,2738,1996.0001220703125,2747,2006.0001220703125,2757,2017.0001220703125,2766,2027.0001220703125,2772,2042.0001220703125,2773,2049.0001220703125,2774,2058.0001220703125,2775,2073,2776,2082,2775,2090,2764,2092,2755,2096,2758,2108,2764,2116,2771,2126,2780,2139,2782,2148,2777,2155,2762,2160,2744,2166,2728,2172,2720,2178,2712,2189,2713,2201,2722,2208,2740,2218,2750,2224,2766,2234,2776,2240,2786,2237,2801,2235,2813,2240,2816,2264,2808,2274,2797,2285,2788,2292,2778,2302,2772,2320,2771,2338,2770,2350,2770,2364,2764,2373,2758,2382,2755,2392,2756,2404,2755,2415,2752,2426,2741,2431,2728,2435,2714,2440,2708,2447,2701,2462,2694,2477,2686,2489,2678,2502,2672,2515,2666,2532,2655,2542,2640,2553,2628,2562,2614,2572,2604,2588,2599,2597,2598,2609,2595,2623,2592,2637.000244140625,2586,2650.000244140625,2578,2662.000244140625,2573,2676.000244140625,2572,2688.000244140625,2568,2701.000244140625,2557,2714.000244140625,2548,2725.000244140625,2534,2737.000244140625,2524,2748.000244140625,2512,2759.000244140625,2499,2772.000244140625,2490,2785.000244140625,2481,2797.000244140625,2464,2804.000244140625,2446,2808.000244140625,2439,2820.000244140625,2435,2832.000244140625,2424,2841.000244140625,2408,2854.000244140625,2393,2868.000244140625,2382,2879.000244140625,2367,2887.000244140625,2348,2890.000244140625,2325,2898.000244140625,2310,2903.000244140625,2302,2922.000244140625,2296,2943.000244140625,2281,2950.000244140625,2261,2960.000244140625,2243,2964.000244140625,2232,2970.000244140625,2210,2972.000244140625,2196,2972.000244140625,2178,2972.000244140625,2164,2974.000244140625,2144,2978.000244140625,2118,2990.000244140625,2090,2997.000244140625,2071,2998.000244140625,2046,3002.000244140625,2032,3000.000244140625,2018,2991.000244140625,2010,2981.000244140625,2000,2976.000244140625,1993,2978.000244140625,1994,2992.000244140625,1994,3000.000244140625,1994,3013.000244140625,1988,3022.000244140625,1982,3025.000244140625,1980.0001220703125,3032,1962.0001220703125,3038,1942.0001220703125,3039,1925.0001220703125,3048,1911.0001220703125,3054,1900.0001220703125,3059,1876.0001220703125,3064,1848.0001220703125,3066,1830.0001220703125,3070,1818.0001220703125,3071,1801.0001220703125,3075,1792.0001220703125,3077,1777.0001220703125,3079,1756.0001220703125,3080,1736.0001220703125,3085,1720.0001220703125,3090,1708.0001220703125,3094,1698.0001220703125,3106,1694.0001220703125,3116,1692.0001220703125,3137,1693.0001220703125,3151,1693.0001220703125,3168,1686.0001220703125,3178,1675.0001220703125,3189,1668.0001220703125,3190,1658.0001220703125,3192,1641.0001220703125,3190,1633.0001220703125,3186,1628.0001220703125,3178,1628.0001220703125,3171,1626.0001220703125,3161,1624.0001220703125,3150,1615.0001220703125,3140,1612.0001220703125,3129,1612.0001220703125,3118,1615.0001220703125,3110,1622.0001220703125,3095,1628.0001220703125,3086,1630.0001220703125,3075,1622.0001220703125,3068,1608.0001220703125,3065,1592.0001220703125,3065,1584.0001220703125,3065,1574.0001220703125,3063,1558.0001220703125,3057,1548.0001220703125,3052,1538.0001220703125,3044,1528.0001220703125,3035,1525.0001220703125,3034,1515,3031,1500,3040,1480,3046,1464,3048,1455,3043,1452,3033,1444,3032,1433,3032,1414,3032,1389,3021,1375,3015,1366,3007,1358,3003,1352,2992,1346,2975,1344,2964,1345,2954,1352,2944,1354,2936,1350,2927,1344,2921,1334,2919,1313,2917,1301,2916,1289,2912,1280,2910,1267,2906,1258,2899,1248,2893,1238,2888,1224,2889,1213,2890,1204,2896,1196,2900,1188,2910,1178,2924,1160,2930,1148,2934,1140,2937,1133,2944,1129,2951,1120,2949,1111,2944,1102,2940,1083,2938,1071,2939,1063,2941,1056,2952,1046,2955,1034,2949,1024,2944,1011,2936,1003,2938,992,2944,987,2950,977,2959,965,2965,951,2962,936,2963,932,2972,934,2991,936,3008,940,3020,942,3032,942,3042,940,3056,936,3067,931,3075,923,3079,908,3077,903,3072,896,3064,890,3056,884,3052,866,3055,856,3060,837,3061,827,3060,813,3059,804,3057,795,3053,792,3040,789,3030,783,3017,771,3012,755,3011,738,3008,728,3002,735,2992,744,2984,745,2973,747,2960,752,2944,759,2937,748,2934,736,2935,721,2932,712,2927,708,2916,706,2901,702,2888,700,2876,704,2869,713,2866,711,2856,701,2853,688,2853,673,2857,659,2859,644,2864,633,2869,624,2872,616,2865,621,2857,628,2851,628,2840,620,2834,617,2819,623,2810,632,2803,634,2788,641,2776,647,2773,659,2770,666,2760,676,2752,688,2750,700,2741,707,2725,711,2707,716,2691,718,2674,719,2656,720,2641,721,2626,720,2614,711,2612,703,2612,690,2610,682,2603,678,2590,673,2574,663,2563,651,2558,646,2557,636,2563,632,2572,627,2584,621,2592,612,2600,602,2598,596,2592,585,2590,579,2591,570,2583,555,2578,544,2573,535,2568,528,2564,520,2560,517,2556.000244140625,510,2555.000244140625,503,2553.000244140625,494,2548.000244140625,487,2548.000244140625,480,2549.000244140625,472,2541.000244140625,464,2537.000244140625,452,2538.000244140625,445,2540.000244140625,430,2540.000244140625,416,2537.000244140625,406,2537.000244140625,395,2540.000244140625,385,2547.000244140625,376,2553.000244140625,366,2558.000244140625,360,2560.000244140625,352,2564.000244140625,347,2569.000244140625,344,2574.000244140625,340,2582.000244140625,337,2589.000244140625,334,2596.000244140625,331,2601.000244140625,324,2608.000244140625,318,2612.000244140625,312,2618.000244140625,307,2622.000244140625,296,2630.000244140625,289,2634.000244140625,281,2640.000244140625,276,2644.000244140625,270,2649.000244140625,261,2655.000244140625,253,2660.000244140625,245,2665.000244140625,236,2669.000244140625,223,2673.000244140625,215,2676.000244140625,206,2678.000244140625,198,2683.000244140625,191,2687.000244140625,177,2697.000244140625,171,2701.000244140625,165,2709.000244140625,160,2715.000244140625,154,2724.000244140625,149,2730.000244140625,145,2737.000244140625,143,2743.000244140625,141,2754.000244140625,139,2763.000244140625,134,2772.000244140625,126,2777.000244140625,112,2782.000244140625,107,2786.000244140625,100,2792.000244140625,85,2798.000244140625,66,2806.000244140625,49,2806.000244140625,38,2808.000244140625,29,2808.000244140625,20,2808.000244140625,0,2807.000244140625"       />\n<area shape="poly" data-key="china" id="china2" alt="Китай" title="Китай" href="#"  coords="1620,3212,1632,3214,1644,3218,1651,3212,1660,3208,1671,3210,1684,3212,1691,3206,1700,3204,1706,3202,1716,3201,1726,3200,1733,3200,1742,3201,1751,3202,1761,3205,1768,3212,1769,3220,1770,3227,1768,3239,1764,3244,1762,3250,1756,3256,1749,3259,1746,3262,1740,3269,1736,3276,1732,3284,1730,3292,1729,3300,1727,3311,1723,3316,1713,3321,1704,3323,1700,3328,1695,3335,1693,3343,1686,3346,1680,3346,1675,3348,1668,3350,1663,3357,1652,3359,1642,3354,1633,3348,1626,3348,1614,3348,1605,3346,1600,3341,1590,3337,1584,3332,1581,3328,1580,3321,1580,3316,1577,3309,1576,3301,1575,3292,1575,3287,1577,3281,1577,3276,1578,3271,1580,3265,1584,3260,1588,3256,1592,3254,1599,3249,1605,3246,1611,3243,1616,3236,1619,3232,1620,3226,1621,3221"       />\n\n<area shape="poly" data-key="russia" id="russia1" alt="Русия" title="Русия" href="#"  coords="0,73,0,0,107,0,104,13,92,12,82,11,72,13,65,21,61,28,46,31,36,26,30,30,23,40,21,45,20,55,17,65,8,68"       />\n<area shape="poly" data-key="russia" id="russia2" alt="Русия" title="Русия" href="#"  coords="362,0,363,16,365,34,371,52,373,65,370,78,382,82,396,87,410,90,418,95,426,105,435,105,445,106,453,104,460,101,466,97,480,97,491,98,500,105,507,114,516,114,525,112,534,113,541,117,551,123,562,127,573,133,586,135,595,134,604,132,608,127,611,123,614,120,618,115,626,117,632,114,637,111,645,115,648,112,650,106,654,100,658,95,659,89,663,84,665,78,667,73,670,66,670,60,671,55,668,44,665,38,664,34,658,28,655,23,653,16,652,12,652,8,651,0"       />\n<area shape="poly" data-key="russia" id="russia3" alt="Русия" title="Русия" href="#"  coords="994.0000305175781,0,996.0000305175781,10,995.0000305175781,20,997.0000305175781,32,1007.0000305175781,38,1014.0000305175781,46,1014.0000305175781,55,1018.0000305175781,66,1026.0000305175781,74,1037.0000305175781,80,1050.0000305175781,86,1060.0000305175781,85,1068.0000305175781,86,1075.0000305175781,90,1075.0000305175781,99,1085.0000305175781,105,1094.0000305175781,102,1097.0000305175781,110,1107.0000305175781,114,1114.0000305175781,110,1120.0000305175781,107,1127.0000305175781,107,1135.0000305175781,111,1144.0000305175781,111,1153.0000305175781,107,1158.0000305175781,103,1165.0000305175781,97,1168.0000305175781,93,1173.0000305175781,88,1178.0000305175781,85,1186.0000305175781,78,1197.0000305175781,82,1206.0000305175781,80,1212.0000305175781,75,1216.0000305175781,70,1226.0000305175781,72,1233.0000305175781,72,1238.0000305175781,70,1244.0000305175781,65,1250.0000305175781,62,1261.0000305175781,62,1272.0000305175781,67,1283.0000305175781,67,1294.0000305175781,66,1311.0000305175781,67,1322.0000305175781,75,1332.0000305175781,86,1343.0000305175781,86,1356.0000305175781,83,1370.0000305175781,84,1381.0000610351562,87,1394.0000610351562,92,1402.0000610351562,101,1407.0000610351562,111,1415.0000610351562,118,1424.0000610351562,123,1442.0000610351562,126,1453.0000610351562,125,1466.0000610351562,126,1474.0000610351562,127,1482.0000610351562,133,1483.0000610351562,145,1488.0000610351562,155,1488.0000610351562,164,1494.0000610351562,174,1501.0000610351562,182,1507.0000610351562,182,1520.0000610351562,183,1527.0000610351562,193,1532.0000610351562,204,1545.0000610351562,208,1556.0000610351562,208,1572.0000610351562,210,1584.0000610351562,211,1595.0000610351562,210,1605.0000610351562,208,1617.0000610351562,215,1631.0000610351562,218,1646.0000610351562,218,1657.0000610351562,218,1666.0000610351562,217,1681.0000610351562,218,1691.0000610351562,215,1700.0000610351562,215,1705.0000610351562,212,1710.0000610351562,206,1718.0000610351562,208,1728.0000610351562,208,1738.0000610351562,208,1748.0000610351562,204,1754.0000610351562,202,1763.0000610351562,203,1771.0000610351562,198,1775.0000610351562,193,1783.0000610351562,192,1791.0000610351562,191,1803.0000610351562,194,1810.0000610351562,188,1817.0000610351562,183,1830.0000610351562,184,1842.0000610351562,184,1850.0000610351562,176,1854.0000610351562,170,1860.0000610351562,162,1867.0000610351562,160,1881.0000610351562,155,1892.0000610351562,154,1903.0000610351562,154,1915.0000610351562,152,1924.0000610351562,150,1933.0000610351562,142,1937.0000610351562,134,1938.0000610351562,128,1940.0000610351562,122,1941.0000610351562,116,1942.0000610351562,112,1944.0000610351562,107,1946.0000610351562,100,1952.0000610351562,92,1964.0000610351562,88,1971.0000610351562,82,1976.0000610351562,72,1980.0000610351562,67,1984.0000610351562,63,1996.0000610351562,62,2004.0000610351562,56,2012.0000610351562,47,2015.0000610351562,41,2020.0000610351562,35,2026.0000610351562,31,2033.0000610351562,28,2043.0000610351562,32,2061.0000610351562,36,2072.0000610351562,34,2082.0000610351562,36,2092.0000610351562,43,2104.0000610351562,50,2118.0000610351562,54,2130.0000610351562,60,2143.0000610351562,66,2153.0000610351562,65,2163.0000610351562,63,2172.0000610351562,60,2177.0000610351562,55,2186.0000610351562,52,2195.0000610351562,45,2201.0000610351562,43,2216.0000610351562,44,2228.0000610351562,44,2242.0000610351562,54,2252.0000610351562,60,2262.0000610351562,64,2272.0000610351562,70,2284.0000610351562,76,2295.0000610351562,82,2307.0000610351562,84,2321.0000610351562,86,2334.0000610351562,88,2344.0000610351562,87,2356.0000610351562,84,2364.0000610351562,78,2374.0000610351562,75,2378.0000610351562,66,2387.0000610351562,62,2393.0000610351562,56,2395.0000610351562,50,2400.0000610351562,41,2401.0000610351562,36,2406.0000610351562,30,2415.0000610351562,26,2424.0000610351562,18,2433.0000610351562,15,2445.0000610351562,8,2454.0000610351562,0"       />\n<area shape="poly" data-key="russia" id="russia4" alt="Русия" title="Русия" href="#"  coords="3252,0,3258,10,3266,17,3275,23,3289,28,3303,30,3312,34,3312,45,3312,54,3312,65,3311,73,3320,84,3324,95,3324,108,3325,116,3325,123,3322,130,3322,141,3328,153,3335,166,3341,180,3344,187,3348,195,3357,197,3368,198,3380,198,3393,200,3403,201,3411,197,3420,194,3434,196,3447,196,3455,193,3464,190,3475,185,3482,183,3488,176,3495,165,3503,157,3510,147,3516,143,3525,137,3532,134,3537,131,3545,127,3554,126,3565,126,3576,126,3590,124,3594,115,3593,106,3594,100,3603,94,3614,88,3622,85,3631,81,3641,78,3651,77,3662,73,3672,76,3678,86,3682,101,3680,118,3675,131,3677,144,3683,158,3687,174,3684,185,3674,197,3667,201,3663,206,3653,215,3651,222,3645,231,3643,245,3648,255,3647,268,3642,281,3641,293,3643,304,3641,314,3638,325,3635,335,3627,347,3626,360,3634,373,3632,386,3628,397,3624,405,3625,417,3624,431,3620,442,3616,448,3610,456,3604,464,3606,477,3604,491,3598,500,3590,507,3583,515,3580,523,3575,532,3573,544,3573,555,3573,562,3574,573,3566,575,3552,578,3543,573,3534,572,3526,570,3521,566,3516,564,3508,563,3498,562,3492,558,3480,551,3474,550,3467,548,3460,548,3456,551,3448,557,3446,566,3443,575,3438,581,3432,585,3423,590,3415,592,3408,596,3401,598,3394,604,3388,608,3383,615,3385,627,3392,638,3396,653,3402,670,3405,682,3408,693,3412,707,3414,724,3417,743,3421,760,3418,775,3417,790,3416,808,3422,822,3423,834,3423,846,3424,856,3426,867,3425,882,3422,893,3418,904,3414,911,3402,915,3391,920,3381,923,3373,925,3365,930,3356,935,3362,946,3366,958,3364,966,3356,964,3367,977,3375,987,3381,995,3386,987,3391,981,3394,974,3396,970,3400,964,3412,962,3424,964,3434,964,3441,956,3444,947,3452,937,3458,930,3463,920,3466,912,3471,900,3475,891,3481,884,3488,878,3497,875,3506,881,3506,891,3501,894,3495,900,3491,906,3487,913,3490,922,3500,921,3506,914,3511,910,3516,903,3520,895,3524,892,3528,887,3534,883,3542,883,3544,890,3542,896,3537,903,3536,911,3536,920,3540,927,3547,933,3556,933,3565,931,3574,932,3582,934,3590,942,3600,950,3608,956,3617,955,3625,952,3631,948,3641,944,3650,940,3662,937,3674,936,3684,935,3694,930,3703,924,3712,917,3717,913,3725,903,3737,898,3745,893,3752,887,3761,882,3768,876,3775,872,3785,866,3793,863,3802,860,3806,855,3808,846,3811,836,3818,827,3828,822,3836,816,3840,806,3840,794,3846,781,3852,772,3855,763,3858,755,3863,747,3872,744,3880,738,3886,733,3891,727,3896,723,3902,714,3906,710,3911,701,3913,696,3923,685,3927,676,3935,667,3941,660,3948,654,3954,646,3956,636,3963,626,3972,617,3981,608,3991,600,4002,588,4012,577,4020,567,4027,560,4035,548,4041,541,4047,533,4053,524,4058,516,4064,506,4068,497,4073,490,4074,482,4080,471,4083,462,4087,455,4092,448,4096,436,4101,422,4105,412,4108,398,4112,387,4115,378,4120,372,4127,363,4135,356,4142,350,4148,342,4153,334,4156,322,4162,311,4166,301,4172,288,4178,276,4185,264,4196,254,4202,246,4212,238,4221,232,4227,224,4238,213,4246,204,4245.000244140625,194,4244.000244140625,177,4244.000244140625,164,4246.000244140625,148,4250.000244140625,138,4255.000244140625,128,4255.000244140625,116,4253.000244140625,107,4255.000244140625,91,4256.000244140625,80,4256.000244140625,66,4256.000244140625,54,4254.000244140625,41,4251.000244140625,30,4253.000244140625,21,4257.000244140625,13,4265.000244140625,5,4266.000244140625,0"       />\n<area shape="poly" data-key="russia" id="russia5" alt="Русия" title="Русия" href="#"  coords="4376,0,4378,12,4382,25,4384,41,4386,54,4387,71,4388,83,4384,96,4380,107,4376,118,4374,128,4372,140,4370,150,4370,164,4367,176,4364,188,4361,202,4353,208,4354,221,4361,233,4370,248,4377,262,4381,275,4385,285,4384,297,4379,309,4373,316,4370,324,4367,332,4365,344,4366,355,4367,367,4370,381,4370,392,4368,404,4370,418,4368,432,4363,441,4360,448,4355,456,4353,467,4353,481,4354,495,4355,512,4358,526,4365,541,4368,555,4374,552,4383,544,4385,534,4387,524,4388,514,4392,504,4394,496,4398,486,4401,476,4405,471,4410,464,4416,458,4425,455,4431,466,4438,472,4448,472,4457,471,4464,476,4471,486,4475,497,4480,511,4481,523,4485,534,4491,523,4497,512,4498,501,4496,493,4497,483,4496,472,4496,463,4494,452,4487,447,4483,441,4475,440,4471,440,4464,440,4460,430,4458,423,4456,414,4455,404,4451,395,4447,387,4445,380,4440,377,4434,370,4431,364,4425,356,4424,347,4422,338,4418,334,4416,326,4416,318,4415,312,4412,303,4412,293,4415,281,4421,273,4424,262,4427,255,4433,245,4436,234,4440,224,4444,215,4447,207,4448,200,4452,190,4451,176,4452,166,4458,157,4468,150,4477,148,4488,150,4498,150,4513,150,4525,151,4533,160,4544,172,4552,182,4561,191,4567,205,4573,217,4577,227,4587,225,4592,218,4591,208,4590,201,4584,194,4581,191,4576,187,4572,182,4565,173,4563,165,4559,153,4554,145,4553,136,4548,128,4542,121,4540,114,4538,104,4537,95,4536,85,4533,77,4527,66,4524,58,4521,50,4515,41,4513,35,4510,25,4506,16,4505,8,4504,0"       />\n<area shape="poly" data-key="russia" id="russia6" alt="Русия" title="Русия" href="#"  coords="4706,718,4700,727,4694,740,4686,752,4677,765,4668,772,4661,780,4651,787,4647,796,4643,805,4644,818,4654,816,4658,812,4661,805,4664,801,4673,795,4680,790,4682,783,4686,773,4695,764,4704,761,4716,755,4727,750,4736,745,4741,735,4733,733,4723,731,4717,722"       />\n<area shape="poly" data-key="russia" id="russia7" alt="Русия" title="Русия" href="#"  coords="4770,732,4782,735,4792,731,4797,724,4804,721,4811,715,4814,710,4817,702,4824,697,4828,692,4836,684,4842,675,4845,668,4852,666,4863,668,4875,661,4884,653,4891,648,4897,643,4907,636,4918,636,4930,634,4942,632,4946,623,4948,612,4947,603,4941,602,4930,602,4924,612,4918,617,4912,623,4904,626,4896,628,4884,627,4877,626,4874,624,4872,621,4870,617,4864,617,4858,617,4855,624,4852,631,4851,641,4840,646,4832,648,4831,656,4823,666,4814,667,4804,676,4798,682,4796,692,4788,701,4782,707,4774,716,4768,722"       />\n<area shape="poly" data-key="russia" id="russia8" alt="Русия" title="Русия" href="#"  coords="4994,597,5005,594,5014,588,5020,583,5030,574,5036,568,5044,561,5052,554,5061,544,5071,538,5080,528,5078,521,5068,516,5056,521,5047,527,5044,535,5031,547,5023,551,5015,558,5008,566,5002,574,4992,581,4990,588"       />\n<area shape="poly" data-key="russia" id="russia9" alt="Русия" title="Русия" href="#"  coords="5178,447,5190,448,5197,440,5202,433,5207,417,5210,404,5198,412,5193,418,5183,424,5174,437"       />\n\n<area shape="poly" data-key="phillipines" id="phillipines1" alt="Филипини" title="Филипини" href="#"  coords="2648.000244140625,3309.000244140625,2638.000244140625,3309.000244140625,2630.000244140625,3308.000244140625,2622.000244140625,3309.000244140625,2625.000244140625,3302.000244140625,2625.000244140625,3296.000244140625,2620.000244140625,3294.000244140625,2614.000244140625,3294.000244140625,2613.000244140625,3287.000244140625,2612.000244140625,3281.000244140625,2614.000244140625,3276.000244140625,2624.000244140625,3275.000244140625,2628.000244140625,3283.000244140625,2627.000244140625,3289.000244140625,2635.000244140625,3295.000244140625,2644.000244140625,3293.000244140625,2653.000244140625,3298.000244140625,2653.000244140625,3305.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines2" alt="Филипини" title="Филипини" href="#"  coords="2628.000244140625,3268.000244140625,2638.000244140625,3273.000244140625,2649.000244140625,3273.000244140625,2654.000244140625,3268.000244140625,2651.000244140625,3262.000244140625,2649.000244140625,3258.000244140625,2642.000244140625,3256.000244140625,2638.000244140625,3255.000244140625,2633.000244140625,3256.000244140625,2629.000244140625,3261.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines3" alt="Филипини" title="Филипини" href="#"  coords="2670.000244140625,3308.000244140625,2677.000244140625,3309.000244140625,2684.000244140625,3306.000244140625,2691.000244140625,3302.000244140625,2691.000244140625,3296.000244140625,2689.000244140625,3291.000244140625,2685.000244140625,3287.000244140625,2680.000244140625,3286.000244140625,2676.000244140625,3284.000244140625,2672.000244140625,3288.000244140625,2669.000244140625,3292.000244140625,2666.000244140625,3300.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines4" alt="Филипини" title="Филипини" href="#"  coords="2696.000244140625,3324.000244140625,2692.000244140625,3334.000244140625,2688.000244140625,3343.000244140625,2682.000244140625,3352.000244140625,2674.000244140625,3353.000244140625,2664.000244140625,3351.000244140625,2656.000244140625,3344.000244140625,2649.000244140625,3341.000244140625,2642.000244140625,3338.000244140625,2633.000244140625,3336.000244140625,2626.000244140625,3333.000244140625,2621.000244140625,3328.000244140625,2610.000244140625,3324.000244140625,2600.000244140625,3321.000244140625,2590.000244140625,3323.000244140625,2581.000244140625,3328.000244140625,2573.000244140625,3329.000244140625,2569.000244140625,3334.000244140625,2567.000244140625,3342.000244140625,2565.000244140625,3351.000244140625,2560.000244140625,3358.000244140625,2557.000244140625,3366.000244140625,2556.000244140625,3377.000244140625,2552.000244140625,3389.000244140625,2549.000244140625,3396.000244140625,2546.000244140625,3407.000244140625,2551.000244140625,3420.000244140625,2552.000244140625,3432.000244140625,2554.000244140625,3440.000244140625,2553.000244140625,3450.000244140625,2552.000244140625,3461.000244140625,2550.000244140625,3470.000244140625,2548.000244140625,3481.000244140625,2549.000244140625,3492.000244140625,2549.000244140625,3502.000244140625,2548.000244140625,3512.000244140625,2548.000244140625,3519.000244140625,2548.000244140625,3530.000244140625,2544.000244140625,3539.000244140625,2534.000244140625,3544.000244140625,2528.000244140625,3534.000244140625,2525.000244140625,3529.000244140625,2524.000244140625,3525.000244140625,2521.000244140625,3521.000244140625,2520.000244140625,3517.000244140625,2517.000244140625,3514.000244140625,2512.000244140625,3512.000244140625,2504.000244140625,3512.000244140625,2500.000244140625,3517.000244140625,2496.000244140625,3521.000244140625,2496.000244140625,3534.000244140625,2497.000244140625,3543.000244140625,2502.000244140625,3553.000244140625,2506.000244140625,3564.000244140625,2507.000244140625,3574,2508.000244140625,3582,2511.000244140625,3590,2515.000244140625,3598,2518.000244140625,3608,2521.000244140625,3616,2524.000244140625,3624,2526.000244140625,3634,2526.000244140625,3644,2533.000244140625,3652,2541.000244140625,3661,2546.000244140625,3670,2550.000244140625,3679,2555.000244140625,3689,2565.000244140625,3690,2569.000244140625,3686,2569.000244140625,3678,2569.000244140625,3673,2568.000244140625,3666,2569.000244140625,3660,2570.000244140625,3653,2578.000244140625,3654,2585.000244140625,3657,2595.000244140625,3658,2598.000244140625,3666,2598.000244140625,3673,2596.000244140625,3681,2591.000244140625,3686,2588.000244140625,3690,2584.000244140625,3694,2581.000244140625,3695,2577.000244140625,3700,2575.000244140625,3705,2576.000244140625,3714,2575.000244140625,3721,2576.000244140625,3731,2583.000244140625,3731,2587.000244140625,3729,2595.000244140625,3728,2593.000244140625,3734,2592.000244140625,3740,2596.000244140625,3746,2605.000244140625,3750,2612.000244140625,3752,2619.000244140625,3753,2626.000244140625,3754,2634.000244140625,3754,2639.000244140625,3751,2644.000244140625,3748,2648.000244140625,3744,2648.000244140625,3738,2649.000244140625,3733,2650.000244140625,3730,2653.000244140625,3727,2658.000244140625,3724,2665.000244140625,3721,2672.000244140625,3723,2680.000244140625,3726,2684.000244140625,3733,2693.000244140625,3737,2700.000244140625,3742,2706.000244140625,3746,2714.000244140625,3750,2722.000244140625,3756,2728.000244140625,3764,2730.000244140625,3774,2733.000244140625,3784,2741.000244140625,3789,2750.000244140625,3788,2751.000244140625,3782,2751.000244140625,3774,2748.000244140625,3766,2745.000244140625,3760,2741.000244140625,3756,2737.000244140625,3751,2736.000244140625,3748,2734.000244140625,3739,2733.000244140625,3731,2733.000244140625,3724,2744.000244140625,3726,2753.000244140625,3731,2760.000244140625,3740,2767.000244140625,3748,2774.000244140625,3755,2782.000244140625,3758,2790.000244140625,3764,2796.000244140625,3772,2801.000244140625,3784,2806.000244140625,3792,2809.000244140625,3800,2817.000244140625,3806,2829.000244140625,3809,2837.000244140625,3813,2845.000244140625,3817,2852.000244140625,3826,2859.000244140625,3833,2869.000244140625,3840,2876.000244140625,3841,2878.000244140625,3836,2880.000244140625,3830,2878.000244140625,3825,2880.000244140625,3819,2880.000244140625,3813,2878.000244140625,3806,2878.000244140625,3801,2880.000244140625,3797,2877.000244140625,3794,2869.000244140625,3797,2862.000244140625,3796,2855.000244140625,3794,2850.000244140625,3794,2846.000244140625,3793,2847.000244140625,3787,2846.000244140625,3782,2845.000244140625,3774,2841.000244140625,3766,2837.000244140625,3762,2832.000244140625,3758,2829.000244140625,3753,2829.000244140625,3747,2831.000244140625,3741,2839.000244140625,3741,2849.000244140625,3741,2857.000244140625,3739,2860.000244140625,3736,2856.000244140625,3730,2850.000244140625,3728,2844.000244140625,3728,2838.000244140625,3726,2832.000244140625,3725,2826.000244140625,3722,2819.000244140625,3720,2813.000244140625,3716,2810.000244140625,3713,2807.000244140625,3709,2800.000244140625,3708,2794.000244140625,3713,2798.000244140625,3721,2799.000244140625,3732,2795.000244140625,3737,2789.000244140625,3740,2784.000244140625,3737,2784.000244140625,3728,2782.000244140625,3718,2779.000244140625,3712,2778.000244140625,3705,2773.000244140625,3698,2767.000244140625,3693,2759.000244140625,3688,2750.000244140625,3685,2741.000244140625,3685,2734.000244140625,3686,2726.000244140625,3689,2721.000244140625,3692,2713.000244140625,3697,2709.000244140625,3698,2702.000244140625,3697,2698.000244140625,3697,2693.000244140625,3700,2693.000244140625,3707,2696.000244140625,3714,2693.000244140625,3718,2684.000244140625,3716,2678.000244140625,3712,2673.000244140625,3705,2668.000244140625,3698,2665.000244140625,3694,2663.000244140625,3688,2661.000244140625,3681,2661.000244140625,3674,2659.000244140625,3669,2660.000244140625,3665,2661.000244140625,3660,2662.000244140625,3656,2662.000244140625,3650,2658.000244140625,3645,2654.000244140625,3639,2651.000244140625,3630,2647.000244140625,3624,2643.000244140625,3617,2642.000244140625,3611,2640.000244140625,3605,2640.000244140625,3600,2644.000244140625,3596,2645.000244140625,3592,2649.000244140625,3585,2652.000244140625,3582,2655.000244140625,3578,2656.000244140625,3574,2656.000244140625,3569,2657.000244140625,3562,2656.000244140625,3555,2661.000244140625,3549,2665.000244140625,3544,2669.000244140625,3540,2672.000244140625,3535,2678.000244140625,3532,2685.000244140625,3532,2696.000244140625,3532,2701.000244140625,3532,2706.000244140625,3528,2708.000244140625,3524,2708.000244140625,3517,2707.000244140625,3511,2709.000244140625,3505.000244140625,2714.000244140625,3498.000244140625,2717.000244140625,3493.000244140625,2721.000244140625,3486.000244140625,2722.000244140625,3480.000244140625,2725.000244140625,3473.000244140625,2726.000244140625,3465.000244140625,2727.000244140625,3460.000244140625,2728.000244140625,3452.000244140625,2728.000244140625,3445.000244140625,2727.000244140625,3437.000244140625,2721.000244140625,3433.000244140625,2713.000244140625,3426.000244140625,2709.000244140625,3422.000244140625,2705.000244140625,3416.000244140625,2703.000244140625,3410.000244140625,2701.000244140625,3402.000244140625,2701.000244140625,3396.000244140625,2701.000244140625,3389.000244140625,2700.000244140625,3383.000244140625,2700.000244140625,3377.000244140625,2700.000244140625,3373.000244140625,2701.000244140625,3366.000244140625,2702.000244140625,3360.000244140625,2706.000244140625,3354.000244140625,2711.000244140625,3349.000244140625,2710.000244140625,3341.000244140625,2709.000244140625,3336.000244140625,2704.000244140625,3330.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines5" alt="Филипини" title="Филипини" href="#"  coords="2683.000244140625,3667,2682.000244140625,3660,2682.000244140625,3650,2681.000244140625,3643,2679.000244140625,3638,2676.000244140625,3636,2677.000244140625,3630,2682.000244140625,3626,2689.000244140625,3623,2697.000244140625,3625,2701.000244140625,3632,2705.000244140625,3640,2712.000244140625,3645,2716.000244140625,3653,2711.000244140625,3657,2703.000244140625,3658,2700.000244140625,3658,2698.000244140625,3664,2693.000244140625,3668"       />\n<area shape="poly" data-key="phillipines" id="phillipines6" alt="Филипини" title="Филипини" href="#"  coords="2867.000244140625,3752,2880.000244140625,3753,2890.000244140625,3756,2896.000244140625,3753,2902.000244140625,3744,2902.000244140625,3735,2900.000244140625,3730,2897.000244140625,3726,2894.000244140625,3720,2892.000244140625,3713,2888.000244140625,3708,2882.000244140625,3706,2874.000244140625,3704,2876.000244140625,3715,2876.000244140625,3726,2873.000244140625,3738,2869.000244140625,3744"       />\n<area shape="poly" data-key="phillipines" id="phillipines7" alt="Филипини" title="Филипини" href="#"  coords="2553.000244140625,3761,2566.000244140625,3759,2576.000244140625,3762,2588.000244140625,3764,2598.000244140625,3765,2612.000244140625,3765,2621.000244140625,3770,2631.000244140625,3776,2640.000244140625,3784,2652.000244140625,3789,2656.000244140625,3799,2656.000244140625,3810,2655.000244140625,3823,2656.000244140625,3833,2654.000244140625,3841,2652.000244140625,3852,2646.000244140625,3860,2644.000244140625,3867,2635.000244140625,3873,2624.000244140625,3877,2617.000244140625,3875,2610.000244140625,3868,2604.000244140625,3864,2602.000244140625,3856,2603.000244140625,3849,2598.000244140625,3844,2592.000244140625,3841,2588.000244140625,3834,2585.000244140625,3827,2583.000244140625,3818,2582.000244140625,3812,2578.000244140625,3802,2575.000244140625,3794,2570.000244140625,3789,2565.000244140625,3787,2557.000244140625,3784,2551.000244140625,3780,2549.000244140625,3774,2550.000244140625,3768"       />\n<area shape="poly" data-key="phillipines" id="phillipines8" alt="Филипини" title="Филипини" href="#"  coords="2688.000244140625,3786,2700.000244140625,3785,2707.000244140625,3778,2705.000244140625,3768,2703.000244140625,3760,2698.000244140625,3754,2689.000244140625,3754,2680.000244140625,3754,2672.000244140625,3762,2670.000244140625,3769,2678.000244140625,3780"       />\n<area shape="poly" data-key="phillipines" id="phillipines9" alt="Филипини" title="Филипини" href="#"  coords="2693.000244140625,3883,2701.000244140625,3881,2704.000244140625,3874,2705.000244140625,3865,2707.000244140625,3856,2707.000244140625,3844,2705.000244140625,3839,2701.000244140625,3836,2694.000244140625,3836,2689.000244140625,3840,2687.000244140625,3847,2688.000244140625,3857,2688.000244140625,3868,2689.000244140625,3876"       />\n<area shape="poly" data-key="phillipines" id="phillipines10" alt="Филипини" title="Филипини" href="#"  coords="2798.000244140625,3897,2796.000244140625,3885,2796.000244140625,3874,2798.000244140625,3866,2797.000244140625,3858,2797.000244140625,3849,2798.000244140625,3842,2807.000244140625,3839,2818.000244140625,3846,2827.000244140625,3854,2836.000244140625,3861,2844.000244140625,3868,2856.000244140625,3869,2865.000244140625,3876,2872.000244140625,3889,2876.000244140625,3902,2878.000244140625,3916,2869.000244140625,3916,2857.000244140625,3908,2857.000244140625,3901,2850.000244140625,3897,2840.000244140625,3896,2836.000244140625,3890,2834.000244140625,3886,2832.000244140625,3881,2830.000244140625,3876,2826.000244140625,3876,2821.000244140625,3877,2818.000244140625,3881,2814.000244140625,3888,2809.000244140625,3895"       />\n<area shape="poly" data-key="phillipines" id="phillipines11" alt="Филипини" title="Филипини" href="#"  coords="2725.000244140625,3858,2736.000244140625,3866,2746.000244140625,3871,2754.000244140625,3867,2753.000244140625,3861,2752.000244140625,3853,2745.000244140625,3849,2737.000244140625,3845,2729.000244140625,3849"       />\n<area shape="poly" data-key="phillipines" id="phillipines12" alt="Филипини" title="Филипини" href="#"  coords="2517.000244140625,3928.000244140625,2514.000244140625,3921.000244140625,2510.000244140625,3914.000244140625,2509.000244140625,3907.000244140625,2508.000244140625,3898.000244140625,2508.000244140625,3888.000244140625,2510.000244140625,3881.000244140625,2512.000244140625,3876.000244140625,2513.000244140625,3871.000244140625,2523.000244140625,3873.000244140625,2531.000244140625,3877.000244140625,2540.000244140625,3878.000244140625,2549.000244140625,3885.000244140625,2550.000244140625,3892.000244140625,2551.000244140625,3900.000244140625,2548.000244140625,3906.000244140625,2541.000244140625,3904.000244140625,2536.000244140625,3902.000244140625,2533.000244140625,3907.000244140625,2533.000244140625,3917.000244140625,2532.000244140625,3928.000244140625,2525.000244140625,3933.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines13" alt="Филипини" title="Филипини" href="#"  coords="2689.000244140625,4030.000244140625,2688.000244140625,4019.000244140625,2689.000244140625,4011.000244140625,2692.000244140625,4000.000244140625,2694.000244140625,3989.000244140625,2696.000244140625,3978.000244140625,2697.000244140625,3969.000244140625,2698.000244140625,3958.000244140625,2701.000244140625,3946.000244140625,2701.000244140625,3932.000244140625,2701.000244140625,3924.000244140625,2696.000244140625,3915.000244140625,2686.000244140625,3915.000244140625,2683.000244140625,3909.000244140625,2684.000244140625,3901.000244140625,2686.000244140625,3895.000244140625,2697.000244140625,3895.000244140625,2702.000244140625,3901.000244140625,2708.000244140625,3906.000244140625,2715.000244140625,3913.000244140625,2724.000244140625,3913.000244140625,2732.000244140625,3919.000244140625,2740.000244140625,3926.000244140625,2748.000244140625,3929.000244140625,2752.000244140625,3926.000244140625,2758.000244140625,3925.000244140625,2764.000244140625,3924.000244140625,2769.000244140625,3931.000244140625,2774.000244140625,3938.000244140625,2782.000244140625,3937.000244140625,2785.000244140625,3933.000244140625,2792.000244140625,3931.000244140625,2794.000244140625,3940.000244140625,2795.000244140625,3946.000244140625,2794.000244140625,3953.000244140625,2793.000244140625,3960.000244140625,2791.000244140625,3968.000244140625,2787.000244140625,3974.000244140625,2780.000244140625,3978.000244140625,2773.000244140625,3981.000244140625,2766.000244140625,3984.000244140625,2764.000244140625,3992.000244140625,2762.000244140625,4000.000244140625,2762.000244140625,4008.000244140625,2760.000244140625,4015.000244140625,2758.000244140625,4022.000244140625,2757.000244140625,4027.000244140625,2754.000244140625,4034.000244140625,2746.000244140625,4034.000244140625,2739.000244140625,4032.000244140625,2738.000244140625,4024.000244140625,2738.000244140625,4019.000244140625,2735.000244140625,4015.000244140625,2729.000244140625,4014.000244140625,2720.000244140625,4013.000244140625,2715.000244140625,4018.000244140625,2711.000244140625,4025.000244140625,2705.000244140625,4029.000244140625,2700.000244140625,4031.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines14" alt="Филипини" title="Филипини" href="#"  coords="2888,3841.000244140625,2897,3840.000244140625,2911,3841.000244140625,2921,3840.000244140625,2929,3841.000244140625,2936,3838.000244140625,2943,3834.000244140625,2953,3832.000244140625,2961,3830.000244140625,2972,3836.000244140625,2977,3845.000244140625,2982,3853.000244140625,2985,3860.000244140625,2992,3866.000244140625,2994,3874.000244140625,2994,3882.000244140625,2993,3890.000244140625,2993,3897.000244140625,2994,3904.000244140625,2996,3914.000244140625,2997,3922.000244140625,3001,3932.000244140625,3006,3941.000244140625,3011,3949.000244140625,3018,3957.000244140625,3026,3965.000244140625,3028,3975.000244140625,3024,3980.000244140625,3017,3973.000244140625,3012,3966.000244140625,3006,3964.000244140625,2994,3966.000244140625,2986,3970.000244140625,2979,3968.000244140625,2972,3965.000244140625,2968,3961.000244140625,2962,3957.000244140625,2960,3966.000244140625,2959,3972.000244140625,2957,3978.000244140625,2958,3986.000244140625,2959,3996.000244140625,2966,4004.000244140625,2974,4014.000244140625,2976,4025.000244140625,2981,4040.000244140625,2977,4046.000244140625,2979,4057.000244140625,2983,4068.000244140625,2977,4071.000244140625,2972,4065.000244140625,2969,4057.000244140625,2961,4053.000244140625,2956,4058.000244140625,2952,4061.000244140625,2948,4053.000244140625,2943,4048.000244140625,2937,4048.000244140625,2933,4042.000244140625,2934,4036.000244140625,2936,4030.000244140625,2936,4022.000244140625,2937,4013.000244140625,2937,4006.000244140625,2936,4000.000244140625,2933,3993.000244140625,2929,3988.000244140625,2928,3983.000244140625,2922,3981.000244140625,2916,3984.000244140625,2909,3986.000244140625,2905,3981.000244140625,2903,3972.000244140625,2901,3962.000244140625,2900,3954.000244140625,2900,3948.000244140625,2897,3941.000244140625,2896,3935.000244140625,2898,3926.000244140625,2898,3917.000244140625,2907,3914.000244140625,2914,3920.000244140625,2918,3926.000244140625,2920,3934.000244140625,2918,3941.000244140625,2916,3947.000244140625,2924,3952.000244140625,2932,3950.000244140625,2935,3947.000244140625,2939,3943.000244140625,2939,3938.000244140625,2936,3933.000244140625,2934,3930.000244140625,2932,3926.000244140625,2932,3923.000244140625,2933,3918.000244140625,2938,3915.000244140625,2945,3912.000244140625,2944,3907.000244140625,2940,3900.000244140625,2936,3896.000244140625,2932,3892.000244140625,2927,3889.000244140625,2921,3889.000244140625,2914,3885.000244140625,2908,3882.000244140625,2901,3880.000244140625,2897,3874.000244140625,2896,3866.000244140625,2893,3859.000244140625,2891,3853.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines15" alt="Филипини" title="Филипини" href="#"  coords="2828,3987.000244140625,2818,3986.000244140625,2809,3986.000244140625,2801,3985.000244140625,2793,3985.000244140625,2785,3989.000244140625,2782,3992.000244140625,2780,3997.000244140625,2779,4005.000244140625,2775,4011.000244140625,2774,4021.000244140625,2771,4028.000244140625,2769,4036.000244140625,2770,4047.000244140625,2769,4057.000244140625,2766,4064.000244140625,2758,4069.000244140625,2750,4071.000244140625,2741,4072.000244140625,2735,4073.000244140625,2733,4076.000244140625,2730,4084.000244140625,2730,4092.000244140625,2734,4099.000244140625,2739,4108.000244140625,2746,4113.000244140625,2755,4120.000244140625,2764,4124.000244140625,2772,4126.000244140625,2777,4134.000244140625,2778,4144.000244140625,2786,4149.000244140625,2796,4151.000244140625,2805,4149.000244140625,2805,4144.000244140625,2809,4139.000244140625,2808,4134.000244140625,2807,4129.000244140625,2805,4125.000244140625,2801,4120.000244140625,2800,4113.000244140625,2798,4108.000244140625,2797,4104.000244140625,2797,4098.000244140625,2795,4091.000244140625,2797,4086.000244140625,2799,4078.000244140625,2801,4070.000244140625,2805,4064.000244140625,2808,4059.000244140625,2810,4052.000244140625,2810,4045.000244140625,2812,4040.000244140625,2816,4034.000244140625,2818,4026.000244140625,2821,4020.000244140625,2826,4012.000244140625,2828,4006.000244140625,2830,3997.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines16" alt="Филипини" title="Филипини" href="#"  coords="2813,4113.000244140625,2813,4101.000244140625,2813,4093.000244140625,2817,4086.000244140625,2819,4076.000244140625,2819,4068.000244140625,2821,4059.000244140625,2824,4053.000244140625,2828,4045.000244140625,2831,4040.000244140625,2836,4034.000244140625,2841,4028.000244140625,2845,4022.000244140625,2851,4015.000244140625,2857,4009.000244140625,2860,4002.000244140625,2859,3992.000244140625,2860,3983.000244140625,2862,3973.000244140625,2866,3964.000244140625,2872,3973.000244140625,2872,3985.000244140625,2874,3995.000244140625,2876,4006.000244140625,2873,4014.000244140625,2872,4028.000244140625,2870,4035.000244140625,2865,4040.000244140625,2857,4042.000244140625,2852,4045.000244140625,2846,4050.000244140625,2844,4058.000244140625,2843,4064.000244140625,2840,4073.000244140625,2836,4081.000244140625,2832,4090.000244140625,2828,4098.000244140625,2824,4106.000244140625,2821,4112.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines17" alt="Филипини" title="Филипини" href="#"  coords="2859,4099.000244140625,2873,4099.000244140625,2884,4101.000244140625,2893,4100.000244140625,2901,4095.000244140625,2908,4090.000244140625,2918,4085.000244140625,2921,4080.000244140625,2918,4071.000244140625,2913,4062.000244140625,2909,4054.000244140625,2904,4051.000244140625,2898,4050.000244140625,2892,4050.000244140625,2885,4057.000244140625,2882,4064.000244140625,2877,4069.000244140625,2872,4071.000244140625,2865,4074.000244140625,2858,4081.000244140625,2854,4090.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines18" alt="Филипини" title="Филипини" href="#"  coords="3043,4086,3054,4089,3060,4081,3055,4075,3055,4068,3054,4061,3053,4052,3047,4048,3039,4053,3037,4060,3037,4070,3037,4082"       />\n<area shape="poly" data-key="phillipines" id="phillipines19" alt="Филипини" title="Филипини" href="#"  coords="3016,4020.000244140625,3008,4023.000244140625,3002,4029.000244140625,2999,4037.000244140625,2998,4048.000244140625,3001,4056.000244140625,3002,4065.000244140625,3006,4073.000244140625,3002,4079.000244140625,2998,4082.000244140625,2997,4088.000244140625,2997,4096.000244140625,2997,4103.000244140625,3000,4113.000244140625,3003,4124.000244140625,3004,4134.000244140625,3002,4145.000244140625,2997,4153.000244140625,2989,4152.000244140625,2983,4147.000244140625,2980,4143.000244140625,2974,4145.000244140625,2973,4154.000244140625,2970,4164.000244140625,2965,4160.000244140625,2958,4155.000244140625,2953,4152.000244140625,2947,4150.000244140625,2941,4152.000244140625,2942,4162.000244140625,2942,4169.000244140625,2941,4180.000244140625,2940,4188.000244140625,2936,4194.000244140625,2930,4194.000244140625,2924,4192.000244140625,2919,4189.000244140625,2914,4187.000244140625,2909,4187.000244140625,2905,4189.000244140625,2900,4196.000244140625,2899,4204.000244140625,2896,4214.000244140625,2892,4221.000244140625,2886,4228.000244140625,2878,4230.000244140625,2866,4230.000244140625,2862,4230.000244140625,2860,4225.000244140625,2862,4220.000244140625,2861,4213.000244140625,2861,4206.000244140625,2860,4201.000244140625,2857,4196.000244140625,2853,4193.000244140625,2849,4188.000244140625,2844,4182.000244140625,2840,4181.000244140625,2834,4178.000244140625,2829,4178.000244140625,2824,4180.000244140625,2821,4186.000244140625,2820,4189.000244140625,2814,4195.000244140625,2808,4197.000244140625,2800,4198.000244140625,2795,4199.000244140625,2790,4204.000244140625,2785,4208.000244140625,2784,4221.000244140625,2781,4228.000244140625,2773,4230.000244140625,2760,4230.000244140625,2751,4230.000244140625,2738,4231.000244140625,2730,4236.000244140625,2724,4242.000244140625,2719,4248.000244140625,2714,4253.000244140625,2709,4261.000244140625,2709,4270.000244140625,2710,4280.000244140625,2707,4288.000244140625,2705,4298.000244140625,2701,4305.000244140625,2697,4309.000244140625,2692,4316.000244140625,2690,4326.000244140625,2695,4336.000244140625,2704,4341.000244140625,2714,4340.000244140625,2720,4336.000244140625,2726,4329.000244140625,2727,4322.000244140625,2731,4312.000244140625,2731,4301.000244140625,2734,4294.000244140625,2736,4286.000244140625,2740,4281.000244140625,2742,4273.000244140625,2745,4269.000244140625,2751,4264.000244140625,2757,4262.000244140625,2767,4263.000244140625,2770,4275.000244140625,2768,4284.000244140625,2766,4292.000244140625,2769,4301.000244140625,2778,4305.000244140625,2785,4300.000244140625,2789,4296.000244140625,2789,4289.000244140625,2788,4285.000244140625,2788,4278.000244140625,2794,4276.000244140625,2798,4285.000244140625,2807,4288.000244140625,2816,4290.000244140625,2825,4297.000244140625,2826,4289.000244140625,2825,4284.000244140625,2825,4278.000244140625,2826,4270.000244140625,2830,4266.000244140625,2836,4264.000244140625,2846,4263.000244140625,2857,4268.000244140625,2868,4273.000244140625,2879,4277.000244140625,2884,4284.000244140625,2890,4290.000244140625,2892,4299.000244140625,2890,4306.000244140625,2887,4314.000244140625,2882,4319.000244140625,2877,4325.000244140625,2874,4332.000244140625,2872,4336.000244140625,2875,4344.000244140625,2877,4353.000244140625,2877,4361.000244140625,2876,4369.000244140625,2880,4377.000244140625,2885,4386.00048828125,2894,4392.00048828125,2901,4397.00048828125,2909,4401.00048828125,2920,4406.00048828125,2927,4409.00048828125,2936,4412.00048828125,2945,4416.00048828125,2952,4418.00048828125,2960,4421.00048828125,2968,4418.00048828125,2968,4413.00048828125,2973,4406.00048828125,2980,4407.00048828125,2987,4414.00048828125,2984,4420.00048828125,2982,4428.00048828125,2981,4435.00048828125,2986,4444.00048828125,2993,4448.00048828125,3001,4442.00048828125,3005,4438.00048828125,3009,4434.00048828125,3014,4431.00048828125,3016,4424.00048828125,3016,4421.00048828125,3019,4416.00048828125,3022,4412.00048828125,3024,4406.00048828125,3024,4398.00048828125,3022,4392.00048828125,3021,4385.00048828125,3018,4380.00048828125,3016,4374.00048828125,3013,4369.00048828125,3008,4364.00048828125,3002,4358.00048828125,2997,4352.00048828125,2995,4346.00048828125,2997,4339.00048828125,2999,4336.00048828125,3004,4332.00048828125,3010,4326.00048828125,3013,4324.00048828125,3019,4320.00048828125,3028,4321.00048828125,3027,4316.00048828125,3020,4309.00048828125,3017,4304.00048828125,3021,4299.00048828125,3025,4296.00048828125,3031,4294.00048828125,3035,4301.00048828125,3040,4308.00048828125,3045,4317.00048828125,3048,4325.00048828125,3050,4334.00048828125,3051,4342.00048828125,3052,4353.00048828125,3057,4364.00048828125,3061,4378.00048828125,3070,4376.00048828125,3072,4363.00048828125,3072,4353.00048828125,3073,4346.00048828125,3073,4340.00048828125,3074,4334.00048828125,3074,4328.00048828125,3078,4323.00048828125,3086,4319.00048828125,3090,4316.00048828125,3094,4311.00048828125,3098,4305.00048828125,3103,4298.00048828125,3104,4289.00048828125,3103,4280.00048828125,3102,4271.00048828125,3101,4262.00048828125,3096,4256.00048828125,3088,4254.00048828125,3082,4249.00048828125,3079,4244.00048828125,3080,4237.00048828125,3081,4231.00048828125,3085,4226.00048828125,3085,4221.00048828125,3082,4215.00048828125,3079,4210.00048828125,3075,4206.00048828125,3076,4197.00048828125,3076,4190.00048828125,3073,4186.00048828125,3067,4187.00048828125,3061,4185.00048828125,3057,4182.00048828125,3056,4176.00048828125,3061,4171.00048828125,3065,4169.00048828125,3072,4166.00048828125,3077,4162.00048828125,3074,4154.00048828125,3073,4153.00048828125,3069,4145.00048828125,3067,4143.00048828125,3065,4135.00048828125,3064,4130.00048828125,3064,4125.00048828125,3063,4121.00048828125,3057,4120.000244140625,3049,4116.000244140625,3044,4112.000244140625,3039,4108.000244140625,3033,4105.000244140625,3028,4102.000244140625,3024,4100.000244140625,3018,4094.000244140625,3017,4090.000244140625,3018,4081.000244140625,3019,4072.000244140625,3018,4065.000244140625,3017,4061.000244140625,3016,4056.000244140625,3014,4050.000244140625,3014,4043.000244140625,3014,4037.000244140625,3014,4033.000244140625,3015,4026.000244140625"       />\n<area shape="poly" data-key="phillipines" id="phillipines20" alt="Филипини" title="Филипини" href="#"  coords="2688.0001220703125,4376.00048828125,2698.0001220703125,4380.00048828125,2708.0001220703125,4385.00048828125,2718.0001220703125,4382.00048828125,2729.0001220703125,4375.00048828125,2730.0001220703125,4367.00048828125,2728.0001220703125,4361.00048828125,2720.0001220703125,4358.00048828125,2707.0001220703125,4357.00048828125,2700.0001220703125,4355.00048828125,2691.0001220703125,4357.00048828125,2686.0001220703125,4364.00048828125,2686.0001220703125,4372.00048828125"       />\n<area shape="poly" data-key="phillipines" id="phillipines21" alt="Филипини" title="Филипини" href="#"  coords="2609.0001220703125,4431.00048828125,2620.0001220703125,4432.00048828125,2630.0001220703125,4428.00048828125,2642.0001220703125,4429.00048828125,2653.0001220703125,4426.00048828125,2657.0001220703125,4417.00048828125,2653.0001220703125,4411.00048828125,2644.0001220703125,4411.00048828125,2635.0001220703125,4412.00048828125,2626.0001220703125,4412.00048828125,2618.0001220703125,4411.00048828125,2610.0001220703125,4415.00048828125,2606.0001220703125,4421.00048828125"       />\n<area shape="poly" data-key="phillipines" id="phillipines22" alt="Филипини" title="Филипини" href="#"  coords="2551.0001220703125,4470.00048828125,2541.0001220703125,4473.00048828125,2530.0001220703125,4478.00048828125,2523.0001220703125,4487.00048828125,2512.0001220703125,4492.00048828125,2520.0001220703125,4496.00048828125,2536.0001220703125,4494.00048828125,2550.0001220703125,4494.00048828125,2560.0001220703125,4494.00048828125,2566.0001220703125,4489.00048828125,2565.0001220703125,4482.00048828125,2559.0001220703125,4478.00048828125"       />\n<area shape="poly" data-key="phillipines" id="phillipines23" alt="Филипини" title="Филипини" href="#"  coords="2284.0001220703125,4210.000244140625,2284.0001220703125,4202.000244140625,2289.0001220703125,4192.000244140625,2294.0001220703125,4185.000244140625,2302.0001220703125,4177.000244140625,2309.0001220703125,4170.000244140625,2316.0001220703125,4161.000244140625,2323.0001220703125,4156.000244140625,2333.0001220703125,4149.000244140625,2342.0001220703125,4141.000244140625,2353.0001220703125,4135.000244140625,2361.0001220703125,4129.000244140625,2369.0001220703125,4120.000244140625,2377.0001220703125,4111.000244140625,2385.0001220703125,4104.000244140625,2393.0001220703125,4096.000244140625,2399.0001220703125,4086.000244140625,2404.0001220703125,4077.000244140625,2413.0001220703125,4065.000244140625,2422.0001220703125,4056.000244140625,2429.0001220703125,4049.000244140625,2437.0001220703125,4043.000244140625,2445.0001220703125,4033.000244140625,2454.0001220703125,4024.000244140625,2461.0001220703125,4016.000244140625,2462.0001220703125,4005.000244140625,2462.0001220703125,3997.000244140625,2462.0001220703125,3990.000244140625,2465.0001220703125,3980.000244140625,2465.0001220703125,3971.000244140625,2467.0001220703125,3962.000244140625,2468.0001220703125,3957.000244140625,2476.0001220703125,3950.000244140625,2484.0001220703125,3945.000244140625,2488.0001220703125,3957.000244140625,2488.0001220703125,3967.000244140625,2489.0001220703125,3977.000244140625,2489.0001220703125,3985.000244140625,2485.0001220703125,3989.000244140625,2486.0001220703125,3997.000244140625,2489.0001220703125,4007.000244140625,2493.0001220703125,4016.000244140625,2502.0001220703125,4017.000244140625,2508.0001220703125,4014.000244140625,2516.0001220703125,4012.000244140625,2524.0001220703125,4018.000244140625,2525.0001220703125,4026.000244140625,2518.0001220703125,4036.000244140625,2509.0001220703125,4038.000244140625,2501.0001220703125,4033.000244140625,2495.0001220703125,4031.000244140625,2493.0001220703125,4039.000244140625,2485.0001220703125,4042.000244140625,2475.0001220703125,4044.000244140625,2468.0001220703125,4045.000244140625,2462.0001220703125,4054.000244140625,2460.0001220703125,4061.000244140625,2457.0001220703125,4069.000244140625,2447.0001220703125,4073.000244140625,2437.0001220703125,4073.000244140625,2429.0001220703125,4074.000244140625,2420.0001220703125,4079.000244140625,2417.0001220703125,4086,2416.0001220703125,4096,2412.0001220703125,4105,2409.0001220703125,4113,2405.0001220703125,4119,2400.0001220703125,4126,2393.0001220703125,4133,2387.0001220703125,4140,2380.0001220703125,4143,2370.0001220703125,4148,2363.0001220703125,4150,2358.0001220703125,4157,2356.0001220703125,4165,2354.0001220703125,4171,2346.0001220703125,4175,2339.0001220703125,4181,2333.0001220703125,4182,2325.0001220703125,4186,2319.0001220703125,4190,2314.0001220703125,4197,2309.0001220703125,4204,2295.0001220703125,4209"       />\n<area shape="poly" data-key="phillipines" id="phillipines24" alt="Филипини" title="Филипини" href="#"  coords="2269.0001220703125,4231.000244140625,2265.0001220703125,4241.000244140625,2265.0001220703125,4254.000244140625,2275.0001220703125,4256.000244140625,2279.0001220703125,4244.000244140625,2277.0001220703125,4234.000244140625"       />\n
\.


--
-- Data for Name: search_groupedbattles; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_groupedbattles (id, group_id_id, battle_tag_id) FROM stdin;
1	1	9
2	1	11
3	1	17
\.


--
-- Data for Name: search_messages; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_messages (id, person_name, person_email, person_subject, person_description, person_ip_addr) FROM stdin;
\.


--
-- Data for Name: search_people; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_people (name_id, name, shortened_name, achievements, fate, country_code_id) FROM stdin;
HB	Хенри Гордън Бенет	Х. Бенет	Орден на банята	умира на 1 август 1962г. от сърдечни проблеми	au
JC	Джон Августин Колинс	Д. Колинс	Орден на Британската империя	умира на 3 септември 1989г. 	au
JL	Джон Келбърн Лоусън	Д. Лоусън	Croix de Guerre (Военен кръст)	убит в битка на 19 декември 1941г.	ca
BC	Бай Чонгкси	Б. Чонгкси	Орден на синьото небе и бялото слънце	умира на 2 декември 1966г. от церебрална тромбоза	cn
CCha	Чан Чак	Ч. Чак	Орден на Британската империя	умира на 31 август 1949г. от стомашна язва	cn
CChe	Чен Ченг	Ч. Ченг	Орден на синьото небе и бялото слънце	умира на 5 март 1965г. от рак на черния дроб	cn
CK	Чан Кайшъ	Ч. Кайшъ	Орден на националната слава	умира на 5 април 1975г. от бъбречна недостатъчност	cn
FX	Фанг Ксианджу 	Ф. Ксианджу	Орден на синьото небе и бялото слънце	умира през 1983г. от естествени причини	cn
FY	Фенг Юйсян	Ф. Юйсян		умира в пожар на 1 септември 1948г. 	cn
GL	Гуан Линженг	Г. Линженг	Орден на синьото небе и бялото слънце	умира на 1 август 1980г. 	cn
HD	Хан Декин	Х. Декин	Орден на свещения триножник	умира на 15 август 1988г. 	cn
HYi	Хе Инцин	Х. Инцин	Орден на синьото небе и бялото слънце	умира на 21 октомври 1987г. от апоплексия	cn
LY	Ляо Яоксианг	Л. Яоксианг	Орден на синьото небе и бялото слънце	умира на 2 декември 1968г. от инфаркт	cn
LZ	Ли Цунжен	Л. Цунжен		умира на 30 януари 1969г. от рак на дванадесетопръстника	cn
PB	Панг Бингчун	П. Бингчун	Орден на синьото небе и бялото слънце	умира на 12 януари 1963г. 	cn
SL	Сун Лианджонг	С. Лианджонг	Орден на синьото небе и бялото слънце	умира на 1 август 1990г. 	cn
SZ	Сун Жен	С. Жен		умира през 1985г. 	cn
TE	Танг Енбо	Т. Енбо	Орден на синьото небе и бялото слънце	умира на 29 юни 1954г. след операция	cn
TSh	Танг Шенджи	Т. Шенджи	Орден на синьото небе и бялото слънце	умира на 6 април 1970г.	cn
WY	Уанг Яоу	У. Яоу	Орден на синьото небе и бялото слънце	умира на 3 юли 1968г. от инфаркт	cn
XY	Ксюе Юи	К. Юи	Орден на синьото небе и бялото слънце	умира на 3 май 1998г. 	cn
YSen	Ян Сен	Я. Сен	Орден на синьото небе и бялото слънце	умира на 15 май 1977г. 	cn
ZF	Джанг Факуй	Д. Факуй	Орден на синьото небе и бялото слънце	умира на 10 март 1980г. 	cn
ZL	Джанг Лингфу	Д. Лингфу	Орден на свещения триножник	убит в битка на 16 май 1947г., по време на Китайската гражданска война	cn
ZZh	Жи-Жонг Жанг	Ж. Жанг		умира на 10 април 1969г. 	cn
ZZi	Джанг Зиджонг	Д. Зиджонг	Орден на синьото небе и бялото слънце	убит в битка на 16 май 1940г.	cn
CNa	Чучи Нагумо	Ч. Нагумо	Орден на изгряващото слънце	самоубива се на 6 юли 1944г. в битката за Сайпан	jp
EH	Хирохито	Хирохито	Висш орден на хризантемата	умира на 7 януари 1989г. от вътрешен кръвоизлив	jp
HI	Хитоши Имамура	Х. Имамура	Орден на изгряващото слънце	умира на 4 октомври 1968г. 	jp
HT	Хидеки Тоджо	Х. Тоджо	Орден на изгряващото слънце	осъден на смърт и обесен на 23 декември 1948г.	jp
HYah	Хиромичи Яхара 	Х. Яхара		умира на 7 май 1981г. 	jp
HYan	Хейсуке Янагава	Х. Янагава		умира на 22 януари 1945г.	jp
IC	Исаму Чо 	И. Чо		самоубива се на 22 юни 1945г. в битката за Окинава	jp
IM	Иване Мацуи	И. Мацуи	Орден на изгряващото слънце	осъден на смърт и обесен на 23 декември 1948г.	jp
IYa	Исоруко Ямамото	И. Ямамото	Висш орден на хризантемата	умира на 18 април 1943г. след като самолетът му бива свален	jp
IYo	Исаму Йокояма	И. Йокояма		умира на 21 април 1952г. в затвор, очаквайки присъда	jp
JOz	Джисабуро Озава	Д. Озава	Орден на сакралното съкровище	умира на 9 ноември 1966г. 	jp
KH	Кийоши Хасегава	К. Хасегава	Орден на изгряващото слънце	умира на 2 септември 1970г. 	jp
KK	Какуджи Какута	К. Какута		самоубива се на 2 август 1944г. след битката за Тиниан	jp
KNakag	Кунио Накагава	К. Накагава	Орден на златното хвърчило	самоубива се на 24 ноември 1944г. по време на битката за Пелелиу	jp
KNakaj	Кесаго Накаджима	К. Накаджима		умира на 28 октомври 1945г. след боледуване	jp
KS	Кийохиде Шима	К. Шима	Орден на изгряващото слънце	умира на 7 ноември 1973г. 	jp
MF	Мицуо Фучида	М. Фучидо		умира на 30 май 1976г. поради усложнения от диабет	jp
MH	Масахару Хома	М. Хома		осъден на смърт и разстрелян на 3 април 1946г.	jp
MK	Минеичи Кога	М. Кога	Орден на изгряващото слънце	умира на 31 март 1944г. в самолетна катастрофа	jp
MO	Минору Ота	М. Ота		самоубива се на 13 юни 1945г. по време на битката за Окинава	jp
MUg	Матоме Угаки	М. Угаки		извършва камикадзе самоубийство на 15 август 1945г.	jp
MUs	Мицуру Ушиджима	М. Ушуджима	Орден на сакралното съкровище	самоубива се на 22 юни 1945г. в битката за Окинава	jp
NH	Нарухико Хигишукини	Н. Хигишукини	Висш орден на хризантемата	умира на 20 януари 1990г. от сърдечна недостатъчност	jp
NKo	Нобутаке Кондо	Н. Кондо	Орден на изгряващото слънце	умира на 19 февруари 1953г.	jp
RI	Ренсуке Исогаи	Р. Исогаи	Орден на изгряващото слънце	умира на 6 юни 1967г. 	jp
RM	Реня Мутагучи	Р. Мутагучи		умира на 2 август 1966г.	jp
SHa	Шунуру Хата	Ш. Хата	Орден на изгряващото слънце	умира на 10 май 1962г. по време на церемония	jp
SIn	Сада Инуе	С. Инуе		умира на 26 октомври 1961г.	jp
SIta	Сейширо Итагаки	С. Итагаки		осъден на смърт и обесен на 23 декември 1948г.	jp
SIw	Санджи Ивабучи	С. Ивабучи		самоубива се с граната на 26 февруари 1945г. след битката за Манила	jp
SK	Сеичи Кита	С. Кита		умира на 7 август 1952г. в съветски военнопленнически лагер	jp
SN	Шоджи Нишимура	Ш. Нишимура	Орден на изгряващото слънце	умира на 24 октомври 1944г. след като корабът му бива потопен	jp
SIto	Сеичи Ито	С. Ито		умира на 7 април 1945г. след потъването на кораба Ямато	jp
SS	Сосаку Сузуки	С. Сузуки		убит на 19 април 1945г. в битката за Лейте	jp
STs	Шимицу Тсуненори	Ш. Тсуненори		умира на 19 юни 1969г.	jp
STa	Шизуи Танака	Ш. Танака	Орден на изгряващото слънце	самоубива се на 24 август 1945г. 	jp
TKurib	Тадамичи Курибаяши	Курибаяши	Орден на изгряващото слънце	убит на 26 март 1945г. в битката за Иво Джима	jp
TKurit	Такео Курита	Т. Курита	Орден на сакралното съкровище	умира на 19 декември 1977г.	jp
TNishi	Тачичи Ниши	Т. Ниши		убит на 22 март 1945г. в битката за Иво Джима	jp
TNishim	Такума Нишимура	Т. Нишимура		осъден на смърт и обесен на 11 юни 1951г.	jp
TSa	Такаши Сакаи	Т. Сакаи		осъден на смърт и разстрелян на 30 септември 1946г.	jp
TT	Такео Такаги	Т. Такаги	Орден на изгряващото слънце	убит на 8 юли 1944г. в битката за Сайпан	jp
TY	Томоюки Ямашита	Т. Ямашита	Орден на изгряващото слънце	осъден на смърт и обесен на 23 февруари 1946г.	jp
YO	Ясуд Окамура	Я. Окамура	Орден на изгряващото слънце	умира на 2 септември 1966г.	jp
YSa	Йошитсугу Саито	Й. Саито		самоубива се на 10 юли 1944г. по време на битката за Сайпан	jp
YSek	Юкио Секи	Ю. Секи		самоубива се в камикадзе атака на 25 октомври 1944г.	jp
CH	Конрад Хелфрих	К. Хелфрих	Орден на нидерландския лъв	умира на 20 септември 1962г.	nl
KD	Карел Дорман	К. Дорман	Военен орден на Уилям	убит на 28 февруари 1942г. в битката в Яванско море	nl
AS	Алфредо Монапат Сантос	А. Сантос	Филипински легион на честта	умира на 7 февруари 1990г.	ph
SOs	Серджо Осменя Старши	С. Осменя		умира на 19 октомври 1961г. от белодробен оток	ph
VL	Висенте Подико Лим	В. Лим	Легион за заслуги	екзекутиран на 31 декември 1944г.	ph
AB	Афанасий Белобородов	А. Белобородов	Герой на Съветския съюз	умира на 1 септември 1990г.	su
KM	Кирил Мерецков	К. Мерецков	Орден на победата	умира на 30 декември 1968г.	su
NKr	Николай Крилов	Н. Крилов	Герой на Съветския съюз	умира на 9 февруари 1972г.	su
AP	Артър Ърнест Пърсивал	А. Пърсивал	Орден на банята	умира на 31 януари 1966г.	uk
CM	Кристофър Майкъл Малти	К. Малти	Орден на банята	умира на 6 септември 1980г.	uk
LH	Луис Макълсфийлд Хийт	Л. Хийт	Орден на Британската империя	умира на 10 януари 1954г.	uk
MS	Мертън Бекуит-Смит	М. Смит	Орден за отлична служба	умира от дифтерия на 11 ноември 1942г. във военнопленнически лагер	uk
MY	Марк Айтисън Йънг	М. Йънг		умира на 12 май 1974г.	uk
CCa	Клифтън Бледсо Кейтс	К. Кейтс	Военноморски кръст	умира на 4 юни 1970г. след дълго боледуване	us
CE	Клавдий Милър Если	К. Если	Легион за заслуги	убит на 19 юни 1945г. в битката за Окинава	us
CNi	Честър Уилям Нимиц Старши	Ч. Нимиц	Военноморски медал за отлична служба	умира на 20 февруари 1966г. от пневмония	us
CSp	Клифтън Албърт Фредерик Спраг	К. Спраг	Военноморски кръст	умира на 11 април 1955г. от инфаркт	us
CSw	Чарлс Суини	Ч. Суини	Сребърна звезда	умира на 16 юли 2004г.	us
DM	Дъглас Макартър	Д. Макартър	Медал на честта	умира на 5 април 1964г. от първична билиарна цироза	us
EK	Едуард Постел Кинг Младши	Е. Кинг	Орден за отлична служба	умира на 31 август 1958г.	us
FA	Фредерик Линкълн Ашуърт	Ф. Ашуърт	Орден за отлична служба	умира на 3 декември 2005г. по време на сърдечна операция	us
FDR	Франклин Делано Рузвелт	Ф. Рузвелт		умира на 12 април 1945г. от церебрален кръвоизлив	us
FF	Франк Джак Флетчер	Ф. Флетчър	Медал на честта	умира на 25 април 1973г.	us
FS	Франклин Къмингс Сибер	Ф. Сибер	Орден за отлична служба	умира на 24 юни 1980г.	us
GE	Грейвс Бланшард Ерскин	Г. Ерскин	Военноморски медал за отлична служба	умира на 21 май 1973г.	us
GM	Джордж Флеминг Мур	Д. Мур	Орден за отлична служба	самоубива се на 2 декември 1949г.	us
GP	Джордж Маршал Паркър Младши	Д. Паркър	Орден за отлична служба	умира на 25 октомври 1968г.	us
HHan	Херман Хенри Ханкен	Х. Ханкен	Медал на честта	умира на 23 август 1986г.	us
HHar	Харолд Дъглас Харис	Х. Харис	Легион за заслуги	умира на 20 септември 1984г.	us
HK	Хъсбанд Едуард Кимел	Х. Кимел	Мексикански медал за заслуги	умира на 14 май 1968г.	us
HSc	Хари Шмидт	Х. Шмидт	Военноморски кръст	умира на 10 февруари 1968г.	us
HSm	Холанд Мактайър Смит	Х. Смит	Военноморски медал за отлична служба	умира на 12 януари 1967г. след дълго боледуване	us
JH	Джон Рийд Ходж	Д. Ходж	Орден за отлична служба	умира на 12 ноември 1963г.	us
JM	Джон Уилям Митчел	Д. Митчел	Военноморски кръст	умира на 15 ноември 1995г.	us
JOl	Джеси Барет Олдендорф	Д. Олдендорф	Военноморски кръст	умира на 27 април 1974г.	us
JSt	Джоузеф Уорън Стилуел	Д. Стилуел	Орден за отлична служба	умира на 12 октомври 1946г. от рак на стомаха	us
JSw	Джоузеф Мей Суинг	Д. Суинг	Орден за отлична служба	умира на 9 декември 1984г.	us
JW	Джонатан Мейхю Уейнрайт	Д. Уейнрайт	Медал на честта	умира на 2 септември 1953г. от инсулт	us
KR	Келер Емрик Роки	К. Роки	Военноморски кръст	умира на 6 юни 1970г. от инфаркт	us
LP	Луис Бъруел Пулър	Л. Пулър	Военноморски кръст	умира на 11 октомври 1971г.	us
MM	Марк Андрю Митчър	М. Митчър	Военноморски кръст	умира на 3 февруари 1947г. от инфаркт	us
OG	Оскар Уолвертън Грисуулд	О. Грисуулд	Орден за отлична служба	умира на 28 септември 1959г.	us
PM	Пол Джон Мюлер	П. Мюлер	Военноморски медал за отлична служба	умира на 25 септември 1964г.	us
PT	Пол Уорфилд Тибетс Младши	П. Тибетс	Легион за заслуги	умира на 1 ноември 2007г. след множество инсулти	us
RB	Робърт Спрег Бейтлер	Р. Бейтлер	Орден за отлична служба	умира на 12 февруари 1978г.	us
RE	Робърт Лорънс Айшелбергер	Р. Айшелбергер	Орден за отлична служба	умира на 26 септември 1961г. от пневмония	us
RG	Рой Стенли Гейгър	Р. Гейгър	Военноморски кръст	умира на 23 януари 1947г. от рак на белите дробове	us
RS	Реймънд Еймс Спрюанс	Р. Спрюанс	Военноморски кръст	умира на 13 декември 1969г.	us
RT	Ричмънд Кели Търнър	Р. Търнър	Военноморски кръст	умира на 12 февруари 1961г.	us
SB	Симон Боливар Бъкър Младши	С. Бъкър	Орден за отлична служба	убит на 18 юни 1945г. в битката за Окинава	us
SHo	Самюъл Луц Хауърд	С. Хауърд	Военноморски кръст	умира на 12 октомври 1960г.	us
TKi	Томас Касин Кинкайд	Т. Кинкайд	Военноморски медал за отлична служба	умира на 17 ноември 1972г.	us
WB	Уилям Хенри Пърнел Бленди	У. Бленди	Орден за отлична служба	умира на 12 януари 1954г.	us
WC	Уилям Къртис Чейс	У. Чейс	Орден за отлична служба	умира на 21 август 1986г.	us
WH	Уилям Фредерик Халси Младши	У. Халси	Военноморски кръст	умира на 16 декември 1959г.	us
WK	Уолтър Крюгер	У. Крюгер	Орден за отлична служба	умира на 20 август 1967г. от пневмония	us
WP	Уилям Стърлинг Парсънс	У. Парсънс	Военноморски медал за отлична служба	умира на 5 декември 1953г.	us
WR	Уилям Хенри Рупърт	У. Рупърт	Военноморски кръст	умира на 25 март 1945г. от инфаркт	us
WS	Уолтър Кембъл Шорт	У. Шорт	Орден за отлична служба	умира на 3 септември 1949г.	us
\.


--
-- Data for Name: search_peoplephotos; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_peoplephotos (photo_id, description, used_as, person_code_id) FROM stdin;
HB.jpg	\N	thumbnail	HB
JC.jpg	\N	thumbnail	JC
JL.jpg	\N	thumbnail	JL
BC.jpg	\N	thumbnail	BC
CCha.jpg	\N	thumbnail	CCha
CChe.jpg	\N	thumbnail	CChe
CK.jpg	\N	thumbnail	CK
FX.jpg	\N	thumbnail	FX
FY.jpg	\N	thumbnail	FY
GL.jpg	\N	thumbnail	GL
HD.jpg	\N	thumbnail	HD
LY.jpg	\N	thumbnail	LY
LZ.jpg	\N	thumbnail	LZ
PB.jpg	\N	thumbnail	PB
SL.jpg	\N	thumbnail	SL
SZ.jpg	\N	thumbnail	SZ
TE.jpg	\N	thumbnail	TE
TSh.jpg	\N	thumbnail	TSh
WY.jpg	\N	thumbnail	WY
XY.jpg	\N	thumbnail	XY
YSen.jpg	\N	thumbnail	YSen
ZF.jpg	\N	thumbnail	ZF
ZL.jpg	\N	thumbnail	ZL
ZZh.jpg	\N	thumbnail	ZZh
ZZi.jpg	\N	thumbnail	ZZi
CNa.jpg	\N	thumbnail	CNa
EH.jpg	\N	thumbnail	EH
HI.jpg	\N	thumbnail	HI
HT.jpg	\N	thumbnail	HT
HYah.jpg	\N	thumbnail	HYah
HYan.jpg	\N	thumbnail	HYan
IC.jpg	\N	thumbnail	IC
IM.jpg	\N	thumbnail	IM
IYa.jpg	\N	thumbnail	IYa
IYo.jpg	\N	thumbnail	IYo
JOz.jpg	\N	thumbnail	JOz
KH.jpg	\N	thumbnail	KH
KK.jpg	\N	thumbnail	KK
KNakag.jpg	\N	thumbnail	KNakag
KNakaj.jpg	\N	thumbnail	KNakaj
KS.jpg	\N	thumbnail	KS
MF.jpg	\N	thumbnail	MF
MH.jpg	\N	thumbnail	MH
MK.jpg	\N	thumbnail	MK
MO.jpg	\N	thumbnail	MO
MUg.jpg	\N	thumbnail	MUg
MUs.jpg	\N	thumbnail	MUs
NH.jpg	\N	thumbnail	NH
NKo.jpg	\N	thumbnail	NKo
RI.jpg	\N	thumbnail	RI
RM.jpg	\N	thumbnail	RM
SHa.jpg	\N	thumbnail	SHa
SIw.jpg	\N	thumbnail	SIw
SK.jpg	\N	thumbnail	SK
SN.jpg	\N	thumbnail	SN
SIto.jpg	\N	thumbnail	SIto
SS.jpg	\N	thumbnail	SS
STs.jpg	\N	thumbnail	STs
STa.jpg	\N	thumbnail	STa
TKurit.jpg	\N	thumbnail	TKurit
TNishi.jpg	\N	thumbnail	TNishi
TNishim.jpg	\N	thumbnail	TNishim
TSa.jpg	\N	thumbnail	TSa
TT.jpg	\N	thumbnail	TT
TY.jpg	\N	thumbnail	TY
YO.jpg	\N	thumbnail	YO
YSa.jpg	\N	thumbnail	YSa
YSek.jpg	\N	thumbnail	YSek
CH.jpg	\N	thumbnail	CH
KD.jpg	\N	thumbnail	KD
AS.jpg	\N	thumbnail	AS
SOs.jpg	\N	thumbnail	SOs
VL.jpg	\N	thumbnail	VL
AB.jpg	\N	thumbnail	AB
KM.jpg	\N	thumbnail	KM
NKr.jpg	\N	thumbnail	NKr
AP.jpg	\N	thumbnail	AP
CM.jpg	\N	thumbnail	CM
LH.jpg	\N	thumbnail	LH
MS.jpg	\N	thumbnail	MS
MY.jpg	\N	thumbnail	MY
CCa.jpg	\N	thumbnail	CCa
CE.jpg	\N	thumbnail	CE
CNi.jpg	\N	thumbnail	CNi
CSp.jpg	\N	thumbnail	CSp
CSw.jpg	\N	thumbnail	CSw
DM.jpg	\N	thumbnail	DM
EK.jpg	\N	thumbnail	EK
FA.jpg	\N	thumbnail	FA
FDR.jpg	\N	thumbnail	FDR
FF.jpg	\N	thumbnail	FF
FS.jpg	\N	thumbnail	FS
GE.jpg	\N	thumbnail	GE
GM.jpg	\N	thumbnail	GM
GP.jpg	\N	thumbnail	GP
HHan.jpg	\N	thumbnail	HHan
HHar.jpg	\N	thumbnail	HHar
HK.jpg	\N	thumbnail	HK
HSc.jpg	\N	thumbnail	HSc
HSm.jpg	\N	thumbnail	HSm
JH.jpg	\N	thumbnail	JH
JM.jpg	\N	thumbnail	JM
JOl.jpg	\N	thumbnail	JOl
JSt.jpg	\N	thumbnail	JSt
JSw.jpg	\N	thumbnail	JSw
JW.jpg	\N	thumbnail	JW
KR.jpg	\N	thumbnail	KR
LP.jpg	\N	thumbnail	LP
MM.jpg	\N	thumbnail	MM
OG.jpg	\N	thumbnail	OG
PM.jpg	\N	thumbnail	PM
PT.jpg	\N	thumbnail	PT
RB.jpg	\N	thumbnail	RB
RE.jpg	\N	thumbnail	RE
RG.jpg	\N	thumbnail	RG
RS.jpg	\N	thumbnail	RS
RT.jpg	\N	thumbnail	RT
SB.jpg	\N	thumbnail	SB
SHo.jpg	\N	thumbnail	SHo
TKi.jpg	\N	thumbnail	TKi
WB.jpg	\N	thumbnail	WB
WC.jpg	\N	thumbnail	WC
WH.jpg	\N	thumbnail	WH
WK.jpg	\N	thumbnail	WK
WP.jpg	\N	thumbnail	WP
WS.jpg	\N	thumbnail	WS
HYi.jpg	\N	thumbnail	HYi
SIn.jpg	\N	thumbnail	SIn
SIta.jpg	\N	thumbnail	SIta
TKurib.jpg	\N	thumbnail	TKurib
WR.jpg	\N	thumbnail	WR
default2.jpg	\N	default	\N
\.


--
-- Data for Name: search_suggestedlinks; Type: TABLE DATA; Schema: public; Owner: myapp
--

COPY search_suggestedlinks (link, name, domain, language, description) FROM stdin;
https://www.britannica.com/topic/Pacific-War	Тихоокеанската война	britannica.com	английски	разполага с обща информация за войната
http://skolarbete.nu/bg/skolarbeten/kriget-om-stilla-havet/	Войната на Тихия океан	skolarbete.nu	български	кратка информация за войната на български
https://www.youtube.com/watch?v=-EsW_uvnSao	Japan's War: In Colour	youtube.com	английски	единственото по рода си видео с цветни кадри от японската страна от преди и по време на Втората световна война
https://www.youtube.com/watch?v=2G_NEYOk2Gc&index=35&list=PLu2xst_eS6dqg8KiT-QWt0HKi-ZGDINKJ	Факции от ВСВ: Американската армия	youtube.com	английски	видео, обясняващо за американската армия по време на Втората световна война
https://www.youtube.com/watch?v=fMtb1oYGIl4&index=37&list=PLu2xst_eS6dqg8KiT-QWt0HKi-ZGDINKJ	Факции от ВСВ: Японската армия	youtube.com	английски	видео, обясняващо за японската армия по време на Втората световна война
https://www.youtube.com/watch?v=lK8gYGg0dkE	Декларацията на САЩ за война срещу Япония	youtube.com	английски	видео от декларацията на САЩ за война срещу Япония
https://www.youtube.com/watch?v=vcnH_kF1zXc	Подписването на капитулацията на Япония	youtube.com	английски	видео от подписването на капитулацията на Яопония
https://www.youtube.com/watch?v=puI2RyW2sMQ	Император Хирохито	youtube.com	английски	видео, описващо накратко биографията на император Хирохито (Шова)
https://www.youtube.com/watch?v=zYrj3gzXgeA	Корабът "Ямато"	youtube.com	английски	подробно видео за кораба "Ямато"
https://www.youtube.com/watch?v=_uero3vz87M	Японската ядрена програма	youtube.com	английски	документален филм за японската ядрена програма
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_permission_id_seq', 63, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('django_migrations_id_seq', 39, true);


--
-- Name: search_battlegroups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('search_battlegroups_id_seq', 1, false);


--
-- Name: search_battleparticipants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('search_battleparticipants_id_seq', 838, true);


--
-- Name: search_battletag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('search_battletag_id_seq', 1, false);


--
-- Name: search_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: myapp
--

SELECT pg_catalog.setval('search_messages_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: search_bannedips search_bannedips_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_bannedips
    ADD CONSTRAINT search_bannedips_pkey PRIMARY KEY (ip_addr);


--
-- Name: search_battle search_battle_battle_id_90a8ba97_pk; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battle
    ADD CONSTRAINT search_battle_battle_id_90a8ba97_pk PRIMARY KEY (battle_id);


--
-- Name: search_battle search_battle_battle_id_90a8ba97_uniq; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battle
    ADD CONSTRAINT search_battle_battle_id_90a8ba97_uniq UNIQUE (battle_id);


--
-- Name: search_groupedbattles search_battlegroups_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_groupedbattles
    ADD CONSTRAINT search_battlegroups_pkey PRIMARY KEY (id);


--
-- Name: search_battlegroups search_battlegroups_pkey1; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battlegroups
    ADD CONSTRAINT search_battlegroups_pkey1 PRIMARY KEY (group_code);


--
-- Name: search_battleparticipants search_battleparticipants_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battleparticipants
    ADD CONSTRAINT search_battleparticipants_pkey PRIMARY KEY (id);


--
-- Name: search_battlephotos search_battlephotos_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battlephotos
    ADD CONSTRAINT search_battlephotos_pkey PRIMARY KEY (photo_id);


--
-- Name: search_battletag search_battletag_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battletag
    ADD CONSTRAINT search_battletag_pkey PRIMARY KEY (id);


--
-- Name: search_countries search_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_countries
    ADD CONSTRAINT search_countries_pkey PRIMARY KEY (country_id);


--
-- Name: search_countriescoords search_countriescoords_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_countriescoords
    ADD CONSTRAINT search_countriescoords_pkey PRIMARY KEY (battle_year);


--
-- Name: search_messages search_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_messages
    ADD CONSTRAINT search_messages_pkey PRIMARY KEY (id);


--
-- Name: search_people search_people_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_people
    ADD CONSTRAINT search_people_pkey PRIMARY KEY (name_id);


--
-- Name: search_peoplephotos search_peoplephotos_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_peoplephotos
    ADD CONSTRAINT search_peoplephotos_pkey PRIMARY KEY (photo_id);


--
-- Name: search_suggestedlinks search_suggestedlinks_pkey; Type: CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_suggestedlinks
    ADD CONSTRAINT search_suggestedlinks_pkey PRIMARY KEY (link);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: search_bannedips_ip_addr_ffeb0859_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_bannedips_ip_addr_ffeb0859_like ON search_bannedips USING btree (ip_addr varchar_pattern_ops);


--
-- Name: search_battle_battle_id_90a8ba97_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battle_battle_id_90a8ba97_like ON search_battle USING btree (battle_id varchar_pattern_ops);


--
-- Name: search_battlegroups_battle_tag_id_1ae60940; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battlegroups_battle_tag_id_1ae60940 ON search_groupedbattles USING btree (battle_tag_id);


--
-- Name: search_battleparticipants_battle_code_id_689e8734; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_battle_code_id_689e8734 ON search_battleparticipants USING btree (battle_code_id);


--
-- Name: search_battleparticipants_battle_code_id_689e8734_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_battle_code_id_689e8734_like ON search_battleparticipants USING btree (battle_code_id varchar_pattern_ops);


--
-- Name: search_battleparticipants_commander_code_id_6093c035; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_commander_code_id_6093c035 ON search_battleparticipants USING btree (commander_code_id);


--
-- Name: search_battleparticipants_commander_code_id_6093c035_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_commander_code_id_6093c035_like ON search_battleparticipants USING btree (commander_code_id varchar_pattern_ops);


--
-- Name: search_battleparticipants_country_code_id_5f30e2a3; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_country_code_id_5f30e2a3 ON search_battleparticipants USING btree (country_code_id);


--
-- Name: search_battleparticipants_country_code_id_5f30e2a3_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battleparticipants_country_code_id_5f30e2a3_like ON search_battleparticipants USING btree (country_code_id varchar_pattern_ops);


--
-- Name: search_battlephotos_batle_code_id_020dec2d; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battlephotos_batle_code_id_020dec2d ON search_battlephotos USING btree (batle_code_id);


--
-- Name: search_battlephotos_batle_code_id_020dec2d_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battlephotos_batle_code_id_020dec2d_like ON search_battlephotos USING btree (batle_code_id varchar_pattern_ops);


--
-- Name: search_battlephotos_photo_id_14edb037_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battlephotos_photo_id_14edb037_like ON search_battlephotos USING btree (photo_id varchar_pattern_ops);


--
-- Name: search_battletag_battle_code_id_39b9d31a; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battletag_battle_code_id_39b9d31a ON search_battletag USING btree (battle_code_id);


--
-- Name: search_battletag_battle_code_id_39b9d31a_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_battletag_battle_code_id_39b9d31a_like ON search_battletag USING btree (battle_code_id varchar_pattern_ops);


--
-- Name: search_countries_country_id_a20c676d_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_countries_country_id_a20c676d_like ON search_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: search_groupedbattles_group_id_id_c24f5c6f; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_groupedbattles_group_id_id_c24f5c6f ON search_groupedbattles USING btree (group_id_id);


--
-- Name: search_people_country_code_id_558461b5; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_people_country_code_id_558461b5 ON search_people USING btree (country_code_id);


--
-- Name: search_people_country_code_id_558461b5_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_people_country_code_id_558461b5_like ON search_people USING btree (country_code_id varchar_pattern_ops);


--
-- Name: search_people_name_id_91484f53_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_people_name_id_91484f53_like ON search_people USING btree (name_id varchar_pattern_ops);


--
-- Name: search_peoplephotos_person_code_id_12bf5148; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_peoplephotos_person_code_id_12bf5148 ON search_peoplephotos USING btree (person_code_id);


--
-- Name: search_peoplephotos_person_code_id_12bf5148_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_peoplephotos_person_code_id_12bf5148_like ON search_peoplephotos USING btree (person_code_id varchar_pattern_ops);


--
-- Name: search_peoplephotos_photo_id_e530b269_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_peoplephotos_photo_id_e530b269_like ON search_peoplephotos USING btree (photo_id varchar_pattern_ops);


--
-- Name: search_suggestedlinks_link_73aea3b8_like; Type: INDEX; Schema: public; Owner: myapp
--

CREATE INDEX search_suggestedlinks_link_73aea3b8_like ON search_suggestedlinks USING btree (link varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_groupedbattles search_battlegroups_battle_tag_id_1ae60940_fk_search_ba; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_groupedbattles
    ADD CONSTRAINT search_battlegroups_battle_tag_id_1ae60940_fk_search_ba FOREIGN KEY (battle_tag_id) REFERENCES search_battletag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_battleparticipants search_battlepartici_battle_code_id_689e8734_fk_search_ba; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battleparticipants
    ADD CONSTRAINT search_battlepartici_battle_code_id_689e8734_fk_search_ba FOREIGN KEY (battle_code_id) REFERENCES search_battle(battle_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_battleparticipants search_battlepartici_commander_code_id_6093c035_fk_search_pe; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battleparticipants
    ADD CONSTRAINT search_battlepartici_commander_code_id_6093c035_fk_search_pe FOREIGN KEY (commander_code_id) REFERENCES search_people(name_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_battleparticipants search_battlepartici_country_code_id_5f30e2a3_fk_search_co; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battleparticipants
    ADD CONSTRAINT search_battlepartici_country_code_id_5f30e2a3_fk_search_co FOREIGN KEY (country_code_id) REFERENCES search_countries(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_battlephotos search_battlephotos_batle_code_id_020dec2d_fk_search_ba; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battlephotos
    ADD CONSTRAINT search_battlephotos_batle_code_id_020dec2d_fk_search_ba FOREIGN KEY (batle_code_id) REFERENCES search_battle(battle_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_battletag search_battletag_battle_code_id_39b9d31a_fk_search_ba; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_battletag
    ADD CONSTRAINT search_battletag_battle_code_id_39b9d31a_fk_search_ba FOREIGN KEY (battle_code_id) REFERENCES search_battle(battle_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_groupedbattles search_groupedbattle_group_id_id_c24f5c6f_fk_search_ba; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_groupedbattles
    ADD CONSTRAINT search_groupedbattle_group_id_id_c24f5c6f_fk_search_ba FOREIGN KEY (group_id_id) REFERENCES search_battlegroups(group_code) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_people search_people_country_code_id_558461b5_fk_search_co; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_people
    ADD CONSTRAINT search_people_country_code_id_558461b5_fk_search_co FOREIGN KEY (country_code_id) REFERENCES search_countries(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: search_peoplephotos search_peoplephotos_person_code_id_12bf5148_fk_search_pe; Type: FK CONSTRAINT; Schema: public; Owner: myapp
--

ALTER TABLE ONLY search_peoplephotos
    ADD CONSTRAINT search_peoplephotos_person_code_id_12bf5148_fk_search_pe FOREIGN KEY (person_code_id) REFERENCES search_people(name_id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

