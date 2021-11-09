--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: admin; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    name character varying(1000) NOT NULL,
    email character varying(1000),
    password character varying(1000) NOT NULL,
    superuser boolean,
    admins_read boolean,
    history_basket_read boolean,
    present_read boolean,
    filters_present_read boolean,
    users_read boolean,
    comments_read boolean,
    podpiska_read boolean,
    courer_read boolean,
    admins_change boolean,
    courer_change boolean,
    history_basket_change boolean,
    present_change boolean,
    filters_present_change boolean,
    users_change boolean,
    comments_change boolean,
    podpiska_change boolean,
    normpassword character varying(1000),
    sort_present_read boolean,
    sort_category_read boolean,
    akcia_read boolean,
    sort_present_change boolean,
    sort_category_change boolean,
    akcia_change boolean,
    admins_delete boolean,
    courer_delete boolean,
    history_basket_delete boolean,
    present_delete boolean,
    filters_present_delete boolean,
    users_delete boolean,
    comments_delete boolean,
    podpiska_delete boolean,
    akcia_delete boolean
);


ALTER TABLE public.admin OWNER TO gleb;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO gleb;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO gleb;

--
-- Name: basket; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.basket (
    id integer NOT NULL,
    "user" integer,
    count_present_item json
);


ALTER TABLE public.basket OWNER TO gleb;

--
-- Name: basket_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_id_seq OWNER TO gleb;

--
-- Name: basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.basket_id_seq OWNED BY public.basket.id;


--
-- Name: baskets_historybaskets; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.baskets_historybaskets (
    id integer NOT NULL,
    historybasket integer,
    basket integer
);


ALTER TABLE public.baskets_historybaskets OWNER TO gleb;

--
-- Name: baskets_historybaskets_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.baskets_historybaskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_historybaskets_id_seq OWNER TO gleb;

--
-- Name: baskets_historybaskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.baskets_historybaskets_id_seq OWNED BY public.baskets_historybaskets.id;


--
-- Name: bonus; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.bonus (
    id integer NOT NULL,
    user_fairbase_id character varying(100) NOT NULL,
    count_points integer,
    enum_povod character varying(100) NOT NULL,
    summ_check integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.bonus OWNER TO gleb;

--
-- Name: bonus_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.bonus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bonus_id_seq OWNER TO gleb;

--
-- Name: bonus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.bonus_id_seq OWNED BY public.bonus.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    serial_number integer,
    name_category character varying(1000) NOT NULL,
    slug_category character varying(250),
    icon character varying(1000) NOT NULL
);


ALTER TABLE public.categories OWNER TO gleb;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO gleb;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categoriess_subcategoriess; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.categoriess_subcategoriess (
    id integer NOT NULL,
    subcategories integer,
    categories integer
);


ALTER TABLE public.categoriess_subcategoriess OWNER TO gleb;

--
-- Name: categoriess_subcategoriess_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.categoriess_subcategoriess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoriess_subcategoriess_id_seq OWNER TO gleb;

--
-- Name: categoriess_subcategoriess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.categoriess_subcategoriess_id_seq OWNED BY public.categoriess_subcategoriess.id;


--
-- Name: coments; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.coments (
    id integer NOT NULL,
    present_id integer NOT NULL,
    user_id integer,
    name_user character varying(100) NOT NULL,
    phone_user character varying(100) NOT NULL,
    email_user character varying(100) NOT NULL,
    body character varying(10000) NOT NULL,
    moderation boolean,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.coments OWNER TO gleb;

--
-- Name: coments_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.coments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coments_id_seq OWNER TO gleb;

--
-- Name: coments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.coments_id_seq OWNED BY public.coments.id;


--
-- Name: comentsservice; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.comentsservice (
    id integer NOT NULL,
    user_id integer,
    name_user character varying(100) NOT NULL,
    phone_user character varying(100) NOT NULL,
    email_user character varying(100) NOT NULL,
    body character varying(10000) NOT NULL,
    moderation boolean,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.comentsservice OWNER TO gleb;

--
-- Name: comentsservice_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.comentsservice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentsservice_id_seq OWNER TO gleb;

--
-- Name: comentsservice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.comentsservice_id_seq OWNED BY public.comentsservice.id;


--
-- Name: counter; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.counter (
    id integer NOT NULL,
    counter integer
);


ALTER TABLE public.counter OWNER TO gleb;

--
-- Name: counter_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.counter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.counter_id_seq OWNER TO gleb;

--
-- Name: counter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.counter_id_seq OWNED BY public.counter.id;


--
-- Name: form; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.form (
    id integer NOT NULL,
    name_form character varying(1000) NOT NULL
);


ALTER TABLE public.form OWNER TO gleb;

--
-- Name: form_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.form_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_id_seq OWNER TO gleb;

--
-- Name: form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.form_id_seq OWNED BY public.form.id;


--
-- Name: history_basket; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.history_basket (
    id integer NOT NULL,
    history json,
    admin_bool_dostavka boolean,
    admin_send_curer boolean,
    photo_otchet character varying(1000),
    send_id_curer integer,
    send_name_curer character varying(100),
    name_user character varying(100),
    famaly_name_user character varying(100),
    fiz_oplata boolean,
    ur_oplata boolean,
    summa bigint,
    phone_user character varying(100),
    email_user character varying(1000),
    adress_user character varying(100),
    comment_user character varying(1000),
    oplata_user character varying(1000),
    bonus_user character varying(1000),
    spisbonuys bigint,
    name_company character varying(1000),
    bank_benefic character varying(1000),
    bin_bank character varying(1000),
    bik_bank character varying(1000),
    iik_bank character varying(1000),
    cod_platezh character varying(1000),
    kbe character varying(1000),
    succes_oplata boolean,
    succes_dostavka_curer boolean,
    "timestamp" timestamp without time zone,
    data_dostavki character varying(1000)
);


ALTER TABLE public.history_basket OWNER TO gleb;

--
-- Name: history_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.history_basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_basket_id_seq OWNER TO gleb;

--
-- Name: history_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.history_basket_id_seq OWNED BY public.history_basket.id;


--
-- Name: mailing; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.mailing (
    id integer NOT NULL,
    email_user character varying(100) NOT NULL
);


ALTER TABLE public.mailing OWNER TO gleb;

--
-- Name: mailing_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.mailing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mailing_id_seq OWNER TO gleb;

--
-- Name: mailing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.mailing_id_seq OWNED BY public.mailing.id;


--
-- Name: present; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.present (
    id integer NOT NULL,
    popular integer,
    sort_id_catalog integer,
    sort_id_popularnoe integer,
    sort_id_novinki integer,
    prevue_name character varying(1000),
    name_precent character varying(1000) NOT NULL,
    body character varying(1000),
    price integer NOT NULL,
    image_precent character varying(1000),
    composition character varying(10000),
    image_origin character varying(1000)
);


ALTER TABLE public.present OWNER TO gleb;

--
-- Name: present_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.present_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.present_id_seq OWNER TO gleb;

--
-- Name: present_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.present_id_seq OWNED BY public.present.id;


--
-- Name: presents_categoriess; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.presents_categoriess (
    id integer NOT NULL,
    categories integer,
    present integer
);


ALTER TABLE public.presents_categoriess OWNER TO gleb;

--
-- Name: presents_categoriess_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.presents_categoriess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presents_categoriess_id_seq OWNER TO gleb;

--
-- Name: presents_categoriess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.presents_categoriess_id_seq OWNED BY public.presents_categoriess.id;


--
-- Name: presents_formpresents; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.presents_formpresents (
    id integer NOT NULL,
    formpresent integer,
    present integer
);


ALTER TABLE public.presents_formpresents OWNER TO gleb;

--
-- Name: presents_formpresents_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.presents_formpresents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presents_formpresents_id_seq OWNER TO gleb;

--
-- Name: presents_formpresents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.presents_formpresents_id_seq OWNED BY public.presents_formpresents.id;


--
-- Name: presents_reasons; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.presents_reasons (
    id integer NOT NULL,
    reason integer,
    present integer
);


ALTER TABLE public.presents_reasons OWNER TO gleb;

--
-- Name: presents_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.presents_reasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presents_reasons_id_seq OWNER TO gleb;

--
-- Name: presents_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.presents_reasons_id_seq OWNED BY public.presents_reasons.id;


--
-- Name: presents_subcategoriess; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.presents_subcategoriess (
    id integer NOT NULL,
    subcategories integer,
    present integer
);


ALTER TABLE public.presents_subcategoriess OWNER TO gleb;

--
-- Name: presents_subcategoriess_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.presents_subcategoriess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presents_subcategoriess_id_seq OWNER TO gleb;

--
-- Name: presents_subcategoriess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.presents_subcategoriess_id_seq OWNED BY public.presents_subcategoriess.id;


--
-- Name: presents_typepresents; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.presents_typepresents (
    id integer NOT NULL,
    typepresent integer,
    present integer
);


ALTER TABLE public.presents_typepresents OWNER TO gleb;

--
-- Name: presents_typepresents_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.presents_typepresents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presents_typepresents_id_seq OWNER TO gleb;

--
-- Name: presents_typepresents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.presents_typepresents_id_seq OWNED BY public.presents_typepresents.id;


--
-- Name: reason; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.reason (
    id integer NOT NULL,
    serial_number integer,
    name_reason character varying(1000) NOT NULL,
    icon character varying(1000) NOT NULL
);


ALTER TABLE public.reason OWNER TO gleb;

--
-- Name: reason_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.reason_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reason_id_seq OWNER TO gleb;

--
-- Name: reason_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.reason_id_seq OWNED BY public.reason.id;


--
-- Name: stocks; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.stocks (
    id integer NOT NULL,
    name_stock character varying(1000) NOT NULL,
    body_stock character varying(1000) NOT NULL,
    image character varying(1000) NOT NULL,
    conditions character varying(1000) NOT NULL
);


ALTER TABLE public.stocks OWNER TO gleb;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.stocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO gleb;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: subcategories; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.subcategories (
    id integer NOT NULL,
    name_subcategory character varying(1000) NOT NULL
);


ALTER TABLE public.subcategories OWNER TO gleb;

--
-- Name: subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.subcategories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subcategories_id_seq OWNER TO gleb;

--
-- Name: subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.subcategories_id_seq OWNED BY public.subcategories.id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name_type character varying(1000) NOT NULL
);


ALTER TABLE public.type OWNER TO gleb;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO gleb;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gleb
--

CREATE TABLE public.users (
    id integer NOT NULL,
    uid_firebase character varying(100) NOT NULL,
    phone character varying(100),
    email character varying(100),
    firstname character varying(100),
    last_name character varying(100),
    father_name character varying(100),
    avatar character varying(1000),
    points integer,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.users OWNER TO gleb;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gleb
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gleb;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gleb
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: basket id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.basket ALTER COLUMN id SET DEFAULT nextval('public.basket_id_seq'::regclass);


--
-- Name: baskets_historybaskets id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.baskets_historybaskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_historybaskets_id_seq'::regclass);


--
-- Name: bonus id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.bonus ALTER COLUMN id SET DEFAULT nextval('public.bonus_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: categoriess_subcategoriess id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categoriess_subcategoriess ALTER COLUMN id SET DEFAULT nextval('public.categoriess_subcategoriess_id_seq'::regclass);


--
-- Name: coments id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.coments ALTER COLUMN id SET DEFAULT nextval('public.coments_id_seq'::regclass);


--
-- Name: comentsservice id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.comentsservice ALTER COLUMN id SET DEFAULT nextval('public.comentsservice_id_seq'::regclass);


--
-- Name: counter id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.counter ALTER COLUMN id SET DEFAULT nextval('public.counter_id_seq'::regclass);


--
-- Name: form id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.form ALTER COLUMN id SET DEFAULT nextval('public.form_id_seq'::regclass);


--
-- Name: history_basket id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.history_basket ALTER COLUMN id SET DEFAULT nextval('public.history_basket_id_seq'::regclass);


--
-- Name: mailing id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.mailing ALTER COLUMN id SET DEFAULT nextval('public.mailing_id_seq'::regclass);


--
-- Name: present id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.present ALTER COLUMN id SET DEFAULT nextval('public.present_id_seq'::regclass);


--
-- Name: presents_categoriess id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_categoriess ALTER COLUMN id SET DEFAULT nextval('public.presents_categoriess_id_seq'::regclass);


--
-- Name: presents_formpresents id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_formpresents ALTER COLUMN id SET DEFAULT nextval('public.presents_formpresents_id_seq'::regclass);


--
-- Name: presents_reasons id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_reasons ALTER COLUMN id SET DEFAULT nextval('public.presents_reasons_id_seq'::regclass);


--
-- Name: presents_subcategoriess id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_subcategoriess ALTER COLUMN id SET DEFAULT nextval('public.presents_subcategoriess_id_seq'::regclass);


--
-- Name: presents_typepresents id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_typepresents ALTER COLUMN id SET DEFAULT nextval('public.presents_typepresents_id_seq'::regclass);


--
-- Name: reason id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.reason ALTER COLUMN id SET DEFAULT nextval('public.reason_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: subcategories id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN id SET DEFAULT nextval('public.subcategories_id_seq'::regclass);


--
-- Name: type id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.admin (id, name, email, password, superuser, admins_read, history_basket_read, present_read, filters_present_read, users_read, comments_read, podpiska_read, courer_read, admins_change, courer_change, history_basket_change, present_change, filters_present_change, users_change, comments_change, podpiska_change, normpassword, sort_present_read, sort_category_read, akcia_read, sort_present_change, sort_category_change, akcia_change, admins_delete, courer_delete, history_basket_delete, present_delete, filters_present_delete, users_delete, comments_delete, podpiska_delete, akcia_delete) FROM stdin;
2	string	glebhleb89@icloud.com	__hash__ec9fa1bbdc1ade6170f05888e08b5e778530279e496f0656fe92f5244169d210810cfc1fcbe5485508dc0ecaf71a8fde26b875e61ccc9f56a4a4928035cfb99ad0d835065d0bf15b01eace092c6695756bcd169477c4cabe484211c5e82c70fa	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	string2	string2	__hash__2f4de350baafdd02ad523d11f5b62457b08c9840b61c5445d98ee95a147b0bbc25b76f64df7caaae48041fa6b39e3325e3b04f982c39e2543f76370db92c3d4cc64ae2d92256722dd9a76bacadebe2402f4159acb6846b14f407b59f445942fd	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	string	string	__hash__1a64c2296df641e1949eb2428f2c0db10f3d05e70ad91dc00d22f24fa443adfeae66f2f5723459dee21ad821028747859af2ba4f5ace36e34fcdb399ab160429e5c9a8cfb49669b02cb93a558076db3ad3815203e323da61042b8052926a824f	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	string	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t
6	string	mba.kimep@gmail.com	__hash__4c8417737e41ebceb514cefa7a0106f27c00cacdc52ebe824d885529891d922aa4ae14d3f036595f5a293dd7c721292d576c1a79e56548d498d8b0fadbe49cbee841ef06f6be21d5f0e88aa02ffd6dcb77fcbbdabbba2e9a4f7281dbb2d6071e	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t	string	t	t	t	t	t	t	t	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: gleb
--




--
-- Data for Name: basket; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.basket (id, "user", count_present_item) FROM stdin;
2	\N	{"presents": [{"id": 49, "popular": 0, "sort_id_catalog": 49, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u0411\\u0443\\u043a\\u0435\\u0442", "name_precent": "\\u041c\\u0438\\u0448\\u043a\\u0430 \\u0441 \\u0431\\u0443\\u043a\\u0435\\u0442\\u043e\\u043c \\u0440\\u043e\\u0437", "body": "\\u0412\\u0435\\u0441\\u0435\\u043b\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 \\u0441 \\u043d\\u0435\\u0436\\u043d\\u044b\\u043c \\u0431\\u0443\\u043a\\u0435\\u0442\\u043e\\u043c \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437!", "price": 28200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2620:37:08.948468.webp", "composition": "1. 19 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437 60 \\u0441\\u043c\\n2. \\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430 \\u043c\\u0438\\u0448\\u043a\\u0430 30 \\u0441\\u043c", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}]}
4	\N	{"presents": []}
6	2	{"presents": []}
5	\N	{"presents": [{"id": 1, "popular": 1, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 51200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:18:35.358158.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "form_precent": [], "subcategory": [], "type_precent": [], "category": [], "count": 2}]}
3	\N	{"presents": [{"id": 17, "popular": 0, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 1}]}
7	\N	{"presents": []}
8	\N	{"presents": [{"id": 17, "popular": 1, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 136000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 2}]}
9	3	{"presents": []}
10	\N	{"presents": [{"id": 17, "popular": 2, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "type_precent": [], "category": [], "form_precent": [], "reason_for_precent": [], "subcategory": [], "count": 1}, {"id": 1, "popular": 2, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "category": [], "form_precent": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
11	4	{"presents": []}
19	\N	{"presents": []}
13	6	{"presents": []}
14	\N	{"presents": [{"id": 60, "popular": 0, "sort_id_catalog": 60, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u044f", "name_precent": "I love you", "body": "\\u0423\\u0434\\u0438\\u0432\\u0438 \\u043b\\u044e\\u0431\\u0438\\u043c\\u0443\\u044e \\u044f\\u0440\\u043a\\u0438\\u043c \\u043e\\u0431\\u043b\\u0430\\u043a\\u043e\\u043c \\u0438\\u0437 \\u0441\\u0435\\u0440\\u0434\\u0435\\u0446!", "price": 16000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:40:03.132407.webp", "image_origin": null, "composition": "5 \\u0444\\u043e\\u043b\\u044c\\u0433\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0445 \\u0433\\u0435\\u043b\\u0438\\u0435\\u0432\\u044b\\u0445 \\u0448\\u0430\\u0440\\u043e\\u0432. (\\u0424\\u043e\\u043b\\u044c\\u0433\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u044b\\u0439 \\u0448\\u0430\\u0440  \\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435. \\u0428\\u0430\\u0440 \\u043c\\u043e\\u0436\\u0435\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d \\u043d\\u0430 \\u043e\\u0434\\u043d\\u043e\\u0442\\u0438\\u043f\\u043d\\u044b\\u0439, \\u0432 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0434\\u0430\\u043d\\u043d\\u043e\\u0439 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0438 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435)", "form_precent": [], "type_precent": [], "category": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
15	\N	{"presents": [{"id": 5, "popular": 0, "sort_id_catalog": 4, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u043e\\u0435 \\u0447\\u0443\\u0434\\u043e", "body": "\\u0412\\u0440\\u0435\\u043c\\u044f \\u0441\\u043d\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u2013 \\u044d\\u0442\\u043e \\u043e\\u0441\\u043e\\u0431\\u044b\\u0435, \\u0432\\u043e\\u043b\\u0448\\u0435\\u0431\\u043d\\u044b\\u0435 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u044b. \\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u0438\\u0445 \\u0435\\u0449\\u0451 \\u043f\\u0440\\u0435\\u043a\\u0440\\u0430\\u0441\\u043d\\u0435\\u0435 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u0430\\u0431\\u043e\\u0440\\u043e\\u043c, \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044b\\u043c \\u0438\\u0437 \\u0441\\u0430\\u043c\\u044b\\u0445 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0445 \\u0432\\u0435\\u0449\\u0435\\u0439 \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430. \\u0422\\u0430\\u043a\\u043e\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0441\\u0442\\u0430\\u043d\\u0435\\u0442 \\u043f\\u0440\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u044b\\u043c \\u0438 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u043f\\u043e\\u0434\\u0430\\u0440\\u043a\\u043e\\u043c \\u0434\\u043b\\u044f \\u0432\\u0441\\u0435\\u0433\\u043e \\u0441\\u0435\\u043c\\u0435\\u0439\\u0441\\u0442\\u0432\\u0430.", "price": 38500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590origin.webp", "composition": "1. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0443\\u043f\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0445\\u0430\\u043b\\u0430\\u0442;\\n2. \\u0414\\u0435\\u0442\\u0441\\u043a\\u043e\\u0435 \\u041e\\u0434\\u0435\\u044f\\u043b\\u043e;\\n3. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043f\\u0438\\u0436\\u0430\\u043c\\u0430;\\n4. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0442\\u0435\\u0440\\u0447\\u0430\\u0442\\u0430\\u044f \\u0448\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430; \\n5. \\u0420\\u0430\\u0441\\u0447\\u0435\\u0441\\u043a\\u0430 \\u0438 \\u0433\\u0440\\u0435\\u0431\\u0435\\u0448\\u043e\\u043a \\u0438\\u0437 \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u0430;\\n6. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0445\\u0440\\u043e\\u0432\\u0430\\u044f \\u0432\\u0430\\u0440\\u0435\\u0436\\u043a\\u0430 \\u0434\\u043b\\u044f \\u043a\\u0443\\u043f\\u0430\\u043d\\u0438\\u044f;\\n7. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0435 \\u043f\\u0438\\u043d\\u0435\\u0442\\u043a\\u0438;\\n8. \\u041f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 \\u0441\\u0440\\u0435\\u0434\\u043d\\u0435\\u0433\\u043e \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u0430;\\n9. \\u041d\\u0430\\u0431\\u043e\\u0440 \\u0438\\u043c\\u043f\\u043e\\u0440\\u0442\\u043d\\u044b\\u0445 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442;\\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "type_precent": [], "category": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
16	\N	{"presents": [{"id": 5, "popular": 0, "sort_id_catalog": 4, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u043e\\u0435 \\u0447\\u0443\\u0434\\u043e", "body": "\\u0412\\u0440\\u0435\\u043c\\u044f \\u0441\\u043d\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u2013 \\u044d\\u0442\\u043e \\u043e\\u0441\\u043e\\u0431\\u044b\\u0435, \\u0432\\u043e\\u043b\\u0448\\u0435\\u0431\\u043d\\u044b\\u0435 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u044b. \\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u0438\\u0445 \\u0435\\u0449\\u0451 \\u043f\\u0440\\u0435\\u043a\\u0440\\u0430\\u0441\\u043d\\u0435\\u0435 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u0430\\u0431\\u043e\\u0440\\u043e\\u043c, \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044b\\u043c \\u0438\\u0437 \\u0441\\u0430\\u043c\\u044b\\u0445 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0445 \\u0432\\u0435\\u0449\\u0435\\u0439 \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430. \\u0422\\u0430\\u043a\\u043e\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0441\\u0442\\u0430\\u043d\\u0435\\u0442 \\u043f\\u0440\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u044b\\u043c \\u0438 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u043f\\u043e\\u0434\\u0430\\u0440\\u043a\\u043e\\u043c \\u0434\\u043b\\u044f \\u0432\\u0441\\u0435\\u0433\\u043e \\u0441\\u0435\\u043c\\u0435\\u0439\\u0441\\u0442\\u0432\\u0430.", "price": 38500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590origin.webp", "composition": "1. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0443\\u043f\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0445\\u0430\\u043b\\u0430\\u0442;\\n2. \\u0414\\u0435\\u0442\\u0441\\u043a\\u043e\\u0435 \\u041e\\u0434\\u0435\\u044f\\u043b\\u043e;\\n3. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043f\\u0438\\u0436\\u0430\\u043c\\u0430;\\n4. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0442\\u0435\\u0440\\u0447\\u0430\\u0442\\u0430\\u044f \\u0448\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430; \\n5. \\u0420\\u0430\\u0441\\u0447\\u0435\\u0441\\u043a\\u0430 \\u0438 \\u0433\\u0440\\u0435\\u0431\\u0435\\u0448\\u043e\\u043a \\u0438\\u0437 \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u0430;\\n6. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0445\\u0440\\u043e\\u0432\\u0430\\u044f \\u0432\\u0430\\u0440\\u0435\\u0436\\u043a\\u0430 \\u0434\\u043b\\u044f \\u043a\\u0443\\u043f\\u0430\\u043d\\u0438\\u044f;\\n7. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0435 \\u043f\\u0438\\u043d\\u0435\\u0442\\u043a\\u0438;\\n8. \\u041f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 \\u0441\\u0440\\u0435\\u0434\\u043d\\u0435\\u0433\\u043e \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u0430;\\n9. \\u041d\\u0430\\u0431\\u043e\\u0440 \\u0438\\u043c\\u043f\\u043e\\u0440\\u0442\\u043d\\u044b\\u0445 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442;\\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "type_precent": [], "category": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
17	\N	{"presents": [{"id": 5, "popular": 0, "sort_id_catalog": 4, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u043e\\u0435 \\u0447\\u0443\\u0434\\u043e", "body": "\\u0412\\u0440\\u0435\\u043c\\u044f \\u0441\\u043d\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u2013 \\u044d\\u0442\\u043e \\u043e\\u0441\\u043e\\u0431\\u044b\\u0435, \\u0432\\u043e\\u043b\\u0448\\u0435\\u0431\\u043d\\u044b\\u0435 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u044b. \\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u0438\\u0445 \\u0435\\u0449\\u0451 \\u043f\\u0440\\u0435\\u043a\\u0440\\u0430\\u0441\\u043d\\u0435\\u0435 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u0430\\u0431\\u043e\\u0440\\u043e\\u043c, \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044b\\u043c \\u0438\\u0437 \\u0441\\u0430\\u043c\\u044b\\u0445 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0445 \\u0432\\u0435\\u0449\\u0435\\u0439 \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430. \\u0422\\u0430\\u043a\\u043e\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0441\\u0442\\u0430\\u043d\\u0435\\u0442 \\u043f\\u0440\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u044b\\u043c \\u0438 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u043f\\u043e\\u0434\\u0430\\u0440\\u043a\\u043e\\u043c \\u0434\\u043b\\u044f \\u0432\\u0441\\u0435\\u0433\\u043e \\u0441\\u0435\\u043c\\u0435\\u0439\\u0441\\u0442\\u0432\\u0430.", "price": 38500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590origin.webp", "composition": "1. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0443\\u043f\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0445\\u0430\\u043b\\u0430\\u0442;\\n2. \\u0414\\u0435\\u0442\\u0441\\u043a\\u043e\\u0435 \\u041e\\u0434\\u0435\\u044f\\u043b\\u043e;\\n3. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043f\\u0438\\u0436\\u0430\\u043c\\u0430;\\n4. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0442\\u0435\\u0440\\u0447\\u0430\\u0442\\u0430\\u044f \\u0448\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430; \\n5. \\u0420\\u0430\\u0441\\u0447\\u0435\\u0441\\u043a\\u0430 \\u0438 \\u0433\\u0440\\u0435\\u0431\\u0435\\u0448\\u043e\\u043a \\u0438\\u0437 \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u0430;\\n6. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0445\\u0440\\u043e\\u0432\\u0430\\u044f \\u0432\\u0430\\u0440\\u0435\\u0436\\u043a\\u0430 \\u0434\\u043b\\u044f \\u043a\\u0443\\u043f\\u0430\\u043d\\u0438\\u044f;\\n7. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0435 \\u043f\\u0438\\u043d\\u0435\\u0442\\u043a\\u0438;\\n8. \\u041f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 \\u0441\\u0440\\u0435\\u0434\\u043d\\u0435\\u0433\\u043e \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u0430;\\n9. \\u041d\\u0430\\u0431\\u043e\\u0440 \\u0438\\u043c\\u043f\\u043e\\u0440\\u0442\\u043d\\u044b\\u0445 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442;\\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "type_precent": [], "category": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
18	\N	{"presents": [{"id": 5, "popular": 0, "sort_id_catalog": 4, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u043e\\u0435 \\u0447\\u0443\\u0434\\u043e", "body": "\\u0412\\u0440\\u0435\\u043c\\u044f \\u0441\\u043d\\u0430 \\u043d\\u043e\\u0432\\u043e\\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u043d\\u043e\\u0433\\u043e \\u2013 \\u044d\\u0442\\u043e \\u043e\\u0441\\u043e\\u0431\\u044b\\u0435, \\u0432\\u043e\\u043b\\u0448\\u0435\\u0431\\u043d\\u044b\\u0435 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442\\u044b. \\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u0438\\u0445 \\u0435\\u0449\\u0451 \\u043f\\u0440\\u0435\\u043a\\u0440\\u0430\\u0441\\u043d\\u0435\\u0435 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u0430\\u0431\\u043e\\u0440\\u043e\\u043c, \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u043b\\u0435\\u043d\\u043d\\u044b\\u043c \\u0438\\u0437 \\u0441\\u0430\\u043c\\u044b\\u0445 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u044b\\u0445 \\u0432\\u0435\\u0449\\u0435\\u0439 \\u043c\\u0430\\u043b\\u044b\\u0448\\u0430. \\u0422\\u0430\\u043a\\u043e\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0442 \\u0441\\u0442\\u0430\\u043d\\u0435\\u0442 \\u043f\\u0440\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u044b\\u043c \\u0438 \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u044b\\u043c \\u043f\\u043e\\u0434\\u0430\\u0440\\u043a\\u043e\\u043c \\u0434\\u043b\\u044f \\u0432\\u0441\\u0435\\u0433\\u043e \\u0441\\u0435\\u043c\\u0435\\u0439\\u0441\\u0442\\u0432\\u0430.", "price": 38500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590origin.webp", "composition": "1. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u043a\\u0443\\u043f\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0445\\u0430\\u043b\\u0430\\u0442;\\n2. \\u0414\\u0435\\u0442\\u0441\\u043a\\u043e\\u0435 \\u041e\\u0434\\u0435\\u044f\\u043b\\u043e;\\n3. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043f\\u0438\\u0436\\u0430\\u043c\\u0430;\\n4. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0442\\u0435\\u0440\\u0447\\u0430\\u0442\\u0430\\u044f \\u0448\\u0430\\u043f\\u043e\\u0447\\u043a\\u0430; \\n5. \\u0420\\u0430\\u0441\\u0447\\u0435\\u0441\\u043a\\u0430 \\u0438 \\u0433\\u0440\\u0435\\u0431\\u0435\\u0448\\u043e\\u043a \\u0438\\u0437 \\u043f\\u043b\\u0430\\u0441\\u0442\\u0438\\u043a\\u0430;\\n6. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0430\\u044f \\u043c\\u0430\\u0445\\u0440\\u043e\\u0432\\u0430\\u044f \\u0432\\u0430\\u0440\\u0435\\u0436\\u043a\\u0430 \\u0434\\u043b\\u044f \\u043a\\u0443\\u043f\\u0430\\u043d\\u0438\\u044f;\\n7. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0435 \\u043f\\u0438\\u043d\\u0435\\u0442\\u043a\\u0438;\\n8. \\u041f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 \\u0441\\u0440\\u0435\\u0434\\u043d\\u0435\\u0433\\u043e \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u0430;\\n9. \\u041d\\u0430\\u0431\\u043e\\u0440 \\u0438\\u043c\\u043f\\u043e\\u0440\\u0442\\u043d\\u044b\\u0445 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442;\\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "type_precent": [], "category": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
20	\N	{"presents": [{"id": 1, "popular": 5, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "type_precent": [], "form_precent": [], "subcategory": [], "category": [], "count": 1}]}
21	\N	{"presents": [{"id": 1, "popular": 5, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "type_precent": [], "form_precent": [], "subcategory": [], "category": [], "count": 1}]}
22	\N	{"presents": [{"id": 17, "popular": 6, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "reason_for_precent": [], "type_precent": [], "form_precent": [], "subcategory": [], "category": [], "count": 1}]}
25	\N	{"presents": []}
23	\N	{"presents": []}
24	\N	{"presents": [{"id": 17, "popular": 6, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 136000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "reason_for_precent": [], "type_precent": [], "form_precent": [], "subcategory": [], "category": [], "count": 2}]}
1	1	{"presents": [{"id": 2, "popular": 1, "sort_id_catalog": 3, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0421\\u043b\\u0430\\u0434\\u043a\\u0430\\u044f \\u043f\\u0440\\u0435\\u043b\\u0435\\u0441\\u0442\\u044c", "body": "\\u0421\\u0442\\u0438\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u0440\\u043e\\u043c\\u0430\\u043d\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0441\\u043b\\u0430\\u0434\\u043e\\u0441\\u0442\\u0435\\u0439 - \\u043e\\u0442\\u043b\\u0438\\u0447\\u043d\\u044b\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0434\\u043e\\u0440\\u043e\\u0433\\u043e\\u0439 \\u0441\\u043b\\u0430\\u0434\\u043a\\u043e\\u0435\\u0436\\u043a\\u0438!", "price": 19500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081origin.webp", "composition": "1. Nutella 200\\u0433 \\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b Merci Finest Selection 250 \\u0433 \\n3. Kinder chocolate 100\\u0433 \\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043d\\u044b\\u0439 Kinder Chocolate \\u0441\\u043e \\u0437\\u043b\\u0430\\u043a\\u0430\\u043c\\u0438 (2 \\u0448\\u0442.) 5.\\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0431\\u0430\\u0442\\u043e\\u043d\\u0447\\u0438\\u043a Kit-Kat (4 \\u0448\\u0442.)   \\n7. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Toblerone 100\\u0433  \\n8. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Milka 90\\u0433 \\n9. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 M", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
40	\N	{"presents": [{"id": 18, "popular": 0, "sort_id_catalog": 18, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u0411\\u0443\\u043a\\u0435\\u0442", "name_precent": "Dolce & Gabbana", "body": "\\u0412\\u044b\\u0440\\u0430\\u0437\\u0438\\u0442\\u044c \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430 \\u043a \\u043b\\u044e\\u0431\\u0438\\u043c\\u043e\\u043c\\u0443 \\u0447\\u0435\\u043b\\u043e\\u0432\\u0435\\u043a\\u0443 \\u043f\\u043e\\u0440\\u043e\\u0439 \\u043d\\u0435\\u043b\\u0435\\u0433\\u043a\\u043e, \\u0442\\u0430\\u043a \\u043f\\u0443\\u0441\\u0442\\u044c \\u0437\\u0430 \\u0432\\u0430\\u0441 \\u0433\\u043e\\u0432\\u043e\\u0440\\u044f\\u0442 \\u0446\\u0432\\u0435\\u0442\\u044b \\u0441 \\u0434\\u0443\\u0445\\u0430\\u043c\\u0438!", "price": 52500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:14.277387.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:14.277387origin.webp", "composition": "- \\u041f\\u0430\\u0440\\u0444\\u044e\\u043c\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Dolce&Gabbana The One \\u0434\\u043b\\u044f \\u0436\\u0435\\u043d\\u0449\\u0438\\u043d 30 \\u043c\\u043b;\\n- \\u0411\\u0443\\u043a\\u0435\\u0442 \\u0438\\u0437 \\u0438\\u0440\\u0438\\u0441\\u043e\\u0432, \\u0430\\u043b\\u044c\\u0441\\u0442\\u0440\\u043e\\u043c\\u0435\\u0440\\u0438\\u0439 \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u043a\\u0443\\u0441\\u0442\\u043e\\u0432\\u044b\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n- \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}, {"id": 19, "popular": 0, "sort_id_catalog": 19, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430", "name_precent": "\\u041c\\u0438\\u0448\\u043a\\u0430 \\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u044b\\u0439", "body": "\\u041f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u0438\\u0442\\u044c \\u043c\\u0430\\u043b\\u0435\\u043d\\u044c\\u043a\\u043e\\u0433\\u043e \\u0438\\u043c\\u0435\\u043d\\u0438\\u043d\\u043d\\u0438\\u043a\\u0430 \\u0441 \\u0414\\u043d\\u0435\\u043c \\u0440\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0438\\u043b\\u0438 \\u043d\\u0430\\u043f\\u043e\\u043c\\u043d\\u0438\\u0442\\u044c \\u043b\\u044e\\u0431\\u0438\\u043c\\u043e\\u0439, \\u0447\\u0442\\u043e \\u0432\\u0441\\u0442\\u0440\\u0435\\u0447\\u0430 \\u043d\\u0435 \\u0437\\u0430 \\u0433\\u043e\\u0440\\u0430\\u043c\\u0438, \\u043e\\u0447\\u0435\\u043d\\u044c \\u043f\\u0440\\u043e\\u0441\\u0442\\u043e!", "price": 37200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:28:27.013435.webp", "image_origin": null, "composition": "\\u0411\\u043e\\u043b\\u044c\\u0448\\u043e\\u0439 \\u043f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0434\\u044c \\u0442\\u0435\\u043c\\u043d\\u043e-\\u043a\\u043e\\u0440\\u0438\\u0447\\u043d\\u0435\\u0432\\u043e\\u0433\\u043e \\u0446\\u0432\\u0435\\u0442\\u0430 150 \\u0441\\u043c;", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}, {"id": 21, "popular": 0, "sort_id_catalog": 21, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430", "name_precent": "Royal ", "body": "\\u0426\\u0432\\u0435\\u0442\\u044b \\u0432 \\u043a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0435 \\u0441 \\u043c\\u0430\\u043a\\u0430\\u0440\\u043e\\u043d\\u0438 (\\u0434\\u0438\\u0430\\u043c\\u0435\\u0442\\u0440 20 \\u0441\\u043c, \\u0432\\u044b\\u0441\\u043e\\u0442\\u0430 15 \\u0441\\u043c).", "price": 25000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:28:55.234533.webp", "image_origin": null, "composition": "1. \\u0420\\u043e\\u0437\\u044b \\u043a\\u0443\\u0441\\u0442\\u043e\\u0432\\u044b\\u0435 2. \\u0414\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441 3. \\u0421\\u0430\\u043d\\u0442\\u0438\\u043d\\u0438 4. \\u0411\\u0430\\u0440\\u0431\\u0430\\u0442\\u0443\\u0441 5. \\u0413\\u0440\\u0438\\u043d 6. \\u0413\\u0438\\u043f\\u0435\\u0440\\u0438\\u043a\\u0443\\u043c  7. \\u041a\\u043e\\u043d\\u0434\\u0438\\u0442\\u0435\\u0440\\u0441\\u043a\\u043e\\u0435 \\u0438\\u0437\\u0434\\u0435\\u043b\\u0438\\u0435 \\u041c\\u0430\\u043a\\u0430\\u0440\\u043e\\u043d 8. \\u041a\\u0440\\u0443\\u0433\\u043b\\u043e\\u0439 \\u043a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 9. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}]}
26	\N	{"presents": [{"id": 6, "popular": 1, "sort_id_catalog": 6, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u044d\\u043b\\u043b\\u0430", "body": "\\u0412\\u043a\\u0443\\u0441\\u043d\\u044b\\u0439 \\u0438 \\u043e\\u0440\\u0438\\u0433\\u0438\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043f\\u0440\\u0435\\u0437\\u0435\\u043d\\u0442, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0437\\u0430\\u043c\\u0435\\u0447\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442 \\u0412\\u0430\\u0448\\u0435 \\u0434\\u0443\\u0448\\u0435\\u0432\\u043d\\u043e\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435!", "price": 19200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:15.197974.webp", "image_origin": null, "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Raffaello\\" \\n2. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 \\n3. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b \\n4. \\u041a\\u0438\\u0432\\u0438 \\n5. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 \\n6. \\u0413\\u0440\\u0443\\u0448\\u0438 \\n7. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b \\n8. \\u041c\\u0430\\u043d\\u0434\\u0430\\u0440\\u0438\\u043d\\u044b (\\u0432 \\u043f\\u0435\\u0440\\u0438\\u043e\\u0434 \\u043d\\u0435 \\u0441\\u0435\\u0437\\u043e\\u043d\\u0430 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b) \\n9. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f  \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "type_precent": [], "category": [], "subcategory": [], "reason_for_precent": [], "form_precent": [], "count": 1}]}
27	\N	{"presents": [{"id": 17, "popular": 6, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "category": [], "form_precent": [], "type_precent": [], "subcategory": [], "reason_for_precent": [], "count": 1}]}
44	\N	{"presents": []}
28	\N	{"presents": [{"id": 1, "popular": 5, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "category": [], "type_precent": [], "reason_for_precent": [], "subcategory": [], "count": 1}]}
29	\N	{"presents": [{"id": 4, "popular": 0, "sort_id_catalog": 2, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u043e\\u0435 \\u0410\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438", "body": "\\u0412\\u0435\\u0441 \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u044b 5-6 \\u043a\\u0433", "price": 63300, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997origin.webp", "composition": "1. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 2. \\u0413\\u0440\\u0443\\u0448\\u0438 3. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b 4. \\u043a\\u0438\\u0432\\u0438 5. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b 6. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 7. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 8. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 9. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "category": [], "reason_for_precent": [], "type_precent": [], "form_precent": [], "count": 3}]}
30	\N	{"presents": [{"id": 1, "popular": 6, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "subcategory": [], "type_precent": [], "form_precent": [], "category": [], "count": 1}]}
31	\N	{"presents": [{"id": 74, "popular": 0, "sort_id_catalog": 74, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0412\\u043e\\u043b\\u0448\\u0435\\u0431\\u043d\\u0430\\u044f", "body": "\\u041f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u043d\\u0435 \\u0442\\u043e\\u043b\\u044c\\u043a\\u043e \\u043a\\u0440\\u0430\\u0441\\u0438\\u0432\\u044b\\u0435, \\u043d\\u043e \\u0435\\u0449\\u0435 \\u0438 \\u043c\\u0430\\u043a\\u0441\\u0438\\u043c\\u0430\\u043b\\u044c\\u043d\\u043e \\u043f\\u043e\\u043b\\u0435\\u0437\\u043d\\u044b\\u0435! ", "price": 20500, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2821:20:32.112745.webp", "image_origin": null, "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Raffaello\\"- 150 \\u0433\\u0440. 2. \\u0411\\u0430\\u043d\\u043e\\u0447\\u043a\\u0430 \\u0434\\u0436\\u0435\\u043c\\u0430 3.\\u041f\\u0430\\u0447\\u043a\\u0430 \\u0447\\u0430\\u044f 4. 8 \\u043c\\u0430\\u043d\\u0434\\u0430\\u0440\\u0438\\u043d (\\u0432 \\u043f\\u0435\\u0440\\u0438\\u043e\\u0434 \\u043d\\u0435 \\u0441\\u0435\\u0437\\u043e\\u043d\\u0430 \\u043b\\u0435\\u0442\\u043e-\\u043e\\u0441\\u0435\\u043d\\u044c \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b \\u043d\\u0435\\u043a\\u0442\\u0430\\u0440\\u0438\\u043d\\u0430\\u043c\\u0438 \\u0438\\u043b\\u0438 \\u043f\\u0435\\u0440\\u0441\\u0438\\u043a\\u0430\\u043c\\u0438), 5. 5 \\u043b\\u0438\\u043c\\u043e\\u043d\\u043e\\u0432 6. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "subcategory": [], "type_precent": [], "form_precent": [], "category": [], "count": 1}]}
12	5	{"presents": []}
32	\N	{"presents": [{"id": 2, "popular": 0, "sort_id_catalog": 3, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0421\\u043b\\u0430\\u0434\\u043a\\u0430\\u044f \\u043f\\u0440\\u0435\\u043b\\u0435\\u0441\\u0442\\u044c", "body": "\\u0421\\u0442\\u0438\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u0440\\u043e\\u043c\\u0430\\u043d\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0441\\u043b\\u0430\\u0434\\u043e\\u0441\\u0442\\u0435\\u0439 - \\u043e\\u0442\\u043b\\u0438\\u0447\\u043d\\u044b\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0434\\u043e\\u0440\\u043e\\u0433\\u043e\\u0439 \\u0441\\u043b\\u0430\\u0434\\u043a\\u043e\\u0435\\u0436\\u043a\\u0438!", "price": 19500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081origin.webp", "composition": "1. Nutella 200\\u0433 \\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b Merci Finest Selection 250 \\u0433 \\n3. Kinder chocolate 100\\u0433 \\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043d\\u044b\\u0439 Kinder Chocolate \\u0441\\u043e \\u0437\\u043b\\u0430\\u043a\\u0430\\u043c\\u0438 (2 \\u0448\\u0442.) 5.\\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0431\\u0430\\u0442\\u043e\\u043d\\u0447\\u0438\\u043a Kit-Kat (4 \\u0448\\u0442.)   \\n7. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Toblerone 100\\u0433  \\n8. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Milka 90\\u0433 \\n9. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 M", "type_precent": [], "reason_for_precent": [], "form_precent": [], "category": [], "subcategory": [], "count": 1}]}
33	\N	{"presents": []}
35	\N	{"presents": [{"id": 55, "popular": 0, "sort_id_catalog": 55, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430", "name_precent": "\\u0411\\u0443\\u043a\\u0435\\u0442 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0436\\u0430\\u0442", "body": "\\u0412\\u044b\\u0441\\u043e\\u0442\\u0430 \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438: 10-15 \\u0441\\u043c. (\\u0418\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435. \\u041c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b \\u043d\\u0430 \\u043e\\u0434\\u043d\\u043e\\u0442\\u0438\\u043f\\u043d\\u044b\\u0435, \\u0432 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0435\\u0439 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435)", "price": 14300, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:35.841525.webp", "image_origin": null, "composition": "1. 6 \\u043c\\u044f\\u0433\\u043a\\u0438\\u0445 \\u0438\\u0433\\u0440\\u0443\\u0448\\u0435\\u043a 2. \\u0424\\u043b\\u043e\\u0440\\u0438\\u0441\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b.", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
36	\N	{"presents": [{"id": 55, "popular": 0, "sort_id_catalog": 55, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430", "name_precent": "\\u0411\\u0443\\u043a\\u0435\\u0442 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0436\\u0430\\u0442", "body": "\\u0412\\u044b\\u0441\\u043e\\u0442\\u0430 \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438: 10-15 \\u0441\\u043c. (\\u0418\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435. \\u041c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b \\u043d\\u0430 \\u043e\\u0434\\u043d\\u043e\\u0442\\u0438\\u043f\\u043d\\u044b\\u0435, \\u0432 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0435\\u0439 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435)", "price": 14300, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:35.841525.webp", "image_origin": null, "composition": "1. 6 \\u043c\\u044f\\u0433\\u043a\\u0438\\u0445 \\u0438\\u0433\\u0440\\u0443\\u0448\\u0435\\u043a 2. \\u0424\\u043b\\u043e\\u0440\\u0438\\u0441\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b.", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
37	\N	{"presents": [{"id": 55, "popular": 0, "sort_id_catalog": 55, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430", "name_precent": "\\u0411\\u0443\\u043a\\u0435\\u0442 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0436\\u0430\\u0442", "body": "\\u0412\\u044b\\u0441\\u043e\\u0442\\u0430 \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438: 10-15 \\u0441\\u043c. (\\u0418\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435. \\u041c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b \\u043d\\u0430 \\u043e\\u0434\\u043d\\u043e\\u0442\\u0438\\u043f\\u043d\\u044b\\u0435, \\u0432 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0435\\u0439 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435)", "price": 14300, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:35.841525.webp", "image_origin": null, "composition": "1. 6 \\u043c\\u044f\\u0433\\u043a\\u0438\\u0445 \\u0438\\u0433\\u0440\\u0443\\u0448\\u0435\\u043a 2. \\u0424\\u043b\\u043e\\u0440\\u0438\\u0441\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b.", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
38	\N	{"presents": [{"id": 1, "popular": 9, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
34	\N	{"presents": [{"id": 55, "popular": 0, "sort_id_catalog": 55, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041c\\u044f\\u0433\\u043a\\u0430\\u044f \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430", "name_precent": "\\u0411\\u0443\\u043a\\u0435\\u0442 \\u043c\\u0435\\u0434\\u0432\\u0435\\u0436\\u0430\\u0442", "body": "\\u0412\\u044b\\u0441\\u043e\\u0442\\u0430 \\u0438\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438: 10-15 \\u0441\\u043c. (\\u0418\\u0433\\u0440\\u0443\\u0448\\u043a\\u0438 \\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435. \\u041c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b \\u043d\\u0430 \\u043e\\u0434\\u043d\\u043e\\u0442\\u0438\\u043f\\u043d\\u044b\\u0435, \\u0432 \\u0441\\u043b\\u0443\\u0447\\u0430\\u0435 \\u043e\\u0442\\u0441\\u0443\\u0442\\u0441\\u0442\\u0432\\u0438\\u044f \\u0434\\u0430\\u043d\\u043d\\u044b\\u0445 \\u043c\\u043e\\u0434\\u0435\\u043b\\u0435\\u0439 \\u043d\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0434\\u0435)", "price": 42900, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:35.841525.webp", "image_origin": null, "composition": "1. 6 \\u043c\\u044f\\u0433\\u043a\\u0438\\u0445 \\u0438\\u0433\\u0440\\u0443\\u0448\\u0435\\u043a 2. \\u0424\\u043b\\u043e\\u0440\\u0438\\u0441\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0438\\u0439 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b.", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 3}]}
39	\N	{"presents": [{"id": 4, "popular": 2, "sort_id_catalog": 2, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u043e\\u0435 \\u0410\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438", "body": "\\u0412\\u0435\\u0441 \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u044b 5-6 \\u043a\\u0433", "price": 21100, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997origin.webp", "composition": "1. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 2. \\u0413\\u0440\\u0443\\u0448\\u0438 3. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b 4. \\u043a\\u0438\\u0432\\u0438 5. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b 6. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 7. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 8. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 9. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]}
41	\N	{"presents": [{"id": 75, "popular": 0, "sort_id_catalog": 75, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0422\\u0440\\u043e\\u043f\\u0438\\u043a\\u0430 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u041e\\u0442\\u043b\\u0438\\u0447\\u043d\\u043e\\u0435 \\u0441\\u043e\\u0447\\u0435\\u0442\\u0430\\u043d\\u0438\\u0435 \\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u0438 \\u0441\\u043b\\u0430\\u0434\\u043e\\u0441\\u0442\\u0435\\u0439 \\u043f\\u043e\\u0434\\u0430\\u0440\\u0438\\u0442 \\u043e\\u0442\\u043b\\u0438\\u0447\\u043d\\u043e\\u0435 \\u043d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u0438\\u0435 \\u0432\\u0438\\u043d\\u043e\\u0432\\u043d\\u0438\\u043a\\u0443 \\u0442\\u043e\\u0440\\u0436\\u0435\\u0441\\u0442\\u0432\\u0430!", "price": 26350, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714origin.webp", "composition": "1. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\u0410. \\u041a\\u043e\\u0440\\u043a\\u0443\\u043d\\u043e\\u0432 3. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u043f\\u043b\\u0438\\u0442\\u043a\\u0430 \\". \\u0410. \\u041a\\u043e\\u0440\\u043a\\u0443\\u043d\\u043e\\u0432 4. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"Ferrero Rosher\\" 5. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"\\u0420\\u0430\\u0444\\u0430\\u044d\\u043b\\u043b\\u043e\\" 6. \\u041f\\u0435\\u0447\\u0435\\u043d\\u044c\\u0435 \\u0432 \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0435 (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435) 7. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0435 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"\\u0413\\u0435\\u0439\\u0448\\u0430\\" 8. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 9. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d 10. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}]}
42	\N	{"presents": [{"id": 75, "popular": 0, "sort_id_catalog": 75, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0422\\u0440\\u043e\\u043f\\u0438\\u043a\\u0430 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u041e\\u0442\\u043b\\u0438\\u0447\\u043d\\u043e\\u0435 \\u0441\\u043e\\u0447\\u0435\\u0442\\u0430\\u043d\\u0438\\u0435 \\u0444\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432 \\u0438 \\u0438 \\u0441\\u043b\\u0430\\u0434\\u043e\\u0441\\u0442\\u0435\\u0439 \\u043f\\u043e\\u0434\\u0430\\u0440\\u0438\\u0442 \\u043e\\u0442\\u043b\\u0438\\u0447\\u043d\\u043e\\u0435 \\u043d\\u0430\\u0441\\u0442\\u0440\\u043e\\u0435\\u043d\\u0438\\u0435 \\u0432\\u0438\\u043d\\u043e\\u0432\\u043d\\u0438\\u043a\\u0443 \\u0442\\u043e\\u0440\\u0436\\u0435\\u0441\\u0442\\u0432\\u0430!", "price": 26350, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714origin.webp", "composition": "1. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\u0410. \\u041a\\u043e\\u0440\\u043a\\u0443\\u043d\\u043e\\u0432 3. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u043f\\u043b\\u0438\\u0442\\u043a\\u0430 \\". \\u0410. \\u041a\\u043e\\u0440\\u043a\\u0443\\u043d\\u043e\\u0432 4. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"Ferrero Rosher\\" 5. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"\\u0420\\u0430\\u0444\\u0430\\u044d\\u043b\\u043b\\u043e\\" 6. \\u041f\\u0435\\u0447\\u0435\\u043d\\u044c\\u0435 \\u0432 \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0435 (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435) 7. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0435 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"\\u0413\\u0435\\u0439\\u0448\\u0430\\" 8. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 9. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d 10. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 11. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}]}
43	\N	{"presents": [{"id": 1, "popular": 9, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 21600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "form_precent": [], "count": 1}]}
\.


--
-- Data for Name: baskets_historybaskets; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.baskets_historybaskets (id, historybasket, basket) FROM stdin;
1	1	1
2	2	6
3	3	1
4	4	1
5	5	1
6	6	1
7	7	11
8	8	1
9	9	12
10	10	9
11	11	9
12	12	1
13	13	1
14	14	1
15	15	1
16	16	12
17	17	1
18	18	1
\.


--
-- Data for Name: bonus; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.bonus (id, user_fairbase_id, count_points, enum_povod, summ_check, "timestamp") FROM stdin;
1	o9CyeJxJ8RR0j5xrFFfLU8m0Q1D2	1500	заказ EL12	132600	2021-11-03 11:38:19.404952
2	o9CyeJxJ8RR0j5xrFFfLU8m0Q1D2	2000	заказ EL13	84600	2021-11-03 11:38:19.404952
3	nUGfeG5JTRQZcosT65zGlYXA1n92	1000	заказ EL11	107000	2021-11-03 11:38:19.404952
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.categories (id, serial_number, name_category, slug_category, icon) FROM stdin;
2	2	Подарочные корзины	Подарочныекорзины	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:10:32.012054.webp
4	5	Воздушные шары	Воздушныешары	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:12:08.027530.webp
5	7	Мягкие игрушки	Мягкиеигрушки	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:12:33.195079.webp
3	4	Букеты цветов	Букетыцветов	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:11:45.457734.webp
\.


--
-- Data for Name: categoriess_subcategoriess; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.categoriess_subcategoriess (id, subcategories, categories) FROM stdin;
1	1	2
2	2	2
3	3	2
4	4	2
5	5	2
6	6	2
7	7	2
8	8	3
9	9	3
10	10	3
11	11	3
12	12	3
13	13	3
14	14	3
15	15	3
16	16	3
\.


--
-- Data for Name: coments; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.coments (id, present_id, user_id, name_user, phone_user, email_user, body, moderation, "timestamp") FROM stdin;
\.


--
-- Data for Name: comentsservice; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.comentsservice (id, user_id, name_user, phone_user, email_user, body, moderation, "timestamp") FROM stdin;
1	\N	Диана	+7 (999) 999-99-99	test@mail.ru	Спасибо большое, заказала племяннице Киндер Ассорти, девочка была счастлива! Все доставили в срок, рекомендую!	t	2021-10-25 20:37:47.470657
2	\N	Светлана	+7 (999) 999-99-99	test@mail.ru	Ребята, спасибо за понимание и оперативность! Потрясающая корзина, все очень красиво! Процветания вам!	t	2021-10-25 20:37:47.470657
3	\N	 Олег	+7 (999) 999-99-99	test@mail.ru	Заказал корзину Fall in love реально классно собранная корзина! Спасибо за ваш сервис и экономию нашего времени! Успехов!	t	2021-10-25 20:37:47.470657
4	\N	 Нурали	+7 (999) 999-99-99	test@mail.ru	Гайз, рахмет, помирился со своей :) Ваш вклад неоценим! 	t	2021-10-25 20:37:47.470657
5	\N	 Гульмира	+7 (999) 999-99-99	test@mail.ru	Второй раз уже заказываю подарок родным и каждый раз все остаются в восторге! Спасибо вашей команде! 	t	2021-10-25 20:37:47.470657
6	\N	 Наталия	+7 (999) 999-99-99	test@mail.ru	Классный сервис, ребята! Теперь я ваш постоянный клиент, бонусы начала копить)) Молодцы! Так держать! 	t	2021-10-25 20:37:47.470657
\.


--
-- Data for Name: counter; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.counter (id, counter) FROM stdin;
1	829
\.


--
-- Data for Name: form; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.form (id, name_form) FROM stdin;
1	Корзина
2	Букет
3	Коробка
4	Ящик
5	Коллекция
6	Штука
7	Свободная
\.


--
-- Data for Name: history_basket; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.history_basket (id, history, admin_bool_dostavka, admin_send_curer, photo_otchet, send_id_curer, send_name_curer, name_user, famaly_name_user, fiz_oplata, ur_oplata, summa, phone_user, email_user, adress_user, comment_user, oplata_user, bonus_user, spisbonuys, name_company, bank_benefic, bin_bank, bik_bank, iik_bank, cod_platezh, kbe, succes_oplata, succes_dostavka_curer, "timestamp", data_dostavki) FROM stdin;
1	[{"id": 15, "popular": 0, "sort_id_catalog": 15, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "It's a girl", "body": "\\u041f\\u043e\\u0440\\u0430\\u0434\\u0443\\u0439\\u0442\\u0435 \\u0440\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u0435\\u0439 \\u043c\\u0430\\u043b\\u044b\\u0448\\u043a\\u0438 \\u0441 \\u044d\\u0442\\u0438\\u043c \\u0437\\u0430\\u043c\\u0435\\u0447\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u043c \\u0441\\u043e\\u0431\\u044b\\u0442\\u0438\\u0435\\u043c \\u0438 \\u043f\\u043e\\u0434\\u0430\\u0440\\u0438\\u0442\\u0435 \\u043f\\u0440\\u0430\\u0437\\u0434\\u043d\\u0438\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u043a\\u0443 \\u00abIt's a girl\\u00bb.", "price": 35200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2614:59:09.413069.webp", "composition": "1. \\u0411\\u0435\\u0436\\u0435\\u0432\\u044b\\u0439 \\u043f\\u043b\\u044e\\u0448\\u0435\\u0432\\u044b\\u0439 \\u043c\\u0438\\u0448\\u043a\\u0430 20 \\u0441\\u043c;\\n2. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u0433\\u0435\\u043b\\u044c \\u0434\\u043b\\u044f \\u0434\\u0443\\u0448\\u0430 200 \\u043c\\u043b;\\n3. 2 \\u0434\\u0435\\u0442\\u0441\\u043a\\u0438\\u0445 \\u043f\\u0438\\u0436\\u0430\\u043c\\u044b (2 \\u0446\\u0432\\u0435\\u0442\\u0430);\\n4. \\u0414\\u0435\\u0442\\u0441\\u043a\\u0438\\u0439 \\u0447\\u0435\\u043f\\u0447\\u0438\\u043a;\\n5. \\u0414\\u0435\\u0442\\u0441\\u043a\\u043e\\u0435 \\u043e\\u0434\\u0435\\u044f\\u043b\\u044c\\u0446\\u0435;\\n6. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "form_precent": [], "category": [], "subcategory": [], "reason_for_precent": [], "count": 1}]	f	f	\N	\N	\N	jjhh		t	f	35700	+7 (999) 999-99-99	glebhleb89@icloud.com	Город: test,Улица: test,Дом: 777,Квартира: 66		Kaspi, KZ, Kaspi Pay	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-10-27 18:04:04.609139	10/29/2021
4	[{"id": 7, "popular": 0, "sort_id_catalog": 7, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0417\\u0430\\u0440\\u044f\\u0434 \\u0438\\u043c\\u043c\\u0443\\u043d\\u0438\\u0442\\u0435\\u0442\\u0430", "body": "\\u0410\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0441\\u0435\\u0437\\u043e\\u043d\\u0435, \\u0434\\u0430\\u0440\\u0438\\u0442\\u0435 \\u0441 \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0435\\u043c!", "price": 97500, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:37.798393.webp", "image_origin": null, "composition": "1. \\u0411\\u0430\\u043d\\u043e\\u0447\\u043a\\u0430 \\u043c\\u0451\\u0434\\u0430 \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u0447\\u0430\\u044f \\n3. \\u0418\\u043c\\u0431\\u0438\\u0440\\u044c - 4 \\u0448\\u0442 \\n4. \\u041b\\u0438\\u043c\\u043e\\u043d - 7 \\u0448\\u0442., \\n5. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 5}]	f	f	\N	\N	\N	 Чингиз		t	f	98000	+7 (666) 666-66-66	mba.kimep@gmail.com	Город: Алматы,Улица: Ленина,Дом: 33,Квартира: 22		Оплата при получении	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-10-29 07:28:05.05005	10/31/2021
5	[{"id": 17, "popular": 1, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 1}]	f	f	\N	\N	\N	test		t	f	68500	+7 (666) 666-66-66	glebhleb89@icloud.com	Город: gg,Улица: gg,Дом: 55,Квартира: 55		Kaspi, KZ, Kaspi Pay	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-10-29 07:28:05.05005	10/30/2021
2	[{"id": 1, "popular": 0, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:18:35.358158.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "reason_for_precent": [], "form_precent": [], "subcategory": [], "type_precent": [], "category": [], "count": 1}]	f	t	\N	5	gleb	Чингиз Тест	Тест	t	f	26100	+7 (776) 555-25-55	mba.kimep@gmail.com	Город: Алматы,Улица: Назарбаева ,Дом: 36,Квартира: 100	Гифтсити - сила 	Оплата при получении	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-10-28 17:11:25.417104	10/29/2021
6	[{"id": 9, "popular": 0, "sort_id_catalog": 9, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041d\\u0430\\u0441\\u043b\\u0430\\u0436\\u0434\\u0435\\u043d\\u0438\\u0435", "body": "\\u0418\\u0437\\u0443\\u043c\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u043d\\u0430 \\u043b\\u044e\\u0431\\u043e\\u0439 \\u043f\\u043e\\u0432\\u043e\\u0434!", "price": 69300, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:22:27.250926.webp", "image_origin": null, "composition": "1. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"Ferrero Rocher\\" - 200 \\u0433\\u0440. \\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\u00abMillennium Classic\\u00bb Elegance - 285 \\u0433\\u0440. \\n3. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"Truff 4 you\\" -300 \\u0433\\u0440.\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 - 2 \\u0448\\u0442. (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435) \\n5. \\u041f\\u0435\\u0447\\u0435\\u043d\\u044c\\u0435 \\"\\u041er\\u0435\\u043e\\" - 2\\u0448\\u0442. \\n6. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 3}]	f	f	\N	\N	\N	gg		t	f	69800	+7 (555) 555-55-55	glebhleb89@icloud.com	Город: fgfg,Улица: fgfg,Дом: 5,Квартира: 5		Оплата при получении	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-10-29 07:28:05.05005	10/30/2021
7	[{"id": 1, "popular": 1, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "category": [], "form_precent": [], "reason_for_precent": [], "subcategory": [], "count": 1}]	f	f	\N	\N	\N	Test		t	f	26100	+7 (707) 552-52-80	a.esendykov@bk.ru	Город: Алматы,Улица: Назарбаева ,Дом: 36,Квартира: 100	Быстрее привезите	Оплата при получении	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-01 06:22:06.381528	11/02/2021
8	[{"id": 17, "popular": 2, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 272000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "reason_for_precent": [], "category": [], "subcategory": [], "type_precent": [], "form_precent": [], "count": 4}]	f	f	\N	\N	\N	gleb		t	f	272500	+7 (999) 999-99-99	glebhleb89@icloud.com	Город: Алматы,Улица: ленина,Дом: 12,Квартира: 45		Kaspi, KZ, Kaspi Pay	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-01 06:22:06.381528	11/17/2021
9	[{"id": 1, "popular": 2, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 51200, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-10-2916:58:57.719936origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "reason_for_precent": [], "form_precent": [], "type_precent": [], "category": [], "count": 2}]	f	f	\N	\N	\N	Дима		t	f	51700	+7 (777) 777-77-77	777@mail.ru	Город: Алматы,Улица: Назарбаева,Дом: 36,Квартира: 10		Kaspi, KZ, Kaspi Pay	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-01 16:11:26.33904	11/02/2021
10	[{"id": 17, "popular": 2, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "type_precent": [], "category": [], "form_precent": [], "reason_for_precent": [], "subcategory": [], "count": 1}, {"id": 1, "popular": 3, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 51200, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "subcategory": [], "type_precent": [], "reason_for_precent": [], "category": [], "count": 2}]	f	t	\N	2	string	 Глеб		t	f	119700	+7 (999) 184-50-15	glebhleb89@icloud.com	Город: Алматы,Улица: Ленина,Дом: 43,Квартира: 25		Kaspi.kz, Kaspi Pay	1000	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-03 11:26:26.674333	11/26/2021
3	[{"id": 22, "popular": 0, "sort_id_catalog": 22, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440", "name_precent": "\\u041a\\u0438\\u043d\\u0434\\u0435\\u0440 \\u0422\\u043e\\u0440\\u0442", "body": "\\u041e\\u0442\\u043b\\u0438\\u0447\\u043d\\u044b\\u0439 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a \\u0434\\u043b\\u044f \\u0441\\u043b\\u0430\\u0434\\u043a\\u043e\\u0435\\u0436\\u043a\\u0438 \\u043b\\u044e\\u0431\\u043e\\u0433\\u043e \\u043f\\u043e\\u043b\\u0430 \\u0438 \\u0432\\u043e\\u0437\\u0440\\u0430\\u0441\\u0442\\u0430!", "price": 17500, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:29:42.607361.webp", "composition": "1. Kinder-\\u0441\\u044e\\u0440\\u043f\\u0440\\u0438\\u0437 (3 \\u0448\\u0442.)  \\n2. Kinder chocolate 100\\u0433 (5 \\u0448\\u0442.)  3. \\u0411\\u0430\\u043d\\u0442  4. \\u041b\\u0435\\u043d\\u0442\\u0430 \\u043d\\u0430 \\u0446\\u0432\\u0435\\u0442\\u044b  5. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043d\\u044b\\u0439 Kinder Chocolate \\u0441\\u043e \\u0437\\u043b\\u0430\\u043a\\u0430\\u043c\\u0438 (2 \\u0448\\u0442.) , 6. \\u0418\\u0433\\u0440\\u0443\\u0448\\u043a\\u0430 \\u041c\\u0438\\u0448\\u043a\\u0430 Teddy 15 \\u0441\\u043c  7. \\u0411\\u0438\\u0441\\u043a\\u0432\\u0438\\u0442 \\u0411\\u0430\\u0440\\u043d\\u0438 (5 \\u0448\\u0442.)", "reason_for_precent": [], "form_precent": [], "subcategory": [], "type_precent": [], "category": [], "count": 1}, {"id": 17, "popular": 0, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "form_precent": [], "type_precent": [], "subcategory": [], "category": [], "reason_for_precent": [], "count": 1}]	f	t	https://giftcity.kz/api/v1/couriers/static/images/2021-11-0510:04:46.498457.jpg	5	gleb	gleb		t	f	86000	+7 (999) 999-99-99	glebhleb89@icloud.com	Город: Москва,Улица: ленина,Дом: 24,Квартира: 54		Оплата при получении	1000	0	\N	\N	\N	\N	\N	\N	\N	f	t	2021-10-29 07:28:05.05005	10/30/2021
13	[{"id": 3, "popular": 0, "sort_id_catalog": 5, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "Fall in Love", "body": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0441 \\u0446\\u0432\\u0435\\u0442\\u0430\\u043c\\u0438 \\u0438 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442\\u0430\\u043c\\u0438 \\u0434\\u043b\\u044f \\u0432\\u044b\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u044f \\u0441\\u0430\\u043c\\u044b\\u0445 \\u043d\\u0430\\u0441\\u0442\\u043e\\u044f\\u0449\\u0438\\u0445 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432!", "price": 28700, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0208:18:35.209175.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0208:18:35.209175origin.webp", "composition": "\\u0426\\u0432\\u0435\\u0442\\u044b \\u0440\\u043e\\u0437\\u044b (\\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0435) - 9 \\u0448\\u0442.\\n1. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b Merci milk 250\\u0433\\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b Lindt Lindor (milk) 200\\u0433\\n3. \\u0422\\u0440\\u044e\\u0444\\u0435\\u043b\\u0438 Belgian \\u0432 \\u043a\\u0430\\u043a\\u0430\\u043e \\u043f\\u0443\\u0434\\u0440\\u0435 200\\u0433\\n4. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0435 \\u0440\\u0430\\u043a\\u0443\\u0448\\u043a\\u0438 MarChand 125\\u0433\\n5. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Lindt dark 100\\u0433\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}, {"id": 6, "popular": 0, "sort_id_catalog": 6, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u044d\\u043b\\u043b\\u0430", "body": "\\u0412\\u043a\\u0443\\u0441\\u043d\\u044b\\u0439 \\u0438 \\u043e\\u0440\\u0438\\u0433\\u0438\\u043d\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043f\\u0440\\u0435\\u0437\\u0435\\u043d\\u0442, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0437\\u0430\\u043c\\u0435\\u0447\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u043e \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442 \\u0412\\u0430\\u0448\\u0435 \\u0434\\u0443\\u0448\\u0435\\u0432\\u043d\\u043e\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435!", "price": 19200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:15.197974.webp", "image_origin": null, "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Raffaello\\" \\n2. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 \\n3. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b \\n4. \\u041a\\u0438\\u0432\\u0438 \\n5. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 \\n6. \\u0413\\u0440\\u0443\\u0448\\u0438 \\n7. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b \\n8. \\u041c\\u0430\\u043d\\u0434\\u0430\\u0440\\u0438\\u043d\\u044b (\\u0432 \\u043f\\u0435\\u0440\\u0438\\u043e\\u0434 \\u043d\\u0435 \\u0441\\u0435\\u0437\\u043e\\u043d\\u0430 \\u043c\\u043e\\u0433\\u0443\\u0442 \\u0431\\u044b\\u0442\\u044c \\u0437\\u0430\\u043c\\u0435\\u043d\\u0435\\u043d\\u044b) \\n9. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n10. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f  \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}, {"id": 7, "popular": 3, "sort_id_catalog": 7, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0417\\u0430\\u0440\\u044f\\u0434 \\u0438\\u043c\\u043c\\u0443\\u043d\\u0438\\u0442\\u0435\\u0442\\u0430", "body": "\\u0410\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0441\\u0435\\u0437\\u043e\\u043d\\u0435, \\u0434\\u0430\\u0440\\u0438\\u0442\\u0435 \\u0441 \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0435\\u043c!", "price": 19500, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:37.798393.webp", "image_origin": null, "composition": "1. \\u0411\\u0430\\u043d\\u043e\\u0447\\u043a\\u0430 \\u043c\\u0451\\u0434\\u0430 \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u0447\\u0430\\u044f \\n3. \\u0418\\u043c\\u0431\\u0438\\u0440\\u044c - 4 \\u0448\\u0442 \\n4. \\u041b\\u0438\\u043c\\u043e\\u043d - 7 \\u0448\\u0442., \\n5. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}, {"id": 8, "popular": 0, "sort_id_catalog": 8, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041c\\u0438\\u043b\\u043a\\u0430", "body": "", "price": 17200, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:22:03.524426.webp", "image_origin": null, "composition": "1. \\u041c\\u0438\\u0448\\u043a\\u0430 \\u0442\\u0435\\u0434\\u0434\\u0438 - \\u0432\\u044b\\u0441\\u043e\\u0442\\u0430 15 \\u0441\\u043c \\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b \\"Milka\\" - 110 \\u0433\\u0440. 3. 2 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043a\\u0438 \\"Milka\\" - 80 \\u0433\\u0440. \\n4. 3 \\u043f\\u0435\\u0447\\u0435\\u043d\\u044c\\u044f \\"Milka-Choco \\u0421ow\\" - 40 \\u0433\\u0440. \\n5. 3 \\u0431\\u0430\\u0442\\u043e\\u043d\\u0447\\u0438\\u043a\\u0430 - \\"Milka-\\u0421aramel peanut\\" - 40 \\u0433\\u0440. \\n6. 2 \\u0431\\u0430\\u0442\\u043e\\u043d\\u0447\\u0438\\u043a\\u0430-\\u0432\\u0430\\u0444\\u043b\\u044f \\"Milka-Waffelini\\"- 30 \\u0433\\u0440. \\n7. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n8. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}]	f	f	\N	\N	\N	Глеб	\N	f	t	85100	+7 (999) 184-50-15	glebhleb89@icloud.com	Город: Нур-Султан,Улица: Ленина,Дом: 12,Квартира: 56		Счёт на оплату (отправляется по e-mail)	2000	0	test	test	test	test	test	test	test	t	f	2021-11-03 11:38:19.287626	11/25/2021
12	[{"id": 7, "popular": 1, "sort_id_catalog": 7, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0417\\u0430\\u0440\\u044f\\u0434 \\u0438\\u043c\\u043c\\u0443\\u043d\\u0438\\u0442\\u0435\\u0442\\u0430", "body": "\\u0410\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0441\\u0435\\u0437\\u043e\\u043d\\u0435, \\u0434\\u0430\\u0440\\u0438\\u0442\\u0435 \\u0441 \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0435\\u043c!", "price": 39000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:37.798393.webp", "image_origin": null, "composition": "1. \\u0411\\u0430\\u043d\\u043e\\u0447\\u043a\\u0430 \\u043c\\u0451\\u0434\\u0430 \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u0447\\u0430\\u044f \\n3. \\u0418\\u043c\\u0431\\u0438\\u0440\\u044c - 4 \\u0448\\u0442 \\n4. \\u041b\\u0438\\u043c\\u043e\\u043d - 7 \\u0448\\u0442., \\n5. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "type_precent": [], "category": [], "form_precent": [], "reason_for_precent": [], "subcategory": [], "count": 2}, {"id": 17, "popular": 5, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}, {"id": 1, "popular": 4, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}]	f	f	\N	\N	\N	 Глеб		t	f	133100	+7 (999) 184-50-15	glebhleb89@icloud.com	Город: Алматы,Улица: Ленина,Дом: 23,Квартира: 44		Оплата при получении	1500	0	\N	\N	\N	\N	\N	\N	\N	t	f	2021-11-03 11:38:19.287626	11/04/2021
11	[{"id": 17, "popular": 4, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 1}, {"id": 7, "popular": 1, "sort_id_catalog": 7, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0417\\u0430\\u0440\\u044f\\u0434 \\u0438\\u043c\\u043c\\u0443\\u043d\\u0438\\u0442\\u0435\\u0442\\u0430", "body": "\\u0410\\u043a\\u0442\\u0443\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0441\\u0435\\u0437\\u043e\\u043d\\u0435, \\u0434\\u0430\\u0440\\u0438\\u0442\\u0435 \\u0441 \\u0443\\u0434\\u043e\\u0432\\u043e\\u043b\\u044c\\u0441\\u0442\\u0432\\u0438\\u0435\\u043c!", "price": 39000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:21:37.798393.webp", "image_origin": null, "composition": "1. \\u0411\\u0430\\u043d\\u043e\\u0447\\u043a\\u0430 \\u043c\\u0451\\u0434\\u0430 \\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u0447\\u0430\\u044f \\n3. \\u0418\\u043c\\u0431\\u0438\\u0440\\u044c - 4 \\u0448\\u0442 \\n4. \\u041b\\u0438\\u043c\\u043e\\u043d - 7 \\u0448\\u0442., \\n5. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430 ", "subcategory": [], "reason_for_precent": [], "category": [], "form_precent": [], "type_precent": [], "count": 2}]	f	f	\N	\N	\N	Глеб		t	f	107500	+7 (999) 184-50-15	glebhleb89@icloud.com	Город: Алматы,Улица: Ленина,Дом: 54,Квартира: 12		Kaspi.kz, Kaspi Pay	1000	0	\N	\N	\N	\N	\N	\N	\N	t	f	2021-11-03 11:38:19.287626	11/26/2021
14	[{"id": 17, "popular": 6, "sort_id_catalog": 17, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041b\\u0443\\u0447\\u0448\\u0435\\u0435 \\u043f\\u043e\\u0437\\u0434\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u0435", "body": "\\u0421\\u0434\\u0435\\u043b\\u0430\\u0439\\u0442\\u0435 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u043a, \\u0432\\u044b\\u0440\\u0430\\u0437\\u0438\\u0432 \\u0441\\u0432\\u043e\\u0438\\u043c \\u0431\\u043b\\u0438\\u0437\\u043a\\u0438\\u043c \\u0432\\u0441\\u0435 \\u0442\\u0435 \\u0447\\u0443\\u0432\\u0441\\u0442\\u0432\\u0430, \\u0447\\u0442\\u043e \\u0432 \\u0432\\u0430\\u0441 \\u0442\\u0435\\u043f\\u043b\\u044f\\u0442\\u0441\\u044f. \\u041f\\u043e\\u043c\\u043e\\u0447\\u044c \\u0432 \\u044d\\u0442\\u043e\\u043c \\u0432\\u0430\\u043c \\u043c\\u043e\\u0436\\u0435\\u0442 \\u043f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043d\\u0430\\u0431\\u043e\\u0440, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0439 \\u0432\\u043a\\u043b\\u044e\\u0447\\u0430\\u0435\\u0442 \\u0432 \\u0441\\u0435\\u0431\\u044f \\u0442\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0443\\u044e \\u0432\\u043e\\u0434\\u0443 Nina Ricci Nina, \\u0440\\u043e\\u0441\\u043a\\u043e\\u0448\\u043d\\u0443\\u044e \\u0446\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0443\\u044e \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044e \\u0438\\u0437 \\u043a\\u0440\\u0430\\u0441\\u043d\\u044b\\u0445 \\u0438 \\u0440\\u043e\\u0437\\u043e\\u0432\\u044b\\u0445 \\u0440\\u043e\\u0437, \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0435\\u043d\\u043d\\u0443\\u044e \\u0431\\u0435\\u043b\\u044b\\u043c\\u0438 \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u0430\\u043c\\u0438, \\u0430 \\u0442\\u0430\\u043a\\u0436\\u0435 \\u0432\\u043a\\u0443\\u0441\\u043d\\u0435\\u0439\\u0448\\u0438\\u0439 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438", "price": 68000, "image_precent": "http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:58.849632.webp", "image_origin": null, "composition": "1. \\u0422\\u0443\\u0430\\u043b\\u0435\\u0442\\u043d\\u0430\\u044f \\u0432\\u043e\\u0434\\u0430 Nina Ricci Nina 50 \\u043c\\u043b;\\n2. \\u0426\\u0432\\u0435\\u0442\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0438\\u044f \\u0438\\u0437 \\u0440\\u043e\\u0437, \\u043b\\u0438\\u0437\\u0438\\u0430\\u043d\\u0442\\u0443\\u0441\\u043e\\u0432, \\u0438 \\u0434\\u0440\\u0443\\u0433\\u0438\\u0445 \\u0446\\u0432\\u0435\\u0442\\u043e\\u0432 \\u0441 \\u0437\\u0435\\u043b\\u0435\\u043d\\u044c\\u044e;\\n3. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430;\\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0442\\u043e\\u0440\\u0442 \\u0441 \\u0444\\u0440\\u0443\\u043a\\u0442\\u0430\\u043c\\u0438 0.8-1 \\u043a\\u0433;\\n5. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430;", "reason_for_precent": [], "type_precent": [], "form_precent": [], "subcategory": [], "category": [], "count": 1}]	f	f	\N	\N	\N	Глеб 		t	f	68500	+7 (999) 999-99-99	glebhleb89@icloud.com	Город: Алматы,Улица: Ленина,Дом: 13,Квартира: 13		Оплатить картой Visa / Master Card	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-06 11:50:37.550636	11/13/2021
15	[{"id": 1, "popular": 5, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "form_precent": [], "reason_for_precent": [], "type_precent": [], "category": [], "count": 1}, {"id": 4, "popular": 0, "sort_id_catalog": 2, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u043e\\u0435 \\u0410\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438", "body": "\\u0412\\u0435\\u0441 \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u044b 5-6 \\u043a\\u0433", "price": 21100, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997origin.webp", "composition": "1. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 2. \\u0413\\u0440\\u0443\\u0448\\u0438 3. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b 4. \\u043a\\u0438\\u0432\\u0438 5. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b 6. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 7. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 8. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 9. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "form_precent": [], "reason_for_precent": [], "type_precent": [], "category": [], "count": 1}]	f	f	\N	\N	\N	Глеб		t	f	47200	+7 (999) 999-99-99	glebhleb89@icloud.com	Город: Нур-Султан,Улица: Ленина,Дом: 56,Квартира: 35		Оплатить картой Visa / Master Card	1000	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-06 12:09:37.920331	11/19/2021
16	[{"id": 1, "popular": 6, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "type_precent": [], "reason_for_precent": [], "form_precent": [], "category": [], "subcategory": [], "count": 1}]	f	f	\N	\N	\N	Chingiz Test		t	f	26100	+7 (776) 555-25-55	mba.kimep@gmail.com	Город: Алматы,Улица: Пушкина,Дом: 36,Квартира: 413		Kaspi.kz, Kaspi Pay	500	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-06 19:37:20.256895	11/08/2021
17	[{"id": 1, "popular": 6, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "subcategory": [], "form_precent": [], "reason_for_precent": [], "type_precent": [], "category": [], "count": 1}, {"id": 2, "popular": 0, "sort_id_catalog": 3, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0421\\u043b\\u0430\\u0434\\u043a\\u0430\\u044f \\u043f\\u0440\\u0435\\u043b\\u0435\\u0441\\u0442\\u044c", "body": "\\u0421\\u0442\\u0438\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u0440\\u043e\\u043c\\u0430\\u043d\\u0442\\u0438\\u0447\\u0435\\u0441\\u043a\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0441\\u043b\\u0430\\u0434\\u043e\\u0441\\u0442\\u0435\\u0439 - \\u043e\\u0442\\u043b\\u0438\\u0447\\u043d\\u044b\\u0439 \\u0432\\u044b\\u0431\\u043e\\u0440 \\u0434\\u043b\\u044f \\u0434\\u043e\\u0440\\u043e\\u0433\\u043e\\u0439 \\u0441\\u043b\\u0430\\u0434\\u043a\\u043e\\u0435\\u0436\\u043a\\u0438!", "price": 19500, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081origin.webp", "composition": "1. Nutella 200\\u0433 \\n2. \\u041a\\u043e\\u043d\\u0444\\u0435\\u0442\\u044b Merci Finest Selection 250 \\u0433 \\n3. Kinder chocolate 100\\u0433 \\n4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\u043c\\u043e\\u043b\\u043e\\u0447\\u043d\\u044b\\u0439 Kinder Chocolate \\u0441\\u043e \\u0437\\u043b\\u0430\\u043a\\u0430\\u043c\\u0438 (2 \\u0448\\u0442.) 5.\\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043d\\u044b\\u0439 \\u0431\\u0430\\u0442\\u043e\\u043d\\u0447\\u0438\\u043a Kit-Kat (4 \\u0448\\u0442.)   \\n7. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Toblerone 100\\u0433  \\n8. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 Milka 90\\u0433 \\n9. \\u041a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 M", "type_precent": [], "reason_for_precent": [], "form_precent": [], "category": [], "subcategory": [], "count": 1}]	f	f	\N	\N	\N	Глеб		t	f	45600	+7 (896) 777-76-78	glebhleb89@icloud.com	Город: Алматы,Улица: Ленина,Дом: 14,Квартира: 32		Оплатить картой Visa / Master Card	1000	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-06 19:37:20.256895	11/20/2021
18	[{"id": 1, "popular": 8, "sort_id_catalog": 1, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u041a\\u043e\\u0444\\u0435 \\u0441 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c", "body": "\\u0412\\u0435\\u043b\\u0438\\u043a\\u043e\\u043b\\u0435\\u043f\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u044f\\u0442\\u043d\\u043e\\u0433\\u043e \\u0432\\u0440\\u0435\\u043c\\u044f\\u043f\\u0440\\u043e\\u0432\\u043e\\u0436\\u0434\\u0435\\u043d\\u0438\\u044f \\u0437\\u0430 \\u0447\\u0430\\u0448\\u0435\\u0447\\u043a\\u043e\\u0439 \\u043a\\u043e\\u0444\\u0435 \\u0438 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043c!", "price": 25600, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp", "composition": "1. \\u041a\\u043e\\u0440\\u043e\\u0431\\u043a\\u0430 \\u043a\\u043e\\u043d\\u0444\\u0435\\u0442 \\"Ferrero rocher\\" - 200 \\u0433\\u0440., \\r\\n2. \\u041f\\u0430\\u0447\\u043a\\u0430 \\u043a\\u043e\\u0444\\u0435 (\\u0437\\u0430\\u0432\\u0430\\u0440\\u043d\\u043e\\u0439) \\r\\n3. 5 \\u0448\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434\\u043e\\u043a \\"Ritter Sport\\" (\\u0432 \\u0430\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438\\u043c\\u0435\\u043d\\u0442\\u0435)  4. \\u0428\\u043e\\u043a\\u043e\\u043b\\u0430\\u0434 \\"Toblerone\\" \\r\\n6. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 \\r\\n7. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}, {"id": 4, "popular": 1, "sort_id_catalog": 2, "sort_id_popularnoe": null, "sort_id_novinki": null, "prevue_name": "\\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430", "name_precent": "\\u0424\\u0440\\u0443\\u043a\\u0442\\u043e\\u0432\\u043e\\u0435 \\u0410\\u0441\\u0441\\u043e\\u0440\\u0442\\u0438", "body": "\\u0412\\u0435\\u0441 \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u044b 5-6 \\u043a\\u0433", "price": 21100, "image_precent": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997.webp", "image_origin": "https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:52.245997origin.webp", "composition": "1. \\u042f\\u0431\\u043b\\u043e\\u043a\\u0438 2. \\u0413\\u0440\\u0443\\u0448\\u0438 3. \\u0410\\u043f\\u0435\\u043b\\u044c\\u0441\\u0438\\u043d\\u044b 4. \\u043a\\u0438\\u0432\\u0438 5. \\u0411\\u0430\\u043d\\u0430\\u043d\\u044b 6. \\u0412\\u0438\\u043d\\u043e\\u0433\\u0440\\u0430\\u0434 7. \\u0410\\u043d\\u0430\\u043d\\u0430\\u0441 8. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u043a\\u043e\\u0440\\u0437\\u0438\\u043d\\u0430 9. \\u041f\\u043e\\u0434\\u0430\\u0440\\u043e\\u0447\\u043d\\u0430\\u044f \\u0443\\u043f\\u0430\\u043a\\u043e\\u0432\\u043a\\u0430", "form_precent": [], "reason_for_precent": [], "subcategory": [], "category": [], "type_precent": [], "count": 1}]	f	f	\N	\N	\N	Gleb		t	f	47200	+7 (888) 776-66-67	glebhleb89@icloud.com	Город: Нур-Султан,Улица: Lenin’s,Дом: 14,Квартира: 34		Kaspi.kz, Kaspi Pay	1000	0	\N	\N	\N	\N	\N	\N	\N	f	f	2021-11-06 20:32:06.150169	11/20/2021
\.


--
-- Data for Name: mailing; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.mailing (id, email_user) FROM stdin;
1	a.esendykov@bk.ru
\.


--
-- Data for Name: present; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.present (id, popular, sort_id_catalog, sort_id_popularnoe, sort_id_novinki, prevue_name, name_precent, body, price, image_precent, composition, image_origin) FROM stdin;
12	0	12	\N	\N	Букет	Эксклюзив	Эксклюзивный букет для особенного торжественного повода!\n\n*оформление может отличаться	31300	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:23:40.801449.webp	1. 2 гортензии \n2. 21 кремовая и белая роза \n3. Ветка зеленой хризантемы сантини \n4. Эустома \n5. Зелень \n6. Подарочная упаковка	\N
14	0	14	\N	\N	Букет	51 хризантема	Нежный букет прелестных цветов передаст искренность Ваших намерений и несомненно восхитит любимую!	61200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:27:08.406070.webp	1. 51 ветка белой ромашковой хризантемы \n2. Оформление, подарочная упаковка	\N
9	1	9	\N	\N	Подарочная корзина	Наслаждение	Изумительная корзина на любой повод!	23100	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:54:20.034398.webp	1. Конфеты "Ferrero Rocher" - 200 гр. \n2. Конфеты «Millennium Classic» Elegance - 285 гр. \n3. Конфеты "Truff 4 you" -300 гр.\n4. Шоколад - 2 шт. (в ассортименте) \n5. Печенье "Оrео" - 2шт. \n6. Корзина\n7. Подарочная упаковка 	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:54:20.034398origin.webp
3	1	5	\N	\N	Подарочная корзина	Fall in Love	Подарочная корзина с цветами и конфетами для выражения самых настоящих чувств!	28700	https://giftcity.kz/api/v1/present/static/images/2021-11-0208:18:35.209175.webp	Цветы розы (красные) - 9 шт.\n1. Конфеты Merci milk 250г\n2. Конфеты Lindt Lindor (milk) 200г\n3. Трюфели Belgian в какао пудре 200г\n4. Конфеты шоколадные ракушки MarChand 125г\n5. Шоколад Lindt dark 100г\n6. Подарочная корзина\n7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0208:18:35.209175origin.webp
6	1	6	\N	\N	Подарочная корзина	Фруктовэлла	Вкусный и оригинальный презент, который замечательно дополнит Ваше душевное поздравление!	19200	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:52:00.275692.webp	1. Коробка конфет "Raffaello" \n2. Ананас \n3. Бананы \n4. Киви \n5. Яблоки \n6. Груши \n7. Апельсины \n8. Мандарины (в период не сезона могут быть заменены) \n9. Корзина \n10. Подарочная  упаковка 	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:52:00.275692origin.webp
7	4	7	\N	\N	Подарочная корзина	Заряд иммунитета	Актуальная корзина в этом сезоне, дарите с удовольствием!	16500	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:52:56.756716.webp	1. Баночка мёда \n2. Пачка чая \n3. Имбирь - 4 шт \n4. Лимон - 7 шт., \n5. Корзина\n6. Подарочная упаковка 	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:52:56.756716origin.webp
10	0	10	\N	\N	Подарочная корзина	Неповторимой	Подарите яркие и радостные эмоции!	24600	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:54:50.118473.webp	1. Мишка белый - высота 30 см. 2. Коробка конфет "Raffaello"- 150 гр. 3. Коробка конфет "Любимов" - 100 гр. 4. Коробка конфет "Merci" -250гр 5. Nutella - 360г. 6.Батончик "Kit-Kat" - 4 шт. 7. Шоколад "Ritter Sport" 8. Корзина 9. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:54:50.118473origin.webp
16	0	16	\N	\N	Подарочная корзина	It's a boy	Появление на свет наследника никогда не обходится без настоящего праздника и подарков!	35200	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:57:42.808484.webp	1. Бежевый плюшевый мишка 20 см;\n2. Детский гель для душа 200 мл;\n3. Носочки;\n4. Детская пижамка;\n5. Детское одеяльце;\n6. Корзина;\n7. Подарочная упаковка;\n	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:57:42.808484origin.webp
8	1	8	\N	\N	Подарочная корзина	Милка	Акция! Не упустите возможность подарить сладкую и стильную корзину своим близким!	13200	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:53:30.159270.webp	1. Мишка тедди - высота 15 см \n2. Конфеты "Milka" - 110 гр. 3. 2 шоколадки "Milka" - 80 гр. \n4. 3 печенья "Milka-Choco Сow" - 40 гр. \n5. 3 батончика - "Milka-Сaramel peanut" - 40 гр. \n6. 2 батончика-вафля "Milka-Waffelini"- 30 гр. \n7. Корзина \n8. Подарочная упаковка 	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:53:30.159270origin.webp
18	0	18	\N	\N	Букет	Dolce & Gabbana	Выразить чувства к любимому человеку порой нелегко, так пусть за вас говорят цветы с духами!	52500	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:14.277387.webp	- Парфюмированная вода Dolce&Gabbana The One для женщин 30 мл;\n- Букет из ирисов, альстромерий и других кустовых цветов с зеленью;\n- Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:14.277387origin.webp
13	0	13	\N	\N	Букет	21 прекрасных роз	Неповторимый и незабываемый букет из 21 роз, от которых любая женщина будет просто в восторге!	19200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:24:50.401573.webp	1. Микс из 21 белой и красной розы\n2. Подарочная упаковка	\N
20	0	20	\N	\N	Мягкая игрушка	Мишка-романтик	Начните романтический вечер правильно с подарком "Мишка-романтик"!	19100	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:28:40.341448.webp	1. Голландская длинная красная роза с зеленью;\n2. Плюшевый мишка 20 см;\n3. Качественные шоколадные конфеты 200 гр;\n4. Подарочная упаковка;	\N
21	0	21	\N	\N	Коробка	Royal 	Цветы в коробке с макарони (диаметр 20 см, высота 15 см).	25000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:28:55.234533.webp	1. Розы кустовые 2. Диантус 3. Сантини 4. Барбатус 5. Грин 6. Гиперикум  7. Кондитерское изделие Макарон 8. Круглой коробка 9. Подарочная упаковка	\N
47	0	47	\N	\N	Букет	Прелесть	Отличный подарок для дорогого сердцу человека!	27100	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:36:20.381770.webp	1. 3 веток белой ромашковой хризантемы 2. 8 веток кустовой розовой розы 3. полевые цветы 4. зелень 5. Подарочное оформление.	\N
64	0	64	\N	\N	Коллекция	Бирюза	Модное сочетание аквамарина и серебра даст повод для крутых фото на память!	18760	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:41:09.479731.webp	1. 2 фольгированных шарика 2. 7 разноцветных латексных гелиевых шариков.	\N
24	0	24	\N	\N	Подарочная корзина	Нежная	Нежная корзина подарит много радости и счастья прекрасной половины!	17900	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:00:50.197866.webp	1. Мишка тедди - высота 15 см 2. Конфеты "Milka" - 110 гр. 3. Коробка конфет "Raffaello"- 150 гр. 4. Nutella - 180г. 5. Корзина 6. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:00:50.197866origin.webp
25	0	25	\N	\N	Подарочная корзина	Дива		28150	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:01:58.190201.webp	1. 5 красных роз 2.Коробка конфет "Merci" - 250гр 3.Конфеты "Ferrero Rocher" - 200 гр. 4. Шоколад "Ritter Sport" - 2 шт. 5. Баночка мёда 6.Пачка чая "Basilur" 7. Зелень декор 8.Корзина 9. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:01:58.190201origin.webp
26	0	26	\N	\N	Подарочная корзина	Фруктовый джаз	Вес корзины до 3х кг	14800	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:02:35.962512.webp	1. Виноград 2.Киви 3.Бананы 4.Яблоки 5.Апельсины 6.Корзина 7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:02:35.962512origin.webp
29	0	29	\N	\N	Подарочная корзина	Идеальная	Стильная корзина сладостей, кофе и чая - прекрасный презент для поздравления с радостными событиями!	39200	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:07:18.862593.webp	1. Конфеты "Ferrero Rocher" - 200 гр. 2.Коробка конфет "Raffaello"- 150 гр. 3.Конфеты "Truff 4 you" - 300 гр. 4.Шоколад "Toblerone" - 2шт. 5. Шоколад "Roshen"- 2 шт. (в ассортименте) 6. Пачка кофе "Carte Noire" (заварной) 7. Пачка чая "Basilur" 8. Корзина 9. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:07:18.862593origin.webp
33	0	28	\N	\N	Подарочная корзина	Зимняя	Корзина из сладостей, душистого чая и ароматного кофе сделают зимние праздники еще ярче и счастливее!\n	25500	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:05:31.235359.webp	Набор конфет Ferrero Rocher\n\n1. Кофе Carte Noire\n\n2. Чай Greenfield\n3. Конфеты Ferrero Rosher\n4. Ветки ели и декор игрушки\n5. Корзина\n6. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:05:31.235359origin.webp
31	0	31	\N	\N	Подарочная корзина	Первая и единственная 	Очаровательная коробка с цветами и киндерами очарует любую даму!	26890	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:32:16.267854.webp	1. Киндер сюрприз - 10 шт\r\n2. Розы красные - 17 шт	\N
32	0	32	\N	\N	Подарочная корзина	Душевный набор	Душевная корзина подойдет для любого повода! Поднимает настроение виновника торжества мгновенно!	36780	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:09:41.964596.webp	1. Букет из роз 60 см - 27 штук\n2. Набор конфет Ferrero Rocher\n3. Корзина с фруктами 3-4 кг	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:09:41.964596origin.webp
28	0	33	\N	\N	Подарочная корзина	Фруктовый Сад	Вес корзины 3-4 кг	14240	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:10:27.953326.webp	1. Апельсины 2. Виноград  3. Яблоки 4. Груши 5. Киви 6. Бананы 7. Корзина 8. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:10:27.953326origin.webp
42	0	42	\N	\N	Букет	Изысканный	Букет для теплых и душевных пожеланий!	19700	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:34:51.303921.webp	 1. 3 ветки белой ромашковой хризантемы 2. 6 веток кустовой розовой розы 3. Зелень 4. Подарочная упаковка	\N
38	0	38	\N	\N	Букет	Королевские - 101 роза	В ряде культур синие розы традиционно ассоциируются с королевской кровью, таким образом голубая роза может обозначать королевское величие и великолепие. В китайском фольклоре синяя роза выступает в качестве символа большой любви	75000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:33:58.018256.webp	1. 101 синяя роза\n2. Подарочная упаковка	\N
35	0	35	\N	\N	Букет	21 пион в шляпной коробке	Композиция из 21 пиона разных оттенков станет отличным подарком ко дню рождения, годовщине знакомства или юбилею коллеги. Вручить подобный презент можно и по случаю участия в конференции, выпуска из школы.	52400	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:33:21.475110.webp	1. 21 пион в шляпной коробке\n2. Шляпная коробка\n3. Подарочная упаковка	\N
43	0	43	\N	\N	Букет	Аромат и сладость	Нежный букет с чудесными конфетами Рафаэлло!	18600	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:35:03.303193.webp	1. 3 ветки белой ромашковой хризантемы 2. Гипсофила 3. Зелень 4. Коробка конфет "Raffaello".\n	\N
40	0	40	\N	\N	Букет	Хризантемы в корзине	Шикарная корзина из 25 веток хризантем!	42100	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:34:28.160082.webp	1. Хризантема кустовая белая (25 шт.) 1. Зелень в букет (2 шт.) 3. Корзина 4. Оазис на цветы в коробке или композиции (2 шт.) 5. Подарочная упаковка	\N
41	0	41	\N	\N	Букет	Свежий	Ароматный букет белых и красных цветов!	12500	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:34:40.453697.webp	1. 3 красные розы 2. 4 ветки белой ромашковой хризантемы 3. зелень 4. Подарочная упаковка	\N
44	0	44	\N	\N	Букет	Сладостные мысли	Эти цветы часто дарят без явного любовного подтекста. Это символ нежности, сладостных мыслей и романтических мечтаний. Они могут выражать радость, благодарность, восхищение.	24750	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:35:15.189196.webp	1. 3 цветка орхидеи 2. 4 ветки белой ромашковой хризантемы 3. Розовые гвоздики 4. Зелень 5.Подарочная упаковка	\N
45	0	45	\N	\N	Букет	Тысяча и одна роза	Абсолютно все согласятся с тем, что такой подарок просто невозможно забыть, он остается в памяти на всю жизнь. И именно об объемном букете, который сложно обхватить руками, мечтает большинство девушек. Получив такой подарок, они приходят в восторг и еще долгое время делятся со своими близкими впечатлениями от презента.	327350	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:35:28.064547.webp	1. 1001 красная роза\n2. Подарочная упаковка	\N
46	0	46	\N	\N	Букет	Краски бодрости	Красочный сборный букет из хризантем, гвоздик и зелени!	23650	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:35:41.101290.webp	1. 3 розы 2.11 разноцветных хризантем 3.5 гвоздик 4. Альстромерии 6. Полевые цветы (полевые цветы являются сезонными, при отсутствии могут заменяться зеленью) 7. Зелень 8. Подарочная упаковка.	\N
36	0	36	\N	\N	Букет	Жозефина	Удивительно нежный букет из пышных розовых и белых пионов – это воплощения романтических мечтаний любой девушки.	18400	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:33:34.680553.webp	1. 7 пионов\n2. Подарочная упаковка	\N
39	0	39	\N	\N	Букет	Лепестки разноцветных роз	Лепестки роз не только имеют красивый вид, но они также выделяют тонкий нежный аромат страсти. Из лепестков роз можно выложить сердце и написать лепестками признание в любви.	27200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:34:09.532513.webp	1. Роза двухцветная (23 шт.)\n2. Деревянная корзина\n3. Лента	\N
37	0	37	\N	\N	Букет	Феерия		27300	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:33:47.376506.webp	1. Диантус - 10 шт 2. Минигербера- 5 шт 3. Розы -17 шт 4. Пионы 3 шт 5. Зелень.	\N
49	0	49	\N	\N	Букет	Мишка с букетом роз	Веселый мишка с нежным букетом розовых роз!	28200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:36:57.621309.webp	1. 19 розовых роз 60 см\n2. Мягкая игрушка мишка 30 см	\N
50	0	50	\N	\N	Букет	75 роз с Ferrero Rosher	Сочный букет роз с шоколадными конфетами 	42500	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:37:12.835103.webp	1. 75 красных роз 2. Конфеты Ferrero Rosher 3. Подарочное оформление.	\N
51	0	51	\N	\N	Мягкая игрушка	Мишка-гигант с букетом роз	Очаровательный Мишка и классический букет красных роз!	35900	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:37:25.281232.webp	1. 11 красных роз до 60 см\n2. Мягкая игрушка Мишка 1 м\n3. Подарочное оформление	\N
52	0	52	\N	\N	Мягкая игрушка	Мишка Тедди 20 см	Милый маленький мишка несомненно растрогает и подарит любимой замечательное веселое настроение!	4500	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:37:51.026070.webp	1. Мишка Тедди 20 см	\N
56	0	56	\N	\N	Букет	Синева	Прекрасный мини-букет из гортензии в воздушном оформлении станет замечательным комплиментом для любимого человека!	17800	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:51.000167.webp	1. Гортензия \n2. Конфеты "Ferrero" - 200 гр. 3. Подарочное оформление	\N
60	0	60	\N	\N	Коллекция	I love you	Удиви любимую ярким облаком из сердец!	16000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:40:03.132407.webp	5 фольгированных гелиевых шаров. (Фольгированный шар  в ассортименте. Шар может быть заменен на однотипный, в случае отсутствия данной модели на складе)	\N
61	0	61	\N	\N	Коллекция	Смайл	Романтичный и позитивный микс из шариков	8400	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:40:15.751821.webp	7 разноцветных латексных гелиевых шариков	\N
62	0	62	\N	\N	Коллекция	Цифры	Поздравьте дорогого человека со знаменательной датой яркими воздушными шарами!	9600	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:40:31.244006.webp	1 фольгированный гелиевый шар в форме цифры	\N
63	0	63	\N	\N	Коллекция	Микс 	Связка ярких и праздничных воздушных шариков	20800	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:40:57.537532.webp	1. 5 фольгированных гелиевых шариков 2. 4 латексных гелиевых шарика. (Шарики  в ассортименте. Шарики могут быть заменены на однотипные, в случае отсутствия данной модели на складе)	\N
65	0	65	\N	\N	Коллекция	Нежный микс	Коллекция подарит восхитительные эмоции Вашему получателю и поможет сделать праздник незабываемым! 	18760	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:41:29.945653.webp	1. 2 фольгированных шарика 2. 7 разноцветных латексных гелиевых шариков	\N
48	0	48	\N	\N	Букет	Слова любви	Белоснежная корзина цветов окутанных сочной зеленью!	23450	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:36:32.389586.webp	1. 3 ветки белой ромашковой хризантемы 2.Зелень 4. Подарочное оформление, 3. Корзина (может быть заменена на однотипную, в случае отсутствия данной модели на складе.)	\N
66	0	66	\N	\N	Коллекция	5 разноцветных шариков	С разноцветными шариками яркий праздник Вашему получателю обеспечен!	6800	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:41:43.415497.webp	1. 5 латексных разноцветных гелиевых шариков с принтами цветов.	\N
34	0	34	\N	\N	Подарочная корзина	Кофейная	Для истинных ценителей кофе!	36200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:33:07.238261.webp	1. Кофе зерновой/молотый Starbucks blonde 200 г\n2. Кофе зерновой/молотый Starbucks medium/dark 200 г\n3. Сироп для кофе - 2 шт\n4. Марципан в темном шоколаде 100г\n5. Драже грильяж в шоколаде - 150г\n6. Драже миндаль/кешью/фундук в белом шоколаде/молочном шоколаде - 150г\n7. Конфеты Ferrero Rocher 300г\n8. Термокружка\n9. Корзина\n10. Подарочная упаковка	\N
54	0	54	\N	\N	Мягкая игрушка	Мишка Великан	Большие мягкие мишки актуальны во все времена	42000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:16.061565.webp	1. Мягкая игрушка "Мишка" 2м	\N
55	0	55	\N	\N	Мягкая игрушка	Букет медвежат	Высота игрушки: 10-15 см. (Игрушки в ассортименте. Могут быть заменены на однотипные, в случае отсутствия данных моделей на складе)	14300	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:35.841525.webp	1. 6 мягких игрушек 2. Флористический материал.	\N
57	0	57	\N	\N	Мягкая игрушка	Мишка Тедди 30 см		6000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:39:04.093709.webp	1. Мишка тедди 30 см	\N
58	0	58	\N	\N	Мягкая игрушка	Мишка 1.5 м		35000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:39:18.959542.webp	1. Мягкая игрушка "Мишка" 1.5 м	\N
59	0	59	\N	\N	Мягкая игрушка	Мишка 100 см		28000	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:39:47.965146.webp	Мягкая игрушка "Мишка" 100 см	\N
70	0	70	\N	\N	Подарочная корзина	Детское	Превосходный сюрприз для ребенка	18560	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:11:57.737286.webp	1. Мягкая игрушка Мишка Тедди 2. Бутылка детского шампанского, коробка конфет "Raffaello"- 150 гр. 3. Шоколадки "Kinder" 8 порций - 2 шт. 4. Шоколадки "Kinder" 4 порции - 1 шт. 5. Батончик "Kinder Bueno" - 4 шт.\n6. Киндеры - 4шт. 7. Корзина 8. Подарочная упаковка 	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:11:57.737286origin.webp
77	0	77	\N	\N	Букет	Пронзительное сочетание	Желтый и синий — драматичное сочетание. Такое сочетание используют импрессионисты, как, например, Ван Гог в картине «поле под бурным небом». В нем соприкасаются разности: холодного и теплого, темного и светлого, погруженного в себя и общительного, плодородной земли и неспокойного неба.\nДарите на радость!	17800	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:17:46.599056.webp	1. 11 веток желтой и синей хризантемы	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:17:46.599056origin.webp
15	1	15	\N	\N	Подарочная корзина	It's a girl	Порадуйте родителей малышки с этим замечательным событием и подарите праздничную корзинку «It's a girl».	35200	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:57:29.024702.webp	1. Бежевый плюшевый мишка 20 см;\n2. Детский гель для душа 200 мл;\n3. 2 детских пижамы (2 цвета);\n4. Детский чепчик;\n5. Детское одеяльце;\n6. Корзина;\n7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:57:29.024702origin.webp
74	0	74	\N	\N	Подарочная корзина	Волшебная	Поздравления могут быть не только красивые, но еще и максимально полезные! 	20500	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:11.022699.webp	1. Коробка конфет "Raffaello"- 150 гр. 2. Баночка джема 3.Пачка чая 4. 8 мандарин (в период не сезона лето-осень могут быть заменены нектаринами или персиками), 5. 5 лимонов 6. Корзина 7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:11.022699origin.webp
5	0	4	\N	\N	Подарочная корзина	Маленькое чудо	Бренд MotherCare.	38500	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590.webp	1. Детское полотенце;\n2. Детское Одеяло;\n3. Детский слип;\n4. Детская шапочка; \n5. Расческа и гребешок из пластика;\n6. Детская махровая варежка для купания;\n7. Детские пинетки;\n8. Плюшевый мишка среднего размера;\n9. Подарочная корзина;\n10. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:52.653590origin.webp
22	1	22	\N	\N	Подарочный набор	Киндер Торт	Отличный подарок для сладкоежки любого пола и возраста!	17500	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:43.444750.webp	1. Kinder-сюрприз (3 шт.)  \n2. Kinder chocolate 100г (5 шт.)  3. Бант  4. Лента на цветы  5. Шоколад молочный Kinder Chocolate со злаками (2 шт.) , 6. Игрушка Мишка Teddy 15 см  7. Бисквит Барни (5 шт.)	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:59:43.444750origin.webp
2	1	3	\N	\N	Подарочная корзина	Сладкая прелесть	Стильная и романтическая корзина сладостей - отличный выбор для дорогой сладкоежки!	18500	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081.webp	1. Nutella 200г \n2. Конфеты Merci Finest Selection 250 г \n3. Kinder chocolate 100г \n4. Шоколад молочный Kinder Chocolate со злаками (2 шт.) 5.Шоколадный батончик Kit-Kat (4 шт.)   \n7. Шоколад Toblerone 100г  \n8. Шоколад Milka 90г \n9. Корзина M	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:21:20.938081origin.webp
73	0	73	\N	\N	Подарочная корзина	Фруктовый Рай	Яркий фруктовый микс станет замечательным и вкусным подарком!	18900	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:12:23.470680.webp	1. Виноград \n2. Киви \n3. Бананы \n4. Яблоки \n5. Апельсины \n6. Корзина \n7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:12:23.470680origin.webp
23	0	23	\N	\N	Подарочная корзина	Моей Зайке	Прелестная корзина растопит сердце любимой!	18600	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:00:06.069095.webp	1. Зайка плюшевый  2. Бисквит Барни (5 шт.)  3. Kinder-сюрприз (3 шт.)  4. Вафли Kinder Bueno с молочным шоколадом (2 шт.)  5. Kinder chocolate 100г (2 шт.)  6. Kinder chocolate 50г (2 шт.)  7. Корзина  8. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:00:06.069095origin.webp
11	0	11	\N	\N	Подарочная корзина	Элегант	Данная корзина станет отличным презентом ко Дню рождения, по случаю выздоровления или новоселья. . Без сомнения, это будет хороший повод устроить чаепитие!	33500	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:56:59.050464.webp	1. Коробка конфет "Ferrero rocher" - 300 гр. \n2. Коробка конфет "Raffaello"- 150 гр. \n3. Коробка конфет "Merci" 250г. \n4. Коробка конфет "Любимов"- 100 гр. \n5. Шоколад "Ritter Sport"- 1 шт. (в ассортименте) \n6.Шоколад "Toblerone" - 2 шт. \n7. Пачка кофе "Carte Noire" (заварной) \n8. Баночка джема - 400гр. \n9. Корзина, декор \n10. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:56:59.050464origin.webp
53	0	53	\N	\N	Мягкая игрушка	Тедди девочка	Симпатичная игрушка - прекрасный подарок для самой милой и нежной девушки! Игрушка будет идеальным дополнением к нежному букету в белых или розовых тонах.	4500	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:38:02.742772.webp	1. Мишка Тедди 20 см	\N
19	0	19	\N	\N	Мягкая игрушка	Мишка коричневый	Поздравить маленького именинника с Днем рождения или напомнить любимой, что встреча не за горами, очень просто!	37200	http://giftcity.kz/api/v1/present/static/images/2021-10-2817:28:27.013435.webp	Большой плюшевый медведь темно-коричневого цвета 150 см;	\N
17	7	17	\N	\N	Подарочная корзина	Лучшее поздравление	Сделайте подарок, выразив своим близким все те чувства, что в вас теплятся. Помочь в этом вам может подарочный набор, который включает в себя туалетную воду Nina Ricci Nina, роскошную цветочную композицию из красных и розовых роз, дополненную белыми лизиантусами, а также вкуснейший шоколадный торт с фруктами	68000	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:58:22.407653.webp	1. Туалетная вода Nina Ricci Nina 50 мл;\n2. Цветочная композиция из роз, лизиантусов, и других цветов с зеленью;\n3. Корзина;\n4. Шоколадный торт с фруктами 0.8-1 кг;\n5. Подарочная упаковка;	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:58:22.407653origin.webp
27	0	27	\N	\N	Подарочная корзина	Цитрусово-банановый	Прекрасное сочетание цветов и фруктов приведет в восторг представительницу прекрасного пола и подарит самые яркие эмоции!	15680	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:03:12.075628.webp	 1. 5 коралловых роз 2. 7 мандарин (в период не сезона могут быть заменены) 3. 6 лимонов 4. 5 бананов 6. Корзина 7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:03:12.075628origin.webp
4	2	2	\N	\N	Подарочная корзина	Фруктовое Ассорти	Вес корзины до 5 кг	19500	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:49:56.462175.webp	1. Яблоки 2. Груши 3. Апельсины 4. киви 5. Бананы 6. Виноград 7. Ананас 8. Подарочная корзина 9. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0718:49:56.462175origin.webp
30	0	30	\N	\N	Подарочная корзина	Киндер Ассорти		16630	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:07:49.175224.webp	1. Kinder яйца 4 шт.\n2. KinderDelise 2 шт.\n3. Kinder Bueno 3 шт.\n4. Kinder Country 3 шт.\n5. Kinder шоколад 4 уп.\n6. Корзина\n7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:07:49.175224origin.webp
1	9	1	\N	\N	Подарочная корзина	Кофе с шоколадом	Великолепная корзина для приятного времяпровождения за чашечкой кофе и шоколадом!	21600	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763.webp	1. Коробка конфет "Ferrero rocher" - 200 гр., \r\n2. Пачка кофе (заварной) \r\n3. 5 шоколадок "Ritter Sport" (в ассортименте)  4. Шоколад "Toblerone" \r\n6. Подарочная корзина \r\n7. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0118:19:09.852763origin.webp
75	0	75	\N	\N	Подарочная корзина	Тропика с шоколадом	Отличное сочетание фруктов и и сладостей подарит отличное настроение виновнику торжества!	26350	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714.webp	1. Ананас 2. Конфеты А. Коркунов 3. Шоколадная плитка ". А. Коркунов 4. Конфеты "Ferrero Rosher" 5. Конфеты "Рафаэлло" 6. Печенье в упаковке (в ассортименте) 7. Шоколадные конфеты "Гейша" 8. Виноград 9. Апельсин 10. Корзина 11. Подарочная упаковка	https://giftcity.kz/api/v1/present/static/images/2021-11-0719:13:46.966714origin.webp
\.


--
-- Data for Name: presents_categoriess; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.presents_categoriess (id, categories, present) FROM stdin;
200	3	45
166	3	12
201	3	46
168	3	13
169	3	14
175	5	20
176	3	21
203	3	47
204	3	48
205	3	49
206	3	50
207	5	51
208	5	52
212	3	56
216	4	60
217	4	61
218	4	62
219	4	63
220	4	64
221	4	65
222	4	66
189	2	34
190	3	35
191	3	36
192	3	37
193	3	38
194	3	39
195	3	40
196	3	41
197	3	42
198	3	43
199	3	44
231	3	77
247	5	54
248	5	55
249	5	57
250	5	58
253	5	59
254	5	19
255	5	53
259	2	3
260	2	6
264	2	9
265	2	10
267	2	11
268	2	15
269	2	16
270	2	17
271	3	18
272	2	22
273	2	23
274	2	24
275	2	25
276	2	26
277	2	27
279	2	33
280	2	29
281	2	30
282	2	31
283	2	32
284	2	28
285	2	70
286	2	73
287	2	74
288	2	75
290	2	1
292	2	4
293	2	2
294	2	5
295	2	7
296	2	8
\.


--
-- Data for Name: presents_formpresents; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.presents_formpresents (id, formpresent, present) FROM stdin;
156	2	12
197	2	51
158	2	13
159	2	14
165	5	20
166	3	21
198	6	52
179	1	34
180	2	35
181	2	36
182	3	37
183	2	38
184	4	39
185	1	40
186	2	41
202	2	56
187	2	42
206	5	60
207	5	61
208	5	62
209	5	63
210	5	64
211	5	65
188	2	43
189	2	44
190	2	45
191	2	46
212	5	66
193	2	47
194	1	48
195	2	49
196	2	50
219	2	77
235	6	54
236	2	55
237	6	57
238	6	58
241	6	59
242	6	19
243	6	53
247	1	3
248	1	6
252	1	9
253	1	10
255	1	11
256	1	15
257	1	16
258	1	17
259	2	18
260	5	22
261	1	23
262	1	24
263	1	25
264	1	26
265	1	27
267	1	33
268	1	29
269	1	30
270	3	31
271	1	32
272	1	28
273	1	70
274	1	73
275	1	74
276	1	75
278	1	1
280	1	4
281	1	2
282	1	5
283	1	7
284	1	8
\.


--
-- Data for Name: presents_reasons; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.presents_reasons (id, reason, present) FROM stdin;
662	1	45
663	2	45
664	3	45
665	1	46
666	2	46
667	3	46
551	1	13
552	2	13
553	3	13
554	4	13
672	1	47
673	2	47
674	3	47
675	4	47
676	1	48
677	2	48
678	3	48
679	4	48
680	1	49
681	2	49
682	3	49
683	4	49
684	1	50
685	2	50
686	3	50
901	1	11
902	2	11
903	6	11
555	1	14
556	2	14
557	3	14
558	4	14
687	1	51
688	2	51
689	3	51
690	4	51
691	1	52
692	2	52
693	3	52
694	4	52
904	8	11
905	5	15
906	5	16
907	1	17
908	3	17
909	6	17
910	1	18
911	2	18
912	3	18
913	6	18
914	3	22
915	9	22
916	1	23
708	1	56
709	2	56
710	3	56
711	4	56
917	3	23
918	6	23
919	9	23
920	1	24
921	2	24
572	1	20
573	2	20
574	3	20
575	4	20
576	1	21
577	2	21
578	3	21
579	4	21
922	3	24
923	6	24
941	2	33
942	4	33
943	7	33
944	8	33
945	1	29
946	2	29
947	4	29
948	7	29
949	8	29
950	2	30
951	9	30
952	1	31
953	2	31
724	1	60
725	2	60
726	3	60
727	1	61
728	2	61
729	4	61
730	5	61
731	1	62
732	3	62
733	1	63
734	5	63
735	1	64
736	2	64
737	3	64
738	4	64
739	5	64
740	1	65
741	2	65
742	3	65
743	4	65
744	5	65
745	1	66
746	2	66
747	3	66
748	4	66
749	5	66
954	3	31
955	4	31
956	6	31
624	1	34
625	2	34
626	3	34
627	4	34
628	1	35
629	2	35
630	3	35
631	4	35
632	1	36
633	2	36
634	3	36
635	4	36
636	1	37
986	1	1
987	2	1
988	4	1
989	7	1
996	1	4
997	2	4
998	3	4
999	4	4
1000	6	4
1001	8	4
637	2	37
924	1	25
638	3	37
639	4	37
640	1	38
641	3	38
642	1	39
643	3	39
644	1	40
645	2	40
646	3	40
647	4	40
648	1	41
649	2	41
650	3	41
651	4	41
652	1	42
653	2	42
654	3	42
655	1	43
656	2	43
657	3	43
658	4	43
659	1	44
660	2	44
661	3	44
925	2	25
926	3	25
927	6	25
928	8	25
929	1	26
930	2	26
931	4	26
932	7	26
933	1	27
934	3	27
935	6	27
936	2	27
957	1	32
958	3	32
959	6	32
960	2	28
961	4	28
962	7	28
963	8	28
543	1	12
544	2	12
545	3	12
546	4	12
771	3	77
772	1	77
773	4	77
964	9	70
965	1	73
966	2	73
967	4	73
968	6	73
969	8	73
970	1	74
971	2	74
972	3	74
973	6	74
974	8	74
975	1	75
976	2	75
977	3	75
978	4	75
979	8	75
1002	1	2
1003	2	2
1004	3	2
1005	6	2
1006	5	5
1007	2	7
1008	6	7
1009	7	7
1010	1	8
1011	3	8
1012	6	8
1013	9	8
820	1	54
821	3	54
822	6	54
823	9	54
824	1	55
825	3	55
826	6	55
827	1	57
828	2	57
829	3	57
830	6	57
831	9	57
832	1	58
833	2	58
834	3	58
835	6	58
836	9	58
843	1	59
844	3	59
845	9	59
846	6	59
847	1	19
848	2	19
849	3	19
850	6	19
851	9	19
852	1	53
853	3	53
854	6	53
855	9	53
870	1	3
871	3	3
872	6	3
873	2	3
874	1	6
875	2	6
876	3	6
877	6	6
878	8	6
889	1	9
890	2	9
891	4	9
892	8	9
893	1	10
894	2	10
895	3	10
896	6	10
\.


--
-- Data for Name: presents_subcategoriess; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.presents_subcategoriess (id, subcategories, present) FROM stdin;
238	8	21
239	9	21
240	16	21
396	2	70
397	3	70
398	1	73
399	1	74
400	2	74
401	3	74
402	1	75
403	2	75
405	2	1
406	3	1
408	1	4
409	2	2
410	7	2
411	7	5
412	1	7
413	3	7
414	2	8
415	7	8
265	2	34
266	3	34
267	13	35
268	13	36
269	11	37
270	13	37
271	16	37
272	9	38
273	9	39
274	10	40
275	8	41
276	9	41
277	10	41
278	8	42
279	9	42
280	10	42
281	10	43
226	8	12
282	8	44
228	9	13
229	10	14
283	10	44
284	9	45
285	8	46
286	9	46
287	10	46
288	15	46
292	8	47
293	9	47
294	10	47
295	10	48
296	9	49
297	9	50
298	14	56
311	10	77
345	2	3
346	4	3
347	1	6
348	2	6
349	7	6
356	2	9
357	2	10
360	2	11
361	3	11
362	7	15
363	7	16
364	4	17
365	6	17
366	7	17
367	8	18
368	15	18
369	16	18
370	2	22
371	7	22
372	2	23
373	7	23
374	2	24
375	7	24
376	2	25
377	3	25
378	4	25
379	1	26
380	1	27
381	4	27
384	2	33
385	3	33
386	2	29
387	3	29
388	2	30
389	7	30
390	2	31
391	4	31
392	1	32
393	2	32
394	4	32
395	1	28
\.


--
-- Data for Name: presents_typepresents; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.presents_typepresents (id, typepresent, present) FROM stdin;
\.


--
-- Data for Name: reason; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.reason (id, serial_number, name_reason, icon) FROM stdin;
8	7	На новоселье	https://giftcity.kz/api/v1/present/static/images/2021-11-0716:10:39.372284.webp
3	10	На 8 Марта	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:14:20.674455.webp
4	11	Корпоративные	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:14:41.008413.webp
6	1	Для девушек	https://giftcity.kz/api/v1/present/static/images/2021-11-0716:02:45.126534.webp
7	2	Для мужчин	https://giftcity.kz/api/v1/present/static/images/2021-11-0716:06:17.661966.webp
1	3	На День Рождение	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:13:21.081606.webp
2	4	На Новый Год	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:14:02.656257.webp
9	5	Для детей	https://giftcity.kz/api/v1/present/static/images/2021-11-0716:19:42.339145.webp
5	6	Новорожденным	https://giftcity.kz/api/v1/present/static/images/2021-10-3009:17:45.020094.webp
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.stocks (id, name_stock, body_stock, image, conditions) FROM stdin;
\.


--
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.subcategories (id, name_subcategory) FROM stdin;
1	Фруктовые
2	Сладкие
3	Чайно-кофейные
4	С цветами
5	Продуктовые
6	Парфюмерные
7	Другое
8	Сборные букеты
9	Розы
10	хризантемы
11	Герберы
12	Тюльпаны
13	Пионы
14	гортензии
15	Альстромерии
16	Экзотика
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.type (id, name_type) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gleb
--

COPY public.users (id, uid_firebase, phone, email, firstname, last_name, father_name, avatar, points, "timestamp") FROM stdin;
2	uDnRYPJURiN44E3Vs5x47rLRGm83	\N	mba.kimep@gmail.com	\N	\N	\N	\N	0	2021-10-28 17:11:25.398306
4	OLzocA9VofTzEkqPqwb7badoYz72	+7 (707) 552-52-80	\N	\N	\N	\N	\N	0	2021-11-01 06:22:06.369516
5	aBWWmX6zZXSdwuzpM1D6b8XSxID2	+7 (776) 555-25-55	\N	\N	\N	\N	\N	0	2021-11-01 16:11:26.318291
6	MbpmCtVN7xYAFGYu9mtjjabEoVl1	\N	a.esendykov@gmail.com	\N	\N	\N	\N	0	2021-11-01 16:11:26.318291
1	o9CyeJxJ8RR0j5xrFFfLU8m0Q1D2	\N	glebhleb1989@gmail.com	\N	\N	\N	\N	3500	2021-10-25 20:37:47.262325
3	nUGfeG5JTRQZcosT65zGlYXA1n92	+7 (999) 184-50-15	\N	\N	\N	\N	\N	1000	2021-10-29 08:59:00.458326
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.admin_id_seq', 6, true);


--
-- Name: basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.basket_id_seq', 44, true);


--
-- Name: baskets_historybaskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.baskets_historybaskets_id_seq', 18, true);


--
-- Name: bonus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.bonus_id_seq', 3, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.categories_id_seq', 7, true);


--
-- Name: categoriess_subcategoriess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.categoriess_subcategoriess_id_seq', 16, true);


--
-- Name: coments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.coments_id_seq', 1, false);


--
-- Name: comentsservice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.comentsservice_id_seq', 6, true);


--
-- Name: counter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.counter_id_seq', 1, true);


--
-- Name: form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.form_id_seq', 7, true);


--
-- Name: history_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.history_basket_id_seq', 18, true);


--
-- Name: mailing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.mailing_id_seq', 1, true);


--
-- Name: present_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.present_id_seq', 77, true);


--
-- Name: presents_categoriess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.presents_categoriess_id_seq', 296, true);


--
-- Name: presents_formpresents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.presents_formpresents_id_seq', 284, true);


--
-- Name: presents_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.presents_reasons_id_seq', 1013, true);


--
-- Name: presents_subcategoriess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.presents_subcategoriess_id_seq', 415, true);


--
-- Name: presents_typepresents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.presents_typepresents_id_seq', 1, false);


--
-- Name: reason_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.reason_id_seq', 11, true);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.stocks_id_seq', 1, false);


--
-- Name: subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.subcategories_id_seq', 16, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.type_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gleb
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: basket basket_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT basket_pkey PRIMARY KEY (id);


--
-- Name: baskets_historybaskets baskets_historybaskets_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.baskets_historybaskets
    ADD CONSTRAINT baskets_historybaskets_pkey PRIMARY KEY (id);


--
-- Name: bonus bonus_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.bonus
    ADD CONSTRAINT bonus_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categoriess_subcategoriess categoriess_subcategoriess_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categoriess_subcategoriess
    ADD CONSTRAINT categoriess_subcategoriess_pkey PRIMARY KEY (id);


--
-- Name: coments coments_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.coments
    ADD CONSTRAINT coments_pkey PRIMARY KEY (id);


--
-- Name: comentsservice comentsservice_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.comentsservice
    ADD CONSTRAINT comentsservice_pkey PRIMARY KEY (id);


--
-- Name: counter counter_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.counter
    ADD CONSTRAINT counter_pkey PRIMARY KEY (id);


--
-- Name: form form_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.form
    ADD CONSTRAINT form_pkey PRIMARY KEY (id);


--
-- Name: history_basket history_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.history_basket
    ADD CONSTRAINT history_basket_pkey PRIMARY KEY (id);


--
-- Name: mailing mailing_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.mailing
    ADD CONSTRAINT mailing_pkey PRIMARY KEY (id);


--
-- Name: present present_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.present
    ADD CONSTRAINT present_pkey PRIMARY KEY (id);


--
-- Name: presents_categoriess presents_categoriess_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_categoriess
    ADD CONSTRAINT presents_categoriess_pkey PRIMARY KEY (id);


--
-- Name: presents_formpresents presents_formpresents_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_formpresents
    ADD CONSTRAINT presents_formpresents_pkey PRIMARY KEY (id);


--
-- Name: presents_reasons presents_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_reasons
    ADD CONSTRAINT presents_reasons_pkey PRIMARY KEY (id);


--
-- Name: presents_subcategoriess presents_subcategoriess_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_subcategoriess
    ADD CONSTRAINT presents_subcategoriess_pkey PRIMARY KEY (id);


--
-- Name: presents_typepresents presents_typepresents_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_typepresents
    ADD CONSTRAINT presents_typepresents_pkey PRIMARY KEY (id);


--
-- Name: reason reason_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.reason
    ADD CONSTRAINT reason_pkey PRIMARY KEY (id);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (id);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_present_popular_id; Type: INDEX; Schema: public; Owner: gleb
--

CREATE INDEX ix_present_popular_id ON public.present USING btree (popular, id);


--
-- Name: basket fk_basket_users_id_user; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.basket
    ADD CONSTRAINT fk_basket_users_id_user FOREIGN KEY ("user") REFERENCES public.users(id);


--
-- Name: baskets_historybaskets fk_baskets_historybaskets_basket_basket_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.baskets_historybaskets
    ADD CONSTRAINT fk_baskets_historybaskets_basket_basket_id FOREIGN KEY (basket) REFERENCES public.basket(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: baskets_historybaskets fk_baskets_historybaskets_history_basket_historybasket_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.baskets_historybaskets
    ADD CONSTRAINT fk_baskets_historybaskets_history_basket_historybasket_id FOREIGN KEY (historybasket) REFERENCES public.history_basket(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: categoriess_subcategoriess fk_categoriess_subcategoriess_categories_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categoriess_subcategoriess
    ADD CONSTRAINT fk_categoriess_subcategoriess_categories_categories_id FOREIGN KEY (categories) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: categoriess_subcategoriess fk_categoriess_subcategoriess_subcategories_subcategories_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.categoriess_subcategoriess
    ADD CONSTRAINT fk_categoriess_subcategoriess_subcategories_subcategories_id FOREIGN KEY (subcategories) REFERENCES public.subcategories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_categoriess fk_presents_categoriess_categories_categories_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_categoriess
    ADD CONSTRAINT fk_presents_categoriess_categories_categories_id FOREIGN KEY (categories) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_categoriess fk_presents_categoriess_present_present_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_categoriess
    ADD CONSTRAINT fk_presents_categoriess_present_present_id FOREIGN KEY (present) REFERENCES public.present(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_formpresents fk_presents_formpresents_form_formpresent_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_formpresents
    ADD CONSTRAINT fk_presents_formpresents_form_formpresent_id FOREIGN KEY (formpresent) REFERENCES public.form(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_formpresents fk_presents_formpresents_present_present_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_formpresents
    ADD CONSTRAINT fk_presents_formpresents_present_present_id FOREIGN KEY (present) REFERENCES public.present(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_reasons fk_presents_reasons_present_present_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_reasons
    ADD CONSTRAINT fk_presents_reasons_present_present_id FOREIGN KEY (present) REFERENCES public.present(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_reasons fk_presents_reasons_reason_reason_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_reasons
    ADD CONSTRAINT fk_presents_reasons_reason_reason_id FOREIGN KEY (reason) REFERENCES public.reason(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_subcategoriess fk_presents_subcategoriess_present_present_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_subcategoriess
    ADD CONSTRAINT fk_presents_subcategoriess_present_present_id FOREIGN KEY (present) REFERENCES public.present(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_subcategoriess fk_presents_subcategoriess_subcategories_subcategories_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_subcategoriess
    ADD CONSTRAINT fk_presents_subcategoriess_subcategories_subcategories_id FOREIGN KEY (subcategories) REFERENCES public.subcategories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_typepresents fk_presents_typepresents_present_present_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_typepresents
    ADD CONSTRAINT fk_presents_typepresents_present_present_id FOREIGN KEY (present) REFERENCES public.present(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: presents_typepresents fk_presents_typepresents_type_typepresent_id; Type: FK CONSTRAINT; Schema: public; Owner: gleb
--

ALTER TABLE ONLY public.presents_typepresents
    ADD CONSTRAINT fk_presents_typepresents_type_typepresent_id FOREIGN KEY (typepresent) REFERENCES public.type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

