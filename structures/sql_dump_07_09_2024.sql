--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-07 01:38:08

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
-- TOC entry 222 (class 1259 OID 16502)
-- Name: odpoved; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odpoved (
    odpoved_id integer NOT NULL,
    text text,
    otazka_id integer
);


ALTER TABLE public.odpoved OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16501)
-- Name: odpoved_odpoved_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.odpoved_odpoved_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.odpoved_odpoved_id_seq OWNER TO postgres;

--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 221
-- Name: odpoved_odpoved_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.odpoved_odpoved_id_seq OWNED BY public.odpoved.odpoved_id;


--
-- TOC entry 216 (class 1259 OID 16465)
-- Name: okruh; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.okruh (
    okruh_id integer NOT NULL,
    nazev text,
    popis text
);


ALTER TABLE public.okruh OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16464)
-- Name: okruh_okruh_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.okruh_okruh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.okruh_okruh_id_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 215
-- Name: okruh_okruh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.okruh_okruh_id_seq OWNED BY public.okruh.okruh_id;


--
-- TOC entry 220 (class 1259 OID 16488)
-- Name: otazka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.otazka (
    otazka_id integer NOT NULL,
    text text,
    predmet_id integer
);


ALTER TABLE public.otazka OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16487)
-- Name: otazka_otazka_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.otazka_otazka_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otazka_otazka_id_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 219
-- Name: otazka_otazka_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.otazka_otazka_id_seq OWNED BY public.otazka.otazka_id;


--
-- TOC entry 218 (class 1259 OID 16474)
-- Name: predmet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predmet (
    predmet_id integer NOT NULL,
    nazev text,
    popis text,
    okruh_id integer,
    img text
);


ALTER TABLE public.predmet OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16473)
-- Name: predmet_predmet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predmet_predmet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.predmet_predmet_id_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 217
-- Name: predmet_predmet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predmet_predmet_id_seq OWNED BY public.predmet.predmet_id;


--
-- TOC entry 4706 (class 2604 OID 16505)
-- Name: odpoved odpoved_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odpoved ALTER COLUMN odpoved_id SET DEFAULT nextval('public.odpoved_odpoved_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16468)
-- Name: okruh okruh_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.okruh ALTER COLUMN okruh_id SET DEFAULT nextval('public.okruh_okruh_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16491)
-- Name: otazka otazka_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otazka ALTER COLUMN otazka_id SET DEFAULT nextval('public.otazka_otazka_id_seq'::regclass);


--
-- TOC entry 4704 (class 2604 OID 16477)
-- Name: predmet predmet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predmet ALTER COLUMN predmet_id SET DEFAULT nextval('public.predmet_predmet_id_seq'::regclass);


--
-- TOC entry 4868 (class 0 OID 16502)
-- Dependencies: 222
-- Data for Name: odpoved; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.odpoved (odpoved_id, text, otazka_id) FROM stdin;
\.


--
-- TOC entry 4862 (class 0 OID 16465)
-- Dependencies: 216
-- Data for Name: okruh; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.okruh (okruh_id, nazev, popis) FROM stdin;
1	Oblast 1	Algoritmy a struktury dat
2	Oblast 2	Software Engineering
3	Oblast 3	Grafika a virtualizace
\.


--
-- TOC entry 4866 (class 0 OID 16488)
-- Dependencies: 220
-- Data for Name: otazka; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.otazka (otazka_id, text, predmet_id) FROM stdin;
12	Algoritmy řazení výběrem (Select-sort)	1
13	Algoritmy řazení vkládáním (Insert-sort)	1
14	Algoritmy řazení zaměňováním (Bubble-sort)	1
15	Algoritmy řazení haldou (Heap-sort)	1
16	Algoritmy řazení přihrádkové (Radix-sort, Bucket-sort)	1
17	Algoritmy řazení slučováním (Merge-sort)	1
18	Algoritmy řazení dělením (Quick-sort)	1
19	Minimální, průměrná a maximální asymptotická operační složitost algoritmů řazení	1
20	Adresní metody vyhledávání (přímý přístup, otevřené a zřetězené rozptylování)	1
21	Asociativní metody vyhledávání (sekvenční, binárním půlením, binární vyhledávací stromy)	1
22	Operační a paměťová složitost algoritmů vyhledávání. Datové typy zásobník, fronta, prioritní fronta, pole, tabulka, seznam, množina - jejich specifikace a implementace.	1
23	Množiny (intuitivní definice, podmnožiny, operace s množinami a jejich vlastnosti, mohutnost množin).	2
24	Relace (definice, inverzní relace, relace na množině a jejich vlastnosti, ekvivalence, uspořádání).	2
25	Zobrazení (definice, vlastnosti).	2
26	Výroková logika (výrok, logické spojky, formule a pravdivostní ohodnocení, tautologie a kontradikce, de Morganovy zákony, negace formulí, sémantický důsledek, CNF/DNF).	2
27	Predikátová logika (rozdíly oproti výrokové logice, syntaxe a sémantika, interpretace, sémantický důsledek).	2
28	Neorientované grafy (definice a základní pojmy, isomorfismus, stupeň uzlu, sledy v grafu, souvislost grafu, stromy a kostry).	2
29	Orientované grafy (definice a základní pojmy, sledy v orientovaném grafu, silná souvislost, stupně uzlu).	2
30	Vlastnosti grafů (pokrytí, Eulerův graf, vzdálenost na grafu).	2
31	Kořenové stromy (definice, hloubka, pravidelné a binární stromy).	2
32	Reprezentace grafů v paměti (matice incidence, matice sousednosti, spojová reprezentace).	2
33	Základní grafové algoritmy (prohledávání do šířky a do hloubky, určení minimální kostry, Huffmanův kód, Dijkstrův algoritmus).	2
34	Synchronizace procesů (důvody synchronizace, postupový prostor, synchronizační metody jako producent a konzument, čtenáři a písař, vzájemné vyloučení).	3
35	Chyby v synchronizaci (uváznutí, stárnutí).	3
36	Synchronizační prostředky (semafory, zasílání zpráv).	3
37	Přidělování procesoru (jednotlivé stavy přidělování procesoru, funkce modulu přidělování procesoru, způsoby přidělování v multiprogramovém systému).	3
38	Přidělování paměti (adresování paměti, funkce modulu přidělování paměti, stránkování na žádost).	3
39	Systém souborů (úkoly, úrovně, charakteristika souborových systémů FAT32, NTFS, EXT2 - výhody, práva, použití, způsob ukládání souborů).	3
40	Chomského hierarchie, teorie formálních jazyků a gramatik, návaznost na teorii automatů (konečné automaty, zásobníkové automaty, Turingův stroj).	4
41	Bezkontextové jazyky a jejich modely (zásobníkové automaty, bezkontextové gramatiky).	4
42	Struktura překladače a charakteristika fází překladu (lexikální analýza, deterministická syntaktická analýza a generování kódu).	4
43	Algoritmus, program, proces. Překladač, interpret, preprocesor.	5
44	Reprezentace dat v paměti počítače, základní datové typy, proměnné, konstanty, přetypování.	5
45	Operátory a jejich priorita, výrazy. Základní příkazy. Řízení běhu programu - řídicí struktury.	5
46	Datový typ ukazatel. Funkce a procedury, návratový typ, formální a skutečné parametry, parametry volané hodnotou a referencí.	5
47	Rozklad problému na podproblémy, procedurální přístup, rekurze. Jednorozměrná a vícerozměrná pole. Řetězce.	5
48	Standardní vstup a výstup, funkce vstupu/výstupu, práce se soubory. Binární a textové soubory.	5
49	Strukturované datové typy. Dynamické datové struktury. Modulární programování, hlavičkové soubory.	5
50	Úvod do informační bezpečnosti, legislativa a normy. Kryptografie. Proudové šifry, blokové šifry.	6
51	Hashovací funkce a datová integrita. Symetrické šifrování. Asymetrické šifrovaní, výměna klíčů. Digitální podpisy, identifikace a autentizace entity.	6
52	Certifikáty a certifikační autority. Komerční/kvalifikované certifikáty, časová razítka. Viry – historie a současnost. Antivirové programy.	6
53	Chyby v programech, revize kódu, testování bezpečnosti.	6
54	Principy objektově orientovaného programování (encapsulace, dědičnost, polymorfismus).	7
55	Třídy a objekty, atributy a metody, modifikátory přístupu.	7
56	Udělování přístupových práv, konstruktor a destruktor.	7
57	Přetěžování operátorů a metod, dědičnost (jednoduchá a vícenásobná).	7
58	Abstraktní třídy a rozhraní, polymorfismus a jeho aplikace.	7
59	Životní cyklus softwaru, metodiky vývoje softwaru.	8
60	Modely vývoje softwaru (vodopádový model, iterativní model, modely agilního vývoje).	8
61	Specifikace a analýza požadavků, návrh softwaru, implementace a testování.	8
62	Řízení projektů a dokumentace, řízení změn, řízení kvality.	8
63	Nástroje a techniky pro řízení projektů, metody plánování a sledování projektů.	8
64	Plánování projektů (části a fáze, návrh plánu, harmonogram).	9
65	Řízení projektů (sledování a kontrola projektů, řízení rizik, správa zdrojů).	9
66	Nástroje pro řízení projektů (Ganttovy diagramy, kritická cesta, analýza rizik).	9
67	Agilní metodiky (Scrum, Kanban).	9
68	Řízení změn a verzování v projektech.	9
69	HTML5 (základní struktura, elementy, atributy).	10
70	CSS (selektory, vlastnosti, layouty, responzivní design).	10
71	JavaScript (základní syntax, DOM manipulace, události).	10
72	Webové API (fetch, AJAX, JSON).	10
73	Webové standardy a přístupnost.	10
74	Úvod do databázových systémů, typy databází (relační, objektové, NoSQL).	11
75	Modelování databází (ER diagramy, normalizace, denormalizace).	11
76	SQL (dotazy, agregace, podmínky, spojení tabulek).	11
77	Transakce v databázových systémech, řízení konkurence a zotavení.	11
78	Databázové indexy, optimalizace dotazů.	11
79	Základní pojmy počítačových sítí (topologie, protokoly, model OSI).	12
80	IP adresování a subnetting.	12
81	Internetové protokoly (TCP/IP, UDP).	12
82	Bezdrátové sítě a standardy (Wi-Fi, Bluetooth).	12
83	Síťová bezpečnost a šifrování.	12
84	Návrh databázového systému (analýza požadavků, návrh databázového schématu, implementace).	13
85	Optimalizace výkonu databázových systémů.	13
86	Zálohování a obnova databází.	13
87	Pokročilé funkce SQL (podmínková agregace, procedury, funkce).	13
88	Principy návrhu uživatelského rozhraní (intuitivnost, použitelnost, zpětná vazba).	14
89	Nástroje a technologie pro návrh UI (wireframes, prototypy).	14
90	Testování uživatelského rozhraní (metody a techniky).	14
91	Zásady designu interakcí a vizuálního designu.	14
92	Základy počítačové grafiky (renderování, vektorová vs. rastrová grafika).	15
93	Virtuální realita (VR, AR, použití a aplikace).	15
94	Algoritmy grafického zpracování (ray tracing, rasterizace).	15
95	Grafické knihovny a nástroje (OpenGL, Vulkan).	15
96	Úvod do podnikových informačních systémů (ERP, CRM, SCM).	16
97	Implementace a přizpůsobení podnikových systémů.	16
98	Analýza a optimalizace podnikových procesů.	16
99	Trend v oblasti podnikových informačních systémů.	16
100	Moderní webové technologie (HTML5, CSS3, JavaScript).	17
101	Vývoj webových aplikací (frontend vs. backend, MVC architektura).	17
102	Webové frameworky (React, Angular, Vue).	17
103	Bezpečnost webových aplikací (XSS, CSRF).	17
\.


--
-- TOC entry 4864 (class 0 OID 16474)
-- Dependencies: 218
-- Data for Name: predmet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predmet (predmet_id, nazev, popis, okruh_id, img) FROM stdin;
1	Datové struktury a algoritmy	Algoritmy řazení, asymptotická složitost, vyhledávání, zásobník, fronta, seznamy.	1	/predmety_ico/dsa.png
3	Operační systémy	Synchronizace procesů, přidělování procesoru a paměti, souborové systémy.	1	/predmety_ico/ops.png
4	Programovací jazyky a překladače	Interpretace a kompilace, lexikální a syntaktická analýza, generování kódu.	1	/predmety_ico/pjp.png
5	Základy strukturované programování	Algoritmy a jejich zápis, strukturované programování.	1	/predmety_ico/zsp.png
7	Objektově orientované programování	Třídy, objekty, dědičnost, polymorfismus.	2	/predmety_ico/oop.png
9	Řízení softwarových projektů	Modely řízení projektů, agilní metodiky, plánování a rozpočet.	2	/predmety_ico/rsp.png
6	Bezpečnost a ochrana dat	Základy kryptografie, bezpečnostní politika, správa bezpečnosti.	2	/predmety_ico/xbod.png
8	Softwarové inženýrství	Vývoj softwaru, životní cyklus, návrhové vzory, testování.	2	/predmety_ico/xswi.png
10	Tvorba internetových stránek	HTML, CSS, JavaScript, základní frameworky.	2	/predmety_ico/tis.png
11	Úvod do databázových systémů	Relační model, SQL, návrh databází.	2	/predmety_ico/db1.png
12	Úvod do počítačových sítí	Protokoly TCP/IP, model OSI, směrování a přepínání.	2	/predmety_ico/ps1.png
13	Návrh a implementace databázových systémů	Pokročilé techniky SQL, indexování, optimalizace dotazů.	3	/predmety_ico/nidb.png
14	Návrh uživatelských rozhraní	Principy UX, návrh uživatelských rozhraní, prototypování.	3	/predmety_ico/nur.png
15	Počítačová grafika a virtuální realita	Renderování, 3D grafika, virtuální realita, herní enginy.	3	/predmety_ico/pgvr.png
16	Podnikové informační systémy	ERP systémy, CRM, správa podnikových zdrojů.	3	/predmety_ico/pis.png
17	Webové technologie	HTML5, CSS3, JavaScript, moderní webové frameworky.	3	/predmety_ico/wt.png
2	Diskrétní struktury	Množiny, relace, grafy, stromy, matice, prohledávání grafů.	1	/predmety_ico/ds.png
\.


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 221
-- Name: odpoved_odpoved_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odpoved_odpoved_id_seq', 1, false);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 215
-- Name: okruh_okruh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.okruh_okruh_id_seq', 3, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 219
-- Name: otazka_otazka_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.otazka_otazka_id_seq', 103, true);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 217
-- Name: predmet_predmet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predmet_predmet_id_seq', 17, true);


--
-- TOC entry 4714 (class 2606 OID 16509)
-- Name: odpoved odpoved_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odpoved
    ADD CONSTRAINT odpoved_pkey PRIMARY KEY (odpoved_id);


--
-- TOC entry 4708 (class 2606 OID 16472)
-- Name: okruh okruh_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.okruh
    ADD CONSTRAINT okruh_pkey PRIMARY KEY (okruh_id);


--
-- TOC entry 4712 (class 2606 OID 16495)
-- Name: otazka otazka_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otazka
    ADD CONSTRAINT otazka_pkey PRIMARY KEY (otazka_id);


--
-- TOC entry 4710 (class 2606 OID 16481)
-- Name: predmet predmet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predmet
    ADD CONSTRAINT predmet_pkey PRIMARY KEY (predmet_id);


--
-- TOC entry 4717 (class 2606 OID 16510)
-- Name: odpoved odpoved_otazka_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odpoved
    ADD CONSTRAINT odpoved_otazka_id_fkey FOREIGN KEY (otazka_id) REFERENCES public.otazka(otazka_id);


--
-- TOC entry 4716 (class 2606 OID 16496)
-- Name: otazka otazka_predmet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.otazka
    ADD CONSTRAINT otazka_predmet_id_fkey FOREIGN KEY (predmet_id) REFERENCES public.predmet(predmet_id);


--
-- TOC entry 4715 (class 2606 OID 16482)
-- Name: predmet predmet_okruh_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predmet
    ADD CONSTRAINT predmet_okruh_id_fkey FOREIGN KEY (okruh_id) REFERENCES public.okruh(okruh_id);


--
-- TOC entry 4874 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE odpoved; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.odpoved TO statnice;


--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE okruh; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.okruh TO statnice;


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE otazka; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.otazka TO statnice;


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE predmet; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.predmet TO statnice;


-- Completed on 2024-09-07 01:38:08

--
-- PostgreSQL database dump complete
--

