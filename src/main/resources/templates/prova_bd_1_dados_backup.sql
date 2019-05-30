--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.16
-- Dumped by pg_dump version 9.5.16

-- Started on 2019-05-30 10:10:46 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2215 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 94005)
-- Name: advertencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.advertencia (
    id integer NOT NULL,
    colaborador_id integer NOT NULL,
    gerente_id integer,
    descricao text NOT NULL,
    data_advertencia date
);


ALTER TABLE public.advertencia OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 94003)
-- Name: advertencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.advertencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.advertencia_id_seq OWNER TO postgres;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 187
-- Name: advertencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.advertencia_id_seq OWNED BY public.advertencia.id;


--
-- TOC entry 184 (class 1259 OID 93969)
-- Name: colaborador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colaborador (
    id integer NOT NULL,
    nome text NOT NULL,
    setor_id integer,
    gerente_id integer,
    hora_inicial time without time zone NOT NULL,
    hora_final time without time zone NOT NULL,
    data_admissao date,
    salario numeric(16,4) DEFAULT 0 NOT NULL,
    bonus numeric(16,4) DEFAULT 0 NOT NULL,
    CONSTRAINT colaborador_salario_check CHECK ((salario > (0)::numeric)),
    CONSTRAINT colaborador_salario_check1 CHECK ((salario >= (0)::numeric)),
    CONSTRAINT salario_deve_ter_valor_positivo_ck CHECK ((salario >= (0)::numeric)),
    CONSTRAINT salario_maior_que_zero_ck CHECK ((salario >= (0)::numeric)),
    CONSTRAINT salario_tem_que_ser_maior_que_zero_ck CHECK ((salario >= (0)::numeric))
);


ALTER TABLE public.colaborador OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 93967)
-- Name: colaborador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.colaborador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.colaborador_id_seq OWNER TO postgres;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 183
-- Name: colaborador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.colaborador_id_seq OWNED BY public.colaborador.id;


--
-- TOC entry 186 (class 1259 OID 93991)
-- Name: relogio_ponto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.relogio_ponto (
    id integer NOT NULL,
    colaborador_id integer NOT NULL,
    data_apontamento date DEFAULT ('now'::text)::date NOT NULL,
    hora_chegada time without time zone NOT NULL,
    hora_saida time without time zone NOT NULL,
    saldo interval
);


ALTER TABLE public.relogio_ponto OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 93989)
-- Name: relogio_ponto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.relogio_ponto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relogio_ponto_id_seq OWNER TO postgres;

--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 185
-- Name: relogio_ponto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.relogio_ponto_id_seq OWNED BY public.relogio_ponto.id;


--
-- TOC entry 182 (class 1259 OID 93958)
-- Name: setor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setor (
    id integer NOT NULL,
    nome text NOT NULL
);


ALTER TABLE public.setor OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 93956)
-- Name: setor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.setor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.setor_id_seq OWNER TO postgres;

--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 181
-- Name: setor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.setor_id_seq OWNED BY public.setor.id;


--
-- TOC entry 2053 (class 2604 OID 94008)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertencia ALTER COLUMN id SET DEFAULT nextval('public.advertencia_id_seq'::regclass);


--
-- TOC entry 2043 (class 2604 OID 93972)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador ALTER COLUMN id SET DEFAULT nextval('public.colaborador_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 93994)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto ALTER COLUMN id SET DEFAULT nextval('public.relogio_ponto_id_seq'::regclass);


--
-- TOC entry 2042 (class 2604 OID 93961)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor ALTER COLUMN id SET DEFAULT nextval('public.setor_id_seq'::regclass);


--
-- TOC entry 2206 (class 0 OID 94005)
-- Dependencies: 188
-- Data for Name: advertencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (1, 2, 1, 'Foi pego mascando chiclete', '2013-09-01');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (2, 2, 1, 'Roubou lanche dos colegas', '2012-10-01');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (3, 7, 1, 'Não pagou o aluguel', '2019-02-01');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (4, 9, 3, 'Dormiu durante o expediente', '2019-10-01');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (5, 8, 3, 'Quebrou a maçaneta da porta', '2019-09-11');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (6, 8, 3, 'Chamou o filho do gerente de feio', '2019-09-01');
INSERT INTO public.advertencia (id, colaborador_id, gerente_id, descricao, data_advertencia) VALUES (7, 8, 3, 'Saiu durante o dia e não voltou mais', '2019-09-01');


--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 187
-- Name: advertencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.advertencia_id_seq', 6, true);


--
-- TOC entry 2202 (class 0 OID 93969)
-- Dependencies: 184
-- Data for Name: colaborador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (1, 'Trump', 1, NULL, '07:00:00', '17:00:00', '1999-01-01', 32500.5555, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (2, 'Caco Antibes', 5, 1, '08:00:00', '18:00:00', '2010-01-01', 1500.0000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (3, 'Genoveva', 1, 1, '07:00:00', '17:00:00', '2019-01-01', 4500.4000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (4, 'Pedro', 1, 2, '07:00:00', '17:00:00', '2019-01-01', 1112.3000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (5, 'Bino', 1, NULL, '07:00:00', '17:00:00', '2019-02-01', 3331.2000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (7, 'Seu Madruga', 1, 1, '07:00:00', '17:00:00', '2019-02-01', 500.0000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (8, 'Rodinélson', 5, 3, '07:00:00', '17:00:00', '2019-03-01', 5020.0000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (9, 'Seu Saraiva', 2, NULL, '07:00:00', '17:00:00', '2019-04-01', 19000.1000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (10, 'Benevides', 4, NULL, '07:00:00', '17:00:00', '2019-02-01', 12.0000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (11, 'Chiquinha', 3, 1, '07:00:00', '17:00:00', '2019-05-01', 250.0000, 0.0000);
INSERT INTO public.colaborador (id, nome, setor_id, gerente_id, hora_inicial, hora_final, data_admissao, salario, bonus) VALUES (6, 'Sandoval', NULL, 3, '07:00:00', '17:00:00', '2019-01-01', 3112.0000, 0.0000);


--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 183
-- Name: colaborador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colaborador_id_seq', 11, true);


--
-- TOC entry 2204 (class 0 OID 93991)
-- Dependencies: 186
-- Data for Name: relogio_ponto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (1, 1, '2019-04-01', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (2, 2, '2019-04-01', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (3, 3, '2019-04-01', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (4, 4, '2019-04-01', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (5, 5, '2019-04-01', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (6, 6, '2019-04-01', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (7, 7, '2019-04-01', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (8, 8, '2019-04-01', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (9, 9, '2019-04-01', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (10, 10, '2019-04-01', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (11, 11, '2019-04-01', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (12, 1, '2019-04-02', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (13, 2, '2019-04-02', '08:04:00', '18:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (14, 3, '2019-04-02', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (15, 4, '2019-04-02', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (16, 5, '2019-04-02', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (17, 6, '2019-04-02', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (18, 7, '2019-04-02', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (19, 8, '2019-04-02', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (20, 9, '2019-04-02', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (21, 10, '2019-04-02', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (22, 11, '2019-04-02', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (23, 1, '2019-04-03', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (24, 2, '2019-04-03', '08:07:00', '18:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (25, 3, '2019-04-03', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (26, 4, '2019-04-03', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (27, 5, '2019-04-03', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (28, 6, '2019-04-03', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (29, 7, '2019-04-03', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (30, 8, '2019-04-03', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (31, 9, '2019-04-03', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (32, 10, '2019-04-03', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (33, 11, '2019-04-03', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (34, 1, '2019-04-04', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (35, 2, '2019-04-04', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (36, 3, '2019-04-04', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (37, 4, '2019-04-04', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (38, 5, '2019-04-04', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (39, 6, '2019-04-04', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (40, 7, '2019-04-04', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (41, 8, '2019-04-04', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (42, 9, '2019-04-04', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (43, 10, '2019-04-04', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (44, 11, '2019-04-04', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (45, 1, '2019-04-05', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (46, 2, '2019-04-05', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (47, 3, '2019-04-05', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (48, 4, '2019-04-05', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (49, 5, '2019-04-05', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (50, 6, '2019-04-05', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (51, 7, '2019-04-05', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (52, 8, '2019-04-05', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (53, 9, '2019-04-05', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (54, 10, '2019-04-05', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (55, 11, '2019-04-05', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (56, 1, '2019-04-06', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (57, 2, '2019-04-06', '08:00:00', '18:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (58, 3, '2019-04-06', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (59, 4, '2019-04-06', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (60, 5, '2019-04-06', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (61, 6, '2019-04-06', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (62, 7, '2019-04-06', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (63, 8, '2019-04-06', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (64, 9, '2019-04-06', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (65, 10, '2019-04-06', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (66, 11, '2019-04-06', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (67, 1, '2019-04-07', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (68, 2, '2019-04-07', '08:05:00', '18:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (69, 3, '2019-04-07', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (70, 4, '2019-04-07', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (71, 5, '2019-04-07', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (72, 6, '2019-04-07', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (73, 7, '2019-04-07', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (74, 8, '2019-04-07', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (75, 9, '2019-04-07', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (76, 10, '2019-04-07', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (77, 11, '2019-04-07', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (78, 1, '2019-04-08', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (79, 2, '2019-04-08', '08:01:00', '18:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (80, 3, '2019-04-08', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (81, 4, '2019-04-08', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (82, 5, '2019-04-08', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (83, 6, '2019-04-08', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (84, 7, '2019-04-08', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (85, 8, '2019-04-08', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (86, 9, '2019-04-08', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (87, 10, '2019-04-08', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (88, 11, '2019-04-08', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (89, 1, '2019-04-09', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (90, 2, '2019-04-09', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (91, 3, '2019-04-09', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (92, 4, '2019-04-09', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (93, 5, '2019-04-09', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (94, 6, '2019-04-09', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (95, 7, '2019-04-09', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (96, 8, '2019-04-09', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (97, 9, '2019-04-09', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (98, 10, '2019-04-09', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (99, 11, '2019-04-09', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (100, 1, '2019-04-10', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (101, 2, '2019-04-10', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (102, 3, '2019-04-10', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (103, 4, '2019-04-10', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (104, 5, '2019-04-10', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (105, 6, '2019-04-10', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (106, 7, '2019-04-10', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (107, 8, '2019-04-10', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (108, 9, '2019-04-10', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (109, 10, '2019-04-10', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (110, 11, '2019-04-10', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (111, 1, '2019-04-11', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (112, 2, '2019-04-11', '08:05:00', '18:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (113, 3, '2019-04-11', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (114, 4, '2019-04-11', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (115, 5, '2019-04-11', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (116, 6, '2019-04-11', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (117, 7, '2019-04-11', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (118, 8, '2019-04-11', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (119, 9, '2019-04-11', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (120, 10, '2019-04-11', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (121, 11, '2019-04-11', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (122, 1, '2019-04-12', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (123, 2, '2019-04-12', '08:01:00', '18:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (124, 3, '2019-04-12', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (125, 4, '2019-04-12', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (126, 5, '2019-04-12', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (127, 6, '2019-04-12', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (128, 7, '2019-04-12', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (129, 8, '2019-04-12', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (130, 9, '2019-04-12', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (131, 10, '2019-04-12', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (132, 11, '2019-04-12', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (133, 1, '2019-04-13', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (134, 2, '2019-04-13', '08:07:00', '18:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (135, 3, '2019-04-13', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (136, 4, '2019-04-13', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (137, 5, '2019-04-13', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (138, 6, '2019-04-13', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (139, 7, '2019-04-13', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (140, 8, '2019-04-13', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (141, 9, '2019-04-13', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (142, 10, '2019-04-13', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (143, 11, '2019-04-13', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (144, 1, '2019-04-14', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (145, 2, '2019-04-14', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (146, 3, '2019-04-14', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (147, 4, '2019-04-14', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (148, 5, '2019-04-14', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (149, 6, '2019-04-14', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (150, 7, '2019-04-14', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (151, 8, '2019-04-14', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (152, 9, '2019-04-14', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (153, 10, '2019-04-14', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (154, 11, '2019-04-14', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (155, 1, '2019-04-15', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (156, 2, '2019-04-15', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (157, 3, '2019-04-15', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (158, 4, '2019-04-15', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (159, 5, '2019-04-15', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (160, 6, '2019-04-15', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (161, 7, '2019-04-15', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (162, 8, '2019-04-15', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (163, 9, '2019-04-15', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (164, 10, '2019-04-15', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (165, 11, '2019-04-15', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (166, 1, '2019-04-16', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (167, 2, '2019-04-16', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (168, 3, '2019-04-16', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (169, 4, '2019-04-16', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (170, 5, '2019-04-16', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (171, 6, '2019-04-16', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (172, 7, '2019-04-16', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (173, 8, '2019-04-16', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (174, 9, '2019-04-16', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (175, 10, '2019-04-16', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (176, 11, '2019-04-16', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (177, 1, '2019-04-17', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (178, 2, '2019-04-17', '08:07:00', '18:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (179, 3, '2019-04-17', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (180, 4, '2019-04-17', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (181, 5, '2019-04-17', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (182, 6, '2019-04-17', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (183, 7, '2019-04-17', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (184, 8, '2019-04-17', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (185, 9, '2019-04-17', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (186, 10, '2019-04-17', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (187, 11, '2019-04-17', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (188, 1, '2019-04-18', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (189, 2, '2019-04-18', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (190, 3, '2019-04-18', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (191, 4, '2019-04-18', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (192, 5, '2019-04-18', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (193, 6, '2019-04-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (194, 7, '2019-04-18', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (195, 8, '2019-04-18', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (196, 9, '2019-04-18', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (197, 10, '2019-04-18', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (198, 11, '2019-04-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (199, 1, '2019-04-19', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (200, 2, '2019-04-19', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (201, 3, '2019-04-19', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (202, 4, '2019-04-19', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (203, 5, '2019-04-19', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (204, 6, '2019-04-19', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (205, 7, '2019-04-19', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (206, 8, '2019-04-19', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (207, 9, '2019-04-19', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (208, 10, '2019-04-19', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (209, 11, '2019-04-19', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (210, 1, '2019-04-20', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (211, 2, '2019-04-20', '08:10:00', '18:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (212, 3, '2019-04-20', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (213, 4, '2019-04-20', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (214, 5, '2019-04-20', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (215, 6, '2019-04-20', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (216, 7, '2019-04-20', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (217, 8, '2019-04-20', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (218, 9, '2019-04-20', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (219, 10, '2019-04-20', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (220, 11, '2019-04-20', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (221, 1, '2019-04-21', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (222, 2, '2019-04-21', '08:01:00', '18:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (223, 3, '2019-04-21', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (224, 4, '2019-04-21', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (225, 5, '2019-04-21', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (226, 6, '2019-04-21', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (227, 7, '2019-04-21', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (228, 8, '2019-04-21', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (229, 9, '2019-04-21', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (230, 10, '2019-04-21', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (231, 11, '2019-04-21', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (232, 1, '2019-04-22', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (233, 2, '2019-04-22', '08:08:00', '18:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (234, 3, '2019-04-22', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (235, 4, '2019-04-22', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (236, 5, '2019-04-22', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (237, 6, '2019-04-22', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (238, 7, '2019-04-22', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (239, 8, '2019-04-22', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (240, 9, '2019-04-22', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (241, 10, '2019-04-22', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (242, 11, '2019-04-22', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (243, 1, '2019-04-23', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (244, 2, '2019-04-23', '08:00:00', '18:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (245, 3, '2019-04-23', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (246, 4, '2019-04-23', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (247, 5, '2019-04-23', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (248, 6, '2019-04-23', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (249, 7, '2019-04-23', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (250, 8, '2019-04-23', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (251, 9, '2019-04-23', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (252, 10, '2019-04-23', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (253, 11, '2019-04-23', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (254, 1, '2019-04-24', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (255, 2, '2019-04-24', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (256, 3, '2019-04-24', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (257, 4, '2019-04-24', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (258, 5, '2019-04-24', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (259, 6, '2019-04-24', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (260, 7, '2019-04-24', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (261, 8, '2019-04-24', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (262, 9, '2019-04-24', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (263, 10, '2019-04-24', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (264, 11, '2019-04-24', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (265, 1, '2019-04-25', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (266, 2, '2019-04-25', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (267, 3, '2019-04-25', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (268, 4, '2019-04-25', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (269, 5, '2019-04-25', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (270, 6, '2019-04-25', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (271, 7, '2019-04-25', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (272, 8, '2019-04-25', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (273, 9, '2019-04-25', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (274, 10, '2019-04-25', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (275, 11, '2019-04-25', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (276, 1, '2019-04-26', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (277, 2, '2019-04-26', '08:01:00', '18:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (278, 3, '2019-04-26', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (279, 4, '2019-04-26', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (280, 5, '2019-04-26', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (281, 6, '2019-04-26', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (282, 7, '2019-04-26', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (283, 8, '2019-04-26', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (284, 9, '2019-04-26', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (285, 10, '2019-04-26', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (286, 11, '2019-04-26', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (287, 1, '2019-04-27', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (288, 2, '2019-04-27', '08:07:00', '18:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (289, 3, '2019-04-27', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (290, 4, '2019-04-27', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (291, 5, '2019-04-27', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (292, 6, '2019-04-27', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (293, 7, '2019-04-27', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (294, 8, '2019-04-27', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (295, 9, '2019-04-27', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (296, 10, '2019-04-27', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (297, 11, '2019-04-27', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (298, 1, '2019-04-28', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (299, 2, '2019-04-28', '08:08:00', '18:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (300, 3, '2019-04-28', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (301, 4, '2019-04-28', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (302, 5, '2019-04-28', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (303, 6, '2019-04-28', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (304, 7, '2019-04-28', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (305, 8, '2019-04-28', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (306, 9, '2019-04-28', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (307, 10, '2019-04-28', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (308, 11, '2019-04-28', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (309, 1, '2019-04-29', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (310, 2, '2019-04-29', '08:03:00', '18:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (311, 3, '2019-04-29', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (312, 4, '2019-04-29', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (313, 5, '2019-04-29', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (314, 6, '2019-04-29', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (315, 7, '2019-04-29', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (316, 8, '2019-04-29', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (317, 9, '2019-04-29', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (318, 10, '2019-04-29', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (319, 11, '2019-04-29', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (320, 1, '2019-04-30', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (321, 2, '2019-04-30', '08:04:00', '18:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (322, 3, '2019-04-30', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (323, 4, '2019-04-30', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (324, 5, '2019-04-30', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (325, 6, '2019-04-30', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (326, 7, '2019-04-30', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (327, 8, '2019-04-30', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (328, 9, '2019-04-30', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (329, 10, '2019-04-30', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (330, 11, '2019-04-30', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (331, 1, '2019-05-01', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (332, 2, '2019-05-01', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (333, 3, '2019-05-01', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (334, 4, '2019-05-01', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (335, 5, '2019-05-01', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (336, 6, '2019-05-01', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (337, 7, '2019-05-01', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (338, 8, '2019-05-01', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (339, 9, '2019-05-01', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (340, 10, '2019-05-01', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (341, 11, '2019-05-01', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (342, 1, '2019-05-02', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (343, 2, '2019-05-02', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (344, 3, '2019-05-02', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (345, 4, '2019-05-02', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (346, 5, '2019-05-02', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (347, 6, '2019-05-02', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (348, 7, '2019-05-02', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (349, 8, '2019-05-02', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (350, 9, '2019-05-02', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (351, 10, '2019-05-02', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (352, 11, '2019-05-02', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (353, 1, '2019-05-03', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (354, 2, '2019-05-03', '08:04:00', '18:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (355, 3, '2019-05-03', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (356, 4, '2019-05-03', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (357, 5, '2019-05-03', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (358, 6, '2019-05-03', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (359, 7, '2019-05-03', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (360, 8, '2019-05-03', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (361, 9, '2019-05-03', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (362, 10, '2019-05-03', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (363, 11, '2019-05-03', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (364, 1, '2019-05-04', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (365, 2, '2019-05-04', '08:08:00', '18:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (366, 3, '2019-05-04', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (367, 4, '2019-05-04', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (368, 5, '2019-05-04', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (369, 6, '2019-05-04', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (370, 7, '2019-05-04', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (371, 8, '2019-05-04', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (372, 9, '2019-05-04', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (373, 10, '2019-05-04', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (374, 11, '2019-05-04', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (375, 1, '2019-05-05', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (376, 2, '2019-05-05', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (377, 3, '2019-05-05', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (378, 4, '2019-05-05', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (379, 5, '2019-05-05', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (380, 6, '2019-05-05', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (381, 7, '2019-05-05', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (382, 8, '2019-05-05', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (383, 9, '2019-05-05', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (384, 10, '2019-05-05', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (385, 11, '2019-05-05', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (386, 1, '2019-05-06', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (387, 2, '2019-05-06', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (388, 3, '2019-05-06', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (389, 4, '2019-05-06', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (390, 5, '2019-05-06', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (391, 6, '2019-05-06', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (392, 7, '2019-05-06', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (393, 8, '2019-05-06', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (394, 9, '2019-05-06', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (395, 10, '2019-05-06', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (396, 11, '2019-05-06', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (397, 1, '2019-05-07', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (398, 2, '2019-05-07', '08:05:00', '18:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (399, 3, '2019-05-07', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (400, 4, '2019-05-07', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (401, 5, '2019-05-07', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (402, 6, '2019-05-07', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (403, 7, '2019-05-07', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (404, 8, '2019-05-07', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (405, 9, '2019-05-07', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (406, 10, '2019-05-07', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (407, 11, '2019-05-07', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (408, 1, '2019-05-08', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (409, 2, '2019-05-08', '08:03:00', '18:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (410, 3, '2019-05-08', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (411, 4, '2019-05-08', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (412, 5, '2019-05-08', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (413, 6, '2019-05-08', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (414, 7, '2019-05-08', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (415, 8, '2019-05-08', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (416, 9, '2019-05-08', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (417, 10, '2019-05-08', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (418, 11, '2019-05-08', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (419, 1, '2019-05-09', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (420, 2, '2019-05-09', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (421, 3, '2019-05-09', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (422, 4, '2019-05-09', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (423, 5, '2019-05-09', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (424, 6, '2019-05-09', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (425, 7, '2019-05-09', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (426, 8, '2019-05-09', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (427, 9, '2019-05-09', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (428, 10, '2019-05-09', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (429, 11, '2019-05-09', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (430, 1, '2019-05-10', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (431, 2, '2019-05-10', '08:05:00', '18:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (432, 3, '2019-05-10', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (433, 4, '2019-05-10', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (434, 5, '2019-05-10', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (435, 6, '2019-05-10', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (436, 7, '2019-05-10', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (437, 8, '2019-05-10', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (438, 9, '2019-05-10', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (439, 10, '2019-05-10', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (440, 11, '2019-05-10', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (441, 1, '2019-05-11', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (442, 2, '2019-05-11', '08:07:00', '18:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (443, 3, '2019-05-11', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (444, 4, '2019-05-11', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (445, 5, '2019-05-11', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (446, 6, '2019-05-11', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (447, 7, '2019-05-11', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (448, 8, '2019-05-11', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (449, 9, '2019-05-11', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (450, 10, '2019-05-11', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (451, 11, '2019-05-11', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (452, 1, '2019-05-12', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (453, 2, '2019-05-12', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (454, 3, '2019-05-12', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (455, 4, '2019-05-12', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (456, 5, '2019-05-12', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (457, 6, '2019-05-12', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (458, 7, '2019-05-12', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (459, 8, '2019-05-12', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (460, 9, '2019-05-12', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (461, 10, '2019-05-12', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (462, 11, '2019-05-12', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (463, 1, '2019-05-13', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (464, 2, '2019-05-13', '08:03:00', '18:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (465, 3, '2019-05-13', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (466, 4, '2019-05-13', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (467, 5, '2019-05-13', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (468, 6, '2019-05-13', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (469, 7, '2019-05-13', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (470, 8, '2019-05-13', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (471, 9, '2019-05-13', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (472, 10, '2019-05-13', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (473, 11, '2019-05-13', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (474, 1, '2019-05-14', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (475, 2, '2019-05-14', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (476, 3, '2019-05-14', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (477, 4, '2019-05-14', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (478, 5, '2019-05-14', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (479, 6, '2019-05-14', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (480, 7, '2019-05-14', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (481, 8, '2019-05-14', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (482, 9, '2019-05-14', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (483, 10, '2019-05-14', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (484, 11, '2019-05-14', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (485, 1, '2019-05-15', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (486, 2, '2019-05-15', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (487, 3, '2019-05-15', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (488, 4, '2019-05-15', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (489, 5, '2019-05-15', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (490, 6, '2019-05-15', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (491, 7, '2019-05-15', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (492, 8, '2019-05-15', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (493, 9, '2019-05-15', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (494, 10, '2019-05-15', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (495, 11, '2019-05-15', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (496, 1, '2019-05-16', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (497, 2, '2019-05-16', '08:01:00', '18:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (498, 3, '2019-05-16', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (499, 4, '2019-05-16', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (500, 5, '2019-05-16', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (501, 6, '2019-05-16', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (502, 7, '2019-05-16', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (503, 8, '2019-05-16', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (504, 9, '2019-05-16', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (505, 10, '2019-05-16', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (506, 11, '2019-05-16', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (507, 1, '2019-05-17', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (508, 2, '2019-05-17', '08:02:00', '18:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (509, 3, '2019-05-17', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (510, 4, '2019-05-17', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (511, 5, '2019-05-17', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (512, 6, '2019-05-17', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (513, 7, '2019-05-17', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (514, 8, '2019-05-17', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (515, 9, '2019-05-17', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (516, 10, '2019-05-17', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (517, 11, '2019-05-17', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (518, 1, '2019-05-18', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (519, 2, '2019-05-18', '08:06:00', '18:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (520, 3, '2019-05-18', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (521, 4, '2019-05-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (522, 5, '2019-05-18', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (523, 6, '2019-05-18', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (524, 7, '2019-05-18', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (525, 8, '2019-05-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (526, 9, '2019-05-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (527, 10, '2019-05-18', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (528, 11, '2019-05-18', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (529, 1, '2019-05-19', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (530, 2, '2019-05-19', '08:00:00', '18:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (531, 3, '2019-05-19', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (532, 4, '2019-05-19', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (533, 5, '2019-05-19', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (534, 6, '2019-05-19', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (535, 7, '2019-05-19', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (536, 8, '2019-05-19', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (537, 9, '2019-05-19', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (538, 10, '2019-05-19', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (539, 11, '2019-05-19', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (540, 1, '2019-05-20', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (541, 2, '2019-05-20', '08:05:00', '18:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (542, 3, '2019-05-20', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (543, 4, '2019-05-20', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (544, 5, '2019-05-20', '07:10:00', '17:00:00', '-00:10:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (545, 6, '2019-05-20', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (546, 7, '2019-05-20', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (547, 8, '2019-05-20', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (548, 9, '2019-05-20', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (549, 10, '2019-05-20', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (550, 11, '2019-05-20', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (551, 1, '2019-05-21', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (552, 2, '2019-05-21', '08:03:00', '18:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (553, 3, '2019-05-21', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (554, 4, '2019-05-21', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (555, 5, '2019-05-21', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (556, 6, '2019-05-21', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (557, 7, '2019-05-21', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (558, 8, '2019-05-21', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (559, 9, '2019-05-21', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (560, 10, '2019-05-21', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (561, 11, '2019-05-21', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (562, 1, '2019-05-22', '07:03:00', '17:00:00', '-00:03:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (563, 2, '2019-05-22', '08:04:00', '18:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (564, 3, '2019-05-22', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (565, 4, '2019-05-22', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (566, 5, '2019-05-22', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (567, 6, '2019-05-22', '07:09:00', '17:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (568, 7, '2019-05-22', '07:01:00', '17:00:00', '-00:01:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (569, 8, '2019-05-22', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (570, 9, '2019-05-22', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (571, 10, '2019-05-22', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (572, 11, '2019-05-22', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (573, 1, '2019-05-23', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (574, 2, '2019-05-23', '08:08:00', '18:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (575, 3, '2019-05-23', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (576, 4, '2019-05-23', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (577, 5, '2019-05-23', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (578, 6, '2019-05-23', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (579, 7, '2019-05-23', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (580, 8, '2019-05-23', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (581, 9, '2019-05-23', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (582, 10, '2019-05-23', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (583, 11, '2019-05-23', '07:08:00', '17:00:00', '-00:08:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (584, 1, '2019-05-24', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (585, 2, '2019-05-24', '08:09:00', '18:00:00', '-00:09:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (586, 3, '2019-05-24', '07:00:00', '17:00:00', '00:00:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (587, 4, '2019-05-24', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (588, 5, '2019-05-24', '07:05:00', '17:00:00', '-00:05:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (589, 6, '2019-05-24', '07:06:00', '17:00:00', '-00:06:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (590, 7, '2019-05-24', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (591, 8, '2019-05-24', '07:04:00', '17:00:00', '-00:04:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (592, 9, '2019-05-24', '07:02:00', '17:00:00', '-00:02:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (593, 10, '2019-05-24', '07:07:00', '17:00:00', '-00:07:00');
INSERT INTO public.relogio_ponto (id, colaborador_id, data_apontamento, hora_chegada, hora_saida, saldo) VALUES (594, 11, '2019-05-24', '07:08:00', '17:00:00', '-00:08:00');


--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 185
-- Name: relogio_ponto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.relogio_ponto_id_seq', 594, true);


--
-- TOC entry 2200 (class 0 OID 93958)
-- Dependencies: 182
-- Data for Name: setor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setor (id, nome) VALUES (2, 'Teste');
INSERT INTO public.setor (id, nome) VALUES (3, 'Atendimento');
INSERT INTO public.setor (id, nome) VALUES (4, 'Análise');
INSERT INTO public.setor (id, nome) VALUES (5, 'Serviços');
INSERT INTO public.setor (id, nome) VALUES (6, 'Aspones');
INSERT INTO public.setor (id, nome) VALUES (1, 'Desenvolvimento');


--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 181
-- Name: setor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.setor_id_seq', 5, true);


--
-- TOC entry 2079 (class 2606 OID 94013)
-- Name: advertencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertencia
    ADD CONSTRAINT advertencia_pkey PRIMARY KEY (id);


--
-- TOC entry 2059 (class 2606 OID 94386)
-- Name: apenas_um_restro_diario_de_funcionario_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT apenas_um_restro_diario_de_funcionario_uq UNIQUE (data_apontamento, colaborador_id);


--
-- TOC entry 2061 (class 2606 OID 94583)
-- Name: apontamento_para_o_mesmo_colaborador; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT apontamento_para_o_mesmo_colaborador UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2063 (class 2606 OID 94512)
-- Name: colaborador_e_data_apontamento_nao_pode_repetir; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT colaborador_e_data_apontamento_nao_pode_repetir UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2057 (class 2606 OID 93978)
-- Name: colaborador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 94653)
-- Name: data_apontamento_colaborador_nao_repetir_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT data_apontamento_colaborador_nao_repetir_uq UNIQUE (data_apontamento, colaborador_id);


--
-- TOC entry 2067 (class 2606 OID 94734)
-- Name: nao_pode_uq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT nao_pode_uq UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2069 (class 2606 OID 94025)
-- Name: relogio_ponto_colaborador_id_data_apontamento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_colaborador_id_data_apontamento_key UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2071 (class 2606 OID 94581)
-- Name: relogio_ponto_colaborador_id_data_apontamento_key1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_colaborador_id_data_apontamento_key1 UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2073 (class 2606 OID 94730)
-- Name: relogio_ponto_colaborador_id_data_apontamento_key2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_colaborador_id_data_apontamento_key2 UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2075 (class 2606 OID 94732)
-- Name: relogio_ponto_colaborador_id_data_apontamento_key3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_colaborador_id_data_apontamento_key3 UNIQUE (colaborador_id, data_apontamento);


--
-- TOC entry 2077 (class 2606 OID 93997)
-- Name: relogio_ponto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 93966)
-- Name: setor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setor
    ADD CONSTRAINT setor_pkey PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 94014)
-- Name: advertencia_colaborador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertencia
    ADD CONSTRAINT advertencia_colaborador_id_fkey FOREIGN KEY (colaborador_id) REFERENCES public.colaborador(id);


--
-- TOC entry 2084 (class 2606 OID 94019)
-- Name: advertencia_gerente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.advertencia
    ADD CONSTRAINT advertencia_gerente_id_fkey FOREIGN KEY (gerente_id) REFERENCES public.colaborador(id);


--
-- TOC entry 2081 (class 2606 OID 93984)
-- Name: colaborador_gerente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_gerente_id_fkey FOREIGN KEY (gerente_id) REFERENCES public.colaborador(id);


--
-- TOC entry 2080 (class 2606 OID 93979)
-- Name: colaborador_setor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colaborador
    ADD CONSTRAINT colaborador_setor_id_fkey FOREIGN KEY (setor_id) REFERENCES public.setor(id);


--
-- TOC entry 2082 (class 2606 OID 93998)
-- Name: relogio_ponto_colaborador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.relogio_ponto
    ADD CONSTRAINT relogio_ponto_colaborador_id_fkey FOREIGN KEY (colaborador_id) REFERENCES public.colaborador(id);


--
-- TOC entry 2214 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-05-30 10:10:46 -03

--
-- PostgreSQL database dump complete
--

