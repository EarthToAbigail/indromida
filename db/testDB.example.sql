-- EXAMPLE FILE!! Change the value of "USERNAME" to your username in your test
-- database that you set up locally. Then rename the file to 'testDB.sql'.

-- PostgreSQL database dump
--
BEGIN;

DROP TABLE IF EXISTS chats, facebook_infos, friends, google_infos, like_notifications,
likes, messages, musicians, musicians_interested_projects, musicians_play_instruments,
notifications, pgmigrations, photos, project_notifications, projects,
projects_require_instruments, regular_users, twitter_infos, users, users_have_interests,
users_like_songs, users_members_of_chats CASCADE;

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

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
--
--
SET search_path = public, pg_catalog;
--
SET default_tablespace = '';
--
SET default_with_oids = false;

--
-- Name: chats; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE chats (
    chat_id integer NOT NULL,
    chat_title character varying(100) NOT NULL,
    chat_description text DEFAULT 'There is no Description for this chat'::text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE chats OWNER TO "USERNAME";

--
-- Name: chats_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE chats_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chats_chat_id_seq OWNER TO "USERNAME";

--
-- Name: chats_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE chats_chat_id_seq OWNED BY chats.chat_id;


--
-- Name: facebook_infos; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE facebook_infos (
    user_id integer NOT NULL,
    facebook_id text NOT NULL,
    facebook_mail text
);


ALTER TABLE facebook_infos OWNER TO "USERNAME";

--
-- Name: friends; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE friends (
    user1 integer NOT NULL,
    user2 integer NOT NULL
);


ALTER TABLE friends OWNER TO "USERNAME";

--
-- Name: google_infos; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE google_infos (
    user_id integer NOT NULL,
    google_id text NOT NULL,
    google_mail text
);


ALTER TABLE google_infos OWNER TO "USERNAME";

--
-- Name: like_notifications; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE like_notifications (
    not_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE like_notifications OWNER TO "USERNAME";

--
-- Name: likes; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE likes (
    user1 integer NOT NULL,
    user2 integer NOT NULL
);


ALTER TABLE likes OWNER TO "USERNAME";

--
-- Name: messages; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE messages (
    mid integer NOT NULL,
    chat_id integer NOT NULL,
    sender_id integer NOT NULL,
    content text NOT NULL,
    sent_at timestamp without time zone NOT NULL,
    delivered_at timestamp without time zone
);


ALTER TABLE messages OWNER TO "USERNAME";

--
-- Name: messages_mid_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE messages_mid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_mid_seq OWNER TO "USERNAME";

--
-- Name: messages_mid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE messages_mid_seq OWNED BY messages.mid;


--
-- Name: musicians; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE musicians (
    user_id integer NOT NULL
);


ALTER TABLE musicians OWNER TO "USERNAME";

--
-- Name: musicians_interested_projects; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE musicians_interested_projects (
    user_id integer NOT NULL,
    pid integer NOT NULL
);


ALTER TABLE musicians_interested_projects OWNER TO "USERNAME";

--
-- Name: musicians_play_instruments; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE musicians_play_instruments (
    user_id integer NOT NULL,
    instrument character varying(100) NOT NULL
);


ALTER TABLE musicians_play_instruments OWNER TO "USERNAME";

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE notifications (
    not_id integer NOT NULL,
    receiver_id integer NOT NULL,
    content text,
    url text,
    created_at timestamp without time zone NOT NULL,
    seen_at timestamp without time zone
);


ALTER TABLE notifications OWNER TO "USERNAME";

--
-- Name: notifications_not_id_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE notifications_not_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notifications_not_id_seq OWNER TO "USERNAME";

--
-- Name: notifications_not_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE notifications_not_id_seq OWNED BY notifications.not_id;


--
-- Name: pgmigrations; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE pgmigrations (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    run_on timestamp without time zone NOT NULL
);


ALTER TABLE pgmigrations OWNER TO "USERNAME";

--
-- Name: pgmigrations_id_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE pgmigrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pgmigrations_id_seq OWNER TO "USERNAME";

--
-- Name: pgmigrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE pgmigrations_id_seq OWNED BY pgmigrations.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE photos (
    user_id integer NOT NULL,
    link text NOT NULL
);


ALTER TABLE photos OWNER TO "USERNAME";

--
-- Name: project_notifications; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE project_notifications (
    not_id integer NOT NULL,
    pid integer NOT NULL
);


ALTER TABLE project_notifications OWNER TO "USERNAME";

--
-- Name: projects; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE projects (
    pid integer NOT NULL,
    user_id integer NOT NULL,
    title text NOT NULL,
    date timestamp without time zone,
    genre character varying(100),
    n_participants integer,
    location text,
    "Description" text
);


ALTER TABLE projects OWNER TO "USERNAME";

--
-- Name: projects_pid_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE projects_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projects_pid_seq OWNER TO "USERNAME";

--
-- Name: projects_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE projects_pid_seq OWNED BY projects.pid;


--
-- Name: projects_require_instruments; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE projects_require_instruments (
    pid integer NOT NULL,
    instrument character varying(100) NOT NULL
);


ALTER TABLE projects_require_instruments OWNER TO "USERNAME";

--
-- Name: regular_users; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE regular_users (
    user_id integer NOT NULL
);


ALTER TABLE regular_users OWNER TO "USERNAME";

--
-- Name: twitter_infos; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE twitter_infos (
    user_id integer NOT NULL,
    twiiter_id text NOT NULL,
    twitter_mail text
);


ALTER TABLE twitter_infos OWNER TO "USERNAME";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(100),
    email character varying(255),
    firstname character varying(100),
    lastname character varying(100),
    birthdate timestamp without time zone,
    biography text,
    gender bit(1),
    phone character varying(100),
    profile_picture text,
    password_hash text,
    country character varying(100),
    city character varying(100),
    profile_privacy bit(1),
    messaging_privacy bit(1),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE users OWNER TO "USERNAME";

--
-- Name: users_have_interests; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE users_have_interests (
    user_id integer NOT NULL,
    tag character varying(50) NOT NULL
);


ALTER TABLE users_have_interests OWNER TO "USERNAME";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Mynah
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "USERNAME";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Mynah
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_like_songs; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE users_like_songs (
    user_id integer NOT NULL,
    song_id text NOT NULL
);


ALTER TABLE users_like_songs OWNER TO "USERNAME";

--
-- Name: users_members_of_chats; Type: TABLE; Schema: public; Owner: Mynah
--

CREATE TABLE users_members_of_chats (
    user_id integer NOT NULL,
    chat_id integer NOT NULL
);


ALTER TABLE users_members_of_chats OWNER TO "USERNAME";

--
-- Name: chats chat_id; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY chats ALTER COLUMN chat_id SET DEFAULT nextval('chats_chat_id_seq'::regclass);


--
-- Name: messages mid; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY messages ALTER COLUMN mid SET DEFAULT nextval('messages_mid_seq'::regclass);


--
-- Name: notifications not_id; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY notifications ALTER COLUMN not_id SET DEFAULT nextval('notifications_not_id_seq'::regclass);


--
-- Name: pgmigrations id; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY pgmigrations ALTER COLUMN id SET DEFAULT nextval('pgmigrations_id_seq'::regclass);


--
-- Name: projects pid; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY projects ALTER COLUMN pid SET DEFAULT nextval('projects_pid_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY chats (chat_id, chat_title, chat_description, created_at, updated_at) FROM stdin;
-- \.


--
-- Name: chats_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('chats_chat_id_seq', 1, false);


--
-- Data for Name: facebook_infos; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY facebook_infos (user_id, facebook_id, facebook_mail) FROM stdin;
-- \.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY friends (user1, user2) FROM stdin;
-- \.


--
-- Data for Name: google_infos; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY google_infos (user_id, google_id, google_mail) FROM stdin;
-- \.


--
-- Data for Name: like_notifications; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY like_notifications (not_id, sender_id) FROM stdin;
-- \.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY likes (user1, user2) FROM stdin;
-- \.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY messages (mid, chat_id, sender_id, content, sent_at, delivered_at) FROM stdin;
-- \.


--
-- Name: messages_mid_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('messages_mid_seq', 1, false);


--
-- Data for Name: musicians; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY musicians (user_id) FROM stdin;
-- \.


--
-- Data for Name: musicians_interested_projects; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY musicians_interested_projects (user_id, pid) FROM stdin;
-- \.


--
-- Data for Name: musicians_play_instruments; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY musicians_play_instruments (user_id, instrument) FROM stdin;
-- \.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY notifications (not_id, receiver_id, content, url, created_at, seen_at) FROM stdin;
-- \.


--
-- Name: notifications_not_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('notifications_not_id_seq', 1, false);


--
-- Data for Name: pgmigrations; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY pgmigrations (id, name, run_on) FROM stdin;
-- 1	1523637952934_create_users_table	2018-06-03 13:18:09.243663
-- 2	1523641903977_create_photos_table	2018-06-03 13:18:09.3052
-- 3	1523642378545_create_users_like_songs_table	2018-06-03 13:18:09.31595
-- 4	1523642682385_create_users_have_interests_table	2018-06-03 13:18:09.323306
-- 5	1523642866623_create_friends_table	2018-06-03 13:18:09.328676
-- 6	1523643006040_create_likes_table	2018-06-03 13:18:09.341779
-- 7	1523807639700_create_facebook_infos_table	2018-06-03 13:18:09.348617
-- 8	1523807897663_create_google_infos_table	2018-06-03 13:18:09.369464
-- 9	1523807942731_create_twitter_infos_table	2018-06-03 13:18:09.394839
-- 10	1523808031284_create_regular_users_table	2018-06-03 13:18:09.407302
-- 11	1523808133059_create_musicians_table	2018-06-03 13:18:09.413958
-- 12	1523808172094_create_musicians_play_instruments_table	2018-06-03 13:18:09.419625
-- 13	1523808322040_create_projects_table	2018-06-03 13:18:09.425299
-- 14	1523907209023_create_projects_require_instruments_table	2018-06-03 13:18:09.43246
-- 15	1523907378569_create_musicians_interested_projects_table	2018-06-03 13:18:09.437137
-- 16	1524512301212_create_chats_table	2018-06-03 13:18:09.44303
-- 17	1524512686903_create_users_members_of_chats_table	2018-06-03 13:18:09.451057
-- 18	1524512968169_create_messages_table	2018-06-03 13:18:09.458588
-- 19	1524676078117_create_notifications_table	2018-06-03 13:18:09.46738
-- 20	1524676420763_create_like_notifications_table	2018-06-03 13:18:09.478139
-- 21	1524676679507_create_project_notifications_table	2018-06-03 13:18:09.485553
-- \.


--
-- Name: pgmigrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('pgmigrations_id_seq', 21, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY photos (user_id, link) FROM stdin;
-- \.


--
-- Data for Name: project_notifications; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY project_notifications (not_id, pid) FROM stdin;
-- \.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY projects (pid, user_id, title, date, genre, n_participants, location, "Description") FROM stdin;
-- \.


--
-- Name: projects_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('projects_pid_seq', 1, false);


--
-- Data for Name: projects_require_instruments; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY projects_require_instruments (pid, instrument) FROM stdin;
-- \.


--
-- Data for Name: regular_users; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY regular_users (user_id) FROM stdin;
-- \.


--
-- Data for Name: twitter_infos; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY twitter_infos (user_id, twiiter_id, twitter_mail) FROM stdin;
-- \.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY users (id, username, email, firstname, lastname, birthdate, biography, gender, phone, profile_picture, password_hash, country, city, profile_privacy, messaging_privacy, created_at, updated_at) FROM stdin;
-- \.


--
-- Data for Name: users_have_interests; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY users_have_interests (user_id, tag) FROM stdin;
-- \.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Mynah
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: users_like_songs; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY users_like_songs (user_id, song_id) FROM stdin;
-- \.


--
-- Data for Name: users_members_of_chats; Type: TABLE DATA; Schema: public; Owner: Mynah
--

-- COPY users_members_of_chats (user_id, chat_id) FROM stdin;
-- \.


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (chat_id);


--
-- Name: facebook_infos facebook_infos_facebook_id_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY facebook_infos
    ADD CONSTRAINT facebook_infos_facebook_id_key UNIQUE (facebook_id);


--
-- Name: facebook_infos facebook_infos_facebook_mail_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY facebook_infos
    ADD CONSTRAINT facebook_infos_facebook_mail_key UNIQUE (facebook_mail);


--
-- Name: facebook_infos facebook_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY facebook_infos
    ADD CONSTRAINT facebook_infos_pkey PRIMARY KEY (user_id);


--
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (user1, user2);


--
-- Name: google_infos google_infos_google_id_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY google_infos
    ADD CONSTRAINT google_infos_google_id_key UNIQUE (google_id);


--
-- Name: google_infos google_infos_google_mail_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY google_infos
    ADD CONSTRAINT google_infos_google_mail_key UNIQUE (google_mail);


--
-- Name: google_infos google_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY google_infos
    ADD CONSTRAINT google_infos_pkey PRIMARY KEY (user_id);


--
-- Name: like_notifications like_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY like_notifications
    ADD CONSTRAINT like_notifications_pkey PRIMARY KEY (not_id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (user1, user2);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (mid);


--
-- Name: musicians_interested_projects musicians_interested_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians_interested_projects
    ADD CONSTRAINT musicians_interested_projects_pkey PRIMARY KEY (user_id, pid);


--
-- Name: musicians musicians_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians
    ADD CONSTRAINT musicians_pkey PRIMARY KEY (user_id);


--
-- Name: musicians_play_instruments musicians_play_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians_play_instruments
    ADD CONSTRAINT musicians_play_instruments_pkey PRIMARY KEY (user_id, instrument);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (not_id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (user_id, link);


--
-- Name: project_notifications project_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY project_notifications
    ADD CONSTRAINT project_notifications_pkey PRIMARY KEY (not_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (pid);


--
-- Name: projects_require_instruments projects_require_instruments_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY projects_require_instruments
    ADD CONSTRAINT projects_require_instruments_pkey PRIMARY KEY (pid, instrument);


--
-- Name: regular_users regular_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY regular_users
    ADD CONSTRAINT regular_users_pkey PRIMARY KEY (user_id);


--
-- Name: twitter_infos twitter_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY twitter_infos
    ADD CONSTRAINT twitter_infos_pkey PRIMARY KEY (user_id);


--
-- Name: twitter_infos twitter_infos_twiiter_id_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY twitter_infos
    ADD CONSTRAINT twitter_infos_twiiter_id_key UNIQUE (twiiter_id);


--
-- Name: twitter_infos twitter_infos_twitter_mail_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY twitter_infos
    ADD CONSTRAINT twitter_infos_twitter_mail_key UNIQUE (twitter_mail);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_have_interests users_have_interests_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_have_interests
    ADD CONSTRAINT users_have_interests_pkey PRIMARY KEY (user_id, tag);


--
-- Name: users_like_songs users_like_songs_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_like_songs
    ADD CONSTRAINT users_like_songs_pkey PRIMARY KEY (user_id, song_id);


--
-- Name: users_members_of_chats users_members_of_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_members_of_chats
    ADD CONSTRAINT users_members_of_chats_pkey PRIMARY KEY (user_id, chat_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: facebook_infos facebook_infos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY facebook_infos
    ADD CONSTRAINT facebook_infos_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: friends friends_user1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_user1_fkey FOREIGN KEY (user1) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: friends friends_user2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_user2_fkey FOREIGN KEY (user2) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: google_infos google_infos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY google_infos
    ADD CONSTRAINT google_infos_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: like_notifications like_notifications_not_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY like_notifications
    ADD CONSTRAINT like_notifications_not_id_fkey FOREIGN KEY (not_id) REFERENCES notifications(not_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: like_notifications like_notifications_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY like_notifications
    ADD CONSTRAINT like_notifications_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: likes likes_user1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_user1_fkey FOREIGN KEY (user1) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: likes likes_user2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_user2_fkey FOREIGN KEY (user2) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages messages_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES chats(chat_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musicians_interested_projects musicians_interested_projects_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians_interested_projects
    ADD CONSTRAINT musicians_interested_projects_pid_fkey FOREIGN KEY (pid) REFERENCES projects(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musicians_interested_projects musicians_interested_projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians_interested_projects
    ADD CONSTRAINT musicians_interested_projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES musicians(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musicians_play_instruments musicians_play_instruments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians_play_instruments
    ADD CONSTRAINT musicians_play_instruments_user_id_fkey FOREIGN KEY (user_id) REFERENCES musicians(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musicians musicians_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY musicians
    ADD CONSTRAINT musicians_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: notifications notifications_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: photos photos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_notifications project_notifications_not_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY project_notifications
    ADD CONSTRAINT project_notifications_not_id_fkey FOREIGN KEY (not_id) REFERENCES notifications(not_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: project_notifications project_notifications_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY project_notifications
    ADD CONSTRAINT project_notifications_pid_fkey FOREIGN KEY (pid) REFERENCES projects(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects_require_instruments projects_require_instruments_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY projects_require_instruments
    ADD CONSTRAINT projects_require_instruments_pid_fkey FOREIGN KEY (pid) REFERENCES projects(pid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: projects projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES musicians(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: regular_users regular_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY regular_users
    ADD CONSTRAINT regular_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: twitter_infos twitter_infos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY twitter_infos
    ADD CONSTRAINT twitter_infos_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_have_interests users_have_interests_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_have_interests
    ADD CONSTRAINT users_have_interests_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_like_songs users_like_songs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_like_songs
    ADD CONSTRAINT users_like_songs_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_members_of_chats users_members_of_chats_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_members_of_chats
    ADD CONSTRAINT users_members_of_chats_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES chats(chat_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_members_of_chats users_members_of_chats_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Mynah
--

ALTER TABLE ONLY users_members_of_chats
    ADD CONSTRAINT users_members_of_chats_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
COMMIT;
