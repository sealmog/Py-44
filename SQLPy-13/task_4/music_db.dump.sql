--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
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
-- Name: albumauthors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albumauthors (
    id integer NOT NULL,
    author_id integer NOT NULL,
    album_id integer NOT NULL
);


ALTER TABLE public.albumauthors OWNER TO postgres;

--
-- Name: albumauthors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albumauthors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albumauthors_id_seq OWNER TO postgres;

--
-- Name: albumauthors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albumauthors_id_seq OWNED BY public.albumauthors.id;


--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    album_id integer NOT NULL,
    album character varying(42) NOT NULL,
    album_year integer NOT NULL,
    CONSTRAINT albums_album_year_check CHECK (((album_year > 1100) AND (album_year < 2100)))
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_album_id_seq OWNER TO postgres;

--
-- Name: albums_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_album_id_seq OWNED BY public.albums.album_id;


--
-- Name: authorgenres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorgenres (
    id integer NOT NULL,
    genre_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.authorgenres OWNER TO postgres;

--
-- Name: authorgenres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authorgenres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorgenres_id_seq OWNER TO postgres;

--
-- Name: authorgenres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authorgenres_id_seq OWNED BY public.authorgenres.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    author character varying(42) NOT NULL,
    alias character varying(42)
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- Name: authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_author_id_seq OWNER TO postgres;

--
-- Name: authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_author_id_seq OWNED BY public.authors.author_id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collections (
    collection_id integer NOT NULL,
    collection character varying(42) NOT NULL,
    album_year integer NOT NULL,
    CONSTRAINT collections_album_year_check CHECK (((album_year > 1100) AND (album_year < 2100)))
);


ALTER TABLE public.collections OWNER TO postgres;

--
-- Name: collections_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collections_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_collection_id_seq OWNER TO postgres;

--
-- Name: collections_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collections_collection_id_seq OWNED BY public.collections.collection_id;


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_id integer NOT NULL,
    genre character varying(42) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_genre_id_seq OWNER TO postgres;

--
-- Name: genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_genre_id_seq OWNED BY public.genre.genre_id;


--
-- Name: trackcollections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trackcollections (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    track_id integer NOT NULL
);


ALTER TABLE public.trackcollections OWNER TO postgres;

--
-- Name: trackcollections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trackcollections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackcollections_id_seq OWNER TO postgres;

--
-- Name: trackcollections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trackcollections_id_seq OWNED BY public.trackcollections.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    track_id integer NOT NULL,
    track character varying(42) NOT NULL,
    album_id integer NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- Name: tracks_track_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_track_id_seq OWNER TO postgres;

--
-- Name: tracks_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_track_id_seq OWNED BY public.tracks.track_id;


--
-- Name: albumauthors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumauthors ALTER COLUMN id SET DEFAULT nextval('public.albumauthors_id_seq'::regclass);


--
-- Name: albums album_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN album_id SET DEFAULT nextval('public.albums_album_id_seq'::regclass);


--
-- Name: authorgenres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorgenres ALTER COLUMN id SET DEFAULT nextval('public.authorgenres_id_seq'::regclass);


--
-- Name: authors author_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN author_id SET DEFAULT nextval('public.authors_author_id_seq'::regclass);


--
-- Name: collections collection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections ALTER COLUMN collection_id SET DEFAULT nextval('public.collections_collection_id_seq'::regclass);


--
-- Name: genre genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre ALTER COLUMN genre_id SET DEFAULT nextval('public.genre_genre_id_seq'::regclass);


--
-- Name: trackcollections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackcollections ALTER COLUMN id SET DEFAULT nextval('public.trackcollections_id_seq'::regclass);


--
-- Name: tracks track_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN track_id SET DEFAULT nextval('public.tracks_track_id_seq'::regclass);


--
-- Data for Name: albumauthors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albumauthors (id, author_id, album_id) FROM stdin;
0	0	0
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	11
12	12	12
13	13	13
14	14	14
15	15	15
16	16	16
17	17	17
18	18	18
19	19	19
20	20	20
21	21	21
22	22	22
23	23	23
24	24	24
25	25	25
26	26	26
27	27	27
28	28	28
29	29	29
30	30	30
31	31	31
32	32	32
33	33	33
34	34	34
35	35	35
36	36	36
37	37	37
38	38	38
39	39	39
40	40	40
41	41	41
42	42	42
43	43	43
44	44	44
45	45	45
46	46	46
47	47	47
48	48	48
49	49	49
50	50	50
51	51	51
52	52	52
53	53	53
54	54	54
55	55	55
56	56	56
57	57	57
58	58	58
59	59	59
60	60	60
61	61	61
62	62	62
63	63	63
64	64	64
65	65	65
66	66	66
67	67	67
68	68	68
69	69	69
70	70	70
71	71	71
72	72	72
73	73	73
74	74	74
75	75	75
76	76	76
77	77	77
78	78	78
79	79	79
80	80	80
81	81	81
82	82	82
83	83	83
84	84	84
85	85	85
86	86	86
87	87	87
88	88	88
89	89	89
90	90	90
91	91	91
92	92	92
93	93	93
94	94	94
95	95	95
96	96	96
97	97	97
98	98	98
99	99	99
\.


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.albums (album_id, album, album_year) FROM stdin;
0	Pray Hope kill At	2008
1	Najdi Life Inside My Chrysler	2012
2	Heat	2017
3	Seafood	2008
4	Catch me Asleep	2006
5	Yue Lover Shy	2017
6	Dark Red Bertie	2013
7	They Were	2010
8	Ultra Rare	2004
9	Jollar Nervous Good Messy	2014
10	Summer	2011
11	New Face Ill Car Effect Out	2012
12	Are You My Beer Music Four	2012
13	Muddy Direful Public Relations Specialist 	2018
14	Arabic Embarrassed Dangerous Audi	2016
15	Healthy Public Relations Specialist Kicked	2000
16	Amer La France	2018
17	Besquez Factory Of Love	2009
18	Lovers Honored Of Love Polish	2010
19	Matteo Love Andrea Love	2014
20	Huge Estar Shock Week Reforge	2009
21	Magic	2004
22	Needy	2016
23	Girl Ford Matter Hope Spread	2006
24	Fade Relax	2000
25	Mix Porcupine	2014
26	Fire Engineer Jewel	2010
27	Former Lovers Not my They Were Support	2010
28	In Your Eyes Squirrels Search	2017
29	Complete Loves Ultra-Maximus Catadiottro T	2008
30	Zebra Architect	2014
31	Arabic	2003
32	Sister	2004
33	Vauxhall Boy	2009
34	La Moglie Of TOP Is Soprattutto	2018
35	Hysterical Believe	2007
36	Financial Spider Fish Environmental Spain	2001
37	Balance Educator I think Global	2013
38	Standard Like is as Lover	2014
39	Califiornia Bless Additional They Were	2012
40	Song Weird Saudi Than First	2008
41	United	2017
42	Sweet Old Uzbekistan Cat	2001
43	Arm	2015
44	Psychological	2009
45	House RULEZ	2016
46	Trick	2014
47	Informal Hope Elk Discovery	2018
48	Girls Full of Secretary Beer Behind the	2004
49	Lover Make It Suspicious Llama	2006
50	Singapore Make It My Pakistan Joy	2005
51	Too Much Catadiottro Explain Expelli Armus	2010
52	Human Weak Cashier Critical	2013
53	Scarce Of Love	2014
54	Dont Talk to Jinyu Moves Embarrassed	2017
55	Zinc Capybara Upset Moccasin Dark Turquois	2015
56	In the Sky Catch me Loves	2019
57	Pahari	2013
58	Bear Anxious Hope Raccoon	2014
59	Magical Wand Of Galaxy Dog	2007
60	Be My Ocaml TOP	2006
61	Architect Excalibur	2006
62	Talented Lexus Hysterical Obviously Odd	2001
63	Asleep	2014
64	Foreign Immediate Explain	2010
65	Yesterday kill Tomorrow	2005
66	Im Toe Dominator	2015
67	South Levantine Goblin Honor The Streets S	2006
68	Rich Zinc	2011
69	Steer No Way	2005
70	Rock n Roll Hear Financial Shame	2013
71	Give me Dongfeng Conscious  Toyota	2007
72	Algeria Annoying Of Lover Wooden	2017
73	General Youre Gonna Unfair	2016
74	Pleasant Butter Remarkable	2007
75	Size Chef	2010
76	Sheet Boring Thunder Like Spaghetti Alliga	2016
77	Overflow	2012
78	Loves You are my Sweet Psychedelic	2014
79	Successfully Inner Mongolian	2017
80	Toad Waterbuck Typical Recent First to	2017
81	Hands Unlikely Country Towering	2005
82	Brash Lincoln	2004
83	Enemy Calamity Jane	2003
84	Legs Paramedic	2014
85	Call Me Carina Please	2019
86	Loves The Next to Morbido	2011
87	Morbido Luxembourg They	2015
88	Respiratory Therapist Alexander Platz MINI	2016
89	Does Popular	2005
90	Secretary Of Love Fox Potwari	2014
91	Automatic	2016
92	Hot	2008
93	Willing Eland Powerful	2007
94	Asleep Kia Hills	2009
95	Georgia The Malay Permit	2012
96	Dont Forget the	2001
97	Guttural	2006
98	Sick Bertie Said	2005
99	Speed	2001
\.


--
-- Data for Name: authorgenres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorgenres (id, genre_id, author_id) FROM stdin;
0	1	0
1	2	1
2	1	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	7	8
9	6	9
10	9	10
11	6	11
12	11	12
13	13	13
14	10	14
15	14	15
16	15	16
17	9	17
18	10	18
19	5	19
20	16	20
21	10	21
22	5	22
23	21	23
24	5	24
25	5	25
26	14	26
27	22	27
28	15	28
29	23	29
30	24	30
31	5	31
32	4	32
33	25	33
34	26	34
35	5	35
36	10	36
37	10	37
38	22	38
39	10	39
40	11	40
41	2	41
42	4	42
43	27	43
44	11	44
45	17	45
46	14	46
47	8	47
48	12	48
49	29	49
50	22	50
51	10	51
52	6	52
53	0	53
54	30	54
55	14	55
56	24	56
57	9	57
58	31	58
59	6	59
60	25	60
61	17	61
62	32	62
63	22	63
64	17	64
65	5	65
66	7	66
67	30	67
68	29	68
69	33	69
70	33	70
71	14	71
72	34	72
73	22	73
74	7	74
75	11	75
76	29	76
77	10	77
78	28	78
79	2	79
80	21	80
81	14	81
82	5	82
83	11	83
84	4	84
85	16	85
86	14	86
87	26	87
88	5	88
89	28	89
90	10	90
91	25	91
92	7	92
93	23	93
94	2	94
95	7	95
96	22	96
97	21	97
98	19	98
99	35	99
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, author, alias) FROM stdin;
0	Bianco Ibureno Chloride	Sacha Cameron
1	Persian responsible	Cole E. Joseph
2	Asleep lonely Big Morgan	Sonia U. Jensen
3	Paint of Heart Lorazepam	Xanthus Wyatt
4	Global The Africa Times	Guinevere L. Fitzpatrick
5	Actos Evelyn Fluoxetine	Bell G. Riggs
6	Propionate Recent	Mannix Z. Burton
7	Swedish Jayda Developer Farmer	Chancellor F. Dudley
8	Italy Developer Lisinopril	Xavier V. Rush
9	Saudi Pakistan Eastern	Blythe Eaton
10	F.A.I.R.Y.	Maxwell Wright
11	Search Malay	Stone Downs
12	Accommodation X Haslava	Imani E. Morgan
13	Car tapir	Eaton F. Fischer
14	Immediate Shame	Rhona I. Knapp
15	Turkey	Jordan G. Duffy
16	Guilty	Kirby Whitley
17	Bangladesh Vicuna Lanzala	Devin K. Terrell
18	The Wales Strippers Merlottimg	Cain Deleon
19	Tartarugose	Finn F. Bass
20	Miss	Dora Short
21	Krista	Caryn P. Burch
22	Pure Teenage Crazy White Spoons	Nell Decker
23	Urdu	Philip W. Caldwell
24	Sounds authoritative Fade	Melyssa P. Owen
25	Levothyroxine Cheesburger Prednisone	Pamela J. Justice
26	Namenda Prednisone	Beck W. Cooper
27	Wine	Yuri N. Moon
28	Celebrex Indonesia	Ralph Booth
29	Pig Latin support Succinatex Giselle	Orla X. Coffey
30	Hook Algeria Responsible	Kaitlin Riddle
31	Sexual Complete obvious	Reece P. Ellison
32	Besylate Kierra	Jaden Hart
33	Simvastatin show Star Trek Cymbalta	Wesley Glover
34	Tramadol Kelsie	Cathleen Morris
35	Pakistan	Ira Charles
36	Hook Sapper Soprano	Cheyenne Morton
37	Gutierretha Mix bless	Kato Y. Ball
38	Simvastatin Iyana shame	Rinah Workman
39	Shock	Madison Daniels
40	Shy Ameer	Edan Lott
41	E.N.T. Believe strict	Scarlett S. French
42	Hungry 56	Kylan Melendez
43	Champ At the Fit Mattie detailed	Garrison Williamson
44	Obviously Melayu	Cole Tanner
45	Izabelle lucky Confident Diskus	Odette Rich
46	Woodcauldron Wooger Uzbek Reagan	Wyoming U. Schneider
47	Dolls South Levantine Connect Mulan	Rafael Q. Guzman
48	Environmental Question Fiume	Tyrone Moody
49	Lipitor Viagra Trazodone	Brynne Sanford
50	Shame price Hebrew	Melanie N. Frederick
51	Mongolia civil Devan recent	Henry N. Bates
52	Arabic high	Wylie Chavez
53	Angel of the Grubby Cats	Mikayla Chen
54	Merperson Harmwashington	Carson R. Fry
55	Stick	Meghan V. Jacobson
56	Known alive Frasier Frazier	Amena O. Shepard
57	Abuse Farzaneha Farzaneha T.	Hu G. Haney
58	TeeAyWhyElOhAre	Jin P. Mendez
59	Pure	Halla Bright
60	Search	Leroy Vincent
61	Sulfamethoxazole	Mollie E. Francis
62	Ferret Computer Hardware	Paloma Sutton
63	Oliviene	Chantale Carver
64	Harylor	Seth Kelly
65	Impressive Pakistan Uzbekistan	Uriah K. Lucas
66	Incredible	Baxter Mcmahon
67	Miranda Genovelfo healthy	Lavinia Z. Cash
68	Klingon Sodium	Wesley Bowen
69	Electronic II price	Dillon D. Landry
70	Connect	Rhea D. Bernard
71	Territory School Psychologist	Ashely Whitehead
72	Pleasant Bosnia and Herzegovina	Damon Guerrero
73	Dolls Tartarugose	Sybill Cline
74	Kylie practical Witch the Wizard	Troy Brooks
75	Fertullat	Victoria Curtis
76	Dark Turquoise	Quon N. Mcneil
77	Mathematician Inif	Michelle Vasquez
78	Handihaler Moroccan Issac	Tanek Park
79	Oxycodone	Brady Oneill
80	Mongolia Kassandra overflow	Tyler H. Cantrell
81	Color Reasonable unable	Zephania V. Fuentes
82	Tayarris	Vernon Walker
83	Wipe Morgan Divera	Dorothy R. Higgins
84	Zolartrate permit Popular	Quintessa J. Dominguez
85	Tanya	Dora Y. Briggs
86	Chemist	Ferris Woodward
87	Support	Angela Hodge
88	Sootie McJosh	Glenna Dejesus
89	Medical	Mohammad W. Blevins
90	Llama	Claire Gates
91	The C Word	William V. Yang
92	Hungry visible Lia Eli	Odessa Cote
93	Healthy Kassandra	Kellie Jarvis
94	Lisinopril Pro Air	Oliver R. Long
95	Morgan Mathematician	Oscar O. Blankenship
96	Doland Caylee	Shellie Wise
97	Tots-Kaczynski Marva-D	Raya Turner
98	Carr-grr	Leigh Emerson
99	Stereotyped	Basia Albert
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.collections (collection_id, collection, album_year) FROM stdin;
0	The Lot	2020
1	Ultimate Rock Gaming	2015
2	Alternative Beats	2016
3	All New Rock	2016
4	70s Rock Anthems	2020
5	memories	2015
6	Hard Rock	2018
7	00s Pop Rock	2015
8	Soft Rock	2016
9	70s Soft Rock	2019
10	pulp	2015
11	Legendary	2016
12	Rock Save the Queen	2020
13	New Noise	2018
14	Blues & Roots Rock	2018
15	Deep Dive: 00s Rock	2017
16	Rock Covers	2016
17	Power Pop	2017
18	Math Rock	2016
19	00s Soft Rock	2017
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_id, genre) FROM stdin;
0	Heavy Metal
1	Western
2	Unplugged
3	Live
4	Techno
5	Indie
6	Black Metal
7	Rap
8	Death Metal
9	Latino
10	Pop
11	Rock
12	Metal
13	Progressive
14	Pop-Rock
15	Retro
16	Compilation
17	Deep House
18	Boy Band
19	Folk
20	J-Rock
21	Punk
22	Dance
23	Electro-Pop
24	Jazz
25	Gospel
26	K-Pop
27	Brit-Pop
28	Blues
29	Holy Metal
30	Parody
31	Indietronica
32	Hard Rock
33	Country
34	Trap
35	Lounge
36	Alternative
37	Ambient
\.


--
-- Data for Name: trackcollections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trackcollections (id, collection_id, track_id) FROM stdin;
0	0	195
1	0	834
2	0	178
3	0	428
4	0	85
5	0	849
6	0	674
7	0	835
8	0	827
9	0	194
10	0	251
11	0	967
12	0	93
13	0	404
14	0	612
15	0	726
16	1	372
17	1	664
18	1	213
19	1	137
20	1	199
21	1	197
22	1	195
23	1	216
24	1	377
25	1	874
26	1	407
27	1	378
28	1	419
29	1	190
30	1	99
31	1	431
32	1	962
33	1	345
34	1	421
35	2	864
36	2	504
37	2	464
38	2	138
39	2	908
40	2	280
41	2	694
42	2	927
43	2	894
44	2	166
45	2	712
46	2	867
47	2	520
48	2	553
49	2	842
50	2	951
51	2	809
52	2	614
53	3	68
54	3	445
55	3	730
56	3	803
57	3	303
58	3	350
59	3	318
60	3	434
61	3	928
62	3	993
63	3	757
64	3	767
65	3	675
66	3	11
67	3	551
68	3	932
69	4	827
70	4	796
71	4	918
72	4	36
73	4	19
74	4	901
75	4	849
76	4	404
77	4	900
78	4	887
79	4	707
80	4	262
81	4	746
82	4	93
83	4	47
84	4	962
85	4	709
86	4	759
87	4	911
88	4	406
89	4	858
90	4	382
91	4	902
92	5	32
93	5	192
94	5	622
95	5	518
96	5	38
97	5	716
98	5	717
99	5	972
100	5	50
101	5	238
102	5	498
103	5	672
104	5	429
105	5	922
106	5	620
107	5	826
108	5	597
109	5	629
110	5	28
111	5	221
112	5	903
113	5	459
114	5	123
115	5	21
116	6	843
117	6	530
118	6	11
119	6	968
120	6	932
121	6	685
122	6	403
123	6	564
124	6	750
125	6	383
126	6	673
127	6	658
128	6	626
129	6	894
130	6	666
131	7	194
132	7	533
133	7	512
134	7	570
135	7	897
136	7	32
137	7	240
138	7	898
139	7	35
140	7	369
141	7	585
142	7	742
143	7	571
144	7	302
145	7	186
146	7	262
147	8	450
148	8	215
149	8	134
150	8	878
151	8	82
152	8	530
153	8	992
154	8	875
155	8	836
156	8	380
157	8	560
158	8	221
159	8	552
160	8	214
161	8	299
162	8	369
163	8	439
164	8	412
165	9	673
166	9	475
167	9	327
168	9	895
169	9	631
170	9	673
171	9	196
172	9	880
173	9	447
174	9	852
175	9	979
176	9	881
177	9	758
178	9	943
179	9	495
180	9	640
181	9	559
182	9	996
183	9	368
184	9	443
185	9	2
186	9	895
187	9	993
188	9	536
189	10	203
190	10	510
191	10	984
192	10	429
193	10	176
194	10	634
195	10	561
196	10	62
197	10	525
198	10	477
199	10	450
200	10	850
201	10	877
202	10	181
203	10	506
204	10	52
205	10	892
206	10	163
207	10	159
208	10	247
209	10	646
210	10	304
211	10	207
212	11	187
213	11	58
214	11	895
215	11	624
216	11	395
217	11	999
218	11	444
219	11	924
220	11	101
221	11	725
222	11	728
223	11	944
224	11	727
225	11	368
226	11	950
227	11	598
228	11	340
229	11	185
230	11	420
231	11	717
232	11	62
233	11	401
234	11	423
235	11	644
236	11	398
237	12	901
238	12	548
239	12	768
240	12	14
241	12	344
242	12	485
243	12	61
244	12	680
245	12	879
246	12	766
247	12	826
248	12	728
249	12	711
250	12	893
251	12	161
252	12	307
253	12	316
254	12	660
255	12	224
256	12	652
257	12	366
258	12	342
259	12	262
260	13	408
261	13	589
262	13	210
263	13	46
264	13	655
265	13	149
266	13	781
267	13	880
268	13	897
269	13	514
270	13	984
271	13	713
272	13	41
273	13	477
274	13	811
275	13	156
276	13	278
277	13	803
278	14	199
279	14	431
280	14	945
281	14	592
282	14	867
283	14	125
284	14	623
285	14	635
286	14	23
287	14	14
288	14	537
289	14	70
290	14	86
291	14	897
292	14	18
293	14	239
294	14	385
295	14	499
296	14	869
297	14	304
298	14	364
299	14	5
300	14	164
301	14	378
302	15	342
303	15	296
304	15	633
305	15	256
306	15	41
307	15	142
308	15	574
309	15	852
310	15	209
311	15	577
312	15	951
313	15	711
314	15	829
315	15	924
316	15	485
317	16	421
318	16	790
319	16	760
320	16	390
321	16	759
322	16	39
323	16	932
324	16	663
325	16	665
326	16	973
327	16	756
328	16	461
329	16	600
330	16	84
331	16	349
332	16	400
333	16	84
334	16	214
335	16	866
336	16	107
337	16	294
338	17	468
339	17	786
340	17	602
341	17	86
342	17	987
343	17	737
344	17	979
345	17	783
346	17	525
347	17	578
348	17	829
349	17	627
350	17	853
351	17	697
352	17	207
353	17	434
354	17	936
355	17	647
356	17	210
357	18	195
358	18	661
359	18	183
360	18	131
361	18	377
362	18	918
363	18	404
364	18	452
365	18	726
366	18	872
367	18	673
368	18	450
369	18	772
370	18	749
371	18	194
372	18	521
373	18	120
374	18	601
375	19	459
376	19	186
377	19	545
378	19	43
379	19	10
380	19	133
381	19	702
382	19	442
383	19	778
384	19	325
385	19	788
386	19	887
387	19	521
388	19	340
389	19	904
390	19	346
\.


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tracks (track_id, track, album_id, duration) FROM stdin;
0	Mercury: Retrograde	0	124539
1	Pathology	0	224427
2	Symbiote	0	98821
3	ProductOfDrugs (Prod. The Virus and Antido	0	123661
4	Venom	0	123298
5	Gatteka	0	112511
6	kamikaze (+ pulse)	0	77584
7	T.R.U. (Totally Rotten Underground)	0	127524
8	I Put My Dick in Your Mental	0	140326
9	Andromeda	0	121979
10	BRAINFOOD	1	101172
11	Troll Under the Bridge	1	115775
12	1000 Rounds	1	163371
13	Sacrifice	1	96062
14	Backpack	1	135079
15	D(R)Own	1	107999
16	Okay,ButThisIsTheLastTime	1	123054
17	TakingOutTheTrash	1	192833
18	Io sono qui	1	180880
19	Paris	1	111020
20	Murder	2	186261
21	High N Mighty	2	124676
22	Euronymous	2	153685
23	Hades	2	127128
24	Nails	2	134447
25	Squeeze	2	140038
26	No Teeth	2	155350
27	Bang Ya Fucking Head	2	154929
28	BLUE JUICE	2	137221
29	Loch Ness	2	175543
30	Hold Uh	3	168202
31	Bone Saw	3	136650
32	Coffin Wave	3	132193
33	OhNo!	3	159974
34	TheArtOfCremation	3	195875
35	OakGroveRoad	3	107750
36	WhatWasThat	3	143833
37	FunnyToSeeYouHere	3	114500
38	John Dee	3	166910
39	Kybalion	3	131350
40	Killer	4	122211
41	608	4	197053
42	Eternal Dreams	4	110000
43	Nightmare Choir (I Been Asleep Too Long)	4	134844
44	Exodus	4	126224
45	Vengeance	4	132702
46	Claustrophobia	4	90645
47	Rearranged	4	86805
48	Paralax	4	176901
49	Exsanguination	4	98482
50	Mutiny	5	117447
51	Centipede	5	128888
52	Грустная сука	5	199664
53	This World Is Sick	5	112000
54	Пламя	5	234000
55	2:45	5	125048
56	who is he	5	183536
57	Sleeping	5	125500
58	Timeless	5	156048
59	Pound for Pound	5	175203
60	Finger Trembling	6	153104
61	Overload	6	166426
62	Kill Yourself (Part III)	6	145078
63	2nd Hand	6	123481
64	Antarctica	6	126850
65	Memoirs Of A Gorilla	6	122000
66	Runnin Thru The 7th With My Woadies	6	205766
67	Mount Sinai	6	145636
68	FUCKTHEPOPULATION	6	150187
69	Magazine	6	131500
70	2 Hot 4 U (feat. $Uicdeboy$)	7	199100
71	O Pana!	7	128418
72	LTE	7	133747
73	Champion Of Death	7	116000
74	Seppuku (feat. Suicideboy$ & Jgrxxn)	7	183937
75	Youre Now Tuning Into 66.6 FM With DJ Rap	7	133903
76	Slip On A Banana Clip	7	137195
77	A Death In The Ocean Would Be Beautiful	7	118236
78	Shattered Amethyst	7	126874
79	Goosebumps	7	112500
80	Venom	8	134271
81	Bury Me	8	281538
82	Hack Slash	8	92308
83	2000 Rounds	8	122483
84	Sea Sick	8	166452
85	Grain	8	149804
86	Beware, the Sirens	8	141972
87	Kali Yuga	8	140613
88	Hexada	8	135822
89	Caligula	8	148939
90	Niagara (feat. Lil Peep)	9	142232
91	Scrying Through Shattered Glass	9	197077
92	Polaris	9	219749
93	Rapture	9	131590
94	Blackmage	9	236301
95	Tartarus	9	137822
96	Until the Light Takes Us	9	184733
97	As Above so Look out Below	9	149230
98	Swan	9	207442
99	Sneak Diss (feat. So6ix)	9	187260
100	Plague Doctor Mask	10	166798
101	Some of Us May Never See the World	10	145451
102	Filth	10	111491
103	Homecoming	10	272562
104	Blood	10	76042
105	Sweat	10	136777
106	Tears	10	138266
107	Anabolic	10	107050
108	HDMI	10	139375
109	Dirt	10	140187
110	Oxygen	11	142000
111	Branches	11	123167
112	CtrlAltDelete	11	178167
113	BlastZone (ЗонаПоражения)	11	106250
114	CharacterSelect (ВыборПерсонажа)	11	140750
115	RestInPeace (Prod. by The Virus And Antido	11	128261
116	BlackMold	11	123500
117	Toxin	11	144735
118	Electric	11	67030
119	Cranium	11	115383
120	Friday	12	151667
121	Hooky	12	152137
122	Kalaxian Crystals	12	175386
123	Slurp	12	125048
124	BROKE ft. Prohibeo	12	184189
125	Lies	12	164807
126	Terry McGinnis	12	133068
127	Gremlin	12	150831
128	Giant Squit	12	218201
129	You Are Not Like Us	12	100807
130	Arachnids	13	159242
131	Give Ah Fuck	13	92918
132	Death Wish	13	110793
133	Allergies	13	144018
134	Cut Throat	13	138240
135	Memoirs of a Gorilla	13	122182
136	Benz Truck (гелик)	13	159987
137	Norf Norf	13	183159
138	Dat $tick	13	126768
139	RAF (feat. A$AP Rocky, Playboi Carti, Quav	13	255413
140	Crazy	14	237101
141	Still Cold / Pathway Private	14	271404
142	The Chills	14	151629
143	Slip on a Banana Clip	14	137195
144	Lights	14	182647
145	Akina Speed Star	14	150100
146	Big Fish	14	198133
147	The Bodies Fall Just Like the Leaves	14	144812
148	Story: No Title	14	168883
149	P.S Fuck You Cunt (feat. Lil Peep)	14	197143
150	Torch	15	173479
151	Buff Squad (feat. Pouya, Shakewell & Germ)	15	175465
152	Sarcophagus III (feat. $Uicideboy$)	15	171782
153	Virginia Tech	15	145568
154	Lte	15	133748
155	Fuckthepopulation	15	150205
156	Gloss of Blood	15	104230
157	100K	15	203960
158	Dark Light	15	206472
159	But Wait, Theres More (feat. $uicideBoy$)	15	128000
160	Great Influence	16	203294
161	It Dont Matter	16	130638
162	absolute in doubt	16	227027
163	Boss	16	106021
164	Look at Me Now	16	150000
165	Bulletproof	16	128109
166	Contraband	16	227115
167	Deira City Centre	16	196827
168	Kyoto	16	270000
169	Pull Out Game	16	110769
170	Bird Is The Word	17	238853
171	Life Is Short	17	140657
172	Here We Go Again	17	168490
173	Bloodshed	17	201399
174	Wassup Bro!	17	137107
175	ACT 2 - BirthOfTheSpaceGod	17	151690
176	Grey Tee	17	115862
177	Sleeping Bag	17	123000
178	Afterlife	17	162000
179	King Cobra (Drippin)	17	120059
180	Heart Attack	18	193567
181	Chain$Aw	18	212245
182	King, Scar.	18	220656
183	P.T.S.D	18	307905
184	Brand New	18	136500
185	Jukai	18	297273
186	Philosophers Throne	18	180454
187	PRBLMS	18	246773
188	Back At It	18	152999
189	Fuck a Hoe (feat. $Uicideboy$)	18	191897
190	Broken	19	126380
191	3 Xans	19	114495
192	LoyaltyRunsDeepInDaLongRun	19	89234
193	Skywalker	19	161493
194	White Wine	19	155693
195	Smoke Break	19	211331
196	Louis V	19	233932
197	Fuck A Swisher	19	135361
198	RampartRange	19	98655
199	Floor 555	19	93447
200	Plug Walk	20	175230
201	Haunt U	20	100260
202	Buttcheeks	20	187681
203	Back off Me	20	134795
204	Intro.Desolation	20	101983
205	The Singularity	20	137231
206	D(R)Ead	20	162261
207	Trench Coat	20	162614
208	Ive Seen Satan, He Has Dreadlocks	20	107822
209	Your Desire	20	150017
210	Byberry	21	92690
211	Benadrylled	21	152000
212	Dream Journal	21	300831
213	Hannah Baker	21	195713
214	20k	21	178182
215	Whatever	21	159468
216	Nightstalker	21	144960
217	Headfuck	21	114177
218	sleep at night	21	161178
219	Pulling Teeth	21	202286
220	AI	22	174587
221	Lazaretto	22	113333
222	coordinate	22	226397
223	Rocket Ship	22	116847
224	Trap (feat. Lil Baby)	22	184782
225	Drip Too Hard (Lil Baby & Gunna)	22	145543
226	Snow Globe (feat. NAV) - Remix	22	237240
227	1000	22	120000
228	Henny	22	163149
229	Droptop in the Rain (feat. Tory Lanez)	22	180867
230	Flexin	23	216008
231	HOOD	23	182959
232	For My Bros	23	243050
233	Dope Game	23	219429
234	Every Season	23	214376
235	LOST (feat. Kid Cudi)	23	278760
236	SPEEDBOAT	23	222533
237	No Heart	23	235040
238	Secure The Bag	23	238425
239	STARGAZING	23	270715
240	Blue Faces	24	169640
241	Codeine Crazy	24	346907
242	Who Shot Johnny?	24	165869
243	Rari (feat. Future)	24	125513
244	Days	24	155727
245	Ridin Strikers	24	225348
246	Mask Off (feat. Kendrick Lamar) - Remix	24	258427
247	Swimming Pools (Drank)	24	247800
248	Lies About You (feat. Lil Durk)	24	175686
249	Day for Day	24	168312
250	Neptun	25	148577
251	MiAMi (feat. Gunna)	25	244470
252	Swervin (feat. 6ix9ine)	25	189487
253	12	25	195200
254	Hardly	25	157720
255	Savage	25	137760
256	SIRENS | Z1RENZ [FEAT. J.I.D | J.1.D]	25	236107
257	Glock In My Lap	25	193591
258	Richard Millie Plain	25	200135
259	I Get the Bag (feat. Migos)	25	233087
260	Thought It Was a Drought	26	265213
261	ULT	26	247055
262	Love Sosa	26	246213
263	F&N	26	189428
264	Remember Me	26	144000
265	Murder On My Mind	26	268434
266	Tunnel Vision	26	268187
267	Ready (feat. Gunna)	26	213287
268	Life Goes On	26	247055
269	CLOUT COBAIN | CLOUT CO13A1N	26	231333
270	Respect the Game	27	192099
271	beibs in the trap	27	213863
272	Underdog (Lil Baby & Gunna)	27	211853
273	Crushed Up	27	149949
274	Dance For Me (feat. NAV)	27	325853
275	Slidin	27	185037
276	DIRTY DIANA	27	129827
277	Chicken Soup	27	192692
278	Risky	27	168008
279	break da law	27	177748
280	Gook	28	166624
281	Pure Cocaine	28	154024
282	Real in My Veins (feat. T-Shyne)	28	250373
283	Nolia (feat. Kevin Gates)	28	202105
284	ONCE UPON A TIME (FREESTYLE)	28	150819
285	PEN	28	201146
286	What You Want	28	121519
287	Analog Keys	28	168227
288	Purple Baguettes	28	168493
289	Demons and Angels (feat. Juice WRLD)	28	214593
290	Slow Motion	29	186667
291	Dem Callin (feat. Ramriddlz)	29	247615
292	RIP Luv	29	214192
293	Story: No Title	29	168883
294	Hurtin	29	163653
295	monster	29	233040
296	Nightmare	29	147987
297	Elimination	29	154560
298	Mob Ties	29	205147
299	Gucci Snake	29	174107
300	Thats a Rack	30	236571
301	BUSHY B INTERLUDE	30	65640
302	Off White VLONE (Lil Baby & Gunna feat. Li	30	187465
303	Derek Fisher (feat. Lil Baby)	30	189443
304	Know Me	30	155493
305	Lift Off	30	173620
306	Who Hurt You	30	162693
307	Many Men	30	201856
308	Molly	30	204444
309	CASH COW	30	222027
310	out for the night - part 2	31	235232
311	Messy	31	156587
312	Mad	31	123533
313	No Opp Left Behind	31	194214
314	Red Beam	31	127072
315	Zits	31	131040
316	Rockstar Chainz	31	181040
317	Designer Talk	31	196731
318	%% (feat. Lucki, Deezy)	31	169081
319	Red Bottoms	31	161004
320	I Dont Care	32	130873
321	Fall	32	202480
322	TaleOfAGhost (Prod. The Virus and Antidote	32	126003
323	Franch	32	124897
324	Glitch	32	144482
325	Hounds	32	141790
326	Antisocial	32	141932
327	Death Metal	32	164533
328	Las Ovejas Mueren	32	109920
329	2 Weeks Later	32	177470
330	dread	33	201200
331	Dirty Teenz	33	97515
332	Ill Be Back	33	162978
333	LOCKED UP	33	192913
334	Heavensent	33	204410
335	Beneath	33	247731
336	IWonderWhoTookMyPlaceThisTime (Feat. Corps	33	237016
337	OVER	33	110040
338	Laps	33	144380
339	Closure	33	200647
340	Psycho Pass	34	135340
341	Aahhyeahh	34	185491
342	Red Bottom Sky	34	303413
343	We up (feat. Bones)	34	143583
344	Yoshi City	34	225080
345	On My Way Out	34	330947
346	Dead to Me	34	192000
347	Polo Socks	34	137270
348	Uppercuts	34	180000
349	Will He	34	202103
350	YEAH RIGHT	35	174358
351	If 6 Was 9	35	154410
352	Sometimes I Tell Myself Im Fine	35	158000
353	Mrs.	35	158983
354	Slave	35	140320
355	A$AP Forever REMIX (feat. Moby, T.I. & Kid	35	315773
356	Philophobia	35	198181
357	Frown	35	106797
358	stagelights	35	197558
359	Trust Me	35	150214
360	past life	36	162156
361	Forever In My Mind	36	165322
362	Whyd You Have to Go	36	189952
363	Safety Nets	36	187051
364	satellites	36	187805
365	18	36	254508
366	2002 / Asia Interlude	36	131291
367	Thotiana	36	137232
368	im so sick of this	36	234736
369	Save That Shit	36	231547
370	Everything	37	159034
371	Bodybag (Feat. cold hart)	37	283404
372	Love is Just a Lie	37	192135
373	Angels	37	134831
374	LIBERATE MY SOUL AS I REGAIN MY SANITY.	37	152000
375	Love Never Blossoms	37	107886
376	Love Dies Fast	37	179352
377	demons in my orbit	37	174785
378	White Lies+++	37	164350
379	wash away	37	161236
380	Inner Peace	38	145519
381	Bunch of Bones	38	162764
382	Fading	38	125798
383	life is just a cycle	38	146601
384	Hopeless	38	122958
385	ghostboy.	38	192561
386	Scared for You	38	162083
387	Bupropion	38	243042
388	whatever it takes	38	217182
389	Foul	38	156013
390	Did You Remember?	39	150023
391	The Renegade Never Dies	39	157971
392	Aint Hard to Find Me	39	137716
393	Flesh	39	79271
394	The Way Life Goes (feat. Oh Wonder)	39	221747
395	Feel	39	195371
396	Down	39	140267
397	F.T.W.	39	122954
398	Off the Wall	39	130294
399	Almost There	39	131954
400	COLD	40	111961
401	FLEX ON FLEX OFF	40	113137
402	BASTARD	40	101713
403	SAD PARTY	40	121657
404	Make It Through Fall	40	230678
405	Wonky	40	206786
406	If You Want to Take My Life	40	155844
407	Listen If You Hate Someone	40	120000
408	Room 604	40	136000
409	Tell Me About It	40	192000
410	Oh Darling	41	144000
411	Violence	41	159504
412	Catastrophe	41	207853
413	Anti-Grav	41	193341
414	Numb	41	126252
415	December	41	176000
416	Mysteryman 2	41	209927
417	Feelings	41	150896
418	Smile	41	164878
419	We Dont Speak Anymore	41	154215
420	Defeated	42	162353
421	Bad Habits	42	184137
422	Scars	42	117499
423	Midnight Thoughts	42	124891
424	Blow My Phone Up	42	133407
425	No Teeth	42	155350
426	Soul Collector	42	131805
427	Holy Ghost	42	127091
428	Neverless	42	201606
429	01000111 00110010 01000111 00101110	42	78367
430	It Kept People Away	43	66717
431	iPHoNe X (DiD THiS ShiT WHiLe I WaS SicK)	43	145899
432	Like a Lullaby	43	174602
433	Its Not Love	43	198667
434	Lockdown	43	251078
435	WhyDoesNothingseemToLast?	43	185808
436	The Feeling Of Loneliness Never Goes Away 	43	181951
437	Grippin	43	156048
438	00101111 01001101 01001001 01000001	43	144065
439	Legends Never Die	43	134468
440	01000100 01010000 01010011 00101011	44	150047
441	I Think Its Time That I Emerge	44	172173
442	Infiltrate	44	246909
443	Ink Spills Words	44	236852
444	SAVE HER!	44	58131
445	Ten (天)	44	133866
446	id rather make music than fuck bitches	44	135947
447	Selfish Love	44	156003
448	BAD KID	44	142222
449	Glock In My Benz	44	201721
450	Fashion Killa	45	236280
451	Breakfast With the Moon	45	163109
452	Blue Waves	45	179077
453	Death Bed	45	173333
454	I Cant Sleep	45	152500
455	Scars on My Heart	45	224000
456	Sorry I Never Apologized	45	282307
457	Canal St. (feat. Bones)	45	227427
458	American Dream	45	140974
459	Flash Bang	45	145625
460	Do You Want to Taste the Blade	46	192960
461	Ignorance II	46	145655
462	HATE ME	46	138018
463	Stayawayfromme	46	127531
464	Manny	46	151385
465	Forget It	46	193772
466	Walk on Me	46	151875
467	My Mistake	46	154667
468	Give You Up	46	243721
469	Lite Brite	46	209797
470	Breathe	47	152293
471	Closing My Eyes	47	118596
472	OUTSIDE	47	98360
473	Coke in the Bathroom	47	163417
474	bad mood, bad year	47	235050
475	Gemini	47	170824
476	Madman	47	141166
477	Voodoo Walk	47	153893
478	Foreign Banz	47	154286
479	Slave To Perfection	47	160253
480	Luvmeansdeath	48	156526
481	Us Ft. Lil Peep & Lil Tracy	48	145633
482	Bones	48	160013
483	CRUSHIN (feat. Travis Barker)	48	197547
484	I Hope You Know I Mean It	48	153913
485	Overflow	48	274159
486	Different	48	204656
487	World Falls Apart	48	201250
488	Make It Through Fall	48	230678
489	Gerard Way	48	179815
490	K.	49	229081
491	Into the Trees	49	174545
492	Waste of Time	49	116000
493	enough	49	248803
494	NIGHTRIDER	49	355213
495	Dark Out ft. AzN (prod. Drago)	49	180016
496	Last Night in LA	49	181864
497	In My Feelings	49	185940
498	Stay Alive (feat. Fat Nick)	49	132702
499	Het	49	169241
500	LEAVE	50	154687
501	Can We Wait Here	50	204278
502	Autumn Collection	50	188676
503	Life is Beautiful	50	207587
504	Houdini	50	235907
505	Valentine Kid	50	224404
506	Problems	50	209213
507	AngelDust	50	190694
508	Reflection	50	129730
509	Used to	50	168016
510	For the Last Time	51	156081
511	This Again	51	270322
512	Stupid	51	186197
513	Han Solo	51	110811
514	Everything Will Be Fine, I Promise	51	125231
515	Ballgag	51	165169
516	See Me Trying	51	128004
517	Glisten	51	105927
518	Headphones	51	223412
519	Face It	51	240000
520	Who? (feat. Shiloh Dynasty)	52	157071
521	Wingriddenangel	52	166733
522	Skin	52	132764
523	Gnarly Bastard	52	73664
524	Sippinteainyohood	52	174455
525	Teeth (Interlude)	52	142795
526	FUCKKKK! (FUCKISUP)	52	98952
527	Name in the Sand	52	168751
528	Labyrinth	52	148000
529	Your Bullets Wont Do Shit	52	124840
530	MyHeart,ItHurts (feat. Chsr)	53	144048
531	Silencethefeelings	53	126159
532	Hopes Up (feat. Dashboard Confessional)	53	253560
533	Everything Sucks	53	111613
534	Kiss	53	250267
535	Mobile Suit Fang	53	170349
536	Amaterasu	53	143255
537	Runaway	53	122787
538	Xanny Bars 222	53	159007
539	Every Day	53	184249
540	Heart	54	144274
541	Siren Sounds	54	106107
542	Whitley	54	96000
543	Renegade IV	54	96618
544	Renegade V	54	237087
545	Growth Stunt	54	111469
546	If I Miss You	54	175357
547	Fuck the World	54	108087
548	Handlebars	54	130000
549	Lizard Teeth 2	54	156665
550	jurassic	55	166957
551	Shiver	55	92000
552	Second Chances Arent for Everyone Huh?	55	128067
553	EverythingJustHurts	55	190038
554	Seven Deadly Sins	55	132187
555	Super Fun Time	55	101647
556	Bad Blood 2	55	312000
557	MADONNA (Feat. Kamiyada+)	55	163016
558	Youre A Lick	55	155457
559	GreyGods (feat. $Uicideboy$)	55	192750
560	GOSHA	56	120000
561	Spas12	56	142979
562	Window Pane (feat. Kel Killuminati & Izzo 	56	187011
563	Scarlet King - prod. by The Virus And Anti	56	151589
564	Insomniac	56	129370
565	INSIDIOUS II	56	192787
566	MEAN MUGG	56	130920
567	IWillNeverChange	56	180857
568	IKnowImNotAHero	56	277363
569	NoSleepRemix	56	191519
570	DriftWood	57	103404
571	Mg42	57	121774
572	Ump45	57	146726
573	Tar21	57	129347
574	Sk8 Head	57	151107
575	My Flaws Burn Through My Skin Like Demonic	57	167680
576	My Scars Are Like Evidence Being Mailed To	57	122723
577	I Will Celebrate For Stepping On Broken Gl	57	138240
578	Reach	57	204069
579	Killer	57	130978
580	Devil Speaks	58	154567
581	Obsidian	58	179069
582	Take Me Away	58	130915
583	Death from Above	58	141244
584	Twiy	58	154829
585	Stick Out	58	135732
586	Florida Thang	58	165818
587	Need-a-Hit	58	95452
588	Fbgm	58	129571
589	Bag of Dope	58	191060
590	BLOODY SHOES	59	136581
591	WET EM UP	59	145455
592	BUSSDOWN	59	175984
593	SHAMELESS	59	137600
594	Rocks	59	137000
595	Bodybag	59	129672
596	Void	59	230501
597	CUTTHROAT SMILE	59	188000
598	Evil Fantasy	59	114129
599	Killin on Demand	59	129202
600	Light Yagami	60	136620
601	Sleep Above the Moon	60	156000
602	Static	60	100286
603	Super Massive Attack	60	279351
604	More Than Ever	60	182586
605	ANXIOUS	60	116145
606	World Without You	60	106696
607	Amends	60	194043
608	DRUNK IN LOVE	60	173558
609	REHAB	60	141457
610	Old No. 7 - Feat. G-Eazy	61	223948
611	Smoke	61	164232
612	Icecold	61	192012
613	You Were Never a Threat	61	126933
614	Dying Doesnt Sound So Bad	61	112127
615	Welcome to Hell Pussy	61	72196
616	33rd Blakk Glass	61	150267
617	Aw Shit - Zillakami Solo	61	120000
618	Nuka Cola	61	168040
619	Ricky Bobby Six Speed	61	112000
620	Bladed Choppa	62	173846
621	Loser 00	62	157000
622	Waste It	62	182079
623	VENGEANCE | VENGEANCE [FEAT. JPEGMAFIA & Z	62	240213
624	SHINNERS13	62	102587
625	Arson	62	160427
626	Another Day	62	235807
627	Heat Death	62	276000
628	Stressed	62	198898
629	Case 19 (feat. 6ix9ine)	62	124033
630	TheRoadLessTraveled	63	146333
631	Want Em Dead	63	131840
632	Please Forgive (feat. Denzel Curry, IDK, Z	63	192347
633	Musty	63	161558
634	Come Outside	63	126176
635	Down n Out	63	120210
636	REBELLION	63	208231
637	I Wander, But Im Not Lost	63	200348
638	Dangerous	63	118417
639	Pearl Harbor	63	178338
640	Fuck Forgivness	64	128394
641	Far Cry	64	154000
642	???????	64	63746
643	Fell in Love	64	99041
644	DiscoveryChannel	64	309995
645	HOLD UR TONGUE	64	150805
646	company	64	163448
647	No Witnesses	64	165041
648	Red Dot	64	147120
649	Talk Shit	64	184372
650	Gas Only	65	139728
651	Licc Hoe$	65	187272
652	Hired Gun	65	104024
653	But This Is the End	65	157153
654	Try My Best	65	156000
655	Entourage	65	184929
656	Someday	65	182293
657	2doses	65	117750
658	Demons	65	192034
659	Pick Me Up	65	192938
660	Detox	66	205404
661	Butane & Heroin	66	290755
662	Dirty Pistola 2	66	104022
663	When It Rains	66	215968
664	Moves	66	191998
665	Yellow Pills	66	155719
666	The Two of Us Are Dying	66	129332
667	Im Trying	66	204755
668	Nightmare	66	120016
669	Cemetery Dreams	66	178487
670	Watch It All Burn	67	132208
671	2029	67	123509
672	Mosh Pit	67	116962
673	Someone Protects Her (Prod. By Falls)	67	142500
674	Trust	67	142785
675	Glitter	67	136364
676	AMYS GRAVE	67	158333
677	Ran Thru The Trap	67	115125
678	Save My Life	67	210732
679	Between the Devil and the Darkness	67	144238
680	No Control	68	206367
681	Make Me Forget	68	187246
682	SEPHIROTH	68	150022
683	jealous traits	68	176182
684	No One Knows You	68	116190
685	Hollow	68	185455
686	Powerpuff	68	144033
687	Baby Faced Bandit	68	102708
688	Cut Myself	68	71915
689	Dead and Cold	68	89652
690	I Hate That...	69	181132
691	Devil Side	69	187089
692	lose	69	116236
693	Numb	69	227260
694	Killing Spree	69	132441
695	Funeral Service	69	183207
696	Monday Mourning	69	120000
697	PuttingMyBestFootForward	69	141500
698	Lonely	69	194565
699	Spirited_Away	69	149980
700	Fall	70	202450
701	If I Had It All	70	195375
702	IMA Murk Your Sister	70	127615
703	Landmines	70	97500
704	Hero	70	131200
705	Jus Breathe	70	108389
706	Xoxo	70	121330
707	More	70	164702
708	Waka Flocka Aint Got Shit on Me	70	116817
709	Diamonds	70	169050
710	Blood	71	195926
711	Baby Do You Hate Me	71	157714
712	Hell and Back	71	141611
713	Losing Sight	71	188781
714	No Faith	71	150862
715	Suburban Trapstar	71	151440
716	Fuk Do U Want	71	192026
717	I Aint in the Mood	71	168135
718	Doesithurttoloveme?	71	182080
719	Red Rose	71	142238
720	Drippin	72	176901
721	Girls on Mars	72	217067
722	Guerrilla-Warfare	72	153255
723	So Far so Good	72	82980
724	I Watched Her Leave	72	176588
725	Eyes So Low	72	194470
726	crash my whip	72	118667
727	You.Wont.Do.Shit	72	145582
728	Black Fingernails	72	184268
729	thats alright	72	181495
730	Worth It	73	172138
731	Way That I Live	73	156176
732	Miss Me	73	132750
733	room to breathe	73	174243
734	Im on One	73	149476
735	Stars in the Sky	73	224855
736	Erosion	73	155880
737	Tightrope	73	168649
738	CoverGirl	73	153913
739	Asthma	73	181734
740	BURN	74	206649
741	Morrissey	74	187000
742	Sadboy	74	176000
743	Light Leaking Through	74	234684
744	Laying in the Dirt	74	160000
745	When I Die Will You Miss Me	74	131188
746	Tonight	74	204187
747	Safe Star	74	133851
748	Wasted	74	123578
749	Boozo	74	165702
750	Mortis Kombat	75	106469
751	NITROUS	75	150000
752	JÆGER (feat. Okaminokami)	75	151578
753	Issues	75	117375
754	Myself	75	110002
755	Leave You Behind	75	192679
756	When I Dream I See Her Ghost	75	160543
757	Burnt Diary	75	179461
758	Chopstixxx	75	99204
759	Rise from the Ashes	75	118240
760	You Made Me sO Happy	76	165957
761	Repeat	76	249863
762	Out of This World	76	108800
763	Waterguns	76	156513
764	Mia Khalifa	76	207151
765	What?	76	225843
766	HOP	76	105561
767	LayYourAssDown	76	90712
768	Rabbit Hole	76	232574
769	Cigarettes	76	160040
770	Missed Calls - Remix	77	161981
771	pink lemonade	77	144000
772	Im Not Coming Home	77	220541
773	Water $uicide	77	153652
774	Joan of Arc	77	145161
775	Tears of Blood	77	128052
776	Cry While Were Laughing	77	217362
777	Hurtboy$	77	190198
778	hammer	77	204000
779	take away the pain	77	156427
780	Murdock	78	108481
781	Drop Dead	78	144091
782	Surveillance	78	118909
783	3am	78	149625
784	No Flippies	78	141557
785	Fuck ALL the Pain	78	117809
786	So Low	78	218024
787	Loser	78	203605
788	I	78	157851
789	Realize	78	130504
790	Dead Inside.	79	176000
791	Sleep Paralysis	79	207097
792	these days	79	179201
793	Perfect	79	219867
794	BEACHBOY!	79	137240
795	Jarhead	79	169506
796	A W O L	79	182927
797	work ethic from pain	79	185171
798	CRYING(INTHERAIN)	79	173648
799	Bittersweet	79	175503
800	See Things	80	200000
801	Hot Air Balloon	80	159060
802	M I A	80	156000
803	Waste My Time	80	151742
804	NECKLACE	80	182520
805	PATNAH DEM	80	114000
806	Gone	80	151273
807	Make You Cry	80	150448
808	What	80	165466
809	1 0 W O O D $	80	156003
810	TOKYO RAIN	81	163014
811	Burn Out	81	220108
812	she was my virginity cømplex	81	213187
813	PTSD	81	132344
814	Slither	81	157309
815	Lost	81	153779
816	Hey Legend!	81	188985
817	Dont Blink	81	101937
818	100 Styles	81	160052
819	Put That On My Set (feat. A$AP Rocky & Ske	81	201080
820	Hate Me	82	183876
821	stfu	82	129925
822	For X and Peep	82	170447
823	MIA	82	133600
824	vacanter	82	149333
825	Dont Vanish	82	117447
826	Things Never Got Better (feat. Kevin Abstr	82	218835
827	Sucks Without U	82	234545
828	Im Not Okay	82	164598
829	Cyanide	82	133494
830	50	83	144024
831	Through the Motions	83	190302
832	No More (Unfair)	83	154501
833	Dont Enter, Pt. 3	83	195140
834	Run Away	83	138914
835	Miss Me	83	239903
836	Rip Peep	83	163240
837	Low Tide	83	177661
838	Sacrifice </3	83	140643
839	Rich & Sad	83	116697
840	Auto Pistol	84	144016
841	Fuoh	84	154227
842	Drills in the Hills	84	142502
843	Bout That Life	84	159138
844	ruiner	84	184333
845	Fell In Luv (feat. Bryson Tiller)	84	206333
846	rejecter	84	248547
847	DIEMONDS	84	192168
848	Low Key	84	122331
849	To Have And Have Not	84	123376
850	Rotten And Paralyzed In A Tropical Paradis	85	151580
851	Tough Luck	85	204750
852	So Gone	85	144196
853	Stuck	85	152606
854	Messy	85	160602
855	used to it	85	158178
856	Dead Angels	85	85210
857	Focus	85	190070
858	8 Days	85	129587
859	Unbothered Freestyle	85	107068
860	Seventy Four	86	117923
861	Room 921	86	144639
862	행복	86	144000
863	2 Radical Diss	86	145084
864	Mobbkage	86	103875
865	Tears	86	125375
866	Talk	86	117468
867	Just One Thing	86	229800
868	Liquid Sunshine	86	142811
869	HOT STEPPA	86	169293
870	BITTER (Feat. ZOTiYAC)	87	226087
871	Killer Butterfly	87	199001
872	Mask On	87	133969
873	Crowsfeet	87	186985
874	1punch	87	210340
875	CHECK IN - Remastered	87	157978
876	When Im Gone	87	155495
877	Baked Fried Beans	87	131333
878	Dejection	87	138057
879	Gloss Of Blood	87	104211
880	Audubon	88	134974
881	Meet Mr. NICEGUY	88	146477
882	122 Days	88	184324
883	Killing 2 Birds With 22 Stones ($UICIDEBOY	88	143259
884	10,000 Degrees	88	189109
885	King Tulip	88	185218
886	Carrollton	88	203897
887	MyTimeIsTooGreatToBeWasted	88	168889
888	Its Been a Long Time Since You Said That 	88	226415
889	Perc30	88	132000
890	CRT	89	196117
891	Lost My Mind	89	201279
892	RED Rust	89	197854
893	Crash	89	176571
894	Emergency	89	169000
895	Pull the Trigger	89	146004
896	Fall Off	89	129149
897	Crash My Whip	89	168000
898	I Can’t Stand It	89	141600
899	Love Scars	89	204536
900	Frostbite	90	192774
901	Zombie	90	146250
902	Sleepy	90	222903
903	Go Out	90	120202
904	Venvm	90	165339
905	Https://murder. Com	90	65411
906	Dark Light	90	166844
907	BUMBLE BEE	90	154947
908	Burn	90	220604
909	SNOW	90	170856
910	Hourglass	91	143000
911	melatonin	91	154201
912	Couldve Been Worse	91	176274
913	$UICIDEWAVE	91	232046
914	Daze	91	120000
915	Moment	91	142734
916	Dangerous	91	198404
917	Traumatic	91	203636
918	Daiquiris & Dreams	91	173373
919	Carmine	91	146625
920	Where The Fuck Is God 2	92	154549
921	Why Cant Nothing Seem To Ever Go Right?	92	148608
922	Lathargic	92	154044
923	Dry Run	92	105535
924	Neves	92	87536
925	Out	92	112039
926	Fuck Niggas	92	109600
927	Life Dont Last Freestyle	92	130335
928	LEFT 4 DEAD	92	157037
929	Crow Life, Rotten World	92	142683
930	Pool Ah Piss	93	96021
931	FACE IN THE SOIL ft. KAMIYADA - PROD. H E 	93	112461
932	Do This Shiit Often	93	89869
933	At Ya Nekk	93	140330
934	Talking Shiit Anthem	93	132810
935	Yourenottheshiit, Pt. 3	93	273063
936	Dyin Slowly	93	124369
937	Dblcup	93	216967
938	Chosen Ones	93	107389
939	Game V2	93	128327
940	Sit Down!	94	161560
941	Isabelle	94	220883
942	30_30_no_halves	94	143987
943	Hopefully Someday	94	225698
944	i know u been stressed <3	94	133699
945	THE SUN	94	162462
946	Nasacar	94	137247
947	PLEASE DON’T GO	94	125373
948	CANT LOSE YOU	94	157612
949	left behind.	94	150165
950	Bug Bitch	95	151714
951	Dirt & Rubble	95	128062
952	Throwing Puppies in a Lawn Mower	95	169990
953	NiceTry!	95	100393
954	BERETTA (feat. Wifisfuneral)	95	160731
955	How Da Game Go	95	175357
956	Mp5k	95	156800
957	Demon $layer	95	157539
958	Toe Tags & Broken Skulls	95	126000
959	I Dont Wanna Do This Anymore	95	87561
960	Slipknot	96	209099
961	infinity (888) - feat. Joey Bada$$	96	176591
962	RACECAR	96	157436
963	World Burn	96	173105
964	Show You Hell	96	154502
965	Good Luck	96	140000
966	Kic Bac	96	194829
967	Mardi Gras	96	160042
968	Hitta Freestyle	96	148746
969	Nothin	96	75953
970	Knock Knock	97	187237
971	Pluto	97	222903
972	Walk	97	96064
973	I BE DAMNED	97	139134
974	FUCK ERRBODY	97	126790
975	ONMYGRANNYKIDS	97	106286
976	Hell On Earth	97	137253
977	Wouldnt Be Nothing	97	225547
978	Neon Rainbows	97	85972
979	FDD	97	169424
980	PTSD	98	199827
981	Straight Drop X 4	98	205439
982	Ether	98	160560
983	Bad Habits	98	188261
984	Head Straight	98	149189
985	Shxdes	98	113027
986	GO GETTA	98	146939
987	Tar Lungs	98	153846
988	POPSHiiT777	98	137121
989	.556	98	170918
990	Dn	99	194979
991	Im Sorry Im Broken	99	153077
992	Dead Inside	99	148255
993	They Said the Sky Was the Limit	99	159007
994	Heartbreak (feat. Travis Barker)	99	123576
995	Class Four Freestyle	99	135861
996	Heartless	99	128042
997	No Cap	99	248625
998	Who You Talking To	99	81726
999	Nihilus	99	116370
\.


--
-- Name: albumauthors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albumauthors_id_seq', 1, false);


--
-- Name: albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_album_id_seq', 1, false);


--
-- Name: authorgenres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authorgenres_id_seq', 1, false);


--
-- Name: authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_author_id_seq', 1, false);


--
-- Name: collections_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collections_collection_id_seq', 1, false);


--
-- Name: genre_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_genre_id_seq', 1, false);


--
-- Name: trackcollections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trackcollections_id_seq', 1, false);


--
-- Name: tracks_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_track_id_seq', 1, false);


--
-- Name: albumauthors albumauthors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumauthors
    ADD CONSTRAINT albumauthors_pkey PRIMARY KEY (id);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: authorgenres authorgenres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorgenres
    ADD CONSTRAINT authorgenres_pkey PRIMARY KEY (id);


--
-- Name: authors authors_author_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_author_key UNIQUE (author);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (collection_id);


--
-- Name: genre genre_genre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_genre_key UNIQUE (genre);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_id);


--
-- Name: trackcollections trackcollections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackcollections
    ADD CONSTRAINT trackcollections_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (track_id);


--
-- Name: albumauthors albumauthors_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumauthors
    ADD CONSTRAINT albumauthors_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- Name: albumauthors albumauthors_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albumauthors
    ADD CONSTRAINT albumauthors_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- Name: authorgenres authorgenres_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorgenres
    ADD CONSTRAINT authorgenres_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- Name: authorgenres authorgenres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorgenres
    ADD CONSTRAINT authorgenres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(genre_id);


--
-- Name: trackcollections trackcollections_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackcollections
    ADD CONSTRAINT trackcollections_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id);


--
-- Name: trackcollections trackcollections_track_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackcollections
    ADD CONSTRAINT trackcollections_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.tracks(track_id);


--
-- Name: tracks tracks_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);


--
-- PostgreSQL database dump complete
--

