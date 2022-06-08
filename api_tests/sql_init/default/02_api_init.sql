--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19
-- Dumped by pg_dump version 10.19

\c apiserver;

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agreement_agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement_agreement (
                                            id integer NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            version character varying(127) NOT NULL,
                                            content text NOT NULL,
                                            active boolean NOT NULL
);


ALTER TABLE public.agreement_agreement OWNER TO postgres;

--
-- Name: agreement_agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agreement_agreement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.agreement_agreement_id_seq OWNER TO postgres;

--
-- Name: agreement_agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agreement_agreement_id_seq OWNED BY public.agreement_agreement.id;


--
-- Name: agreement_useragreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement_useragreement (
                                                id integer NOT NULL,
                                                created_at timestamp(6) with time zone NOT NULL,
                                                updated_at timestamp(6) with time zone NOT NULL,
                                                settings jsonb NOT NULL,
                                                agreement_id integer NOT NULL,
                                                user_id integer NOT NULL
);


ALTER TABLE public.agreement_useragreement OWNER TO postgres;

--
-- Name: agreement_useragreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agreement_useragreement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.agreement_useragreement_id_seq OWNER TO postgres;

--
-- Name: agreement_useragreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agreement_useragreement_id_seq OWNED BY public.agreement_useragreement.id;


--
-- Name: algorithm_algorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.algorithm_algorithm (
                                            id integer NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            code_name character varying(128) NOT NULL,
                                            name character varying(128) NOT NULL,
                                            name_en character varying(128),
                                            name_zh_hans character varying(128),
                                            intro text NOT NULL,
                                            index integer NOT NULL,
                                            CONSTRAINT algorithm_algorithm_index_check CHECK ((index >= 0))
);


ALTER TABLE public.algorithm_algorithm OWNER TO postgres;

--
-- Name: algorithm_algorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.algorithm_algorithm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.algorithm_algorithm_id_seq OWNER TO postgres;

--
-- Name: algorithm_algorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.algorithm_algorithm_id_seq OWNED BY public.algorithm_algorithm.id;


--
-- Name: algorithm_eventtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.algorithm_eventtype (
                                            id integer NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            code_name character varying(63) NOT NULL,
                                            name character varying(63) NOT NULL,
                                            name_en character varying(63),
                                            name_zh_hans character varying(63),
                                            index integer NOT NULL,
                                            algorithm_id integer NOT NULL,
                                            CONSTRAINT algorithm_eventtype_index_check CHECK ((index >= 0))
);


ALTER TABLE public.algorithm_eventtype OWNER TO postgres;

--
-- Name: algorithm_eventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.algorithm_eventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.algorithm_eventtype_id_seq OWNER TO postgres;

--
-- Name: algorithm_eventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.algorithm_eventtype_id_seq OWNED BY public.algorithm_eventtype.id;


--
-- Name: algorithm_productalgorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.algorithm_productalgorithm (
                                                   id integer NOT NULL,
                                                   created_at timestamp(6) with time zone NOT NULL,
                                                   updated_at timestamp(6) with time zone NOT NULL,
                                                   category character varying(64) NOT NULL,
                                                   algorithm_id integer NOT NULL,
                                                   product_type_id integer NOT NULL
);


ALTER TABLE public.algorithm_productalgorithm OWNER TO postgres;

--
-- Name: algorithm_productalgorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.algorithm_productalgorithm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.algorithm_productalgorithm_id_seq OWNER TO postgres;

--
-- Name: algorithm_productalgorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.algorithm_productalgorithm_id_seq OWNED BY public.algorithm_productalgorithm.id;


--
-- Name: algorithm_producttype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.algorithm_producttype (
                                              id integer NOT NULL,
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              category character varying(64) NOT NULL,
                                              type character varying(63) NOT NULL,
                                              meta character varying(2048) NOT NULL
);


ALTER TABLE public.algorithm_producttype OWNER TO postgres;

--
-- Name: algorithm_producttype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.algorithm_producttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.algorithm_producttype_id_seq OWNER TO postgres;

--
-- Name: algorithm_producttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.algorithm_producttype_id_seq OWNED BY public.algorithm_producttype.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
                                   id integer NOT NULL,
                                   name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
                                               id integer NOT NULL,
                                               group_id integer NOT NULL,
                                               permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
                                        id integer NOT NULL,
                                        name character varying(255) NOT NULL,
                                        codename character varying(100) NOT NULL,
                                        content_type_id integer NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
                                  id integer NOT NULL,
                                  password character varying(128) NOT NULL,
                                  last_login timestamp(6) with time zone,
                                  is_superuser boolean NOT NULL,
                                  first_name character varying(30) NOT NULL,
                                  last_name character varying(30) NOT NULL,
                                  email character varying(254) NOT NULL,
                                  is_staff boolean NOT NULL,
                                  is_active boolean NOT NULL,
                                  date_joined timestamp(6) with time zone NOT NULL,
                                  username character varying(254) NOT NULL,
                                  updated_at timestamp(6) with time zone NOT NULL,
                                  role character varying(31) NOT NULL,
                                  lang character varying(7) NOT NULL,
                                  nonce character varying(40) NOT NULL,
                                  timezone character varying(63) NOT NULL,
                                  temperature_unit character varying(1) NOT NULL,
                                  lock_expiration timestamp(6) with time zone NOT NULL,
                                  use2fa boolean NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
                                         id integer NOT NULL,
                                         user_id integer NOT NULL,
                                         group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
                                                   id integer NOT NULL,
                                                   user_id integer NOT NULL,
                                                   permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: back_cameraprefix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_cameraprefix (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          prefix character varying(15) NOT NULL,
                                          camera_provider_id integer NOT NULL
);


ALTER TABLE public.back_cameraprefix OWNER TO postgres;

--
-- Name: back_cameraprefix_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_cameraprefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.back_cameraprefix_id_seq OWNER TO postgres;

--
-- Name: back_cameraprefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_cameraprefix_id_seq OWNED BY public.back_cameraprefix.id;


--
-- Name: back_cameraprovider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_cameraprovider (
                                            id integer NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            brand character varying(15) NOT NULL,
                                            uri character varying(255) NOT NULL,
                                            hd_uri character varying(255) NOT NULL
);


ALTER TABLE public.back_cameraprovider OWNER TO postgres;

--
-- Name: back_cameraprovider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_cameraprovider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.back_cameraprovider_id_seq OWNER TO postgres;

--
-- Name: back_cameraprovider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_cameraprovider_id_seq OWNED BY public.back_cameraprovider.id;


--
-- Name: back_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_feedback (
                                      id integer NOT NULL,
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      status character varying(15) NOT NULL,
                                      title character varying(63) NOT NULL,
                                      content character varying(1023) NOT NULL,
                                      user_id integer NOT NULL
);


ALTER TABLE public.back_feedback OWNER TO postgres;

--
-- Name: back_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.back_feedback_id_seq OWNER TO postgres;

--
-- Name: back_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_feedback_id_seq OWNED BY public.back_feedback.id;


--
-- Name: back_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.back_notification (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          status character varying(31) NOT NULL,
                                          types character varying(31) NOT NULL,
                                          subject character varying(63) NOT NULL,
                                          message character varying(65535) NOT NULL,
                                          role character varying(31) NOT NULL,
                                          sent_count integer NOT NULL,
                                          last_user_id integer NOT NULL,
                                          is_html boolean NOT NULL
);


ALTER TABLE public.back_notification OWNER TO postgres;

--
-- Name: back_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.back_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.back_notification_id_seq OWNER TO postgres;

--
-- Name: back_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.back_notification_id_seq OWNED BY public.back_notification.id;


--
-- Name: bill_boxpayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_boxpayment (
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        id bigint NOT NULL,
                                        status character varying(15) NOT NULL,
                                        type character varying(15) NOT NULL,
                                        price character varying(8191) NOT NULL,
                                        start_at timestamp(6) with time zone NOT NULL,
                                        start_date date NOT NULL,
                                        end_at timestamp(6) with time zone NOT NULL,
                                        end_date date,
                                        amount numeric(12,2) NOT NULL,
                                        refund numeric(12,2) NOT NULL,
                                        box_subs_id character varying(31) NOT NULL,
                                        client_id integer NOT NULL,
                                        distributor_id integer NOT NULL,
                                        employee_id integer,
                                        payment_id bigint NOT NULL,
                                        seller_id integer NOT NULL
);


ALTER TABLE public.bill_boxpayment OWNER TO postgres;

--
-- Name: bill_boxpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_boxpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_boxpayment_id_seq OWNER TO postgres;

--
-- Name: bill_boxpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_boxpayment_id_seq OWNED BY public.bill_boxpayment.id;


--
-- Name: bill_boxpricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_boxpricing (
                                        id integer NOT NULL,
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        name character varying(127) NOT NULL,
                                        base_hash character varying(64) NOT NULL,
                                        pricing character varying(8191) NOT NULL,
                                        user_id integer NOT NULL
);


ALTER TABLE public.bill_boxpricing OWNER TO postgres;

--
-- Name: bill_boxpricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_boxpricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.bill_boxpricing_id_seq OWNER TO postgres;

--
-- Name: bill_boxpricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_boxpricing_id_seq OWNED BY public.bill_boxpricing.id;


--
-- Name: bill_boxsubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_boxsubs (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id character varying(31) NOT NULL,
                                     status character varying(15) NOT NULL,
                                     canceled_by character varying(15) NOT NULL,
                                     pending boolean NOT NULL,
                                     allocated_at timestamp(6) with time zone,
                                     distributed_at timestamp(6) with time zone,
                                     activated_at timestamp(6) with time zone,
                                     start_at timestamp(6) with time zone,
                                     end_at timestamp(6) with time zone,
                                     end_date date,
                                     type character varying(15) NOT NULL,
                                     switch_price character varying(8191),
                                     price character varying(8191),
                                     pricing character varying(8191),
                                     distributed_pricing character varying(8191),
                                     allocated_pricing character varying(8191),
                                     client_id integer,
                                     distributor_id integer,
                                     employee_id integer,
                                     seller_id integer
);


ALTER TABLE public.bill_boxsubs OWNER TO postgres;

--
-- Name: bill_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_client (
                                    id integer NOT NULL,
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    name character varying(127) NOT NULL,
                                    employee_id integer,
                                    seller_id integer NOT NULL,
                                    user_id integer NOT NULL
);


ALTER TABLE public.bill_client OWNER TO postgres;

--
-- Name: bill_client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.bill_client_id_seq OWNER TO postgres;

--
-- Name: bill_client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_client_id_seq OWNED BY public.bill_client.id;


--
-- Name: bill_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_customer (
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      id integer NOT NULL,
                                      stripe_id character varying(31) NOT NULL,
                                      status character varying(15) NOT NULL,
                                      balance numeric(12,2) NOT NULL,
                                      enable_monitoring_service boolean NOT NULL,
                                      guard_company_id integer
);


ALTER TABLE public.bill_customer OWNER TO postgres;

--
-- Name: bill_distributor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_distributor (
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         id integer NOT NULL,
                                         name character varying(127) NOT NULL,
                                         balance numeric(12,2) NOT NULL
);


ALTER TABLE public.bill_distributor OWNER TO postgres;

--
-- Name: bill_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_employee (
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      id integer NOT NULL,
                                      deleted boolean NOT NULL,
                                      seller_id integer NOT NULL
);


ALTER TABLE public.bill_employee OWNER TO postgres;

--
-- Name: bill_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_payment (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id bigint NOT NULL,
                                     failed_at timestamp(6) with time zone,
                                     status character varying(15) NOT NULL,
                                     nonce uuid NOT NULL,
                                     failed_count smallint NOT NULL,
                                     amount numeric(12,2) NOT NULL,
                                     refund numeric(12,2) NOT NULL,
                                     charge_id character varying(31),
                                     customer_id integer NOT NULL
);


ALTER TABLE public.bill_payment OWNER TO postgres;

--
-- Name: bill_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bill_payment_id_seq OWNER TO postgres;

--
-- Name: bill_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_payment_id_seq OWNED BY public.bill_payment.id;


--
-- Name: bill_pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_pricing (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     type character varying(15) NOT NULL,
                                     pricing character varying(255) NOT NULL
);


ALTER TABLE public.bill_pricing OWNER TO postgres;

--
-- Name: bill_robotpayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_robotpayment (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          type character varying(15) NOT NULL,
                                          price character varying(63) NOT NULL,
                                          start_at timestamp(6) with time zone NOT NULL,
                                          start_date date NOT NULL,
                                          end_at timestamp(6) with time zone NOT NULL,
                                          end_date date NOT NULL,
                                          amount numeric(12,2) NOT NULL,
                                          client_id integer NOT NULL,
                                          distributor_id integer NOT NULL,
                                          employee_id integer,
                                          payment_id bigint NOT NULL,
                                          robot_subs_id character varying(31) NOT NULL,
                                          seller_id integer NOT NULL
);


ALTER TABLE public.bill_robotpayment OWNER TO postgres;

--
-- Name: bill_robotpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bill_robotpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.bill_robotpayment_id_seq OWNER TO postgres;

--
-- Name: bill_robotpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bill_robotpayment_id_seq OWNED BY public.bill_robotpayment.id;


--
-- Name: bill_robotsubs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_robotsubs (
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       id character varying(31) NOT NULL,
                                       status character varying(15) NOT NULL,
                                       assign_at timestamp(6) with time zone,
                                       start_at timestamp(6) with time zone,
                                       end_at timestamp(6) with time zone,
                                       type character varying(15) NOT NULL,
                                       price character varying(63),
                                       pricing character varying(255) NOT NULL,
                                       distributed_pricing character varying(255) NOT NULL,
                                       allocated_pricing character varying(255) NOT NULL,
                                       client_id integer,
                                       distributor_id integer,
                                       employee_id integer,
                                       seller_id integer
);


ALTER TABLE public.bill_robotsubs OWNER TO postgres;

--
-- Name: bill_seller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill_seller (
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    id integer NOT NULL,
                                    name character varying(127) NOT NULL,
                                    balance numeric(12,2) NOT NULL,
                                    distributor_id integer NOT NULL
);


ALTER TABLE public.bill_seller OWNER TO postgres;

--
-- Name: ccs_notifyinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ccs_notifyinfo (
                                       id integer NOT NULL,
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       box_id character varying(31),
                                       camera_id integer,
                                       user_id integer NOT NULL,
                                       types character varying(10)[] NOT NULL
);


ALTER TABLE public.ccs_notifyinfo OWNER TO postgres;

--
-- Name: ccs_notifyinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ccs_notifyinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ccs_notifyinfo_id_seq OWNER TO postgres;

--
-- Name: ccs_notifyinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ccs_notifyinfo_id_seq OWNED BY public.ccs_notifyinfo.id;


--
-- Name: ccs_rawevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ccs_rawevent (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id bigint NOT NULL,
                                     uuid uuid NOT NULL,
                                     types character varying(1023) NOT NULL,
                                     mark character varying(15) NOT NULL,
                                     data bytea NOT NULL,
                                     camera_id integer NOT NULL,
                                     user_id integer,
                                     ended_at timestamp(6) with time zone NOT NULL,
                                     started_at timestamp(6) with time zone NOT NULL,
                                     box_id character varying(31),
                                     org_id integer,
                                     site_id integer,
                                     raw_media bytea NOT NULL
);


ALTER TABLE public.ccs_rawevent OWNER TO postgres;

--
-- Name: ccs_rawevent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ccs_rawevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ccs_rawevent_id_seq OWNER TO postgres;

--
-- Name: ccs_rawevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ccs_rawevent_id_seq OWNED BY public.ccs_rawevent.id;


--
-- Name: ccs_sample; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ccs_sample (
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   id bigint NOT NULL,
                                   started_at timestamp(6) with time zone NOT NULL,
                                   ended_at timestamp(6) with time zone NOT NULL,
                                   data character varying(1023) NOT NULL,
                                   media character varying(1275) NOT NULL,
                                   types character varying(1023) NOT NULL,
                                   expiration integer NOT NULL,
                                   expired_at timestamp(6) with time zone,
                                   uuid uuid NOT NULL,
                                   status character varying(15) NOT NULL,
                                   mark character varying(15) NOT NULL,
                                   camera_id integer NOT NULL,
                                   user_id integer
);


ALTER TABLE public.ccs_sample OWNER TO postgres;

--
-- Name: ccs_sample_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ccs_sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ccs_sample_id_seq OWNER TO postgres;

--
-- Name: ccs_sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ccs_sample_id_seq OWNED BY public.ccs_sample.id;


--
-- Name: ccs_usersite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ccs_usersite (
                                     id integer NOT NULL,
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     site_id integer NOT NULL,
                                     user_id integer NOT NULL
);


ALTER TABLE public.ccs_usersite OWNER TO postgres;

--
-- Name: ccs_usersite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ccs_usersite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.ccs_usersite_id_seq OWNER TO postgres;

--
-- Name: ccs_usersite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ccs_usersite_id_seq OWNED BY public.ccs_usersite.id;


--
-- Name: channel_forwardaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel_forwardaction (
                                              id integer NOT NULL,
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              action_id integer NOT NULL,
                                              resource_type_id integer NOT NULL
);


ALTER TABLE public.channel_forwardaction OWNER TO postgres;

--
-- Name: channel_forwardaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_forwardaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.channel_forwardaction_id_seq OWNER TO postgres;

--
-- Name: channel_forwardaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_forwardaction_id_seq OWNED BY public.channel_forwardaction.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
                                         id integer NOT NULL,
                                         action_time timestamp(6) with time zone NOT NULL,
                                         object_id text,
                                         object_repr character varying(200) NOT NULL,
                                         action_flag smallint NOT NULL,
                                         change_message text NOT NULL,
                                         content_type_id integer,
                                         user_id integer NOT NULL,
                                         CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
                                            id integer NOT NULL,
                                            app_label character varying(100) NOT NULL,
                                            model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
                                          id integer NOT NULL,
                                          app character varying(255) NOT NULL,
                                          name character varying(255) NOT NULL,
                                          applied timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
                                       session_key character varying(40) NOT NULL,
                                       session_data text NOT NULL,
                                       expire_date timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: face_eventandtrackingobject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_eventandtrackingobject (
                                                    id integer NOT NULL,
                                                    created_at timestamp(6) with time zone NOT NULL,
                                                    updated_at timestamp(6) with time zone NOT NULL,
                                                    event_id integer NOT NULL,
                                                    tracking_object_id uuid NOT NULL
);


ALTER TABLE public.face_eventandtrackingobject OWNER TO postgres;

--
-- Name: face_eventandtrackingobject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_eventandtrackingobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_eventandtrackingobject_id_seq OWNER TO postgres;

--
-- Name: face_eventandtrackingobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_eventandtrackingobject_id_seq OWNED BY public.face_eventandtrackingobject.id;


--
-- Name: face_face; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_face (
                                  created_at timestamp(6) with time zone NOT NULL,
                                  updated_at timestamp(6) with time zone NOT NULL,
                                  id uuid NOT NULL,
                                  person_id character varying(32) NOT NULL,
                                  bounding_box character varying(127) NOT NULL,
                                  confidence double precision NOT NULL,
                                  pose character varying(127) NOT NULL,
                                  quality character varying(127) NOT NULL,
                                  landmarks character varying(511) NOT NULL,
                                  note character varying(127) NOT NULL,
                                  lib_id uuid NOT NULL,
                                  img character varying(511) NOT NULL,
                                  tracking_object_id uuid
);


ALTER TABLE public.face_face OWNER TO postgres;

--
-- Name: face_facelib; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_facelib (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id uuid NOT NULL,
                                     name character varying(31) NOT NULL,
                                     comment character varying(127) NOT NULL,
                                     similarity_threshold double precision NOT NULL,
                                     arn character varying(128) NOT NULL,
                                     face_model_version character varying(7) NOT NULL,
                                     organization_id integer NOT NULL,
                                     business_type integer NOT NULL
);


ALTER TABLE public.face_facelib OWNER TO postgres;

--
-- Name: face_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_group (
                                   id integer NOT NULL,
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   name character varying(127) NOT NULL,
                                   member_cnt integer NOT NULL,
                                   organization_id integer NOT NULL,
                                   parent_id integer,
                                   CONSTRAINT face_group_member_cnt_check CHECK ((member_cnt >= 0))
);


ALTER TABLE public.face_group OWNER TO postgres;

--
-- Name: face_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_group_id_seq OWNER TO postgres;

--
-- Name: face_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_group_id_seq OWNED BY public.face_group.id;


--
-- Name: face_groupuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_groupuser (
                                       id integer NOT NULL,
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       group_id integer NOT NULL,
                                       user_id integer NOT NULL
);


ALTER TABLE public.face_groupuser OWNER TO postgres;

--
-- Name: face_groupuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_groupuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_groupuser_id_seq OWNER TO postgres;

--
-- Name: face_groupuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_groupuser_id_seq OWNED BY public.face_groupuser.id;


--
-- Name: face_humancountinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_humancountinfo (
                                            id integer NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            organization_id integer NOT NULL,
                                            site_id integer NOT NULL,
                                            camera_id integer NOT NULL,
                                            started_at timestamp(6) with time zone NOT NULL,
                                            ended_at timestamp(6) with time zone NOT NULL,
                                            in_num integer NOT NULL,
                                            out_num integer NOT NULL,
                                            box_id character varying(31)
);


ALTER TABLE public.face_humancountinfo OWNER TO postgres;

--
-- Name: face_humancountinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_humancountinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_humancountinfo_id_seq OWNER TO postgres;

--
-- Name: face_humancountinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_humancountinfo_id_seq OWNED BY public.face_humancountinfo.id;


--
-- Name: face_humancountmediafile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_humancountmediafile (
                                                 id integer NOT NULL,
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 file character varying(511) NOT NULL,
                                                 type character varying(255) NOT NULL,
                                                 human_count_info_id integer NOT NULL
);


ALTER TABLE public.face_humancountmediafile OWNER TO postgres;

--
-- Name: face_humancountmediafile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_humancountmediafile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_humancountmediafile_id_seq OWNER TO postgres;

--
-- Name: face_humancountmediafile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_humancountmediafile_id_seq OWNED BY public.face_humancountmediafile.id;


--
-- Name: face_humancountrealtimeinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_humancountrealtimeinfo (
                                                    id integer NOT NULL,
                                                    created_at timestamp(6) with time zone NOT NULL,
                                                    updated_at timestamp(6) with time zone NOT NULL,
                                                    organization_id integer NOT NULL,
                                                    site_id integer NOT NULL,
                                                    camera_id integer NOT NULL,
                                                    box_id character varying(31) NOT NULL,
                                                    "time" timestamp(6) with time zone NOT NULL,
                                                    in_num integer NOT NULL,
                                                    out_num integer NOT NULL,
                                                    initial_number integer NOT NULL,
                                                    notification_threshold integer,
                                                    capacity integer NOT NULL,
                                                    threshold double precision NOT NULL
);


ALTER TABLE public.face_humancountrealtimeinfo OWNER TO postgres;

--
-- Name: face_humancountrealtimeinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_humancountrealtimeinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.face_humancountrealtimeinfo_id_seq OWNER TO postgres;

--
-- Name: face_humancountrealtimeinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_humancountrealtimeinfo_id_seq OWNED BY public.face_humancountrealtimeinfo.id;


--
-- Name: face_questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_questionnaire (
                                           created_at timestamp(6) with time zone NOT NULL,
                                           updated_at timestamp(6) with time zone NOT NULL,
                                           id bigint NOT NULL,
                                           organization_id integer NOT NULL,
                                           name character varying(63) NOT NULL,
                                           contents character varying(8191) NOT NULL,
                                           instructions character varying(1024),
                                           failure_template character varying(8191) NOT NULL,
                                           success_template character varying(8191) NOT NULL,
                                           expired_delta integer NOT NULL,
                                           terms_of_use character varying(1024),
                                           groups character varying(8191),
                                           type character varying(31) NOT NULL,
                                           user_id integer,
                                           emails character varying(1023) NOT NULL,
                                           notification boolean NOT NULL,
                                           sms character varying(1023) NOT NULL
);


ALTER TABLE public.face_questionnaire OWNER TO postgres;

--
-- Name: face_questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_questionnaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_questionnaire_id_seq OWNER TO postgres;

--
-- Name: face_questionnaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_questionnaire_id_seq OWNED BY public.face_questionnaire.id;


--
-- Name: face_questionnaireresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_questionnaireresult (
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 id bigint NOT NULL,
                                                 answer character varying(8191) NOT NULL,
                                                 questionnaire_id integer NOT NULL,
                                                 organization_id integer NOT NULL,
                                                 status character varying(15) NOT NULL,
                                                 group_id integer,
                                                 passed boolean NOT NULL,
                                                 question character varying(8191) NOT NULL
);


ALTER TABLE public.face_questionnaireresult OWNER TO postgres;

--
-- Name: face_questionnaireresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_questionnaireresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_questionnaireresult_id_seq OWNER TO postgres;

--
-- Name: face_questionnaireresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_questionnaireresult_id_seq OWNED BY public.face_questionnaireresult.id;


--
-- Name: face_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_settings (
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      organization_id integer NOT NULL,
                                      track_temp_normal_event boolean NOT NULL,
                                      track_temp_abnormal_event boolean NOT NULL,
                                      track_face_tracking_event boolean NOT NULL,
                                      track_by smallint NOT NULL,
                                      track_mask boolean NOT NULL,
                                      identify_by character varying(20)[] NOT NULL
);


ALTER TABLE public.face_settings OWNER TO postgres;

--
-- Name: face_throttlecounters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_throttlecounters (
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              id bigint NOT NULL,
                                              org_id integer NOT NULL,
                                              counter integer NOT NULL,
                                              date timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.face_throttlecounters OWNER TO postgres;

--
-- Name: face_throttlecounters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.face_throttlecounters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.face_throttlecounters_id_seq OWNER TO postgres;

--
-- Name: face_throttlecounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.face_throttlecounters_id_seq OWNED BY public.face_throttlecounters.id;


--
-- Name: face_trackingobject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.face_trackingobject (
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            id uuid NOT NULL,
                                            img character varying(511) NOT NULL,
                                            enabled_tracking boolean NOT NULL,
                                            note character varying(127) NOT NULL,
                                            params character varying(4095) NOT NULL,
                                            organization_id integer NOT NULL,
                                            data jsonb NOT NULL,
                                            main_face_id character varying(40) NOT NULL,
                                            group_id integer,
                                            first_name character varying(32) NOT NULL,
                                            rfid character varying(127) NOT NULL,
                                            last_name character varying(32) NOT NULL,
                                            middle_name character varying(32) NOT NULL,
                                            phone_number character varying(127) NOT NULL,
                                            person_id character varying(127) NOT NULL,
                                            site_id integer,
                                            latest_visit_time timestamp(6) with time zone,
                                            latest_index_face_time timestamp(6) with time zone
);


ALTER TABLE public.face_trackingobject OWNER TO postgres;

--
-- Name: guard_beatglobal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_beatglobal (
                                         id integer NOT NULL,
                                         task_type character varying(64) NOT NULL,
                                         last_execution_time integer NOT NULL,
                                         execute_channel character varying(64) NOT NULL
);


ALTER TABLE public.guard_beatglobal OWNER TO postgres;

--
-- Name: guard_beatglobal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_beatglobal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_beatglobal_id_seq OWNER TO postgres;

--
-- Name: guard_beatglobal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_beatglobal_id_seq OWNED BY public.guard_beatglobal.id;


--
-- Name: guard_beatjob; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_beatjob (
                                      id integer NOT NULL,
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      task_type character varying(64) NOT NULL,
                                      task_params character varying(4096),
                                      task_name character varying(128) NOT NULL,
                                      task_status smallint NOT NULL,
                                      msg character varying(512),
                                      execution_cnt smallint NOT NULL,
                                      task_date date NOT NULL,
                                      expection_time integer NOT NULL,
                                      runtime integer,
                                      start_time timestamp(6) with time zone,
                                      end_time timestamp(6) with time zone,
                                      execute_channel character varying(64) NOT NULL
);


ALTER TABLE public.guard_beatjob OWNER TO postgres;

--
-- Name: guard_beatjob_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_beatjob_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_beatjob_id_seq OWNER TO postgres;

--
-- Name: guard_beatjob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_beatjob_id_seq OWNED BY public.guard_beatjob.id;


--
-- Name: guard_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_case (
                                   id integer NOT NULL,
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   viewed boolean NOT NULL,
                                   status character varying(31) NOT NULL,
                                   action character varying(31) NOT NULL,
                                   report character varying(1023),
                                   priority character varying(31) NOT NULL,
                                   type character varying(31) NOT NULL,
                                   customer_id integer,
                                   event_id integer,
                                   guard_id integer,
                                   incident_id character varying(255),
                                   inspection_id integer,
                                   operator_id integer,
                                   robot_id character varying(31),
                                   brand_type smallint NOT NULL
);


ALTER TABLE public.guard_case OWNER TO postgres;

--
-- Name: guard_case_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_case_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_case_id_seq OWNER TO postgres;

--
-- Name: guard_case_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_case_id_seq OWNED BY public.guard_case.id;


--
-- Name: guard_caseexportconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_caseexportconfig (
                                               created_at timestamp(6) with time zone NOT NULL,
                                               updated_at timestamp(6) with time zone NOT NULL,
                                               id bigint NOT NULL,
                                               file_type character varying(8) NOT NULL,
                                               export_frequency character varying(7) NOT NULL,
                                               emails character varying(1023) NOT NULL,
                                               user_id integer NOT NULL,
                                               notify_time integer NOT NULL,
                                               valid_duration integer NOT NULL,
                                               weekday smallint,
                                               box_ids character varying(1023) NOT NULL,
                                               export_fields character varying(256),
                                               site_ids character varying(1023) NOT NULL,
                                               end_time integer,
                                               start_time integer,
                                               custom_setting character varying(512)
);


ALTER TABLE public.guard_caseexportconfig OWNER TO postgres;

--
-- Name: guard_caseexportconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_caseexportconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guard_caseexportconfig_id_seq OWNER TO postgres;

--
-- Name: guard_caseexportconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_caseexportconfig_id_seq OWNED BY public.guard_caseexportconfig.id;


--
-- Name: guard_caseexportrecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_caseexportrecord (
                                               created_at timestamp(6) with time zone NOT NULL,
                                               updated_at timestamp(6) with time zone NOT NULL,
                                               id bigint NOT NULL,
                                               user_id integer NOT NULL,
                                               file_type character varying(8) NOT NULL,
                                               year integer NOT NULL,
                                               month integer NOT NULL,
                                               expired_time timestamp(6) with time zone NOT NULL,
                                               url character varying(1023),
                                               export_config_id integer,
                                               box_ids character varying(1023) NOT NULL,
                                               site_ids character varying(1023) NOT NULL,
                                               file character varying(512) NOT NULL
);


ALTER TABLE public.guard_caseexportrecord OWNER TO postgres;

--
-- Name: guard_caseexportrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_caseexportrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guard_caseexportrecord_id_seq OWNER TO postgres;

--
-- Name: guard_caseexportrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_caseexportrecord_id_seq OWNED BY public.guard_caseexportrecord.id;


--
-- Name: guard_casehistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_casehistory (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          data character varying(1023) NOT NULL,
                                          action character varying(31) NOT NULL,
                                          case_id integer NOT NULL,
                                          robot_id character varying(31),
                                          user_id integer
);


ALTER TABLE public.guard_casehistory OWNER TO postgres;

--
-- Name: guard_casehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_casehistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_casehistory_id_seq OWNER TO postgres;

--
-- Name: guard_casehistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_casehistory_id_seq OWNED BY public.guard_casehistory.id;


--
-- Name: guard_casemedium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_casemedium (
                                         id integer NOT NULL,
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         type character varying(255) NOT NULL,
                                         file character varying(511) NOT NULL,
                                         data character varying(255) NOT NULL,
                                         case_id integer NOT NULL
);


ALTER TABLE public.guard_casemedium OWNER TO postgres;

--
-- Name: guard_casemedium_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_casemedium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_casemedium_id_seq OWNER TO postgres;

--
-- Name: guard_casemedium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_casemedium_id_seq OWNED BY public.guard_casemedium.id;


--
-- Name: guard_guard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_guard (
                                    id integer NOT NULL,
                                    phone_number character varying(255) NOT NULL,
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    phone_number_verified boolean NOT NULL,
                                    organization_id integer NOT NULL
);


ALTER TABLE public.guard_guard OWNER TO postgres;

--
-- Name: guard_guardadmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_guardadmin (
                                         id integer NOT NULL,
                                         phone_number character varying(255) NOT NULL,
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         phone_number_verified boolean NOT NULL,
                                         organization_id integer NOT NULL
);


ALTER TABLE public.guard_guardadmin OWNER TO postgres;

--
-- Name: guard_guardcompany; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_guardcompany (
                                           id integer NOT NULL,
                                           title character varying(127) NOT NULL,
                                           created_at timestamp(6) with time zone NOT NULL,
                                           updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE public.guard_guardcompany OWNER TO postgres;

--
-- Name: guard_guardcompany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_guardcompany_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_guardcompany_id_seq OWNER TO postgres;

--
-- Name: guard_guardcompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_guardcompany_id_seq OWNED BY public.guard_guardcompany.id;


--
-- Name: guard_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_incident (
                                       system_id character varying(255) NOT NULL,
                                       incident_type character varying(255) NOT NULL,
                                       trigger_time timestamp(6) with time zone NOT NULL,
                                       manual boolean NOT NULL,
                                       id character varying(255) NOT NULL,
                                       trigger_id character varying(255),
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       meta_data character varying(4095) NOT NULL
);


ALTER TABLE public.guard_incident OWNER TO postgres;

--
-- Name: guard_monitoringoperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_monitoringoperator (
                                                 id integer NOT NULL,
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 phone_number character varying(255) NOT NULL,
                                                 phone_number_verified boolean NOT NULL,
                                                 organization_id integer NOT NULL
);


ALTER TABLE public.guard_monitoringoperator OWNER TO postgres;

--
-- Name: guard_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_note (
                                   id integer NOT NULL,
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   note character varying(1023),
                                   case_id integer NOT NULL,
                                   user_id integer NOT NULL
);


ALTER TABLE public.guard_note OWNER TO postgres;

--
-- Name: guard_note_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.guard_note_id_seq OWNER TO postgres;

--
-- Name: guard_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_note_id_seq OWNED BY public.guard_note.id;


--
-- Name: guard_siteoperation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guard_siteoperation (
                                            id bigint NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            guard_company_id integer NOT NULL,
                                            operator_id integer NOT NULL,
                                            site_id integer NOT NULL
);


ALTER TABLE public.guard_siteoperation OWNER TO postgres;

--
-- Name: guard_siteoperation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guard_siteoperation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guard_siteoperation_id_seq OWNER TO postgres;

--
-- Name: guard_siteoperation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guard_siteoperation_id_seq OWNED BY public.guard_siteoperation.id;


--
-- Name: license_plate_blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.license_plate_blacklist (
                                                id integer NOT NULL,
                                                created_at timestamp(6) with time zone NOT NULL,
                                                updated_at timestamp(6) with time zone NOT NULL,
                                                organization_id integer NOT NULL,
                                                site_id integer,
                                                license_plate character varying(32) NOT NULL,
                                                CONSTRAINT license_plate_blacklist_organization_id_check CHECK ((organization_id >= 0)),
                                                CONSTRAINT license_plate_blacklist_site_id_check CHECK ((site_id >= 0))
);


ALTER TABLE public.license_plate_blacklist OWNER TO postgres;

--
-- Name: license_plate_blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.license_plate_blacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.license_plate_blacklist_id_seq OWNER TO postgres;

--
-- Name: license_plate_blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.license_plate_blacklist_id_seq OWNED BY public.license_plate_blacklist.id;


--
-- Name: logic_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_agent (
                                    id integer NOT NULL,
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    user_id integer NOT NULL
);


ALTER TABLE public.logic_agent OWNER TO postgres;

--
-- Name: logic_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_agent_id_seq OWNER TO postgres;

--
-- Name: logic_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_agent_id_seq OWNED BY public.logic_agent.id;


--
-- Name: logic_box; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_box (
                                  created_at timestamp(6) with time zone NOT NULL,
                                  updated_at timestamp(6) with time zone NOT NULL,
                                  id character varying(31) NOT NULL,
                                  timezone character varying(63) NOT NULL,
                                  ip_address inet NOT NULL,
                                  max_camera_cnt integer NOT NULL,
                                  max_detect_cnt integer NOT NULL,
                                  paid_cnt integer NOT NULL,
                                  camera_cnt integer NOT NULL,
                                  state character varying(31) NOT NULL,
                                  billing character varying(31) NOT NULL,
                                  meta character varying(511) NOT NULL,
                                  type character varying(63) NOT NULL,
                                  scene bigint NOT NULL,
                                  sequence bigint NOT NULL,
                                  upload_video_expire integer NOT NULL,
                                  upload_event_expire integer NOT NULL,
                                  session_id character varying(63) NOT NULL,
                                  version bigint NOT NULL,
                                  site_id integer,
                                  user_id integer,
                                  last_offline_timestamp bigint,
                                  offline_grace_minute bigint NOT NULL,
                                  name character varying(127),
                                  stream_type character varying(31) NOT NULL
);


ALTER TABLE public.logic_box OWNER TO postgres;

--
-- Name: logic_boxlocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_boxlocation (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          ip character varying(32) NOT NULL,
                                          location character varying(64) NOT NULL,
                                          box_id character varying(31) NOT NULL
);


ALTER TABLE public.logic_boxlocation OWNER TO postgres;

--
-- Name: logic_boxlocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_boxlocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_boxlocation_id_seq OWNER TO postgres;

--
-- Name: logic_boxlocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_boxlocation_id_seq OWNED BY public.logic_boxlocation.id;


--
-- Name: logic_camera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_camera (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id bigint NOT NULL,
                                     saving_at timestamp(6) with time zone,
                                     name character varying(127) NOT NULL,
                                     raw_address character varying(32) NOT NULL,
                                     mac_address character varying(255) NOT NULL,
                                     type character varying(31) NOT NULL,
                                     brand character varying(31) NOT NULL,
                                     username character varying(127) NOT NULL,
                                     password character varying(63) NOT NULL,
                                     uri character varying(255) NOT NULL,
                                     hd_uri character varying(255) NOT NULL,
                                     mode character varying(15) NOT NULL,
                                     upload_video_enabled boolean NOT NULL,
                                     location character varying(63),
                                     detect_params character varying(1023) NOT NULL,
                                     snapshot character varying(511) NOT NULL,
                                     state character varying(31) NOT NULL,
                                     notifies character varying(31) NOT NULL,
                                     should_push boolean NOT NULL,
                                     version bigint NOT NULL,
                                     note character varying(1023) NOT NULL,
                                     default_params character varying(1024) NOT NULL,
                                     user_id integer NOT NULL,
                                     box_id character varying(31),
                                     serial_no character varying(63) NOT NULL,
                                     brand_type smallint NOT NULL,
                                     firmware_version_id integer,
                                     sd_uri character varying(255) NOT NULL
);


ALTER TABLE public.logic_camera OWNER TO postgres;

--
-- Name: logic_camera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_camera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_camera_id_seq OWNER TO postgres;

--
-- Name: logic_camera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_camera_id_seq OWNED BY public.logic_camera.id;


--
-- Name: logic_camerafirmwareversion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_camerafirmwareversion (
                                                    id integer NOT NULL,
                                                    created_at timestamp(6) with time zone NOT NULL,
                                                    updated_at timestamp(6) with time zone NOT NULL,
                                                    version character varying(127) NOT NULL
);


ALTER TABLE public.logic_camerafirmwareversion OWNER TO postgres;

--
-- Name: logic_camerafirmwareversion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_camerafirmwareversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_camerafirmwareversion_id_seq OWNER TO postgres;

--
-- Name: logic_camerafirmwareversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_camerafirmwareversion_id_seq OWNED BY public.logic_camerafirmwareversion.id;


--
-- Name: logic_cameralocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_cameralocation (
                                             id integer NOT NULL,
                                             created_at timestamp(6) with time zone NOT NULL,
                                             updated_at timestamp(6) with time zone NOT NULL,
                                             map_id character varying(255) NOT NULL,
                                             location character varying(255) NOT NULL,
                                             camera_id bigint NOT NULL
);


ALTER TABLE public.logic_cameralocation OWNER TO postgres;

--
-- Name: logic_cameralocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_cameralocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_cameralocation_id_seq OWNER TO postgres;

--
-- Name: logic_cameralocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_cameralocation_id_seq OWNED BY public.logic_cameralocation.id;


--
-- Name: logic_camerasavedvideo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_camerasavedvideo (
                                               created_at timestamp(6) with time zone NOT NULL,
                                               updated_at timestamp(6) with time zone NOT NULL,
                                               id bigint NOT NULL,
                                               started_at timestamp(6) with time zone NOT NULL,
                                               ended_at timestamp(6) with time zone NOT NULL,
                                               snapshot character varying(511) NOT NULL,
                                               video character varying(511) NOT NULL,
                                               camera_id bigint NOT NULL
);


ALTER TABLE public.logic_camerasavedvideo OWNER TO postgres;

--
-- Name: logic_camerasavedvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_camerasavedvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_camerasavedvideo_id_seq OWNER TO postgres;

--
-- Name: logic_camerasavedvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_camerasavedvideo_id_seq OWNED BY public.logic_camerasavedvideo.id;


--
-- Name: logic_cameratrackingobject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_cameratrackingobject (
                                                   id integer NOT NULL,
                                                   created_at timestamp(6) with time zone NOT NULL,
                                                   updated_at timestamp(6) with time zone NOT NULL,
                                                   camera_id integer NOT NULL,
                                                   tracking_object_id uuid NOT NULL
);


ALTER TABLE public.logic_cameratrackingobject OWNER TO postgres;

--
-- Name: logic_cameratrackingobject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_cameratrackingobject_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_cameratrackingobject_id_seq OWNER TO postgres;

--
-- Name: logic_cameratrackingobject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_cameratrackingobject_id_seq OWNED BY public.logic_cameratrackingobject.id;


--
-- Name: logic_cameravideo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_cameravideo (
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          id bigint NOT NULL,
                                          started_at timestamp(6) with time zone NOT NULL,
                                          ended_at timestamp(6) with time zone NOT NULL,
                                          size integer NOT NULL,
                                          video character varying(511) NOT NULL,
                                          camera_id bigint NOT NULL,
                                          uuid character varying(64)
);


ALTER TABLE public.logic_cameravideo OWNER TO postgres;

--
-- Name: logic_cameravideo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_cameravideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_cameravideo_id_seq OWNER TO postgres;

--
-- Name: logic_cameravideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_cameravideo_id_seq OWNED BY public.logic_cameravideo.id;


--
-- Name: logic_customizedalgorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_customizedalgorithm (
                                                  id integer NOT NULL,
                                                  created_at timestamp(6) with time zone NOT NULL,
                                                  updated_at timestamp(6) with time zone NOT NULL,
                                                  index integer NOT NULL,
                                                  code_name character varying(133) NOT NULL,
                                                  name character varying(128) NOT NULL,
                                                  algorithm_id integer NOT NULL,
                                                  organization_id integer NOT NULL,
                                                  CONSTRAINT logic_customizedalgorithm_index_check CHECK ((index >= 0))
);


ALTER TABLE public.logic_customizedalgorithm OWNER TO postgres;

--
-- Name: logic_customizedalgorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_customizedalgorithm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_customizedalgorithm_id_seq OWNER TO postgres;

--
-- Name: logic_customizedalgorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_customizedalgorithm_id_seq OWNED BY public.logic_customizedalgorithm.id;


--
-- Name: logic_customizedeventtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_customizedeventtype (
                                                  id integer NOT NULL,
                                                  created_at timestamp(6) with time zone NOT NULL,
                                                  updated_at timestamp(6) with time zone NOT NULL,
                                                  index integer NOT NULL,
                                                  code_name character varying(127) NOT NULL,
                                                  name character varying(32) NOT NULL,
                                                  customized_algorithm_id integer NOT NULL,
                                                  event_type_id integer NOT NULL,
                                                  organization_id integer NOT NULL,
                                                  CONSTRAINT logic_customizedeventtype_index_check CHECK ((index >= 0))
);


ALTER TABLE public.logic_customizedeventtype OWNER TO postgres;

--
-- Name: logic_customizedeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_customizedeventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_customizedeventtype_id_seq OWNER TO postgres;

--
-- Name: logic_customizedeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_customizedeventtype_id_seq OWNED BY public.logic_customizedeventtype.id;


--
-- Name: logic_departmentmanager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_departmentmanager (
                                                created_at timestamp(6) with time zone NOT NULL,
                                                updated_at timestamp(6) with time zone NOT NULL,
                                                id integer NOT NULL,
                                                phone character varying(31) NOT NULL,
                                                level integer NOT NULL,
                                                customer_id integer NOT NULL
);


ALTER TABLE public.logic_departmentmanager OWNER TO postgres;

--
-- Name: logic_devicekey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_devicekey (
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        id character varying(31) NOT NULL,
                                        signature bytea NOT NULL,
                                        public_key character varying(1023) NOT NULL
);


ALTER TABLE public.logic_devicekey OWNER TO postgres;

--
-- Name: logic_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_event (
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    id bigint NOT NULL,
                                    source character varying(15) NOT NULL,
                                    robot_camera character varying(15),
                                    location character varying(63),
                                    types character varying(1023) NOT NULL,
                                    types_bits bit(2048) NOT NULL,
                                    started_at timestamp(6) with time zone NOT NULL,
                                    ended_at timestamp(6) with time zone NOT NULL,
                                    data character varying(8191) NOT NULL,
                                    marked boolean NOT NULL,
                                    viewed boolean NOT NULL,
                                    annotate character varying(7) NOT NULL,
                                    tag character varying(255) NOT NULL,
                                    camera_id bigint,
                                    site_id integer,
                                    robot_id character varying(31),
                                    metadata jsonb NOT NULL,
                                    tracking_object_id uuid
);


ALTER TABLE public.logic_event OWNER TO postgres;

--
-- Name: logic_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_event_id_seq OWNER TO postgres;

--
-- Name: logic_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_event_id_seq OWNED BY public.logic_event.id;


--
-- Name: logic_eventbackup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_eventbackup (
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          id bigint NOT NULL,
                                          origin_id bigint NOT NULL,
                                          source character varying(15) NOT NULL,
                                          robot_camera character varying(15),
                                          location character varying(63),
                                          types character varying(1023) NOT NULL,
                                          types_bits bit(2048) NOT NULL,
                                          started_at timestamp(6) with time zone NOT NULL,
                                          ended_at timestamp(6) with time zone NOT NULL,
                                          data character varying(8191) NOT NULL,
                                          marked boolean NOT NULL,
                                          viewed boolean NOT NULL,
                                          annotate character varying(7) NOT NULL,
                                          tag character varying(255) NOT NULL,
                                          camera_id bigint,
                                          robot_id character varying(31),
                                          metadata character varying(8191) NOT NULL
);


ALTER TABLE public.logic_eventbackup OWNER TO postgres;

--
-- Name: logic_eventbackup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_eventbackup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_eventbackup_id_seq OWNER TO postgres;

--
-- Name: logic_eventbackup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_eventbackup_id_seq OWNED BY public.logic_eventbackup.id;


--
-- Name: logic_inspection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_inspection (
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         id bigint NOT NULL,
                                         camera character varying(15) NOT NULL,
                                         started_at timestamp(6) with time zone NOT NULL,
                                         ended_at timestamp(6) with time zone NOT NULL,
                                         location character varying(63),
                                         way_point jsonb,
                                         type character varying(255) NOT NULL,
                                         algo_types character varying(1023) NOT NULL,
                                         robot_id character varying(31) NOT NULL,
                                         target_id integer,
                                         route_id character varying(64) NOT NULL,
                                         map_id character varying(127) NOT NULL,
                                         site_id integer,
                                         analysis_results character varying(1023) NOT NULL,
                                         routine_id character varying(127) NOT NULL,
                                         routine_execution_id character varying(127),
                                         routine_state character varying(20) NOT NULL,
                                         routine_state_synced boolean NOT NULL,
                                         uuid character varying(64) NOT NULL
);


ALTER TABLE public.logic_inspection OWNER TO postgres;

--
-- Name: logic_inspection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_inspection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_inspection_id_seq OWNER TO postgres;

--
-- Name: logic_inspection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_inspection_id_seq OWNED BY public.logic_inspection.id;


--
-- Name: logic_inspectmedium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_inspectmedium (
                                            created_at timestamp(6) with time zone NOT NULL,
                                            updated_at timestamp(6) with time zone NOT NULL,
                                            id bigint NOT NULL,
                                            name character varying(255) NOT NULL,
                                            file character varying(511) NOT NULL,
                                            data character varying(255) NOT NULL,
                                            inspection_id bigint NOT NULL
);


ALTER TABLE public.logic_inspectmedium OWNER TO postgres;

--
-- Name: logic_inspectmedium_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_inspectmedium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_inspectmedium_id_seq OWNER TO postgres;

--
-- Name: logic_inspectmedium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_inspectmedium_id_seq OWNED BY public.logic_inspectmedium.id;


--
-- Name: logic_invitation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_invitation (
                                         id character varying(31) NOT NULL,
                                         note character varying(127) NOT NULL
);


ALTER TABLE public.logic_invitation OWNER TO postgres;

--
-- Name: logic_ipwhitelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_ipwhitelist (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          ip character varying(32) NOT NULL,
                                          user_id integer NOT NULL
);


ALTER TABLE public.logic_ipwhitelist OWNER TO postgres;

--
-- Name: logic_ipwhitelist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_ipwhitelist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_ipwhitelist_id_seq OWNER TO postgres;

--
-- Name: logic_ipwhitelist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_ipwhitelist_id_seq OWNED BY public.logic_ipwhitelist.id;


--
-- Name: logic_locationeventblacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_locationeventblacklist (
                                                     id integer NOT NULL,
                                                     created_at timestamp(6) with time zone NOT NULL,
                                                     updated_at timestamp(6) with time zone NOT NULL,
                                                     location character varying(64) NOT NULL,
                                                     code_name character varying(127) NOT NULL,
                                                     event_type_id integer NOT NULL
);


ALTER TABLE public.logic_locationeventblacklist OWNER TO postgres;

--
-- Name: logic_locationeventblacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_locationeventblacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_locationeventblacklist_id_seq OWNER TO postgres;

--
-- Name: logic_locationeventblacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_locationeventblacklist_id_seq OWNED BY public.logic_locationeventblacklist.id;


--
-- Name: logic_manualcleanuptask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_manualcleanuptask (
                                                id integer NOT NULL,
                                                created_at timestamp(6) with time zone NOT NULL,
                                                updated_at timestamp(6) with time zone NOT NULL,
                                                task_id uuid NOT NULL,
                                                started_at timestamp(6) with time zone NOT NULL,
                                                ended_at timestamp(6) with time zone,
                                                status character varying(31) NOT NULL,
                                                result character varying(31) NOT NULL,
                                                params character varying(255) NOT NULL,
                                                organization_id integer NOT NULL,
                                                user_id integer NOT NULL
);


ALTER TABLE public.logic_manualcleanuptask OWNER TO postgres;

--
-- Name: logic_manualcleanuptask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_manualcleanuptask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_manualcleanuptask_id_seq OWNER TO postgres;

--
-- Name: logic_manualcleanuptask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_manualcleanuptask_id_seq OWNED BY public.logic_manualcleanuptask.id;


--
-- Name: logic_medium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_medium (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id bigint NOT NULL,
                                     name character varying(255) NOT NULL,
                                     file character varying(511) NOT NULL,
                                     data character varying(255) NOT NULL,
                                     event_id bigint NOT NULL
);


ALTER TABLE public.logic_medium OWNER TO postgres;

--
-- Name: logic_medium_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_medium_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_medium_id_seq OWNER TO postgres;

--
-- Name: logic_medium_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_medium_id_seq OWNED BY public.logic_medium.id;


--
-- Name: logic_mediumbackup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_mediumbackup (
                                           created_at timestamp(6) with time zone NOT NULL,
                                           updated_at timestamp(6) with time zone NOT NULL,
                                           id bigint NOT NULL,
                                           origin_id bigint NOT NULL,
                                           name character varying(255) NOT NULL,
                                           file character varying(511) NOT NULL,
                                           data character varying(255) NOT NULL,
                                           event_id bigint NOT NULL
);


ALTER TABLE public.logic_mediumbackup OWNER TO postgres;

--
-- Name: logic_mediumbackup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_mediumbackup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_mediumbackup_id_seq OWNER TO postgres;

--
-- Name: logic_mediumbackup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_mediumbackup_id_seq OWNED BY public.logic_mediumbackup.id;


--
-- Name: logic_monitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_monitor (
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      id integer NOT NULL,
                                      version bigint NOT NULL,
                                      box_version bigint NOT NULL,
                                      robot_version bigint NOT NULL,
                                      camera_version bigint NOT NULL,
                                      event_version bigint NOT NULL,
                                      route_version bigint NOT NULL
);


ALTER TABLE public.logic_monitor OWNER TO postgres;

--
-- Name: logic_notifyrule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_notifyrule (
                                         id integer NOT NULL,
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         site_id integer,
                                         box_id character varying(31),
                                         camera_id integer,
                                         sms character varying(2048),
                                         email character varying(2048),
                                         webhook character varying(2048),
                                         websocket character varying(2048),
                                         event_types character varying(128) NOT NULL,
                                         organization_id integer NOT NULL
);


ALTER TABLE public.logic_notifyrule OWNER TO postgres;

--
-- Name: logic_notifyrule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_notifyrule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_notifyrule_id_seq OWNER TO postgres;

--
-- Name: logic_notifyrule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_notifyrule_id_seq OWNED BY public.logic_notifyrule.id;


--
-- Name: logic_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_organization (
                                           id integer NOT NULL,
                                           created_at timestamp(6) with time zone NOT NULL,
                                           updated_at timestamp(6) with time zone NOT NULL,
                                           code_name character varying(128) NOT NULL,
                                           name character varying(128) NOT NULL,
                                           event_type_mode character varying(31) NOT NULL,
                                           owner_id integer NOT NULL,
                                           analytics_robot_lidar_expire integer NOT NULL,
                                           analytics_robot_logs_expire integer NOT NULL,
                                           camera_preview_expire integer NOT NULL,
                                           camera_samples_expire integer NOT NULL,
                                           events_expire integer NOT NULL,
                                           robot_assets_expire integer NOT NULL,
                                           saved_videos_expire integer NOT NULL,
                                           snaps_expire integer NOT NULL,
                                           videos_expire integer NOT NULL,
                                           enable_tracking boolean NOT NULL,
                                           target_reference_image_expire integer NOT NULL,
                                           email_template text,
                                           disable_case_notification boolean NOT NULL,
                                           disable_event_notification boolean NOT NULL,
                                           use_event_2 boolean NOT NULL,
                                           face_throttle_num integer NOT NULL
);


ALTER TABLE public.logic_organization OWNER TO postgres;

--
-- Name: logic_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_organization_id_seq OWNER TO postgres;

--
-- Name: logic_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_organization_id_seq OWNED BY public.logic_organization.id;


--
-- Name: logic_organizationuistrategy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_organizationuistrategy (
                                                     created_at timestamp(6) with time zone NOT NULL,
                                                     updated_at timestamp(6) with time zone NOT NULL,
                                                     id bigint NOT NULL,
                                                     organization_id integer NOT NULL,
                                                     strategy_id integer NOT NULL
);


ALTER TABLE public.logic_organizationuistrategy OWNER TO postgres;

--
-- Name: logic_organizationuistrategy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_organizationuistrategy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_organizationuistrategy_id_seq OWNER TO postgres;

--
-- Name: logic_organizationuistrategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_organizationuistrategy_id_seq OWNED BY public.logic_organizationuistrategy.id;


--
-- Name: logic_patrol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_patrol (
                                     task_id bigint NOT NULL,
                                     route_id bigint NOT NULL
);


ALTER TABLE public.logic_patrol OWNER TO postgres;

--
-- Name: logic_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_person (
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     id integer NOT NULL,
                                     phone character varying(128) NOT NULL
);


ALTER TABLE public.logic_person OWNER TO postgres;

--
-- Name: logic_robot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_robot (
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    id character varying(31) NOT NULL,
                                    saving_at timestamp(6) with time zone,
                                    robox_status character varying(31) NOT NULL,
                                    status character varying(31) NOT NULL,
                                    state character varying(511) NOT NULL,
                                    meta character varying(511) NOT NULL,
                                    snapshot character varying(511) NOT NULL,
                                    snapshots character varying(2047) NOT NULL,
                                    timezone character varying(63) NOT NULL,
                                    ip_address inet NOT NULL,
                                    type character varying(63) NOT NULL,
                                    name character varying(127) NOT NULL,
                                    detect_params character varying(4095) NOT NULL,
                                    patrol_params character varying(4095) NOT NULL,
                                    mac_params character varying(16384) NOT NULL,
                                    cameras character varying(511) NOT NULL,
                                    auto_speak character varying(15) NOT NULL,
                                    notifies character varying(31) NOT NULL,
                                    upload_video_enabled boolean NOT NULL,
                                    upload_video_expire integer NOT NULL,
                                    upload_event_expire integer NOT NULL,
                                    scene bigint NOT NULL,
                                    sequence bigint NOT NULL,
                                    session_id character varying(63) NOT NULL,
                                    version bigint NOT NULL,
                                    enable_escalation boolean NOT NULL,
                                    should_push boolean NOT NULL,
                                    site_id integer,
                                    user_id integer
);


ALTER TABLE public.logic_robot OWNER TO postgres;

--
-- Name: logic_robotsavedvideo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_robotsavedvideo (
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              id bigint NOT NULL,
                                              camera character varying(15) NOT NULL,
                                              started_at timestamp(6) with time zone NOT NULL,
                                              ended_at timestamp(6) with time zone NOT NULL,
                                              snapshot character varying(511) NOT NULL,
                                              video character varying(511) NOT NULL,
                                              robot_id character varying(31) NOT NULL
);


ALTER TABLE public.logic_robotsavedvideo OWNER TO postgres;

--
-- Name: logic_robotsavedvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_robotsavedvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_robotsavedvideo_id_seq OWNER TO postgres;

--
-- Name: logic_robotsavedvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_robotsavedvideo_id_seq OWNED BY public.logic_robotsavedvideo.id;


--
-- Name: logic_robotsnap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_robotsnap (
                                        id integer NOT NULL,
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        camera character varying(15) NOT NULL,
                                        "timestamp" timestamp(6) with time zone NOT NULL,
                                        type character varying(7) NOT NULL,
                                        file character varying(511) NOT NULL,
                                        robot_id character varying(31) NOT NULL
);


ALTER TABLE public.logic_robotsnap OWNER TO postgres;

--
-- Name: logic_robotsnap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_robotsnap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_robotsnap_id_seq OWNER TO postgres;

--
-- Name: logic_robotsnap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_robotsnap_id_seq OWNED BY public.logic_robotsnap.id;


--
-- Name: logic_robotvideo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_robotvideo (
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         id bigint NOT NULL,
                                         camera character varying(15) NOT NULL,
                                         started_at timestamp(6) with time zone NOT NULL,
                                         ended_at timestamp(6) with time zone NOT NULL,
                                         size integer NOT NULL,
                                         video character varying(511) NOT NULL,
                                         robot_id character varying(31) NOT NULL
);


ALTER TABLE public.logic_robotvideo OWNER TO postgres;

--
-- Name: logic_robotvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_robotvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_robotvideo_id_seq OWNER TO postgres;

--
-- Name: logic_robotvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_robotvideo_id_seq OWNED BY public.logic_robotvideo.id;


--
-- Name: logic_route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_route (
                                    id bigint NOT NULL,
                                    name character varying(63) NOT NULL,
                                    points text NOT NULL,
                                    checkpoints text NOT NULL,
                                    version bigint NOT NULL,
                                    user_id integer NOT NULL
);


ALTER TABLE public.logic_route OWNER TO postgres;

--
-- Name: logic_route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_route_id_seq OWNER TO postgres;

--
-- Name: logic_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_route_id_seq OWNED BY public.logic_route.id;


--
-- Name: logic_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_rule (
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   id bigint NOT NULL,
                                   unique_id uuid NOT NULL,
                                   name character varying(63) NOT NULL,
                                   mode character varying(15) NOT NULL,
                                   version bigint NOT NULL,
                                   start_at integer NOT NULL,
                                   end_at integer NOT NULL,
                                   region character varying(1023) NOT NULL,
                                   algos character varying(1023) NOT NULL,
                                   params character varying(4096) NOT NULL,
                                   algo character varying(127) NOT NULL,
                                   schedule character varying(4096) NOT NULL,
                                   params_base character varying(127) NOT NULL,
                                   camera_id bigint NOT NULL
);


ALTER TABLE public.logic_rule OWNER TO postgres;

--
-- Name: logic_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_rule_id_seq OWNER TO postgres;

--
-- Name: logic_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_rule_id_seq OWNED BY public.logic_rule.id;


--
-- Name: logic_sharing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_sharing (
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      id uuid NOT NULL,
                                      expiration timestamp(6) with time zone NOT NULL,
                                      enabled boolean NOT NULL,
                                      event_id character varying(64) NOT NULL,
                                      type character varying(31) NOT NULL,
                                      url character varying(255) NOT NULL,
                                      note character varying(127) NOT NULL,
                                      snapshot character varying(4096) NOT NULL,
                                      camera_saved_video_id integer,
                                      organization_id integer NOT NULL,
                                      site_id integer NOT NULL,
                                      user_id integer NOT NULL
);


ALTER TABLE public.logic_sharing OWNER TO postgres;

--
-- Name: logic_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_site (
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   id bigint NOT NULL,
                                   name character varying(512) NOT NULL,
                                   location character varying(1023) NOT NULL,
                                   note character varying(1023) NOT NULL,
                                   polygons character varying(1023) NOT NULL,
                                   customer_id integer NOT NULL,
                                   city character varying(31) NOT NULL,
                                   county character varying(31) NOT NULL,
                                   label character varying(255) NOT NULL,
                                   province character varying(31) NOT NULL
);


ALTER TABLE public.logic_site OWNER TO postgres;

--
-- Name: logic_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_site_id_seq OWNER TO postgres;

--
-- Name: logic_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_site_id_seq OWNED BY public.logic_site.id;


--
-- Name: logic_sitemanagement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_sitemanagement (
                                             created_at timestamp(6) with time zone NOT NULL,
                                             updated_at timestamp(6) with time zone NOT NULL,
                                             id bigint NOT NULL,
                                             site_id integer NOT NULL,
                                             site_manager_id integer NOT NULL
);


ALTER TABLE public.logic_sitemanagement OWNER TO postgres;

--
-- Name: logic_sitemanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_sitemanagement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_sitemanagement_id_seq OWNER TO postgres;

--
-- Name: logic_sitemanagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_sitemanagement_id_seq OWNED BY public.logic_sitemanagement.id;


--
-- Name: logic_sitemanager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_sitemanager (
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          id integer NOT NULL,
                                          phone character varying(31) NOT NULL,
                                          level integer NOT NULL,
                                          customer_id integer NOT NULL
);


ALTER TABLE public.logic_sitemanager OWNER TO postgres;

--
-- Name: logic_snap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_snap (
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   id bigint NOT NULL,
                                   "timestamp" timestamp(6) with time zone NOT NULL,
                                   file character varying(511) NOT NULL,
                                   type character varying(7) NOT NULL,
                                   camera_id bigint NOT NULL
);


ALTER TABLE public.logic_snap OWNER TO postgres;

--
-- Name: logic_snap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_snap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_snap_id_seq OWNER TO postgres;

--
-- Name: logic_snap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_snap_id_seq OWNED BY public.logic_snap.id;


--
-- Name: logic_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_task (
                                   created_at timestamp(6) with time zone NOT NULL,
                                   updated_at timestamp(6) with time zone NOT NULL,
                                   id bigint NOT NULL,
                                   type character varying(7) NOT NULL,
                                   name character varying(63) NOT NULL,
                                   mode character varying(15) NOT NULL,
                                   start_at integer NOT NULL,
                                   end_at integer NOT NULL,
                                   version bigint NOT NULL,
                                   polymorphic_ctype_id integer,
                                   robot_id character varying(31) NOT NULL
);


ALTER TABLE public.logic_task OWNER TO postgres;

--
-- Name: logic_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_task_id_seq OWNER TO postgres;

--
-- Name: logic_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_task_id_seq OWNED BY public.logic_task.id;


--
-- Name: logic_thermalcamerasettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_thermalcamerasettings (
                                                    id integer NOT NULL,
                                                    created_at timestamp(6) with time zone NOT NULL,
                                                    updated_at timestamp(6) with time zone NOT NULL,
                                                    raw_data jsonb NOT NULL,
                                                    questionnaire_detail_img_en character varying(511),
                                                    questionnaire_detail_img_en_name character varying(63) NOT NULL,
                                                    questionnaire_detail_en character varying(8191) NOT NULL,
                                                    questionnaire_detail_img_sp character varying(511),
                                                    questionnaire_detail_img_sp_name character varying(63) NOT NULL,
                                                    questionnaire_detail_sp character varying(8191) NOT NULL,
                                                    questionnaire_ok_img_en character varying(511),
                                                    questionnaire_ok_img_en_name character varying(63) NOT NULL,
                                                    questionnaire_ok_img_sp character varying(511),
                                                    questionnaire_ok_img_sp_name character varying(63) NOT NULL,
                                                    questionnaire_update_time timestamp(6) with time zone,
                                                    splash character varying(511),
                                                    splash_name character varying(63) NOT NULL,
                                                    splash_update_time timestamp(6) with time zone,
                                                    camera_id integer NOT NULL,
                                                    questionnaire_detail_img_en_md5 character varying(63) NOT NULL,
                                                    questionnaire_detail_img_sp_md5 character varying(63) NOT NULL,
                                                    splash_md5 character varying(63) NOT NULL
);


ALTER TABLE public.logic_thermalcamerasettings OWNER TO postgres;

--
-- Name: logic_thermalcamerasettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_thermalcamerasettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_thermalcamerasettings_id_seq OWNER TO postgres;

--
-- Name: logic_thermalcamerasettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_thermalcamerasettings_id_seq OWNED BY public.logic_thermalcamerasettings.id;


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_thermalcamerasettingsbatchupdaterecord (
                                                                     id integer NOT NULL,
                                                                     created_at timestamp(6) with time zone NOT NULL,
                                                                     updated_at timestamp(6) with time zone NOT NULL,
                                                                     batch_id uuid NOT NULL,
                                                                     raw_data jsonb NOT NULL,
                                                                     camera_ids jsonb NOT NULL,
                                                                     camera_status jsonb NOT NULL,
                                                                     record_status character varying(15) NOT NULL,
                                                                     user_id integer NOT NULL
);


ALTER TABLE public.logic_thermalcamerasettingsbatchupdaterecord OWNER TO postgres;

--
-- Name: logic_thermalcamerasettingsbatchupdaterecord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_thermalcamerasettingsbatchupdaterecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_thermalcamerasettingsbatchupdaterecord_id_seq OWNER TO postgres;

--
-- Name: logic_thermalcamerasettingsbatchupdaterecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_thermalcamerasettingsbatchupdaterecord_id_seq OWNED BY public.logic_thermalcamerasettingsbatchupdaterecord.id;


--
-- Name: logic_thermalcamerasettingscheckrecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_thermalcamerasettingscheckrecord (
                                                               id integer NOT NULL,
                                                               created_at timestamp(6) with time zone NOT NULL,
                                                               updated_at timestamp(6) with time zone NOT NULL,
                                                               check_id uuid NOT NULL,
                                                               camera_ids jsonb NOT NULL,
                                                               camera_status jsonb NOT NULL,
                                                               record_status character varying(15) NOT NULL,
                                                               user_id integer NOT NULL
);


ALTER TABLE public.logic_thermalcamerasettingscheckrecord OWNER TO postgres;

--
-- Name: logic_thermalcamerasettingscheckrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_thermalcamerasettingscheckrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_thermalcamerasettingscheckrecord_id_seq OWNER TO postgres;

--
-- Name: logic_thermalcamerasettingscheckrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_thermalcamerasettingscheckrecord_id_seq OWNED BY public.logic_thermalcamerasettingscheckrecord.id;


--
-- Name: logic_uistrategy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_uistrategy (
                                         created_at timestamp(6) with time zone NOT NULL,
                                         updated_at timestamp(6) with time zone NOT NULL,
                                         id bigint NOT NULL,
                                         name character varying(128) NOT NULL,
                                         description text NOT NULL
);


ALTER TABLE public.logic_uistrategy OWNER TO postgres;

--
-- Name: logic_uistrategy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_uistrategy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_uistrategy_id_seq OWNER TO postgres;

--
-- Name: logic_uistrategy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_uistrategy_id_seq OWNED BY public.logic_uistrategy.id;


--
-- Name: logic_waypoint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_waypoint (
                                       id integer NOT NULL,
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       name character varying(50) NOT NULL,
                                       x numeric(30,25) NOT NULL,
                                       y numeric(30,25) NOT NULL,
                                       map_id character varying(255),
                                       route_id character varying(20),
                                       status character varying(1023),
                                       predict_status character varying(1023),
                                       predict_status_updated_at timestamp(6) with time zone NOT NULL,
                                       store_type character varying(20),
                                       algo_types character varying(1023),
                                       site_id integer
);


ALTER TABLE public.logic_waypoint OWNER TO postgres;

--
-- Name: logic_waypoint_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_waypoint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_waypoint_id_seq OWNER TO postgres;

--
-- Name: logic_waypoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_waypoint_id_seq OWNED BY public.logic_waypoint.id;


--
-- Name: logic_waypointhistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_waypointhistory (
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              id bigint NOT NULL,
                                              status character varying(1023),
                                              predict_status character varying(1023),
                                              way_point_id integer
);


ALTER TABLE public.logic_waypointhistory OWNER TO postgres;

--
-- Name: logic_waypointhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_waypointhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logic_waypointhistory_id_seq OWNER TO postgres;

--
-- Name: logic_waypointhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_waypointhistory_id_seq OWNED BY public.logic_waypointhistory.id;


--
-- Name: logic_webhook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logic_webhook (
                                      id integer NOT NULL,
                                      type character varying(15) NOT NULL,
                                      url character varying(255) NOT NULL
);


ALTER TABLE public.logic_webhook OWNER TO postgres;

--
-- Name: logic_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logic_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.logic_webhook_id_seq OWNER TO postgres;

--
-- Name: logic_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logic_webhook_id_seq OWNED BY public.logic_webhook.id;


--
-- Name: mapping_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapping_map (
                                    id integer NOT NULL,
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    center_point character varying(511),
                                    initial_zoom smallint,
                                    min_zoom smallint,
                                    max_zoom smallint,
                                    data character varying(2047),
                                    image character varying(511),
                                    map_config_id integer NOT NULL,
                                    CONSTRAINT mapping_map_initial_zoom_check CHECK ((initial_zoom >= 0)),
                                    CONSTRAINT mapping_map_max_zoom_check CHECK ((max_zoom >= 0)),
                                    CONSTRAINT mapping_map_min_zoom_check CHECK ((min_zoom >= 0))
);


ALTER TABLE public.mapping_map OWNER TO postgres;

--
-- Name: mapping_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapping_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.mapping_map_id_seq OWNER TO postgres;

--
-- Name: mapping_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapping_map_id_seq OWNED BY public.mapping_map.id;


--
-- Name: mapping_mapconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapping_mapconfig (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          map_type character varying(31) NOT NULL,
                                          config character varying(511),
                                          is_default boolean NOT NULL,
                                          organization_id integer NOT NULL
);


ALTER TABLE public.mapping_mapconfig OWNER TO postgres;

--
-- Name: mapping_mapconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapping_mapconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.mapping_mapconfig_id_seq OWNER TO postgres;

--
-- Name: mapping_mapconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapping_mapconfig_id_seq OWNED BY public.mapping_mapconfig.id;


--
-- Name: mapping_maptarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapping_maptarget (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          map_id integer NOT NULL,
                                          target_id integer NOT NULL
);


ALTER TABLE public.mapping_maptarget OWNER TO postgres;

--
-- Name: mapping_maptarget_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapping_maptarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.mapping_maptarget_id_seq OWNER TO postgres;

--
-- Name: mapping_maptarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapping_maptarget_id_seq OWNED BY public.mapping_maptarget.id;


--
-- Name: mapping_sitemap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapping_sitemap (
                                        id integer NOT NULL,
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        name character varying(127) NOT NULL,
                                        index integer NOT NULL,
                                        map_id integer NOT NULL,
                                        site_id integer NOT NULL
);


ALTER TABLE public.mapping_sitemap OWNER TO postgres;

--
-- Name: mapping_sitemap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapping_sitemap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.mapping_sitemap_id_seq OWNER TO postgres;

--
-- Name: mapping_sitemap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapping_sitemap_id_seq OWNED BY public.mapping_sitemap.id;


--
-- Name: mapping_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapping_target (
                                       id integer NOT NULL,
                                       created_at timestamp(6) with time zone NOT NULL,
                                       updated_at timestamp(6) with time zone NOT NULL,
                                       target_type character varying(31) NOT NULL,
                                       auto_threshold integer,
                                       point character varying(511),
                                       polygons character varying(65535),
                                       "position" character varying(2047),
                                       name character varying(255) NOT NULL,
                                       camera_id integer,
                                       domain_id integer,
                                       robot_id character varying(31),
                                       site_id integer
);


ALTER TABLE public.mapping_target OWNER TO postgres;

--
-- Name: mapping_target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapping_target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.mapping_target_id_seq OWNER TO postgres;

--
-- Name: mapping_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapping_target_id_seq OWNED BY public.mapping_target.id;


--
-- Name: monitor_center_business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_business (
                                                id integer NOT NULL,
                                                name character varying(31) NOT NULL,
                                                "desc" character varying(63) NOT NULL,
                                                logo character varying(255),
                                                logo_small character varying(255)
);


ALTER TABLE public.monitor_center_business OWNER TO postgres;

--
-- Name: monitor_center_business_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_business_id_seq OWNER TO postgres;

--
-- Name: monitor_center_business_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_business_id_seq OWNED BY public.monitor_center_business.id;


--
-- Name: monitor_center_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_channel (
                                               id integer NOT NULL,
                                               enabled boolean NOT NULL,
                                               created_at timestamp(6) with time zone NOT NULL,
                                               name character varying(127) NOT NULL,
                                               type character varying(31) NOT NULL,
                                               args text
);


ALTER TABLE public.monitor_center_channel OWNER TO postgres;

--
-- Name: monitor_center_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_channel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_channel_id_seq OWNER TO postgres;

--
-- Name: monitor_center_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_channel_id_seq OWNED BY public.monitor_center_channel.id;


--
-- Name: monitor_center_customalgo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_customalgo (
                                                  id integer NOT NULL,
                                                  algo character varying(31) NOT NULL,
                                                  label character varying(31) NOT NULL,
                                                  camera_id integer,
                                                  site_id integer NOT NULL
);


ALTER TABLE public.monitor_center_customalgo OWNER TO postgres;

--
-- Name: monitor_center_customalgo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_customalgo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_customalgo_id_seq OWNER TO postgres;

--
-- Name: monitor_center_customalgo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_customalgo_id_seq OWNED BY public.monitor_center_customalgo.id;


--
-- Name: monitor_center_customalgonotify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_customalgonotify (
                                                        id integer NOT NULL,
                                                        name character varying(127) NOT NULL,
                                                        "interval" integer NOT NULL,
                                                        phone character varying(1023) NOT NULL,
                                                        level integer NOT NULL,
                                                        site_id integer NOT NULL
);


ALTER TABLE public.monitor_center_customalgonotify OWNER TO postgres;

--
-- Name: monitor_center_customalgonotify_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_customalgonotify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_customalgonotify_id_seq OWNER TO postgres;

--
-- Name: monitor_center_customalgonotify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_customalgonotify_id_seq OWNED BY public.monitor_center_customalgonotify.id;


--
-- Name: monitor_center_device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_device (
                                              id integer NOT NULL,
                                              device_id character varying(63) NOT NULL,
                                              created_at timestamp(6) with time zone NOT NULL,
                                              updated_at timestamp(6) with time zone NOT NULL,
                                              user_id integer NOT NULL
);


ALTER TABLE public.monitor_center_device OWNER TO postgres;

--
-- Name: monitor_center_device_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_device_id_seq OWNER TO postgres;

--
-- Name: monitor_center_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_device_id_seq OWNED BY public.monitor_center_device.id;


--
-- Name: monitor_center_eventext; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_eventext (
                                                event_ptr_id integer NOT NULL,
                                                event_id integer NOT NULL,
                                                status character varying(31) NOT NULL,
                                                pushed boolean NOT NULL,
                                                texted boolean NOT NULL,
                                                processed_at timestamp(6) with time zone,
                                                closed_at timestamp(6) with time zone,
                                                related_event_id integer,
                                                remark character varying(255),
                                                uuid uuid NOT NULL
);


ALTER TABLE public.monitor_center_eventext OWNER TO postgres;

--
-- Name: monitor_center_fmevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_fmevent (
                                               id character varying(40) NOT NULL,
                                               event_id integer NOT NULL
);


ALTER TABLE public.monitor_center_fmevent OWNER TO postgres;

--
-- Name: monitor_center_orgext; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_orgext (
                                              id integer NOT NULL,
                                              notify_interval integer NOT NULL,
                                              sms_allowed boolean NOT NULL,
                                              sign_name character varying(255) NOT NULL,
                                              template_code character varying(63) NOT NULL,
                                              webhook character varying(1023) NOT NULL
);


ALTER TABLE public.monitor_center_orgext OWNER TO postgres;

--
-- Name: monitor_center_robotincidentnotifyrecord; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_robotincidentnotifyrecord (
                                                                 id integer NOT NULL,
                                                                 created_at timestamp(6) with time zone NOT NULL,
                                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                                 notify_type character varying(10) NOT NULL,
                                                                 send_time timestamp(6) with time zone,
                                                                 send_status character varying(10) NOT NULL,
                                                                 send_data text NOT NULL,
                                                                 send_result_detail text NOT NULL,
                                                                 incident_id character varying(255) NOT NULL,
                                                                 robot_id character varying(31) NOT NULL,
                                                                 user_id integer NOT NULL
);


ALTER TABLE public.monitor_center_robotincidentnotifyrecord OWNER TO postgres;

--
-- Name: monitor_center_robotincidentnotifyrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_robotincidentnotifyrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_robotincidentnotifyrecord_id_seq OWNER TO postgres;

--
-- Name: monitor_center_robotincidentnotifyrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_robotincidentnotifyrecord_id_seq OWNED BY public.monitor_center_robotincidentnotifyrecord.id;


--
-- Name: monitor_center_robotnotifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_robotnotifier (
                                                     id integer NOT NULL,
                                                     created_at timestamp(6) with time zone NOT NULL,
                                                     updated_at timestamp(6) with time zone NOT NULL,
                                                     types character varying(10)[],
                                                     enabled boolean NOT NULL,
                                                     robot_id character varying(31) NOT NULL,
                                                     user_id integer NOT NULL
);


ALTER TABLE public.monitor_center_robotnotifier OWNER TO postgres;

--
-- Name: monitor_center_robotnotifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_robotnotifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_robotnotifier_id_seq OWNER TO postgres;

--
-- Name: monitor_center_robotnotifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_robotnotifier_id_seq OWNED BY public.monitor_center_robotnotifier.id;


--
-- Name: monitor_center_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_rule (
                                            id integer NOT NULL,
                                            enabled boolean NOT NULL,
                                            created_at timestamp(6) with time zone NOT NULL,
                                            name character varying(127) NOT NULL,
                                            expression character varying(4095) NOT NULL,
                                            channel_id integer
);


ALTER TABLE public.monitor_center_rule OWNER TO postgres;

--
-- Name: monitor_center_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_rule_id_seq OWNER TO postgres;

--
-- Name: monitor_center_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_rule_id_seq OWNED BY public.monitor_center_rule.id;


--
-- Name: monitor_center_sitefloorvideo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_sitefloorvideo (
                                                      id integer NOT NULL,
                                                      created_at timestamp(6) with time zone NOT NULL,
                                                      updated_at timestamp(6) with time zone NOT NULL,
                                                      floor smallint NOT NULL,
                                                      date_group date NOT NULL,
                                                      taken_at date NOT NULL,
                                                      pc_file character varying(511),
                                                      mobile_file character varying(511),
                                                      new_floor_id integer NOT NULL,
                                                      site_id integer NOT NULL
);


ALTER TABLE public.monitor_center_sitefloorvideo OWNER TO postgres;

--
-- Name: monitor_center_sitefloorvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monitor_center_sitefloorvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.monitor_center_sitefloorvideo_id_seq OWNER TO postgres;

--
-- Name: monitor_center_sitefloorvideo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monitor_center_sitefloorvideo_id_seq OWNED BY public.monitor_center_sitefloorvideo.id;


--
-- Name: monitor_center_userext; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.monitor_center_userext (
                                               id integer NOT NULL,
                                               name character varying(31) NOT NULL,
                                               current_authority character varying(31) NOT NULL,
                                               business_id integer
);


ALTER TABLE public.monitor_center_userext OWNER TO postgres;

--
-- Name: org_domain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_domain (
                                   id integer NOT NULL,
                                   name character varying(127) NOT NULL,
                                   code_name character varying(63) NOT NULL,
                                   lft integer NOT NULL,
                                   rght integer NOT NULL,
                                   tree_id integer NOT NULL,
                                   level integer NOT NULL,
                                   domain_type_id integer NOT NULL,
                                   organization_id integer NOT NULL,
                                   parent_id integer,
                                   map_id integer,
                                   CONSTRAINT org_domain_level_check CHECK ((level >= 0)),
                                   CONSTRAINT org_domain_lft_check CHECK ((lft >= 0)),
                                   CONSTRAINT org_domain_rght_check CHECK ((rght >= 0)),
                                   CONSTRAINT org_domain_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.org_domain OWNER TO postgres;

--
-- Name: org_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_domain_id_seq OWNER TO postgres;

--
-- Name: org_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_domain_id_seq OWNED BY public.org_domain.id;


--
-- Name: org_domainsite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_domainsite (
                                       id integer NOT NULL,
                                       domain_id integer NOT NULL,
                                       site_id integer NOT NULL
);


ALTER TABLE public.org_domainsite OWNER TO postgres;

--
-- Name: org_domainsite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_domainsite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_domainsite_id_seq OWNER TO postgres;

--
-- Name: org_domainsite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_domainsite_id_seq OWNED BY public.org_domainsite.id;


--
-- Name: org_domaintype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_domaintype (
                                       id integer NOT NULL,
                                       code_name character varying(63) NOT NULL,
                                       name character varying(127) NOT NULL,
                                       is_leaf boolean NOT NULL,
                                       lft integer NOT NULL,
                                       rght integer NOT NULL,
                                       tree_id integer NOT NULL,
                                       level integer NOT NULL,
                                       organization_id integer NOT NULL,
                                       parent_id integer,
                                       CONSTRAINT org_domaintype_level_check CHECK ((level >= 0)),
                                       CONSTRAINT org_domaintype_lft_check CHECK ((lft >= 0)),
                                       CONSTRAINT org_domaintype_rght_check CHECK ((rght >= 0)),
                                       CONSTRAINT org_domaintype_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.org_domaintype OWNER TO postgres;

--
-- Name: org_domaintype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_domaintype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_domaintype_id_seq OWNER TO postgres;

--
-- Name: org_domaintype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_domaintype_id_seq OWNED BY public.org_domaintype.id;


--
-- Name: org_domainuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_domainuser (
                                       id integer NOT NULL,
                                       domain_id integer NOT NULL,
                                       user_id integer NOT NULL,
                                       in_charge boolean NOT NULL
);


ALTER TABLE public.org_domainuser OWNER TO postgres;

--
-- Name: org_domainuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_domainuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_domainuser_id_seq OWNER TO postgres;

--
-- Name: org_domainuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_domainuser_id_seq OWNED BY public.org_domainuser.id;


--
-- Name: org_organizationdelegate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_organizationdelegate (
                                                 id integer NOT NULL,
                                                 organization_id integer NOT NULL,
                                                 user_id integer NOT NULL
);


ALTER TABLE public.org_organizationdelegate OWNER TO postgres;

--
-- Name: org_organizationdelegate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_organizationdelegate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_organizationdelegate_id_seq OWNER TO postgres;

--
-- Name: org_organizationdelegate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_organizationdelegate_id_seq OWNED BY public.org_organizationdelegate.id;


--
-- Name: org_organizationuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_organizationuser (
                                             id integer NOT NULL,
                                             organization_id integer NOT NULL,
                                             user_id integer NOT NULL
);


ALTER TABLE public.org_organizationuser OWNER TO postgres;

--
-- Name: org_organizationuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_organizationuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_organizationuser_id_seq OWNER TO postgres;

--
-- Name: org_organizationuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_organizationuser_id_seq OWNED BY public.org_organizationuser.id;


--
-- Name: org_usernode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.org_usernode (
                                     id integer NOT NULL,
                                     lft integer NOT NULL,
                                     rght integer NOT NULL,
                                     tree_id integer NOT NULL,
                                     level integer NOT NULL,
                                     parent_id integer,
                                     user_id integer NOT NULL,
                                     CONSTRAINT org_usernode_level_check CHECK ((level >= 0)),
                                     CONSTRAINT org_usernode_lft_check CHECK ((lft >= 0)),
                                     CONSTRAINT org_usernode_rght_check CHECK ((rght >= 0)),
                                     CONSTRAINT org_usernode_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.org_usernode OWNER TO postgres;

--
-- Name: org_usernode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.org_usernode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.org_usernode_id_seq OWNER TO postgres;

--
-- Name: org_usernode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.org_usernode_id_seq OWNED BY public.org_usernode.id;


--
-- Name: patrol_algoconfig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_algoconfig (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          waypoint_action character varying(31) NOT NULL,
                                          params character varying(4095) NOT NULL,
                                          thresholds character varying(1023) NOT NULL,
                                          schedules character varying(1023) NOT NULL,
                                          fetch_task_count smallint NOT NULL,
                                          enabled boolean NOT NULL,
                                          algo_id integer NOT NULL,
                                          target_id integer NOT NULL,
                                          CONSTRAINT patrol_algoconfig_fetch_task_count_check CHECK ((fetch_task_count >= 0))
);


ALTER TABLE public.patrol_algoconfig OWNER TO postgres;

--
-- Name: patrol_algoconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_algoconfig_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_algoconfig_id_seq OWNER TO postgres;

--
-- Name: patrol_algoconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_algoconfig_id_seq OWNED BY public.patrol_algoconfig.id;


--
-- Name: patrol_algoreference; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_algoreference (
                                             id integer NOT NULL,
                                             created_at timestamp(6) with time zone NOT NULL,
                                             updated_at timestamp(6) with time zone NOT NULL,
                                             map_id character varying(127) NOT NULL,
                                             route_id character varying(127) NOT NULL,
                                             ref_cache character varying(4095) NOT NULL,
                                             ref_data character varying(10229) NOT NULL,
                                             algo_config_id integer NOT NULL
);


ALTER TABLE public.patrol_algoreference OWNER TO postgres;

--
-- Name: patrol_algoreference_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_algoreference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_algoreference_id_seq OWNER TO postgres;

--
-- Name: patrol_algoreference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_algoreference_id_seq OWNED BY public.patrol_algoreference.id;


--
-- Name: patrol_building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_building (
                                        id integer NOT NULL,
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        name character varying(127) NOT NULL,
                                        site_id integer NOT NULL
);


ALTER TABLE public.patrol_building OWNER TO postgres;

--
-- Name: patrol_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_building_id_seq OWNER TO postgres;

--
-- Name: patrol_building_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_building_id_seq OWNED BY public.patrol_building.id;


--
-- Name: patrol_detectiontask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_detectiontask (
                                             id integer NOT NULL,
                                             created_at timestamp(6) with time zone NOT NULL,
                                             updated_at timestamp(6) with time zone NOT NULL,
                                             algo_config_id bigint NOT NULL,
                                             algo_config_snapshot character varying(4095) NOT NULL,
                                             algo_cache character varying(4095) NOT NULL,
                                             analysis_results character varying(4095) NOT NULL,
                                             analysis_details character varying(4095) NOT NULL,
                                             review_status character varying(15) NOT NULL,
                                             review_result character varying(1023) NOT NULL,
                                             moderation_result boolean,
                                             moderation_types character varying(1023) NOT NULL,
                                             inspection_id integer NOT NULL,
                                             error_message character varying(1023) NOT NULL,
                                             target_id integer NOT NULL,
                                             algo_reference_id bigint
);


ALTER TABLE public.patrol_detectiontask OWNER TO postgres;

--
-- Name: patrol_detectiontask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_detectiontask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_detectiontask_id_seq OWNER TO postgres;

--
-- Name: patrol_detectiontask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_detectiontask_id_seq OWNED BY public.patrol_detectiontask.id;


--
-- Name: patrol_floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_floor (
                                     id integer NOT NULL,
                                     created_at timestamp(6) with time zone NOT NULL,
                                     updated_at timestamp(6) with time zone NOT NULL,
                                     name character varying(31) NOT NULL,
                                     floor smallint NOT NULL,
                                     full_route_config character varying(1023),
                                     building_id integer NOT NULL,
                                     elevator_reachable boolean NOT NULL,
                                     image character varying(511),
                                     map_id integer,
                                     zone_id character varying(31) NOT NULL
);


ALTER TABLE public.patrol_floor OWNER TO postgres;

--
-- Name: patrol_floor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_floor_id_seq OWNER TO postgres;

--
-- Name: patrol_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_floor_id_seq OWNED BY public.patrol_floor.id;


--
-- Name: patrol_target; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patrol_target (
                                      id integer NOT NULL,
                                      created_at timestamp(6) with time zone NOT NULL,
                                      updated_at timestamp(6) with time zone NOT NULL,
                                      name character varying(32) NOT NULL,
                                      floor smallint NOT NULL,
                                      serial_no character varying(64) NOT NULL,
                                      category character varying(32),
                                      longitude numeric(19,16),
                                      latitude numeric(19,16),
                                      preset_status character varying(63),
                                      "desc" character varying(255),
                                      latest_inspection_time timestamp(6) with time zone,
                                      site_id integer NOT NULL,
                                      visible boolean NOT NULL,
                                      uuid character varying(36),
                                      reference_image character varying(511),
                                      reference_image_updated_at timestamp(6) with time zone,
                                      new_floor_id integer,
                                      enabled boolean NOT NULL,
                                      robot_reachable boolean NOT NULL,
                                      algo_configs_exist boolean NOT NULL,
                                      algo_references_exist boolean NOT NULL,
                                      bound boolean NOT NULL,
                                      cstatus character varying(16)
);


ALTER TABLE public.patrol_target OWNER TO postgres;

--
-- Name: patrol_target_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patrol_target_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.patrol_target_id_seq OWNER TO postgres;

--
-- Name: patrol_target_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patrol_target_id_seq OWNED BY public.patrol_target.id;


--
-- Name: perm_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm_action (
                                    id integer NOT NULL,
                                    created_at timestamp(6) with time zone NOT NULL,
                                    updated_at timestamp(6) with time zone NOT NULL,
                                    name character varying(127) NOT NULL,
                                    code_name character varying(128) NOT NULL,
                                    resource_type_id integer NOT NULL
);


ALTER TABLE public.perm_action OWNER TO postgres;

--
-- Name: perm_action_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.perm_action_id_seq OWNER TO postgres;

--
-- Name: perm_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_action_id_seq OWNED BY public.perm_action.id;


--
-- Name: perm_resourcetype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm_resourcetype (
                                          id integer NOT NULL,
                                          created_at timestamp(6) with time zone NOT NULL,
                                          updated_at timestamp(6) with time zone NOT NULL,
                                          name character varying(127) NOT NULL,
                                          code_name character varying(128) NOT NULL,
                                          comment character varying(1024) NOT NULL
);


ALTER TABLE public.perm_resourcetype OWNER TO postgres;

--
-- Name: perm_resourcetype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_resourcetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.perm_resourcetype_id_seq OWNER TO postgres;

--
-- Name: perm_resourcetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_resourcetype_id_seq OWNED BY public.perm_resourcetype.id;


--
-- Name: perm_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm_role (
                                  id integer NOT NULL,
                                  created_at timestamp(6) with time zone NOT NULL,
                                  updated_at timestamp(6) with time zone NOT NULL,
                                  name character varying(1023) NOT NULL,
                                  code_name character varying(127) NOT NULL
);


ALTER TABLE public.perm_role OWNER TO postgres;

--
-- Name: perm_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.perm_role_id_seq OWNER TO postgres;

--
-- Name: perm_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_role_id_seq OWNED BY public.perm_role.id;


--
-- Name: perm_role_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm_role_users (
                                        id integer NOT NULL,
                                        role_id integer NOT NULL,
                                        user_id integer NOT NULL
);


ALTER TABLE public.perm_role_users OWNER TO postgres;

--
-- Name: perm_role_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.perm_role_users_id_seq OWNER TO postgres;

--
-- Name: perm_role_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_role_users_id_seq OWNED BY public.perm_role_users.id;


--
-- Name: perm_rolepolicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perm_rolepolicy (
                                        id integer NOT NULL,
                                        created_at timestamp(6) with time zone NOT NULL,
                                        updated_at timestamp(6) with time zone NOT NULL,
                                        resource_scope character varying(2048) NOT NULL,
                                        conditions character varying(255) NOT NULL,
                                        actions character varying(127)[] NOT NULL,
                                        comment character varying(1024) NOT NULL,
                                        resource_type_id integer NOT NULL,
                                        role_id integer NOT NULL
);


ALTER TABLE public.perm_rolepolicy OWNER TO postgres;

--
-- Name: perm_rolepolicy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perm_rolepolicy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.perm_rolepolicy_id_seq OWNER TO postgres;

--
-- Name: perm_rolepolicy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perm_rolepolicy_id_seq OWNED BY public.perm_rolepolicy.id;


--
-- Name: push_notifications_apnsdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_notifications_apnsdevice (
                                                      id integer NOT NULL,
                                                      name character varying(255),
                                                      active boolean NOT NULL,
                                                      date_created timestamp(6) with time zone,
                                                      application_id character varying(64),
                                                      device_id uuid,
                                                      registration_id character varying(200) NOT NULL,
                                                      user_id integer
);


ALTER TABLE public.push_notifications_apnsdevice OWNER TO postgres;

--
-- Name: push_notifications_apnsdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_notifications_apnsdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.push_notifications_apnsdevice_id_seq OWNER TO postgres;

--
-- Name: push_notifications_apnsdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_notifications_apnsdevice_id_seq OWNED BY public.push_notifications_apnsdevice.id;


--
-- Name: push_notifications_gcmdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_notifications_gcmdevice (
                                                     id integer NOT NULL,
                                                     name character varying(255),
                                                     active boolean NOT NULL,
                                                     date_created timestamp(6) with time zone,
                                                     application_id character varying(64),
                                                     device_id bigint,
                                                     registration_id text NOT NULL,
                                                     cloud_message_type character varying(3) NOT NULL,
                                                     user_id integer
);


ALTER TABLE public.push_notifications_gcmdevice OWNER TO postgres;

--
-- Name: push_notifications_gcmdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_notifications_gcmdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.push_notifications_gcmdevice_id_seq OWNER TO postgres;

--
-- Name: push_notifications_gcmdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_notifications_gcmdevice_id_seq OWNED BY public.push_notifications_gcmdevice.id;


--
-- Name: push_notifications_wnsdevice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.push_notifications_wnsdevice (
                                                     id integer NOT NULL,
                                                     name character varying(255),
                                                     active boolean NOT NULL,
                                                     date_created timestamp(6) with time zone,
                                                     application_id character varying(64),
                                                     device_id uuid,
                                                     registration_id text NOT NULL,
                                                     user_id integer
);


ALTER TABLE public.push_notifications_wnsdevice OWNER TO postgres;

--
-- Name: push_notifications_wnsdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.push_notifications_wnsdevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.push_notifications_wnsdevice_id_seq OWNER TO postgres;

--
-- Name: push_notifications_wnsdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.push_notifications_wnsdevice_id_seq OWNED BY public.push_notifications_wnsdevice.id;


--
-- Name: status_page_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_page_notification (
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 id uuid NOT NULL,
                                                 title character varying(256) NOT NULL,
                                                 content text NOT NULL,
                                                 date date NOT NULL,
                                                 date_time timestamp(6) with time zone NOT NULL,
                                                 duration integer NOT NULL,
                                                 state character varying(128) NOT NULL,
                                                 type character varying(128) NOT NULL
);


ALTER TABLE public.status_page_notification OWNER TO postgres;

--
-- Name: status_page_systemstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_page_systemstatus (
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 id uuid NOT NULL,
                                                 display_name character varying(31) NOT NULL,
                                                 operational boolean NOT NULL
);


ALTER TABLE public.status_page_systemstatus OWNER TO postgres;

--
-- Name: third_auth_thirdauthconf; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.third_auth_thirdauthconf (
                                                 created_at timestamp(6) with time zone NOT NULL,
                                                 updated_at timestamp(6) with time zone NOT NULL,
                                                 id bigint NOT NULL,
                                                 idp_name character varying(8) NOT NULL,
                                                 protocol character varying(8) NOT NULL,
                                                 active smallint NOT NULL,
                                                 enable_user_associate smallint NOT NULL,
                                                 identification character varying(32) NOT NULL,
                                                 organization_id integer NOT NULL,
                                                 sign_user_id integer,
                                                 settings character varying(4096) NOT NULL
);


ALTER TABLE public.third_auth_thirdauthconf OWNER TO postgres;

--
-- Name: third_auth_thirdauthconf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.third_auth_thirdauthconf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.third_auth_thirdauthconf_id_seq OWNER TO postgres;

--
-- Name: third_auth_thirdauthconf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.third_auth_thirdauthconf_id_seq OWNED BY public.third_auth_thirdauthconf.id;


--
-- Name: wechat_wechatuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wechat_wechatuser (
                                          id integer NOT NULL,
                                          openid character varying(63) NOT NULL,
                                          user_id integer NOT NULL
);


ALTER TABLE public.wechat_wechatuser OWNER TO postgres;

--
-- Name: wechat_wechatuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wechat_wechatuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.wechat_wechatuser_id_seq OWNER TO postgres;

--
-- Name: wechat_wechatuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wechat_wechatuser_id_seq OWNED BY public.wechat_wechatuser.id;


--
-- Name: agreement_agreement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_agreement ALTER COLUMN id SET DEFAULT nextval('public.agreement_agreement_id_seq'::regclass);


--
-- Name: agreement_useragreement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_useragreement ALTER COLUMN id SET DEFAULT nextval('public.agreement_useragreement_id_seq'::regclass);


--
-- Name: algorithm_algorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm ALTER COLUMN id SET DEFAULT nextval('public.algorithm_algorithm_id_seq'::regclass);


--
-- Name: algorithm_eventtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype ALTER COLUMN id SET DEFAULT nextval('public.algorithm_eventtype_id_seq'::regclass);


--
-- Name: algorithm_productalgorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_productalgorithm ALTER COLUMN id SET DEFAULT nextval('public.algorithm_productalgorithm_id_seq'::regclass);


--
-- Name: algorithm_producttype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_producttype ALTER COLUMN id SET DEFAULT nextval('public.algorithm_producttype_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: back_cameraprefix id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprefix ALTER COLUMN id SET DEFAULT nextval('public.back_cameraprefix_id_seq'::regclass);


--
-- Name: back_cameraprovider id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprovider ALTER COLUMN id SET DEFAULT nextval('public.back_cameraprovider_id_seq'::regclass);


--
-- Name: back_feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_feedback ALTER COLUMN id SET DEFAULT nextval('public.back_feedback_id_seq'::regclass);


--
-- Name: back_notification id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_notification ALTER COLUMN id SET DEFAULT nextval('public.back_notification_id_seq'::regclass);


--
-- Name: bill_boxpayment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment ALTER COLUMN id SET DEFAULT nextval('public.bill_boxpayment_id_seq'::regclass);


--
-- Name: bill_boxpricing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpricing ALTER COLUMN id SET DEFAULT nextval('public.bill_boxpricing_id_seq'::regclass);


--
-- Name: bill_client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client ALTER COLUMN id SET DEFAULT nextval('public.bill_client_id_seq'::regclass);


--
-- Name: bill_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_payment ALTER COLUMN id SET DEFAULT nextval('public.bill_payment_id_seq'::regclass);


--
-- Name: bill_robotpayment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment ALTER COLUMN id SET DEFAULT nextval('public.bill_robotpayment_id_seq'::regclass);


--
-- Name: ccs_notifyinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_notifyinfo ALTER COLUMN id SET DEFAULT nextval('public.ccs_notifyinfo_id_seq'::regclass);


--
-- Name: ccs_rawevent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent ALTER COLUMN id SET DEFAULT nextval('public.ccs_rawevent_id_seq'::regclass);


--
-- Name: ccs_sample id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_sample ALTER COLUMN id SET DEFAULT nextval('public.ccs_sample_id_seq'::regclass);


--
-- Name: ccs_usersite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_usersite ALTER COLUMN id SET DEFAULT nextval('public.ccs_usersite_id_seq'::regclass);


--
-- Name: channel_forwardaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_forwardaction ALTER COLUMN id SET DEFAULT nextval('public.channel_forwardaction_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: face_eventandtrackingobject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_eventandtrackingobject ALTER COLUMN id SET DEFAULT nextval('public.face_eventandtrackingobject_id_seq'::regclass);


--
-- Name: face_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_group ALTER COLUMN id SET DEFAULT nextval('public.face_group_id_seq'::regclass);


--
-- Name: face_groupuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_groupuser ALTER COLUMN id SET DEFAULT nextval('public.face_groupuser_id_seq'::regclass);


--
-- Name: face_humancountinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountinfo ALTER COLUMN id SET DEFAULT nextval('public.face_humancountinfo_id_seq'::regclass);


--
-- Name: face_humancountmediafile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountmediafile ALTER COLUMN id SET DEFAULT nextval('public.face_humancountmediafile_id_seq'::regclass);


--
-- Name: face_humancountrealtimeinfo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountrealtimeinfo ALTER COLUMN id SET DEFAULT nextval('public.face_humancountrealtimeinfo_id_seq'::regclass);


--
-- Name: face_questionnaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaire ALTER COLUMN id SET DEFAULT nextval('public.face_questionnaire_id_seq'::regclass);


--
-- Name: face_questionnaireresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaireresult ALTER COLUMN id SET DEFAULT nextval('public.face_questionnaireresult_id_seq'::regclass);


--
-- Name: face_throttlecounters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_throttlecounters ALTER COLUMN id SET DEFAULT nextval('public.face_throttlecounters_id_seq'::regclass);


--
-- Name: guard_beatglobal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_beatglobal ALTER COLUMN id SET DEFAULT nextval('public.guard_beatglobal_id_seq'::regclass);


--
-- Name: guard_beatjob id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_beatjob ALTER COLUMN id SET DEFAULT nextval('public.guard_beatjob_id_seq'::regclass);


--
-- Name: guard_case id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case ALTER COLUMN id SET DEFAULT nextval('public.guard_case_id_seq'::regclass);


--
-- Name: guard_caseexportconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportconfig ALTER COLUMN id SET DEFAULT nextval('public.guard_caseexportconfig_id_seq'::regclass);


--
-- Name: guard_caseexportrecord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportrecord ALTER COLUMN id SET DEFAULT nextval('public.guard_caseexportrecord_id_seq'::regclass);


--
-- Name: guard_casehistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casehistory ALTER COLUMN id SET DEFAULT nextval('public.guard_casehistory_id_seq'::regclass);


--
-- Name: guard_casemedium id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casemedium ALTER COLUMN id SET DEFAULT nextval('public.guard_casemedium_id_seq'::regclass);


--
-- Name: guard_guardcompany id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guardcompany ALTER COLUMN id SET DEFAULT nextval('public.guard_guardcompany_id_seq'::regclass);


--
-- Name: guard_note id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_note ALTER COLUMN id SET DEFAULT nextval('public.guard_note_id_seq'::regclass);


--
-- Name: guard_siteoperation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_siteoperation ALTER COLUMN id SET DEFAULT nextval('public.guard_siteoperation_id_seq'::regclass);


--
-- Name: license_plate_blacklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_plate_blacklist ALTER COLUMN id SET DEFAULT nextval('public.license_plate_blacklist_id_seq'::regclass);


--
-- Name: logic_agent id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_agent ALTER COLUMN id SET DEFAULT nextval('public.logic_agent_id_seq'::regclass);


--
-- Name: logic_boxlocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_boxlocation ALTER COLUMN id SET DEFAULT nextval('public.logic_boxlocation_id_seq'::regclass);


--
-- Name: logic_camera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera ALTER COLUMN id SET DEFAULT nextval('public.logic_camera_id_seq'::regclass);


--
-- Name: logic_camerafirmwareversion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerafirmwareversion ALTER COLUMN id SET DEFAULT nextval('public.logic_camerafirmwareversion_id_seq'::regclass);


--
-- Name: logic_cameralocation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameralocation ALTER COLUMN id SET DEFAULT nextval('public.logic_cameralocation_id_seq'::regclass);


--
-- Name: logic_camerasavedvideo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerasavedvideo ALTER COLUMN id SET DEFAULT nextval('public.logic_camerasavedvideo_id_seq'::regclass);


--
-- Name: logic_cameratrackingobject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameratrackingobject ALTER COLUMN id SET DEFAULT nextval('public.logic_cameratrackingobject_id_seq'::regclass);


--
-- Name: logic_cameravideo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameravideo ALTER COLUMN id SET DEFAULT nextval('public.logic_cameravideo_id_seq'::regclass);


--
-- Name: logic_customizedalgorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm ALTER COLUMN id SET DEFAULT nextval('public.logic_customizedalgorithm_id_seq'::regclass);


--
-- Name: logic_customizedeventtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype ALTER COLUMN id SET DEFAULT nextval('public.logic_customizedeventtype_id_seq'::regclass);


--
-- Name: logic_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event ALTER COLUMN id SET DEFAULT nextval('public.logic_event_id_seq'::regclass);


--
-- Name: logic_eventbackup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_eventbackup ALTER COLUMN id SET DEFAULT nextval('public.logic_eventbackup_id_seq'::regclass);


--
-- Name: logic_inspection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection ALTER COLUMN id SET DEFAULT nextval('public.logic_inspection_id_seq'::regclass);


--
-- Name: logic_inspectmedium id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspectmedium ALTER COLUMN id SET DEFAULT nextval('public.logic_inspectmedium_id_seq'::regclass);


--
-- Name: logic_ipwhitelist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_ipwhitelist ALTER COLUMN id SET DEFAULT nextval('public.logic_ipwhitelist_id_seq'::regclass);


--
-- Name: logic_locationeventblacklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_locationeventblacklist ALTER COLUMN id SET DEFAULT nextval('public.logic_locationeventblacklist_id_seq'::regclass);


--
-- Name: logic_manualcleanuptask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_manualcleanuptask ALTER COLUMN id SET DEFAULT nextval('public.logic_manualcleanuptask_id_seq'::regclass);


--
-- Name: logic_medium id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_medium ALTER COLUMN id SET DEFAULT nextval('public.logic_medium_id_seq'::regclass);


--
-- Name: logic_mediumbackup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_mediumbackup ALTER COLUMN id SET DEFAULT nextval('public.logic_mediumbackup_id_seq'::regclass);


--
-- Name: logic_notifyrule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule ALTER COLUMN id SET DEFAULT nextval('public.logic_notifyrule_id_seq'::regclass);


--
-- Name: logic_organization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organization ALTER COLUMN id SET DEFAULT nextval('public.logic_organization_id_seq'::regclass);


--
-- Name: logic_organizationuistrategy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organizationuistrategy ALTER COLUMN id SET DEFAULT nextval('public.logic_organizationuistrategy_id_seq'::regclass);


--
-- Name: logic_robotsavedvideo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsavedvideo ALTER COLUMN id SET DEFAULT nextval('public.logic_robotsavedvideo_id_seq'::regclass);


--
-- Name: logic_robotsnap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsnap ALTER COLUMN id SET DEFAULT nextval('public.logic_robotsnap_id_seq'::regclass);


--
-- Name: logic_robotvideo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotvideo ALTER COLUMN id SET DEFAULT nextval('public.logic_robotvideo_id_seq'::regclass);


--
-- Name: logic_route id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_route ALTER COLUMN id SET DEFAULT nextval('public.logic_route_id_seq'::regclass);


--
-- Name: logic_rule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_rule ALTER COLUMN id SET DEFAULT nextval('public.logic_rule_id_seq'::regclass);


--
-- Name: logic_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_site ALTER COLUMN id SET DEFAULT nextval('public.logic_site_id_seq'::regclass);


--
-- Name: logic_sitemanagement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanagement ALTER COLUMN id SET DEFAULT nextval('public.logic_sitemanagement_id_seq'::regclass);


--
-- Name: logic_snap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_snap ALTER COLUMN id SET DEFAULT nextval('public.logic_snap_id_seq'::regclass);


--
-- Name: logic_task id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_task ALTER COLUMN id SET DEFAULT nextval('public.logic_task_id_seq'::regclass);


--
-- Name: logic_thermalcamerasettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettings ALTER COLUMN id SET DEFAULT nextval('public.logic_thermalcamerasettings_id_seq'::regclass);


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingsbatchupdaterecord ALTER COLUMN id SET DEFAULT nextval('public.logic_thermalcamerasettingsbatchupdaterecord_id_seq'::regclass);


--
-- Name: logic_thermalcamerasettingscheckrecord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingscheckrecord ALTER COLUMN id SET DEFAULT nextval('public.logic_thermalcamerasettingscheckrecord_id_seq'::regclass);


--
-- Name: logic_uistrategy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_uistrategy ALTER COLUMN id SET DEFAULT nextval('public.logic_uistrategy_id_seq'::regclass);


--
-- Name: logic_waypoint id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypoint ALTER COLUMN id SET DEFAULT nextval('public.logic_waypoint_id_seq'::regclass);


--
-- Name: logic_waypointhistory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypointhistory ALTER COLUMN id SET DEFAULT nextval('public.logic_waypointhistory_id_seq'::regclass);


--
-- Name: logic_webhook id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_webhook ALTER COLUMN id SET DEFAULT nextval('public.logic_webhook_id_seq'::regclass);


--
-- Name: mapping_map id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_map ALTER COLUMN id SET DEFAULT nextval('public.mapping_map_id_seq'::regclass);


--
-- Name: mapping_mapconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_mapconfig ALTER COLUMN id SET DEFAULT nextval('public.mapping_mapconfig_id_seq'::regclass);


--
-- Name: mapping_maptarget id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_maptarget ALTER COLUMN id SET DEFAULT nextval('public.mapping_maptarget_id_seq'::regclass);


--
-- Name: mapping_sitemap id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_sitemap ALTER COLUMN id SET DEFAULT nextval('public.mapping_sitemap_id_seq'::regclass);


--
-- Name: mapping_target id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target ALTER COLUMN id SET DEFAULT nextval('public.mapping_target_id_seq'::regclass);


--
-- Name: monitor_center_business id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_business ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_business_id_seq'::regclass);


--
-- Name: monitor_center_channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_channel ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_channel_id_seq'::regclass);


--
-- Name: monitor_center_customalgo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgo ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_customalgo_id_seq'::regclass);


--
-- Name: monitor_center_customalgonotify id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgonotify ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_customalgonotify_id_seq'::regclass);


--
-- Name: monitor_center_device id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_device ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_device_id_seq'::regclass);


--
-- Name: monitor_center_robotincidentnotifyrecord id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotincidentnotifyrecord ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_robotincidentnotifyrecord_id_seq'::regclass);


--
-- Name: monitor_center_robotnotifier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotnotifier ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_robotnotifier_id_seq'::regclass);


--
-- Name: monitor_center_rule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_rule ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_rule_id_seq'::regclass);


--
-- Name: monitor_center_sitefloorvideo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_sitefloorvideo ALTER COLUMN id SET DEFAULT nextval('public.monitor_center_sitefloorvideo_id_seq'::regclass);


--
-- Name: org_domain id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain ALTER COLUMN id SET DEFAULT nextval('public.org_domain_id_seq'::regclass);


--
-- Name: org_domainsite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainsite ALTER COLUMN id SET DEFAULT nextval('public.org_domainsite_id_seq'::regclass);


--
-- Name: org_domaintype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype ALTER COLUMN id SET DEFAULT nextval('public.org_domaintype_id_seq'::regclass);


--
-- Name: org_domainuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainuser ALTER COLUMN id SET DEFAULT nextval('public.org_domainuser_id_seq'::regclass);


--
-- Name: org_organizationdelegate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationdelegate ALTER COLUMN id SET DEFAULT nextval('public.org_organizationdelegate_id_seq'::regclass);


--
-- Name: org_organizationuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationuser ALTER COLUMN id SET DEFAULT nextval('public.org_organizationuser_id_seq'::regclass);


--
-- Name: org_usernode id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_usernode ALTER COLUMN id SET DEFAULT nextval('public.org_usernode_id_seq'::regclass);


--
-- Name: patrol_algoconfig id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoconfig ALTER COLUMN id SET DEFAULT nextval('public.patrol_algoconfig_id_seq'::regclass);


--
-- Name: patrol_algoreference id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoreference ALTER COLUMN id SET DEFAULT nextval('public.patrol_algoreference_id_seq'::regclass);


--
-- Name: patrol_building id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_building ALTER COLUMN id SET DEFAULT nextval('public.patrol_building_id_seq'::regclass);


--
-- Name: patrol_detectiontask id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_detectiontask ALTER COLUMN id SET DEFAULT nextval('public.patrol_detectiontask_id_seq'::regclass);


--
-- Name: patrol_floor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_floor ALTER COLUMN id SET DEFAULT nextval('public.patrol_floor_id_seq'::regclass);


--
-- Name: patrol_target id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_target ALTER COLUMN id SET DEFAULT nextval('public.patrol_target_id_seq'::regclass);


--
-- Name: perm_action id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_action ALTER COLUMN id SET DEFAULT nextval('public.perm_action_id_seq'::regclass);


--
-- Name: perm_resourcetype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_resourcetype ALTER COLUMN id SET DEFAULT nextval('public.perm_resourcetype_id_seq'::regclass);


--
-- Name: perm_role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role ALTER COLUMN id SET DEFAULT nextval('public.perm_role_id_seq'::regclass);


--
-- Name: perm_role_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role_users ALTER COLUMN id SET DEFAULT nextval('public.perm_role_users_id_seq'::regclass);


--
-- Name: perm_rolepolicy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_rolepolicy ALTER COLUMN id SET DEFAULT nextval('public.perm_rolepolicy_id_seq'::regclass);


--
-- Name: push_notifications_apnsdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_apnsdevice ALTER COLUMN id SET DEFAULT nextval('public.push_notifications_apnsdevice_id_seq'::regclass);


--
-- Name: push_notifications_gcmdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_gcmdevice ALTER COLUMN id SET DEFAULT nextval('public.push_notifications_gcmdevice_id_seq'::regclass);


--
-- Name: push_notifications_wnsdevice id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_wnsdevice ALTER COLUMN id SET DEFAULT nextval('public.push_notifications_wnsdevice_id_seq'::regclass);


--
-- Name: third_auth_thirdauthconf id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.third_auth_thirdauthconf ALTER COLUMN id SET DEFAULT nextval('public.third_auth_thirdauthconf_id_seq'::regclass);


--
-- Name: wechat_wechatuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wechat_wechatuser ALTER COLUMN id SET DEFAULT nextval('public.wechat_wechatuser_id_seq'::regclass);


--
-- Data for Name: agreement_agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: agreement_useragreement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: algorithm_algorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (1, '2019-07-11 15:45:02.245+08', '2019-08-15 15:24:02.85+08', 'person', 'Person', 'Person', '人', '', 0);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (2, '2019-07-11 15:45:34.773+08', '2019-08-15 15:24:22.868+08', 'bicycle', 'Bicycle', 'Bicycle', '自行车', '', 1);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (3, '2019-07-11 15:45:48.319+08', '2019-08-15 15:25:13.035+08', 'car', 'Car', 'Car', '汽车', '', 2);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (4, '2019-07-11 15:45:59.522+08', '2019-08-15 15:25:21.379+08', 'motorbike', 'Motorbike', 'Motorbike', '摩托车', '', 3);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (5, '2019-07-11 15:48:39.286+08', '2019-08-15 15:25:30.615+08', 'aeroplane', 'Aeroplane', 'Aeroplane', '飞机', '', 4);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (6, '2019-07-11 15:48:48.698+08', '2019-08-15 15:25:39.534+08', 'bus', 'Bus', 'Bus', '公共汽车', '', 5);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (7, '2019-07-11 15:49:02.724+08', '2019-08-15 15:25:47.524+08', 'train', 'Train', 'Train', '火车', '', 6);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (8, '2019-07-11 15:49:11.573+08', '2019-08-15 15:25:56.826+08', 'truck', 'Truck', 'Truck', '货车', '', 7);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (9, '2019-07-11 15:49:22.07+08', '2019-08-15 15:26:05.407+08', 'boat', 'Boat', 'Boat', '船', '', 8);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (10, '2019-07-11 15:49:36.519+08', '2019-08-15 15:26:19.836+08', 'traffic_light', 'Traffic Light', 'Traffic Light', '交通灯', '', 9);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (11, '2019-07-11 15:49:48.72+08', '2019-08-15 15:26:33.492+08', 'fire_hydrant', 'Fire Hydrant', 'Fire Hydrant', '消防栓', '', 10);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (12, '2019-07-11 15:49:59.139+08', '2019-08-15 15:26:45.981+08', 'stop_sign', 'Stop Sign', 'Stop Sign', '停车标志', '', 11);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (13, '2019-07-11 15:50:10.197+08', '2019-08-15 15:27:01.305+08', 'parking_meter', 'Parking Meter', 'Parking Meter', '停车计时器', '', 12);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (14, '2019-07-11 15:50:19.093+08', '2019-08-15 15:27:11.056+08', 'bench', 'Bench', 'Bench', '长凳', '', 13);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (15, '2019-07-11 15:50:29.729+08', '2019-08-15 15:27:22.674+08', 'bird', 'Bird', 'Bird', '鸟', '', 14);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (16, '2019-07-11 15:50:38.808+08', '2019-08-15 15:27:32.858+08', 'cat', 'Cat', 'Cat', '猫', '', 15);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (17, '2019-07-11 15:50:49.363+08', '2019-08-15 15:27:43.137+08', 'dog', 'Dog', 'Dog', '狗', '', 16);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (18, '2019-07-11 15:51:22.493+08', '2019-08-15 15:27:52.867+08', 'horse', 'Horse', 'Horse', '马', '', 17);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (19, '2019-07-11 15:51:33.178+08', '2019-08-15 15:28:01.227+08', 'sheep', 'Sheep', 'Sheep', '绵羊', '', 18);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (20, '2019-07-11 15:51:45.443+08', '2019-08-15 15:28:09.732+08', 'cow', 'Cow', 'Cow', '奶牛', '', 19);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (21, '2019-07-11 15:52:08.091+08', '2019-08-15 15:28:19.506+08', 'elephant', 'Elephant', 'Elephant', '大象', '', 20);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (22, '2019-07-11 15:52:16.363+08', '2019-08-15 15:28:31.977+08', 'bear', 'Bear', 'Bear', '熊', '', 21);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (23, '2019-07-11 15:52:27.16+08', '2019-08-15 15:28:42.257+08', 'zebra', 'Zebra', 'Zebra', '斑马', '', 22);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (24, '2019-07-11 15:52:36.586+08', '2019-08-15 15:28:52.864+08', 'giraffe', 'Giraffe', 'Giraffe', '长颈鹿', '', 23);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (25, '2019-07-11 15:52:46.666+08', '2019-08-15 15:29:03.903+08', 'backpack', 'Backpack', 'Backpack', '背包', '', 24);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (26, '2019-07-11 15:52:56.903+08', '2019-08-15 15:29:15.906+08', 'umbrella', 'Umbrella', 'Umbrella', '雨伞', '', 25);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (27, '2019-07-11 15:53:09.782+08', '2019-08-15 15:29:27.827+08', 'handbag', 'Handbag', 'Handbag', '手提包', '', 26);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (28, '2019-07-11 15:53:20.719+08', '2019-08-15 15:29:38.778+08', 'tie', 'Tie', 'Tie', '领带', '', 27);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (29, '2019-07-11 15:53:37.853+08', '2019-08-15 15:40:38.364+08', 'suitcase', 'Suitcase', 'Suitcase', '手提箱', '', 28);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (30, '2019-07-11 15:53:52.977+08', '2019-08-15 15:30:01.899+08', 'frisbee', 'Frisbee', 'Frisbee', '飞盘', '', 29);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (31, '2019-07-11 15:54:01.126+08', '2019-08-15 15:30:09.956+08', 'skis', 'Skis', 'Skis', '滑雪板', '', 30);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (32, '2019-07-11 15:54:11.838+08', '2019-08-15 15:30:24.941+08', 'snowboard', 'Snowboard', 'Snowboard', '滑雪板2', '', 31);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (33, '2019-07-11 15:54:34.889+08', '2019-08-15 15:30:41.809+08', 'sports_ball', 'Sports Ball', 'Sports Ball', '运动球', '', 32);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (34, '2019-07-11 15:54:42.899+08', '2019-08-15 15:30:51.507+08', 'kite', 'Kite', 'Kite', '风筝', '', 33);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (35, '2019-07-11 15:54:53.072+08', '2019-08-15 15:31:03.523+08', 'baseball_bat', 'Baseball Bat', 'Baseball Bat', '棒球棒', '', 34);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (36, '2019-07-11 15:55:03.51+08', '2019-08-15 15:31:16.696+08', 'baseball_glove', 'Baseball Glove', 'Baseball Glove', '棒球手套', '', 35);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (37, '2019-07-11 15:55:32.594+08', '2019-08-15 15:31:25.555+08', 'skateboard', 'Skateboard', 'Skateboard', '滑板', '', 36);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (38, '2019-07-11 15:55:45.352+08', '2019-08-15 15:31:35.719+08', 'surfboard', 'Surfboard', 'Surfboard', '冲浪板', '', 37);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (39, '2019-07-11 15:55:54.847+08', '2019-08-15 15:31:47.813+08', 'tennis_racket', 'Tennis Racket', 'Tennis Racket', '网球拍', '', 38);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (40, '2019-07-11 15:56:03.184+08', '2019-08-15 15:31:56.679+08', 'bottle', 'Bottle', 'Bottle', '瓶子', '', 39);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (41, '2019-07-11 15:56:20.204+08', '2019-08-15 15:32:08.31+08', 'wine_glass', 'Wine glass', 'Wine glass', '玻璃酒杯', '', 40);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (42, '2019-07-11 15:56:28.131+08', '2019-08-15 15:32:16.028+08', 'cup', 'Cup', 'Cup', '杯子', '', 41);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (43, '2019-07-11 15:56:34.504+08', '2019-08-15 15:32:30.399+08', 'fork', 'Fork', 'Fork', '餐叉', '', 42);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (44, '2019-07-11 15:56:44.362+08', '2019-08-15 15:32:38.292+08', 'knife', 'Knife', 'Knife', '刀子', '', 43);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (45, '2019-07-11 15:56:54.831+08', '2019-08-15 15:32:48.019+08', 'spoon', 'Spoon', 'Spoon', '汤匙', '', 44);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (46, '2019-07-11 15:57:01.557+08', '2019-08-15 15:32:56.421+08', 'bowl', 'Bowl', 'Bowl', '碗', '', 45);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (47, '2019-07-11 15:57:18.973+08', '2019-08-15 15:33:04.909+08', 'banana', 'Banana', 'Banana', '香蕉', '', 46);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (48, '2019-07-11 15:57:23.812+08', '2019-08-15 15:33:13.379+08', 'apple', 'Apple', 'Apple', '苹果', '', 47);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (49, '2019-07-11 15:57:33.731+08', '2019-08-15 15:33:22.05+08', 'sandwich', 'Sandwich', 'Sandwich', '三明治', '', 48);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (50, '2019-07-11 15:57:41.542+08', '2019-08-15 15:33:30.502+08', 'orange', 'Orange', 'Orange', '橘子', '', 49);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (51, '2019-07-11 15:57:54.226+08', '2019-08-15 15:33:40.423+08', 'broccoli', 'Broccoli', 'Broccoli', '西兰花', '', 50);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (52, '2019-07-11 15:58:02.601+08', '2019-08-15 15:33:49.274+08', 'carrot', 'Carrot', 'Carrot', '胡萝卜', '', 51);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (53, '2019-07-11 15:58:25.639+08', '2019-08-15 15:34:03.506+08', 'hot_dog', 'Hot dog', 'Hot dog', '热狗', '', 52);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (54, '2019-07-11 15:58:30.67+08', '2019-08-15 15:34:17.722+08', 'pizza', 'Pizza', 'Pizza', '比萨', '', 53);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (55, '2019-07-11 16:00:28.789+08', '2019-08-15 15:34:27.882+08', 'donut', 'Donut', 'Donut', '油炸圈饼', '', 54);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (56, '2019-07-11 16:00:46.073+08', '2019-08-15 15:34:39.819+08', 'cake', 'Cake', 'Cake', '蛋糕', '', 55);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (57, '2019-07-11 16:00:55.077+08', '2019-08-15 15:34:52.996+08', 'chair', 'Chair', 'Chair', '椅子', '', 56);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (58, '2019-07-11 16:01:06.515+08', '2019-08-15 15:35:10.628+08', 'sofa', 'Sofa', 'Sofa', '沙发', '', 57);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (59, '2019-07-11 16:01:16.597+08', '2019-08-15 15:35:22.793+08', 'pottedplant', 'Pottedplant', 'Pottedplant', '盆栽', '', 58);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (60, '2019-07-11 16:01:24.178+08', '2019-08-15 15:35:30.721+08', 'bed', 'Bed', 'Bed', '床', '', 59);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (61, '2019-07-11 16:01:31.577+08', '2019-08-15 15:35:39.622+08', 'diningtable', 'Diningtable', 'Diningtable', '餐桌', '', 60);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (62, '2019-07-11 16:01:39.536+08', '2019-08-15 15:35:47.285+08', 'toilet', 'Toilet', 'Toilet', '洗手间', '', 61);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (63, '2019-07-11 16:01:53.933+08', '2019-08-15 15:36:03.071+08', 'tvmonitor', 'TV Monitor', 'TV Monitor', '电视监控器', '', 62);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (64, '2019-07-11 16:02:00.319+08', '2019-08-15 15:36:12.828+08', 'laptop', 'Laptop', 'Laptop', '笔记本电脑', '', 63);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (65, '2019-07-11 16:02:12.475+08', '2019-08-15 15:36:22.713+08', 'mouse', 'Mouse', 'Mouse', '老鼠', '', 64);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (66, '2019-07-11 16:02:21.057+08', '2019-08-15 15:36:31.136+08', 'remote', 'Remote', 'Remote', '遥控器', '', 65);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (67, '2019-07-11 16:02:28.702+08', '2019-08-15 15:36:41.242+08', 'keyboard', 'Keyboard', 'Keyboard', '电脑键盘', '', 66);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (68, '2019-07-11 16:02:41.769+08', '2019-08-15 15:36:51.861+08', 'cell_phone', 'Cell phone', 'Cell phone', '手机', '', 67);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (69, '2019-07-11 16:02:52.678+08', '2019-08-15 15:36:59.971+08', 'microwave', 'Microwave', 'Microwave', '微波炉', '', 68);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (70, '2019-07-11 16:03:00.313+08', '2019-08-15 15:37:12.757+08', 'oven', 'Oven', 'Oven', '烤箱', '', 69);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (71, '2019-07-11 16:03:07.834+08', '2019-08-15 15:37:21.383+08', 'toaster', 'Toaster', 'Toaster', '烤面包片机', '', 70);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (72, '2019-07-11 16:03:17.189+08', '2019-08-15 15:37:29.519+08', 'sink', 'Sink', 'Sink', '水槽', '', 71);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (73, '2019-07-11 16:03:28.021+08', '2019-08-15 15:37:37.698+08', 'refrigerator', 'Refrigerator', 'Refrigerator', '冰箱', '', 72);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (74, '2019-07-11 16:03:35.401+08', '2019-08-15 15:37:46.388+08', 'book', 'Book', 'Book', '书', '', 73);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (75, '2019-07-11 16:03:42.5+08', '2019-08-15 15:37:54.935+08', 'clock', 'Clock', 'Clock', '钟表', '', 74);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (76, '2019-07-11 16:03:49.734+08', '2019-08-15 15:38:04.072+08', 'vase', 'Vase', 'Vase', '装饰花瓶', '', 75);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (77, '2019-07-11 16:03:56.23+08', '2019-08-15 15:38:12.586+08', 'scissors', 'Scissors', 'Scissors', '剪刀', '', 76);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (78, '2019-07-11 16:04:06.888+08', '2019-08-15 15:38:27.017+08', 'teddy_bear', 'Teddy Bear', 'Teddy Bear', '玩具熊', '', 77);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (79, '2019-07-11 16:04:19.21+08', '2019-08-15 15:38:37.71+08', 'hair_drier', 'Hair Drier', 'Hair Drier', '吹风机', '', 78);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (80, '2019-07-11 16:04:27.377+08', '2019-08-15 15:38:46.99+08', 'toothbrush', 'Toothbrush', 'Toothbrush', '牙刷', '', 79);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (81, '2019-07-11 16:33:29.077+08', '2019-08-15 15:39:08.025+08', 'enter', 'Enter', 'Enter', '设备进入', '', 80);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (82, '2019-07-11 16:33:42.09+08', '2019-08-15 15:39:16.82+08', 'leave', 'Leave', 'Leave', '设备离开', '', 81);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (83, '2020-02-07 10:45:59.458+08', '2020-02-07 10:46:23.335+08', 'face', 'Face', 'Face', '未戴口罩', '', 82);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (84, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'store', 'Store', 'Store', '店铺', '', 83);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (85, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'booth', 'Booth', 'Booth', '多经店铺', '', 84);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (86, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'hanging_poster', 'Hanging Poster', 'Hanging Poster', '吊幔', '', 85);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (87, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'lightbox', 'Lightbox', 'Lightbox', '灯箱', '', 86);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (88, '2020-04-13 15:58:00.458+08', '2020-04-13 15:58:00.458+08', 'temperature', 'Temperature', 'Temperature', '温度', '', 87);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (89, '2020-06-16 18:59:59.395+08', '2020-06-16 18:59:59.395+08', 'sentry_store_status', 'Sentry Store Status', 'Sentry Store Status', '店铺状态 (Sentry)', '', 88);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (90, '2020-06-16 19:00:49.082+08', '2020-06-16 19:00:49.082+08', 'sentry_booth_status', 'Sentry Booth Status', 'Sentry Booth Status', '多经状态 (Sentry)', '', 89);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (91, '2020-07-20 19:00:49.082+08', '2020-07-20 19:00:49.082+08', 'face_tracking', 'Face Tracking', 'Face Tracking', '人脸识别', '', 90);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (92, '2020-08-25 19:00:49.082+08', '2020-08-25 19:00:49.082+08', 'license_plate', 'License Plate', 'License Plate', '车辆号牌', '', 91);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (93, '2020-08-27 19:00:49.082+08', '2020-08-27 19:00:49.082+08', 'fire', 'Fire', 'Fire', '火焰', '', 92);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (94, '2020-08-27 19:00:49.082+08', '2020-08-27 19:00:49.082+08', 'questionnaire_fail', 'Questionnaire Fail', 'Questionnaire Fail', '问卷调查失败', '', 93);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (95, '2020-11-26 19:00:49.082+08', '2020-11-26 19:00:49.082+08', 'human_count', 'Human Count', 'Human Count', 'Human Count', '', 94);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (96, '2020-11-26 19:00:49.082+08', '2020-11-26 19:00:49.082+08', 'human_count_stat', 'Human Count Stat', 'Human Count Stat', 'Human Count Stat', '', 95);
INSERT INTO public.algorithm_algorithm (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, intro, index) VALUES (97, '2020-11-26 19:00:49.082+08', '2020-11-26 19:00:49.082+08', 'human_count_exceed', 'Human Count Exceed', 'Human Count Exceed', 'Human Count Exceed', '', 96);


--
-- Data for Name: algorithm_eventtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (4, '2019-09-26 16:25:41.392+08', '2019-09-28 16:49:50.449+08', 'person', 'Person', 'Person', '人', 0, 1);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (5, '2019-09-26 16:25:41.396+08', '2019-09-28 16:49:50.301+08', 'bicycle', 'Bicycle', 'Bicycle', '自行车', 1, 2);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (6, '2019-09-26 16:25:41.397+08', '2019-09-28 16:49:50.305+08', 'car', 'Car', 'Car', '汽车', 2, 3);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (7, '2019-09-26 16:25:41.399+08', '2019-09-28 16:49:50.308+08', 'motorbike', 'Motorbike', 'Motorbike', '摩托车', 3, 4);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (8, '2019-09-26 16:25:41.4+08', '2019-09-28 16:49:50.309+08', 'aeroplane', 'Aeroplane', 'Aeroplane', '飞机', 4, 5);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (9, '2019-09-26 16:25:41.401+08', '2019-09-28 16:49:50.311+08', 'bus', 'Bus', 'Bus', '公共汽车', 5, 6);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (10, '2019-09-26 16:25:41.403+08', '2019-09-28 16:49:50.313+08', 'train', 'Train', 'Train', '火车', 6, 7);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (11, '2019-09-26 16:25:41.405+08', '2019-09-28 16:49:50.314+08', 'truck', 'Truck', 'Truck', '货车', 7, 8);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (12, '2019-09-26 16:25:41.407+08', '2019-09-28 16:49:50.316+08', 'boat', 'Boat', 'Boat', '船', 8, 9);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (13, '2019-09-26 16:25:41.408+08', '2019-09-28 16:49:50.318+08', 'traffic_light', 'Traffic Light', 'Traffic Light', '交通灯', 9, 10);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (14, '2019-09-26 16:25:41.41+08', '2019-09-28 16:49:50.32+08', 'fire_hydrant', 'Fire Hydrant', 'Fire Hydrant', '消防栓', 10, 11);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (15, '2019-09-26 16:25:41.412+08', '2019-09-28 16:49:50.321+08', 'stop_sign', 'Stop Sign', 'Stop Sign', '停车标志', 11, 12);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (16, '2019-09-26 16:25:41.413+08', '2019-09-28 16:49:50.323+08', 'parking_meter', 'Parking Meter', 'Parking Meter', '停车计时器', 12, 13);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (17, '2019-09-26 16:25:41.415+08', '2019-09-28 16:49:50.325+08', 'bench', 'Bench', 'Bench', '长凳', 13, 14);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (18, '2019-09-26 16:25:41.416+08', '2019-09-28 16:49:50.326+08', 'bird', 'Bird', 'Bird', '鸟', 14, 15);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (19, '2019-09-26 16:25:41.418+08', '2019-09-28 16:49:50.328+08', 'cat', 'Cat', 'Cat', '猫', 15, 16);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (20, '2019-09-26 16:25:41.419+08', '2019-09-28 16:49:50.329+08', 'dog', 'Dog', 'Dog', '狗', 16, 17);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (21, '2019-09-26 16:25:41.421+08', '2019-09-28 16:49:50.331+08', 'horse', 'Horse', 'Horse', '马', 17, 18);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (22, '2019-09-26 16:25:41.424+08', '2019-09-28 16:49:50.332+08', 'sheep', 'Sheep', 'Sheep', '绵羊', 18, 19);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (23, '2019-09-26 16:25:41.425+08', '2019-09-28 16:49:50.334+08', 'cow', 'Cow', 'Cow', '奶牛', 19, 20);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (24, '2019-09-26 16:25:41.426+08', '2019-09-28 16:49:50.335+08', 'elephant', 'Elephant', 'Elephant', '大象', 20, 21);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (25, '2019-09-26 16:25:41.428+08', '2019-09-28 16:49:50.336+08', 'bear', 'Bear', 'Bear', '熊', 21, 22);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (26, '2019-09-26 16:25:41.429+08', '2019-09-28 16:49:50.338+08', 'zebra', 'Zebra', 'Zebra', '斑马', 22, 23);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (27, '2019-09-26 16:25:41.431+08', '2019-09-28 16:49:50.339+08', 'giraffe', 'Giraffe', 'Giraffe', '长颈鹿', 23, 24);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (28, '2019-09-26 16:25:41.432+08', '2019-09-28 16:49:50.341+08', 'backpack', 'Backpack', 'Backpack', '背包', 24, 25);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (29, '2019-09-26 16:25:41.434+08', '2019-09-28 16:49:50.343+08', 'umbrella', 'Umbrella', 'Umbrella', '雨伞', 25, 26);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (30, '2019-09-26 16:25:41.435+08', '2019-09-28 16:49:50.345+08', 'handbag', 'Handbag', 'Handbag', '手提包', 26, 27);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (31, '2019-09-26 16:25:41.436+08', '2019-09-28 16:49:50.347+08', 'tie', 'Tie', 'Tie', '领带', 27, 28);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (32, '2019-09-26 16:25:41.438+08', '2019-09-28 16:49:50.35+08', 'suitcase', 'Suitcase', 'Suitcase', '手提箱', 28, 29);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (33, '2019-09-26 16:25:41.44+08', '2019-09-28 16:49:50.352+08', 'frisbee', 'Frisbee', 'Frisbee', '飞盘', 29, 30);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (34, '2019-09-26 16:25:41.441+08', '2019-09-28 16:49:50.354+08', 'skis', 'Skis', 'Skis', '滑雪板', 30, 31);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (35, '2019-09-26 16:25:41.443+08', '2019-09-28 16:49:50.356+08', 'snowboard', 'Snowboard', 'Snowboard', '滑雪板2', 31, 32);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (36, '2019-09-26 16:25:41.444+08', '2019-09-28 16:49:50.359+08', 'sports_ball', 'Sports Ball', 'Sports Ball', '运动球', 32, 33);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (37, '2019-09-26 16:25:41.445+08', '2019-09-28 16:49:50.36+08', 'kite', 'Kite', 'Kite', '风筝', 33, 34);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (38, '2019-09-26 16:25:41.447+08', '2019-09-28 16:49:50.362+08', 'baseball_bat', 'Baseball Bat', 'Baseball Bat', '棒球棒', 34, 35);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (39, '2019-09-26 16:25:41.448+08', '2019-09-28 16:49:50.364+08', 'baseball_glove', 'Baseball Glove', 'Baseball Glove', '棒球手套', 35, 36);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (40, '2019-09-26 16:25:41.45+08', '2019-09-28 16:49:50.366+08', 'skateboard', 'Skateboard', 'Skateboard', '滑板', 36, 37);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (41, '2019-09-26 16:25:41.451+08', '2019-09-28 16:49:50.368+08', 'surfboard', 'Surfboard', 'Surfboard', '冲浪板', 37, 38);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (42, '2019-09-26 16:25:41.452+08', '2019-09-28 16:49:50.37+08', 'tennis_racket', 'Tennis Racket', 'Tennis Racket', '网球拍', 38, 39);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (43, '2019-09-26 16:25:41.454+08', '2019-09-28 16:49:50.371+08', 'bottle', 'Bottle', 'Bottle', '瓶子', 39, 40);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (44, '2019-09-26 16:25:41.457+08', '2019-09-28 16:49:50.373+08', 'wine_glass', 'Wine glass', 'Wine glass', '玻璃酒杯', 40, 41);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (45, '2019-09-26 16:25:41.458+08', '2019-09-28 16:49:50.374+08', 'cup', 'Cup', 'Cup', '杯子', 41, 42);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (46, '2019-09-26 16:25:41.46+08', '2019-09-28 16:49:50.376+08', 'fork', 'Fork', 'Fork', '餐叉', 42, 43);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (47, '2019-09-26 16:25:41.461+08', '2019-09-28 16:49:50.377+08', 'knife', 'Knife', 'Knife', '刀子', 43, 44);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (48, '2019-09-26 16:25:41.463+08', '2019-09-28 16:49:50.379+08', 'spoon', 'Spoon', 'Spoon', '汤匙', 44, 45);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (49, '2019-09-26 16:25:41.464+08', '2019-09-28 16:49:50.38+08', 'bowl', 'Bowl', 'Bowl', '碗', 45, 46);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (50, '2019-09-26 16:25:41.465+08', '2019-09-28 16:49:50.381+08', 'banana', 'Banana', 'Banana', '香蕉', 46, 47);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (51, '2019-09-26 16:25:41.467+08', '2019-09-28 16:49:50.383+08', 'apple', 'Apple', 'Apple', '苹果', 47, 48);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (52, '2019-09-26 16:25:41.468+08', '2019-09-28 16:49:50.385+08', 'sandwich', 'Sandwich', 'Sandwich', '三明治', 48, 49);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (53, '2019-09-26 16:25:41.47+08', '2019-09-28 16:49:50.386+08', 'orange', 'Orange', 'Orange', '橘子', 49, 50);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (54, '2019-09-26 16:25:41.472+08', '2019-09-28 16:49:50.388+08', 'broccoli', 'Broccoli', 'Broccoli', '西兰花', 50, 51);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (55, '2019-09-26 16:25:41.473+08', '2019-09-28 16:49:50.39+08', 'carrot', 'Carrot', 'Carrot', '胡萝卜', 51, 52);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (56, '2019-09-26 16:25:41.474+08', '2019-09-28 16:49:50.392+08', 'hot_dog', 'Hot dog', 'Hot dog', '热狗', 52, 53);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (57, '2019-09-26 16:25:41.476+08', '2019-09-28 16:49:50.394+08', 'pizza', 'Pizza', 'Pizza', '比萨', 53, 54);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (58, '2019-09-26 16:25:41.478+08', '2019-09-28 16:49:50.396+08', 'donut', 'Donut', 'Donut', '油炸圈饼', 54, 55);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (59, '2019-09-26 16:25:41.48+08', '2019-09-28 16:49:50.398+08', 'cake', 'Cake', 'Cake', '蛋糕', 55, 56);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (60, '2019-09-26 16:25:41.481+08', '2019-09-28 16:49:50.4+08', 'chair', 'Chair', 'Chair', '椅子', 56, 57);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (61, '2019-09-26 16:25:41.483+08', '2019-09-28 16:49:50.402+08', 'sofa', 'Sofa', 'Sofa', '沙发', 57, 58);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (62, '2019-09-26 16:25:41.484+08', '2019-09-28 16:49:50.404+08', 'pottedplant', 'Pottedplant', 'Pottedplant', '盆栽', 58, 59);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (63, '2019-09-26 16:25:41.485+08', '2019-09-28 16:49:50.406+08', 'bed', 'Bed', 'Bed', '床', 59, 60);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (64, '2019-09-26 16:25:41.487+08', '2019-09-28 16:49:50.451+08', 'diningtable', 'Diningtable', 'Diningtable', '餐桌', 80, 61);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (65, '2019-09-26 16:25:41.489+08', '2019-09-28 16:49:50.407+08', 'toilet', 'Toilet', 'Toilet', '洗手间', 60, 62);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (66, '2019-09-26 16:25:41.49+08', '2019-09-28 16:49:50.409+08', 'tvmonitor', 'TV Monitor', 'TV Monitor', '电视监控器', 61, 63);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (67, '2019-09-26 16:25:41.492+08', '2019-09-28 16:49:50.41+08', 'laptop', 'Laptop', 'Laptop', '笔记本电脑', 62, 64);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (68, '2019-09-26 16:25:41.493+08', '2019-09-28 16:49:50.412+08', 'mouse', 'Mouse', 'Mouse', '老鼠', 63, 65);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (69, '2019-09-26 16:25:41.495+08', '2019-09-28 16:49:50.414+08', 'remote', 'Remote', 'Remote', '遥控器', 64, 66);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (70, '2019-09-26 16:25:41.496+08', '2019-09-28 16:49:50.416+08', 'keyboard', 'Keyboard', 'Keyboard', '电脑键盘', 65, 67);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (71, '2019-09-26 16:25:41.498+08', '2019-09-28 16:49:50.423+08', 'cell_phone', 'Cell phone', 'Cell phone', '手机', 66, 68);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (72, '2019-09-26 16:25:41.499+08', '2019-09-28 16:49:50.425+08', 'microwave', 'Microwave', 'Microwave', '微波炉', 67, 69);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (73, '2019-09-26 16:25:41.501+08', '2019-09-28 16:49:50.427+08', 'oven', 'Oven', 'Oven', '烤箱', 68, 70);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (74, '2019-09-26 16:25:41.502+08', '2019-09-28 16:49:50.429+08', 'toaster', 'Toaster', 'Toaster', '烤面包片机', 69, 71);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (75, '2019-09-26 16:25:41.503+08', '2019-09-28 16:49:50.43+08', 'sink', 'Sink', 'Sink', '水槽', 70, 72);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (76, '2019-09-26 16:25:41.506+08', '2019-09-28 16:49:50.452+08', 'refrigerator', 'Refrigerator', 'Refrigerator', '冰箱', 81, 73);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (77, '2019-09-26 16:25:41.507+08', '2019-09-28 16:49:50.432+08', 'book', 'Book', 'Book', '书', 71, 74);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (78, '2019-09-26 16:25:41.508+08', '2019-09-28 16:49:50.433+08', 'clock', 'Clock', 'Clock', '钟表', 72, 75);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (79, '2019-09-26 16:25:41.51+08', '2019-09-28 16:49:50.435+08', 'vase', 'Vase', 'Vase', '装饰花瓶', 73, 76);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (80, '2019-09-26 16:25:41.511+08', '2019-09-28 16:49:50.437+08', 'scissors', 'Scissors', 'Scissors', '剪刀', 74, 77);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (81, '2019-09-26 16:25:41.513+08', '2019-09-28 16:49:50.439+08', 'teddy_bear', 'Teddy Bear', 'Teddy Bear', '玩具熊', 75, 78);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (82, '2019-09-26 16:25:41.514+08', '2019-09-28 16:49:50.441+08', 'hair_drier', 'Hair Drier', 'Hair Drier', '吹风机', 76, 79);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (83, '2019-09-26 16:25:41.515+08', '2019-09-28 16:49:50.443+08', 'toothbrush', 'Toothbrush', 'Toothbrush', '牙刷', 77, 80);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (84, '2019-09-26 16:25:41.516+08', '2019-09-28 16:49:50.445+08', 'enter', 'Enter', 'Enter', '设备进入', 78, 81);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (85, '2019-09-26 16:25:41.518+08', '2019-09-28 16:49:50.447+08', 'leave', 'Leave', 'Leave', '设备离开', 79, 82);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (86, '2020-02-07 10:47:39.431+08', '2020-02-07 10:47:39.431+08', 'face', 'Face', 'Face', '未戴口罩', 82, 83);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (87, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'store_open_delay', 'Store Open Delay', 'Store Open Delay', '店铺未按时营业', 83, 84);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (88, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'store_close_delay', 'Store Close Delay', 'Store Close Delay', '店铺未按时关闭', 84, 84);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (89, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'store_covered', 'Store Covered', 'Store Covered', '店铺围挡', 85, 84);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (90, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'booth_open_delay', 'Booth Open Delay', 'Booth Open Delay', '多经店铺未按时营业', 86, 85);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (91, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'booth_close_delay', 'Booth Close Delay', 'Booth Close Delay', '多经店铺未按时关闭', 87, 85);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (92, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'booth_not_exist', 'Booth Not Exist', 'Booth Not Exist', '多经店铺空置', 88, 85);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (93, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'hanging_poster_not_exist', 'Hanging Poster Not Exist', 'Hanging Poster Not Exist', '吊幔空置', 89, 86);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (94, '2020-04-02 15:58:00.458+08', '2020-04-02 15:58:00.458+08', 'lightbox_off', 'Lightbox Off', 'Lightbox Off', '灯箱未开', 90, 87);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (95, '2020-04-13 15:58:00.458+08', '2020-04-13 15:58:00.458+08', 'temperature_abnormal', 'Temperature Abnormal', 'Temperature Abnormal', '温度异常', 91, 88);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (96, '2020-04-13 15:58:00.458+08', '2020-04-13 15:58:00.458+08', 'temperature_normal', 'Temperature Normal', 'Temperature Normal', '温度正常', 92, 88);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (97, '2020-06-17 09:13:30.213+08', '2020-06-17 09:13:30.213+08', 'store_status_open', 'Store Status Open', 'Store Status Open', '店铺开店', 93, 89);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (98, '2020-06-17 09:15:15.213+08', '2020-06-17 09:15:15.213+08', 'store_status_close', 'Store Status Close', 'Store Status Close', '店铺闭店', 94, 89);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (99, '2020-06-17 09:16:28.701+08', '2020-06-17 09:16:28.701+08', 'store_status_covered', 'Store Status Covered', 'Store Status Covered', '店铺围挡 (Sentry)', 95, 89);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (100, '2020-06-17 09:17:16.202+08', '2020-06-17 09:17:16.202+08', 'booth_status_open', 'Booth Status Open', 'Booth Status Open', '多经开店', 96, 90);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (101, '2020-06-17 09:17:44.567+08', '2020-06-17 09:17:44.567+08', 'booth_status_close', 'Booth Status Close', 'Booth Status Close', '多经闭店', 97, 90);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (102, '2020-06-17 09:18:11.189+08', '2020-06-17 09:18:11.189+08', 'booth_status_not_exist', 'Booth Status Not Exist', 'Booth Status Not Exist', '多经空置', 98, 90);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (103, '2020-06-17 09:18:34.083+08', '2020-06-19 09:19:25.047+08', 'booth_status_covered', 'Booth Status Covered', 'Booth Status Covered', '多经围挡 (Sentry)', 99, 90);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (104, '2020-06-19 09:19:30.059+08', '2020-06-19 09:19:30.059+08', 'booth_covered', 'Booth Covered', 'Booth Covered', '多经围挡', 100, 85);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (105, '2020-06-20 09:19:30.059+08', '2020-06-20 09:19:30.059+08', 'face_tracking', 'Face Tracking', 'Face Tracking', '人脸识别', 101, 91);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (106, '2020-07-22 09:48:21.778+08', '2020-07-22 09:48:21.778+08', 'hanging_poster_exist', 'Hanging Poster Exist', 'Hanging Poster Exist', '吊幔正常', 102, 86);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (107, '2020-07-22 09:48:42.304+08', '2020-07-22 09:48:42.305+08', 'lightbox_on', 'Lightbox On', 'Lightbox On', '灯箱开启', 103, 87);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (108, '2020-08-25 09:48:42.304+08', '2020-08-25 09:48:42.305+08', 'license_plate', 'License Plate', 'License Plate', '车辆号牌', 104, 92);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (109, '2020-08-27 09:48:42.304+08', '2020-08-27 09:48:42.305+08', 'fire', 'Fire', 'Fire', '火焰', 105, 93);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (110, '2020-08-27 09:48:42.304+08', '2020-08-27 09:48:42.305+08', 'questionnaire_fail', 'Questionnaire Fail', 'Questionnaire Fail', '问卷调查失败', 106, 94);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (111, '2020-11-26 09:48:42.304+08', '2020-11-26 09:48:42.305+08', 'human_count', 'Human Count', 'Human Count', 'Human Count', 107, 95);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (112, '2020-11-26 09:48:42.304+08', '2020-11-26 09:48:42.305+08', 'human_count_stat', 'Human Count Stat', 'Human Count Stat', 'Human Count Stat', 108, 96);
INSERT INTO public.algorithm_eventtype (id, created_at, updated_at, code_name, name, name_en, name_zh_hans, index, algorithm_id) VALUES (113, '2020-11-26 09:48:42.304+08', '2020-11-26 09:48:42.305+08', 'human_count_exceed', 'Human Count Exceed', 'Human Count Exceed', 'Human Count Exceed', 109, 97);


--
-- Data for Name: algorithm_productalgorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (1, '2019-07-11 17:41:30.837+08', '2019-07-12 11:49:12.613+08', 'box', 37, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (2, '2019-07-12 11:37:35.415+08', '2019-07-12 11:49:12.615+08', 'box', 1, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (3, '2019-07-12 11:37:35.42+08', '2019-07-12 11:49:12.617+08', 'box', 2, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (4, '2019-07-12 11:37:35.421+08', '2019-07-12 11:49:12.62+08', 'box', 3, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (5, '2019-07-12 11:37:35.422+08', '2019-07-12 11:49:12.623+08', 'box', 4, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (6, '2019-07-12 11:37:35.424+08', '2019-07-12 11:49:12.626+08', 'box', 5, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (7, '2019-07-12 11:37:35.426+08', '2019-07-12 11:49:12.628+08', 'box', 6, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (8, '2019-07-12 11:37:35.428+08', '2019-07-12 11:49:12.63+08', 'box', 7, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (9, '2019-07-12 11:37:35.429+08', '2019-07-12 11:49:12.632+08', 'box', 8, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (10, '2019-07-12 11:37:35.43+08', '2019-07-12 11:49:12.634+08', 'box', 9, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (11, '2019-07-12 11:37:35.432+08', '2019-07-12 11:49:12.636+08', 'box', 10, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (12, '2019-07-12 11:37:35.433+08', '2019-07-12 11:49:12.637+08', 'box', 11, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (13, '2019-07-12 11:37:35.434+08', '2019-07-12 11:49:12.639+08', 'box', 12, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (14, '2019-07-12 11:37:35.435+08', '2019-07-12 11:49:12.641+08', 'box', 13, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (15, '2019-07-12 11:37:35.436+08', '2019-07-12 11:49:12.644+08', 'box', 14, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (16, '2019-07-12 11:37:35.438+08', '2019-07-12 11:49:12.646+08', 'box', 15, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (17, '2019-07-12 11:37:35.439+08', '2019-07-12 11:49:12.648+08', 'box', 16, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (18, '2019-07-12 11:37:35.439+08', '2019-07-12 11:49:12.65+08', 'box', 17, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (19, '2019-07-12 11:37:35.44+08', '2019-07-12 11:49:12.651+08', 'box', 18, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (20, '2019-07-12 11:37:35.442+08', '2019-07-12 11:49:12.653+08', 'box', 19, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (21, '2019-07-12 11:37:35.443+08', '2019-07-12 11:49:12.655+08', 'box', 20, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (22, '2019-07-12 11:37:35.444+08', '2019-07-12 11:49:12.657+08', 'box', 21, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (23, '2019-07-12 11:37:35.445+08', '2019-07-12 11:49:12.66+08', 'box', 22, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (24, '2019-07-12 11:37:35.446+08', '2019-07-12 11:49:12.661+08', 'box', 23, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (25, '2019-07-12 11:37:35.447+08', '2019-07-12 11:49:12.663+08', 'box', 24, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (26, '2019-07-12 11:37:35.448+08', '2019-07-12 11:49:12.665+08', 'box', 25, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (27, '2019-07-12 11:37:35.449+08', '2019-07-12 11:49:12.667+08', 'box', 26, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (28, '2019-07-12 11:37:35.45+08', '2019-07-12 11:49:12.669+08', 'box', 27, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (29, '2019-07-12 11:37:35.451+08', '2019-07-12 11:49:12.671+08', 'box', 28, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (30, '2019-07-12 11:37:35.452+08', '2019-07-12 11:49:12.673+08', 'box', 29, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (31, '2019-07-12 11:37:35.452+08', '2019-07-12 11:49:12.674+08', 'box', 30, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (32, '2019-07-12 11:37:35.453+08', '2019-07-12 11:49:12.676+08', 'box', 31, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (33, '2019-07-12 11:37:35.454+08', '2019-07-12 11:49:12.678+08', 'box', 32, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (34, '2019-07-12 11:37:35.455+08', '2019-07-12 11:49:12.68+08', 'box', 33, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (35, '2019-07-12 11:37:35.455+08', '2019-07-12 11:49:12.682+08', 'box', 34, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (36, '2019-07-12 11:37:35.456+08', '2019-07-12 11:49:12.684+08', 'box', 35, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (37, '2019-07-12 11:37:35.457+08', '2019-07-12 11:49:12.686+08', 'box', 36, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (76, '2019-07-12 11:37:51.05+08', '2019-07-12 11:49:12.687+08', 'box', 38, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (77, '2019-07-12 11:37:51.051+08', '2019-07-12 11:49:12.689+08', 'box', 39, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (78, '2019-07-12 11:37:51.052+08', '2019-07-12 11:49:12.691+08', 'box', 40, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (79, '2019-07-12 11:37:51.053+08', '2019-07-12 11:49:12.693+08', 'box', 41, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (80, '2019-07-12 11:37:51.054+08', '2019-07-12 11:49:12.695+08', 'box', 42, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (81, '2019-07-12 11:37:51.055+08', '2019-07-12 11:49:12.697+08', 'box', 43, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (82, '2019-07-12 11:37:51.056+08', '2019-07-12 11:49:12.699+08', 'box', 44, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (83, '2019-07-12 11:37:51.056+08', '2019-07-12 11:49:12.7+08', 'box', 45, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (84, '2019-07-12 11:37:51.057+08', '2019-07-12 11:49:12.702+08', 'box', 46, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (85, '2019-07-12 11:37:51.058+08', '2019-07-12 11:49:12.704+08', 'box', 47, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (86, '2019-07-12 11:37:51.059+08', '2019-07-12 11:49:12.706+08', 'box', 48, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (87, '2019-07-12 11:37:51.06+08', '2019-07-12 11:49:12.708+08', 'box', 49, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (88, '2019-07-12 11:37:51.06+08', '2019-07-12 11:49:12.71+08', 'box', 50, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (89, '2019-07-12 11:37:51.061+08', '2019-07-12 11:49:12.712+08', 'box', 51, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (90, '2019-07-12 11:37:51.062+08', '2019-07-12 11:49:12.714+08', 'box', 52, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (91, '2019-07-12 11:37:51.063+08', '2019-07-12 11:49:12.715+08', 'box', 53, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (92, '2019-07-12 11:37:51.063+08', '2019-07-12 11:49:12.717+08', 'box', 54, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (93, '2019-07-12 11:37:51.064+08', '2019-07-12 11:49:12.719+08', 'box', 55, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (94, '2019-07-12 11:37:51.065+08', '2019-07-12 11:49:12.721+08', 'box', 56, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (95, '2019-07-12 11:37:51.065+08', '2019-07-12 11:49:12.722+08', 'box', 57, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (96, '2019-07-12 11:37:51.066+08', '2019-07-12 11:49:12.724+08', 'box', 58, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (97, '2019-07-12 11:37:51.067+08', '2019-07-12 11:49:12.726+08', 'box', 59, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (98, '2019-07-12 11:37:51.068+08', '2019-07-12 11:49:12.728+08', 'box', 60, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (99, '2019-07-12 11:37:51.068+08', '2019-07-12 11:49:12.73+08', 'box', 61, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (100, '2019-07-12 11:37:51.069+08', '2019-07-12 11:49:12.732+08', 'box', 62, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (101, '2019-07-12 11:37:51.07+08', '2019-07-12 11:49:12.734+08', 'box', 63, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (102, '2019-07-12 11:37:51.07+08', '2019-07-12 11:49:12.735+08', 'box', 64, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (103, '2019-07-12 11:37:51.071+08', '2019-07-12 11:49:12.737+08', 'box', 65, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (104, '2019-07-12 11:37:51.072+08', '2019-07-12 11:49:12.739+08', 'box', 66, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (105, '2019-07-12 11:37:51.073+08', '2019-07-12 11:49:12.74+08', 'box', 67, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (106, '2019-07-12 11:37:51.073+08', '2019-07-12 11:49:12.742+08', 'box', 68, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (107, '2019-07-12 11:37:51.074+08', '2019-07-12 11:49:12.744+08', 'box', 69, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (108, '2019-07-12 11:37:51.075+08', '2019-07-12 11:49:12.746+08', 'box', 70, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (109, '2019-07-12 11:37:51.075+08', '2019-07-12 11:49:12.748+08', 'box', 71, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (110, '2019-07-12 11:37:51.076+08', '2019-07-12 11:49:12.749+08', 'box', 72, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (111, '2019-07-12 11:37:51.077+08', '2019-07-12 11:49:12.751+08', 'box', 73, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (112, '2019-07-12 11:37:51.078+08', '2019-07-12 11:49:12.753+08', 'box', 74, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (113, '2019-07-12 11:37:51.078+08', '2019-07-12 11:49:12.755+08', 'box', 75, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (114, '2019-07-12 11:37:51.079+08', '2019-07-12 11:49:12.757+08', 'box', 76, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (115, '2019-07-12 11:37:51.08+08', '2019-07-12 11:49:12.758+08', 'box', 77, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (116, '2019-07-12 11:37:51.081+08', '2019-07-12 11:49:12.76+08', 'box', 78, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (117, '2019-07-12 11:37:51.081+08', '2019-07-12 11:49:12.762+08', 'box', 79, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (118, '2019-07-12 11:37:51.082+08', '2019-07-12 11:49:12.764+08', 'box', 80, 1);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (123, '2019-07-12 12:12:57.066+08', '2019-07-12 12:12:57.066+08', 'robot', 1, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (124, '2019-07-12 12:12:57.072+08', '2019-07-12 12:12:57.072+08', 'robot', 2, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (125, '2019-07-12 12:12:57.073+08', '2019-07-12 12:12:57.073+08', 'robot', 3, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (126, '2019-07-12 12:12:57.075+08', '2019-07-12 12:12:57.075+08', 'robot', 4, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (127, '2019-07-12 12:12:57.077+08', '2019-07-12 12:12:57.077+08', 'robot', 5, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (128, '2019-07-12 12:12:57.084+08', '2019-07-12 12:12:57.084+08', 'robot', 6, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (129, '2019-07-12 12:12:57.086+08', '2019-07-12 12:12:57.086+08', 'robot', 7, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (130, '2019-07-12 12:12:57.087+08', '2019-07-12 12:12:57.087+08', 'robot', 8, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (131, '2019-07-12 12:12:57.089+08', '2019-07-12 12:12:57.089+08', 'robot', 9, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (132, '2019-07-12 12:12:57.091+08', '2019-07-12 12:12:57.091+08', 'robot', 10, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (133, '2019-07-12 12:12:57.092+08', '2019-07-12 12:12:57.092+08', 'robot', 11, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (134, '2019-07-12 12:12:57.093+08', '2019-07-12 12:12:57.093+08', 'robot', 12, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (135, '2019-07-12 12:12:57.095+08', '2019-07-12 12:12:57.095+08', 'robot', 13, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (136, '2019-07-12 12:12:57.098+08', '2019-07-12 12:12:57.098+08', 'robot', 14, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (137, '2019-07-12 12:12:57.099+08', '2019-07-12 12:12:57.099+08', 'robot', 15, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (138, '2019-07-12 12:12:57.101+08', '2019-07-12 12:12:57.101+08', 'robot', 16, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (139, '2019-07-12 12:12:57.102+08', '2019-07-12 12:12:57.102+08', 'robot', 17, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (140, '2019-07-12 12:12:57.103+08', '2019-07-12 12:12:57.103+08', 'robot', 18, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (141, '2019-07-12 12:12:57.103+08', '2019-07-12 12:12:57.103+08', 'robot', 19, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (142, '2019-07-12 12:12:57.104+08', '2019-07-12 12:12:57.104+08', 'robot', 20, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (143, '2019-07-12 12:12:57.105+08', '2019-07-12 12:12:57.105+08', 'robot', 21, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (144, '2019-07-12 12:12:57.106+08', '2019-07-12 12:12:57.106+08', 'robot', 22, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (145, '2019-07-12 12:12:57.107+08', '2019-07-12 12:12:57.107+08', 'robot', 23, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (146, '2019-07-12 12:12:57.108+08', '2019-07-12 12:12:57.108+08', 'robot', 24, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (147, '2019-07-12 12:12:57.109+08', '2019-07-12 12:12:57.109+08', 'robot', 25, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (148, '2019-07-12 12:12:57.109+08', '2019-07-12 12:12:57.109+08', 'robot', 26, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (149, '2019-07-12 12:12:57.11+08', '2019-07-12 12:12:57.11+08', 'robot', 27, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (150, '2019-07-12 12:12:57.111+08', '2019-07-12 12:12:57.111+08', 'robot', 28, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (151, '2019-07-12 12:12:57.112+08', '2019-07-12 12:12:57.112+08', 'robot', 29, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (152, '2019-07-12 12:12:57.112+08', '2019-07-12 12:12:57.112+08', 'robot', 30, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (153, '2019-07-12 12:12:57.113+08', '2019-07-12 12:12:57.113+08', 'robot', 31, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (154, '2019-07-12 12:12:57.114+08', '2019-07-12 12:12:57.114+08', 'robot', 32, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (155, '2019-07-12 12:12:57.114+08', '2019-07-12 12:12:57.114+08', 'robot', 33, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (156, '2019-07-12 12:12:57.115+08', '2019-07-12 12:12:57.115+08', 'robot', 34, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (157, '2019-07-12 12:12:57.116+08', '2019-07-12 12:12:57.116+08', 'robot', 35, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (158, '2019-07-12 12:12:57.116+08', '2019-07-12 12:12:57.116+08', 'robot', 36, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (159, '2019-07-12 12:12:57.117+08', '2019-07-12 12:12:57.117+08', 'robot', 37, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (160, '2019-07-12 12:12:57.117+08', '2019-07-12 12:12:57.117+08', 'robot', 38, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (161, '2019-07-12 12:12:57.118+08', '2019-07-12 12:12:57.118+08', 'robot', 39, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (162, '2019-07-12 12:12:57.119+08', '2019-07-12 12:12:57.119+08', 'robot', 40, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (163, '2019-07-12 12:12:57.119+08', '2019-07-12 12:12:57.119+08', 'robot', 41, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (164, '2019-07-12 12:12:57.12+08', '2019-07-12 12:12:57.12+08', 'robot', 42, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (165, '2019-07-12 12:12:57.12+08', '2019-07-12 12:12:57.12+08', 'robot', 43, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (166, '2019-07-12 12:12:57.121+08', '2019-07-12 12:12:57.121+08', 'robot', 44, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (167, '2019-07-12 12:12:57.121+08', '2019-07-12 12:12:57.121+08', 'robot', 45, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (168, '2019-07-12 12:12:57.122+08', '2019-07-12 12:12:57.122+08', 'robot', 46, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (169, '2019-07-12 12:12:57.123+08', '2019-07-12 12:12:57.123+08', 'robot', 47, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (170, '2019-07-12 12:12:57.123+08', '2019-07-12 12:12:57.123+08', 'robot', 48, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (171, '2019-07-12 12:12:57.124+08', '2019-07-12 12:12:57.124+08', 'robot', 49, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (172, '2019-07-12 12:12:57.125+08', '2019-07-12 12:12:57.125+08', 'robot', 50, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (173, '2019-07-12 12:12:57.125+08', '2019-07-12 12:12:57.125+08', 'robot', 51, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (174, '2019-07-12 12:12:57.126+08', '2019-07-12 12:12:57.126+08', 'robot', 52, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (175, '2019-07-12 12:12:57.126+08', '2019-07-12 12:12:57.126+08', 'robot', 53, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (176, '2019-07-12 12:12:57.127+08', '2019-07-12 12:12:57.127+08', 'robot', 54, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (177, '2019-07-12 12:12:57.128+08', '2019-07-12 12:12:57.128+08', 'robot', 55, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (178, '2019-07-12 12:12:57.128+08', '2019-07-12 12:12:57.128+08', 'robot', 56, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (179, '2019-07-12 12:12:57.129+08', '2019-07-12 12:12:57.129+08', 'robot', 57, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (180, '2019-07-12 12:12:57.129+08', '2019-07-12 12:12:57.129+08', 'robot', 58, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (181, '2019-07-12 12:12:57.13+08', '2019-07-12 12:12:57.13+08', 'robot', 59, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (182, '2019-07-12 12:12:57.13+08', '2019-07-12 12:12:57.13+08', 'robot', 60, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (183, '2019-07-12 12:12:57.131+08', '2019-07-12 12:12:57.131+08', 'robot', 61, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (184, '2019-07-12 12:12:57.132+08', '2019-07-12 12:12:57.132+08', 'robot', 62, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (185, '2019-07-12 12:12:57.132+08', '2019-07-12 12:12:57.132+08', 'robot', 63, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (186, '2019-07-12 12:12:57.133+08', '2019-07-12 12:12:57.133+08', 'robot', 64, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (187, '2019-07-12 12:12:57.133+08', '2019-07-12 12:12:57.133+08', 'robot', 65, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (188, '2019-07-12 12:12:57.134+08', '2019-07-12 12:12:57.134+08', 'robot', 66, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (189, '2019-07-12 12:12:57.135+08', '2019-07-12 12:12:57.135+08', 'robot', 67, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (190, '2019-07-12 12:12:57.135+08', '2019-07-12 12:12:57.135+08', 'robot', 68, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (191, '2019-07-12 12:12:57.136+08', '2019-07-12 12:12:57.136+08', 'robot', 69, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (192, '2019-07-12 12:12:57.137+08', '2019-07-12 12:12:57.137+08', 'robot', 70, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (193, '2019-07-12 12:12:57.137+08', '2019-07-12 12:12:57.137+08', 'robot', 71, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (194, '2019-07-12 12:12:57.138+08', '2019-07-12 12:12:57.138+08', 'robot', 72, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (195, '2019-07-12 12:12:57.138+08', '2019-07-12 12:12:57.138+08', 'robot', 73, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (196, '2019-07-12 12:12:57.139+08', '2019-07-12 12:12:57.139+08', 'robot', 74, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (197, '2019-07-12 12:12:57.14+08', '2019-07-12 12:12:57.14+08', 'robot', 75, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (198, '2019-07-12 12:12:57.14+08', '2019-07-12 12:12:57.14+08', 'robot', 76, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (199, '2019-07-12 12:12:57.141+08', '2019-07-12 12:12:57.141+08', 'robot', 77, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (200, '2019-07-12 12:12:57.142+08', '2019-07-12 12:12:57.142+08', 'robot', 78, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (201, '2019-07-12 12:12:57.142+08', '2019-07-12 12:12:57.142+08', 'robot', 79, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (202, '2019-07-12 12:12:57.143+08', '2019-07-12 12:12:57.143+08', 'robot', 80, 2);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (205, '2019-07-12 12:13:15.135+08', '2019-07-12 12:13:15.135+08', 'robot', 1, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (206, '2019-07-12 12:13:15.141+08', '2019-07-12 12:13:15.141+08', 'robot', 2, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (207, '2019-07-12 12:13:15.143+08', '2019-07-12 12:13:15.143+08', 'robot', 3, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (208, '2019-07-12 12:13:15.145+08', '2019-07-12 12:13:15.145+08', 'robot', 4, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (209, '2019-07-12 12:13:15.147+08', '2019-07-12 12:13:15.147+08', 'robot', 5, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (210, '2019-07-12 12:13:15.148+08', '2019-07-12 12:13:15.148+08', 'robot', 6, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (211, '2019-07-12 12:13:15.149+08', '2019-07-12 12:13:15.149+08', 'robot', 7, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (212, '2019-07-12 12:13:15.15+08', '2019-07-12 12:13:15.15+08', 'robot', 8, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (213, '2019-07-12 12:13:15.151+08', '2019-07-12 12:13:15.151+08', 'robot', 9, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (214, '2019-07-12 12:13:15.153+08', '2019-07-12 12:13:15.153+08', 'robot', 10, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (215, '2019-07-12 12:13:15.155+08', '2019-07-12 12:13:15.155+08', 'robot', 11, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (216, '2019-07-12 12:13:15.156+08', '2019-07-12 12:13:15.156+08', 'robot', 12, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (217, '2019-07-12 12:13:15.158+08', '2019-07-12 12:13:15.158+08', 'robot', 13, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (218, '2019-07-12 12:13:15.159+08', '2019-07-12 12:13:15.159+08', 'robot', 14, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (219, '2019-07-12 12:13:15.16+08', '2019-07-12 12:13:15.16+08', 'robot', 15, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (220, '2019-07-12 12:13:15.161+08', '2019-07-12 12:13:15.161+08', 'robot', 16, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (221, '2019-07-12 12:13:15.162+08', '2019-07-12 12:13:15.162+08', 'robot', 17, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (222, '2019-07-12 12:13:15.163+08', '2019-07-12 12:13:15.163+08', 'robot', 18, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (223, '2019-07-12 12:13:15.164+08', '2019-07-12 12:13:15.164+08', 'robot', 19, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (224, '2019-07-12 12:13:15.165+08', '2019-07-12 12:13:15.165+08', 'robot', 20, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (225, '2019-07-12 12:13:15.166+08', '2019-07-12 12:13:15.166+08', 'robot', 21, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (226, '2019-07-12 12:13:15.167+08', '2019-07-12 12:13:15.167+08', 'robot', 22, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (227, '2019-07-12 12:13:15.168+08', '2019-07-12 12:13:15.169+08', 'robot', 23, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (228, '2019-07-12 12:13:15.171+08', '2019-07-12 12:13:15.171+08', 'robot', 24, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (229, '2019-07-12 12:13:15.173+08', '2019-07-12 12:13:15.173+08', 'robot', 25, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (230, '2019-07-12 12:13:15.174+08', '2019-07-12 12:13:15.174+08', 'robot', 26, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (231, '2019-07-12 12:13:15.175+08', '2019-07-12 12:13:15.175+08', 'robot', 27, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (232, '2019-07-12 12:13:15.176+08', '2019-07-12 12:13:15.176+08', 'robot', 28, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (233, '2019-07-12 12:13:15.177+08', '2019-07-12 12:13:15.177+08', 'robot', 29, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (234, '2019-07-12 12:13:15.178+08', '2019-07-12 12:13:15.178+08', 'robot', 30, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (235, '2019-07-12 12:13:15.179+08', '2019-07-12 12:13:15.179+08', 'robot', 31, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (236, '2019-07-12 12:13:15.18+08', '2019-07-12 12:13:15.18+08', 'robot', 32, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (237, '2019-07-12 12:13:15.181+08', '2019-07-12 12:13:15.181+08', 'robot', 33, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (238, '2019-07-12 12:13:15.183+08', '2019-07-12 12:13:15.183+08', 'robot', 34, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (239, '2019-07-12 12:13:15.184+08', '2019-07-12 12:13:15.184+08', 'robot', 35, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (240, '2019-07-12 12:13:15.185+08', '2019-07-12 12:13:15.185+08', 'robot', 36, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (241, '2019-07-12 12:13:15.186+08', '2019-07-12 12:13:15.187+08', 'robot', 37, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (242, '2019-07-12 12:13:15.188+08', '2019-07-12 12:13:15.188+08', 'robot', 38, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (243, '2019-07-12 12:13:15.189+08', '2019-07-12 12:13:15.189+08', 'robot', 39, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (244, '2019-07-12 12:13:15.191+08', '2019-07-12 12:13:15.191+08', 'robot', 40, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (245, '2019-07-12 12:13:15.192+08', '2019-07-12 12:13:15.192+08', 'robot', 41, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (246, '2019-07-12 12:13:15.193+08', '2019-07-12 12:13:15.193+08', 'robot', 42, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (247, '2019-07-12 12:13:15.194+08', '2019-07-12 12:13:15.194+08', 'robot', 43, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (248, '2019-07-12 12:13:15.195+08', '2019-07-12 12:13:15.195+08', 'robot', 44, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (249, '2019-07-12 12:13:15.196+08', '2019-07-12 12:13:15.196+08', 'robot', 45, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (250, '2019-07-12 12:13:15.197+08', '2019-07-12 12:13:15.197+08', 'robot', 46, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (251, '2019-07-12 12:13:15.198+08', '2019-07-12 12:13:15.198+08', 'robot', 47, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (252, '2019-07-12 12:13:15.199+08', '2019-07-12 12:13:15.199+08', 'robot', 48, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (253, '2019-07-12 12:13:15.2+08', '2019-07-12 12:13:15.2+08', 'robot', 49, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (254, '2019-07-12 12:13:15.2+08', '2019-07-12 12:13:15.2+08', 'robot', 50, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (255, '2019-07-12 12:13:15.201+08', '2019-07-12 12:13:15.201+08', 'robot', 51, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (256, '2019-07-12 12:13:15.202+08', '2019-07-12 12:13:15.202+08', 'robot', 52, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (257, '2019-07-12 12:13:15.203+08', '2019-07-12 12:13:15.203+08', 'robot', 53, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (258, '2019-07-12 12:13:15.203+08', '2019-07-12 12:13:15.203+08', 'robot', 54, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (259, '2019-07-12 12:13:15.204+08', '2019-07-12 12:13:15.204+08', 'robot', 55, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (260, '2019-07-12 12:13:15.205+08', '2019-07-12 12:13:15.205+08', 'robot', 56, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (261, '2019-07-12 12:13:15.206+08', '2019-07-12 12:13:15.206+08', 'robot', 57, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (262, '2019-07-12 12:13:15.207+08', '2019-07-12 12:13:15.207+08', 'robot', 58, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (263, '2019-07-12 12:13:15.207+08', '2019-07-12 12:13:15.207+08', 'robot', 59, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (264, '2019-07-12 12:13:15.208+08', '2019-07-12 12:13:15.208+08', 'robot', 60, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (265, '2019-07-12 12:13:15.209+08', '2019-07-12 12:13:15.209+08', 'robot', 61, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (266, '2019-07-12 12:13:15.209+08', '2019-07-12 12:13:15.209+08', 'robot', 62, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (267, '2019-07-12 12:13:15.21+08', '2019-07-12 12:13:15.21+08', 'robot', 63, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (268, '2019-07-12 12:13:15.211+08', '2019-07-12 12:13:15.211+08', 'robot', 64, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (269, '2019-07-12 12:13:15.212+08', '2019-07-12 12:13:15.212+08', 'robot', 65, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (270, '2019-07-12 12:13:15.212+08', '2019-07-12 12:13:15.212+08', 'robot', 66, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (271, '2019-07-12 12:13:15.213+08', '2019-07-12 12:13:15.213+08', 'robot', 67, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (272, '2019-07-12 12:13:15.214+08', '2019-07-12 12:13:15.214+08', 'robot', 68, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (273, '2019-07-12 12:13:15.214+08', '2019-07-12 12:13:15.214+08', 'robot', 69, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (274, '2019-07-12 12:13:15.215+08', '2019-07-12 12:13:15.215+08', 'robot', 70, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (275, '2019-07-12 12:13:15.216+08', '2019-07-12 12:13:15.216+08', 'robot', 71, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (276, '2019-07-12 12:13:15.216+08', '2019-07-12 12:13:15.216+08', 'robot', 72, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (277, '2019-07-12 12:13:15.217+08', '2019-07-12 12:13:15.217+08', 'robot', 73, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (278, '2019-07-12 12:13:15.218+08', '2019-07-12 12:13:15.218+08', 'robot', 74, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (279, '2019-07-12 12:13:15.219+08', '2019-07-12 12:13:15.219+08', 'robot', 75, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (280, '2019-07-12 12:13:15.219+08', '2019-07-12 12:13:15.219+08', 'robot', 76, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (281, '2019-07-12 12:13:15.22+08', '2019-07-12 12:13:15.22+08', 'robot', 77, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (282, '2019-07-12 12:13:15.221+08', '2019-07-12 12:13:15.221+08', 'robot', 78, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (283, '2019-07-12 12:13:15.222+08', '2019-07-12 12:13:15.222+08', 'robot', 79, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (284, '2019-07-12 12:13:15.223+08', '2019-07-12 12:13:15.223+08', 'robot', 80, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (285, '2019-07-12 12:13:15.223+08', '2019-07-12 12:13:15.223+08', 'robot', 81, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (286, '2019-07-12 12:13:15.224+08', '2019-07-12 12:13:15.224+08', 'robot', 82, 3);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (287, '2019-07-18 18:57:35.665+08', '2019-07-18 18:57:35.665+08', 'robot', 10, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (288, '2019-07-18 18:57:35.677+08', '2019-07-18 18:57:35.677+08', 'robot', 7, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (289, '2019-07-18 18:57:35.679+08', '2019-07-18 18:57:35.679+08', 'robot', 8, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (291, '2019-07-18 18:57:35.682+08', '2019-07-18 18:57:35.682+08', 'robot', 5, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (292, '2019-07-18 18:57:35.684+08', '2019-07-18 18:57:35.684+08', 'robot', 14, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (293, '2019-07-18 18:57:35.685+08', '2019-07-18 18:57:35.685+08', 'robot', 2, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (294, '2019-07-18 18:57:35.687+08', '2019-07-18 18:57:35.687+08', 'robot', 15, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (295, '2019-07-18 18:57:35.688+08', '2019-07-18 18:57:35.688+08', 'robot', 9, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (296, '2019-07-18 18:57:35.69+08', '2019-07-18 18:57:35.69+08', 'robot', 6, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (298, '2019-07-18 18:57:35.692+08', '2019-07-18 18:57:35.692+08', 'robot', 20, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (299, '2019-07-18 18:57:35.693+08', '2019-07-18 18:57:35.693+08', 'robot', 17, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (300, '2019-07-18 18:57:35.695+08', '2019-07-18 18:57:35.695+08', 'robot', 11, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (301, '2019-07-18 18:57:35.697+08', '2019-07-18 18:57:35.697+08', 'robot', 18, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (302, '2019-07-18 18:57:35.699+08', '2019-07-18 18:57:35.699+08', 'robot', 4, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (303, '2019-07-18 18:57:35.7+08', '2019-07-18 18:57:35.7+08', 'robot', 13, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (305, '2019-07-18 18:57:35.702+08', '2019-07-18 18:57:35.702+08', 'robot', 19, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (306, '2019-07-18 18:57:35.703+08', '2019-07-18 18:57:35.703+08', 'robot', 12, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (307, '2019-07-18 18:57:35.705+08', '2019-07-18 18:57:35.705+08', 'robot', 38, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (308, '2019-07-18 18:57:35.706+08', '2019-07-18 18:57:35.706+08', 'robot', 78, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (309, '2019-07-18 18:57:35.707+08', '2019-07-18 18:57:35.707+08', 'robot', 39, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (310, '2019-07-18 18:57:35.708+08', '2019-07-18 18:57:35.708+08', 'robot', 28, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (311, '2019-07-18 18:57:35.71+08', '2019-07-18 18:57:35.71+08', 'robot', 71, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (312, '2019-07-18 18:57:35.711+08', '2019-07-18 18:57:35.711+08', 'robot', 62, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (313, '2019-07-18 18:57:35.712+08', '2019-07-18 18:57:35.712+08', 'robot', 80, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (314, '2019-07-18 18:57:35.712+08', '2019-07-18 18:57:35.712+08', 'robot', 63, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (315, '2019-07-18 18:57:35.713+08', '2019-07-18 18:57:35.713+08', 'robot', 26, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (316, '2019-07-18 18:57:35.714+08', '2019-07-18 18:57:35.714+08', 'robot', 76, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (317, '2019-07-18 18:57:35.715+08', '2019-07-18 18:57:35.715+08', 'robot', 41, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (318, '2019-07-18 18:57:35.716+08', '2019-07-18 18:57:35.716+08', 'robot', 23, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (321, '2019-07-18 18:57:35.718+08', '2019-07-18 18:57:35.718+08', 'robot', 48, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (322, '2019-07-18 18:57:35.719+08', '2019-07-18 18:57:35.719+08', 'robot', 47, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (323, '2019-07-18 18:57:35.72+08', '2019-07-18 18:57:35.72+08', 'robot', 35, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (324, '2019-07-18 18:57:35.72+08', '2019-07-18 18:57:35.72+08', 'robot', 36, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (325, '2019-07-18 18:57:35.721+08', '2019-07-18 18:57:35.721+08', 'robot', 22, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (326, '2019-07-18 18:57:35.722+08', '2019-07-18 18:57:35.722+08', 'robot', 60, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (327, '2019-07-18 18:57:35.723+08', '2019-07-18 18:57:35.723+08', 'robot', 74, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (328, '2019-07-18 18:57:35.724+08', '2019-07-18 18:57:35.724+08', 'robot', 40, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (329, '2019-07-18 18:57:35.725+08', '2019-07-18 18:57:35.725+08', 'robot', 46, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (330, '2019-07-18 18:57:35.725+08', '2019-07-18 18:57:35.725+08', 'robot', 51, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (331, '2019-07-18 18:57:35.726+08', '2019-07-18 18:57:35.726+08', 'robot', 56, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (332, '2019-07-18 18:57:35.727+08', '2019-07-18 18:57:35.727+08', 'robot', 52, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (333, '2019-07-18 18:57:35.728+08', '2019-07-18 18:57:35.728+08', 'robot', 68, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (334, '2019-07-18 18:57:35.728+08', '2019-07-18 18:57:35.728+08', 'robot', 57, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (335, '2019-07-18 18:57:35.729+08', '2019-07-18 18:57:35.729+08', 'robot', 75, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (336, '2019-07-18 18:57:35.73+08', '2019-07-18 18:57:35.73+08', 'robot', 42, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (337, '2019-07-18 18:57:35.731+08', '2019-07-18 18:57:35.731+08', 'robot', 61, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (338, '2019-07-18 18:57:35.731+08', '2019-07-18 18:57:35.732+08', 'robot', 55, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (339, '2019-07-18 18:57:35.732+08', '2019-07-18 18:57:35.732+08', 'robot', 21, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (340, '2019-07-18 18:57:35.733+08', '2019-07-18 18:57:35.733+08', 'robot', 43, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (341, '2019-07-18 18:57:35.734+08', '2019-07-18 18:57:35.734+08', 'robot', 30, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (342, '2019-07-18 18:57:35.734+08', '2019-07-18 18:57:35.734+08', 'robot', 24, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (343, '2019-07-18 18:57:35.735+08', '2019-07-18 18:57:35.735+08', 'robot', 79, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (344, '2019-07-18 18:57:35.736+08', '2019-07-18 18:57:35.736+08', 'robot', 27, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (345, '2019-07-18 18:57:35.737+08', '2019-07-18 18:57:35.737+08', 'robot', 53, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (346, '2019-07-18 18:57:35.738+08', '2019-07-18 18:57:35.738+08', 'robot', 67, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (347, '2019-07-18 18:57:35.739+08', '2019-07-18 18:57:35.739+08', 'robot', 34, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (348, '2019-07-18 18:57:35.739+08', '2019-07-18 18:57:35.739+08', 'robot', 44, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (349, '2019-07-18 18:57:35.74+08', '2019-07-18 18:57:35.74+08', 'robot', 64, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (350, '2019-07-18 18:57:35.741+08', '2019-07-18 18:57:35.741+08', 'robot', 69, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (351, '2019-07-18 18:57:35.742+08', '2019-07-18 18:57:35.742+08', 'robot', 65, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (352, '2019-07-18 18:57:35.743+08', '2019-07-18 18:57:35.743+08', 'robot', 50, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (353, '2019-07-18 18:57:35.743+08', '2019-07-18 18:57:35.743+08', 'robot', 70, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (355, '2019-07-18 18:57:35.745+08', '2019-07-18 18:57:35.745+08', 'robot', 54, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (356, '2019-07-18 18:57:35.746+08', '2019-07-18 18:57:35.746+08', 'robot', 59, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (357, '2019-07-18 18:57:35.746+08', '2019-07-18 18:57:35.746+08', 'robot', 73, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (358, '2019-07-18 18:57:35.747+08', '2019-07-18 18:57:35.747+08', 'robot', 66, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (359, '2019-07-18 18:57:35.748+08', '2019-07-18 18:57:35.748+08', 'robot', 49, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (360, '2019-07-18 18:57:35.748+08', '2019-07-18 18:57:35.748+08', 'robot', 77, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (361, '2019-07-18 18:57:35.749+08', '2019-07-18 18:57:35.749+08', 'robot', 72, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (362, '2019-07-18 18:57:35.75+08', '2019-07-18 18:57:35.75+08', 'robot', 37, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (363, '2019-07-18 18:57:35.75+08', '2019-07-18 18:57:35.751+08', 'robot', 31, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (364, '2019-07-18 18:57:35.751+08', '2019-07-18 18:57:35.751+08', 'robot', 32, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (365, '2019-07-18 18:57:35.752+08', '2019-07-18 18:57:35.752+08', 'robot', 58, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (366, '2019-07-18 18:57:35.753+08', '2019-07-18 18:57:35.753+08', 'robot', 45, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (367, '2019-07-18 18:57:35.754+08', '2019-07-18 18:57:35.754+08', 'robot', 33, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (368, '2019-07-18 18:57:35.755+08', '2019-07-18 18:57:35.755+08', 'robot', 29, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (381, '2019-07-18 18:58:42.802+08', '2019-07-18 18:58:42.802+08', 'robot', 17, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (450, '2019-07-18 18:58:42.869+08', '2019-07-18 18:58:42.869+08', 'robot', 29, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (533, '2019-07-18 19:03:34.091+08', '2019-07-18 19:03:34.091+08', 'box', 1, 7);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (534, '2019-07-22 20:40:21.494+08', '2019-07-22 20:40:21.494+08', 'box', 10, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (535, '2019-07-22 20:40:21.526+08', '2019-07-22 20:40:21.526+08', 'box', 7, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (536, '2019-07-22 20:40:21.529+08', '2019-07-22 20:40:21.529+08', 'box', 8, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (537, '2019-07-22 20:40:21.531+08', '2019-07-22 20:40:21.531+08', 'box', 3, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (538, '2019-07-22 20:40:21.532+08', '2019-07-22 20:40:21.532+08', 'box', 5, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (539, '2019-07-22 20:40:21.534+08', '2019-07-22 20:40:21.534+08', 'box', 14, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (540, '2019-07-22 20:40:21.535+08', '2019-07-22 20:40:21.535+08', 'box', 2, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (541, '2019-07-22 20:40:21.537+08', '2019-07-22 20:40:21.537+08', 'box', 15, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (542, '2019-07-22 20:40:21.538+08', '2019-07-22 20:40:21.538+08', 'box', 9, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (543, '2019-07-22 20:40:21.539+08', '2019-07-22 20:40:21.539+08', 'box', 6, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (544, '2019-07-22 20:40:21.541+08', '2019-07-22 20:40:21.541+08', 'box', 16, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (545, '2019-07-22 20:40:21.542+08', '2019-07-22 20:40:21.542+08', 'box', 20, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (546, '2019-07-22 20:40:21.542+08', '2019-07-22 20:40:21.542+08', 'box', 17, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (547, '2019-07-22 20:40:21.543+08', '2019-07-22 20:40:21.543+08', 'box', 11, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (548, '2019-07-22 20:40:21.544+08', '2019-07-22 20:40:21.544+08', 'box', 18, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (549, '2019-07-22 20:40:21.545+08', '2019-07-22 20:40:21.545+08', 'box', 4, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (550, '2019-07-22 20:40:21.546+08', '2019-07-22 20:40:21.546+08', 'box', 13, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (551, '2019-07-22 20:40:21.547+08', '2019-07-22 20:40:21.547+08', 'box', 1, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (552, '2019-07-22 20:40:21.548+08', '2019-07-22 20:40:21.548+08', 'box', 19, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (553, '2019-07-22 20:40:21.548+08', '2019-07-22 20:40:21.548+08', 'box', 12, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (554, '2019-07-22 20:40:21.549+08', '2019-07-22 20:40:21.549+08', 'box', 38, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (555, '2019-07-22 20:40:21.55+08', '2019-07-22 20:40:21.55+08', 'box', 78, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (556, '2019-07-22 20:40:21.551+08', '2019-07-22 20:40:21.551+08', 'box', 39, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (557, '2019-07-22 20:40:21.552+08', '2019-07-22 20:40:21.552+08', 'box', 28, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (558, '2019-07-22 20:40:21.553+08', '2019-07-22 20:40:21.553+08', 'box', 71, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (559, '2019-07-22 20:40:21.554+08', '2019-07-22 20:40:21.554+08', 'box', 62, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (560, '2019-07-22 20:40:21.555+08', '2019-07-22 20:40:21.555+08', 'box', 80, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (561, '2019-07-22 20:40:21.556+08', '2019-07-22 20:40:21.556+08', 'box', 63, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (562, '2019-07-22 20:40:21.557+08', '2019-07-22 20:40:21.557+08', 'box', 26, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (563, '2019-07-22 20:40:21.558+08', '2019-07-22 20:40:21.558+08', 'box', 76, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (564, '2019-07-22 20:40:21.559+08', '2019-07-22 20:40:21.559+08', 'box', 41, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (565, '2019-07-22 20:40:21.56+08', '2019-07-22 20:40:21.561+08', 'box', 23, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (568, '2019-07-22 20:40:21.564+08', '2019-07-22 20:40:21.564+08', 'box', 48, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (569, '2019-07-22 20:40:21.565+08', '2019-07-22 20:40:21.565+08', 'box', 47, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (570, '2019-07-22 20:40:21.566+08', '2019-07-22 20:40:21.566+08', 'box', 35, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (571, '2019-07-22 20:40:21.567+08', '2019-07-22 20:40:21.567+08', 'box', 36, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (572, '2019-07-22 20:40:21.568+08', '2019-07-22 20:40:21.568+08', 'box', 22, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (573, '2019-07-22 20:40:21.568+08', '2019-07-22 20:40:21.568+08', 'box', 60, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (574, '2019-07-22 20:40:21.569+08', '2019-07-22 20:40:21.569+08', 'box', 74, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (575, '2019-07-22 20:40:21.57+08', '2019-07-22 20:40:21.57+08', 'box', 40, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (576, '2019-07-22 20:40:21.57+08', '2019-07-22 20:40:21.57+08', 'box', 46, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (577, '2019-07-22 20:40:21.571+08', '2019-07-22 20:40:21.571+08', 'box', 51, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (578, '2019-07-22 20:40:21.572+08', '2019-07-22 20:40:21.572+08', 'box', 56, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (579, '2019-07-22 20:40:21.573+08', '2019-07-22 20:40:21.573+08', 'box', 52, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (580, '2019-07-22 20:40:21.573+08', '2019-07-22 20:40:21.574+08', 'box', 68, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (581, '2019-07-22 20:40:21.574+08', '2019-07-22 20:40:21.574+08', 'box', 57, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (582, '2019-07-22 20:40:21.575+08', '2019-07-22 20:40:21.575+08', 'box', 75, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (583, '2019-07-22 20:40:21.576+08', '2019-07-22 20:40:21.576+08', 'box', 42, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (584, '2019-07-22 20:40:21.577+08', '2019-07-22 20:40:21.577+08', 'box', 61, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (585, '2019-07-22 20:40:21.578+08', '2019-07-22 20:40:21.578+08', 'box', 55, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (586, '2019-07-22 20:40:21.579+08', '2019-07-22 20:40:21.579+08', 'box', 21, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (587, '2019-07-22 20:40:21.579+08', '2019-07-22 20:40:21.579+08', 'box', 43, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (588, '2019-07-22 20:40:21.58+08', '2019-07-22 20:40:21.58+08', 'box', 30, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (589, '2019-07-22 20:40:21.581+08', '2019-07-22 20:40:21.581+08', 'box', 24, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (590, '2019-07-22 20:40:21.582+08', '2019-07-22 20:40:21.582+08', 'box', 79, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (591, '2019-07-22 20:40:21.582+08', '2019-07-22 20:40:21.582+08', 'box', 27, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (592, '2019-07-22 20:40:21.583+08', '2019-07-22 20:40:21.583+08', 'box', 53, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (593, '2019-07-22 20:40:21.584+08', '2019-07-22 20:40:21.584+08', 'box', 67, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (594, '2019-07-22 20:40:21.584+08', '2019-07-22 20:40:21.584+08', 'box', 34, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (595, '2019-07-22 20:40:21.585+08', '2019-07-22 20:40:21.585+08', 'box', 44, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (596, '2019-07-22 20:40:21.586+08', '2019-07-22 20:40:21.586+08', 'box', 64, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (597, '2019-07-22 20:40:21.586+08', '2019-07-22 20:40:21.586+08', 'box', 69, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (598, '2019-07-22 20:40:21.587+08', '2019-07-22 20:40:21.587+08', 'box', 65, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (599, '2019-07-22 20:40:21.588+08', '2019-07-22 20:40:21.588+08', 'box', 50, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (600, '2019-07-22 20:40:21.588+08', '2019-07-22 20:40:21.588+08', 'box', 70, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (601, '2019-07-22 20:40:21.589+08', '2019-07-22 20:40:21.589+08', 'box', 25, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (602, '2019-07-22 20:40:21.59+08', '2019-07-22 20:40:21.59+08', 'box', 54, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (603, '2019-07-22 20:40:21.591+08', '2019-07-22 20:40:21.591+08', 'box', 59, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (604, '2019-07-22 20:40:21.591+08', '2019-07-22 20:40:21.591+08', 'box', 73, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (605, '2019-07-22 20:40:21.592+08', '2019-07-22 20:40:21.592+08', 'box', 66, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (606, '2019-07-22 20:40:21.593+08', '2019-07-22 20:40:21.593+08', 'box', 49, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (607, '2019-07-22 20:40:21.593+08', '2019-07-22 20:40:21.594+08', 'box', 77, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (608, '2019-07-22 20:40:21.594+08', '2019-07-22 20:40:21.594+08', 'box', 72, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (609, '2019-07-22 20:40:21.595+08', '2019-07-22 20:40:21.595+08', 'box', 37, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (610, '2019-07-22 20:40:21.596+08', '2019-07-22 20:40:21.596+08', 'box', 31, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (611, '2019-07-22 20:40:21.596+08', '2019-07-22 20:40:21.596+08', 'box', 32, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (612, '2019-07-22 20:40:21.597+08', '2019-07-22 20:40:21.597+08', 'box', 58, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (613, '2019-07-22 20:40:21.598+08', '2019-07-22 20:40:21.598+08', 'box', 45, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (614, '2019-07-22 20:40:21.598+08', '2019-07-22 20:40:21.598+08', 'box', 33, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (615, '2019-07-22 20:40:21.599+08', '2019-07-22 20:40:21.599+08', 'box', 29, 8);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (616, '2019-07-24 10:09:55.802+08', '2019-07-24 10:09:55.802+08', 'box', 10, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (617, '2019-07-24 10:09:55.815+08', '2019-07-24 10:09:55.815+08', 'box', 7, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (618, '2019-07-24 10:09:55.816+08', '2019-07-24 10:09:55.816+08', 'box', 8, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (619, '2019-07-24 10:09:55.818+08', '2019-07-24 10:09:55.818+08', 'box', 3, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (620, '2019-07-24 10:09:55.819+08', '2019-07-24 10:09:55.819+08', 'box', 5, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (621, '2019-07-24 10:09:55.822+08', '2019-07-24 10:09:55.822+08', 'box', 14, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (622, '2019-07-24 10:09:55.824+08', '2019-07-24 10:09:55.824+08', 'box', 2, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (623, '2019-07-24 10:09:55.825+08', '2019-07-24 10:09:55.825+08', 'box', 15, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (624, '2019-07-24 10:09:55.827+08', '2019-07-24 10:09:55.827+08', 'box', 9, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (625, '2019-07-24 10:09:55.828+08', '2019-07-24 10:09:55.829+08', 'box', 6, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (626, '2019-07-24 10:09:55.83+08', '2019-07-24 10:09:55.83+08', 'box', 16, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (627, '2019-07-24 10:09:55.831+08', '2019-07-24 10:09:55.831+08', 'box', 20, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (628, '2019-07-24 10:09:55.832+08', '2019-07-24 10:09:55.832+08', 'box', 17, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (629, '2019-07-24 10:09:55.833+08', '2019-07-24 10:09:55.833+08', 'box', 11, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (630, '2019-07-24 10:09:55.834+08', '2019-07-24 10:09:55.834+08', 'box', 18, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (631, '2019-07-24 10:09:55.835+08', '2019-07-24 10:09:55.835+08', 'box', 4, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (632, '2019-07-24 10:09:55.837+08', '2019-07-24 10:09:55.837+08', 'box', 13, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (633, '2019-07-24 10:09:55.838+08', '2019-07-24 10:09:55.838+08', 'box', 1, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (634, '2019-07-24 10:09:55.839+08', '2019-07-24 10:09:55.839+08', 'box', 19, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (635, '2019-07-24 10:09:55.84+08', '2019-07-24 10:09:55.84+08', 'box', 12, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (636, '2019-07-24 10:09:55.841+08', '2019-07-24 10:09:55.841+08', 'box', 38, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (637, '2019-07-24 10:09:55.843+08', '2019-07-24 10:09:55.843+08', 'box', 78, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (638, '2019-07-24 10:09:55.844+08', '2019-07-24 10:09:55.844+08', 'box', 39, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (639, '2019-07-24 10:09:55.846+08', '2019-07-24 10:09:55.846+08', 'box', 28, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (640, '2019-07-24 10:09:55.847+08', '2019-07-24 10:09:55.847+08', 'box', 71, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (641, '2019-07-24 10:09:55.848+08', '2019-07-24 10:09:55.848+08', 'box', 62, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (642, '2019-07-24 10:09:55.849+08', '2019-07-24 10:09:55.849+08', 'box', 80, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (643, '2019-07-24 10:09:55.85+08', '2019-07-24 10:09:55.85+08', 'box', 63, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (644, '2019-07-24 10:09:55.851+08', '2019-07-24 10:09:55.851+08', 'box', 26, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (645, '2019-07-24 10:09:55.852+08', '2019-07-24 10:09:55.852+08', 'box', 76, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (646, '2019-07-24 10:09:55.854+08', '2019-07-24 10:09:55.854+08', 'box', 41, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (647, '2019-07-24 10:09:55.855+08', '2019-07-24 10:09:55.855+08', 'box', 23, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (650, '2019-07-24 10:09:55.857+08', '2019-07-24 10:09:55.858+08', 'box', 48, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (651, '2019-07-24 10:09:55.858+08', '2019-07-24 10:09:55.858+08', 'box', 47, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (652, '2019-07-24 10:09:55.859+08', '2019-07-24 10:09:55.859+08', 'box', 35, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (653, '2019-07-24 10:09:55.86+08', '2019-07-24 10:09:55.86+08', 'box', 36, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (654, '2019-07-24 10:09:55.861+08', '2019-07-24 10:09:55.861+08', 'box', 22, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (655, '2019-07-24 10:09:55.862+08', '2019-07-24 10:09:55.862+08', 'box', 60, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (656, '2019-07-24 10:09:55.863+08', '2019-07-24 10:09:55.863+08', 'box', 74, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (657, '2019-07-24 10:09:55.863+08', '2019-07-24 10:09:55.863+08', 'box', 40, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (658, '2019-07-24 10:09:55.864+08', '2019-07-24 10:09:55.864+08', 'box', 46, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (659, '2019-07-24 10:09:55.865+08', '2019-07-24 10:09:55.865+08', 'box', 51, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (660, '2019-07-24 10:09:55.866+08', '2019-07-24 10:09:55.866+08', 'box', 56, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (661, '2019-07-24 10:09:55.867+08', '2019-07-24 10:09:55.867+08', 'box', 52, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (662, '2019-07-24 10:09:55.868+08', '2019-07-24 10:09:55.868+08', 'box', 68, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (663, '2019-07-24 10:09:55.868+08', '2019-07-24 10:09:55.868+08', 'box', 57, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (664, '2019-07-24 10:09:55.869+08', '2019-07-24 10:09:55.869+08', 'box', 75, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (665, '2019-07-24 10:09:55.87+08', '2019-07-24 10:09:55.87+08', 'box', 42, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (666, '2019-07-24 10:09:55.87+08', '2019-07-24 10:09:55.87+08', 'box', 61, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (667, '2019-07-24 10:09:55.871+08', '2019-07-24 10:09:55.871+08', 'box', 55, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (668, '2019-07-24 10:09:55.872+08', '2019-07-24 10:09:55.872+08', 'box', 21, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (669, '2019-07-24 10:09:55.872+08', '2019-07-24 10:09:55.872+08', 'box', 43, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (670, '2019-07-24 10:09:55.873+08', '2019-07-24 10:09:55.873+08', 'box', 30, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (671, '2019-07-24 10:09:55.874+08', '2019-07-24 10:09:55.874+08', 'box', 24, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (672, '2019-07-24 10:09:55.874+08', '2019-07-24 10:09:55.874+08', 'box', 79, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (673, '2019-07-24 10:09:55.875+08', '2019-07-24 10:09:55.875+08', 'box', 27, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (674, '2019-07-24 10:09:55.876+08', '2019-07-24 10:09:55.876+08', 'box', 53, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (675, '2019-07-24 10:09:55.876+08', '2019-07-24 10:09:55.876+08', 'box', 67, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (676, '2019-07-24 10:09:55.877+08', '2019-07-24 10:09:55.877+08', 'box', 34, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (677, '2019-07-24 10:09:55.878+08', '2019-07-24 10:09:55.878+08', 'box', 44, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (678, '2019-07-24 10:09:55.879+08', '2019-07-24 10:09:55.879+08', 'box', 64, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (679, '2019-07-24 10:09:55.879+08', '2019-07-24 10:09:55.879+08', 'box', 69, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (680, '2019-07-24 10:09:55.88+08', '2019-07-24 10:09:55.88+08', 'box', 65, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (681, '2019-07-24 10:09:55.881+08', '2019-07-24 10:09:55.881+08', 'box', 50, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (682, '2019-07-24 10:09:55.882+08', '2019-07-24 10:09:55.882+08', 'box', 70, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (683, '2019-07-24 10:09:55.883+08', '2019-07-24 10:09:55.883+08', 'box', 25, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (684, '2019-07-24 10:09:55.884+08', '2019-07-24 10:09:55.884+08', 'box', 54, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (685, '2019-07-24 10:09:55.885+08', '2019-07-24 10:09:55.885+08', 'box', 59, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (686, '2019-07-24 10:09:55.885+08', '2019-07-24 10:09:55.885+08', 'box', 73, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (687, '2019-07-24 10:09:55.886+08', '2019-07-24 10:09:55.886+08', 'box', 66, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (688, '2019-07-24 10:09:55.887+08', '2019-07-24 10:09:55.887+08', 'box', 49, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (689, '2019-07-24 10:09:55.888+08', '2019-07-24 10:09:55.888+08', 'box', 77, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (690, '2019-07-24 10:09:55.888+08', '2019-07-24 10:09:55.888+08', 'box', 72, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (691, '2019-07-24 10:09:55.889+08', '2019-07-24 10:09:55.889+08', 'box', 37, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (692, '2019-07-24 10:09:55.89+08', '2019-07-24 10:09:55.89+08', 'box', 31, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (693, '2019-07-24 10:09:55.891+08', '2019-07-24 10:09:55.891+08', 'box', 32, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (694, '2019-07-24 10:09:55.891+08', '2019-07-24 10:09:55.891+08', 'box', 58, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (695, '2019-07-24 10:09:55.892+08', '2019-07-24 10:09:55.892+08', 'box', 45, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (696, '2019-07-24 10:09:55.893+08', '2019-07-24 10:09:55.893+08', 'box', 33, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (697, '2019-07-24 10:09:55.894+08', '2019-07-24 10:09:55.894+08', 'box', 29, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (698, '2019-07-24 10:13:05.73+08', '2019-07-24 10:13:05.73+08', 'box', 10, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (699, '2019-07-24 10:13:05.736+08', '2019-07-24 10:13:05.736+08', 'box', 7, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (700, '2019-07-24 10:13:05.737+08', '2019-07-24 10:13:05.737+08', 'box', 8, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (701, '2019-07-24 10:13:05.739+08', '2019-07-24 10:13:05.739+08', 'box', 3, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (702, '2019-07-24 10:13:05.74+08', '2019-07-24 10:13:05.74+08', 'box', 5, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (703, '2019-07-24 10:13:05.741+08', '2019-07-24 10:13:05.741+08', 'box', 14, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (704, '2019-07-24 10:13:05.743+08', '2019-07-24 10:13:05.743+08', 'box', 2, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (705, '2019-07-24 10:13:05.744+08', '2019-07-24 10:13:05.744+08', 'box', 15, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (706, '2019-07-24 10:13:05.745+08', '2019-07-24 10:13:05.745+08', 'box', 9, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (707, '2019-07-24 10:13:05.749+08', '2019-07-24 10:13:05.749+08', 'box', 6, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (708, '2019-07-24 10:13:05.751+08', '2019-07-24 10:13:05.751+08', 'box', 16, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (709, '2019-07-24 10:13:05.753+08', '2019-07-24 10:13:05.753+08', 'box', 20, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (710, '2019-07-24 10:13:05.754+08', '2019-07-24 10:13:05.754+08', 'box', 17, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (711, '2019-07-24 10:13:05.756+08', '2019-07-24 10:13:05.756+08', 'box', 11, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (712, '2019-07-24 10:13:05.759+08', '2019-07-24 10:13:05.759+08', 'box', 18, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (713, '2019-07-24 10:13:05.76+08', '2019-07-24 10:13:05.76+08', 'box', 4, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (714, '2019-07-24 10:13:05.761+08', '2019-07-24 10:13:05.761+08', 'box', 13, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (715, '2019-07-24 10:13:05.763+08', '2019-07-24 10:13:05.763+08', 'box', 1, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (716, '2019-07-24 10:13:05.764+08', '2019-07-24 10:13:05.764+08', 'box', 19, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (717, '2019-07-24 10:13:05.765+08', '2019-07-24 10:13:05.765+08', 'box', 12, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (718, '2019-07-24 10:13:05.766+08', '2019-07-24 10:13:05.766+08', 'box', 38, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (719, '2019-07-24 10:13:05.767+08', '2019-07-24 10:13:05.768+08', 'box', 78, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (720, '2019-07-24 10:13:05.769+08', '2019-07-24 10:13:05.769+08', 'box', 39, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (721, '2019-07-24 10:13:05.77+08', '2019-07-24 10:13:05.77+08', 'box', 28, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (722, '2019-07-24 10:13:05.771+08', '2019-07-24 10:13:05.771+08', 'box', 71, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (723, '2019-07-24 10:13:05.772+08', '2019-07-24 10:13:05.772+08', 'box', 62, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (724, '2019-07-24 10:13:05.774+08', '2019-07-24 10:13:05.774+08', 'box', 80, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (725, '2019-07-24 10:13:05.775+08', '2019-07-24 10:13:05.775+08', 'box', 63, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (726, '2019-07-24 10:13:05.776+08', '2019-07-24 10:13:05.776+08', 'box', 26, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (727, '2019-07-24 10:13:05.777+08', '2019-07-24 10:13:05.777+08', 'box', 76, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (728, '2019-07-24 10:13:05.778+08', '2019-07-24 10:13:05.778+08', 'box', 41, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (729, '2019-07-24 10:13:05.78+08', '2019-07-24 10:13:05.78+08', 'box', 23, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (732, '2019-07-24 10:13:05.784+08', '2019-07-24 10:13:05.784+08', 'box', 48, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (733, '2019-07-24 10:13:05.785+08', '2019-07-24 10:13:05.785+08', 'box', 47, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (734, '2019-07-24 10:13:05.786+08', '2019-07-24 10:13:05.786+08', 'box', 35, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (735, '2019-07-24 10:13:05.787+08', '2019-07-24 10:13:05.787+08', 'box', 36, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (736, '2019-07-24 10:13:05.788+08', '2019-07-24 10:13:05.788+08', 'box', 22, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (737, '2019-07-24 10:13:05.79+08', '2019-07-24 10:13:05.79+08', 'box', 60, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (738, '2019-07-24 10:13:05.791+08', '2019-07-24 10:13:05.791+08', 'box', 74, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (739, '2019-07-24 10:13:05.792+08', '2019-07-24 10:13:05.792+08', 'box', 40, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (740, '2019-07-24 10:13:05.792+08', '2019-07-24 10:13:05.792+08', 'box', 46, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (741, '2019-07-24 10:13:05.793+08', '2019-07-24 10:13:05.793+08', 'box', 51, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (742, '2019-07-24 10:13:05.794+08', '2019-07-24 10:13:05.794+08', 'box', 56, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (743, '2019-07-24 10:13:05.795+08', '2019-07-24 10:13:05.795+08', 'box', 52, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (744, '2019-07-24 10:13:05.796+08', '2019-07-24 10:13:05.796+08', 'box', 68, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (745, '2019-07-24 10:13:05.798+08', '2019-07-24 10:13:05.798+08', 'box', 57, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (746, '2019-07-24 10:13:05.798+08', '2019-07-24 10:13:05.798+08', 'box', 75, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (747, '2019-07-24 10:13:05.799+08', '2019-07-24 10:13:05.799+08', 'box', 42, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (748, '2019-07-24 10:13:05.8+08', '2019-07-24 10:13:05.8+08', 'box', 61, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (749, '2019-07-24 10:13:05.801+08', '2019-07-24 10:13:05.801+08', 'box', 55, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (750, '2019-07-24 10:13:05.801+08', '2019-07-24 10:13:05.801+08', 'box', 21, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (751, '2019-07-24 10:13:05.802+08', '2019-07-24 10:13:05.802+08', 'box', 43, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (752, '2019-07-24 10:13:05.803+08', '2019-07-24 10:13:05.803+08', 'box', 30, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (753, '2019-07-24 10:13:05.804+08', '2019-07-24 10:13:05.804+08', 'box', 24, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (754, '2019-07-24 10:13:05.804+08', '2019-07-24 10:13:05.804+08', 'box', 79, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (755, '2019-07-24 10:13:05.805+08', '2019-07-24 10:13:05.805+08', 'box', 27, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (756, '2019-07-24 10:13:05.806+08', '2019-07-24 10:13:05.806+08', 'box', 53, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (757, '2019-07-24 10:13:05.807+08', '2019-07-24 10:13:05.807+08', 'box', 67, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (758, '2019-07-24 10:13:05.808+08', '2019-07-24 10:13:05.808+08', 'box', 34, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (759, '2019-07-24 10:13:05.809+08', '2019-07-24 10:13:05.809+08', 'box', 44, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (760, '2019-07-24 10:13:05.81+08', '2019-07-24 10:13:05.81+08', 'box', 64, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (761, '2019-07-24 10:13:05.811+08', '2019-07-24 10:13:05.811+08', 'box', 69, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (762, '2019-07-24 10:13:05.812+08', '2019-07-24 10:13:05.812+08', 'box', 65, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (763, '2019-07-24 10:13:05.812+08', '2019-07-24 10:13:05.812+08', 'box', 50, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (764, '2019-07-24 10:13:05.813+08', '2019-07-24 10:13:05.813+08', 'box', 70, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (765, '2019-07-24 10:13:05.814+08', '2019-07-24 10:13:05.814+08', 'box', 25, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (766, '2019-07-24 10:13:05.815+08', '2019-07-24 10:13:05.815+08', 'box', 54, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (767, '2019-07-24 10:13:05.816+08', '2019-07-24 10:13:05.816+08', 'box', 59, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (768, '2019-07-24 10:13:05.816+08', '2019-07-24 10:13:05.816+08', 'box', 73, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (769, '2019-07-24 10:13:05.817+08', '2019-07-24 10:13:05.817+08', 'box', 66, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (770, '2019-07-24 10:13:05.818+08', '2019-07-24 10:13:05.818+08', 'box', 49, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (771, '2019-07-24 10:13:05.818+08', '2019-07-24 10:13:05.818+08', 'box', 77, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (772, '2019-07-24 10:13:05.819+08', '2019-07-24 10:13:05.819+08', 'box', 72, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (773, '2019-07-24 10:13:05.82+08', '2019-07-24 10:13:05.82+08', 'box', 37, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (774, '2019-07-24 10:13:05.821+08', '2019-07-24 10:13:05.821+08', 'box', 31, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (775, '2019-07-24 10:13:05.822+08', '2019-07-24 10:13:05.822+08', 'box', 32, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (776, '2019-07-24 10:13:05.823+08', '2019-07-24 10:13:05.823+08', 'box', 58, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (777, '2019-07-24 10:13:05.824+08', '2019-07-24 10:13:05.824+08', 'box', 45, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (778, '2019-07-24 10:13:05.825+08', '2019-07-24 10:13:05.825+08', 'box', 33, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (779, '2019-07-24 10:13:05.825+08', '2019-07-24 10:13:05.825+08', 'box', 29, 11);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (784, '2019-07-24 10:21:06.786+08', '2019-07-24 10:21:06.787+08', 'robot', 3, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (791, '2019-07-24 10:21:06.806+08', '2019-07-24 10:21:06.806+08', 'robot', 16, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (798, '2019-07-24 10:21:06.813+08', '2019-07-24 10:21:06.813+08', 'robot', 1, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (848, '2019-07-24 10:21:06.853+08', '2019-07-24 10:21:06.853+08', 'robot', 25, 4);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (866, '2019-07-24 10:22:07.654+08', '2019-07-24 10:22:07.654+08', 'robot', 3, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (873, '2019-07-24 10:22:07.668+08', '2019-07-24 10:22:07.668+08', 'robot', 16, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (880, '2019-07-24 10:22:07.675+08', '2019-07-24 10:22:07.675+08', 'robot', 1, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (930, '2019-07-24 10:22:07.71+08', '2019-07-24 10:22:07.71+08', 'robot', 25, 5);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (932, '2020-04-13 10:48:26.729+08', '2020-04-13 10:48:26.729+08', 'box', 88, 12);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (933, '2020-04-13 10:48:26.729+08', '2020-04-13 10:48:26.729+08', 'box', 94, 12);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (934, '2020-04-13 10:48:26.729+08', '2020-04-13 10:48:26.729+08', 'box', 92, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (935, '2020-04-13 10:48:26.729+08', '2020-04-13 10:48:26.729+08', 'box', 93, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (936, '2020-04-13 10:48:26.729+08', '2020-04-13 10:48:26.729+08', 'box', 91, 9);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (937, '2021-01-12 10:48:26.729+08', '2020-01-12 10:48:26.729+08', 'box', 95, 12);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (938, '2021-03-13 09:42:45.718+08', '2021-03-13 09:42:45.718+08', 'box', 1, 14);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (939, '2021-03-13 09:42:54.421+08', '2021-03-13 09:42:54.421+08', 'box', 3, 14);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (940, '2021-03-13 09:42:54.421+08', '2021-03-13 09:42:54.421+08', 'box', 96, 12);
INSERT INTO public.algorithm_productalgorithm (id, created_at, updated_at, category, algorithm_id, product_type_id) VALUES (941, '2021-03-13 09:42:54.421+08', '2021-03-13 09:42:54.421+08', 'box', 97, 12);


--
-- Data for Name: algorithm_producttype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (1, '2019-07-11 17:41:00.288+08', '2019-07-24 15:20:30.416+08', 'box', 'default', '{}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (2, '2019-07-12 12:09:50.369+08', '2019-07-24 15:20:41.092+08', 'robot', 'default', '{}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (3, '2019-07-12 12:10:13.679+08', '2019-07-24 15:20:55.994+08', 'robot', 'v1', '{}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (4, '2019-07-18 18:53:40.233+08', '2019-07-24 15:20:07.694+08', 'robot', 'dog_sr_v1', '{"cameras":[{"name":"front"},{"name":"rear"}],"mac_types":null}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (5, '2019-07-18 18:53:47.656+08', '2019-07-24 15:20:07.7+08', 'robot', 'std_sr_v1', '{"cameras":[{"name":"front"},{"name":"rear"}],"mac_types":[{"name":"restricted","label":"Restricted"},{"name":"favored","label":"Favored"}]}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (7, '2019-07-18 19:01:45.133+08', '2019-07-24 15:20:07.685+08', 'box', 'pi_v1', '{"max_camera_cnt":4,"max_detect_cnt":4}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (8, '2019-07-18 19:01:51.456+08', '2019-07-24 15:20:07.695+08', 'box', 'pi_v2', '{"max_camera_cnt":4,"max_detect_cnt":4}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (9, '2019-07-18 19:02:01.461+08', '2019-07-24 15:20:07.693+08', 'box', 'pc_v1', '{"max_camera_cnt":4,"max_detect_cnt":4}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (10, '2019-07-18 19:02:07.631+08', '2019-07-24 15:20:07.698+08', 'box', 'el_v1', '{"max_camera_cnt":4,"max_detect_cnt":1}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (11, '2019-07-18 19:02:13.56+08', '2019-07-24 15:17:39.433+08', 'box', 'pc_debug', '{"max_camera_cnt":8,"max_detect_cnt":8}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (12, '2020-04-13 19:02:13.56+08', '2020-04-13 15:17:39.433+08', 'box', 'mini_v1', '{"max_camera_cnt":20,"max_detect_cnt":20}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (13, '2020-11-20 09:42:06.013+08', '2020-11-20 09:42:06.013+08', 'box', 'superbox_us', '{"max_camera_cnt":256,"max_detect_cnt":256}');
INSERT INTO public.algorithm_producttype (id, created_at, updated_at, category, type, meta) VALUES (14, '2021-03-13 09:42:18.855+08', '2021-03-13 09:42:18.855+08', 'box', 'ai_vr', '{"max_camera_cnt":4,"max_detect_cnt":4}');


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (1, 'Can add log entry', 'add_logentry', 1);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (2, 'Can change log entry', 'change_logentry', 1);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (3, 'Can delete log entry', 'delete_logentry', 1);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (4, 'Can add user', 'add_user', 2);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (5, 'Can change user', 'change_user', 2);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (6, 'Can delete user', 'delete_user', 2);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (7, 'Can add group', 'add_group', 3);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (8, 'Can change group', 'change_group', 3);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (9, 'Can delete group', 'delete_group', 3);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (10, 'Can add permission', 'add_permission', 4);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (11, 'Can change permission', 'change_permission', 4);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (12, 'Can delete permission', 'delete_permission', 4);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (13, 'Can add content type', 'add_contenttype', 5);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (14, 'Can change content type', 'change_contenttype', 5);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (15, 'Can delete content type', 'delete_contenttype', 5);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (16, 'Can add session', 'add_session', 6);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (17, 'Can change session', 'change_session', 6);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (18, 'Can delete session', 'delete_session', 6);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (19, 'Can add APNS device', 'add_apnsdevice', 7);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (20, 'Can change APNS device', 'change_apnsdevice', 7);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (21, 'Can delete APNS device', 'delete_apnsdevice', 7);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (22, 'Can add GCM device', 'add_gcmdevice', 8);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (23, 'Can change GCM device', 'change_gcmdevice', 8);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (24, 'Can delete GCM device', 'delete_gcmdevice', 8);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (25, 'Can add WNS device', 'add_wnsdevice', 9);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (26, 'Can change WNS device', 'change_wnsdevice', 9);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (27, 'Can delete WNS device', 'delete_wnsdevice', 9);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (28, 'Can add algorithm', 'add_algorithm', 10);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (29, 'Can change algorithm', 'change_algorithm', 10);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (30, 'Can delete algorithm', 'delete_algorithm', 10);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (31, 'Can add event type', 'add_eventtype', 11);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (32, 'Can change event type', 'change_eventtype', 11);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (33, 'Can delete event type', 'delete_eventtype', 11);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (34, 'Can add product algorithm', 'add_productalgorithm', 12);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (35, 'Can change product algorithm', 'change_productalgorithm', 12);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (36, 'Can delete product algorithm', 'delete_productalgorithm', 12);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (37, 'Can add product type', 'add_producttype', 13);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (38, 'Can change product type', 'change_producttype', 13);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (39, 'Can delete product type', 'delete_producttype', 13);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (40, 'Can add agent', 'add_agent', 14);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (41, 'Can change agent', 'change_agent', 14);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (42, 'Can delete agent', 'delete_agent', 14);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (43, 'Can add camera', 'add_camera', 15);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (44, 'Can change camera', 'change_camera', 15);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (45, 'Can delete camera', 'delete_camera', 15);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (46, 'Can add camera location', 'add_cameralocation', 16);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (47, 'Can change camera location', 'change_cameralocation', 16);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (48, 'Can delete camera location', 'delete_cameralocation', 16);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (49, 'Can add camera saved video', 'add_camerasavedvideo', 17);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (50, 'Can change camera saved video', 'change_camerasavedvideo', 17);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (51, 'Can delete camera saved video', 'delete_camerasavedvideo', 17);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (52, 'Can add camera video', 'add_cameravideo', 18);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (53, 'Can change camera video', 'change_cameravideo', 18);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (54, 'Can delete camera video', 'delete_cameravideo', 18);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (55, 'Can add customized algorithm', 'add_customizedalgorithm', 19);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (56, 'Can change customized algorithm', 'change_customizedalgorithm', 19);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (57, 'Can delete customized algorithm', 'delete_customizedalgorithm', 19);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (58, 'Can add customized event type', 'add_customizedeventtype', 20);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (59, 'Can change customized event type', 'change_customizedeventtype', 20);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (60, 'Can delete customized event type', 'delete_customizedeventtype', 20);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (61, 'Can add device key', 'add_devicekey', 21);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (62, 'Can change device key', 'change_devicekey', 21);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (63, 'Can delete device key', 'delete_devicekey', 21);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (64, 'Can add event', 'add_event', 22);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (65, 'Can change event', 'change_event', 22);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (66, 'Can delete event', 'delete_event', 22);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (67, 'Can add event backup', 'add_eventbackup', 23);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (68, 'Can change event backup', 'change_eventbackup', 23);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (69, 'Can delete event backup', 'delete_eventbackup', 23);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (70, 'Can add inspection', 'add_inspection', 24);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (71, 'Can change inspection', 'change_inspection', 24);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (72, 'Can delete inspection', 'delete_inspection', 24);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (73, 'Can add inspect medium', 'add_inspectmedium', 25);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (74, 'Can change inspect medium', 'change_inspectmedium', 25);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (75, 'Can delete inspect medium', 'delete_inspectmedium', 25);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (76, 'Can add invitation', 'add_invitation', 26);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (77, 'Can change invitation', 'change_invitation', 26);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (78, 'Can delete invitation', 'delete_invitation', 26);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (79, 'Can add medium', 'add_medium', 27);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (80, 'Can change medium', 'change_medium', 27);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (81, 'Can delete medium', 'delete_medium', 27);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (82, 'Can add medium backup', 'add_mediumbackup', 28);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (83, 'Can change medium backup', 'change_mediumbackup', 28);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (84, 'Can delete medium backup', 'delete_mediumbackup', 28);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (85, 'Can add monitor', 'add_monitor', 29);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (86, 'Can change monitor', 'change_monitor', 29);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (87, 'Can delete monitor', 'delete_monitor', 29);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (88, 'Can add organization', 'add_organization', 30);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (89, 'Can change organization', 'change_organization', 30);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (90, 'Can delete organization', 'delete_organization', 30);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (91, 'Can add person', 'add_person', 31);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (92, 'Can change person', 'change_person', 31);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (93, 'Can delete person', 'delete_person', 31);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (94, 'Can add robot saved video', 'add_robotsavedvideo', 32);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (95, 'Can change robot saved video', 'change_robotsavedvideo', 32);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (96, 'Can delete robot saved video', 'delete_robotsavedvideo', 32);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (97, 'Can add robot snap', 'add_robotsnap', 33);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (98, 'Can change robot snap', 'change_robotsnap', 33);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (99, 'Can delete robot snap', 'delete_robotsnap', 33);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (100, 'Can add robot video', 'add_robotvideo', 34);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (101, 'Can change robot video', 'change_robotvideo', 34);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (102, 'Can delete robot video', 'delete_robotvideo', 34);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (103, 'Can add route', 'add_route', 35);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (104, 'Can change route', 'change_route', 35);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (105, 'Can delete route', 'delete_route', 35);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (106, 'Can add rule', 'add_rule', 36);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (107, 'Can change rule', 'change_rule', 36);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (108, 'Can delete rule', 'delete_rule', 36);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (109, 'Can add site', 'add_site', 37);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (110, 'Can change site', 'change_site', 37);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (111, 'Can delete site', 'delete_site', 37);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (112, 'Can add site management', 'add_sitemanagement', 38);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (113, 'Can change site management', 'change_sitemanagement', 38);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (114, 'Can delete site management', 'delete_sitemanagement', 38);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (115, 'Can add site manager', 'add_sitemanager', 39);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (116, 'Can change site manager', 'change_sitemanager', 39);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (117, 'Can delete site manager', 'delete_sitemanager', 39);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (118, 'Can add snap', 'add_snap', 40);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (119, 'Can change snap', 'change_snap', 40);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (120, 'Can delete snap', 'delete_snap', 40);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (121, 'Can add task', 'add_task', 41);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (122, 'Can change task', 'change_task', 41);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (123, 'Can delete task', 'delete_task', 41);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (124, 'Can add way point', 'add_waypoint', 42);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (125, 'Can change way point', 'change_waypoint', 42);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (126, 'Can delete way point', 'delete_waypoint', 42);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (127, 'Can add way point history', 'add_waypointhistory', 43);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (128, 'Can change way point history', 'change_waypointhistory', 43);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (129, 'Can delete way point history', 'delete_waypointhistory', 43);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (130, 'Can add web hook', 'add_webhook', 44);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (131, 'Can change web hook', 'change_webhook', 44);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (132, 'Can delete web hook', 'delete_webhook', 44);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (133, 'Can add box', 'add_box', 45);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (134, 'Can change box', 'change_box', 45);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (135, 'Can delete box', 'delete_box', 45);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (136, 'Can add patrol', 'add_patrol', 46);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (137, 'Can change patrol', 'change_patrol', 46);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (138, 'Can delete patrol', 'delete_patrol', 46);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (139, 'Can add robot', 'add_robot', 47);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (140, 'Can change robot', 'change_robot', 47);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (141, 'Can delete robot', 'delete_robot', 47);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (142, 'Can add manual cleanup task', 'add_manualcleanuptask', 48);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (143, 'Can change manual cleanup task', 'change_manualcleanuptask', 48);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (144, 'Can delete manual cleanup task', 'delete_manualcleanuptask', 48);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (145, 'Can add department manager', 'add_departmentmanager', 49);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (146, 'Can change department manager', 'change_departmentmanager', 49);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (147, 'Can delete department manager', 'delete_departmentmanager', 49);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (148, 'Can add notify rule', 'add_notifyrule', 50);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (149, 'Can change notify rule', 'change_notifyrule', 50);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (150, 'Can delete notify rule', 'delete_notifyrule', 50);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (151, 'Can add Organization UI Strategy', 'add_organizationuistrategy', 51);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (152, 'Can change Organization UI Strategy', 'change_organizationuistrategy', 51);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (153, 'Can delete Organization UI Strategy', 'delete_organizationuistrategy', 51);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (154, 'Can add ui strategy', 'add_uistrategy', 52);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (155, 'Can change ui strategy', 'change_uistrategy', 52);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (156, 'Can delete ui strategy', 'delete_uistrategy', 52);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (157, 'Can add ip white list', 'add_ipwhitelist', 53);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (158, 'Can change ip white list', 'change_ipwhitelist', 53);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (159, 'Can delete ip white list', 'delete_ipwhitelist', 53);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (160, 'Can add thermal camera settings', 'add_thermalcamerasettings', 54);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (161, 'Can change thermal camera settings', 'change_thermalcamerasettings', 54);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (162, 'Can delete thermal camera settings', 'delete_thermalcamerasettings', 54);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (163, 'Can add thermal camera settings batch update record', 'add_thermalcamerasettingsbatchupdaterecord', 55);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (164, 'Can change thermal camera settings batch update record', 'change_thermalcamerasettingsbatchupdaterecord', 55);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (165, 'Can delete thermal camera settings batch update record', 'delete_thermalcamerasettingsbatchupdaterecord', 55);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (166, 'Can add thermal camera settings check record', 'add_thermalcamerasettingscheckrecord', 56);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (167, 'Can change thermal camera settings check record', 'change_thermalcamerasettingscheckrecord', 56);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (168, 'Can delete thermal camera settings check record', 'delete_thermalcamerasettingscheckrecord', 56);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (169, 'Can add camera firmware version', 'add_camerafirmwareversion', 57);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (170, 'Can change camera firmware version', 'change_camerafirmwareversion', 57);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (171, 'Can delete camera firmware version', 'delete_camerafirmwareversion', 57);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (172, 'Can add box location', 'add_boxlocation', 58);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (173, 'Can change box location', 'change_boxlocation', 58);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (174, 'Can delete box location', 'delete_boxlocation', 58);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (175, 'Can add location event black list', 'add_locationeventblacklist', 59);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (176, 'Can change location event black list', 'change_locationeventblacklist', 59);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (177, 'Can delete location event black list', 'delete_locationeventblacklist', 59);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (178, 'Can add camera tracking object', 'add_cameratrackingobject', 60);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (179, 'Can change camera tracking object', 'change_cameratrackingobject', 60);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (180, 'Can delete camera tracking object', 'delete_cameratrackingobject', 60);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (181, 'Can add sharing', 'add_sharing', 61);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (182, 'Can change sharing', 'change_sharing', 61);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (183, 'Can delete sharing', 'delete_sharing', 61);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (184, 'Can add camera prefix', 'add_cameraprefix', 62);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (185, 'Can change camera prefix', 'change_cameraprefix', 62);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (186, 'Can delete camera prefix', 'delete_cameraprefix', 62);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (187, 'Can add camera provider', 'add_cameraprovider', 63);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (188, 'Can change camera provider', 'change_cameraprovider', 63);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (189, 'Can delete camera provider', 'delete_cameraprovider', 63);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (190, 'Can add feedback', 'add_feedback', 64);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (191, 'Can change feedback', 'change_feedback', 64);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (192, 'Can delete feedback', 'delete_feedback', 64);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (193, 'Can add notification', 'add_notification', 65);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (194, 'Can change notification', 'change_notification', 65);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (195, 'Can delete notification', 'delete_notification', 65);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (196, 'Can add box payment', 'add_boxpayment', 66);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (197, 'Can change box payment', 'change_boxpayment', 66);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (198, 'Can delete box payment', 'delete_boxpayment', 66);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (199, 'Can add box pricing', 'add_boxpricing', 67);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (200, 'Can change box pricing', 'change_boxpricing', 67);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (201, 'Can delete box pricing', 'delete_boxpricing', 67);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (202, 'Can add box subs', 'add_boxsubs', 68);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (203, 'Can change box subs', 'change_boxsubs', 68);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (204, 'Can delete box subs', 'delete_boxsubs', 68);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (205, 'Can add client', 'add_client', 69);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (206, 'Can change client', 'change_client', 69);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (207, 'Can delete client', 'delete_client', 69);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (208, 'Can add customer', 'add_customer', 70);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (209, 'Can change customer', 'change_customer', 70);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (210, 'Can delete customer', 'delete_customer', 70);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (211, 'Can add distributor', 'add_distributor', 71);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (212, 'Can change distributor', 'change_distributor', 71);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (213, 'Can delete distributor', 'delete_distributor', 71);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (214, 'Can add employee', 'add_employee', 72);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (215, 'Can change employee', 'change_employee', 72);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (216, 'Can delete employee', 'delete_employee', 72);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (217, 'Can add payment', 'add_payment', 73);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (218, 'Can change payment', 'change_payment', 73);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (219, 'Can delete payment', 'delete_payment', 73);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (220, 'Can add pricing', 'add_pricing', 74);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (221, 'Can change pricing', 'change_pricing', 74);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (222, 'Can delete pricing', 'delete_pricing', 74);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (223, 'Can add robot payment', 'add_robotpayment', 75);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (224, 'Can change robot payment', 'change_robotpayment', 75);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (225, 'Can delete robot payment', 'delete_robotpayment', 75);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (226, 'Can add robot subs', 'add_robotsubs', 76);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (227, 'Can change robot subs', 'change_robotsubs', 76);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (228, 'Can delete robot subs', 'delete_robotsubs', 76);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (229, 'Can add seller', 'add_seller', 77);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (230, 'Can change seller', 'change_seller', 77);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (231, 'Can delete seller', 'delete_seller', 77);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (232, 'Can add forward action', 'add_forwardaction', 78);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (233, 'Can change forward action', 'change_forwardaction', 78);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (234, 'Can delete forward action', 'delete_forwardaction', 78);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (235, 'Can add level requirement', 'add_levelrequirement', 79);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (236, 'Can change level requirement', 'change_levelrequirement', 79);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (237, 'Can delete level requirement', 'delete_levelrequirement', 79);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (238, 'Can add update status', 'add_updatestatus', 80);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (239, 'Can change update status', 'change_updatestatus', 80);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (240, 'Can delete update status', 'delete_updatestatus', 80);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (241, 'Can add device', 'add_device', 81);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (242, 'Can change device', 'change_device', 81);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (243, 'Can delete device', 'delete_device', 81);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (244, 'Can add system id', 'add_systemid', 82);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (245, 'Can change system id', 'change_systemid', 82);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (246, 'Can delete system id', 'delete_systemid', 82);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (247, 'Can add case', 'add_case', 83);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (248, 'Can change case', 'change_case', 83);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (249, 'Can delete case', 'delete_case', 83);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (250, 'Can add case history', 'add_casehistory', 84);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (251, 'Can change case history', 'change_casehistory', 84);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (252, 'Can delete case history', 'delete_casehistory', 84);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (253, 'Can add case medium', 'add_casemedium', 85);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (254, 'Can change case medium', 'change_casemedium', 85);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (255, 'Can delete case medium', 'delete_casemedium', 85);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (256, 'Can add guard', 'add_guard', 86);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (257, 'Can change guard', 'change_guard', 86);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (258, 'Can delete guard', 'delete_guard', 86);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (259, 'Can add guard admin', 'add_guardadmin', 87);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (260, 'Can change guard admin', 'change_guardadmin', 87);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (261, 'Can delete guard admin', 'delete_guardadmin', 87);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (262, 'Can add guard company', 'add_guardcompany', 88);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (263, 'Can change guard company', 'change_guardcompany', 88);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (264, 'Can delete guard company', 'delete_guardcompany', 88);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (265, 'Can add incident', 'add_incident', 89);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (266, 'Can change incident', 'change_incident', 89);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (267, 'Can delete incident', 'delete_incident', 89);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (268, 'Can add monitoring operator', 'add_monitoringoperator', 90);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (269, 'Can change monitoring operator', 'change_monitoringoperator', 90);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (270, 'Can delete monitoring operator', 'delete_monitoringoperator', 90);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (271, 'Can add note', 'add_note', 91);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (272, 'Can change note', 'change_note', 91);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (273, 'Can delete note', 'delete_note', 91);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (274, 'Can add site operation', 'add_siteoperation', 92);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (275, 'Can change site operation', 'change_siteoperation', 92);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (276, 'Can delete site operation', 'delete_siteoperation', 92);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (277, 'Can add case export config', 'add_caseexportconfig', 93);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (278, 'Can change case export config', 'change_caseexportconfig', 93);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (279, 'Can delete case export config', 'delete_caseexportconfig', 93);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (280, 'Can add case export record', 'add_caseexportrecord', 94);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (281, 'Can change case export record', 'change_caseexportrecord', 94);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (282, 'Can delete case export record', 'delete_caseexportrecord', 94);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (283, 'Can add beat global', 'add_beatglobal', 95);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (284, 'Can change beat global', 'change_beatglobal', 95);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (285, 'Can delete beat global', 'delete_beatglobal', 95);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (286, 'Can add beat job', 'add_beatjob', 96);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (287, 'Can change beat job', 'change_beatjob', 96);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (288, 'Can delete beat job', 'delete_beatjob', 96);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (289, 'Can add action', 'add_action', 97);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (290, 'Can change action', 'change_action', 97);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (291, 'Can delete action', 'delete_action', 97);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (292, 'Can add resource type', 'add_resourcetype', 98);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (293, 'Can change resource type', 'change_resourcetype', 98);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (294, 'Can delete resource type', 'delete_resourcetype', 98);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (295, 'Can add role', 'add_role', 99);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (296, 'Can change role', 'change_role', 99);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (297, 'Can delete role', 'delete_role', 99);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (298, 'Can add role policy', 'add_rolepolicy', 100);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (299, 'Can change role policy', 'change_rolepolicy', 100);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (300, 'Can delete role policy', 'delete_rolepolicy', 100);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (301, 'Can add domain', 'add_domain', 101);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (302, 'Can change domain', 'change_domain', 101);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (303, 'Can delete domain', 'delete_domain', 101);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (304, 'Can add domain site', 'add_domainsite', 102);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (305, 'Can change domain site', 'change_domainsite', 102);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (306, 'Can delete domain site', 'delete_domainsite', 102);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (307, 'Can add domain type', 'add_domaintype', 103);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (308, 'Can change domain type', 'change_domaintype', 103);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (309, 'Can delete domain type', 'delete_domaintype', 103);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (310, 'Can add domain user', 'add_domainuser', 104);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (311, 'Can change domain user', 'change_domainuser', 104);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (312, 'Can delete domain user', 'delete_domainuser', 104);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (313, 'Can add organization delegate', 'add_organizationdelegate', 105);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (314, 'Can change organization delegate', 'change_organizationdelegate', 105);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (315, 'Can delete organization delegate', 'delete_organizationdelegate', 105);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (316, 'Can add organization user', 'add_organizationuser', 106);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (317, 'Can change organization user', 'change_organizationuser', 106);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (318, 'Can delete organization user', 'delete_organizationuser', 106);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (319, 'Can add user node', 'add_usernode', 107);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (320, 'Can change user node', 'change_usernode', 107);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (321, 'Can delete user node', 'delete_usernode', 107);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (322, 'Can add map', 'add_map', 108);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (323, 'Can change map', 'change_map', 108);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (324, 'Can delete map', 'delete_map', 108);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (325, 'Can add map config', 'add_mapconfig', 109);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (326, 'Can change map config', 'change_mapconfig', 109);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (327, 'Can delete map config', 'delete_mapconfig', 109);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (328, 'Can add map target', 'add_maptarget', 110);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (329, 'Can change map target', 'change_maptarget', 110);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (330, 'Can delete map target', 'delete_maptarget', 110);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (331, 'Can add site map', 'add_sitemap', 111);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (332, 'Can change site map', 'change_sitemap', 111);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (333, 'Can delete site map', 'delete_sitemap', 111);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (334, 'Can add target', 'add_target', 112);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (335, 'Can change target', 'change_target', 112);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (336, 'Can delete target', 'delete_target', 112);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (337, 'Can add notify info', 'add_notifyinfo', 113);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (338, 'Can change notify info', 'change_notifyinfo', 113);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (339, 'Can delete notify info', 'delete_notifyinfo', 113);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (340, 'Can add raw event', 'add_rawevent', 114);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (341, 'Can change raw event', 'change_rawevent', 114);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (342, 'Can delete raw event', 'delete_rawevent', 114);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (343, 'Can add sample', 'add_sample', 115);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (344, 'Can change sample', 'change_sample', 115);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (345, 'Can delete sample', 'delete_sample', 115);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (346, 'Can add user site', 'add_usersite', 116);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (347, 'Can change user site', 'change_usersite', 116);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (348, 'Can delete user site', 'delete_usersite', 116);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (349, 'Can add algo config', 'add_algoconfig', 117);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (350, 'Can change algo config', 'change_algoconfig', 117);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (351, 'Can delete algo config', 'delete_algoconfig', 117);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (352, 'Can add detection task', 'add_detectiontask', 118);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (353, 'Can change detection task', 'change_detectiontask', 118);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (354, 'Can delete detection task', 'delete_detectiontask', 118);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (355, 'Can add target', 'add_target', 119);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (356, 'Can change target', 'change_target', 119);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (357, 'Can delete target', 'delete_target', 119);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (358, 'Can add algo reference', 'add_algoreference', 120);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (359, 'Can change algo reference', 'change_algoreference', 120);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (360, 'Can delete algo reference', 'delete_algoreference', 120);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (361, 'Can add building', 'add_building', 121);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (362, 'Can change building', 'change_building', 121);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (363, 'Can delete building', 'delete_building', 121);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (364, 'Can add floor', 'add_floor', 122);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (365, 'Can change floor', 'change_floor', 122);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (366, 'Can delete floor', 'delete_floor', 122);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (367, 'Can add wechat user', 'add_wechatuser', 123);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (368, 'Can change wechat user', 'change_wechatuser', 123);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (369, 'Can delete wechat user', 'delete_wechatuser', 123);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (370, 'Can add face', 'add_face', 124);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (371, 'Can change face', 'change_face', 124);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (372, 'Can delete face', 'delete_face', 124);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (373, 'Can add face lib', 'add_facelib', 125);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (374, 'Can change face lib', 'change_facelib', 125);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (375, 'Can delete face lib', 'delete_facelib', 125);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (376, 'Can add tracking object', 'add_trackingobject', 126);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (377, 'Can change tracking object', 'change_trackingobject', 126);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (378, 'Can delete tracking object', 'delete_trackingobject', 126);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (379, 'Can add settings', 'add_settings', 127);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (380, 'Can change settings', 'change_settings', 127);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (381, 'Can delete settings', 'delete_settings', 127);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (382, 'Can add questionnaire', 'add_questionnaire', 128);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (383, 'Can change questionnaire', 'change_questionnaire', 128);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (384, 'Can delete questionnaire', 'delete_questionnaire', 128);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (385, 'Can add questionnaire result', 'add_questionnaireresult', 129);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (386, 'Can change questionnaire result', 'change_questionnaireresult', 129);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (387, 'Can delete questionnaire result', 'delete_questionnaireresult', 129);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (388, 'Can add group', 'add_group', 130);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (389, 'Can change group', 'change_group', 130);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (390, 'Can delete group', 'delete_group', 130);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (391, 'Can add group user', 'add_groupuser', 131);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (392, 'Can change group user', 'change_groupuser', 131);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (393, 'Can delete group user', 'delete_groupuser', 131);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (394, 'Can add human count info', 'add_humancountinfo', 132);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (395, 'Can change human count info', 'change_humancountinfo', 132);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (396, 'Can delete human count info', 'delete_humancountinfo', 132);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (397, 'Can add human count media file', 'add_humancountmediafile', 133);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (398, 'Can change human count media file', 'change_humancountmediafile', 133);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (399, 'Can delete human count media file', 'delete_humancountmediafile', 133);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (400, 'Can add human count real time info', 'add_humancountrealtimeinfo', 134);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (401, 'Can change human count real time info', 'change_humancountrealtimeinfo', 134);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (402, 'Can delete human count real time info', 'delete_humancountrealtimeinfo', 134);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (403, 'Can add event and tracking object', 'add_eventandtrackingobject', 135);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (404, 'Can change event and tracking object', 'change_eventandtrackingobject', 135);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (405, 'Can delete event and tracking object', 'delete_eventandtrackingobject', 135);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (406, 'Can add throttle counters', 'add_throttlecounters', 136);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (407, 'Can change throttle counters', 'change_throttlecounters', 136);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (408, 'Can delete throttle counters', 'delete_throttlecounters', 136);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (409, 'Can add third auth conf', 'add_thirdauthconf', 137);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (410, 'Can change third auth conf', 'change_thirdauthconf', 137);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (411, 'Can delete third auth conf', 'delete_thirdauthconf', 137);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (412, 'Can add agreement', 'add_agreement', 138);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (413, 'Can change agreement', 'change_agreement', 138);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (414, 'Can delete agreement', 'delete_agreement', 138);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (415, 'Can add agreement', 'add_useragreement', 139);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (416, 'Can change agreement', 'change_useragreement', 139);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (417, 'Can delete agreement', 'delete_useragreement', 139);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (418, 'Can add notification', 'add_notification', 140);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (419, 'Can change notification', 'change_notification', 140);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (420, 'Can delete notification', 'delete_notification', 140);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (421, 'Can add system status', 'add_systemstatus', 141);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (422, 'Can change system status', 'change_systemstatus', 141);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (423, 'Can delete system status', 'delete_systemstatus', 141);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (424, 'Can add Blacklist', 'add_blacklist', 142);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (425, 'Can change Blacklist', 'change_blacklist', 142);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (426, 'Can delete Blacklist', 'delete_blacklist', 142);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (427, 'Can add business', 'add_business', 143);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (428, 'Can change business', 'change_business', 143);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (429, 'Can delete business', 'delete_business', 143);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (430, 'Can add channel', 'add_channel', 144);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (431, 'Can change channel', 'change_channel', 144);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (432, 'Can delete channel', 'delete_channel', 144);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (433, 'Can add custom algo', 'add_customalgo', 145);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (434, 'Can change custom algo', 'change_customalgo', 145);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (435, 'Can delete custom algo', 'delete_customalgo', 145);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (436, 'Can add custom algo notify', 'add_customalgonotify', 146);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (437, 'Can change custom algo notify', 'change_customalgonotify', 146);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (438, 'Can delete custom algo notify', 'delete_customalgonotify', 146);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (439, 'Can add device', 'add_device', 147);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (440, 'Can change device', 'change_device', 147);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (441, 'Can delete device', 'delete_device', 147);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (442, 'Can add event ext', 'add_eventext', 148);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (443, 'Can change event ext', 'change_eventext', 148);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (444, 'Can delete event ext', 'delete_eventext', 148);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (445, 'Can add fm event', 'add_fmevent', 149);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (446, 'Can change fm event', 'change_fmevent', 149);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (447, 'Can delete fm event', 'delete_fmevent', 149);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (448, 'Can add org ext', 'add_orgext', 150);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (449, 'Can change org ext', 'change_orgext', 150);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (450, 'Can delete org ext', 'delete_orgext', 150);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (451, 'Can add robot incident notify record', 'add_robotincidentnotifyrecord', 151);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (452, 'Can change robot incident notify record', 'change_robotincidentnotifyrecord', 151);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (453, 'Can delete robot incident notify record', 'delete_robotincidentnotifyrecord', 151);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (454, 'Can add robot notifier', 'add_robotnotifier', 152);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (455, 'Can change robot notifier', 'change_robotnotifier', 152);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (456, 'Can delete robot notifier', 'delete_robotnotifier', 152);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (457, 'Can add rule', 'add_rule', 153);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (458, 'Can change rule', 'change_rule', 153);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (459, 'Can delete rule', 'delete_rule', 153);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (460, 'Can add site floor video', 'add_sitefloorvideo', 154);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (461, 'Can change site floor video', 'change_sitefloorvideo', 154);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (462, 'Can delete site floor video', 'delete_sitefloorvideo', 154);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (463, 'Can add user ext', 'add_userext', 155);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (464, 'Can change user ext', 'change_userext', 155);
INSERT INTO public.auth_permission (id, name, codename, content_type_id) VALUES (465, 'Can delete user ext', 'delete_userext', 155);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (1, 'pbkdf2_sha256$36000$wSecgMfTROCP$2Pp1Ld0PNEXjFw3LzF2QsdAXlHU8n2AkTWzXIG2P1CI=', '2020-05-07 11:43:30.358602+08', true, '', '', 'admin@turingvideo.net', true, true, '2020-05-07 11:38:50.458289+08', 'admin@turingvideo.net', '2020-05-07 11:38:50.504856+08', 'customer', 'en', 'vq7AWhmMp2CP8ptig6Za9HKBQGUSEVEXsWEEkpfE', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (2, 'pbkdf2_sha256$36000$98VBD2eqBSDf$GWa6vLGrLQXdDU5XC39l6eg/ReCPDvuoq6d3I5Oyd30=', NULL, false, '', '', 'customer@turingvideo.net', false, true, '2020-05-07 11:44:41.812868+08', 'customer@turingvideo.net', '2020-05-07 11:44:41.841946+08', 'customer', 'en', 'tufbTkRdEKMkjW7RfEoYG1rqzbZVNwDRM1Pvcs2Q', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (3, 'pbkdf2_sha256$36000$iqFkOzVpsMFX$m4PAukKJeQNf8339YkrDNIuV38tjdIxTDcO1wdoeAd4=', NULL, false, '', '', 'site@turingvideo.net', false, true, '2020-05-07 15:47:06.472261+08', 'site@turingvideo.net', '2020-05-07 15:47:06.501224+08', 'customer', 'en', 'Fg4Dl6vHtqDOHca5HSRVY5cb2Z9p7YhQ6TLDoQzi', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (4, 'pbkdf2_sha256$36000$AjJVSvtJblNp$5oYoKP1jQoEd84nWmTMVxBa3TJgMUp9ch5qaB58tMhE=', NULL, false, '', '', 'guardadmin@turingvideo.net', false, true, '2020-05-08 11:46:26.337923+08', 'guardadmin@turingvideo.net', '2020-05-08 11:46:26.375985+08', 'customer', 'en', 'NE3hphvoWP2PPAJleE74pQZuKtsPvKnKXytaSoSm', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (5, 'pbkdf2_sha256$36000$e67Zq1goPxIO$WuPw+qSlCqKd7DDN5h2nQtPxUYvkfZn9eY4HXcq7pEk=', NULL, false, '', '', 'guard_admin_del@turingvideo.net', false, true, '2020-05-08 11:57:22.91533+08', 'guard_admin_del@turingvideo.net', '2020-05-08 11:57:22.95062+08', 'customer', 'en', 'qeUiLvSBire7zfwVCF34TCfP6e37PyI4GsD598fw', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (6, 'pbkdf2_sha256$36000$BVt6rwbE2F0w$s3pJp1PA3XZABOmT21Y603vBZLt1LpBrUW0Dq4fHPBs=', NULL, false, '', '', 'guard_guard@turingvideo.net', false, true, '2020-05-08 12:03:09.742972+08', 'guard_guard@turingvideo.net', '2020-05-08 12:03:09.773151+08', 'customer', 'en', 'AOj2XeYEwb5mQoPHFiuG8dKv2frJKKMw0oUAjRdP', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);
INSERT INTO public.auth_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, updated_at, role, lang, nonce, timezone, temperature_unit, lock_expiration, use2fa) VALUES (7, 'pbkdf2_sha256$36000$QxEH9U9Nbd9D$5G3W0gRJgfVvcb8gHI1MxuHwAMAhIksXJqd7+ESj138=', '2020-05-13 09:47:34.228029+08', false, 'dafault', 'li', 'monitor@turingvideo.net', false, true, '2020-05-08 14:35:00+08', 'monitor@turingvideo.net', '2020-05-13 09:47:15.735876+08', 'customer', 'en', 'OWuVcfBbanJFDcJMntLPMrlaKEhgskj5903nJ1KH', 'America/Los_Angeles', 'c', '1970-01-01 08:00:00+08', false);


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: back_cameraprefix; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: back_cameraprovider; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: back_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: back_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_boxpayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_boxpricing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_boxsubs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill_boxsubs (created_at, updated_at, id, status, canceled_by, pending, allocated_at, distributed_at, activated_at, start_at, end_at, end_date, type, switch_price, price, pricing, distributed_pricing, allocated_pricing, client_id, distributor_id, employee_id, seller_id) VALUES ('2018-09-13 08:40:01.729+08', '2018-09-14 09:23:19.715+08', 'box_test_10001', 'paid', '', false, '2018-05-25 05:36:53.951+08', '2018-05-25 05:39:19.134+08', '2018-05-25 05:40:43.83+08', '2018-06-09 07:43:15.323+08', NULL, NULL, 'monthly', NULL, '{"price":"30.0","hash":"a46bf2ba83a0977627b85195a350a49bbbd237c5450f7a3cbf33bd7dcafbf35e","services":{"record":{"duration":1,"name":"record"},"event":{"duration":7,"name":"event"}},"base_prices":{"activated_price":"30.0","distributed_price":"20.0","allocated_price":"10.0"},"matrix":null,"type":"monthly","package":{"services":[{"duration":1,"name":"record"},{"duration":7,"name":"event"}],"price":"30.0","base_prices":{"activated_price":"30.0","distributed_price":"20.0","allocated_price":"10.0"},"label":"Basic"}}', '{"hash":"1fb00faa13cc42bfd008511fa85c1dbf0ac9c4ea1c19f4c89419a4e1d631f156","packages":[{"services":[{"duration":1,"name":"record"},{"duration":7,"name":"event"}],"price":"30.0","base_prices":{"activated_price":"30.0","distributed_price":"20.0","allocated_price":"10.0"},"label":"Basic"}],"matrices":null}', '{"hash":"b0c9c965f828ebd6bd67df749b4aedce3f404e967ce06b4243f1d0f0c32550ec","packages":[{"services":[{"duration":1,"name":"record"},{"duration":7,"name":"event"}],"price":"20.0","base_prices":{"distributed_price":"20.0","allocated_price":"10.0"},"label":"Basic"}],"matrices":null}', '{"hash":"9a112f3ba5994d2845532d2754dcf8cd313bfb0f8fcaecff2f6a5ef4c34162bc","packages":[{"services":[{"duration":1,"name":"record"},{"duration":7,"name":"event"}],"price":"10.0","base_prices":{"allocated_price":"10.0"},"label":"Basic"}],"matrices":null}', 1, 1, NULL, 1);
INSERT INTO public.bill_boxsubs (created_at, updated_at, id, status, canceled_by, pending, allocated_at, distributed_at, activated_at, start_at, end_at, end_date, type, switch_price, price, pricing, distributed_pricing, allocated_pricing, client_id, distributor_id, employee_id, seller_id) VALUES ('2018-09-13 08:40:01.726+08', '2018-10-17 05:44:10.101+08', 'box_test_10002', 'paid', '', false, '2018-09-28 02:39:45.472+08', '2018-09-28 02:41:31.654+08', '2018-09-28 02:42:59.679+08', '2018-10-05 01:42:17.251+08', NULL, NULL, 'monthly', '{"price":"16.99","hash":"fdb864b7138856aa330e967aba86016c16dac5251834f5815b2d1178e12db7f0","services":{"record":{"duration":20,"name":"record"},"event":{"duration":20,"name":"event"}},"package":{"label":"Gorgeous+Si","price":"16.99","base_prices":{"activated_price":"16.99","distributed_price":"16.99","allocated_price":"15.99"},"services":[{"duration":20,"name":"record"},{"duration":20,"name":"event"}]},"matrix":null,"type":"monthly","base_prices":{"activated_price":"16.99","distributed_price":"16.99","allocated_price":"15.99"}}', '{"price":"9.99","base_prices":{"activated_price":"9.99","distributed_price":"9.99","allocated_price":"8.99"},"services":{"record":{"duration":10,"name":"record"},"event":{"duration":10,"name":"event"}},"hash":"703cbd63fb5d8e9a91a4526b725370d95e5fefb74be210ab1dc95b80bd1a0702","matrix":null,"type":"monthly","package":{"label":"Beautiful+si","price":"9.99","base_prices":{"activated_price":"9.99","distributed_price":"9.99","allocated_price":"8.99"},"services":[{"duration":10,"name":"record"},{"duration":10,"name":"event"}]}}', '{"hash":"aeef5d568a856c3b08cebce62d0db29c05bd1a7744ab962c2edef04dca452c77","packages":[{"label":"Nice+si","price":"4.99","base_prices":{"activated_price":"4.99","distributed_price":"4.99","allocated_price":"3.99"},"services":[{"duration":5,"name":"record"},{"duration":5,"name":"event"}]},{"label":"Beautiful+si","price":"9.99","base_prices":{"activated_price":"9.99","distributed_price":"9.99","allocated_price":"8.99"},"services":[{"duration":10,"name":"record"},{"duration":10,"name":"event"}]},{"label":"Gorgeous+Si","price":"16.99","base_prices":{"activated_price":"16.99","distributed_price":"16.99","allocated_price":"15.99"},"services":[{"duration":20,"name":"record"},{"duration":20,"name":"event"}]}],"matrices":null}', '{"hash":"aeef5d568a856c3b08cebce62d0db29c05bd1a7744ab962c2edef04dca452c77","packages":[{"label":"Nice+dist","price":"4.99","base_prices":{"distributed_price":"4.99","allocated_price":"3.99"},"services":[{"duration":5,"name":"record"},{"duration":5,"name":"event"}]},{"label":"Beautiful+dis","price":"9.99","base_prices":{"distributed_price":"9.99","allocated_price":"8.99"},"services":[{"duration":10,"name":"record"},{"duration":10,"name":"event"}]},{"label":"Gorgeous+dist","price":"16.99","base_prices":{"distributed_price":"16.99","allocated_price":"15.99"},"services":[{"duration":20,"name":"record"},{"duration":20,"name":"event"}]}],"matrices":null}', '{"hash":"a42c477fb21efe9cd91b5123ef0a0b06ff9050091aa5275b636d4ecdbc846dd6","packages":[{"label":"Basic","price":"3.99","base_prices":{"allocated_price":"3.99"},"services":[{"duration":5,"name":"record"},{"duration":5,"name":"event"}]},{"label":"Premium","price":"8.99","base_prices":{"allocated_price":"8.99"},"services":[{"duration":10,"name":"record"},{"duration":10,"name":"event"}]},{"label":"Superior","price":"15.99","base_prices":{"allocated_price":"15.99"},"services":[{"duration":20,"name":"record"},{"duration":20,"name":"event"}]}],"matrices":null}', 2, 2, NULL, 2);


--
-- Data for Name: bill_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill_client (id, created_at, updated_at, name, employee_id, seller_id, user_id) VALUES (1, '2018-06-21 09:03:14.122+08', '2018-06-21 09:03:14.122+08', 'sugar', NULL, 1, 2);
INSERT INTO public.bill_client (id, created_at, updated_at, name, employee_id, seller_id, user_id) VALUES (2, '2018-05-25 05:40:17.5+08', '2018-06-16 09:41:50.484+08', 'client8', NULL, 2, 2);


--
-- Data for Name: bill_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill_customer (created_at, updated_at, id, stripe_id, status, balance, enable_monitoring_service, guard_company_id) VALUES ('2020-05-07 11:47:43.646454+08', '2020-05-07 16:20:19.80761+08', 1, 'cus_FJhgsrroU7O1zT', 'paid', 0.00, false, 1);
INSERT INTO public.bill_customer (created_at, updated_at, id, stripe_id, status, balance, enable_monitoring_service, guard_company_id) VALUES ('2020-05-07 11:47:43.646454+08', '2020-05-07 16:20:19.80761+08', 2, 'cus_FpciHBlJloTkZl', 'paid', 0.00, false, 1);


--
-- Data for Name: bill_distributor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill_distributor (created_at, updated_at, id, name, balance) VALUES ('2018-06-21 08:59:19.95+08', '2018-06-21 08:59:19.95+08', 1, 'Sugar Lee', 0.00);
INSERT INTO public.bill_distributor (created_at, updated_at, id, name, balance) VALUES ('2018-03-08 04:03:26.765+08', '2018-03-08 04:03:26.765+08', 2, 'Distributor', 0.00);


--
-- Data for Name: bill_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_robotpayment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_robotsubs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: bill_seller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill_seller (created_at, updated_at, id, name, balance, distributor_id) VALUES ('2018-06-21 09:01:25.844+08', '2018-06-21 09:01:25.844+08', 1, 'sugar', 0.00, 1);
INSERT INTO public.bill_seller (created_at, updated_at, id, name, balance, distributor_id) VALUES ('2018-05-24 02:49:54.939+08', '2018-05-24 02:49:54.939+08', 2, 'sugar_seller', 0.00, 2);


--
-- Data for Name: ccs_notifyinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ccs_notifyinfo (id, created_at, updated_at, box_id, camera_id, user_id, types) VALUES (1, '2020-03-19 15:55:25.392876+08', '2020-03-19 15:55:25.392902+08', 'box_test_10001', 1, 2, '{}');


--
-- Data for Name: ccs_rawevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ccs_rawevent (created_at, updated_at, id, uuid, types, mark, data, camera_id, user_id, ended_at, started_at, box_id, org_id, site_id, raw_media) VALUES ('2020-05-07 16:23:10.324167+08', '2020-05-07 16:23:10.32421+08', 1, '34669346-30f7-4ce8-afb5-b1fb6bfab4d0', 'person:512', 'unknown', '\x800343013071002e', 1, 2, '2020-05-07 03:00:00+08', '2020-05-07 03:03:00+08', 'box_test_10001', 1, 1, '\x800343013071002e');


--
-- Data for Name: ccs_sample; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: ccs_usersite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ccs_usersite (id, created_at, updated_at, site_id, user_id) VALUES (1, '2020-05-07 16:21:47.205304+08', '2020-05-07 16:21:47.205387+08', 1, 2);


--
-- Data for Name: channel_forwardaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (1, '2020-02-26 11:22:53.211+08', '2020-03-04 15:30:01.916+08', 201, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (2, '2020-02-26 14:33:29.671+08', '2020-02-26 14:33:29.671+08', 139, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (3, '2020-03-06 14:25:31.286+08', '2020-03-06 14:25:31.286+08', 140, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (4, '2020-03-06 14:39:22.935+08', '2020-03-06 14:39:22.935+08', 202, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (5, '2020-03-06 14:50:33.928+08', '2020-03-06 14:50:33.928+08', 203, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (7, '2020-03-06 15:07:11.515+08', '2020-03-06 15:07:11.515+08', 204, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (8, '2020-03-07 13:24:28.788+08', '2020-03-07 13:24:28.788+08', 205, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (9, '2020-04-07 13:24:28.788+08', '2020-04-07 13:24:28.788+08', 210, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (10, '2020-05-20 13:24:28.788+08', '2020-05-20 13:24:28.788+08', 214, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (11, '2020-09-09 13:24:28.788+08', '2020-09-09 13:24:28.788+08', 252, 11);
INSERT INTO public.channel_forwardaction (id, created_at, updated_at, action_id, resource_type_id) VALUES (12, '2020-09-09 13:24:28.788+08', '2020-09-09 13:24:28.788+08', 253, 11);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2020-05-07 11:44:41.84434+08', '2', 'customer@turingvideo.net', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2020-05-07 11:47:43.655033+08', '2', 'customer@turingvideo.net', 1, '[{"added": {}}]', 56, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2020-05-07 11:50:09.784663+08', '1', '紫东创意产业园', 1, '[{"added": {}}]', 37, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2020-05-07 11:50:22.980166+08', 'box_test_10001', 'box_test_10001', 1, '[{"added": {}}]', 45, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2020-05-07 11:51:50.676957+08', 'box_test_10002', 'box_test_10002', 1, '[{"added": {}}]', 45, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2020-05-07 11:52:18.773159+08', 'box_test_10003', 'box_test_10003', 1, '[{"added": {}}]', 45, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2020-05-07 11:53:34.329092+08', '2', '无锡办公室', 1, '[{"added": {}}]', 37, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2020-05-07 11:53:38.732307+08', 'box_test_10003', 'box_test_10003', 2, '[{"changed": {"fields": ["meta", "site"]}}]', 45, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2020-05-07 15:03:17.816412+08', '1', '1: 前台', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2020-05-07 15:07:21.437003+08', '2', '2: 办公室', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2020-05-07 15:08:40.612789+08', '3', '3: 消防通道出口', 1, '[{"added": {}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2020-05-07 15:08:54.521084+08', '1', '1: 前台', 2, '[{"changed": {"fields": ["upload_video_enabled", "detect_params", "snapshot", "notifies", "note", "default_params"]}}]', 15, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2020-05-07 15:19:45.625321+08', 'robot_test_10001', 'robot_test_10001', 1, '[{"added": {}}]', 47, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2020-05-07 15:22:17.328953+08', 'robot_test_10002', 'robot_test_10002', 1, '[{"added": {}}]', 47, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2020-05-07 15:25:38.189617+08', 'robot_test_10003', 'robot_test_10003', 1, '[{"added": {}}]', 47, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2020-05-07 15:44:35.218649+08', '1', '测试', 2, '[{"changed": {"fields": ["code_name", "name"]}}]', 30, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2020-05-07 15:44:46.403329+08', '1', '测试 person:512 人群聚集', 1, '[{"added": {}}]', 19, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2020-05-07 15:45:01.651001+08', '2', '测试 person:513 人群疏散', 1, '[{"added": {}}]', 19, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2020-05-07 15:45:22.34435+08', '1', 'Organization 1, code_name: person:512 人群聚集', 1, '[{"added": {}}]', 20, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2020-05-07 15:45:34.627829+08', '2', 'Organization 1, code_name: person:513 人群疏散', 1, '[{"added": {}}]', 20, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2020-05-07 15:47:06.503576+08', '3', 'site@turingvideo.net', 1, '[{"added": {}}]', 2, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2020-05-07 15:47:11.401194+08', '3', 'site@turingvideo.net', 1, '[{"added": {}}]', 39, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2020-05-07 15:47:27.576851+08', '1', 'SiteManagement object', 1, '[{"added": {}}]', 38, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2020-05-07 15:49:17.24674+08', '1', 'Rule object', 1, '[{"added": {}}]', 36, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2020-05-07 15:51:16.708882+08', '2', 'Rule object', 1, '[{"added": {}}]', 36, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2020-05-07 15:53:36.956509+08', '1', 'root, 紫东创意产业园, 1, 测试', 1, '[{"added": {}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2020-05-07 15:55:06.020421+08', '2', 'West District, 西区, 1, 测试', 1, '[{"added": {}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2020-05-07 15:56:09.280513+08', '3', 'root, 紫东, 2, 测试', 1, '[{"added": {}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2020-05-07 15:56:31.737948+08', '4', 'root, 金马, 3, 测试', 1, '[{"added": {}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (30, '2020-05-07 15:56:58.711768+08', '5', 'update, 金马地铁站, 3, 测试', 1, '[{"added": {}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (31, '2020-05-07 15:57:07.520719+08', '4', 'root, 金马路, 3, 测试', 2, '[{"changed": {"fields": ["name"]}}]', 85, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (32, '2020-05-07 15:59:36.729152+08', '1', 'id: 1, map_type: baidu', 1, '[{"added": {}}]', 91, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (33, '2020-05-07 16:00:25.02894+08', '1', 'id: 1, map_config: (id: 1, map_type: baidu)', 1, '[{"added": {}}]', 90, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (34, '2020-05-07 16:00:32.238671+08', '1', '1, zidong, 测试', 1, '[{"added": {}}]', 83, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (35, '2020-05-07 16:02:05.446813+08', '2', 'id: 2, map_type: image', 1, '[{"added": {}}]', 91, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (36, '2020-05-07 16:02:22.650503+08', '2', 'id: 2, map_config: (id: 2, map_type: image)', 1, '[{"added": {}}]', 90, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (37, '2020-05-07 16:02:26.601182+08', '2', '2, West District, 测试', 1, '[{"added": {}}]', 83, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (38, '2020-05-07 16:04:01.036961+08', '3', '3, delete, 测试', 1, '[{"added": {}}]', 83, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (39, '2020-05-07 16:04:39.590006+08', '4', '4, update, 测试', 1, '[{"added": {}}]', 83, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (40, '2020-05-07 16:05:38.568085+08', '5', '5, update, 测试', 1, '[{"added": {}}]', 83, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (41, '2020-05-07 16:15:29.281367+08', '2', '2, organization: 测试, user: site@turingvideo.net', 1, '[{"added": {}}]', 88, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (42, '2020-05-07 16:15:54.732395+08', '1', '1, domain: 2, West District, 测试, user: site@turingvideo.net', 1, '[{"added": {}}]', 86, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (43, '2020-05-07 16:16:56.175244+08', '3', 'id: 3, map_type: google', 1, '[{"added": {}}]', 91, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (44, '2020-05-07 16:17:42.210205+08', '3', 'id: 3, map_config: (id: 3, map_type: google)', 1, '[{"added": {}}]', 90, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (45, '2020-05-07 16:20:12.073898+08', '1', '1, turing', 1, '[{"added": {}}]', 74, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (46, '2020-05-07 16:20:19.809065+08', '2', 'customer@turingvideo.net', 2, '[{"changed": {"fields": ["guard_company"]}}]', 56, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (47, '2020-05-07 16:21:47.206718+08', '1', 'UserSite object', 1, '[{"added": {}}]', 98, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (48, '2020-05-07 16:23:10.325654+08', '1', 'RawEvent object', 1, '[{"added": {}}]', 96, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (49, '2020-05-07 16:24:20.837383+08', '5', 'customer', 2, '[{"changed": {"fields": ["users"]}}]', 81, 1);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'push_notifications', 'apnsdevice');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'push_notifications', 'gcmdevice');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'push_notifications', 'wnsdevice');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'algorithm', 'algorithm');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'algorithm', 'eventtype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'algorithm', 'productalgorithm');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'algorithm', 'producttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'logic', 'agent');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'logic', 'camera');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'logic', 'cameralocation');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (17, 'logic', 'camerasavedvideo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (18, 'logic', 'cameravideo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (19, 'logic', 'customizedalgorithm');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (20, 'logic', 'customizedeventtype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (21, 'logic', 'devicekey');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (22, 'logic', 'event');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (23, 'logic', 'eventbackup');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (24, 'logic', 'inspection');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (25, 'logic', 'inspectmedium');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (26, 'logic', 'invitation');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (27, 'logic', 'medium');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (28, 'logic', 'mediumbackup');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (29, 'logic', 'monitor');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (30, 'logic', 'organization');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (31, 'logic', 'person');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (32, 'logic', 'robotsavedvideo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (33, 'logic', 'robotsnap');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (34, 'logic', 'robotvideo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (35, 'logic', 'route');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (36, 'logic', 'rule');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (37, 'logic', 'site');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (38, 'logic', 'sitemanagement');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (39, 'logic', 'sitemanager');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (40, 'logic', 'snap');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (41, 'logic', 'task');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (42, 'logic', 'waypoint');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (43, 'logic', 'waypointhistory');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (44, 'logic', 'webhook');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (45, 'logic', 'box');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (46, 'logic', 'patrol');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (47, 'logic', 'robot');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (48, 'logic', 'manualcleanuptask');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (49, 'logic', 'departmentmanager');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (50, 'logic', 'notifyrule');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (51, 'logic', 'organizationuistrategy');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (52, 'logic', 'uistrategy');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (53, 'logic', 'ipwhitelist');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (54, 'logic', 'thermalcamerasettings');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (55, 'logic', 'thermalcamerasettingsbatchupdaterecord');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (56, 'logic', 'thermalcamerasettingscheckrecord');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (57, 'logic', 'camerafirmwareversion');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (58, 'logic', 'boxlocation');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (59, 'logic', 'locationeventblacklist');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (60, 'logic', 'cameratrackingobject');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (61, 'logic', 'sharing');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (62, 'back', 'cameraprefix');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (63, 'back', 'cameraprovider');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (64, 'back', 'feedback');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (65, 'back', 'notification');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (66, 'bill', 'boxpayment');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (67, 'bill', 'boxpricing');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (68, 'bill', 'boxsubs');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (69, 'bill', 'client');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (70, 'bill', 'customer');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (71, 'bill', 'distributor');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (72, 'bill', 'employee');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (73, 'bill', 'payment');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (74, 'bill', 'pricing');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (75, 'bill', 'robotpayment');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (76, 'bill', 'robotsubs');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (77, 'bill', 'seller');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (78, 'channel', 'forwardaction');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (79, 'iot', 'levelrequirement');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (80, 'iot', 'updatestatus');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (81, 'iot', 'device');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (82, 'iot', 'systemid');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (83, 'guard', 'case');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (84, 'guard', 'casehistory');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (85, 'guard', 'casemedium');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (86, 'guard', 'guard');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (87, 'guard', 'guardadmin');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (88, 'guard', 'guardcompany');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (89, 'guard', 'incident');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (90, 'guard', 'monitoringoperator');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (91, 'guard', 'note');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (92, 'guard', 'siteoperation');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (93, 'guard', 'caseexportconfig');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (94, 'guard', 'caseexportrecord');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (95, 'guard', 'beatglobal');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (96, 'guard', 'beatjob');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (97, 'perm', 'action');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (98, 'perm', 'resourcetype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (99, 'perm', 'role');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (100, 'perm', 'rolepolicy');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (101, 'org', 'domain');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (102, 'org', 'domainsite');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (103, 'org', 'domaintype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (104, 'org', 'domainuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (105, 'org', 'organizationdelegate');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (106, 'org', 'organizationuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (107, 'org', 'usernode');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (108, 'mapping', 'map');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (109, 'mapping', 'mapconfig');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (110, 'mapping', 'maptarget');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (111, 'mapping', 'sitemap');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (112, 'mapping', 'target');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (113, 'ccs', 'notifyinfo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (114, 'ccs', 'rawevent');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (115, 'ccs', 'sample');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (116, 'ccs', 'usersite');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (117, 'patrol', 'algoconfig');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (118, 'patrol', 'detectiontask');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (119, 'patrol', 'target');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (120, 'patrol', 'algoreference');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (121, 'patrol', 'building');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (122, 'patrol', 'floor');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (123, 'wechat', 'wechatuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (124, 'face', 'face');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (125, 'face', 'facelib');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (126, 'face', 'trackingobject');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (127, 'face', 'settings');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (128, 'face', 'questionnaire');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (129, 'face', 'questionnaireresult');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (130, 'face', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (131, 'face', 'groupuser');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (132, 'face', 'humancountinfo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (133, 'face', 'humancountmediafile');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (134, 'face', 'humancountrealtimeinfo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (135, 'face', 'eventandtrackingobject');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (136, 'face', 'throttlecounters');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (137, 'third_auth', 'thirdauthconf');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (138, 'agreement', 'agreement');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (139, 'agreement', 'useragreement');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (140, 'status_page', 'notification');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (141, 'status_page', 'systemstatus');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (142, 'license_plate', 'blacklist');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (143, 'monitor_center', 'business');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (144, 'monitor_center', 'channel');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (145, 'monitor_center', 'customalgo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (146, 'monitor_center', 'customalgonotify');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (147, 'monitor_center', 'device');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (148, 'monitor_center', 'eventext');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (149, 'monitor_center', 'fmevent');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (150, 'monitor_center', 'orgext');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (151, 'monitor_center', 'robotincidentnotifyrecord');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (152, 'monitor_center', 'robotnotifier');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (153, 'monitor_center', 'rule');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (154, 'monitor_center', 'sitefloorvideo');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (155, 'monitor_center', 'userext');


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2021-11-03 09:38:36.810294+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2021-11-03 09:38:36.913983+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2021-11-03 09:38:36.931713+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'agreement', '0001_initial', '2021-11-03 09:38:36.958651+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'algorithm', '0001_initial', '2021-11-03 09:38:37.012395+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'auth', '0002_user_temperature_unit ', '2021-11-03 09:38:37.026506+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0003_auto_20200918_0747', '2021-11-03 09:38:37.032251+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0004_user_lock_expiration', '2021-11-03 09:38:37.0445+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0005_user_use2fa', '2021-11-03 09:38:37.069477+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'back', '0001_initial', '2021-11-03 09:38:37.105334+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'back', '0002_auto_20200918_0747', '2021-11-03 09:38:37.107685+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'back', '0003_auto_20210407_0137', '2021-11-03 09:38:37.117564+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'logic', '0001_initial', '2021-11-03 09:38:37.464386+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'guard', '0001_initial', '2021-11-03 09:38:37.585525+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'bill', '0001_initial', '2021-11-03 09:38:37.597563+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'bill', '0002_auto_20200227_0732', '2021-11-03 09:38:38.327734+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'bill', '0003_auto_20200302_0833', '2021-11-03 09:38:38.385168+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'perm', '0001_initial', '2021-11-03 09:38:38.533247+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'logic', '0002_auto_20200227_0732', '2021-11-03 09:38:40.030555+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'logic', '0003_auto_20200302_0833', '2021-11-03 09:38:40.06476+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'logic', '0004_auto_20200309_0614', '2021-11-03 09:38:40.077552+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'patrol', '0001_initial', '2021-11-03 09:38:40.434167+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'logic', '0005_patrol', '2021-11-03 09:38:41.007144+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'ccs', '0001_initial', '2021-11-03 09:38:41.408517+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (25, 'ccs', '0002_auto_20200316_0725', '2021-11-03 09:38:41.493512+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (26, 'ccs', '0003_notifyinfo_type', '2021-11-03 09:38:41.757241+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (27, 'ccs', '0004_auto_20201116_0406', '2021-11-03 09:38:41.835623+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (28, 'ccs', '0005_rawevent_raw_media', '2021-11-03 09:38:41.874472+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (29, 'channel', '0001_initial', '2021-11-03 09:38:42.08717+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (30, 'logic', '0006_auto_20200422_1023', '2021-11-03 09:38:42.629932+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (31, 'logic', '0007_auto_20200512_0620', '2021-11-03 09:38:42.895189+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (32, 'logic', '0008_auto_20200515_0619', '2021-11-03 09:38:42.972866+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (33, 'logic', '0009_add_inspection_analysis_results', '2021-11-03 09:38:43.007505+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (34, 'logic', '0010_auto_20200706_0500', '2021-11-03 09:38:43.060265+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (35, 'logic', '0011_auto_20200821_0105', '2021-11-03 09:38:43.077549+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (36, 'logic', '0012_auto_20200831_0119', '2021-11-03 09:38:43.155987+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (37, 'logic', '0013_auto_20200914_1054', '2021-11-03 09:38:43.193147+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (38, 'logic', '0014_auto_20200918_0747', '2021-11-03 09:38:43.376003+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (39, 'face', '0001_initial', '2021-11-03 09:38:43.428672+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (40, 'face', '0002_facelib_business_type', '2021-11-03 09:38:43.500753+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (41, 'face', '0003_settings', '2021-11-03 09:38:43.550175+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (42, 'face', '0004_settings_track_face_tracking_event', '2021-11-03 09:38:43.561699+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (43, 'face', '0005_questionnaire_questionnaireresult', '2021-11-03 09:38:43.580674+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (44, 'face', '0006_auto_20200807_0100', '2021-11-03 09:38:43.597415+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (45, 'face', '0007_auto_20200811_1915', '2021-11-03 09:38:43.61044+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (46, 'face', '0008_auto_20200814_0301', '2021-11-03 09:38:43.728622+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (47, 'face', '0009_auto_20200820_1107', '2021-11-03 09:38:43.740874+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (48, 'face', '0010_auto_20200823_0845', '2021-11-03 09:38:43.832021+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (49, 'face', '0011_auto_20200909_0928', '2021-11-03 09:38:43.863085+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (50, 'face', '0012_groupuser', '2021-11-03 09:38:43.889677+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (51, 'face', '0013_auto_20200918_0717', '2021-11-03 09:38:43.928187+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (52, 'logic', '0015_auto_20200919_0805', '2021-11-03 09:38:43.993038+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (53, 'logic', '0016_alter_camera_detect_params_length', '2021-11-03 09:38:44.007939+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (54, 'logic', '0017_alter_inspection_routine_execution_id_be_null', '2021-11-03 09:38:44.020392+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (55, 'logic', '0018_add_inspection_routine_execution_state', '2021-11-03 09:38:44.033134+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (56, 'logic', '0019_auto_20201020_0811', '2021-11-03 09:38:44.082382+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (57, 'logic', '0020_auto_20201120_0755', '2021-11-03 09:38:44.097425+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (58, 'logic', '0021_add_inspection_routine_state_synced', '2021-11-03 09:38:44.119587+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (59, 'logic', '0022_auto_20201201_0600', '2021-11-03 09:38:44.139783+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (60, 'logic', '0023_auto_20201216_0239', '2021-11-03 09:38:44.177999+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (61, 'logic', '0024_auto_20210106_0926', '2021-11-03 09:38:44.194661+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (62, 'logic', '0025_auto_20210118_0444', '2021-11-03 09:38:44.214987+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (63, 'logic', '0026_auto_20210127_0638', '2021-11-03 09:38:44.369386+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (64, 'logic', '0027_auto_20210311_0029', '2021-11-03 09:38:44.420595+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (65, 'logic', '0028_alter_person_phone', '2021-11-03 09:38:44.492968+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (66, 'face', '0014_auto_20201012_0752', '2021-11-03 09:38:44.504075+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (67, 'face', '0015_questionnaire_user', '2021-11-03 09:38:44.52679+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (68, 'face', '0016_auto_20201025_1202', '2021-11-03 09:38:44.587401+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (69, 'face', '0017_auto_20201029_0317', '2021-11-03 09:38:44.596941+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (70, 'face', '0018_auto_20201102_0217', '2021-11-03 09:38:44.608175+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (71, 'face', '0019_auto_20201102_0217', '2021-11-03 09:38:44.706796+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (72, 'face', '0020_auto_20201116_0918', '2021-11-03 09:38:44.74054+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (73, 'face', '0021_auto_20201119_2231', '2021-11-03 09:38:44.761481+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (74, 'face', '0022_remove_facelib_face_count', '2021-11-03 09:38:44.771255+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (75, 'face', '0023_humancountinfo_humancountmediafile', '2021-11-03 09:38:44.803288+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (76, 'face', '0024_settings_track_mask', '2021-11-03 09:38:44.819199+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (77, 'face', '0025_face_tracking_object', '2021-11-03 09:38:44.845335+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (78, 'face', '0026_auto_20201221_0831', '2021-11-03 09:38:44.888398+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (79, 'face', '0027_settings_identify_by_and_trackingobject_site', '2021-11-03 09:38:44.944389+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (80, 'face', '0028_auto_20210225_0842', '2021-11-03 09:38:44.974465+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (81, 'face', '0029_humancountrealtimeinfo', '2021-11-03 09:38:44.991352+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (82, 'face', '0030_humancountrealtimeinfo_notification_threshold', '2021-11-03 09:38:44.997325+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (83, 'face', '0031_auto_20210406_0350', '2021-11-03 09:38:45.028495+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (84, 'face', '0032_eventandtrackingobject', '2021-11-03 09:38:45.074866+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (85, 'face', '0033_trackingobject_latest_visit_time', '2021-11-03 09:38:45.101533+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (86, 'face', '0034_questionnaireresult_question', '2021-11-03 09:38:45.117045+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (87, 'face', '0035_auto_20210602_0403', '2021-11-03 09:38:45.150735+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (88, 'face', '0036_trackingobject_latest_index_face_time', '2021-11-03 09:38:45.166451+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (89, 'face', '0037_throttlecounters', '2021-11-03 09:38:45.180661+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (90, 'guard', '0002_auto_20200227_0732', '2021-11-03 09:38:46.276914+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (91, 'guard', '0003_incident_meta_data', '2021-11-03 09:38:46.28564+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (92, 'guard', '0004_case_brand_type', '2021-11-03 09:38:46.381785+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (93, 'guard', '0005_auto_20200904_0301', '2021-11-03 09:38:46.407835+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (94, 'guard', '0006_auto_20200905_0700', '2021-11-03 09:38:46.422714+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (95, 'guard', '0007_auto_20201009_0332', '2021-11-03 09:38:46.463018+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (96, 'guard', '0008_auto_20201103_0828', '2021-11-03 09:38:46.483798+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (97, 'guard', '0009_caseexportconfig_custom_setting', '2021-11-03 09:38:46.494834+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (98, 'guard', '0010_auto_20201113_0609', '2021-11-03 09:38:46.514387+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (99, 'guard', '0011_auto_20201119_0806', '2021-11-03 09:38:46.53702+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (100, 'guard', '0012_caseexportrecord_export_config', '2021-11-03 09:38:46.546525+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (101, 'guard', '0013_auto_20201216_0849', '2021-11-03 09:38:46.641992+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (102, 'guard', '0014_auto_20201221_0229', '2021-11-03 09:38:46.648867+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (103, 'guard', '0015_auto_20210126_0532', '2021-11-03 09:38:46.68416+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (104, 'guard', '0016_auto_20210301_0802', '2021-11-03 09:38:46.718486+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (105, 'guard', '0017_auto_20210418_0709', '2021-11-03 09:38:46.860714+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (106, 'guard', '0018_create_beatglobal_lambad_default', '2021-11-03 09:38:46.931408+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (107, 'guard', '0019_auto_20210714_0227', '2021-11-03 09:38:46.954002+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (108, 'guard', '0020_auto_20211103_0138', '2021-11-03 09:38:47.003542+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (109, 'iot', '0001_initial', '2021-11-03 09:38:47.009881+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (110, 'iot', '0002_auto_20200408_0251', '2021-11-03 09:38:47.150523+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (111, 'license_plate', '0001_initial', '2021-11-03 09:38:47.166226+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (112, 'logic', '0029_inspection_inx_started_at_robot', '2021-11-03 09:38:47.183064+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (113, 'logic', '0030_auto_20210420_0817', '2021-11-03 09:38:47.221504+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (114, 'logic', '0031_auto_20210427_0754', '2021-11-03 09:38:47.243087+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (115, 'logic', '0032_auto_20210429_0938', '2021-11-03 09:38:47.285923+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (116, 'logic', '0033_inspection_uuid', '2021-11-03 09:38:47.305714+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (117, 'logic', '0034_inspection_uuid_default', '2021-11-03 09:38:47.310876+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (118, 'logic', '0035_inspection_uuid_not_null', '2021-11-03 09:38:47.32729+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (119, 'logic', '0036_add_inspection_index', '2021-11-03 09:38:47.365851+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (120, 'logic', '0037_update_inspection_routine_state_empty', '2021-11-03 09:38:47.374207+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (121, 'logic', '0038_inspection_routine_state_not_null', '2021-11-03 09:38:47.392341+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (122, 'logic', '0039_auto_20210524_0301', '2021-11-03 09:38:47.639424+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (123, 'logic', '0040_auto_20210622_0903', '2021-11-03 09:38:47.656431+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (124, 'logic', '0041_auto_20210702_2023', '2021-11-03 09:38:47.832723+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (125, 'logic', '0042_auto_20210705_0708', '2021-11-03 09:38:47.859948+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (126, 'logic', '0043_auto_20210629_0932', '2021-11-03 09:38:47.897352+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (127, 'logic', '0044_auto_20210719_1139', '2021-11-03 09:38:48.045131+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (128, 'logic', '0045_auto_20210720_1745', '2021-11-03 09:38:48.078752+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (129, 'logic', '0046_auto_20210730_2112', '2021-11-03 09:38:48.127711+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (130, 'logic', '0047_auto_20210723_0235', '2021-11-03 09:38:48.160798+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (131, 'logic', '0048_auto_20210723_0632', '2021-11-03 09:38:48.199474+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (132, 'logic', '0049_auto_20210918_1525', '2021-11-03 09:38:48.234803+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (133, 'logic', '0050_auto_20211001_0233', '2021-11-03 09:38:48.274069+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (134, 'logic', '0051_auto_20211013_0635', '2021-11-03 09:38:48.2945+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (135, 'logic', '0052_auto_20211014_1200', '2021-11-03 09:38:48.384929+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (136, 'logic', '0053_auto_20211101_0350', '2021-11-03 09:38:48.482862+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (137, 'logic', '0054_auto_20211103_0138', '2021-11-03 09:38:48.932081+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (138, 'org', '0001_initial', '2021-11-03 09:38:49.299155+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (139, 'mapping', '0001_initial', '2021-11-03 09:38:49.653036+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (140, 'patrol', '0002_create_algo_refreence', '2021-11-03 09:38:49.775261+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (141, 'patrol', '0003_allow_blank_fields', '2021-11-03 09:38:49.9024+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (142, 'patrol', '0004_remove_algo_reference_fk_in_detection_task', '2021-11-03 09:38:49.976446+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (143, 'patrol', '0005_target_uuid', '2021-11-03 09:38:49.991184+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (144, 'patrol', '0006_building_floor', '2021-11-03 09:38:50.11533+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (145, 'patrol', '0007_modify_target_name_length', '2021-11-03 09:38:50.158741+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (146, 'patrol', '0008_modify_target_serial_no_length', '2021-11-03 09:38:50.201459+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (147, 'patrol', '0009_target_reference_inspection_id', '2021-11-03 09:38:50.216081+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (148, 'patrol', '0010_target_reference_image', '2021-11-03 09:38:50.286753+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (149, 'patrol', '0011_target_reference_image_alter_null', '2021-11-03 09:38:50.478839+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (150, 'patrol', '0012_alter_floor', '2021-11-03 09:38:50.581312+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (151, 'patrol', '0013_migrate_floor', '2021-11-03 09:38:50.67453+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (152, 'patrol', '0014_target_new_floor', '2021-11-03 09:38:50.802559+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (153, 'patrol', '0015_add_target_enabled_and_robot_reachable', '2021-11-03 09:38:50.855716+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (154, 'patrol', '0016_add_target_unique', '2021-11-03 09:38:50.862763+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (155, 'patrol', '0017_target_bound_algo_configs_and_references_exist', '2021-11-03 09:38:50.945947+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (156, 'patrol', '0018_migrate_target_bound_and_algo', '2021-11-03 09:38:51.048168+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (157, 'patrol', '0019_detection_task_algo_reference_null', '2021-11-03 09:38:51.0618+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (158, 'patrol', '0020_add_detection_task_review_status_id_index', '2021-11-03 09:38:51.076371+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (159, 'patrol', '0021_floor_zone_id', '2021-11-03 09:38:51.109138+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (160, 'patrol', '0022_add_zone_id_in_unique_together', '2021-11-03 09:38:51.142266+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (161, 'patrol', '0023_target_cstatus', '2021-11-03 09:38:51.155522+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (162, 'monitor_center', '0001_initial', '2021-11-03 09:38:52.054945+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (163, 'org', '0002_domain_map', '2021-11-03 09:38:52.16375+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (164, 'org', '0003_domain_users', '2021-11-03 09:38:52.215591+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (165, 'org', '0004_domainuser_in_charge', '2021-11-03 09:38:52.244313+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (166, 'push_notifications', '0001_initial', '2021-11-03 09:38:52.420947+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (167, 'sessions', '0001_initial', '2021-11-03 09:38:52.431076+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (168, 'status_page', '0001_initial', '2021-11-03 09:38:52.44412+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (169, 'status_page', '0002_auto_20210301_0819', '2021-11-03 09:38:52.457704+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (170, 'third_auth', '0001_initial', '2021-11-03 09:38:52.542192+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (171, 'third_auth', '0002_auto_20200924_0318', '2021-11-03 09:38:52.594348+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (172, 'third_auth', '0003_auto_20200929_0857', '2021-11-03 09:38:52.93335+08');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (173, 'wechat', '0001_initial', '2021-11-03 09:38:52.979816+08');


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('pi1jc8f09bcchdagysvd9wtsf13q27f9', 'NmE1YWNlMjIzMDQ5MDU4NzNiZDRhYTM4NjQ2NTc5ODg1MWE4MDI3Njp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0NDg2ZTk3YTEzZDdkODYwMGJhYzA4NWIzN2VlMDU0Mzk0ZWY4NTJhIn0=', '2020-06-06 11:43:30.383632+08');


--
-- Data for Name: face_eventandtrackingobject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_face; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_facelib; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_groupuser; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_humancountinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_humancountmediafile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_humancountrealtimeinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_questionnaireresult; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_throttlecounters; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: face_trackingobject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_beatglobal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_beatglobal (id, task_type, last_execution_time, execute_channel) VALUES (1, 'case.export', 5686, 'local');
INSERT INTO public.guard_beatglobal (id, task_type, last_execution_time, execute_channel) VALUES (2, 'case.export', 5687, 'lambda');


--
-- Data for Name: guard_beatjob; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (1, '2020-05-08 15:14:18.148923+08', '2020-05-08 15:14:18.149052+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 1, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (2, '2020-05-08 15:31:01.892751+08', '2020-05-08 15:31:01.89278+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 2, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (3, '2020-05-08 15:44:54.216778+08', '2020-05-08 15:44:54.216807+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 3, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (4, '2020-05-08 15:45:00.140162+08', '2020-05-08 15:45:00.140189+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 4, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (5, '2020-05-08 15:45:07.541274+08', '2020-05-08 15:45:07.541301+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 5, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (6, '2020-05-08 15:47:30.451242+08', '2020-05-08 15:47:30.451272+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 10, NULL, NULL, NULL, NULL, NULL, 0);
INSERT INTO public.guard_case (id, created_at, updated_at, viewed, status, action, report, priority, type, customer_id, event_id, guard_id, incident_id, inspection_id, operator_id, robot_id, brand_type) VALUES (7, '2020-05-09 15:26:18.906309+08', '2020-05-09 15:26:18.906341+08', false, 'new', 'new', NULL, 'unassigned', 'event', 2, 11, NULL, NULL, NULL, NULL, NULL, 0);


--
-- Data for Name: guard_caseexportconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_caseexportrecord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_casehistory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_casemedium; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_guard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_guard (id, phone_number, created_at, updated_at, phone_number_verified, organization_id) VALUES (6, '13111112222', '2020-05-08 12:03:33.730141+08', '2020-05-08 12:03:33.7302+08', false, 1);


--
-- Data for Name: guard_guardadmin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_guardadmin (id, phone_number, created_at, updated_at, phone_number_verified, organization_id) VALUES (5, '13111112223', '2020-05-08 12:05:01.415916+08', '2020-05-08 12:05:01.415976+08', false, 1);
INSERT INTO public.guard_guardadmin (id, phone_number, created_at, updated_at, phone_number_verified, organization_id) VALUES (4, '13111112221', '2020-05-08 12:04:48.779633+08', '2020-05-08 12:05:11.059138+08', false, 1);


--
-- Data for Name: guard_guardcompany; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_guardcompany (id, title, created_at, updated_at) VALUES (1, 'turing', '2020-05-07 16:20:12.070234+08', '2020-05-07 16:20:12.07037+08');


--
-- Data for Name: guard_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_monitoringoperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.guard_monitoringoperator (id, created_at, updated_at, phone_number, phone_number_verified, organization_id) VALUES (7, '2020-05-08 14:35:39.21745+08', '2020-05-08 14:35:39.217542+08', '13111112224', false, 1);


--
-- Data for Name: guard_note; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: guard_siteoperation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: license_plate_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_box; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_box (created_at, updated_at, id, timezone, ip_address, max_camera_cnt, max_detect_cnt, paid_cnt, camera_cnt, state, billing, meta, type, scene, sequence, upload_video_expire, upload_event_expire, session_id, version, site_id, user_id, last_offline_timestamp, offline_grace_minute, name, stream_type) VALUES ('2020-05-07 11:50:22.979209+08', '2020-05-07 11:50:22.979241+08', 'box_test_10001', 'UTC', '192.168.2.103', 20, 20, 0, 6, 'offline', 'paid', '{"agent":{"name":"Box","level":0,"version":"1.0.0"}}', 'pc_v1', 0, 0, 1209600, 1209600, '', 0, 1, 2, NULL, 0, '', '');
INSERT INTO public.logic_box (created_at, updated_at, id, timezone, ip_address, max_camera_cnt, max_detect_cnt, paid_cnt, camera_cnt, state, billing, meta, type, scene, sequence, upload_video_expire, upload_event_expire, session_id, version, site_id, user_id, last_offline_timestamp, offline_grace_minute, name, stream_type) VALUES ('2020-05-07 11:51:50.676129+08', '2020-05-07 11:51:50.676161+08', 'box_test_10002', 'UTC', '192.168.2.141', 20, 10, 0, 1, 'offline', 'paid', '{"agent":{"name":"Box","level":0,"version":"1.0.0"}}', 'pc_v1', 0, 0, 1209600, 1209600, '', 0, 1, 2, NULL, 0, '', '');
INSERT INTO public.logic_box (created_at, updated_at, id, timezone, ip_address, max_camera_cnt, max_detect_cnt, paid_cnt, camera_cnt, state, billing, meta, type, scene, sequence, upload_video_expire, upload_event_expire, session_id, version, site_id, user_id, last_offline_timestamp, offline_grace_minute, name, stream_type) VALUES ('2020-05-07 11:52:18.772332+08', '2020-05-07 11:53:38.73056+08', 'box_test_10003', 'UTC', '192.168.2.141', 10, 10, 0, 0, 'offline', 'paid', '{"agent":{"name":"Box","level":0,"version":"1.0.0"}}', 'pc_v1', 0, 0, 1209600, 1209600, '', 0, 2, 2, NULL, 0, '', '');


--
-- Data for Name: logic_boxlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_camera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-07 15:07:21.435608+08', '2020-05-07 15:07:21.435659+08', 2, NULL, '办公室', '3c:ef:6c:13:hh:71', '3c:ef:6c:13:hh:71', 'pc_v1', '', '', '', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch33/main/av_stream', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch34/sub/av_stream', 'on', false, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{}', 'offline', '', true, 0, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-07 15:08:40.611456+08', '2020-05-07 15:08:40.611504+08', 3, NULL, '消防通道出口', '3c:ef:6c:13:hh:72', '3c:ef:6c:13:hh:72', 'pc_v1', '', '', '', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch33/main/av_stream', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch33/main/av_stream', 'on', true, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{}', 'running', '', true, 0, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-07 15:03:17.814693+08', '2020-05-07 15:08:54.518567+08', 1, NULL, '前台', '3c:ef:6c:13:hh:75', '3c:ef:6c:13:hh:75', 'pc_v1', '', '', '', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'off', true, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{}', 'running', 'email', true, 1, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-08 11:41:08.247867+08', '2020-05-08 11:41:08.247904+08', 4, NULL, '电梯', '3c:ef:6c:13:hh:73', '3c:ef:6c:13:hh:73', 'pc_v1', '', '', '', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'off', false, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{"ETag":"\"5e4b93b9f540c44319302a6d0e0b735e\"","meta":{"content_type":"image/jpeg","size":[640,360],"file_size":45072},"Bucket":"data-for-apiserver","Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F9%2Frobots%2Frobot_dog_sr_20003%2Fsnaps%2F17d76c7e-9104-4323-821e-e508faa1f59b.jpeg","Key":"users/9/robots/robot_dog_sr_20003/snapshots/front.jpg","version":"17d76c7e-9104-4323-821e-e508faa1f59b.jpeg"}', 'ready', '', true, 0, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-11 18:19:01.6078+08', '2020-05-11 18:19:01.607842+08', 5, NULL, '仓库', '3c:ef:6c:11:hh:71', '3c:ef:6c:11:hh:71', 'pc_v1', '', '', '', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch33/main/av_stream', 'http://turingvideo:turing123@192.168.200.214:554/h264/ch34/sub/av_stream', 'off', false, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{}', 'offline', '', true, 0, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-11 18:20:30.243839+08', '2020-05-11 18:20:30.243884+08', 6, NULL, '会议室', '3c:ef:1c:13:hh:71', '3c:ef:1c:13:hh:71', 'pc_v1', '', '', '', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'http://192.168.2.64:554/h264/ch1/main/av_stream', 'off', false, NULL, '{"algos":"person","threshold":0.8,"auto_speak_enabled":"True","detect_enabled":"True"}', '{}', 'process', '', true, 0, '{}', '{}', 2, 'box_test_10001', '', 0, 1, '');
INSERT INTO public.logic_camera (created_at, updated_at, id, saving_at, name, raw_address, mac_address, type, brand, username, password, uri, hd_uri, mode, upload_video_enabled, location, detect_params, snapshot, state, notifies, should_push, version, note, default_params, user_id, box_id, serial_no, brand_type, firmware_version_id, sd_uri) VALUES ('2020-05-13 10:52:20.641401+08', '2020-05-13 10:52:20.641443+08', 7, NULL, '餐厅', '6c:ef:cc:55:dd:71', '6c:ef:cc:55:dd:71', 'pc_v1', '', 'admin', 'a123456', 'https://www.turingvideo.com', 'https://www.turingvideo.com', 'on', true, '{"lat":0.0,"lng":0.0}', '{"threshold":0.5}', '{}', 'process', '', true, 0, '{}', '{}', 2, 'box_test_10002', '', 0, 1, '');


--
-- Data for Name: logic_camerafirmwareversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_camerafirmwareversion (id, created_at, updated_at, version) VALUES (1, '2020-05-13 10:52:20.641401+08', '2020-05-13 10:52:20.641443+08', 'v1');


--
-- Data for Name: logic_cameralocation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_camerasavedvideo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_camerasavedvideo (created_at, updated_at, id, started_at, ended_at, snapshot, video, camera_id) VALUES ('2019-02-08 01:28:02+08', '2019-02-08 01:38:02+08', 1, '2019-02-08 01:28:02+08', '2019-02-08 01:29:02+08', '{"Key":"key","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"dev-turingvideo-com","meta":{"file_size":8888,"size":[640,360],"content_type":"image/jpeg"}}', 1);


--
-- Data for Name: logic_cameratrackingobject; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_cameravideo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_cameravideo (created_at, updated_at, id, started_at, ended_at, size, video, camera_id, uuid) VALUES ('2019-10-24 16:06:36.471691+08', '2019-10-24 16:06:36.471719+08', 1, '2017-10-19 14:00:57.262076+08', '2017-10-19 14:01:57.262076+08', 1000, '{"meta":{"file_size":1000,"content_type":"video/mp4"},"Key":"users/3/cameras/3/videos/8d40608c-9090-4e5a-98f4-26415058b487","Bucket":"develop-data-turingvideo-com"}', 1, 'b71fbdac38264b108fcb09640ea44fac');
INSERT INTO public.logic_cameravideo (created_at, updated_at, id, started_at, ended_at, size, video, camera_id, uuid) VALUES ('2019-10-24 16:46:37.062654+08', '2019-10-24 16:46:37.062675+08', 2, '2019-10-23 14:00:57.262076+08', '2019-10-23 14:01:57.262076+08', 1000, '{"meta":{"file_size":1000,"content_type":"video/mp4"},"Key":"users/3/cameras/3/videos/8d40608c-9090-4e5a-98f4-26415058b487","Bucket":"develop-data-turingvideo-com"}', 1, 'b72fbdac38264b108fcb09640ea44fac');
INSERT INTO public.logic_cameravideo (created_at, updated_at, id, started_at, ended_at, size, video, camera_id, uuid) VALUES ('2019-10-24 16:47:51.189076+08', '2019-10-24 16:47:51.189098+08', 3, '2019-10-23 14:00:57.262076+08', '2019-10-23 14:01:57.262076+08', 1000, '{"meta":{"file_size":1000,"content_type":"video/mp4"},"Key":"users/3/cameras/3/videos/8d40608c-9090-4e5a-98f4-26415058b487","Bucket":"develop-data-turingvideo-com"}', 2, 'b73fbdac38264b108fcb09640ea44fac');


--
-- Data for Name: logic_customizedalgorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_customizedalgorithm (id, created_at, updated_at, index, code_name, name, algorithm_id, organization_id) VALUES (1, '2020-05-07 15:44:46.402003+08', '2020-05-07 15:44:46.402056+08', 512, 'person:512', '人群聚集', 1, 1);
INSERT INTO public.logic_customizedalgorithm (id, created_at, updated_at, index, code_name, name, algorithm_id, organization_id) VALUES (2, '2020-05-07 15:45:01.650103+08', '2020-05-07 15:45:01.650148+08', 513, 'person:513', '人群疏散', 1, 1);


--
-- Data for Name: logic_customizedeventtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_customizedeventtype (id, created_at, updated_at, index, code_name, name, customized_algorithm_id, event_type_id, organization_id) VALUES (1, '2020-05-07 15:45:22.343253+08', '2020-05-07 15:45:22.343299+08', 512, 'person:512', '人群聚集', 1, 4, 1);
INSERT INTO public.logic_customizedeventtype (id, created_at, updated_at, index, code_name, name, customized_algorithm_id, event_type_id, organization_id) VALUES (2, '2020-05-07 15:45:34.626665+08', '2020-05-07 15:45:34.626719+08', 513, 'person:513', '人群疏散', 2, 4, 1);


--
-- Data for Name: logic_departmentmanager; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_devicekey; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:26.907133+08', '2020-05-07 11:41:26.907151+08', 'robot_test_10001', '\x508559862a46b28c6c26c6d3506933f2e38360cb7be59b0e2730fffa77003b66c40467d4712aef7232c81ab83b23559f314c3d03cbc605d4fdd3a4b5b410f75182ea4ecd95c519c91217ec23ebfadcd9210644871d39a0f174cebc52ef6453cc6bc19910c176a8586ab56fed555fafba601e0ee3882127ea1a3efeddcab02542bb618b5fc33485e851cf9b0658eb2c4f33413e27837f02c07b820b06132fdeb1f0dc1af1043b91d6ab9208b7766af281680ce44da6a8d37c49c614b65cfa7347a28f46b5e6014d72823525a44dd5a1744447c8e3a9f98367a84c18ecbb7391565c49357b1b7b12aed953e67cc87e02059b043017a70ab057401df8b08a6c47a356512143f7f73d20119e630eb2ef50dfc71a714194802f5c979fadfe81d9ba78fe3bb24c4b7b87265aa11119d010858bf312fb2262c867c1061d745223a1c9cd11c30f3591613cf4fedb704c78d1c9e9b1cb06558e76228a5e1da2e0be7c21019579c170fd8ec57ea0a0739c2fadbef453bc0a9458205ab7b2ce84a02aeb5107fbd0c0ff54a4c8e2c0b89992a7160773e5a3b882f0bf08d53985cfee32c683106afb286287a3b5500c1b0a8b8ee38a3146983e6344baba6312460a4ab30526344ac6d3706664cfcc44972124634b1229614436275ef6558c6ded50f59f14eba5', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEA31+vwEb/a3bJfnsnSRoYkQEqQSOYaF1vtrCmRpIZTlD9FFds9zZ+
LhElpk1IVMM+sz+VQ4MmMlAOvI+eHdkCiR+1oSLC7DmIUerm3snr0qeoadV0nvme
OCUlAKUCefN/CXZslwuWxxK2vQSt3gxbKAzzSFnWasiwLnOpzG2FmJ/W1g3uqi1g
axcehoeQ3egZbBaOO3XdXlvjWy/tPnyIVyjMeRKT648SNHUVW7KAhA4sOU7Q46Q7
TwoB5myRnOI2sxUR/ylHclrga2U0MobGtglM6qirMaToZvIXVHI4lRSIFtyzR8Dh
LbsWXATDl/FFB3g1ZStDYE1ihYV3w2SbEeFhH7K66qVGdzYlM2PVbbOrDA/Y7pn4
ch+ke4sebDjLmUAwWad/2Q6nVxaBt89a0dDxvX5dYgG9cQKWeq+8kifV1SJPv1jE
S8fMYcvnM1Do3HhZCsLX96YCcr+bW7Qc9xlWzT4xUF3v/49vgNwo/QmjL53cqack
QqXZ8pVodFeQnKxeWfN1mlR7W6Zskx3smPs0bCo6zMWxbCJ14oDVKK6/3191XZET
MP+hkZUKwlHzR/ychZhafNoTOip5BwpL7g/hv+u4Kgtk9cTRdMrEXWLzQvWnkTzr
jjw+f+8QEpDOleLOk3aNMwSn/5tSFf8J/qIo0DkjAKtCp9t87KgwOTkCAwEAAQ==
-----END RSA PUBLIC KEY-----
');
INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:27.327751+08', '2020-05-07 11:41:27.327813+08', 'robot_test_10002', '\x1164246335c562da1ec6dc176242c8bf4c34a57214dd133c011a8dc231161cd393fd737ae6c22d56d45f40c3e89cd4f3a74a128055b7bb1f14093ba8520bdb41d8022c64b7ab1bbd81bb39cd31b4ea87d4fa4beea31e01b17f358b95da35ac62d856c4feb1a0e1c8011579c2483db05fc24ff8f33da357e63fb2dc8e1c5e25c7717edb2eaec45dc7ddfe473a344406fde716498e1448a3710b3b57561c1eb91f32df9dd1ba5de32c9f417748acfeb0cc04c16abc27825d524d86c762a6b350361a64f7e71d963c4caa19e3563cbea64e0a600401053f51b3b04ce7413b05fe1cae8e68d2206e64db6568053bee6ad472da159160427c93ea7d8e72d60663cf285d9ae73c77cb9221a17263b038e0576df51e5a97df896e2d89cbf55569662d7730a933dd1de2a21a65669b76219e6a5ec6b25d8e60c033959c07527189fa915da0736e8c7135affe94c6a2e447d80b2edfa60b9deed7d8be63bc8408836140456cd4d87ac131a9251fb1de80c5e1d93b7f9f846c422f166a74aa7f7cd9b10e14e8d4d773be2ba66a7ea0166d711ce19333dc8242f2ed5c12ab96d7bec8e6ecf6d68da74478a5d002d46d7e5cc8e7d696e4adffe43a20d49c43ae785e616cc070585814ee568525cb02497c4242d1d897eee27ba1a6ee93e618f81f4cbecb95c1', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEA0I/Z2LnGigM0qn2eK1yJaGe2DvLIw/8Y6zu1Kf0nngGLHntoeNnt
wSB5AVtNpou43gDCoJoNTS+1cvvcJoGBkGJsJG8ec/KnVVt1mKg1ZWKGlUB/UNdF
ujgA/KAk6/CTfg8UH/9z4HPOnK6yz/9+ijySgQdFZ8+FOT3UNCRlvmC6AdzHy1Ug
LrBH5kbcTaxTC2Pq6nw1whvDXXnsUMkvIWC/1OKe+xezVpu/rxJkr//O5IDUKKnc
o26cAQnMN+3UNFV918xfALbIjB6W9JHpCTBwf179a+AoSzBBARlCO14KLNuOpgqy
h1guSdR9GlFLN8W0s43h5G2MgcV/dlCoe+0rElPFibwIy/R8BsoGIEvTb0Dn/kCE
73cgPyyDdc9hpElxyINtTygvqe3J9R3hvEcztbB/g4ekusHvQOAdX22hIHQjR7AE
L2rd5r1sXnn+tUG6P6rQAU66B5+YSv5NTYEVvmHHYkgtZqSgN44vbvh8rjQ6iCgc
OmEofFrgQzvV872GBDHgCWsj4Y+ZhMj5jOE/SYR7++cuYbcpSNT7emKv6KjxN1zQ
Q+bH5i6q2A0eJ8ZGT0EoZ/WQlEmrQTGfbsSksFB9hwGcaEG4Ao6lpW5Q6fbrc8gz
5Prv8iELooQGmwXMe/Y/Trgdy9Y9AQHZAy85U8dgLgkhVWgt6KAfguUCAwEAAQ==
-----END RSA PUBLIC KEY-----
');
INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:27.348716+08', '2020-05-07 11:41:27.348775+08', 'robot_test_10003', '\x2dcc22033816cd1bb290e375c429c1d36231cbf1faf6cecc2b320339941864487fced0e5a410b2f327d5c61a8cba9d4ec1304e0bda8d774fbab985a58693aae7f19c5594d0b8691e6f59a7a7ddcb7572dd9a4eb92fa6ced1122c294f47e0cc5cea01f0538cf8ffddb79cd0132638c2ad0b488ededccfd30769855da20eb25f900adae11d572a86542e955a376ccc4a1fb166d8eff64268015ca367e334a8eb9b970f34bb1885d85d5ffcd971d01003396a81ba4e62cdd9609cb584c4b1c8714bbf603344a8a7cc0e1ddebb3ab35403bbc6e8295e70c11b48d06675cc1663542e84f3d4d92296b31408918dd27b47366a37b3d054de9db377a63d699c5a3824620480f4ff5d516e5b85ee77b0d66ac629c2180eba4f5d8c981cdd063ab14441d7134789d462deb54ff9d7871bc5407772c48328c4ea27b5e92deef9ae97927e60af72a6cab18f583fb6cea241af1624baf319f6ffae204a79ac4945b93f5df4ad192b37d0610373960a183a3250906f5b66d13556a1148f89895ea05cc20419857b6da049daa9fd8bf57476fa93593d401012d2182a78f60d3eceb26f03282f2966f4daa9f33c6ef75798fd1cf9498dd5bec6f41a403548c5de26338bc7ddf9dbf17083c858e16fcb9b21962dfe149d0b4c605e59df49fb63ceaa3a0a9f9fed5c', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEAxMmY4UVE8uhNfSheiLAEEXr3wNgyunzyZsk9yJpmNSIVblznYa0o
+XJNcg/85qK4PPNmQCdVR2jUA62poEXUlgQzu1rWTvGskxE/7Mc0yRkicYTBteCr
n4bfAYs+DvPBN3KMvNMZB9hRQ2vp8lt28G/IxSTRHVAptv4jhbH3fa77e4mTm8kh
r30QPFiAZ7wvGaGo5Nzwaj2/zvHzJ0szMNk91EWuJw26ItdMYRaEfl8yntqIuyvd
XjIcjohNocBkdbQgnSNtQdozTq7MAjvdwGchNtc9j6o0M7KgWIZozm2ByKfIJG8l
wDMOfsyxhqP61O1gDfVMeHVwAwO0QkloxW5ed4F0O24l+YFEvmeJhgvLJqFz0gra
jR5eIihSrB8j2xfZf+4r9SpFLE0QHyRg37qNYwBSiVYvZPRYhOSeRwFFpXqNAk7m
SQnOS82SvavKHNoQJlYALgYLqyX6Pkk/uF7M2YkJP9/vk9WWzZ2GM7Xb2Hla4cmu
N5WiLszWvUp30j5pPykP0Lw6woHzXSgWwKcm3IOT1RqooYYdMHIy8aDTby3xekoR
YbICynB2qGolgZDk3wVPER8KXWD4xhZIe4wYo4YwhNzYRuJ2kLkBz7Cu+7PAqkWU
oMSVs1VhpcguVXMv6zZdxvMXSQmpqt+aqNwgDFJwN36uEdSak1ymQ1sCAwEAAQ==
-----END RSA PUBLIC KEY-----
');
INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:36.988437+08', '2020-05-07 11:41:36.988505+08', 'box_test_10001', '\x829098955ae3518e0a8385325d111946feb26a216b44636078e68f9f425955b50c67484a90d5f74d9a7c8f322dd72c494aa61826295088f9387f27d2fe2c063afefb3cf216f2a50267656c7d22289a4c61b2f23f54f9787a69ec8de5605e814d6b34d5a8bcac93260cd52afd8eae12e2de66847ea5b3b880695d85454aad23566bb06bc8f04840d7a361efce52fbdcfbbdde872f18872f4781e070e26389f84e50414b81a8b50185f3c8ea50956c26a0711b6f7f7760d00e60932d9524d82267cffbaa5cf5b862b905349c49673bae36eff85df73f4e5e4a3cc0abee2893db5ca3bb7b5834aaa0b2f714cca698f811da981b6f436dc19a7570db960f2bc2196089d9edc869b3ca26801cd755620f6a39728a780281771bf74ce41866ec4c1c6f9d8f1482dad04330dccc62c380797d3ec64a0f3d4512fd3620eee36edf648bd3fdc102ab57b1ec6f9da23f73c60693b2554bd328f899b6040ef82b0f9dd214d8baec1ab58542e794dcfac50fe0d8126a2c93c64f709649717a95ee65495111ba2e562dc520316d604cb46c9f8e1792c2a71a3924ff7c8a13a719f2315e95e7ed94f2ca6da5778bfeca8d6921136f9404d5c3ac038cc1d394b974052026a4cb3de201f50bd6ef9a6c8b0536b0832a81eae52a3a010d8eb9b91ffa1b2caac240ce', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEAw4Kph7CCLEmdHrksrzraTBx7B5a+ue6DYmaaPDRYVmBIJzUZofPK
vaWslJ0A5+c68XQEg4E3QKXFM1VR1JjKhpjRBbpBXaUseKyWOM38PDzUN+sNw+sP
K750Y6iOCspNlh2tC7FUnpOimrQ1SC1qJ3iOdUBy2QaysYkoWjZ5LPDmEWmJZHR+
NUhWKjkrh5bIwRmhhi1IQUhNMeJlpzuJWo4q3TZc+3lusctl+c8mMrbIdTDmWwgV
9VHEnnuil5GYhO6G2wJbjR81TLTrFLcqh+aH4CXLEnwVHyz5wGp9dMzCddHqSVRJ
BZ+6h/C8KCgEPEm+JSuo+n7NsiMlGRe7Rk0bJkWm8OrU5Cd14cd6I23e/GYexH36
sN0IbMk9JBZIlTMvfRghYr5PaWks+XZhLRinE/C2AiK9bYMws1HuFDQvQJwPWmjm
eDwR1snnGraKvxRdLOwccOig2czDoIrtqm4FECzzMtvS9+q+JputM13xDI6SCHaq
VWIuD2G9yIvgLuskr3vtVmvMZs+sJ7lV34197Ai8HVTfynqkehtY8TcHuqUr/skH
aqWWzFRrAkaKw1QhJiDCfQJbIiva0UAcg5f4/nk9e30DZ2ltNGy1yWY7cnfC9AFP
OGvunGqVDzr197Cw0fb70V/lp5rgSX1WMHqG9+A5Q7+y1r5xcr1PrQsCAwEAAQ==
-----END RSA PUBLIC KEY-----
');
INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:37.007475+08', '2020-05-07 11:41:37.007534+08', 'box_test_10002', '\xdd9ac1b782ad74ea9d1ea64a3f7a015fa86f0cd7396743ef3b9e5601392d891046adcc50952100b7f65941eb018b2c12636991fc25477f5bb44e90932fa52cbf34977ddbff57516f882ac3ad3b9eeab352466d8ee7759a837e69deb032c393ee4fdd8bae3881d47c629da5de88041bf13c7d54d32dc88c44e051603d150d8c2b42e21dc919e5f0720376e1b538c3dd075d124599bbe26c33963ba8b873607ccb6b85ebedff6f535fb24e79578e5c0aa5b88c97df5a87a0ad8ce95fa11e7c186fe245246c2000951c0b20e270e4e139ce7cb4ddda72e5e49caf881b96d2575980357c1434c1bde7b60e82c94c15c540bd7fc42d46ac370653e8666a36de5790dd2d0eba5ab8e7a740c62cce2a4a91f9244f771448d6c95102dae0f02b6f4802c50b0d6ae720a7bfc3e444e35464b8f3cc86b53af197749018efd78ed9a319fa13a653647130e21b4822d2ac0cc7fa40e7656169f7bd72faccfc6abde12ca34237c5c23d831c856444ed71641dbb584c542a889bbf4e0549d6c4d716400e69a3d33e1eabdde1a2661523d68be1377c3eced28175a8d9256c0699d22aa0e84c1d4662ae36297fe80c7bb9a62ad99e6d2c5768f85c46bda97c112400fb453fbce0e7cc1cb387d7b402c47faaad851ccb3b080b981ee224aff5823dad698ef8672b86', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEA5i0h+MflwlIBvsDCXIsWC9MCgiRzR8zDDllMii7in2Jmyqd7am3d
BgP9w1dip3GuQKm9V9CmIKxbNBih8Oy5hptpsPRbxXcO3B5+H8jMju/UlxdFJk0h
qL5rj+KigmubuYJmwT+cM7a3MURGUFjIadjLBxEhCOjV980atXwCJCez3Hz7KRQa
kqGGR7Xx1eI0NNV8ZE+G9ndfEIr2pZjcKFfQ+NbZB3Z/xFDsjTZDkoOSF/nNyiF7
9dJ/9AT0oopWugi9xB+0xkrE11NVTm4z/dMU1Y+MsGBQPwPWmmF9W4a80DR3uwiI
AYg3wSaoHn6lqGFGsvy7IF5elptO5qPPDoPqpJ7CUoYiHIYIEval2oatNKpczW+3
PbM5yHUI24y5lpVmMe4y258qoMGBOJK1d/3UFrBkFRlUe+IZciIqsDFw1wWkAgYw
cZvw9HMmBi5kGOVGV7OimLMoJR4i3b9V6gRkgHWWwD7Wt69R1J2m+NVDmi2pEqX8
FrwiPzxLzrgHC1n/rzbO5r3hal6C2AfMwu9h8pxRE04bNmEcfEH4KRiPhgpYAsv+
aj7xRwggZd8ZE9jgflfrsT/rlT6R6bSVuuWF/y68V/xbhTO3ca675GejJEAEcJdA
bmQ3C/gxhFQKkt4rMmHC1T/YS1rYdI5Ea4Q7cootxkErhOh98UeRW8MCAwEAAQ==
-----END RSA PUBLIC KEY-----
');
INSERT INTO public.logic_devicekey (created_at, updated_at, id, signature, public_key) VALUES ('2020-05-07 11:41:37.027506+08', '2020-05-07 11:41:37.027566+08', 'box_test_10003', '\x3ae9cca214d807e871ccea9e6a2d80fc50ba61cdf7d9095efc260c6286a36e6e295c4317e03506e1881523ea2b97b09df0b7073304630da67237d24c21c0c447c385e8399e6cbc3f0a422f6edc7189c0b39f5bdb061d3b3b7478aff0706c0ecef7cd43c35ecbeaae939521e3824c6ee7cb9ad71ba8c704812ba4490810f2ccaef49da08b2df7c19f9a5b3335176b47cbc4777627d960e3af2ab66adc88a22efa45051a37b2967e540fc55289d18b02bd23afd1db7c72d50b79a0b0ad35a4a4b8b066e445585bec5cc12a59cc1e35aceb2a04ab2c5d4697a9f8be992ddcfa1fc1898f66b7b3ec813bb2b7e85aa5e88a09d29432f6c83f42e4aede365a6ba7ac67660d6f4563ba6d5d2266280a78bb5192cec52b18ea5800fed5adcc059d0bbd4881ed18c3467d36cb22a7c0fda5eb160a8d57e98c294c7b8e7f30b90d8fe091a99d0d9a633e5026656c4dc09d5fd90b1c442cfcb998b78aae984bc0d43f415aa3501fdec91bd05c092f6e056cfd461f50fc35be45f907d04cb3c9f155784d36c162b99e37fd99060d3ef37d200c52eecf8b55a6631a28479316019187bf89124a57531304e3927bcfb5c78b5d31bea28af22e14d9c61525e646f5c3689b2d031a3e421539641b36c1b866ff80091a06a2503df4e0a725ec8ee1c553f375ca6f78', '-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEAvfk/bSsKSEdKmvNQUxx9Mu3LAtNKEP/wlqexuJby7TNeXtTlhb+3
dCVD4e94HuBtjsnjUiSdrxqEDOWs4bA2IctI+rjIelFspz+KQK/ce+f6xt8971Rx
417IZ/kvT0WWEU9kkFRrKrxZrpKA3wUuNu50eD0SYN/ScosDyOqoHjOPBlk7vq7+
uf+SUKMpN61tdZqNVjh9BT+h7z33BDeCUBhX27Dcq6pd4Jtj/jexzAdK0x963eOp
rnQ5b0yCOImEvrzNZ51CTAOzXJPvhlRe1sQvSgYYILHy+NqC2MJRb4GOpSLTgqFO
+vIQxFecyHfXKyTry9rV2BdkFdpVPRF2BzCCvNzGQO/NLqvq7nAwk6u2y721bQdB
U2m26WTuqSlG3c+xQZ20ec1P6pTxy74AvMnkSgIf/cPqAJ3paZDoTzbqCTsjxECe
x1YCOLg9i6bVwZ4BL0KWHxOdY7vUleW2deYyTRTgaOGPPztDuPK7IsjIchxbYaef
HbsiNMgs00sePEve6CNXaNBePHlr2crxrwToMW0gQDoOnEvxy4WS17CndSdDFoGc
Bda+rFkUhp6g0oX7xAkgncLvF89+BWcwBifl4BbmPeGfi3sTgkFPXVg+GKHuzGj7
xa1oS6Ub9rA6B9I/yKseiRvkiazmytP3WS9FZktIS6ueWDkGGX+6+bMCAwEAAQ==
-----END RSA PUBLIC KEY-----
');


--
-- Data for Name: logic_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:14:17.878646+08', '2020-05-08 15:14:17.878696+08', 1, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:31:01.80012+08', '2020-05-08 15:31:01.800154+08', 2, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:44:54.12224+08', '2020-05-08 15:44:54.122381+08', 3, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:45:00.044426+08', '2020-05-08 15:45:00.044541+08', 4, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:45:07.434658+08', '2020-05-08 15:45:07.434762+08', 5, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:46:57.376921+08', '2020-05-08 15:46:57.377058+08', 6, 'robot', 'front', '{"lat":0.0,"lng":0.0}', 'person:512,enter', B'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-14 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"camera":"front","threshold":0.9,"detected_macs":[]}', false, false, 'unknown', '', NULL, 1, 'robot_test_10001', '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:47:09.836315+08', '2020-05-08 15:47:09.836459+08', 7, 'robot', 'front', '{"lat":0.0,"lng":0.0}', 'person:512,enter', B'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-14 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"camera":"front","threshold":0.9,"detected_macs":[]}', false, false, 'unknown', '', NULL, 1, 'robot_test_10001', '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:47:15.80282+08', '2020-05-08 15:47:15.802883+08', 8, 'robot', 'front', '{"lat":0.0,"lng":0.0}', 'person:512,enter', B'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-14 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"camera":"front","threshold":0.9,"detected_macs":[]}', false, false, 'unknown', '', NULL, 1, 'robot_test_10001', '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:47:21.452984+08', '2020-05-08 15:47:21.45302+08', 9, 'robot', 'front', '{"lat":0.0,"lng":0.0}', 'person:512,enter', B'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-14 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"camera":"front","threshold":0.9,"detected_macs":[]}', false, false, 'unknown', '', NULL, 1, 'robot_test_10001', '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-08 15:47:30.315706+08', '2020-05-08 15:47:30.315847+08', 10, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);
INSERT INTO public.logic_event (created_at, updated_at, id, source, robot_camera, location, types, types_bits, started_at, ended_at, data, marked, viewed, annotate, tag, camera_id, site_id, robot_id, metadata, tracking_object_id) VALUES ('2020-05-09 15:26:18.771722+08', '2020-05-09 15:26:18.771866+08', 11, 'camera', 'front', NULL, 'person', B'10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000', '2019-10-13 14:00:57.262076+08', '2019-10-14 14:01:57.262076+08', '{"threshold":0.5}', false, false, 'unknown', '', 1, 1, NULL, '{}', NULL);


--
-- Data for Name: logic_eventbackup; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_inspection; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_inspection (created_at, updated_at, id, camera, started_at, ended_at, location, way_point, type, algo_types, robot_id, target_id, route_id, map_id, site_id, analysis_results, routine_id, routine_execution_id, routine_state, routine_state_synced, uuid) VALUES ('2020-05-07 14:47:31.461736+08', '2020-05-07 14:47:31.471469+08', 1, 'front', '2020-05-07 14:47:23+08', '2020-05-07 14:47:30+08', NULL, '{"x": 3.3325651169297985, "y": -2.45654280034316, "id": "1", "name": "22", "site": 1, "map_id": "robot_test_10001.1569814877938", "route_id": "1"}', 'check', '', 'robot_test_10001', 1, '1', '2', NULL, '', '', '1601372888578.1602293775', 'succeeded', false, 'uuid1');
INSERT INTO public.logic_inspection (created_at, updated_at, id, camera, started_at, ended_at, location, way_point, type, algo_types, robot_id, target_id, route_id, map_id, site_id, analysis_results, routine_id, routine_execution_id, routine_state, routine_state_synced, uuid) VALUES ('2020-05-07 15:01:51.454264+08', '2020-05-07 15:01:51.466974+08', 2, 'front', '2020-05-07 15:01:14+08', '2020-05-07 15:01:14+08', NULL, '{"x": 9.294153850803237, "y": -1.1163073281321914, "id": "2", "name": "I Do", "site": 1, "map_id": "robot_test_10001.1570763226327", "route_id": "2"}', 'check', '', 'robot_test_10001', 2, '2', '3', NULL, '', '', '1601372888578.1602293775', 'doing', false, 'uuid2');


--
-- Data for Name: logic_inspectmedium; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_inspectmedium (created_at, updated_at, id, name, file, data, inspection_id) VALUES ('2019-10-16 14:47:18.918338+08', '2019-10-16 14:47:18.918357+08', 1, 'snapshot', '{"Key":"users/2/robots/robot_dog_sr_10002/inspections/8c076bc7-2a3f-414c-8a56-3953394e6406.jpeg","ETag":"\"af180bed906b061c7c10fc2f20e62668\"","Bucket":"wanda-poc","meta":{"size":[1920,1080],"content_type":"image/jpeg","file_size":477089},"Location":"https://wanda-poc.s3.cn-northwest-1.amazonaws.com.cn/users%2F2%2Frobots%2Frobot_dog_sr_10002%2Finspections%2F8c076bc7-2a3f-414c-8a56-3953394e6406.jpeg"}', '{}', 1);
INSERT INTO public.logic_inspectmedium (created_at, updated_at, id, name, file, data, inspection_id) VALUES ('2019-10-17 15:01:51.455591+08', '2019-10-17 15:01:51.45561+08', 2, 'snapshot', '{"ETag":"\"ac2877c7904fcec67969e1b29a02562b\"","Location":"https://wanda-poc.s3.cn-northwest-1.amazonaws.com.cn/users%2F2%2Frobots%2Frobot_dog_sr_10003%2Finspections%2F3059ab05-86ac-4a85-a6a5-163575df3921.jpeg","meta":{"size":[1920,1080],"content_type":"image/jpeg","file_size":528447},"Bucket":"wanda-poc","Key":"users/2/robots/robot_dog_sr_10003/inspections/3059ab05-86ac-4a85-a6a5-163575df3921.jpeg"}', '{}', 2);


--
-- Data for Name: logic_invitation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_ipwhitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_locationeventblacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_manualcleanuptask; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_manualcleanuptask (id, created_at, updated_at, task_id, started_at, ended_at, status, result, params, organization_id, user_id) VALUES (1, '2020-05-21 17:12:05.051999+08', '2020-05-21 17:12:05.052026+08', '18aa80cc-6c64-47af-844c-d4e166c16d52', '2020-05-21 17:12:05.052089+08', NULL, 'ended', 'Fail', '{}', 1, 2);
INSERT INTO public.logic_manualcleanuptask (id, created_at, updated_at, task_id, started_at, ended_at, status, result, params, organization_id, user_id) VALUES (2, '2020-05-21 17:25:26.10729+08', '2020-05-21 17:25:26.107314+08', '098a95e9-37b7-4351-aacc-334a96c90484', '2020-05-21 17:25:26.107359+08', NULL, 'ended', 'Success', '{}', 1, 2);


--
-- Data for Name: logic_medium; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:14:17.885187+08', '2020-05-08 15:14:17.885307+08', 1, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 1);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:14:17.88581+08', '2020-05-08 15:14:17.885913+08', 2, 'bbox', '{"Key":"users/1/cameras/1/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 1);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:14:17.886372+08', '2020-05-08 15:14:17.886469+08', 3, 'video', '{"Key":"users/1/cameras/1/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 1);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:31:01.806848+08', '2020-05-08 15:31:01.80688+08', 4, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 2);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:31:01.806992+08', '2020-05-08 15:31:01.807013+08', 5, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 2);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:31:01.807094+08', '2020-05-08 15:31:01.807112+08', 6, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 2);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:44:54.129741+08', '2020-05-08 15:44:54.129866+08', 7, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 3);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:44:54.130408+08', '2020-05-08 15:44:54.130514+08', 8, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 3);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:44:54.130949+08', '2020-05-08 15:44:54.131049+08', 9, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 3);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:00.05065+08', '2020-05-08 15:45:00.05071+08', 10, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 4);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:00.050939+08', '2020-05-08 15:45:00.050983+08', 11, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 4);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:00.051163+08', '2020-05-08 15:45:00.051204+08', 12, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 4);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:07.441157+08', '2020-05-08 15:45:07.441245+08', 13, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 5);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:07.441598+08', '2020-05-08 15:45:07.441673+08', 14, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 5);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:45:07.441973+08', '2020-05-08 15:45:07.44207+08', 15, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 5);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:46:57.385267+08', '2020-05-08 15:46:57.385393+08', 16, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 6);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:46:57.385938+08', '2020-05-08 15:46:57.386084+08', 17, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 6);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:46:57.386542+08', '2020-05-08 15:46:57.386731+08', 18, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:02:57.262Z"}', 6);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:09.846146+08', '2020-05-08 15:47:09.846247+08', 19, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 7);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:09.846617+08', '2020-05-08 15:47:09.84669+08', 20, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 7);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:09.846991+08', '2020-05-08 15:47:09.84706+08', 21, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:02:57.262Z"}', 7);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:15.81053+08', '2020-05-08 15:47:15.810592+08', 22, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 8);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:15.810822+08', '2020-05-08 15:47:15.810865+08', 23, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 8);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:15.811046+08', '2020-05-08 15:47:15.811088+08', 24, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:02:57.262Z"}', 8);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:21.456291+08', '2020-05-08 15:47:21.456316+08', 25, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 9);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:21.456419+08', '2020-05-08 15:47:21.456439+08', 26, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 9);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:21.456525+08', '2020-05-08 15:47:21.456544+08', 27, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:02:57.262Z"}', 9);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:30.324214+08', '2020-05-08 15:47:30.324353+08', 28, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 10);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:30.324871+08', '2020-05-08 15:47:30.324979+08', 29, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 10);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-08 15:47:30.325409+08', '2020-05-08 15:47:30.325508+08', 30, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 10);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-09 15:26:18.785102+08', '2020-05-09 15:26:18.785241+08', 31, 'snapshot', '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '{}', 11);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-09 15:26:18.785778+08', '2020-05-09 15:26:18.785886+08', 32, 'bbox', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"text/json"}}', '{}', 11);
INSERT INTO public.logic_medium (created_at, updated_at, id, name, file, data, event_id) VALUES ('2020-05-09 15:26:18.786363+08', '2020-05-09 15:26:18.786466+08', 33, 'video', '{"Key":"users/3/cameras/3/events/0dc87e3","Bucket":"develop-data-turingvideo-com","meta":{"file_size":1888,"size":[640,360],"content_type":"video/mp4"}}', '{"started_at":"2019-10-14T06:00:57.262Z","ended_at":"2019-10-14T06:01:57.262Z"}', 11);


--
-- Data for Name: logic_mediumbackup; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_monitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-07 11:38:50.899322+08', '2020-05-07 11:38:50.89938+08', 1, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-07 11:44:41.843639+08', '2020-05-07 11:44:41.843668+08', 2, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-07 15:47:06.50292+08', '2020-05-07 15:47:06.502949+08', 3, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-08 11:46:26.385181+08', '2020-05-08 11:46:26.385214+08', 4, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-08 11:57:22.955892+08', '2020-05-08 11:57:22.955929+08', 5, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-08 12:03:09.778413+08', '2020-05-08 12:03:09.778453+08', 6, 0, 0, 0, 0, 0, 0);
INSERT INTO public.logic_monitor (created_at, updated_at, id, version, box_version, robot_version, camera_version, event_version, route_version) VALUES ('2020-05-08 14:35:12.96023+08', '2020-05-08 14:35:12.960266+08', 7, 0, 0, 0, 0, 0, 0);


--
-- Data for Name: logic_notifyrule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_organization (id, created_at, updated_at, code_name, name, event_type_mode, owner_id, analytics_robot_lidar_expire, analytics_robot_logs_expire, camera_preview_expire, camera_samples_expire, events_expire, robot_assets_expire, saved_videos_expire, snaps_expire, videos_expire, enable_tracking, target_reference_image_expire, email_template, disable_case_notification, disable_event_notification, use_event_2, face_throttle_num) VALUES (1, '2020-05-07 11:47:43.648802+08', '2020-05-07 15:44:35.215234+08', 'test_org', '测试', 'sys_and_customized', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, false, 600, '{}', false, false, false, 0);
INSERT INTO public.logic_organization (id, created_at, updated_at, code_name, name, event_type_mode, owner_id, analytics_robot_lidar_expire, analytics_robot_logs_expire, camera_preview_expire, camera_samples_expire, events_expire, robot_assets_expire, saved_videos_expire, snaps_expire, videos_expire, enable_tracking, target_reference_image_expire, email_template, disable_case_notification, disable_event_notification, use_event_2, face_throttle_num) VALUES (2, '2020-05-08 17:37:06.456539+08', '2020-05-08 17:37:06.456579+08', 'admin', 'admin', 'sys_and_customized', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, false, 600, '{}', false, false, false, 0);


--
-- Data for Name: logic_organizationuistrategy; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_patrol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_patrol (task_id, route_id) VALUES (1, 1);


--
-- Data for Name: logic_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-07 11:38:50.87874+08', '2020-05-07 11:38:50.878816+08', 1, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-07 11:44:41.842904+08', '2020-05-07 11:44:41.842933+08', 2, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-07 15:47:06.502188+08', '2020-05-07 15:47:06.502219+08', 3, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-08 11:46:26.381411+08', '2020-05-08 11:46:26.381437+08', 4, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-08 11:57:22.953046+08', '2020-05-08 11:57:22.953075+08', 5, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-08 12:03:09.775963+08', '2020-05-08 12:03:09.775994+08', 6, '');
INSERT INTO public.logic_person (created_at, updated_at, id, phone) VALUES ('2020-05-08 14:35:12.957127+08', '2020-05-08 14:35:12.957167+08', 7, '');


--
-- Data for Name: logic_robot; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_robot (created_at, updated_at, id, saving_at, robox_status, status, state, meta, snapshot, snapshots, timezone, ip_address, type, name, detect_params, patrol_params, mac_params, cameras, auto_speak, notifies, upload_video_enabled, upload_video_expire, upload_event_expire, scene, sequence, session_id, version, enable_escalation, should_push, site_id, user_id) VALUES ('2020-05-07 15:19:45.623947+08', '2020-05-07 15:19:45.62398+08', 'robot_test_10001', '2020-05-07 21:00:00+08', 'online', 'online', '{"status":"robot_offline","power_percentage":null,"mode":""}', '{"agent":{"name":"Robot","level":1,"version":"0.14.3"},"app_agent":null}', '{"ETag":"\"0803a3e9d60deaf8a1024366183df584\"","Bucket":"data-for-apiserver","meta":{"size":[1920,1080],"file_size":444969,"content_type":"image/jpeg"},"Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F5%2Frobots%2Frobot_dog_sr_20002%2Fsnaps%2F9ca64c37-7da2-4fcd-8a2c-3fc0f3d0bcdc.jpeg","Key":"users/5/robots/robot_dog_sr_20002/snapshots/front.jpg","version":"9ca64c37-7da2-4fcd-8a2c-3fc0f3d0bcdc.jpeg"}', '{"front":{"ETag":"\"0803a3e9d60deaf8a1024366183df584\"","Bucket":"data-for-apiserver","meta":{"size":[1920,1080],"file_size":444969,"content_type":"image/jpeg"},"Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F5%2Frobots%2Frobot_dog_sr_20002%2Fsnaps%2F9ca64c37-7da2-4fcd-8a2c-3fc0f3d0bcdc.jpeg","Key":"users/5/robots/robot_dog_sr_20002/snapshots/front.jpg","version":"9ca64c37-7da2-4fcd-8a2c-3fc0f3d0bcdc.jpeg"}}', 'UTC', '192.168.2.141', 'std_sr_v1', '仓库巡逻号', '{"algos":"person","threshold":0.8,"auto_speak_enabled":true,"detect_enabled":true}', '{"speed":0.35,"radius":4}', '{"detect_macs":[],"detect_macs_enabled":true,"auto_speak_enabled":true}', '[{"name":"front","label":"Front camera"},{"name":"rear","label":"Rear camera"}]', 'default', '', false, 2592000, 2592000, 0, 0, 'chn5cd545ac97726d3c48604e353d3d3', 0, false, true, 1, 2);
INSERT INTO public.logic_robot (created_at, updated_at, id, saving_at, robox_status, status, state, meta, snapshot, snapshots, timezone, ip_address, type, name, detect_params, patrol_params, mac_params, cameras, auto_speak, notifies, upload_video_enabled, upload_video_expire, upload_event_expire, scene, sequence, session_id, version, enable_escalation, should_push, site_id, user_id) VALUES ('2020-05-07 15:22:17.327658+08', '2020-05-07 15:22:17.327693+08', 'robot_test_10002', '2020-05-07 03:00:00+08', 'offline', 'robot_offline', '{"status":"robot_offline","power_percentage":null,"mode":""}', '{"agent":{"name":"Robot","level":1,"version":"0.11.0"},"app_agent":{"name":"Bot_Nimbo","level":1201,"version":"0.12.1pre.debug"}}', '{"ETag":"\"5e4b93b9f540c45319302a6d0e0b735e\"","meta":{"content_type":"image/jpeg","size":[640,360],"file_size":45072},"Bucket":"data-for-apiserver","Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F9%2Frobots%2Frobot_dog_sr_20003%2Fsnaps%2F17d76c7e-9104-4323-821e-e508faa1f59b.jpeg","Key":"users/9/robots/robot_dog_sr_20003/snapshots/front.jpg","version":"17d76c7e-9104-4323-821e-e508faa1f59b.jpeg"}', '{"front":{"ETag":"\"5e4b93b9f540c45319302a6d0e0b735e\"","meta":{"content_type":"image/jpeg","size":[640,360],"file_size":45072},"Bucket":"data-for-apiserver","Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F9%2Frobots%2Frobot_dog_sr_20003%2Fsnaps%2F17d76c7e-9104-4323-821e-e508faa1f59b.jpeg","Key":"users/9/robots/robot_dog_sr_20003/snapshots/front.jpg","version":"17d76c7e-9104-4323-821e-e508faa1f59b.jpeg"}}', 'UTC', '192.168.2.142', 'std_sr_v1', '门卫', '{"algos":"person","threshold":0.800000011920929,"auto_speak_enabled":false,"detect_enabled":true}', '{"speed":0.3499999940395355,"radius":4.0}', '{"detect_macs":[],"detect_macs_enabled":true,"auto_speak_enabled":true}', '[{"name":"front","label":"Front camera"},{"name":"rear","label":"Rear camera"}]', 'default', '', false, 2592000, 2592000, 0, 0, 'chn5cd545ac97726d3c48604e353d3d2', 0, false, true, 1, 2);
INSERT INTO public.logic_robot (created_at, updated_at, id, saving_at, robox_status, status, state, meta, snapshot, snapshots, timezone, ip_address, type, name, detect_params, patrol_params, mac_params, cameras, auto_speak, notifies, upload_video_enabled, upload_video_expire, upload_event_expire, scene, sequence, session_id, version, enable_escalation, should_push, site_id, user_id) VALUES ('2020-05-07 15:25:38.188483+08', '2020-05-07 15:25:38.188516+08', 'robot_test_10003', '2020-05-07 18:03:00+08', 'offline', 'offline', '{"status":"robot_offline","power_percentage":null,"mode":""}', '{"agent":{"name":"Robot","level":1,"version":"0.11.0"},"app_agent":{"name":"Bot_Nimbo","level":1201,"version":"0.12.1pre.debug"}}', '{"ETag":"\"5e4b93b9f540c44319302a6d0e0b735e\"","meta":{"content_type":"image/jpeg","size":[640,360],"file_size":45072},"Bucket":"data-for-apiserver","Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F9%2Frobots%2Frobot_dog_sr_20003%2Fsnaps%2F17d76c7e-9104-4323-821e-e508faa1f59b.jpeg","Key":"users/9/robots/robot_dog_sr_20003/snapshots/front.jpg","version":"17d76c7e-9104-4323-821e-e508faa1f59b.jpeg"}', '{"front":{"ETag":"\"5e4b93b9f540c44319302a6d0e0b735e\"","meta":{"content_type":"image/jpeg","size":[640,360],"file_size":45072},"Bucket":"data-for-apiserver","Location":"https://data-for-apiserver.s3.cn-north-1.amazonaws.com.cn/users%2F9%2Frobots%2Frobot_dog_sr_20003%2Fsnaps%2F17d76c7e-9104-4323-821e-e508faa1f59b.jpeg","Key":"users/9/robots/robot_dog_sr_20003/snapshots/front.jpg","version":"17d76c7e-9104-4323-821e-e508faa1f59b.jpeg"}}', 'Asia/Kuwait', '127.0.0.1', 'std_sr_v1', '办公室巡逻号', '{"algos":"person","threshold":0.8,"auto_speak_enabled":true,"detect_enabled":true}', '{"speed":0.3499999940395355,"radius":4.0}', '{"detect_macs":[],"detect_macs_enabled":true,"auto_speak_enabled":true}', '[{"name":"front","label":"Front camera"},{"name":"rear","label":"Rear camera"}]', 'default', '', false, 2592000, 2592000, 0, 0, 'chn5cd545ac97726d3c48604e353d3d1', 0, false, true, 1, 2);


--
-- Data for Name: logic_robotsavedvideo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_robotsnap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_robotvideo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_robotvideo (created_at, updated_at, id, camera, started_at, ended_at, size, video, robot_id) VALUES ('2019-11-14 14:52:28.374116+08', '2019-11-14 14:52:28.374146+08', 1, 'front', '2019-09-27 14:15:31+08', '2019-09-27 14:15:32+08', 8888, '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"dev-turingvideo-com","meta":{"file_size":8888,"content_type":"image/jpeg"}}', 'robot_test_10001');
INSERT INTO public.logic_robotvideo (created_at, updated_at, id, camera, started_at, ended_at, size, video, robot_id) VALUES ('2019-11-14 15:06:28.809481+08', '2019-11-14 15:06:28.809512+08', 2, 'front', '2019-09-27 14:15:31+08', '2019-09-27 14:15:32+08', 8888, '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"dev-turingvideo-com","meta":{"file_size":8888,"size":[640,360],"content_type":"image/jpeg"}}', 'robot_test_10001');
INSERT INTO public.logic_robotvideo (created_at, updated_at, id, camera, started_at, ended_at, size, video, robot_id) VALUES ('2019-11-14 15:25:03.214976+08', '2019-11-14 15:25:03.215033+08', 3, 'front', '2019-09-27 14:15:31+08', '2019-09-27 14:15:32+08', 2288, '{"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"dev-turingvideo-com","meta":{"file_size":2288,"size":[640,360],"content_type":"image/jpeg"}}', 'robot_test_10001');


--
-- Data for Name: logic_route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_route (id, name, points, checkpoints, version, user_id) VALUES (1, 'route_test1', '"point1"', '"checkpoints"', 0, 2);
INSERT INTO public.logic_route (id, name, points, checkpoints, version, user_id) VALUES (2, 'route_test2', '"point1"', '"checkpoints"', 0, 2);
INSERT INTO public.logic_route (id, name, points, checkpoints, version, user_id) VALUES (3, 'route_test3', '"point_test"', '"checkpoint_test"', 0, 2);


--
-- Data for Name: logic_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_rule (created_at, updated_at, id, unique_id, name, mode, version, start_at, end_at, region, algos, params, algo, schedule, params_base, camera_id) VALUES ('2020-05-07 15:49:17.244913+08', '2020-05-07 15:49:17.244972+08', 1, '46c29c48-f29e-411c-8cf3-b46d567a1bc0', '人', 'on', 0, 480, 900, '', '', '{}', 'person:512', '{}', '', 1);
INSERT INTO public.logic_rule (created_at, updated_at, id, unique_id, name, mode, version, start_at, end_at, region, algos, params, algo, schedule, params_base, camera_id) VALUES ('2020-05-07 15:51:16.707323+08', '2020-05-07 15:51:16.707382+08', 2, 'e7f9b7c4-143f-498f-a90c-d192774e704d', '设备离开', 'off', 0, 0, 0, '', '', '{}', 'Leave:81', '{}', '', 1);
INSERT INTO public.logic_rule (created_at, updated_at, id, unique_id, name, mode, version, start_at, end_at, region, algos, params, algo, schedule, params_base, camera_id) VALUES ('2020-05-13 10:52:20.644661+08', '2020-05-13 10:52:20.644687+08', 3, '821b60c5-adbe-493a-b145-ac64d9a92024', 'test333', 'on', 0, 0, 1, '0.151,0.513,0.234,0.135', '', '{}', '', '{}', '', 7);


--
-- Data for Name: logic_sharing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_site (created_at, updated_at, id, name, location, note, polygons, customer_id, city, county, label, province) VALUES ('2020-05-07 11:50:09.782582+08', '2020-05-07 11:50:09.782659+08', 1, '紫东创意产业园', '', '', '[]', 2, '南京市', '栖霞区', 'Zidong Creative Industrial Park', '江苏省');
INSERT INTO public.logic_site (created_at, updated_at, id, name, location, note, polygons, customer_id, city, county, label, province) VALUES ('2020-05-07 11:53:34.327751+08', '2020-05-07 11:53:34.327804+08', 2, '无锡办公室', '', '', '[]', 2, '无锡市', '', '', '江苏省');


--
-- Data for Name: logic_sitemanagement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_sitemanagement (created_at, updated_at, id, site_id, site_manager_id) VALUES ('2020-05-07 15:47:27.575811+08', '2020-05-07 15:47:27.575861+08', 1, 1, 3);


--
-- Data for Name: logic_sitemanager; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_sitemanager (created_at, updated_at, id, phone, level, customer_id) VALUES ('2020-05-07 15:47:11.393856+08', '2020-05-07 15:47:11.393895+08', 3, '', 0, 2);


--
-- Data for Name: logic_snap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_task (created_at, updated_at, id, type, name, mode, start_at, end_at, version, polymorphic_ctype_id, robot_id) VALUES ('2019-11-07 18:19:09.636679+08', '2019-11-07 18:19:09.636718+08', 1, 'patrol', 'patrol1', 'on', 0, 10, 0, 46, 'robot_test_10001');


--
-- Data for Name: logic_thermalcamerasettings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_thermalcamerasettingsbatchupdaterecord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_thermalcamerasettingscheckrecord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_uistrategy; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_waypoint; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.logic_waypoint (id, created_at, updated_at, name, x, y, map_id, route_id, status, predict_status, predict_status_updated_at, store_type, algo_types, site_id) VALUES (1, '2019-10-16 14:47:18.928883+08', '2019-10-16 14:47:18.928905+08', '22', 3.3325651169297985000000000, -2.4565428003431600000000000, 'robot_test_10001.1569814877938', '1', 'open_store', 'open_store', '2019-10-16 14:46:18.928883+08', '', '', 1);
INSERT INTO public.logic_waypoint (id, created_at, updated_at, name, x, y, map_id, route_id, status, predict_status, predict_status_updated_at, store_type, algo_types, site_id) VALUES (2, '2019-10-17 15:01:51.465403+08', '2019-10-17 15:01:51.465425+08', 'I Do', 9.2941538508032370000000000, -1.1163073281321914000000000, 'robot_test_10001.1570763226327', '2', 'open_store', 'open_store', '2019-10-17 14:46:18.928883+08', '', '', 1);


--
-- Data for Name: logic_waypointhistory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: logic_webhook; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mapping_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mapping_map (id, created_at, updated_at, center_point, initial_zoom, min_zoom, max_zoom, data, image, map_config_id) VALUES (1, '2020-05-07 16:00:25.026686+08', '2020-05-07 16:00:25.026762+08', '{"lat":32.0572355,"lng":118.77807441}', 10, 2, 10, '{"data":"test"}', '{}', 1);
INSERT INTO public.mapping_map (id, created_at, updated_at, center_point, initial_zoom, min_zoom, max_zoom, data, image, map_config_id) VALUES (2, '2020-05-07 16:02:22.648602+08', '2020-05-07 16:02:22.64868+08', NULL, NULL, NULL, NULL, NULL, '{"meta":{"file_size":888,"content_type":"image/jpeg"},"Key":"users/1/cameras/1/events/logo.jpg","Bucket":"develop-data-turingvideo-com"}', 2);
INSERT INTO public.mapping_map (id, created_at, updated_at, center_point, initial_zoom, min_zoom, max_zoom, data, image, map_config_id) VALUES (3, '2020-05-07 16:17:42.208608+08', '2020-05-07 16:17:42.20867+08', '{"lat":32.0572354,"lng":118.77807441}', 5, 1, 5, '{"data":"del"}', '{}', 3);


--
-- Data for Name: mapping_mapconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mapping_mapconfig (id, created_at, updated_at, map_type, config, is_default, organization_id) VALUES (1, '2020-05-07 15:59:36.727183+08', '2020-05-07 15:59:36.727259+08', 'baidu', '{"baidu":"sugar"}', true, 1);
INSERT INTO public.mapping_mapconfig (id, created_at, updated_at, map_type, config, is_default, organization_id) VALUES (2, '2020-05-07 16:02:05.445053+08', '2020-05-07 16:02:05.44513+08', 'image', '{"image":"sugar"}', false, 1);
INSERT INTO public.mapping_mapconfig (id, created_at, updated_at, map_type, config, is_default, organization_id) VALUES (3, '2020-05-07 16:16:56.172865+08', '2020-05-07 16:16:56.172966+08', 'google', '{"google":"sugar"}', false, 1);


--
-- Data for Name: mapping_maptarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mapping_maptarget (id, created_at, updated_at, map_id, target_id) VALUES (1, '2020-05-09 14:26:23.281117+08', '2020-05-09 14:26:23.281156+08', 1, 4);
INSERT INTO public.mapping_maptarget (id, created_at, updated_at, map_id, target_id) VALUES (2, '2020-05-09 14:26:44.301678+08', '2020-05-09 14:26:44.30179+08', 2, 4);


--
-- Data for Name: mapping_sitemap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mapping_sitemap (id, created_at, updated_at, name, index, map_id, site_id) VALUES (1, '2020-05-09 14:35:31.306867+08', '2020-05-09 14:35:31.306928+08', 'baidu', 1, 1, 1);
INSERT INTO public.mapping_sitemap (id, created_at, updated_at, name, index, map_id, site_id) VALUES (2, '2020-05-09 14:35:41.748447+08', '2020-05-09 14:35:41.748531+08', 'image', 2, 2, 1);


--
-- Data for Name: mapping_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mapping_target (id, created_at, updated_at, target_type, auto_threshold, point, polygons, "position", name, camera_id, domain_id, robot_id, site_id) VALUES (1, '2020-05-09 14:21:41.691356+08', '2020-05-09 14:21:41.691402+08', 'point', 1, '{"lat":32.0572354,"lng":118.77807441}', NULL, NULL, 'point', 1, NULL, NULL, NULL);
INSERT INTO public.mapping_target (id, created_at, updated_at, target_type, auto_threshold, point, polygons, "position", name, camera_id, domain_id, robot_id, site_id) VALUES (2, '2020-05-09 14:22:30.196725+08', '2020-05-09 14:22:30.196769+08', 'polygons', 2, NULL, '[{"points":[{"lat":23.21312312312,"lng":112.23213213},{"lat":24.21312312312,"lng":112.43213213},{"lat":23.41312312312,"lng":112.33213213}]}]', NULL, 'polygons', NULL, NULL, 'robot_test_10001', NULL);
INSERT INTO public.mapping_target (id, created_at, updated_at, target_type, auto_threshold, point, polygons, "position", name, camera_id, domain_id, robot_id, site_id) VALUES (3, '2020-05-09 14:23:04.595264+08', '2020-05-09 14:24:21.999078+08', 'auto', NULL, '{"lat":32.0572354,"lng":118.77807441}', '[{"points":[{"lat":23.21312312312,"lng":112.23213213},{"lat":24.21312312312,"lng":112.43213213},{"lat":23.41312312312,"lng":112.33213213}]}]', NULL, 'aotu', NULL, 2, NULL, NULL);
INSERT INTO public.mapping_target (id, created_at, updated_at, target_type, auto_threshold, point, polygons, "position", name, camera_id, domain_id, robot_id, site_id) VALUES (4, '2020-05-09 14:24:32.482768+08', '2020-05-09 14:24:32.48282+08', 'polygons', 1, NULL, '[{"points":[{"lat":23.21312312312,"lng":112.23213213},{"lat":24.21312312312,"lng":112.43213213},{"lat":23.41312312312,"lng":112.33213213}]}]', NULL, 'polygons_site', NULL, NULL, NULL, 1);
INSERT INTO public.mapping_target (id, created_at, updated_at, target_type, auto_threshold, point, polygons, "position", name, camera_id, domain_id, robot_id, site_id) VALUES (5, '2020-05-09 14:25:07.719502+08', '2020-05-09 14:25:07.71954+08', 'position', -1, NULL, NULL, '{"x":11.0,"y":22.0,"z":33.0}', 'position', 2, NULL, NULL, NULL);


--
-- Data for Name: monitor_center_business; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.monitor_center_business (id, name, "desc", logo, logo_small) VALUES (1, 'zidong', 'zidongchuangyiyuan', '/assets/xincheng/logo/xincheng.png', '/assets/xincheng/logo/xincheng-small.png');


--
-- Data for Name: monitor_center_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_customalgo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_customalgonotify; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_device; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_eventext; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_fmevent; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_orgext; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.monitor_center_orgext (id, notify_interval, sms_allowed, sign_name, template_code, webhook) VALUES (1, 900, true, '', '', '{"url":"https://turingvideo.cn","token":"123qwe","qr_required": false,"extra":{}}');
INSERT INTO public.monitor_center_orgext (id, notify_interval, sms_allowed, sign_name, template_code, webhook) VALUES (2, 900, true, '', '', '{"url":"https://turingvideo.cn","token":"123qwe","qr_required": false,"extra":{}}');


--
-- Data for Name: monitor_center_robotincidentnotifyrecord; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_robotnotifier; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_sitefloorvideo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: monitor_center_userext; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_domain (id, name, code_name, lft, rght, tree_id, level, domain_type_id, organization_id, parent_id, map_id) VALUES (1, '紫东创意产业园', 'zidong', 1, 4, 3, 0, 1, 1, NULL, 1);
INSERT INTO public.org_domain (id, name, code_name, lft, rght, tree_id, level, domain_type_id, organization_id, parent_id, map_id) VALUES (2, '西区', 'West District', 2, 3, 3, 1, 2, 1, 1, 2);
INSERT INTO public.org_domain (id, name, code_name, lft, rght, tree_id, level, domain_type_id, organization_id, parent_id, map_id) VALUES (3, 'update', 'update', 1, 4, 1, 0, 4, 1, NULL, NULL);
INSERT INTO public.org_domain (id, name, code_name, lft, rght, tree_id, level, domain_type_id, organization_id, parent_id, map_id) VALUES (4, 'delete_test', 'delete', 1, 2, 2, 0, 4, 1, NULL, NULL);
INSERT INTO public.org_domain (id, name, code_name, lft, rght, tree_id, level, domain_type_id, organization_id, parent_id, map_id) VALUES (5, 'update_test', 'update_test', 2, 3, 1, 1, 5, 1, 4, NULL);


--
-- Data for Name: org_domainsite; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_domainsite (id, domain_id, site_id) VALUES (1, 2, 1);


--
-- Data for Name: org_domaintype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_domaintype (id, code_name, name, is_leaf, lft, rght, tree_id, level, organization_id, parent_id) VALUES (1, 'root', '紫东创意产业园', false, 1, 4, 1, 0, 1, NULL);
INSERT INTO public.org_domaintype (id, code_name, name, is_leaf, lft, rght, tree_id, level, organization_id, parent_id) VALUES (2, 'West District', '西区', true, 2, 3, 1, 1, 1, 1);
INSERT INTO public.org_domaintype (id, code_name, name, is_leaf, lft, rght, tree_id, level, organization_id, parent_id) VALUES (3, 'root', '紫东', false, 1, 2, 2, 0, 1, NULL);
INSERT INTO public.org_domaintype (id, code_name, name, is_leaf, lft, rght, tree_id, level, organization_id, parent_id) VALUES (4, 'root', '金马路', false, 1, 4, 3, 0, 1, NULL);
INSERT INTO public.org_domaintype (id, code_name, name, is_leaf, lft, rght, tree_id, level, organization_id, parent_id) VALUES (5, 'update', '金马地铁站', true, 2, 3, 3, 1, 1, 4);


--
-- Data for Name: org_domainuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_domainuser (id, domain_id, user_id, in_charge) VALUES (1, 2, 3, true);


--
-- Data for Name: org_organizationdelegate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_organizationdelegate (id, organization_id, user_id) VALUES (1, 1, 2);


--
-- Data for Name: org_organizationuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (1, 1, 2);
INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (2, 1, 3);
INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (3, 1, 6);
INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (4, 1, 4);
INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (5, 1, 7);
INSERT INTO public.org_organizationuser (id, organization_id, user_id) VALUES (6, 2, 1);


--
-- Data for Name: org_usernode; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (1, 1, 4, 1, 0, NULL, 2);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (2, 2, 3, 1, 1, 1, 3);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (3, 1, 8, 2, 0, NULL, 2);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (4, 2, 5, 2, 1, 3, 4);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (5, 3, 4, 2, 2, 4, 6);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (6, 6, 7, 2, 1, 3, 7);
INSERT INTO public.org_usernode (id, lft, rght, tree_id, level, parent_id, user_id) VALUES (7, 1, 2, 3, 0, NULL, 1);


--
-- Data for Name: patrol_algoconfig; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.patrol_algoconfig (id, created_at, updated_at, waypoint_action, params, thresholds, schedules, fetch_task_count, enabled, algo_id, target_id) VALUES (1, '2020-03-26 09:55:04.327925+08', '2020-03-26 09:55:04.327954+08', 'snapshot', '{"test":"test"}', '{}', '[]', 0, true, 1, 1);
INSERT INTO public.patrol_algoconfig (id, created_at, updated_at, waypoint_action, params, thresholds, schedules, fetch_task_count, enabled, algo_id, target_id) VALUES (2, '2020-03-26 09:57:30.501056+08', '2020-03-26 09:57:30.501092+08', 'video', '{"test":"test"}', '{}', '[]', 0, true, 1, 2);


--
-- Data for Name: patrol_algoreference; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: patrol_building; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.patrol_building (id, created_at, updated_at, name, site_id) VALUES (1, '2021-03-15 15:10:16.767138+08', '2021-03-15 15:10:16.76728+08', '南京图菱', 1);


--
-- Data for Name: patrol_detectiontask; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: patrol_floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.patrol_floor (id, created_at, updated_at, name, floor, full_route_config, building_id, elevator_reachable, image, map_id, zone_id) VALUES (1, '2021-03-15 15:10:51.500405+08', '2021-03-15 15:10:51.500452+08', '1F', 1, '{}', 1, true, NULL, NULL, 'zone_id_001');
INSERT INTO public.patrol_floor (id, created_at, updated_at, name, floor, full_route_config, building_id, elevator_reachable, image, map_id, zone_id) VALUES (2, '2021-03-15 15:11:05.792246+08', '2021-03-15 15:11:05.792293+08', '2F', 2, '{}', 1, true, NULL, NULL, 'zone_id_002');
INSERT INTO public.patrol_floor (id, created_at, updated_at, name, floor, full_route_config, building_id, elevator_reachable, image, map_id, zone_id) VALUES (3, '2021-03-15 15:11:18.497127+08', '2021-03-15 15:11:18.497164+08', 'B1', -1, '{}', 1, true, NULL, NULL, 'zone_id_003');


--
-- Data for Name: patrol_target; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.patrol_target (id, created_at, updated_at, name, floor, serial_no, category, longitude, latitude, preset_status, "desc", latest_inspection_time, site_id, visible, uuid, reference_image, reference_image_updated_at, new_floor_id, enabled, robot_reachable, algo_configs_exist, algo_references_exist, bound, cstatus) VALUES (1, '2020-05-09 15:38:38.562757+08', '2020-05-09 15:38:38.562812+08', 'patrol_taget', 1, 'test1', NULL, NULL, NULL, NULL, NULL, NULL, 1, true, NULL, '{"Key":"/users/1/cameras/temp/0ae1c907-5b01-4f67-b0d9-58ec8f72a347.jpeg","Bucket":"dev-data-for-apiserver","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '2020-09-22 11:42:02+08', NULL, true, true, false, false, true, 'ing');
INSERT INTO public.patrol_target (id, created_at, updated_at, name, floor, serial_no, category, longitude, latitude, preset_status, "desc", latest_inspection_time, site_id, visible, uuid, reference_image, reference_image_updated_at, new_floor_id, enabled, robot_reachable, algo_configs_exist, algo_references_exist, bound, cstatus) VALUES (2, '2020-05-09 15:42:07.072463+08', '2020-05-09 15:42:07.072538+08', 'test', -1, 'test2', NULL, NULL, NULL, NULL, NULL, NULL, 1, false, NULL, '{"Key":"/users/1/cameras/temp/16866efd-8901-448c-9f78-ad30979bbc95.jpeg","Bucket":"dev-data-for-apiserver","meta":{"file_size":1888,"size":[640,360],"content_type":"image/jpeg"}}', '2020-09-22 11:42:04+08', NULL, true, true, false, false, true, 'ing');


--
-- Data for Name: perm_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (2, '2019-10-09 17:31:41.546+08', '2019-10-09 17:31:41.546+08', 'Attach User', 'attach_user', 1);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (4, '2019-10-14 10:04:38.117+08', '2019-10-14 10:04:38.117+08', 'Deattach User', 'deattach_user', 1);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (6, '2019-10-15 11:46:43.406+08', '2019-10-15 11:46:43.406+08', 'Assign User', 'assign_user', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (7, '2019-10-15 11:47:00.962+08', '2019-10-15 11:47:00.962+08', 'Attach User', 'attach_user', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (8, '2019-10-15 16:46:47.485+08', '2019-10-15 16:46:47.485+08', 'Create Domain', 'create', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (9, '2019-10-15 16:47:25.508+08', '2019-10-15 16:47:25.508+08', 'Assign Child', 'assign_child', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (10, '2019-10-23 16:05:54.873+08', '2019-10-23 16:05:54.873+08', 'Update', 'update', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (11, '2019-10-23 16:06:09.368+08', '2019-10-23 16:06:09.368+08', 'Destroy', 'destroy', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (12, '2019-10-24 15:57:26.126+08', '2019-10-24 15:57:26.126+08', 'Create', 'create', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (13, '2019-10-24 15:57:41.197+08', '2019-10-24 15:57:41.197+08', 'Update', 'update', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (14, '2019-10-24 15:57:54.285+08', '2019-10-24 15:57:54.285+08', 'Destroy', 'destroy', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (16, '2019-10-29 14:12:28.462+08', '2019-10-29 14:12:28.462+08', 'Create', 'create', 8);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (17, '2019-10-29 15:00:31.49+08', '2019-10-29 15:00:31.49+08', 'SiteManagements', 'managements', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (19, '2019-10-30 19:12:12.17+08', '2019-10-30 19:12:12.17+08', 'Retrieve', 'retrieve', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (21, '2019-10-30 19:31:18.059+08', '2019-10-30 19:31:18.059+08', 'Retrieve', 'retrieve', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (23, '2019-10-30 19:42:06.445+08', '2019-10-30 19:42:06.445+08', 'Retrieve', 'retrieve', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (25, '2019-10-31 09:17:32.353+08', '2019-10-31 09:17:32.353+08', 'Retrieve', 'retrieve', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (26, '2019-10-31 09:18:06.449+08', '2019-10-31 09:18:06.449+08', 'Create', 'create', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (27, '2019-10-31 09:18:24.868+08', '2019-10-31 09:18:24.868+08', 'Update', 'update', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (28, '2019-10-31 09:18:48.36+08', '2019-10-31 09:18:48.36+08', 'Destroy', 'destroy', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (29, '2019-10-31 09:19:16.684+08', '2019-10-31 09:19:16.685+08', 'Create', 'create', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (30, '2019-10-31 09:19:28.988+08', '2019-10-31 09:19:28.988+08', 'Update', 'update', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (31, '2019-10-31 09:19:36.541+08', '2019-10-31 09:19:36.541+08', 'Destroy', 'destroy', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (33, '2019-10-31 14:01:02.357+08', '2019-10-31 14:01:02.357+08', 'Retrieve', 'retrieve', 12);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (34, '2019-10-31 14:01:13.277+08', '2019-10-31 14:01:13.277+08', 'Create', 'create', 12);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (35, '2019-10-31 14:03:09.577+08', '2019-10-31 14:03:09.577+08', 'Update', 'update', 12);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (36, '2019-10-31 14:03:19.535+08', '2019-10-31 14:03:19.535+08', 'Destroy', 'destroy', 12);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (38, '2019-10-31 14:03:45.141+08', '2019-10-31 14:03:45.141+08', 'Retrieve', 'retrieve', 13);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (39, '2019-10-31 14:04:28.492+08', '2019-10-31 14:04:28.492+08', 'Create', 'create', 13);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (40, '2019-10-31 14:04:42.813+08', '2019-10-31 14:04:42.813+08', 'Update', 'update', 13);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (41, '2019-10-31 14:04:51.374+08', '2019-10-31 14:04:51.374+08', 'Destroy', 'destroy', 13);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (43, '2019-10-31 14:10:02.963+08', '2019-10-31 14:10:02.963+08', 'Retrieve', 'retrieve', 2);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (44, '2019-10-31 14:10:12.125+08', '2019-10-31 14:10:12.125+08', 'Create', 'create', 2);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (45, '2019-10-31 14:10:21.314+08', '2019-10-31 14:10:21.314+08', 'Update', 'update', 2);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (46, '2019-10-31 14:10:31.02+08', '2019-10-31 14:10:31.02+08', 'Destroy', 'destroy', 2);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (48, '2019-10-31 15:23:42.136+08', '2019-10-31 15:23:42.136+08', 'Retrieve', 'retrieve', 14);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (49, '2019-10-31 15:23:50.687+08', '2019-10-31 15:23:50.687+08', 'Create', 'create', 14);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (50, '2019-10-31 15:24:00.037+08', '2019-10-31 15:24:00.037+08', 'Update', 'update', 14);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (51, '2019-10-31 15:24:08.928+08', '2019-10-31 15:24:08.928+08', 'Destroy', 'destroy', 14);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (53, '2019-10-31 16:47:37.541+08', '2019-10-31 16:47:37.541+08', 'Retrieve', 'retrieve', 15);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (54, '2019-10-31 16:47:46.877+08', '2019-10-31 16:47:46.877+08', 'Create', 'create', 15);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (55, '2019-10-31 16:48:00.417+08', '2019-10-31 16:48:00.417+08', 'Update', 'update', 15);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (56, '2019-10-31 16:48:08.502+08', '2019-10-31 16:48:08.502+08', 'Destroy', 'destroy', 15);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (58, '2019-11-14 19:40:38.331+08', '2019-11-14 19:40:38.331+08', 'Retrieve', 'retrieve', 16);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (59, '2019-11-14 19:40:46.708+08', '2019-11-14 19:40:46.708+08', 'Update', 'update', 16);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (60, '2019-11-14 19:40:56.968+08', '2019-11-14 19:40:56.968+08', 'Create', 'create', 16);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (61, '2019-11-14 19:41:05.982+08', '2019-11-14 19:41:05.982+08', 'Destroy', 'destroy', 16);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (63, '2019-11-18 10:21:36.775+08', '2019-11-18 10:21:36.775+08', 'Retrieve', 'retrieve', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (65, '2019-11-21 15:32:14.781+08', '2019-11-21 15:32:14.781+08', 'Retrieve', 'retrieve', 17);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (66, '2019-11-21 15:32:23.138+08', '2019-11-21 15:32:23.138+08', 'Create', 'create', 17);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (67, '2019-11-21 15:32:30.803+08', '2019-11-21 15:32:30.804+08', 'Update', 'update', 17);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (68, '2019-11-21 15:32:39.143+08', '2019-11-21 15:32:39.143+08', 'Destroy', 'destroy', 17);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (69, '2019-11-25 15:35:32.44+08', '2019-11-25 15:35:32.44+08', 'Retrieve', 'retrieve', 6);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (70, '2019-11-25 15:35:45.799+08', '2019-11-25 15:35:45.799+08', 'Create', 'create', 6);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (71, '2019-11-25 15:36:45.144+08', '2019-11-25 15:36:45.144+08', 'Update', 'update', 6);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (72, '2019-11-25 15:36:53.873+08', '2019-11-25 15:36:53.873+08', 'Destroy', 'destroy', 6);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (73, '2019-11-25 16:59:05.091+08', '2019-11-25 17:46:36.497+08', 'Attach Domain', 'attach_domain', 2);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (74, '2019-11-25 17:26:49.939+08', '2019-11-25 17:26:49.939+08', 'Attach', 'attach', 17);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (76, '2019-12-03 19:13:52.855+08', '2019-12-03 19:13:52.855+08', 'Retrieve', 'retrieve', 1);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (77, '2019-12-13 10:46:53.988+08', '2019-12-13 10:46:53.988+08', 'Assign Child', 'assign_child', 6);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (78, '2019-12-20 10:32:23.12+08', '2019-12-20 10:32:23.12+08', 'Create', 'create', 18);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (79, '2019-12-20 10:32:35.473+08', '2019-12-20 10:32:35.473+08', 'Retrieve', 'retrieve', 18);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (80, '2019-12-20 10:42:08.83+08', '2019-12-20 10:42:08.83+08', 'Destroy', 'destroy', 19);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (81, '2019-12-20 11:36:37.72+08', '2019-12-20 11:36:37.72+08', 'Retrieve', 'retrieve', 19);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (82, '2019-12-20 11:40:21.518+08', '2019-12-20 11:40:21.518+08', 'Create', 'create', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (83, '2019-12-20 11:40:30.343+08', '2019-12-20 11:40:30.343+08', 'Update', 'update', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (84, '2019-12-20 11:40:40.818+08', '2019-12-20 11:40:40.818+08', 'Destroy', 'destroy', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (85, '2019-12-20 11:48:01.143+08', '2019-12-20 11:48:01.143+08', 'Create', 'create', 20);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (86, '2019-12-20 11:48:20.324+08', '2019-12-20 11:48:20.324+08', 'Retrieve', 'retrieve', 20);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (87, '2019-12-20 11:48:28.751+08', '2019-12-20 11:48:28.751+08', 'Update', 'update', 20);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (88, '2019-12-20 11:48:36.977+08', '2019-12-20 11:48:36.977+08', 'Destroy', 'destroy', 20);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (89, '2019-12-20 12:02:00.642+08', '2019-12-20 12:02:00.642+08', 'Create', 'create', 21);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (90, '2019-12-20 12:02:19.753+08', '2019-12-20 12:02:19.753+08', 'Retrieve', 'retrieve', 21);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (91, '2019-12-20 12:02:29.098+08', '2019-12-20 12:02:29.098+08', 'Update', 'update', 21);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (92, '2019-12-20 12:02:37.244+08', '2019-12-20 12:02:37.244+08', 'Destroy', 'destroy', 21);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (93, '2019-12-20 12:04:50.856+08', '2019-12-20 12:04:50.856+08', 'Create', 'create', 22);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (94, '2019-12-20 12:04:59.124+08', '2019-12-20 12:04:59.124+08', 'Retrieve', 'retrieve', 22);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (95, '2019-12-20 12:54:52.598+08', '2019-12-20 12:54:52.598+08', 'Create', 'create', 23);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (96, '2019-12-20 12:55:02.834+08', '2019-12-20 12:55:02.834+08', 'Retrieve', 'retrieve', 23);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (97, '2019-12-20 13:00:30.594+08', '2019-12-20 13:00:30.594+08', 'Create', 'create', 24);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (98, '2019-12-20 13:00:38.493+08', '2019-12-20 13:00:38.493+08', 'Retrieve', 'retrieve', 24);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (99, '2019-12-20 13:00:46.225+08', '2019-12-20 13:00:46.225+08', 'Update', 'update', 24);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (100, '2019-12-20 13:00:57.317+08', '2019-12-20 13:00:57.317+08', 'Destroy', 'destroy', 24);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (101, '2019-12-20 13:08:32.098+08', '2019-12-20 13:08:32.098+08', 'Retrieve', 'retrieve', 8);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (102, '2019-12-20 13:08:42.182+08', '2019-12-20 13:08:42.182+08', 'Destroy', 'destroy', 8);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (103, '2019-12-20 13:15:49.038+08', '2019-12-20 13:15:49.038+08', 'Create', 'create', 25);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (104, '2019-12-20 13:16:00.514+08', '2019-12-20 13:16:00.514+08', 'Retrieve', 'retrieve', 25);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (105, '2019-12-20 13:19:35.062+08', '2019-12-20 13:19:35.062+08', 'Create', 'create', 26);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (106, '2019-12-20 13:19:44.131+08', '2019-12-20 13:19:44.131+08', 'Retrieve', 'retrieve', 26);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (107, '2019-12-20 13:19:51.785+08', '2019-12-20 13:19:51.785+08', 'Update', 'update', 26);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (108, '2019-12-20 13:20:01.18+08', '2019-12-20 13:20:01.18+08', 'Destroy', 'destroy', 26);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (109, '2019-12-20 13:24:58.834+08', '2019-12-20 13:24:58.834+08', 'Destroy', 'destroy', 22);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (110, '2019-12-31 10:29:00.955+08', '2019-12-31 10:29:00.955+08', 'Retrieve', 'retrieve', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (111, '2019-12-27 11:24:22.07+08', '2019-12-27 11:24:22.07+08', 'Unclaim', 'unclaim', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (112, '2019-12-27 11:24:37.738+08', '2019-12-27 11:24:37.738+08', 'Meta', 'meta', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (115, '2019-12-31 15:53:59.325+08', '2019-12-31 15:53:59.325+08', 'Update', 'update', 18);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (117, '2019-12-31 16:25:28.081+08', '2020-01-08 16:36:33.797+08', 'Save video', 'save_video', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (119, '2020-01-02 17:00:06.624+08', '2020-01-02 17:00:06.624+08', 'Claim', 'claim', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (121, '2020-01-08 15:44:25.98+08', '2020-01-08 15:44:25.98+08', 'Map Location', 'map_location', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (122, '2020-01-13 15:30:39.962+08', '2020-01-13 15:30:39.962+08', 'Validate Camera', 'validate_camera', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (123, '2020-01-13 15:31:25.432+08', '2020-01-13 15:31:25.432+08', 'Validate Dvr', 'validate_dvr', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (124, '2020-01-13 15:31:57.628+08', '2020-01-13 15:31:57.628+08', 'Search', 'search', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (125, '2020-01-13 18:18:23.026+08', '2020-01-13 18:18:23.026+08', 'Stream', 'stream', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (126, '2020-01-14 12:03:27.869+08', '2020-01-14 12:03:27.869+08', 'React', 'react', 12);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (127, '2020-01-14 12:08:15.17+08', '2020-01-14 12:08:15.17+08', 'Capture Case', 'capture_case', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (128, '2020-01-14 12:09:45.51+08', '2020-01-14 12:09:45.51+08', 'View Robot', 'view_robot', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (129, '2020-01-14 12:10:11.047+08', '2020-01-14 12:10:11.047+08', 'Present To Robot', 'present_to_robot', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (130, '2020-01-14 12:10:28.887+08', '2020-01-14 12:10:28.887+08', 'Investigate', 'investigate', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (131, '2020-01-14 12:10:45.017+08', '2020-01-14 12:10:45.017+08', 'Switch Mode', 'switch_mode', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (132, '2020-01-14 12:10:59.136+08', '2020-01-14 12:10:59.136+08', 'Comm Play', 'comm_play', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (133, '2020-01-14 12:11:10.913+08', '2020-01-14 12:11:10.913+08', 'Move', 'move', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (134, '2020-01-14 12:11:23.795+08', '2020-01-14 12:11:23.796+08', 'Stream', 'stream', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (135, '2020-01-14 12:11:40.678+08', '2020-01-14 12:11:40.678+08', 'Map Upload', 'map_upload', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (136, '2020-01-14 12:11:54.65+08', '2020-01-14 12:11:54.65+08', 'Play Sound', 'play_sound', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (137, '2020-01-14 12:12:07.564+08', '2020-01-14 12:12:07.564+08', 'Setup', 'setup', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (138, '2020-01-14 12:12:24.969+08', '2020-01-14 12:12:24.969+08', 'Search Macs', 'search_macs', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (139, '2020-01-14 12:12:41.999+08', '2020-01-14 12:12:41.999+08', 'Go Home', 'go_home', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (140, '2020-01-14 13:57:10.55+08', '2020-01-14 13:57:10.55+08', 'Leave Home', 'leave_home', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (141, '2020-01-14 13:57:27.483+08', '2020-01-14 13:57:27.483+08', 'Download Map', 'download_map', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (142, '2020-01-14 13:57:44.184+08', '2020-01-14 13:57:44.184+08', 'Reset Slam', 'reset_slam', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (143, '2020-01-14 13:58:02.996+08', '2020-01-14 13:58:02.996+08', 'Micro Move', 'micro_move', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (148, '2020-01-16 19:28:09.803+08', '2020-01-16 19:28:09.803+08', 'Token', 'token', 20);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (151, '2020-01-17 14:23:03.314+08', '2020-01-17 14:23:03.314+08', 'Save Video', 'save_video', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (152, '2020-01-17 15:12:01.67+08', '2020-01-17 15:12:01.67+08', 'Claim', 'claim', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (153, '2020-01-17 15:12:33.07+08', '2020-01-17 15:12:33.07+08', 'Unclaim', 'unclaim', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (154, '2020-01-17 15:13:22.403+08', '2020-01-17 15:13:22.403+08', 'Meta', 'meta', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (155, '2020-01-17 15:13:39.743+08', '2020-01-17 15:13:39.743+08', 'Event Types', 'event_types', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (160, '2020-01-20 15:08:28.077+08', '2020-01-20 15:08:28.077+08', 'Send Activate Email', 'send_activate_email', 8);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (161, '2020-02-03 16:30:54.111+08', '2020-02-03 16:30:54.111+08', 'Retrieve', 'retrieve', 27);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (162, '2020-02-03 16:31:04.617+08', '2020-02-03 16:31:04.617+08', 'Create', 'create', 27);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (163, '2020-02-03 16:31:21.336+08', '2020-02-03 16:31:21.336+08', 'Update', 'update', 27);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (164, '2020-02-03 16:31:36.349+08', '2020-02-03 16:31:36.349+08', 'Destroy', 'destroy', 27);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (165, '2020-02-04 11:01:40.134+08', '2020-02-04 11:01:40.134+08', 'Retrieve', 'retrieve', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (166, '2020-02-04 11:01:51.024+08', '2020-02-04 11:01:51.024+08', 'Create', 'create', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (167, '2020-02-04 11:01:59.997+08', '2020-02-04 11:01:59.997+08', 'Update', 'update', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (168, '2020-02-04 11:02:07.919+08', '2020-02-04 11:02:07.919+08', 'Destroy', 'destroy', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (169, '2020-02-04 11:42:39.514+08', '2020-02-04 11:42:39.514+08', 'Send Activate Email', 'send_activate_email', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (170, '2020-02-04 11:43:05.167+08', '2020-02-04 11:43:05.167+08', 'Verify Phone Number', 'verify_phone_number', 28);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (171, '2020-02-04 14:18:14.948+08', '2020-02-04 14:18:14.948+08', 'Create', 'create', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (172, '2020-02-04 14:18:23.665+08', '2020-02-04 14:18:23.665+08', 'Retrieve', 'retrieve', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (173, '2020-02-04 14:18:31.775+08', '2020-02-04 14:18:31.775+08', 'Update', 'update', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (174, '2020-02-04 14:18:41.489+08', '2020-02-04 14:18:41.489+08', 'Destroy', 'destroy', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (175, '2020-02-04 14:19:39.789+08', '2020-02-04 14:19:39.789+08', 'Send Activate Email', 'send_activate_email', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (176, '2020-02-04 14:19:48.153+08', '2020-02-04 14:19:48.154+08', 'Verify Phone Number', 'verify_phone_number', 29);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (177, '2020-02-05 13:48:52.211+08', '2020-02-05 13:48:52.211+08', 'Create', 'create', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (178, '2020-02-05 13:49:02.995+08', '2020-02-05 13:49:02.995+08', 'Retrieve', 'retrieve', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (179, '2020-02-05 13:49:13.504+08', '2020-02-05 13:49:13.504+08', 'Update', 'update', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (180, '2020-02-05 13:49:23.946+08', '2020-02-05 13:49:23.946+08', 'Destroy', 'destroy', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (181, '2020-02-05 13:49:36.24+08', '2020-02-05 13:49:36.24+08', 'Send Activate Email', 'send_activate_email', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (182, '2020-02-05 13:49:44.607+08', '2020-02-05 13:49:44.607+08', 'Verify Phone Number', 'verify_phone_number', 30);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (183, '2020-02-26 17:06:10.254+08', '2020-02-26 17:06:10.254+08', 'Create', 'create', 31);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (184, '2020-02-26 17:06:21.225+08', '2020-02-26 17:06:21.225+08', 'Retrieve', 'retrieve', 31);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (185, '2020-02-26 17:06:29.281+08', '2020-02-26 17:06:29.281+08', 'Update', 'update', 31);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (186, '2020-02-26 17:06:40.402+08', '2020-02-26 17:06:40.402+08', 'Destroy', 'destroy', 31);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (187, '2020-02-27 15:37:24.779+08', '2020-02-27 15:37:24.779+08', 'Create', 'create', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (188, '2020-02-27 15:37:34.202+08', '2020-02-27 15:37:34.202+08', 'Retrieve', 'retrieve', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (189, '2020-02-27 15:37:45.206+08', '2020-02-27 15:37:45.206+08', 'Update', 'update', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (190, '2020-02-27 15:37:54.67+08', '2020-02-27 15:37:54.67+08', 'Destroy', 'destroy', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (191, '2020-02-28 11:05:18.951+08', '2020-02-28 11:05:18.951+08', 'Create', 'create', 33);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (192, '2020-02-28 11:05:32.027+08', '2020-02-28 11:05:32.027+08', 'Retrieve', 'retrieve', 33);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (193, '2020-02-28 11:05:43.609+08', '2020-02-28 11:05:43.609+08', 'Update', 'update', 33);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (194, '2020-02-28 11:05:54.481+08', '2020-02-28 11:05:54.481+08', 'Destroy', 'destroy', 33);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (195, '2020-03-04 11:30:18.611+08', '2020-03-04 11:30:18.611+08', 'Add Target', 'add_target', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (196, '2020-03-04 11:30:37.394+08', '2020-03-04 11:30:37.394+08', 'Remove Target', 'remove_target', 32);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (197, '2020-03-04 14:10:33.585+08', '2020-03-04 14:10:33.585+08', 'Add Map', 'add_map', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (198, '2020-03-04 14:10:48.563+08', '2020-03-04 14:10:48.564+08', 'Remove Map', 'remove_map', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (199, '2020-03-04 15:00:45.209+08', '2020-03-04 15:00:45.209+08', 'Set Map', 'set_map', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (200, '2020-03-04 15:01:00.836+08', '2020-03-04 15:01:00.836+08', 'Unset Map', 'unset_map', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (201, '2020-03-04 15:16:04.227+08', '2020-03-04 15:16:04.227+08', 'Systemctl Restart', 'systemctl_restart', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (202, '2020-03-06 14:39:15.002+08', '2020-03-06 14:39:15.002+08', 'Lift Callback', 'lift_callback', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (203, '2020-03-06 14:50:31.822+08', '2020-03-06 14:50:31.823+08', 'Take Elevator', 'take_elevator', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (204, '2020-03-06 15:06:26.743+08', '2020-03-06 15:06:26.743+08', 'Use Map And Route', 'use_map_and_route', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (205, '2020-03-07 13:22:41.256+08', '2020-03-07 13:22:41.256+08', 'Start Routine', 'start_routine', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (206, '2020-03-25 10:45:11.782+08', '2020-03-25 10:45:11.782+08', 'Add Target', 'add_target', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (207, '2020-03-25 10:45:24.226+08', '2020-03-25 10:45:24.226+08', 'Add Target', 'add_target', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (208, '2020-03-25 10:45:42.671+08', '2020-03-25 10:45:42.671+08', 'Add Target', 'add_target', 4);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (209, '2020-03-25 10:45:59.383+08', '2020-03-25 10:45:59.383+08', 'Add Target', 'add_target', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (210, '2020-04-07 15:46:16.697+08', '2020-04-07 15:46:16.697+08', 'Retrieve', 'retrieve', 34);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (211, '2020-04-07 15:46:39.68+08', '2020-04-07 15:46:39.68+08', 'Update', 'update', 34);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (212, '2020-04-07 15:55:31.807+08', '2020-04-07 15:55:31.807+08', 'Retrieve', 'retrieve', 35);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (213, '2020-04-07 16:03:05.797+08', '2020-04-07 16:03:05.797+08', 'Update', 'update', 35);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (214, '2020-04-03 13:22:41.256+08', '2020-04-03 13:22:41.256+08', 'Resume Routine', 'resume_routine', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (215, '2020-04-21 15:58:30.716+08', '2020-04-21 15:58:30.716+08', 'Get Camera Config', 'get_camera_config', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (216, '2020-04-21 15:58:52.5+08', '2020-04-21 15:58:52.5+08', 'Set Camera Config', 'set_camera_config', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (217, '2020-04-30 09:23:49.387+08', '2020-04-30 09:23:49.387+08', 'Retrieve', 'retrieve', 37);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (218, '2020-05-14 14:57:49.084+08', '2020-05-14 14:57:49.084+08', 'Create', 'create', 38);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (219, '2020-05-14 14:57:59.132+08', '2020-05-14 14:57:59.132+08', 'Retrieve', 'retrieve', 38);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (220, '2020-05-18 18:10:57.974+08', '2020-05-18 18:10:57.974+08', 'Update', 'update', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (221, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Create', 'create', 39);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (222, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Retrieve', 'retrieve', 39);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (223, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Update', 'update', 39);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (224, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Destroy', 'destroy', 39);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (225, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Create', 'create', 40);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (226, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Retrieve', 'retrieve', 40);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (227, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Update', 'update', 40);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (228, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Destroy', 'destroy', 40);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (229, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Create', 'create', 41);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (230, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Retrieve', 'retrieve', 41);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (231, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Update', 'update', 41);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (232, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Destroy', 'destroy', 41);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (233, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Create', 'create', 42);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (234, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Retrieve', 'retrieve', 42);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (235, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Update', 'update', 42);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (236, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Destroy', 'destroy', 42);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (237, '2020-07-06 18:21:56.243+08', '2020-07-06 18:21:56.243+08', 'Configure Email Sms', 'configure_email_sms', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (238, '2020-07-06 18:22:14.051+08', '2020-07-06 18:22:14.051+08', 'Configure Email Sms', 'configure_email_sms', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (239, '2020-07-06 18:22:25.894+08', '2020-07-06 18:22:25.894+08', 'Configure Email Sms', 'configure_email_sms', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (240, '2020-07-24 17:30:45.982+08', '2020-07-24 17:30:45.982+08', 'Retrieve', 'retrieve', 43);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (241, '2020-08-03 18:27:56.035+08', '2020-08-03 18:27:56.035+08', 'Create', 'create', 43);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (242, '2020-08-03 18:28:09.415+08', '2020-08-03 18:28:09.415+08', 'Update', 'update', 43);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (243, '2020-08-03 18:28:19.018+08', '2020-08-03 18:28:19.018+08', 'Destroy', 'destroy', 43);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (244, '2020-08-03 18:28:55.745+08', '2020-08-03 18:28:55.745+08', 'Create', 'create', 44);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (245, '2020-08-03 18:29:04.94+08', '2020-08-03 18:29:04.94+08', 'Retrieve', 'retrieve', 44);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (246, '2020-08-03 18:29:15.01+08', '2020-08-03 18:29:15.01+08', 'Update', 'update', 44);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (247, '2020-08-03 18:29:25.813+08', '2020-08-03 18:29:25.813+08', 'Destroy', 'destroy', 44);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (248, '2020-08-04 10:02:26.091+08', '2020-08-04 10:02:26.091+08', 'Create Building', 'create_building', 7);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (249, '2020-08-04 10:02:42.92+08', '2020-08-04 10:02:42.92+08', 'Create Floor', 'create_floor', 44);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (250, '2020-08-25 18:58:30.716+08', '2020-08-25 18:58:30.716+08', 'Get Upload Config', 'get_upload_config', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (251, '2020-08-25 18:58:52.5+08', '2020-08-25 18:58:52.5+08', 'Set Upload Config', 'set_upload_config', 10);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (252, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Update Group', 'update_group', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (253, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'All Group', 'all_groups', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (254, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Retrieve Group', 'retrieve_group', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (255, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Create Face Group', 'create_face_group', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (256, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Delete Face Group', 'delete_face_group', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (257, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Delete Group', 'delete_group', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (258, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'All Groups', 'all_groups', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (259, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Create TrackingObject', 'create_tracking_object', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (260, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Update Tracking Object', 'update_tracking_object', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (261, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Retrieve Tracking Object', 'retrieve_tracking_object', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (262, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Enable Tracking Object', 'enable_tracking_object', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (263, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Merge Tracking Object', 'merge_tracking_object', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (264, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Add Face To Tracking Object', 'add_face_to_tracking_object', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (265, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Detach Tracking Object From Group', 'detach_tracking_object_from_group', 45);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (266, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Update Employee', 'update_employee', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (267, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Create Employee', 'create_employee', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (268, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'List Employee', 'list_employee', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (269, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Get Token', 'get_token', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (270, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Add Face', 'add_face', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (271, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'List Faces', 'list_faces', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (272, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Remove Faces', 'remove_faces', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (273, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Set Main Face', 'set_main_face', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (274, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Delete Employee', 'delete_employee', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (275, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Detach Group', 'detach_group', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (276, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Attach Group', 'attach_group', 47);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (277, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Create Employee', 'create_employee', 3);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (278, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Retrieve', 'retrieve', 48);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (279, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'All', 'all', 48);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (280, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Create', 'create', 48);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (281, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Destroy', 'destroy', 48);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (283, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Resend Activate Email', 'resend_activate_email', 48);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (284, '2020-10-12 09:00:00+08', '2020-10-12 09:00:00+08', 'Reboot', 'reboot', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (285, '2020-10-20 09:00:00+08', '2020-10-20 09:00:00+08', 'Upload File To Camera', 'upload_file', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (286, '2020-11-23 10:26:29.336+08', '2020-11-23 10:26:29.336+08', 'Systemctl Stop', 'systemctl_stop', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (287, '2020-11-23 10:27:02.2+08', '2020-11-23 10:27:02.2+08', 'Systemctl Start', 'systemctl_start', 11);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (288, '2020-12-31 14:20:52.5+08', '2020-12-31 14:20:52.5+08', 'Get Camera Timezone', 'get_camera_timezone', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (289, '2020-12-31 14:20:52.5+08', '2020-12-31 14:20:52.5+08', 'Set Camera Timezone', 'set_camera_timezone', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (290, '2021-05-17 14:20:52.5+08', '2021-05-17 14:20:52.5+08', 'Get Camera Background', 'get_camera_background', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (291, '2021-05-17 14:20:52.5+08', '2021-05-17 14:20:52.5+08', 'Set Camera Background', 'set_camera_background', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (292, '2021-05-17 14:20:52.5+08', '2021-05-17 14:20:52.5+08', 'Set Batch Camera Background', 'set_batch_camera_background', 9);
INSERT INTO public.perm_action (id, created_at, updated_at, name, code_name, resource_type_id) VALUES (293, '2021-05-17 14:20:52.5+08', '2021-05-17 14:20:52.5+08', 'Check Camera Background Hash', 'check_camera_background_hash', 9);


--
-- Data for Name: perm_resourcetype; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (1, '2019-10-09 17:30:03.278+08', '2019-10-31 14:00:11.793+08', 'Role', 'perm.role', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (2, '2019-10-09 17:50:54.671+08', '2019-10-31 14:00:08.572+08', 'User', 'auth.user', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (3, '2019-10-10 17:46:13.306+08', '2019-10-31 14:00:04.139+08', 'Organization', 'logic.organization', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (4, '2019-10-10 17:46:37.166+08', '2019-10-31 13:59:55.229+08', 'Domain', 'org.domain', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (5, '2019-10-10 19:47:10.831+08', '2019-10-31 13:59:51.522+08', 'Domain User', 'org.domainuser', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (6, '2019-10-15 11:37:43.833+08', '2019-10-31 13:59:47.022+08', 'User Node', 'org.usernode', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (7, '2019-10-24 15:55:35.076+08', '2019-10-24 15:55:35.076+08', 'Site', 'logic.site', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (8, '2019-10-29 12:06:33.643+08', '2019-10-31 13:59:41.006+08', 'Site Manager', 'logic.sitemanager', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (9, '2019-10-30 17:55:46.055+08', '2019-10-30 17:55:46.055+08', 'Camera', 'logic.camera', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (10, '2019-10-30 19:20:12.182+08', '2019-10-30 19:20:12.182+08', 'Box', 'logic.box', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (11, '2019-10-30 19:41:39.674+08', '2019-10-30 19:41:39.674+08', 'Robot', 'logic.robot', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (12, '2019-10-31 13:59:13.963+08', '2019-10-31 13:59:13.963+08', 'Event', 'logic.event', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (13, '2019-10-31 13:59:27.855+08', '2019-10-31 13:59:27.855+08', 'Case', 'guard.case', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (14, '2019-10-31 15:21:57.349+08', '2019-10-31 15:21:57.349+08', 'Camera Video', 'logic.cameravideo', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (15, '2019-10-31 16:46:51.592+08', '2019-10-31 16:46:51.592+08', 'Robot Video', 'logic.robotvideo', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (16, '2019-11-14 19:39:58.314+08', '2019-11-14 19:39:58.314+08', 'Domain Site', 'org.domainsite', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (17, '2019-11-21 15:30:57.089+08', '2019-11-21 15:30:57.089+08', 'Domain Type', 'org.domaintype', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (18, '2019-12-20 10:31:44.292+08', '2019-12-20 10:31:44.292+08', 'Camera Lication', 'logic.cameralocation', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (19, '2019-12-20 10:39:01.767+08', '2019-12-20 10:39:01.767+08', 'Camera Saved Video', 'logic.camerasavedvideo', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (20, '2019-12-20 11:47:44.032+08', '2019-12-20 11:47:44.033+08', 'Inspection', 'logic.inspection', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (21, '2019-12-20 12:00:53.714+08', '2019-12-20 12:00:53.715+08', 'Patrol', 'logic.patrol', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (22, '2019-12-20 12:04:36.51+08', '2019-12-20 12:04:36.51+08', 'Robot Saved Video', 'logic.robotsavedvideo', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (23, '2019-12-20 12:54:27.786+08', '2019-12-20 12:54:27.786+08', 'Robot Snap', 'logic.robotsnap', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (24, '2019-12-20 12:59:38.681+08', '2019-12-20 12:59:38.681+08', 'Route', 'logic.route', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (25, '2019-12-20 13:15:25.041+08', '2019-12-20 13:15:25.041+08', 'Snap', 'logic.snap', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (26, '2019-12-20 13:19:21.627+08', '2019-12-20 13:19:21.627+08', 'Way Point', 'logic.waypoint', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (27, '2020-02-03 16:29:50.154+08', '2020-02-03 16:29:50.154+08', 'Guard Company', 'guard.guardcompany', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (28, '2020-02-04 10:59:29.801+08', '2020-02-04 10:59:29.801+08', 'Guard Admin', 'guard.guardadmin', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (29, '2020-02-04 14:17:51.814+08', '2020-02-04 14:17:51.814+08', 'Monitoring Operator', 'guard.monitoringoperator', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (30, '2020-02-05 13:44:26.731+08', '2020-02-05 13:44:26.731+08', 'Guard', 'guard.guard', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (31, '2020-02-26 17:05:04.274+08', '2020-02-26 17:05:04.274+08', 'Map Config', 'mapping.mapconfig', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (32, '2020-02-27 15:30:55.005+08', '2020-02-27 15:30:55.005+08', 'Map', 'mapping.map', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (33, '2020-02-28 11:04:55.712+08', '2020-02-28 11:04:55.712+08', 'Target', 'mapping.target', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (34, '2020-04-07 15:45:36.107+08', '2020-04-07 15:45:36.107+08', 'rawevent', 'ccs.rawevent', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (35, '2020-04-07 15:55:00.888+08', '2020-04-07 15:55:00.888+08', 'Sample', 'ccs.sample', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (36, '2020-04-29 15:31:44.47+08', '2020-04-29 15:31:44.47+08', 'Site Map', 'mapping.sitemap', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (37, '2020-04-30 09:22:44.569+08', '2020-04-30 09:22:44.569+08', 'Case History', 'guard.casehistory', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (38, '2020-05-14 14:57:25.759+08', '2020-05-14 14:57:25.759+08', 'Manual Cleanup Task', 'logic.manualcleanuptask', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (39, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Patrol Target', 'patrol.target', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (40, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Patrol Algo Config', 'patrol.algoconfig', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (41, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Patrol Algo Reference', 'patrol.algoreference', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (42, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'Patrol Detection Task', 'patrol.detectiontask', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (43, '2020-07-24 17:29:58.107+08', '2020-07-24 17:30:31.284+08', 'Patrol Floor', 'patrol.floor', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (44, '2020-07-24 17:39:11.713+08', '2020-07-24 17:39:11.713+08', 'Patrol Building', 'patrol.building', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (45, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Group', 'face.group', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (46, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Tracking Object', 'face.trackingobject', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (47, '2020-09-15 08:00:00+08', '2020-09-15 08:00:00+08', 'Employee', 'time_keeping.employee', '');
INSERT INTO public.perm_resourcetype (id, created_at, updated_at, name, code_name, comment) VALUES (48, '2019-10-29 12:06:33.643+08', '2019-10-31 13:59:41.006+08', 'Department Manager', 'logic.departmentmanager', '');


--
-- Data for Name: perm_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (1, '2019-10-09 17:24:33.396+08', '2020-02-13 10:59:04.661+08', 'Monitoring Operator', 'monitoring_operator');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (2, '2019-10-09 17:24:59.649+08', '2020-03-24 14:06:06.73+08', 'Site Manager', 'site_manager');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (4, '2019-10-15 10:11:25.72+08', '2020-02-13 10:59:00.622+08', 'Guard', 'guard');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (5, '2019-10-28 19:52:10.493+08', '2020-03-24 14:06:00.899+08', 'Customer', 'customer');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (11, '2019-10-31 12:11:05.262+08', '2020-03-24 14:05:56.505+08', 'Guard Admin', 'guard_admin');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (12, '2019-12-31 10:27:06.77+08', '2019-12-31 10:27:06.77+08', 'Default', 'default');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (13, '2020-04-07 16:26:31.822+08', '2020-04-07 16:26:31.822+08', 'Inspector', 'inspector');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (14, '2020-04-29 14:49:30.523+08', '2020-04-29 14:49:30.523+08', 'Normal User', 'normal_user');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (15, '2020-09-04 14:29:21.275+08', '2020-09-04 14:29:21.275+08', 'Business Admin', 'business_admin');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (16, '2020-09-14 08:00:00+08', '2020-09-14 08:00:00+08', 'Department Manager', 'department_manager');
INSERT INTO public.perm_role (id, created_at, updated_at, name, code_name) VALUES (17, '2020-11-23 09:35:49.546+08', '2020-11-23 09:35:49.546+08', 'Viewer', 'viewer');


--
-- Data for Name: perm_role_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (1, 2, 3);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (2, 5, 1);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (3, 5, 2);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (4, 11, 4);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (5, 11, 5);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (6, 4, 6);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (8, 1, 7);
INSERT INTO public.perm_role_users (id, role_id, user_id) VALUES (9, 13, 2);


--
-- Data for Name: perm_rolepolicy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (27, '2019-10-31 14:44:52.159+08', '2020-08-25 19:28:50.21+08', 'logic.box/Q(user_id={user_id})', '', '{retrieve,update,claim,unclaim,meta,validate_camera,validate_dvr,search,configure_email_sms,get_upload_config,set_upload_config}', '', 10, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (28, '2019-10-31 14:52:55.088+08', '2020-08-25 20:00:00.068+08', 'logic.box/Q(site__managements__site_manager={user_id})', '', '{retrieve,update,meta,get_upload_config,set_upload_config}', '', 10, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (29, '2019-10-31 15:07:46.524+08', '2020-04-21 15:58:52.5+08', 'logic.camera/Q(user_id={user_id})', '', '{create,retrieve,update,destroy,map_location,save_video,stream,capture_case,add_target,reboot,get_camera_config,set_camera_config,configure_email_sms,upload_file,get_camera_timezone,set_camera_timezone}', '', 9, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (30, '2019-10-31 15:09:51.34+08', '2020-04-21 15:58:52.5+08', 'logic.camera/Q(box__site__managements__site_manager={user_id})', '', '{retrieve,stream,capture_case,add_target,reboot,get_camera_config,set_camera_config,upload_file,get_camera_timezone,set_camera_timezone}', '', 9, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (31, '2019-10-31 15:11:58.177+08', '2020-04-21 15:58:52.5+08', 'logic.camera/Q(user_id__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve,stream,map_location,capture_case,reboot,get_camera_config,set_camera_config,upload_file,get_camera_timezone,set_camera_timezone}', '', 9, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (32, '2019-10-31 15:46:31.548+08', '2020-01-20 14:31:37.337+08', 'logic.cameravideo/Q(camera__user_id={user_id})', '', '{retrieve}', '', 14, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (33, '2019-10-31 15:48:16.539+08', '2020-01-16 17:39:41.324+08', 'logic.cameravideo/Q(camera__box__site__managements__site_manager={user_id})', '', '{retrieve}', '', 14, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (34, '2019-10-31 15:49:57.585+08', '2020-01-16 17:39:35.437+08', 'logic.cameravideo/Q(camera__user__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 14, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (35, '2019-10-31 16:41:21.719+08', '2020-03-25 10:50:37.027+08', 'logic.robot/Q(user_id={user_id})', '', '{retrieve,update,claim,unclaim,meta,event_types,save_video,view_robot,present_to_robot,investigate,switch_mode,comm_play,move,stream,map_upload,play_sound,setup,search_macs,go_home,leave_home,download_map,reset_slam,micro_move,lift_callback,take_elevator,use_map_and_route,start_routine,resume_routine,add_target}', '', 11, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (36, '2019-10-31 16:42:41.2+08', '2020-03-25 10:50:45.56+08', 'logic.robot/Q(site__managements__site_manager_id={user_id})', '', '{retrieve,meta,event_types,view_robot,present_to_robot,investigate,switch_mode,comm_play,move,stream,map_upload,play_sound,setup,search_macs,go_home,leave_home,download_map,reset_slam,micro_move,lift_callback,take_elevator,use_map_and_route,start_routine,resume_routine,add_target}', '', 11, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (37, '2019-10-31 16:44:59.102+08', '2020-03-07 13:24:09.844+08', 'logic.robot/Q(user_id__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve,meta,event_types,view_robot,present_to_robot,investigate,switch_mode,comm_play,move,stream,map_upload,play_sound,setup,search_macs,go_home,leave_home,download_map,reset_slam,micro_move,lift_callback,take_elevator,use_map_and_route,start_routine,resume_routine}', '', 11, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (38, '2019-10-31 16:52:59.043+08', '2020-01-17 14:19:31.745+08', 'logic.robotvideo/Q(robot__user_id={user_id})', '', '{retrieve}', '', 15, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (39, '2019-10-31 16:54:00.25+08', '2020-01-17 14:05:04.68+08', 'logic.robotvideo/Q(robot__site__managements__site_manager_id={user_id})', '', '{retrieve}', '', 15, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (40, '2019-10-31 16:55:07.825+08', '2019-11-21 17:05:07.536+08', 'logic.robotvideo/Q(robot__user__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 15, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (56, '2019-11-29 16:50:19.186+08', '2020-03-16 14:52:43.148+08', 'org.domaintype/Q(organization__owner={user_id})', '', '{create,retrieve,update,destroy,attach}', '', 17, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (57, '2019-12-02 14:14:33.504+08', '2020-03-25 10:51:13.538+08', 'org.domain/Q(organization__owner_id={user_id})', '', '{create,retrieve,update,destroy,assign_child,attach_user,set_map,unset_map,add_target}', '', 4, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (59, '2019-12-03 15:37:10.659+08', '2019-12-04 12:02:11.579+08', 'perm.role', '', '{attach_user,retrieve}', '', 1, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (60, '2019-12-03 18:01:34.607+08', '2019-12-24 16:53:16.776+08', 'org.usernode/Q(user_id={user_id})/get_descendants(True)', '', '{create,update,destroy}', '', 6, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (61, '2019-12-04 11:48:58.587+08', '2020-04-10 11:36:56.223+08', 'org.usernode/Q(user__organization_user__organization__owner_id={user_id})', '', '{retrieve}', '', 6, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (62, '2019-12-04 16:35:57.341+08', '2020-08-04 10:03:18.975+08', 'logic.site/Q(customer_id={user_id})', '', '{create,retrieve,update,destroy,managements,add_map,remove_map,add_target,configure_email_sms,create_building}', '', 7, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (63, '2019-12-12 19:28:35.811+08', '2019-12-12 19:28:35.811+08', 'auth.user', '', '{attach_domain}', '', 2, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (64, '2019-12-13 11:01:16.241+08', '2019-12-20 17:30:45.228+08', 'org.usernode/Q(user_id={user_id})/get_descendants(True)', '', '{assign_child}', '', 6, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (67, '2019-12-20 10:06:43.582+08', '2020-08-04 10:03:28.498+08', 'logic.site/Q(managements__site_manager_id={user_id})', '', '{retrieve,update,managements,add_map,remove_map,add_target,create_building}', '', 7, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (68, '2019-12-20 10:07:48.351+08', '2019-12-26 18:22:50.187+08', 'logic.site/Q(customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 7, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (69, '2019-12-20 10:11:52.251+08', '2020-01-02 17:01:30.544+08', 'logic.box/Q(user_id__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve,meta}', '', 10, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (70, '2019-12-20 10:36:10.744+08', '2020-01-16 17:32:14.032+08', 'logic.cameralocation/Q(camera__user_id={user_id})', '', '{create,retrieve}', '', 18, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (71, '2019-12-20 11:37:11.837+08', '2019-12-20 11:37:11.837+08', 'logic.camerasavedvideo/Q(camera__user={user_id})', '', '{retrieve,destroy}', '', 19, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (73, '2019-12-20 11:46:48.249+08', '2020-01-16 15:25:41.167+08', 'logic.event/Q(robot__user={user_id})|Q(camera__user={user_id})', '', '{retrieve,update,destroy,react}', '', 12, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (74, '2019-12-20 11:50:42.113+08', '2020-01-20 15:23:30.205+08', 'logic.inspection/Q(robot__user={user_id})', '', '{create,retrieve,update,token}', '', 20, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (75, '2019-12-20 12:03:22.201+08', '2020-01-17 11:51:46.081+08', 'logic.patrol/Q(robot__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 21, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (76, '2019-12-20 12:53:32.492+08', '2019-12-20 13:25:13.598+08', 'logic.robotsavedvideo/Q(robot__user={user_id})', '', '{retrieve,destroy}', '', 22, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (77, '2019-12-20 12:55:38.352+08', '2020-01-16 17:42:21.532+08', 'logic.robotsnap/Q(robot__user={user_id})', '', '{retrieve}', '', 23, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (78, '2019-12-20 13:01:47.239+08', '2019-12-20 13:01:47.24+08', 'logic.route/Q(user={user_id})', '', '{create,retrieve,update,destroy}', '', 24, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (79, '2019-12-20 13:13:16.475+08', '2020-01-20 15:10:23.153+08', 'logic.sitemanager/Q(customer={user_id})', '', '{create,retrieve,destroy,send_activate_email}', '', 8, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (80, '2019-12-20 13:17:57.113+08', '2020-01-16 17:42:32.937+08', 'logic.snap/Q(camera__user={user_id})', '', '{retrieve}', '', 25, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (81, '2019-12-20 13:20:20.547+08', '2019-12-20 13:20:20.547+08', 'logic.waypoint', '', '{create,retrieve,update,destroy}', '', 26, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (83, '2019-12-31 10:29:33.216+08', '2020-01-16 15:28:45.99+08', 'logic.organization/Q(organization_users__user_id={user_id})|Q(organization_delegates__user_id={user_id})', '', '{retrieve}', '', 3, 12);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (84, '2019-12-31 15:58:00.21+08', '2020-01-16 17:34:46.616+08', 'logic.cameralocation/Q(camera__user__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{create,retrieve}', '', 18, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (89, '2020-01-20 15:25:24.978+08', '2020-01-20 15:25:24.978+08', 'logic.inspection/Q(robot__user__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 20, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (90, '2020-01-20 15:26:24.454+08', '2020-01-20 15:26:24.454+08', 'logic.inspection/Q(robot__site__managements__site_manager_id={user_id})', '', '{create,retrieve,update,token}', '', 20, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (91, '2020-01-21 09:46:40.845+08', '2020-01-21 09:46:40.845+08', 'logic.sitemanager/Q(user={user_id})', '', '{retrieve}', '', 8, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (94, '2020-02-04 11:44:38.744+08', '2020-02-04 11:44:38.744+08', 'guard.guardadmin/Q(user_id={user_id})', '', '{retrieve,update,verify_phone_number}', '', 28, 11);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (95, '2020-02-04 14:20:31.904+08', '2020-02-04 17:31:49.89+08', 'guard.monitoringoperator/Q(organization__guard_admin_org__user_id={user_id})', '', '{create,retrieve,destroy,send_activate_email}', '', 29, 11);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (96, '2020-02-04 14:53:31.154+08', '2020-02-04 14:53:31.154+08', 'guard.monitoringoperator/Q(user_id={user_id})', '', '{retrieve,update,verify_phone_number}', '', 29, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (98, '2020-02-05 14:18:47.68+08', '2020-02-05 14:37:33.808+08', 'guard.guard/Q(organization__guard_admin_org={user_id})', '', '{create,retrieve,destroy,send_activate_email}', '', 30, 11);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (99, '2020-02-05 14:35:33.441+08', '2020-02-10 10:12:43.21+08', 'guard.guard/Q(organization__monitoring_operator_org={user_id})', '', '{create,retrieve,destroy,send_activate_email}', '', 30, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (100, '2020-02-05 14:47:40.216+08', '2020-02-05 14:47:40.216+08', 'guard.guard/Q(user_id={user_id})', '', '{retrieve,update,verify_phone_number}', '', 30, 4);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (101, '2020-02-26 17:07:18.578+08', '2020-03-24 14:05:24.348+08', 'mapping.mapconfig/Q(organization__owner_id={user_id})', '', '{create,retrieve,update,destroy}', '', 31, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (102, '2020-02-27 15:38:37.247+08', '2020-03-24 14:04:35.896+08', 'mapping.map/Q(map_config__organization__owner_id={user_id})', '', '{create,retrieve,update,destroy,add_target,remove_target}', '', 32, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (103, '2020-02-28 11:06:16.382+08', '2020-03-09 16:00:40.272+08', 'mapping.target/Q(domain__organization__owner__id={user_id})|Q(site__customer__user__id={user_id})|Q(camera__user_id={user_id})|Q(robot__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 33, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (104, '2020-03-09 15:19:10.081+08', '2020-03-09 15:19:10.081+08', 'mapping.mapconfig/Q(organization__owner__customer__managers__user_id={user_id})', '', '{retrieve}', '', 31, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (105, '2020-03-09 15:35:02.983+08', '2020-03-09 16:17:43.543+08', 'mapping.map/Q(site_maps__site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy,add_target,remove_target}', '', 32, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (106, '2020-03-09 16:06:59.15+08', '2020-03-09 16:08:41.408+08', 'mapping.target/Q(site__managements__site_manager__user_id={user_id})|Q(camera__box__site__managements__site_manager__user_id={user_id})|Q(robot__site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 33, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (107, '2020-04-03 18:05:01.811+08', '2020-05-03 12:11:59.418+08', 'guard.case/Q(customer_id={user_id})', '', '{create,retrieve,update,destroy}', '', 13, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (108, '2020-04-03 18:06:43.414+08', '2020-04-03 18:07:14.871+08', 'guard.case/Q(inspection__robot__site__managements__site_manager__user_id={user_id})|Q(event__site__managements__site_manager__user_id={user_id})', '', '{retrieve,update}', '', 13, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (109, '2020-04-03 18:21:33.49+08', '2020-04-29 15:35:19.075+08', 'guard.case/Q(operator_id={user_id})', '', '{retrieve,update}', '', 13, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (110, '2020-04-09 14:07:48.381+08', '2020-04-09 14:07:48.381+08', 'ccs.rawevent/Q(site__user_sites__user_id={user_id})', '', '{retrieve,update}', '', 34, 13);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (111, '2020-04-09 14:08:31.483+08', '2020-04-09 14:08:31.483+08', 'ccs.sample/Q(camera__box__site__user_sites__user_id={user_id})', '', '{retrieve,update}', '', 35, 13);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (112, '2020-04-29 15:25:34.171+08', '2020-04-29 15:25:34.171+08', 'org.domain/Q(domain_users__user_id={user_id})/get_ancestors()', '', '{retrieve}', '', 4, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (113, '2020-04-29 15:25:58.902+08', '2020-04-29 15:25:58.902+08', 'org.usernode/Q(user_id={user_id})', '', '{retrieve}', '', 6, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (114, '2020-04-29 15:26:45.571+08', '2020-04-29 15:26:45.571+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)', '', '{retrieve}', '', 4, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (115, '2020-04-29 15:27:40.726+08', '2020-04-29 15:27:40.726+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site', '', '{retrieve}', '', 7, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (116, '2020-04-29 15:28:07.229+08', '2020-04-29 15:28:07.229+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.box', '', '{retrieve}', '', 10, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (117, '2020-04-29 15:28:31.926+08', '2020-04-29 15:28:31.926+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.box::box:logic.camera', '', '{retrieve,stream,capture_case}', '', 9, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (118, '2020-04-29 15:29:15.359+08', '2020-04-29 15:29:15.359+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.event::event:guard.case', '', '{retrieve,update}', '', 13, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (119, '2020-04-29 15:30:12.911+08', '2020-04-29 15:30:12.911+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domain:mapping.map', '', '{retrieve}', '', 32, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (120, '2020-04-29 15:31:59.004+08', '2020-04-29 15:31:59.004+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:mapping.sitemap::site_maps:mapping.map', '', '{retrieve}', '', 32, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (121, '2020-04-29 15:36:05.322+08', '2020-04-29 15:36:05.322+08', 'guard.case/Q(guard_id={user_id})', '', '{retrieve,update}', '', 13, 4);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (122, '2020-04-30 09:23:55.216+08', '2020-04-30 09:23:55.216+08', 'guard.casehistory/Q(case__guard_id={user_id})', '', '{retrieve}', '', 37, 4);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (123, '2020-04-30 09:24:52.694+08', '2020-04-30 09:24:52.694+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.event::event:guard.case::case:guard.casehistory', '', '{retrieve}', '', 37, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (124, '2020-04-30 09:25:27.224+08', '2020-04-30 09:25:27.224+08', 'guard.casehistory/Q(case__operator_id={user_id})', '', '{retrieve}', '', 37, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (125, '2020-04-30 09:26:27.344+08', '2020-04-30 09:26:27.344+08', 'guard.casehistory/Q(case__inspection__robot__site__managements__site_manager__user_id={user_id})|Q(case__event__site__managements__site_manager__user_id={user_id})', '', '{retrieve}', '', 37, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (126, '2020-04-30 09:27:03.202+08', '2020-04-30 09:27:03.202+08', 'guard.casehistory/Q(case__customer_id={user_id})', '', '{retrieve}', '', 37, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (127, '2020-05-14 14:59:41.714+08', '2020-05-14 14:59:41.714+08', 'logic.manualcleanuptask/Q(organization__owner_id={user_id})', '', '{create,retrieve}', '', 38, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (128, '2020-05-18 13:26:43.185+08', '2020-05-18 13:26:43.185+08', 'logic.site/Q(user_sites__user_id={user_id})', '', '{retrieve}', '', 7, 13);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (129, '2020-05-18 13:28:12.029+08', '2020-05-18 13:28:12.029+08', 'logic.camera/Q(box__site__user_sites__user_id={user_id})', '', '{retrieve}', '', 9, 13);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (130, '2020-05-18 18:11:02.089+08', '2020-05-18 18:11:02.089+08', 'logic.organization/Q(owner_id={user_id})', '', '{update}', '', 3, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (131, '2020-05-19 09:33:42.334+08', '2020-05-19 09:33:42.334+08', 'auth.user/Q(id={user_id})', '', '{update}', '', 2, 12);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (132, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.target/Q(site__customer__user__id={user_id})', '', '{create,retrieve,update,destroy}', '', 39, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (133, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.target/Q(site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 39, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (134, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.algoconfig/Q(target__site__customer__user__id={user_id})', '', '{create,retrieve,update,destroy}', '', 40, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (135, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.algoconfig/Q(target__site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 40, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (136, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.algoreference/Q(algo_config__target__site__customer__user__id={user_id})', '', '{create,retrieve,update,destroy}', '', 41, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (137, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.algoreference/Q(algo_config__target__site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 41, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (138, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.detectiontask/Q(target__site__customer__user__id={user_id})', '', '{create,retrieve,update,destroy}', '', 42, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (139, '2020-06-03 22:00:00+08', '2020-06-03 22:00:00+08', 'patrol.detectiontask/Q(target__site__managements__site_manager__user_id={user_id})', '', '{create,retrieve,update,destroy}', '', 42, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (140, '2020-07-24 17:34:23.866+08', '2020-08-03 18:32:08.178+08', 'patrol.floor/Q(building__site__customer_id={user_id})', '', '{create,retrieve,update,destroy}', '', 43, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (141, '2020-07-24 17:35:44.099+08', '2020-08-03 18:32:14.953+08', 'patrol.floor/Q(building__site__managements__site_manager={user_id})', '', '{create,retrieve,update,destroy}', '', 43, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (142, '2020-07-24 17:37:17.303+08', '2020-08-04 10:04:57.128+08', 'patrol.floor/Q(building__site__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 43, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (143, '2020-07-24 17:39:15.05+08', '2020-08-03 18:32:27.761+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:patrol.building::building:patrol.floor', '', '{create,retrieve,update,destroy}', '', 43, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (144, '2020-08-03 18:32:56.262+08', '2020-08-04 10:05:23.483+08', 'patrol.building/Q(site__customer_id={user_id})', '', '{create,retrieve,update,destroy,create_floor}', '', 44, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (145, '2020-08-03 18:33:24.796+08', '2020-08-04 10:05:32.109+08', 'patrol.building/Q(site__managements__site_manager={user_id})', '', '{create,retrieve,update,destroy,create_floor}', '', 44, 2);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (146, '2020-08-03 18:33:56.76+08', '2020-08-04 10:04:44.301+08', 'patrol.building/Q(site__customer__guard_company_id__monitoring_operator_org={user_id})', '', '{retrieve}', '', 44, 1);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (147, '2020-08-03 18:34:56.24+08', '2020-08-03 18:34:56.241+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:patrol.building', '', '{create,retrieve,update,destroy}', '', 44, 14);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (148, '2020-09-04 14:30:53.173+08', '2020-09-04 14:30:53.173+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:patrol.building', '', '{create,retrieve,update,destroy}', '', 44, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (149, '2020-09-04 14:31:29.521+08', '2020-09-04 14:31:29.521+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:patrol.building::building:patrol.floor', '', '{create,retrieve,update,destroy}', '', 43, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (150, '2020-09-04 14:32:04.582+08', '2020-09-04 14:32:04.582+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.event::event:guard.case::case:guard.casehistory', '', '{retrieve}', '', 37, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (151, '2020-09-04 14:32:43.092+08', '2020-09-04 14:32:43.092+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:mapping.sitemap::site_maps:mapping.map', '', '{create,retrieve,update,destroy,add_target,remove_target}', '', 32, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (152, '2020-09-04 14:33:13.587+08', '2020-09-04 14:33:13.587+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)::domain:mapping.map', '', '{create,retrieve,update,destroy,add_target,remove_target}', '', 32, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (153, '2020-09-04 14:33:40.814+08', '2020-09-04 14:33:40.814+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.event::event:guard.case', '', '{retrieve,update}', '', 13, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (154, '2020-09-04 14:37:19.289+08', '2020-04-21 15:58:52.5+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.box::box:logic.camera', '', '{retrieve,update,map_location,save_video,stream,capture_case,add_target,reboot,get_camera_config,set_camera_config,configure_email_sms,upload_file,get_camera_timezone,set_camera_timezone}', '', 9, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (155, '2020-09-04 14:38:57.06+08', '2020-09-04 14:38:57.06+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.box', '', '{retrieve,update,meta,validate_camera,validate_dvr,search,configure_email_sms}', '', 10, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (156, '2020-09-04 14:39:43.361+08', '2020-09-04 14:39:43.361+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site', '', '{create,retrieve,update,destroy,managements,add_map,remove_map,add_target,configure_email_sms,create_building}', '', 7, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (157, '2020-09-04 14:41:51.485+08', '2020-09-04 14:41:51.485+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)', '', '{create,retrieve,update,destroy,assign_child,attach_user,set_map,unset_map,add_target}', '', 4, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (158, '2020-09-04 14:42:51.992+08', '2020-09-04 14:42:51.992+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)::domain:org.domainuser::domain_users:auth.user::user:org.usernode', '', '{create,retrieve,update,destroy,assign_child}', '', 6, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (159, '2020-09-04 14:43:13.755+08', '2020-09-04 14:43:13.755+08', 'org.domain/Q(domain_users__user_id={user_id})/get_ancestors()', '', '{retrieve}', '', 4, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (160, '2020-09-04 14:44:42.54+08', '2020-09-04 14:44:42.54+08', 'org.domain/Q(domain_users__user_id={user_id})::domains:org.domaintype/get_descendants(True)', '', '{create,retrieve,update,destroy,attach}', '', 17, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (161, '2020-09-04 14:45:05.839+08', '2020-09-04 14:45:05.839+08', 'org.domain/Q(domain_users__user_id={user_id})::domains:logic.organization::organization:mapping.mapconfig', '', '{retrieve}', '', 31, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (162, '2020-09-04 14:45:33.074+08', '2020-09-04 14:45:33.074+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)::domain:mapping.target', '', '{create,retrieve,update,destroy}', '', 33, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (163, '2020-09-04 14:45:58.522+08', '2020-09-04 14:45:58.522+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:mapping.target', '', '{create,retrieve,update,destroy}', '', 33, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (164, '2020-09-04 14:46:25.434+08', '2020-09-04 14:46:25.434+08', 'org.domain/Q(domain_users__user_id={user_id})/get_descendants(True)/Q(domain_type__is_leaf=True)::domains:logic.site::site:logic.box::box:logic.camera::camera:mapping.target', '', '{create,retrieve,update,destroy}', '', 33, 15);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (165, '2020-09-04 14:46:25.434+08', '2020-09-04 14:46:25.434+08', 'logic.departmentmanager/Q(customer={user_id})', '', '{*}', '', 48, 5);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (166, '2020-11-23 09:37:26.513+08', '2020-11-23 09:37:26.513+08', 'logic.site/Q(customer__user__organization__organization_users__user_id={user_id})', '', '{retrieve}', '', 7, 17);
INSERT INTO public.perm_rolepolicy (id, created_at, updated_at, resource_scope, conditions, actions, comment, resource_type_id, role_id) VALUES (167, '2020-11-23 09:37:26.513+08', '2020-11-23 09:37:26.513+08', 'logic.event/Q(site__managements__site_manager__user_id={user_id})', '', '{retrieve}', '', 12, 2);


--
-- Data for Name: push_notifications_apnsdevice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: push_notifications_gcmdevice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: push_notifications_wnsdevice; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: status_page_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: status_page_systemstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: third_auth_thirdauthconf; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: wechat_wechatuser; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: agreement_agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agreement_agreement_id_seq', 1, false);


--
-- Name: agreement_useragreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agreement_useragreement_id_seq', 1, false);


--
-- Name: algorithm_algorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.algorithm_algorithm_id_seq', 97, true);


--
-- Name: algorithm_eventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.algorithm_eventtype_id_seq', 113, true);


--
-- Name: algorithm_productalgorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.algorithm_productalgorithm_id_seq', 941, true);


--
-- Name: algorithm_producttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.algorithm_producttype_id_seq', 14, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 465, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 7, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: back_cameraprefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_cameraprefix_id_seq', 1, false);


--
-- Name: back_cameraprovider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_cameraprovider_id_seq', 1, false);


--
-- Name: back_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_feedback_id_seq', 1, false);


--
-- Name: back_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.back_notification_id_seq', 1, false);


--
-- Name: bill_boxpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_boxpayment_id_seq', 1, false);


--
-- Name: bill_boxpricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_boxpricing_id_seq', 1, false);


--
-- Name: bill_client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_client_id_seq', 2, true);


--
-- Name: bill_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_payment_id_seq', 1, false);


--
-- Name: bill_robotpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bill_robotpayment_id_seq', 1, false);


--
-- Name: ccs_notifyinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ccs_notifyinfo_id_seq', 1, true);


--
-- Name: ccs_rawevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ccs_rawevent_id_seq', 1, true);


--
-- Name: ccs_sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ccs_sample_id_seq', 1, false);


--
-- Name: ccs_usersite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ccs_usersite_id_seq', 1, true);


--
-- Name: channel_forwardaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_forwardaction_id_seq', 12, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 49, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 155, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 173, true);


--
-- Name: face_eventandtrackingobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_eventandtrackingobject_id_seq', 1, false);


--
-- Name: face_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_group_id_seq', 1, false);


--
-- Name: face_groupuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_groupuser_id_seq', 1, false);


--
-- Name: face_humancountinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_humancountinfo_id_seq', 1, false);


--
-- Name: face_humancountmediafile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_humancountmediafile_id_seq', 1, false);


--
-- Name: face_humancountrealtimeinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_humancountrealtimeinfo_id_seq', 1, false);


--
-- Name: face_questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_questionnaire_id_seq', 1, false);


--
-- Name: face_questionnaireresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_questionnaireresult_id_seq', 1, false);


--
-- Name: face_throttlecounters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.face_throttlecounters_id_seq', 1, false);


--
-- Name: guard_beatglobal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_beatglobal_id_seq', 2, false);


--
-- Name: guard_beatjob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_beatjob_id_seq', 1, false);


--
-- Name: guard_case_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_case_id_seq', 7, true);


--
-- Name: guard_caseexportconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_caseexportconfig_id_seq', 1, false);


--
-- Name: guard_caseexportrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_caseexportrecord_id_seq', 1, false);


--
-- Name: guard_casehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_casehistory_id_seq', 1, false);


--
-- Name: guard_casemedium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_casemedium_id_seq', 1, false);


--
-- Name: guard_guardcompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_guardcompany_id_seq', 1, true);


--
-- Name: guard_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_note_id_seq', 1, false);


--
-- Name: guard_siteoperation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guard_siteoperation_id_seq', 1, false);


--
-- Name: license_plate_blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.license_plate_blacklist_id_seq', 1, false);


--
-- Name: logic_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_agent_id_seq', 1, false);


--
-- Name: logic_boxlocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_boxlocation_id_seq', 1, false);


--
-- Name: logic_camera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_camera_id_seq', 7, true);


--
-- Name: logic_camerafirmwareversion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_camerafirmwareversion_id_seq', 2, false);


--
-- Name: logic_cameralocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_cameralocation_id_seq', 1, false);


--
-- Name: logic_camerasavedvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_camerasavedvideo_id_seq', 1, true);


--
-- Name: logic_cameratrackingobject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_cameratrackingobject_id_seq', 1, false);


--
-- Name: logic_cameravideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_cameravideo_id_seq', 3, true);


--
-- Name: logic_customizedalgorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_customizedalgorithm_id_seq', 2, true);


--
-- Name: logic_customizedeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_customizedeventtype_id_seq', 2, true);


--
-- Name: logic_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_event_id_seq', 11, true);


--
-- Name: logic_eventbackup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_eventbackup_id_seq', 1, false);


--
-- Name: logic_inspection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_inspection_id_seq', 2, true);


--
-- Name: logic_inspectmedium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_inspectmedium_id_seq', 2, true);


--
-- Name: logic_ipwhitelist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_ipwhitelist_id_seq', 1, false);


--
-- Name: logic_locationeventblacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_locationeventblacklist_id_seq', 1, false);


--
-- Name: logic_manualcleanuptask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_manualcleanuptask_id_seq', 2, true);


--
-- Name: logic_medium_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_medium_id_seq', 33, true);


--
-- Name: logic_mediumbackup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_mediumbackup_id_seq', 1, false);


--
-- Name: logic_notifyrule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_notifyrule_id_seq', 1, false);


--
-- Name: logic_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_organization_id_seq', 2, true);


--
-- Name: logic_organizationuistrategy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_organizationuistrategy_id_seq', 1, false);


--
-- Name: logic_robotsavedvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_robotsavedvideo_id_seq', 1, false);


--
-- Name: logic_robotsnap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_robotsnap_id_seq', 1, false);


--
-- Name: logic_robotvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_robotvideo_id_seq', 3, true);


--
-- Name: logic_route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_route_id_seq', 3, true);


--
-- Name: logic_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_rule_id_seq', 3, true);


--
-- Name: logic_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_site_id_seq', 2, true);


--
-- Name: logic_sitemanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_sitemanagement_id_seq', 1, true);


--
-- Name: logic_snap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_snap_id_seq', 1, false);


--
-- Name: logic_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_task_id_seq', 1, true);


--
-- Name: logic_thermalcamerasettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_thermalcamerasettings_id_seq', 1, false);


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_thermalcamerasettingsbatchupdaterecord_id_seq', 1, false);


--
-- Name: logic_thermalcamerasettingscheckrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_thermalcamerasettingscheckrecord_id_seq', 2, false);


--
-- Name: logic_uistrategy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_uistrategy_id_seq', 1, false);


--
-- Name: logic_waypoint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_waypoint_id_seq', 2, true);


--
-- Name: logic_waypointhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_waypointhistory_id_seq', 1, false);


--
-- Name: logic_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logic_webhook_id_seq', 1, false);


--
-- Name: mapping_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapping_map_id_seq', 3, true);


--
-- Name: mapping_mapconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapping_mapconfig_id_seq', 3, true);


--
-- Name: mapping_maptarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapping_maptarget_id_seq', 2, true);


--
-- Name: mapping_sitemap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapping_sitemap_id_seq', 2, true);


--
-- Name: mapping_target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapping_target_id_seq', 5, true);


--
-- Name: monitor_center_business_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_business_id_seq', 1, true);


--
-- Name: monitor_center_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_channel_id_seq', 1, false);


--
-- Name: monitor_center_customalgo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_customalgo_id_seq', 1, false);


--
-- Name: monitor_center_customalgonotify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_customalgonotify_id_seq', 1, false);


--
-- Name: monitor_center_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_device_id_seq', 1, false);


--
-- Name: monitor_center_robotincidentnotifyrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_robotincidentnotifyrecord_id_seq', 1, false);


--
-- Name: monitor_center_robotnotifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_robotnotifier_id_seq', 1, false);


--
-- Name: monitor_center_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_rule_id_seq', 1, false);


--
-- Name: monitor_center_sitefloorvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monitor_center_sitefloorvideo_id_seq', 1, false);


--
-- Name: org_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_domain_id_seq', 5, true);


--
-- Name: org_domainsite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_domainsite_id_seq', 1, true);


--
-- Name: org_domaintype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_domaintype_id_seq', 5, true);


--
-- Name: org_domainuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_domainuser_id_seq', 1, true);


--
-- Name: org_organizationdelegate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_organizationdelegate_id_seq', 1, true);


--
-- Name: org_organizationuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_organizationuser_id_seq', 6, true);


--
-- Name: org_usernode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.org_usernode_id_seq', 7, true);


--
-- Name: patrol_algoconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_algoconfig_id_seq', 2, true);


--
-- Name: patrol_algoreference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_algoreference_id_seq', 1, false);


--
-- Name: patrol_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_building_id_seq', 2, false);


--
-- Name: patrol_detectiontask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_detectiontask_id_seq', 1, false);


--
-- Name: patrol_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_floor_id_seq', 4, false);


--
-- Name: patrol_target_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patrol_target_id_seq', 3, false);


--
-- Name: perm_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_action_id_seq', 293, true);


--
-- Name: perm_resourcetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_resourcetype_id_seq', 48, true);


--
-- Name: perm_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_role_id_seq', 17, true);


--
-- Name: perm_role_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_role_users_id_seq', 9, true);


--
-- Name: perm_rolepolicy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perm_rolepolicy_id_seq', 167, true);


--
-- Name: push_notifications_apnsdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_notifications_apnsdevice_id_seq', 1, false);


--
-- Name: push_notifications_gcmdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_notifications_gcmdevice_id_seq', 1, false);


--
-- Name: push_notifications_wnsdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.push_notifications_wnsdevice_id_seq', 1, false);


--
-- Name: third_auth_thirdauthconf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.third_auth_thirdauthconf_id_seq', 1, false);


--
-- Name: wechat_wechatuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wechat_wechatuser_id_seq', 1, false);


--
-- Name: agreement_agreement agreement_agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_agreement
    ADD CONSTRAINT agreement_agreement_pkey PRIMARY KEY (id);


--
-- Name: agreement_useragreement agreement_useragreement_agreement_id_user_id_430b19db_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_useragreement
    ADD CONSTRAINT agreement_useragreement_agreement_id_user_id_430b19db_uniq UNIQUE (agreement_id, user_id);


--
-- Name: agreement_useragreement agreement_useragreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_useragreement
    ADD CONSTRAINT agreement_useragreement_pkey PRIMARY KEY (id);


--
-- Name: algorithm_algorithm algorithm_algorithm_code_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_code_name_key UNIQUE (code_name);


--
-- Name: algorithm_algorithm algorithm_algorithm_index_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_index_key UNIQUE (index);


--
-- Name: algorithm_algorithm algorithm_algorithm_name_en_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_name_en_key UNIQUE (name_en);


--
-- Name: algorithm_algorithm algorithm_algorithm_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_name_key UNIQUE (name);


--
-- Name: algorithm_algorithm algorithm_algorithm_name_zh_hans_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_name_zh_hans_key UNIQUE (name_zh_hans);


--
-- Name: algorithm_algorithm algorithm_algorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_algorithm
    ADD CONSTRAINT algorithm_algorithm_pkey PRIMARY KEY (id);


--
-- Name: algorithm_eventtype algorithm_eventtype_code_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_code_name_key UNIQUE (code_name);


--
-- Name: algorithm_eventtype algorithm_eventtype_index_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_index_key UNIQUE (index);


--
-- Name: algorithm_eventtype algorithm_eventtype_name_en_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_name_en_key UNIQUE (name_en);


--
-- Name: algorithm_eventtype algorithm_eventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_name_key UNIQUE (name);


--
-- Name: algorithm_eventtype algorithm_eventtype_name_zh_hans_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_name_zh_hans_key UNIQUE (name_zh_hans);


--
-- Name: algorithm_eventtype algorithm_eventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_pkey PRIMARY KEY (id);


--
-- Name: algorithm_productalgorithm algorithm_productalgorit_product_type_id_algorith_0519278d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_productalgorithm
    ADD CONSTRAINT algorithm_productalgorit_product_type_id_algorith_0519278d_uniq UNIQUE (product_type_id, algorithm_id);


--
-- Name: algorithm_productalgorithm algorithm_productalgorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_productalgorithm
    ADD CONSTRAINT algorithm_productalgorithm_pkey PRIMARY KEY (id);


--
-- Name: algorithm_producttype algorithm_producttype_category_type_d9fbce31_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_producttype
    ADD CONSTRAINT algorithm_producttype_category_type_d9fbce31_uniq UNIQUE (category, type);


--
-- Name: algorithm_producttype algorithm_producttype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_producttype
    ADD CONSTRAINT algorithm_producttype_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_email_key UNIQUE (email);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: back_cameraprefix back_cameraprefix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprefix
    ADD CONSTRAINT back_cameraprefix_pkey PRIMARY KEY (id);


--
-- Name: back_cameraprovider back_cameraprovider_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprovider
    ADD CONSTRAINT back_cameraprovider_brand_key UNIQUE (brand);


--
-- Name: back_cameraprovider back_cameraprovider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprovider
    ADD CONSTRAINT back_cameraprovider_pkey PRIMARY KEY (id);


--
-- Name: back_feedback back_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_feedback
    ADD CONSTRAINT back_feedback_pkey PRIMARY KEY (id);


--
-- Name: back_notification back_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_notification
    ADD CONSTRAINT back_notification_pkey PRIMARY KEY (id);


--
-- Name: bill_boxpayment bill_boxpayment_box_subs_id_end_date_4ce505f5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_box_subs_id_end_date_4ce505f5_uniq UNIQUE (box_subs_id, end_date);


--
-- Name: bill_boxpayment bill_boxpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_pkey PRIMARY KEY (id);


--
-- Name: bill_boxpricing bill_boxpricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpricing
    ADD CONSTRAINT bill_boxpricing_pkey PRIMARY KEY (id);


--
-- Name: bill_boxsubs bill_boxsubs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_pkey PRIMARY KEY (id);


--
-- Name: bill_client bill_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client
    ADD CONSTRAINT bill_client_pkey PRIMARY KEY (id);


--
-- Name: bill_client bill_client_seller_id_user_id_7f10d8d4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client
    ADD CONSTRAINT bill_client_seller_id_user_id_7f10d8d4_uniq UNIQUE (seller_id, user_id);


--
-- Name: bill_customer bill_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_customer
    ADD CONSTRAINT bill_customer_pkey PRIMARY KEY (id);


--
-- Name: bill_customer bill_customer_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_customer
    ADD CONSTRAINT bill_customer_stripe_id_key UNIQUE (stripe_id);


--
-- Name: bill_distributor bill_distributor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_distributor
    ADD CONSTRAINT bill_distributor_pkey PRIMARY KEY (id);


--
-- Name: bill_employee bill_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_employee
    ADD CONSTRAINT bill_employee_pkey PRIMARY KEY (id);


--
-- Name: bill_payment bill_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_payment
    ADD CONSTRAINT bill_payment_pkey PRIMARY KEY (id);


--
-- Name: bill_pricing bill_pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_pricing
    ADD CONSTRAINT bill_pricing_pkey PRIMARY KEY (type);


--
-- Name: bill_robotpayment bill_robotpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_pkey PRIMARY KEY (id);


--
-- Name: bill_robotpayment bill_robotpayment_robot_subs_id_end_date_8f5fe117_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_robot_subs_id_end_date_8f5fe117_uniq UNIQUE (robot_subs_id, end_date);


--
-- Name: bill_robotsubs bill_robotsubs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_pkey PRIMARY KEY (id);


--
-- Name: bill_seller bill_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_seller
    ADD CONSTRAINT bill_seller_pkey PRIMARY KEY (id);


--
-- Name: ccs_notifyinfo ccs_notifyinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_notifyinfo
    ADD CONSTRAINT ccs_notifyinfo_pkey PRIMARY KEY (id);


--
-- Name: ccs_rawevent ccs_rawevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_pkey PRIMARY KEY (id);


--
-- Name: ccs_rawevent ccs_rawevent_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_uuid_key UNIQUE (uuid);


--
-- Name: ccs_sample ccs_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_sample
    ADD CONSTRAINT ccs_sample_pkey PRIMARY KEY (id);


--
-- Name: ccs_sample ccs_sample_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_sample
    ADD CONSTRAINT ccs_sample_uuid_key UNIQUE (uuid);


--
-- Name: ccs_usersite ccs_usersite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_usersite
    ADD CONSTRAINT ccs_usersite_pkey PRIMARY KEY (id);


--
-- Name: ccs_usersite ccs_usersite_user_id_site_id_e262b54e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_usersite
    ADD CONSTRAINT ccs_usersite_user_id_site_id_e262b54e_uniq UNIQUE (user_id, site_id);


--
-- Name: channel_forwardaction channel_forwardaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_forwardaction
    ADD CONSTRAINT channel_forwardaction_pkey PRIMARY KEY (id);


--
-- Name: channel_forwardaction channel_forwardaction_resource_type_id_action_id_549dba94_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_forwardaction
    ADD CONSTRAINT channel_forwardaction_resource_type_id_action_id_549dba94_uniq UNIQUE (resource_type_id, action_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: face_eventandtrackingobject face_eventandtrackingobject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_eventandtrackingobject
    ADD CONSTRAINT face_eventandtrackingobject_pkey PRIMARY KEY (id);


--
-- Name: face_face face_face_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_face
    ADD CONSTRAINT face_face_pkey PRIMARY KEY (id);


--
-- Name: face_facelib face_facelib_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_facelib
    ADD CONSTRAINT face_facelib_pkey PRIMARY KEY (id);


--
-- Name: face_group face_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_group
    ADD CONSTRAINT face_group_pkey PRIMARY KEY (id);


--
-- Name: face_groupuser face_groupuser_group_id_user_id_c9b3e6b9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_groupuser
    ADD CONSTRAINT face_groupuser_group_id_user_id_c9b3e6b9_uniq UNIQUE (group_id, user_id);


--
-- Name: face_groupuser face_groupuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_groupuser
    ADD CONSTRAINT face_groupuser_pkey PRIMARY KEY (id);


--
-- Name: face_humancountinfo face_humancountinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountinfo
    ADD CONSTRAINT face_humancountinfo_pkey PRIMARY KEY (id);


--
-- Name: face_humancountmediafile face_humancountmediafile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountmediafile
    ADD CONSTRAINT face_humancountmediafile_pkey PRIMARY KEY (id);


--
-- Name: face_humancountrealtimeinfo face_humancountrealtimeinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountrealtimeinfo
    ADD CONSTRAINT face_humancountrealtimeinfo_pkey PRIMARY KEY (id);


--
-- Name: face_questionnaire face_questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaire
    ADD CONSTRAINT face_questionnaire_pkey PRIMARY KEY (id);


--
-- Name: face_questionnaireresult face_questionnaireresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaireresult
    ADD CONSTRAINT face_questionnaireresult_pkey PRIMARY KEY (id);


--
-- Name: face_settings face_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_settings
    ADD CONSTRAINT face_settings_pkey PRIMARY KEY (organization_id);


--
-- Name: face_throttlecounters face_throttlecounters_org_id_date_9ea5bdf4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_throttlecounters
    ADD CONSTRAINT face_throttlecounters_org_id_date_9ea5bdf4_uniq UNIQUE (org_id, date);


--
-- Name: face_throttlecounters face_throttlecounters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_throttlecounters
    ADD CONSTRAINT face_throttlecounters_pkey PRIMARY KEY (id);


--
-- Name: face_trackingobject face_trackingobject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_trackingobject
    ADD CONSTRAINT face_trackingobject_pkey PRIMARY KEY (id);


--
-- Name: guard_beatglobal guard_beatglobal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_beatglobal
    ADD CONSTRAINT guard_beatglobal_pkey PRIMARY KEY (id);


--
-- Name: guard_beatglobal guard_beatglobal_task_type_execute_channel_2ff43b58_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_beatglobal
    ADD CONSTRAINT guard_beatglobal_task_type_execute_channel_2ff43b58_uniq UNIQUE (task_type, execute_channel);


--
-- Name: guard_beatjob guard_beatjob_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_beatjob
    ADD CONSTRAINT guard_beatjob_pkey PRIMARY KEY (id);


--
-- Name: guard_case guard_case_event_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_event_id_key UNIQUE (event_id);


--
-- Name: guard_case guard_case_incident_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_incident_id_key UNIQUE (incident_id);


--
-- Name: guard_case guard_case_inspection_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_inspection_id_key UNIQUE (inspection_id);


--
-- Name: guard_case guard_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_pkey PRIMARY KEY (id);


--
-- Name: guard_caseexportconfig guard_caseexportconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportconfig
    ADD CONSTRAINT guard_caseexportconfig_pkey PRIMARY KEY (id);


--
-- Name: guard_caseexportrecord guard_caseexportrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportrecord
    ADD CONSTRAINT guard_caseexportrecord_pkey PRIMARY KEY (id);


--
-- Name: guard_casehistory guard_casehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casehistory
    ADD CONSTRAINT guard_casehistory_pkey PRIMARY KEY (id);


--
-- Name: guard_casemedium guard_casemedium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casemedium
    ADD CONSTRAINT guard_casemedium_pkey PRIMARY KEY (id);


--
-- Name: guard_guard guard_guard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guard
    ADD CONSTRAINT guard_guard_pkey PRIMARY KEY (id);


--
-- Name: guard_guardadmin guard_guardadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guardadmin
    ADD CONSTRAINT guard_guardadmin_pkey PRIMARY KEY (id);


--
-- Name: guard_guardcompany guard_guardcompany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guardcompany
    ADD CONSTRAINT guard_guardcompany_pkey PRIMARY KEY (id);


--
-- Name: guard_incident guard_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_incident
    ADD CONSTRAINT guard_incident_pkey PRIMARY KEY (id);


--
-- Name: guard_monitoringoperator guard_monitoringoperator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_monitoringoperator
    ADD CONSTRAINT guard_monitoringoperator_pkey PRIMARY KEY (id);


--
-- Name: guard_note guard_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_note
    ADD CONSTRAINT guard_note_pkey PRIMARY KEY (id);


--
-- Name: guard_siteoperation guard_siteoperation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_siteoperation
    ADD CONSTRAINT guard_siteoperation_pkey PRIMARY KEY (id);


--
-- Name: license_plate_blacklist license_plate_blacklist_license_plate_organizati_9c8f6cbf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_plate_blacklist
    ADD CONSTRAINT license_plate_blacklist_license_plate_organizati_9c8f6cbf_uniq UNIQUE (license_plate, organization_id);


--
-- Name: license_plate_blacklist license_plate_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.license_plate_blacklist
    ADD CONSTRAINT license_plate_blacklist_pkey PRIMARY KEY (id);


--
-- Name: logic_agent logic_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_agent
    ADD CONSTRAINT logic_agent_pkey PRIMARY KEY (id);


--
-- Name: logic_box logic_box_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_box
    ADD CONSTRAINT logic_box_pkey PRIMARY KEY (id);


--
-- Name: logic_boxlocation logic_boxlocation_box_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_boxlocation
    ADD CONSTRAINT logic_boxlocation_box_id_key UNIQUE (box_id);


--
-- Name: logic_boxlocation logic_boxlocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_boxlocation
    ADD CONSTRAINT logic_boxlocation_pkey PRIMARY KEY (id);


--
-- Name: logic_camera logic_camera_mac_address_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera
    ADD CONSTRAINT logic_camera_mac_address_key UNIQUE (mac_address);


--
-- Name: logic_camera logic_camera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera
    ADD CONSTRAINT logic_camera_pkey PRIMARY KEY (id);


--
-- Name: logic_camerafirmwareversion logic_camerafirmwareversion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerafirmwareversion
    ADD CONSTRAINT logic_camerafirmwareversion_pkey PRIMARY KEY (id);


--
-- Name: logic_camerafirmwareversion logic_camerafirmwareversion_version_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerafirmwareversion
    ADD CONSTRAINT logic_camerafirmwareversion_version_key UNIQUE (version);


--
-- Name: logic_cameralocation logic_cameralocation_camera_id_map_id_9db31a7a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameralocation
    ADD CONSTRAINT logic_cameralocation_camera_id_map_id_9db31a7a_uniq UNIQUE (camera_id, map_id);


--
-- Name: logic_cameralocation logic_cameralocation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameralocation
    ADD CONSTRAINT logic_cameralocation_pkey PRIMARY KEY (id);


--
-- Name: logic_camerasavedvideo logic_camerasavedvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerasavedvideo
    ADD CONSTRAINT logic_camerasavedvideo_pkey PRIMARY KEY (id);


--
-- Name: logic_cameratrackingobject logic_cameratrackingobje_camera_id_tracking_objec_92395cc3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameratrackingobject
    ADD CONSTRAINT logic_cameratrackingobje_camera_id_tracking_objec_92395cc3_uniq UNIQUE (camera_id, tracking_object_id);


--
-- Name: logic_cameratrackingobject logic_cameratrackingobject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameratrackingobject
    ADD CONSTRAINT logic_cameratrackingobject_pkey PRIMARY KEY (id);


--
-- Name: logic_cameravideo logic_cameravideo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameravideo
    ADD CONSTRAINT logic_cameravideo_pkey PRIMARY KEY (id);


--
-- Name: logic_customizedalgorithm logic_customizedalgorithm_organization_id_index_4db3ba9a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm
    ADD CONSTRAINT logic_customizedalgorithm_organization_id_index_4db3ba9a_uniq UNIQUE (organization_id, index);


--
-- Name: logic_customizedalgorithm logic_customizedalgorithm_organization_id_name_1591b250_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm
    ADD CONSTRAINT logic_customizedalgorithm_organization_id_name_1591b250_uniq UNIQUE (organization_id, name);


--
-- Name: logic_customizedalgorithm logic_customizedalgorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm
    ADD CONSTRAINT logic_customizedalgorithm_pkey PRIMARY KEY (id);


--
-- Name: logic_customizedeventtype logic_customizedeventtype_organization_id_index_886bb2d0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeventtype_organization_id_index_886bb2d0_uniq UNIQUE (organization_id, index);


--
-- Name: logic_customizedeventtype logic_customizedeventtype_organization_id_name_67f211ed_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeventtype_organization_id_name_67f211ed_uniq UNIQUE (organization_id, name);


--
-- Name: logic_customizedeventtype logic_customizedeventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeventtype_pkey PRIMARY KEY (id);


--
-- Name: logic_departmentmanager logic_departmentmanager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_departmentmanager
    ADD CONSTRAINT logic_departmentmanager_pkey PRIMARY KEY (id);


--
-- Name: logic_devicekey logic_devicekey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_devicekey
    ADD CONSTRAINT logic_devicekey_pkey PRIMARY KEY (id);


--
-- Name: logic_devicekey logic_devicekey_public_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_devicekey
    ADD CONSTRAINT logic_devicekey_public_key_key UNIQUE (public_key);


--
-- Name: logic_event logic_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event
    ADD CONSTRAINT logic_event_pkey PRIMARY KEY (id);


--
-- Name: logic_eventbackup logic_eventbackup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_eventbackup
    ADD CONSTRAINT logic_eventbackup_pkey PRIMARY KEY (id);


--
-- Name: logic_inspection logic_inspection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection
    ADD CONSTRAINT logic_inspection_pkey PRIMARY KEY (id);


--
-- Name: logic_inspection logic_inspection_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection
    ADD CONSTRAINT logic_inspection_uuid_key UNIQUE (uuid);


--
-- Name: logic_inspectmedium logic_inspectmedium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspectmedium
    ADD CONSTRAINT logic_inspectmedium_pkey PRIMARY KEY (id);


--
-- Name: logic_invitation logic_invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_invitation
    ADD CONSTRAINT logic_invitation_pkey PRIMARY KEY (id);


--
-- Name: logic_ipwhitelist logic_ipwhitelist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_ipwhitelist
    ADD CONSTRAINT logic_ipwhitelist_pkey PRIMARY KEY (id);


--
-- Name: logic_locationeventblacklist logic_locationeventblack_location_event_type_id_8c5e5f4c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_locationeventblacklist
    ADD CONSTRAINT logic_locationeventblack_location_event_type_id_8c5e5f4c_uniq UNIQUE (location, event_type_id);


--
-- Name: logic_locationeventblacklist logic_locationeventblacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_locationeventblacklist
    ADD CONSTRAINT logic_locationeventblacklist_pkey PRIMARY KEY (id);


--
-- Name: logic_manualcleanuptask logic_manualcleanuptask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_manualcleanuptask
    ADD CONSTRAINT logic_manualcleanuptask_pkey PRIMARY KEY (id);


--
-- Name: logic_manualcleanuptask logic_manualcleanuptask_task_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_manualcleanuptask
    ADD CONSTRAINT logic_manualcleanuptask_task_id_key UNIQUE (task_id);


--
-- Name: logic_medium logic_medium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_medium
    ADD CONSTRAINT logic_medium_pkey PRIMARY KEY (id);


--
-- Name: logic_mediumbackup logic_mediumbackup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_mediumbackup
    ADD CONSTRAINT logic_mediumbackup_pkey PRIMARY KEY (id);


--
-- Name: logic_monitor logic_monitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_monitor
    ADD CONSTRAINT logic_monitor_pkey PRIMARY KEY (id);


--
-- Name: logic_notifyrule logic_notifyrule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule
    ADD CONSTRAINT logic_notifyrule_pkey PRIMARY KEY (id);


--
-- Name: logic_organization logic_organization_code_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organization
    ADD CONSTRAINT logic_organization_code_name_key UNIQUE (code_name);


--
-- Name: logic_organization logic_organization_owner_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organization
    ADD CONSTRAINT logic_organization_owner_id_key UNIQUE (owner_id);


--
-- Name: logic_organization logic_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organization
    ADD CONSTRAINT logic_organization_pkey PRIMARY KEY (id);


--
-- Name: logic_organizationuistrategy logic_organizationuistrategy_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organizationuistrategy
    ADD CONSTRAINT logic_organizationuistrategy_organization_id_key UNIQUE (organization_id);


--
-- Name: logic_organizationuistrategy logic_organizationuistrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organizationuistrategy
    ADD CONSTRAINT logic_organizationuistrategy_pkey PRIMARY KEY (id);


--
-- Name: logic_patrol logic_patrol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_patrol
    ADD CONSTRAINT logic_patrol_pkey PRIMARY KEY (task_id);


--
-- Name: logic_person logic_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_person
    ADD CONSTRAINT logic_person_pkey PRIMARY KEY (id);


--
-- Name: logic_robot logic_robot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robot
    ADD CONSTRAINT logic_robot_pkey PRIMARY KEY (id);


--
-- Name: logic_robotsavedvideo logic_robotsavedvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsavedvideo
    ADD CONSTRAINT logic_robotsavedvideo_pkey PRIMARY KEY (id);


--
-- Name: logic_robotsnap logic_robotsnap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsnap
    ADD CONSTRAINT logic_robotsnap_pkey PRIMARY KEY (id);


--
-- Name: logic_robotvideo logic_robotvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotvideo
    ADD CONSTRAINT logic_robotvideo_pkey PRIMARY KEY (id);


--
-- Name: logic_route logic_route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_route
    ADD CONSTRAINT logic_route_pkey PRIMARY KEY (id);


--
-- Name: logic_route logic_route_user_id_name_f9bef338_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_route
    ADD CONSTRAINT logic_route_user_id_name_f9bef338_uniq UNIQUE (user_id, name);


--
-- Name: logic_rule logic_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_rule
    ADD CONSTRAINT logic_rule_pkey PRIMARY KEY (id);


--
-- Name: logic_rule logic_rule_unique_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_rule
    ADD CONSTRAINT logic_rule_unique_id_key UNIQUE (unique_id);


--
-- Name: logic_sharing logic_sharing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sharing
    ADD CONSTRAINT logic_sharing_pkey PRIMARY KEY (id);


--
-- Name: logic_site logic_site_customer_id_name_2b0b8a93_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_site
    ADD CONSTRAINT logic_site_customer_id_name_2b0b8a93_uniq UNIQUE (customer_id, name);


--
-- Name: logic_site logic_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_site
    ADD CONSTRAINT logic_site_pkey PRIMARY KEY (id);


--
-- Name: logic_sitemanagement logic_sitemanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanagement
    ADD CONSTRAINT logic_sitemanagement_pkey PRIMARY KEY (id);


--
-- Name: logic_sitemanager logic_sitemanager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanager
    ADD CONSTRAINT logic_sitemanager_pkey PRIMARY KEY (id);


--
-- Name: logic_snap logic_snap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_snap
    ADD CONSTRAINT logic_snap_pkey PRIMARY KEY (id);


--
-- Name: logic_task logic_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_task
    ADD CONSTRAINT logic_task_pkey PRIMARY KEY (id);


--
-- Name: logic_thermalcamerasettings logic_thermalcamerasettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettings
    ADD CONSTRAINT logic_thermalcamerasettings_pkey PRIMARY KEY (id);


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord logic_thermalcamerasettingsbatchupdaterecord_batch_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingsbatchupdaterecord
    ADD CONSTRAINT logic_thermalcamerasettingsbatchupdaterecord_batch_id_key UNIQUE (batch_id);


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord logic_thermalcamerasettingsbatchupdaterecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingsbatchupdaterecord
    ADD CONSTRAINT logic_thermalcamerasettingsbatchupdaterecord_pkey PRIMARY KEY (id);


--
-- Name: logic_thermalcamerasettingscheckrecord logic_thermalcamerasettingscheckrecord_check_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingscheckrecord
    ADD CONSTRAINT logic_thermalcamerasettingscheckrecord_check_id_key UNIQUE (check_id);


--
-- Name: logic_thermalcamerasettingscheckrecord logic_thermalcamerasettingscheckrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingscheckrecord
    ADD CONSTRAINT logic_thermalcamerasettingscheckrecord_pkey PRIMARY KEY (id);


--
-- Name: logic_uistrategy logic_uistrategy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_uistrategy
    ADD CONSTRAINT logic_uistrategy_name_key UNIQUE (name);


--
-- Name: logic_uistrategy logic_uistrategy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_uistrategy
    ADD CONSTRAINT logic_uistrategy_pkey PRIMARY KEY (id);


--
-- Name: logic_waypoint logic_waypoint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypoint
    ADD CONSTRAINT logic_waypoint_pkey PRIMARY KEY (id);


--
-- Name: logic_waypoint logic_waypoint_site_id_name_0c7bf0b4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypoint
    ADD CONSTRAINT logic_waypoint_site_id_name_0c7bf0b4_uniq UNIQUE (site_id, name);


--
-- Name: logic_waypointhistory logic_waypointhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypointhistory
    ADD CONSTRAINT logic_waypointhistory_pkey PRIMARY KEY (id);


--
-- Name: logic_webhook logic_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_webhook
    ADD CONSTRAINT logic_webhook_pkey PRIMARY KEY (id);


--
-- Name: mapping_map mapping_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_map
    ADD CONSTRAINT mapping_map_pkey PRIMARY KEY (id);


--
-- Name: mapping_mapconfig mapping_mapconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_mapconfig
    ADD CONSTRAINT mapping_mapconfig_pkey PRIMARY KEY (id);


--
-- Name: mapping_maptarget mapping_maptarget_map_id_target_id_45228253_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_maptarget
    ADD CONSTRAINT mapping_maptarget_map_id_target_id_45228253_uniq UNIQUE (map_id, target_id);


--
-- Name: mapping_maptarget mapping_maptarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_maptarget
    ADD CONSTRAINT mapping_maptarget_pkey PRIMARY KEY (id);


--
-- Name: mapping_sitemap mapping_sitemap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_sitemap
    ADD CONSTRAINT mapping_sitemap_pkey PRIMARY KEY (id);


--
-- Name: mapping_sitemap mapping_sitemap_site_id_map_id_84df0002_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_sitemap
    ADD CONSTRAINT mapping_sitemap_site_id_map_id_84df0002_uniq UNIQUE (site_id, map_id);


--
-- Name: mapping_target mapping_target_camera_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_camera_id_key UNIQUE (camera_id);


--
-- Name: mapping_target mapping_target_domain_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_domain_id_key UNIQUE (domain_id);


--
-- Name: mapping_target mapping_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_pkey PRIMARY KEY (id);


--
-- Name: mapping_target mapping_target_robot_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_robot_id_key UNIQUE (robot_id);


--
-- Name: mapping_target mapping_target_site_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_site_id_key UNIQUE (site_id);


--
-- Name: monitor_center_business monitor_center_business_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_business
    ADD CONSTRAINT monitor_center_business_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_channel monitor_center_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_channel
    ADD CONSTRAINT monitor_center_channel_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_customalgo monitor_center_customalgo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgo
    ADD CONSTRAINT monitor_center_customalgo_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_customalgonotify monitor_center_customalgonotify_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgonotify
    ADD CONSTRAINT monitor_center_customalgonotify_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_device monitor_center_device_device_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_device
    ADD CONSTRAINT monitor_center_device_device_id_key UNIQUE (device_id);


--
-- Name: monitor_center_device monitor_center_device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_device
    ADD CONSTRAINT monitor_center_device_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_eventext monitor_center_eventext_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_eventext
    ADD CONSTRAINT monitor_center_eventext_pkey PRIMARY KEY (event_ptr_id);


--
-- Name: monitor_center_fmevent monitor_center_fmevent_event_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_fmevent
    ADD CONSTRAINT monitor_center_fmevent_event_id_key UNIQUE (event_id);


--
-- Name: monitor_center_fmevent monitor_center_fmevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_fmevent
    ADD CONSTRAINT monitor_center_fmevent_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_orgext monitor_center_orgext_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_orgext
    ADD CONSTRAINT monitor_center_orgext_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_robotincidentnotifyrecord monitor_center_robotincidentnotifyrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotincidentnotifyrecord
    ADD CONSTRAINT monitor_center_robotincidentnotifyrecord_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_robotnotifier monitor_center_robotnotifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotnotifier
    ADD CONSTRAINT monitor_center_robotnotifier_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_robotnotifier monitor_center_robotnotifier_robot_id_user_id_27ae5e8c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotnotifier
    ADD CONSTRAINT monitor_center_robotnotifier_robot_id_user_id_27ae5e8c_uniq UNIQUE (robot_id, user_id);


--
-- Name: monitor_center_rule monitor_center_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_rule
    ADD CONSTRAINT monitor_center_rule_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_sitefloorvideo monitor_center_sitefloor_site_id_date_group_new_f_2df81589_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_sitefloorvideo
    ADD CONSTRAINT monitor_center_sitefloor_site_id_date_group_new_f_2df81589_uniq UNIQUE (site_id, date_group, new_floor_id);


--
-- Name: monitor_center_sitefloorvideo monitor_center_sitefloorvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_sitefloorvideo
    ADD CONSTRAINT monitor_center_sitefloorvideo_pkey PRIMARY KEY (id);


--
-- Name: monitor_center_userext monitor_center_userext_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_userext
    ADD CONSTRAINT monitor_center_userext_pkey PRIMARY KEY (id);


--
-- Name: org_domain org_domain_map_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_map_id_key UNIQUE (map_id);


--
-- Name: org_domain org_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_pkey PRIMARY KEY (id);


--
-- Name: org_domain org_domain_tree_id_code_name_e3929f9a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_tree_id_code_name_e3929f9a_uniq UNIQUE (tree_id, code_name);


--
-- Name: org_domainsite org_domainsite_domain_id_site_id_6dcbd539_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainsite
    ADD CONSTRAINT org_domainsite_domain_id_site_id_6dcbd539_uniq UNIQUE (domain_id, site_id);


--
-- Name: org_domainsite org_domainsite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainsite
    ADD CONSTRAINT org_domainsite_pkey PRIMARY KEY (id);


--
-- Name: org_domaintype org_domaintype_parent_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype
    ADD CONSTRAINT org_domaintype_parent_id_key UNIQUE (parent_id);


--
-- Name: org_domaintype org_domaintype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype
    ADD CONSTRAINT org_domaintype_pkey PRIMARY KEY (id);


--
-- Name: org_domaintype org_domaintype_tree_id_code_name_4060f123_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype
    ADD CONSTRAINT org_domaintype_tree_id_code_name_4060f123_uniq UNIQUE (tree_id, code_name);


--
-- Name: org_domainuser org_domainuser_domain_id_user_id_bc18acc4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainuser
    ADD CONSTRAINT org_domainuser_domain_id_user_id_bc18acc4_uniq UNIQUE (domain_id, user_id);


--
-- Name: org_domainuser org_domainuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainuser
    ADD CONSTRAINT org_domainuser_pkey PRIMARY KEY (id);


--
-- Name: org_organizationdelegate org_organizationdelegate_organization_id_user_id_1d8ba049_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationdelegate
    ADD CONSTRAINT org_organizationdelegate_organization_id_user_id_1d8ba049_uniq UNIQUE (organization_id, user_id);


--
-- Name: org_organizationdelegate org_organizationdelegate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationdelegate
    ADD CONSTRAINT org_organizationdelegate_pkey PRIMARY KEY (id);


--
-- Name: org_organizationuser org_organizationuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationuser
    ADD CONSTRAINT org_organizationuser_pkey PRIMARY KEY (id);


--
-- Name: org_organizationuser org_organizationuser_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationuser
    ADD CONSTRAINT org_organizationuser_user_id_key UNIQUE (user_id);


--
-- Name: org_usernode org_usernode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_usernode
    ADD CONSTRAINT org_usernode_pkey PRIMARY KEY (id);


--
-- Name: patrol_algoconfig patrol_algoconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoconfig
    ADD CONSTRAINT patrol_algoconfig_pkey PRIMARY KEY (id);


--
-- Name: patrol_algoconfig patrol_algoconfig_target_id_waypoint_actio_249ae106_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoconfig
    ADD CONSTRAINT patrol_algoconfig_target_id_waypoint_actio_249ae106_uniq UNIQUE (target_id, waypoint_action, algo_id);


--
-- Name: patrol_algoreference patrol_algoreference_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoreference
    ADD CONSTRAINT patrol_algoreference_pkey PRIMARY KEY (id);


--
-- Name: patrol_building patrol_building_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_building
    ADD CONSTRAINT patrol_building_pkey PRIMARY KEY (id);


--
-- Name: patrol_detectiontask patrol_detectiontask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_detectiontask
    ADD CONSTRAINT patrol_detectiontask_pkey PRIMARY KEY (id);


--
-- Name: patrol_floor patrol_floor_floor_zone_id_building_id_2324cafb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_floor
    ADD CONSTRAINT patrol_floor_floor_zone_id_building_id_2324cafb_uniq UNIQUE (floor, zone_id, building_id);


--
-- Name: patrol_floor patrol_floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_floor
    ADD CONSTRAINT patrol_floor_pkey PRIMARY KEY (id);


--
-- Name: patrol_target patrol_target_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_target
    ADD CONSTRAINT patrol_target_pkey PRIMARY KEY (id);


--
-- Name: patrol_target patrol_target_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_target
    ADD CONSTRAINT patrol_target_uuid_key UNIQUE (uuid);


--
-- Name: perm_action perm_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_action
    ADD CONSTRAINT perm_action_pkey PRIMARY KEY (id);


--
-- Name: perm_action perm_action_resource_type_id_code_name_aa7743b3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_action
    ADD CONSTRAINT perm_action_resource_type_id_code_name_aa7743b3_uniq UNIQUE (resource_type_id, code_name);


--
-- Name: perm_resourcetype perm_resourcetype_code_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_resourcetype
    ADD CONSTRAINT perm_resourcetype_code_name_key UNIQUE (code_name);


--
-- Name: perm_resourcetype perm_resourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_resourcetype
    ADD CONSTRAINT perm_resourcetype_pkey PRIMARY KEY (id);


--
-- Name: perm_role perm_role_code_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role
    ADD CONSTRAINT perm_role_code_name_key UNIQUE (code_name);


--
-- Name: perm_role perm_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role
    ADD CONSTRAINT perm_role_pkey PRIMARY KEY (id);


--
-- Name: perm_role_users perm_role_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role_users
    ADD CONSTRAINT perm_role_users_pkey PRIMARY KEY (id);


--
-- Name: perm_role_users perm_role_users_role_id_user_id_beebea60_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role_users
    ADD CONSTRAINT perm_role_users_role_id_user_id_beebea60_uniq UNIQUE (role_id, user_id);


--
-- Name: perm_rolepolicy perm_rolepolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_rolepolicy
    ADD CONSTRAINT perm_rolepolicy_pkey PRIMARY KEY (id);


--
-- Name: push_notifications_apnsdevice push_notifications_apnsdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_apnsdevice
    ADD CONSTRAINT push_notifications_apnsdevice_pkey PRIMARY KEY (id);


--
-- Name: push_notifications_apnsdevice push_notifications_apnsdevice_registration_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_apnsdevice
    ADD CONSTRAINT push_notifications_apnsdevice_registration_id_key UNIQUE (registration_id);


--
-- Name: push_notifications_gcmdevice push_notifications_gcmdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_gcmdevice
    ADD CONSTRAINT push_notifications_gcmdevice_pkey PRIMARY KEY (id);


--
-- Name: push_notifications_wnsdevice push_notifications_wnsdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_wnsdevice
    ADD CONSTRAINT push_notifications_wnsdevice_pkey PRIMARY KEY (id);


--
-- Name: status_page_notification status_page_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_page_notification
    ADD CONSTRAINT status_page_notification_pkey PRIMARY KEY (id);


--
-- Name: status_page_systemstatus status_page_systemstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_page_systemstatus
    ADD CONSTRAINT status_page_systemstatus_pkey PRIMARY KEY (id);


--
-- Name: third_auth_thirdauthconf third_auth_thirdauthconf_organization_id_idp_name_64b4b747_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.third_auth_thirdauthconf
    ADD CONSTRAINT third_auth_thirdauthconf_organization_id_idp_name_64b4b747_uniq UNIQUE (organization_id, idp_name);


--
-- Name: third_auth_thirdauthconf third_auth_thirdauthconf_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.third_auth_thirdauthconf
    ADD CONSTRAINT third_auth_thirdauthconf_pkey PRIMARY KEY (id);


--
-- Name: wechat_wechatuser wechat_wechatuser_openid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wechat_wechatuser
    ADD CONSTRAINT wechat_wechatuser_openid_key UNIQUE (openid);


--
-- Name: wechat_wechatuser wechat_wechatuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wechat_wechatuser
    ADD CONSTRAINT wechat_wechatuser_pkey PRIMARY KEY (id);


--
-- Name: agreement_useragreement_agreement_id_5841d6c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agreement_useragreement_agreement_id_5841d6c8 ON public.agreement_useragreement USING btree (agreement_id);


--
-- Name: agreement_useragreement_user_id_4bf4dfad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agreement_useragreement_user_id_4bf4dfad ON public.agreement_useragreement USING btree (user_id);


--
-- Name: algorithm_algorithm_code_name_83213fad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_algorithm_code_name_83213fad_like ON public.algorithm_algorithm USING btree (code_name varchar_pattern_ops);


--
-- Name: algorithm_algorithm_name_2685a39c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_algorithm_name_2685a39c_like ON public.algorithm_algorithm USING btree (name varchar_pattern_ops);


--
-- Name: algorithm_algorithm_name_en_94b08c9f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_algorithm_name_en_94b08c9f_like ON public.algorithm_algorithm USING btree (name_en varchar_pattern_ops);


--
-- Name: algorithm_algorithm_name_zh_hans_3d5d509e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_algorithm_name_zh_hans_3d5d509e_like ON public.algorithm_algorithm USING btree (name_zh_hans varchar_pattern_ops);


--
-- Name: algorithm_eventtype_algorithm_id_86386090; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_eventtype_algorithm_id_86386090 ON public.algorithm_eventtype USING btree (algorithm_id);


--
-- Name: algorithm_eventtype_code_name_12f93b3d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_eventtype_code_name_12f93b3d_like ON public.algorithm_eventtype USING btree (code_name varchar_pattern_ops);


--
-- Name: algorithm_eventtype_name_en_fcbb113a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_eventtype_name_en_fcbb113a_like ON public.algorithm_eventtype USING btree (name_en varchar_pattern_ops);


--
-- Name: algorithm_eventtype_name_fe6e1e6d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_eventtype_name_fe6e1e6d_like ON public.algorithm_eventtype USING btree (name varchar_pattern_ops);


--
-- Name: algorithm_eventtype_name_zh_hans_0f7da53b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_eventtype_name_zh_hans_0f7da53b_like ON public.algorithm_eventtype USING btree (name_zh_hans varchar_pattern_ops);


--
-- Name: algorithm_productalgorithm_algorithm_id_809a127b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_productalgorithm_algorithm_id_809a127b ON public.algorithm_productalgorithm USING btree (algorithm_id);


--
-- Name: algorithm_productalgorithm_product_type_id_0b380ac5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX algorithm_productalgorithm_product_type_id_0b380ac5 ON public.algorithm_productalgorithm USING btree (product_type_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_email_1c89df09_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_email_1c89df09_like ON public.auth_user USING btree (email varchar_pattern_ops);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: back_cameraprefix_camera_provider_id_653e2832; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_cameraprefix_camera_provider_id_653e2832 ON public.back_cameraprefix USING btree (camera_provider_id);


--
-- Name: back_cameraprovider_brand_b5db487f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_cameraprovider_brand_b5db487f_like ON public.back_cameraprovider USING btree (brand varchar_pattern_ops);


--
-- Name: back_feedback_user_id_6dc30cf3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX back_feedback_user_id_6dc30cf3 ON public.back_feedback USING btree (user_id);


--
-- Name: bill_boxpayment_box_subs_id_f282dba4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_box_subs_id_f282dba4 ON public.bill_boxpayment USING btree (box_subs_id);


--
-- Name: bill_boxpayment_box_subs_id_f282dba4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_box_subs_id_f282dba4_like ON public.bill_boxpayment USING btree (box_subs_id varchar_pattern_ops);


--
-- Name: bill_boxpayment_client_id_db99ce81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_client_id_db99ce81 ON public.bill_boxpayment USING btree (client_id);


--
-- Name: bill_boxpayment_distributor_id_18dd7de7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_distributor_id_18dd7de7 ON public.bill_boxpayment USING btree (distributor_id);


--
-- Name: bill_boxpayment_employee_id_eac3e725; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_employee_id_eac3e725 ON public.bill_boxpayment USING btree (employee_id);


--
-- Name: bill_boxpayment_payment_id_21e7c81e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_payment_id_21e7c81e ON public.bill_boxpayment USING btree (payment_id);


--
-- Name: bill_boxpayment_seller_id_f5965140; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpayment_seller_id_f5965140 ON public.bill_boxpayment USING btree (seller_id);


--
-- Name: bill_boxpricing_user_id_a9b8ee66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxpricing_user_id_a9b8ee66 ON public.bill_boxpricing USING btree (user_id);


--
-- Name: bill_boxsubs_client_id_a8a588e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxsubs_client_id_a8a588e9 ON public.bill_boxsubs USING btree (client_id);


--
-- Name: bill_boxsubs_distributor_id_31291122; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxsubs_distributor_id_31291122 ON public.bill_boxsubs USING btree (distributor_id);


--
-- Name: bill_boxsubs_employee_id_0d175c3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxsubs_employee_id_0d175c3b ON public.bill_boxsubs USING btree (employee_id);


--
-- Name: bill_boxsubs_id_5aee4a7a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxsubs_id_5aee4a7a_like ON public.bill_boxsubs USING btree (id varchar_pattern_ops);


--
-- Name: bill_boxsubs_seller_id_a55c8fd1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_boxsubs_seller_id_a55c8fd1 ON public.bill_boxsubs USING btree (seller_id);


--
-- Name: bill_client_employee_id_ef54759d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_client_employee_id_ef54759d ON public.bill_client USING btree (employee_id);


--
-- Name: bill_client_seller_id_a9799738; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_client_seller_id_a9799738 ON public.bill_client USING btree (seller_id);


--
-- Name: bill_client_user_id_faea8c25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_client_user_id_faea8c25 ON public.bill_client USING btree (user_id);


--
-- Name: bill_customer_guard_company_id_58f07e10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_customer_guard_company_id_58f07e10 ON public.bill_customer USING btree (guard_company_id);


--
-- Name: bill_customer_stripe_id_18468a9c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_customer_stripe_id_18468a9c_like ON public.bill_customer USING btree (stripe_id varchar_pattern_ops);


--
-- Name: bill_employee_seller_id_d5e467a1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_employee_seller_id_d5e467a1 ON public.bill_employee USING btree (seller_id);


--
-- Name: bill_payment_customer_id_8b9bfb58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_payment_customer_id_8b9bfb58 ON public.bill_payment USING btree (customer_id);


--
-- Name: bill_payment_failed_at_14821166; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_payment_failed_at_14821166 ON public.bill_payment USING btree (failed_at);


--
-- Name: bill_pricing_type_bd072dea_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_pricing_type_bd072dea_like ON public.bill_pricing USING btree (type varchar_pattern_ops);


--
-- Name: bill_robotpayment_client_id_6a97131b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_client_id_6a97131b ON public.bill_robotpayment USING btree (client_id);


--
-- Name: bill_robotpayment_distributor_id_ff70ee08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_distributor_id_ff70ee08 ON public.bill_robotpayment USING btree (distributor_id);


--
-- Name: bill_robotpayment_employee_id_8a43563b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_employee_id_8a43563b ON public.bill_robotpayment USING btree (employee_id);


--
-- Name: bill_robotpayment_payment_id_ee696ac2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_payment_id_ee696ac2 ON public.bill_robotpayment USING btree (payment_id);


--
-- Name: bill_robotpayment_robot_subs_id_852b7358; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_robot_subs_id_852b7358 ON public.bill_robotpayment USING btree (robot_subs_id);


--
-- Name: bill_robotpayment_robot_subs_id_852b7358_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_robot_subs_id_852b7358_like ON public.bill_robotpayment USING btree (robot_subs_id varchar_pattern_ops);


--
-- Name: bill_robotpayment_seller_id_3c254093; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotpayment_seller_id_3c254093 ON public.bill_robotpayment USING btree (seller_id);


--
-- Name: bill_robotsubs_client_id_021aada5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotsubs_client_id_021aada5 ON public.bill_robotsubs USING btree (client_id);


--
-- Name: bill_robotsubs_distributor_id_58081570; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotsubs_distributor_id_58081570 ON public.bill_robotsubs USING btree (distributor_id);


--
-- Name: bill_robotsubs_employee_id_3c01ad69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotsubs_employee_id_3c01ad69 ON public.bill_robotsubs USING btree (employee_id);


--
-- Name: bill_robotsubs_id_8b933d04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotsubs_id_8b933d04_like ON public.bill_robotsubs USING btree (id varchar_pattern_ops);


--
-- Name: bill_robotsubs_seller_id_c49c3d73; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_robotsubs_seller_id_c49c3d73 ON public.bill_robotsubs USING btree (seller_id);


--
-- Name: bill_seller_distributor_id_b534b90e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_seller_distributor_id_b534b90e ON public.bill_seller USING btree (distributor_id);


--
-- Name: ccs_notifyinfo_box_id_8cc4577f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_notifyinfo_box_id_8cc4577f ON public.ccs_notifyinfo USING btree (box_id);


--
-- Name: ccs_notifyinfo_box_id_8cc4577f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_notifyinfo_box_id_8cc4577f_like ON public.ccs_notifyinfo USING btree (box_id varchar_pattern_ops);


--
-- Name: ccs_notifyinfo_camera_id_91e681f2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_notifyinfo_camera_id_91e681f2 ON public.ccs_notifyinfo USING btree (camera_id);


--
-- Name: ccs_notifyinfo_user_id_f2d50863; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_notifyinfo_user_id_f2d50863 ON public.ccs_notifyinfo USING btree (user_id);


--
-- Name: ccs_rawevent_box_id_69c738d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_box_id_69c738d4 ON public.ccs_rawevent USING btree (box_id);


--
-- Name: ccs_rawevent_box_id_69c738d4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_box_id_69c738d4_like ON public.ccs_rawevent USING btree (box_id varchar_pattern_ops);


--
-- Name: ccs_rawevent_camera_id_fbed59f1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_camera_id_fbed59f1 ON public.ccs_rawevent USING btree (camera_id);


--
-- Name: ccs_rawevent_org_id_ba80432f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_org_id_ba80432f ON public.ccs_rawevent USING btree (org_id);


--
-- Name: ccs_rawevent_site_id_414bbf54; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_site_id_414bbf54 ON public.ccs_rawevent USING btree (site_id);


--
-- Name: ccs_rawevent_user_id_2b54e743; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_rawevent_user_id_2b54e743 ON public.ccs_rawevent USING btree (user_id);


--
-- Name: ccs_sample_camera_id_b9732e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_sample_camera_id_b9732e7d ON public.ccs_sample USING btree (camera_id);


--
-- Name: ccs_sample_started_at_203962ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_sample_started_at_203962ef ON public.ccs_sample USING btree (started_at);


--
-- Name: ccs_sample_user_id_c6ba5a2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_sample_user_id_c6ba5a2c ON public.ccs_sample USING btree (user_id);


--
-- Name: ccs_usersite_site_id_5285a0f0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_usersite_site_id_5285a0f0 ON public.ccs_usersite USING btree (site_id);


--
-- Name: ccs_usersite_user_id_f988e9ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ccs_usersite_user_id_f988e9ab ON public.ccs_usersite USING btree (user_id);


--
-- Name: channel_forwardaction_action_id_cf3b6dbb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX channel_forwardaction_action_id_cf3b6dbb ON public.channel_forwardaction USING btree (action_id);


--
-- Name: channel_forwardaction_resource_type_id_8ba234f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX channel_forwardaction_resource_type_id_8ba234f7 ON public.channel_forwardaction USING btree (resource_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: face_eventandtrackingobject_event_id_f50b3304; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_eventandtrackingobject_event_id_f50b3304 ON public.face_eventandtrackingobject USING btree (event_id);


--
-- Name: face_eventandtrackingobject_tracking_object_id_91470430; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_eventandtrackingobject_tracking_object_id_91470430 ON public.face_eventandtrackingobject USING btree (tracking_object_id);


--
-- Name: face_face_lib_id_b7aca93a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_face_lib_id_b7aca93a ON public.face_face USING btree (lib_id);


--
-- Name: face_face_tracking_object_id_b5f6d03d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_face_tracking_object_id_b5f6d03d ON public.face_face USING btree (tracking_object_id);


--
-- Name: face_facelib_organization_id_06074721; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_facelib_organization_id_06074721 ON public.face_facelib USING btree (organization_id);


--
-- Name: face_group_organization_id_26bc67e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_group_organization_id_26bc67e7 ON public.face_group USING btree (organization_id);


--
-- Name: face_group_parent_id_6ca7b914; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_group_parent_id_6ca7b914 ON public.face_group USING btree (parent_id);


--
-- Name: face_groupuser_group_id_1b30fbd3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_groupuser_group_id_1b30fbd3 ON public.face_groupuser USING btree (group_id);


--
-- Name: face_groupuser_user_id_610d0694; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_groupuser_user_id_610d0694 ON public.face_groupuser USING btree (user_id);


--
-- Name: face_humancountmediafile_human_count_info_id_8e0522cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_humancountmediafile_human_count_info_id_8e0522cc ON public.face_humancountmediafile USING btree (human_count_info_id);


--
-- Name: face_questionnaire_user_id_ebc869a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_questionnaire_user_id_ebc869a2 ON public.face_questionnaire USING btree (user_id);


--
-- Name: face_questionnaireresult_questionnaire_id_10eec108; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_questionnaireresult_questionnaire_id_10eec108 ON public.face_questionnaireresult USING btree (questionnaire_id);


--
-- Name: face_trackingobject_group_id_31008f2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_trackingobject_group_id_31008f2e ON public.face_trackingobject USING btree (group_id);


--
-- Name: face_trackingobject_organization_id_9fad20a9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_trackingobject_organization_id_9fad20a9 ON public.face_trackingobject USING btree (organization_id);


--
-- Name: face_trackingobject_site_id_5c69e1fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX face_trackingobject_site_id_5c69e1fe ON public.face_trackingobject USING btree (site_id);


--
-- Name: guard_beatjob_task_type_task_status_expection_time_610789d8_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_beatjob_task_type_task_status_expection_time_610789d8_idx ON public.guard_beatjob USING btree (task_type, task_status, expection_time);


--
-- Name: guard_case_customer_id_b413b594; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_customer_id_b413b594 ON public.guard_case USING btree (customer_id);


--
-- Name: guard_case_guard_id_e1aaf730; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_guard_id_e1aaf730 ON public.guard_case USING btree (guard_id);


--
-- Name: guard_case_incident_id_d6fd0954_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_incident_id_d6fd0954_like ON public.guard_case USING btree (incident_id varchar_pattern_ops);


--
-- Name: guard_case_operator_id_642df3bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_operator_id_642df3bd ON public.guard_case USING btree (operator_id);


--
-- Name: guard_case_robot_id_94c7371e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_robot_id_94c7371e ON public.guard_case USING btree (robot_id);


--
-- Name: guard_case_robot_id_94c7371e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_case_robot_id_94c7371e_like ON public.guard_case USING btree (robot_id varchar_pattern_ops);


--
-- Name: guard_caseexportconfig_user_id_0c5a8b89; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_caseexportconfig_user_id_0c5a8b89 ON public.guard_caseexportconfig USING btree (user_id);


--
-- Name: guard_caseexportrecord_export_config_id_6ce0ae68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_caseexportrecord_export_config_id_6ce0ae68 ON public.guard_caseexportrecord USING btree (export_config_id);


--
-- Name: guard_casehistory_case_id_8a991eca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_casehistory_case_id_8a991eca ON public.guard_casehistory USING btree (case_id);


--
-- Name: guard_casehistory_robot_id_27c97348; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_casehistory_robot_id_27c97348 ON public.guard_casehistory USING btree (robot_id);


--
-- Name: guard_casehistory_robot_id_27c97348_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_casehistory_robot_id_27c97348_like ON public.guard_casehistory USING btree (robot_id varchar_pattern_ops);


--
-- Name: guard_casehistory_user_id_9a9ee216; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_casehistory_user_id_9a9ee216 ON public.guard_casehistory USING btree (user_id);


--
-- Name: guard_casemedium_case_id_efdeb28e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_casemedium_case_id_efdeb28e ON public.guard_casemedium USING btree (case_id);


--
-- Name: guard_guard_organization_id_d4d69dd6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_guard_organization_id_d4d69dd6 ON public.guard_guard USING btree (organization_id);


--
-- Name: guard_guardadmin_organization_id_307f8098; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_guardadmin_organization_id_307f8098 ON public.guard_guardadmin USING btree (organization_id);


--
-- Name: guard_incident_id_8469c241_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_incident_id_8469c241_like ON public.guard_incident USING btree (id varchar_pattern_ops);


--
-- Name: guard_monitoringoperator_organization_id_9cd0dee1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_monitoringoperator_organization_id_9cd0dee1 ON public.guard_monitoringoperator USING btree (organization_id);


--
-- Name: guard_note_case_id_dac38bb4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_note_case_id_dac38bb4 ON public.guard_note USING btree (case_id);


--
-- Name: guard_note_user_id_22b8ff3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_note_user_id_22b8ff3b ON public.guard_note USING btree (user_id);


--
-- Name: guard_siteoperation_guard_company_id_73213803; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_siteoperation_guard_company_id_73213803 ON public.guard_siteoperation USING btree (guard_company_id);


--
-- Name: guard_siteoperation_operator_id_9b8773eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_siteoperation_operator_id_9b8773eb ON public.guard_siteoperation USING btree (operator_id);


--
-- Name: guard_siteoperation_site_id_7b3c4a03; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guard_siteoperation_site_id_7b3c4a03 ON public.guard_siteoperation USING btree (site_id);


--
-- Name: idx_routine_state_synced_execution; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_routine_state_synced_execution ON public.logic_inspection USING btree (routine_execution_id) WHERE (routine_state_synced = false);


--
-- Name: idx_routine_state_synced_states_execution; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_routine_state_synced_states_execution ON public.logic_inspection USING btree (routine_execution_id) WHERE ((routine_state_synced = true) AND ((routine_state)::text = ANY (ARRAY[(''::character varying)::text, ('succeeded'::character varying)::text])));


--
-- Name: idx_site_serial_unq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_site_serial_unq ON public.patrol_target USING btree (site_id, serial_no) WHERE visible;


--
-- Name: logic_agent_user_id_3fad632a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_agent_user_id_3fad632a ON public.logic_agent USING btree (user_id);


--
-- Name: logic_box_id_709f81e5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_box_id_709f81e5_like ON public.logic_box USING btree (id varchar_pattern_ops);


--
-- Name: logic_box_site_id_92559395; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_box_site_id_92559395 ON public.logic_box USING btree (site_id);


--
-- Name: logic_box_user_id_6e492d88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_box_user_id_6e492d88 ON public.logic_box USING btree (user_id);


--
-- Name: logic_boxlocation_box_id_5b7ba4da_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_boxlocation_box_id_5b7ba4da_like ON public.logic_boxlocation USING btree (box_id varchar_pattern_ops);


--
-- Name: logic_camera_box_id_7d74ceeb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_box_id_7d74ceeb ON public.logic_camera USING btree (box_id);


--
-- Name: logic_camera_box_id_7d74ceeb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_box_id_7d74ceeb_like ON public.logic_camera USING btree (box_id varchar_pattern_ops);


--
-- Name: logic_camera_firmware_version_id_b7d80e6b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_firmware_version_id_b7d80e6b ON public.logic_camera USING btree (firmware_version_id);


--
-- Name: logic_camera_mac_address_c2713116_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_mac_address_c2713116_like ON public.logic_camera USING btree (mac_address varchar_pattern_ops);


--
-- Name: logic_camera_raw_address_cce6c9d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_raw_address_cce6c9d9 ON public.logic_camera USING btree (raw_address);


--
-- Name: logic_camera_raw_address_cce6c9d9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_raw_address_cce6c9d9_like ON public.logic_camera USING btree (raw_address varchar_pattern_ops);


--
-- Name: logic_camera_user_id_888eb677; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camera_user_id_888eb677 ON public.logic_camera USING btree (user_id);


--
-- Name: logic_camerafirmwareversion_version_b768fe3f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camerafirmwareversion_version_b768fe3f_like ON public.logic_camerafirmwareversion USING btree (version varchar_pattern_ops);


--
-- Name: logic_cameralocation_camera_id_2099320c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_cameralocation_camera_id_2099320c ON public.logic_cameralocation USING btree (camera_id);


--
-- Name: logic_camerasavedvideo_camera_id_052703e2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_camerasavedvideo_camera_id_052703e2 ON public.logic_camerasavedvideo USING btree (camera_id);


--
-- Name: logic_cameratrackingobject_camera_id_e9068705; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_cameratrackingobject_camera_id_e9068705 ON public.logic_cameratrackingobject USING btree (camera_id);


--
-- Name: logic_cameratrackingobject_tracking_object_id_24907433; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_cameratrackingobject_tracking_object_id_24907433 ON public.logic_cameratrackingobject USING btree (tracking_object_id);


--
-- Name: logic_cameravideo_camera_id_1de87d50; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_cameravideo_camera_id_1de87d50 ON public.logic_cameravideo USING btree (camera_id);


--
-- Name: logic_cameravideo_started_at_aab01478; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_cameravideo_started_at_aab01478 ON public.logic_cameravideo USING btree (started_at);


--
-- Name: logic_customizedalgorithm_algorithm_id_81e557e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_customizedalgorithm_algorithm_id_81e557e4 ON public.logic_customizedalgorithm USING btree (algorithm_id);


--
-- Name: logic_customizedalgorithm_organization_id_67ecdfee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_customizedalgorithm_organization_id_67ecdfee ON public.logic_customizedalgorithm USING btree (organization_id);


--
-- Name: logic_customizedeventtype_customized_algorithm_id_46ab161a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_customizedeventtype_customized_algorithm_id_46ab161a ON public.logic_customizedeventtype USING btree (customized_algorithm_id);


--
-- Name: logic_customizedeventtype_event_type_id_c9624905; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_customizedeventtype_event_type_id_c9624905 ON public.logic_customizedeventtype USING btree (event_type_id);


--
-- Name: logic_customizedeventtype_organization_id_9294846d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_customizedeventtype_organization_id_9294846d ON public.logic_customizedeventtype USING btree (organization_id);


--
-- Name: logic_departmentmanager_customer_id_81837092; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_departmentmanager_customer_id_81837092 ON public.logic_departmentmanager USING btree (customer_id);


--
-- Name: logic_devicekey_id_7a010995_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_devicekey_id_7a010995_like ON public.logic_devicekey USING btree (id varchar_pattern_ops);


--
-- Name: logic_devicekey_public_key_33a29b0d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_devicekey_public_key_33a29b0d_like ON public.logic_devicekey USING btree (public_key varchar_pattern_ops);


--
-- Name: logic_event_camera_id_08634625; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_camera_id_08634625 ON public.logic_event USING btree (camera_id);


--
-- Name: logic_event_robot_id_87b504fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_robot_id_87b504fc ON public.logic_event USING btree (robot_id);


--
-- Name: logic_event_robot_id_87b504fc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_robot_id_87b504fc_like ON public.logic_event USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_event_site_id_dc0d6829; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_site_id_dc0d6829 ON public.logic_event USING btree (site_id);


--
-- Name: logic_event_started_at_3f73dec2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_started_at_3f73dec2 ON public.logic_event USING btree (started_at);


--
-- Name: logic_event_tracking_object_id_f394635c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_event_tracking_object_id_f394635c ON public.logic_event USING btree (tracking_object_id);


--
-- Name: logic_eventbackup_camera_id_d8c8f50f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_eventbackup_camera_id_d8c8f50f ON public.logic_eventbackup USING btree (camera_id);


--
-- Name: logic_eventbackup_robot_id_88908c61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_eventbackup_robot_id_88908c61 ON public.logic_eventbackup USING btree (robot_id);


--
-- Name: logic_eventbackup_robot_id_88908c61_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_eventbackup_robot_id_88908c61_like ON public.logic_eventbackup USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_eventbackup_started_at_e9940c2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_eventbackup_started_at_e9940c2e ON public.logic_eventbackup USING btree (started_at);


--
-- Name: logic_inspection_robot_id_47b675ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_robot_id_47b675ae ON public.logic_inspection USING btree (robot_id);


--
-- Name: logic_inspection_robot_id_47b675ae_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_robot_id_47b675ae_like ON public.logic_inspection USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_inspection_routine_execution_id_ae780392; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_routine_execution_id_ae780392 ON public.logic_inspection USING btree (routine_execution_id);


--
-- Name: logic_inspection_routine_execution_id_ae780392_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_routine_execution_id_ae780392_like ON public.logic_inspection USING btree (routine_execution_id varchar_pattern_ops);


--
-- Name: logic_inspection_site_id_ab0e49ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_site_id_ab0e49ee ON public.logic_inspection USING btree (site_id);


--
-- Name: logic_inspection_started_at_dad76632; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_started_at_dad76632 ON public.logic_inspection USING btree (started_at);


--
-- Name: logic_inspection_started_at_robot_id_12f6fb2e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_started_at_robot_id_12f6fb2e_idx ON public.logic_inspection USING btree (started_at, robot_id);


--
-- Name: logic_inspection_target_id_a19b4c3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_target_id_a19b4c3b ON public.logic_inspection USING btree (target_id);


--
-- Name: logic_inspection_uuid_7b8437b8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspection_uuid_7b8437b8_like ON public.logic_inspection USING btree (uuid varchar_pattern_ops);


--
-- Name: logic_inspectmedium_inspection_id_d2844bcb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_inspectmedium_inspection_id_d2844bcb ON public.logic_inspectmedium USING btree (inspection_id);


--
-- Name: logic_invitation_id_7ecc5147_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_invitation_id_7ecc5147_like ON public.logic_invitation USING btree (id varchar_pattern_ops);


--
-- Name: logic_ipwhitelist_user_id_ec3911a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_ipwhitelist_user_id_ec3911a7 ON public.logic_ipwhitelist USING btree (user_id);


--
-- Name: logic_locationeventblacklist_event_type_id_90c1e504; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_locationeventblacklist_event_type_id_90c1e504 ON public.logic_locationeventblacklist USING btree (event_type_id);


--
-- Name: logic_manualcleanuptask_organization_id_afb613e8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_manualcleanuptask_organization_id_afb613e8 ON public.logic_manualcleanuptask USING btree (organization_id);


--
-- Name: logic_manualcleanuptask_user_id_1b6febe7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_manualcleanuptask_user_id_1b6febe7 ON public.logic_manualcleanuptask USING btree (user_id);


--
-- Name: logic_medium_event_id_21a4448f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_medium_event_id_21a4448f ON public.logic_medium USING btree (event_id);


--
-- Name: logic_mediumbackup_event_id_b9df7e3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_mediumbackup_event_id_b9df7e3d ON public.logic_mediumbackup USING btree (event_id);


--
-- Name: logic_notifyrule_box_id_id_fcccb246; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_notifyrule_box_id_id_fcccb246 ON public.logic_notifyrule USING btree (box_id);


--
-- Name: logic_notifyrule_box_id_id_fcccb246_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_notifyrule_box_id_id_fcccb246_like ON public.logic_notifyrule USING btree (box_id varchar_pattern_ops);


--
-- Name: logic_notifyrule_camera_id_id_2e241bc6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_notifyrule_camera_id_id_2e241bc6 ON public.logic_notifyrule USING btree (camera_id);


--
-- Name: logic_notifyrule_organization_id_a10800f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_notifyrule_organization_id_a10800f9 ON public.logic_notifyrule USING btree (organization_id);


--
-- Name: logic_notifyrule_site_id_id_6c8cf794; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_notifyrule_site_id_id_6c8cf794 ON public.logic_notifyrule USING btree (site_id);


--
-- Name: logic_organization_code_name_b6264444_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_organization_code_name_b6264444_like ON public.logic_organization USING btree (code_name varchar_pattern_ops);


--
-- Name: logic_organizationuistrategy_strategy_id_a1562eec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_organizationuistrategy_strategy_id_a1562eec ON public.logic_organizationuistrategy USING btree (strategy_id);


--
-- Name: logic_patrol_route_id_3143dc11; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_patrol_route_id_3143dc11 ON public.logic_patrol USING btree (route_id);


--
-- Name: logic_robot_id_aff2cacc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robot_id_aff2cacc_like ON public.logic_robot USING btree (id varchar_pattern_ops);


--
-- Name: logic_robot_site_id_77281918; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robot_site_id_77281918 ON public.logic_robot USING btree (site_id);


--
-- Name: logic_robot_user_id_98fcd8c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robot_user_id_98fcd8c8 ON public.logic_robot USING btree (user_id);


--
-- Name: logic_robotsavedvideo_robot_id_fa69c6b7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotsavedvideo_robot_id_fa69c6b7 ON public.logic_robotsavedvideo USING btree (robot_id);


--
-- Name: logic_robotsavedvideo_robot_id_fa69c6b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotsavedvideo_robot_id_fa69c6b7_like ON public.logic_robotsavedvideo USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_robotsnap_robot_id_8a80d523; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotsnap_robot_id_8a80d523 ON public.logic_robotsnap USING btree (robot_id);


--
-- Name: logic_robotsnap_robot_id_8a80d523_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotsnap_robot_id_8a80d523_like ON public.logic_robotsnap USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_robotsnap_timestamp_d6d9a112; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotsnap_timestamp_d6d9a112 ON public.logic_robotsnap USING btree ("timestamp");


--
-- Name: logic_robotvideo_robot_id_4c72f3a3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotvideo_robot_id_4c72f3a3 ON public.logic_robotvideo USING btree (robot_id);


--
-- Name: logic_robotvideo_robot_id_4c72f3a3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotvideo_robot_id_4c72f3a3_like ON public.logic_robotvideo USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_robotvideo_started_at_b1c0226d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_robotvideo_started_at_b1c0226d ON public.logic_robotvideo USING btree (started_at);


--
-- Name: logic_route_user_id_b38935f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_route_user_id_b38935f5 ON public.logic_route USING btree (user_id);


--
-- Name: logic_rule_algo_44bafd04; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_rule_algo_44bafd04 ON public.logic_rule USING btree (algo);


--
-- Name: logic_rule_algo_44bafd04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_rule_algo_44bafd04_like ON public.logic_rule USING btree (algo varchar_pattern_ops);


--
-- Name: logic_rule_camera_id_ad3f43fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_rule_camera_id_ad3f43fc ON public.logic_rule USING btree (camera_id);


--
-- Name: logic_sharing_camera_saved_video_id_52fa6d28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sharing_camera_saved_video_id_52fa6d28 ON public.logic_sharing USING btree (camera_saved_video_id);


--
-- Name: logic_sharing_organization_id_cac25d86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sharing_organization_id_cac25d86 ON public.logic_sharing USING btree (organization_id);


--
-- Name: logic_sharing_site_id_f38cae91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sharing_site_id_f38cae91 ON public.logic_sharing USING btree (site_id);


--
-- Name: logic_sharing_user_id_545252c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sharing_user_id_545252c3 ON public.logic_sharing USING btree (user_id);


--
-- Name: logic_site_customer_id_5788762b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_site_customer_id_5788762b ON public.logic_site USING btree (customer_id);


--
-- Name: logic_sitemanagement_site_id_74e55fba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sitemanagement_site_id_74e55fba ON public.logic_sitemanagement USING btree (site_id);


--
-- Name: logic_sitemanagement_site_manager_id_822984cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sitemanagement_site_manager_id_822984cc ON public.logic_sitemanagement USING btree (site_manager_id);


--
-- Name: logic_sitemanager_customer_id_94c0d3fa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_sitemanager_customer_id_94c0d3fa ON public.logic_sitemanager USING btree (customer_id);


--
-- Name: logic_snap_camera_id_8f14add3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_snap_camera_id_8f14add3 ON public.logic_snap USING btree (camera_id);


--
-- Name: logic_snap_timestamp_6e41139e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_snap_timestamp_6e41139e ON public.logic_snap USING btree ("timestamp");


--
-- Name: logic_task_polymorphic_ctype_id_d3657b17; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_task_polymorphic_ctype_id_d3657b17 ON public.logic_task USING btree (polymorphic_ctype_id);


--
-- Name: logic_task_robot_id_4f24345f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_task_robot_id_4f24345f ON public.logic_task USING btree (robot_id);


--
-- Name: logic_task_robot_id_4f24345f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_task_robot_id_4f24345f_like ON public.logic_task USING btree (robot_id varchar_pattern_ops);


--
-- Name: logic_thermalcamerasettings_camera_id_06bea220; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_thermalcamerasettings_camera_id_06bea220 ON public.logic_thermalcamerasettings USING btree (camera_id);


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord_user_id_5f5b87d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_thermalcamerasettingsbatchupdaterecord_user_id_5f5b87d4 ON public.logic_thermalcamerasettingsbatchupdaterecord USING btree (user_id);


--
-- Name: logic_thermalcamerasettingscheckrecord_user_id_8be351fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_thermalcamerasettingscheckrecord_user_id_8be351fb ON public.logic_thermalcamerasettingscheckrecord USING btree (user_id);


--
-- Name: logic_uistrategy_name_4c645e30_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_uistrategy_name_4c645e30_like ON public.logic_uistrategy USING btree (name varchar_pattern_ops);


--
-- Name: logic_waypoint_site_id_5f7114bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_waypoint_site_id_5f7114bd ON public.logic_waypoint USING btree (site_id);


--
-- Name: logic_waypointhistory_way_point_id_28c83439; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX logic_waypointhistory_way_point_id_28c83439 ON public.logic_waypointhistory USING btree (way_point_id);


--
-- Name: mapping_map_map_config_id_469220ba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_map_map_config_id_469220ba ON public.mapping_map USING btree (map_config_id);


--
-- Name: mapping_mapconfig_organization_id_77cb33ec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_mapconfig_organization_id_77cb33ec ON public.mapping_mapconfig USING btree (organization_id);


--
-- Name: mapping_maptarget_map_id_3d0c640e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_maptarget_map_id_3d0c640e ON public.mapping_maptarget USING btree (map_id);


--
-- Name: mapping_maptarget_target_id_7bd25e75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_maptarget_target_id_7bd25e75 ON public.mapping_maptarget USING btree (target_id);


--
-- Name: mapping_sitemap_map_id_b4a6733c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_sitemap_map_id_b4a6733c ON public.mapping_sitemap USING btree (map_id);


--
-- Name: mapping_sitemap_site_id_0d0ceb21; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_sitemap_site_id_0d0ceb21 ON public.mapping_sitemap USING btree (site_id);


--
-- Name: mapping_target_robot_id_dfe2d677_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mapping_target_robot_id_dfe2d677_like ON public.mapping_target USING btree (robot_id varchar_pattern_ops);


--
-- Name: monitor_center_customalgo_camera_id_ebc6409a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_customalgo_camera_id_ebc6409a ON public.monitor_center_customalgo USING btree (camera_id);


--
-- Name: monitor_center_customalgo_site_id_5e4fc74c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_customalgo_site_id_5e4fc74c ON public.monitor_center_customalgo USING btree (site_id);


--
-- Name: monitor_center_customalgonotify_site_id_8925b6bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_customalgonotify_site_id_8925b6bf ON public.monitor_center_customalgonotify USING btree (site_id);


--
-- Name: monitor_center_device_device_id_5e88f487_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_device_device_id_5e88f487_like ON public.monitor_center_device USING btree (device_id varchar_pattern_ops);


--
-- Name: monitor_center_device_user_id_27d122d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_device_user_id_27d122d0 ON public.monitor_center_device USING btree (user_id);


--
-- Name: monitor_center_eventext_event_id_d86ea865; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_eventext_event_id_d86ea865 ON public.monitor_center_eventext USING btree (event_id);


--
-- Name: monitor_center_fmevent_id_daa2cce5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_fmevent_id_daa2cce5_like ON public.monitor_center_fmevent USING btree (id varchar_pattern_ops);


--
-- Name: monitor_center_robotinci_incident_id_88ea011e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotinci_incident_id_88ea011e_like ON public.monitor_center_robotincidentnotifyrecord USING btree (incident_id varchar_pattern_ops);


--
-- Name: monitor_center_robotincidentnotifyrecord_incident_id_88ea011e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotincidentnotifyrecord_incident_id_88ea011e ON public.monitor_center_robotincidentnotifyrecord USING btree (incident_id);


--
-- Name: monitor_center_robotincidentnotifyrecord_robot_id_4d4ff3aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotincidentnotifyrecord_robot_id_4d4ff3aa ON public.monitor_center_robotincidentnotifyrecord USING btree (robot_id);


--
-- Name: monitor_center_robotincidentnotifyrecord_robot_id_4d4ff3aa_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotincidentnotifyrecord_robot_id_4d4ff3aa_like ON public.monitor_center_robotincidentnotifyrecord USING btree (robot_id varchar_pattern_ops);


--
-- Name: monitor_center_robotincidentnotifyrecord_user_id_6f6f312d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotincidentnotifyrecord_user_id_6f6f312d ON public.monitor_center_robotincidentnotifyrecord USING btree (user_id);


--
-- Name: monitor_center_robotnotifier_robot_id_3abb2eda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotnotifier_robot_id_3abb2eda ON public.monitor_center_robotnotifier USING btree (robot_id);


--
-- Name: monitor_center_robotnotifier_robot_id_3abb2eda_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotnotifier_robot_id_3abb2eda_like ON public.monitor_center_robotnotifier USING btree (robot_id varchar_pattern_ops);


--
-- Name: monitor_center_robotnotifier_user_id_df599730; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_robotnotifier_user_id_df599730 ON public.monitor_center_robotnotifier USING btree (user_id);


--
-- Name: monitor_center_rule_channel_id_2db50c4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_rule_channel_id_2db50c4b ON public.monitor_center_rule USING btree (channel_id);


--
-- Name: monitor_center_sitefloorvideo_new_floor_id_6dba2fe9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_sitefloorvideo_new_floor_id_6dba2fe9 ON public.monitor_center_sitefloorvideo USING btree (new_floor_id);


--
-- Name: monitor_center_sitefloorvideo_site_id_73112c0c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_sitefloorvideo_site_id_73112c0c ON public.monitor_center_sitefloorvideo USING btree (site_id);


--
-- Name: monitor_center_userext_business_id_aa73cc9c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX monitor_center_userext_business_id_aa73cc9c ON public.monitor_center_userext USING btree (business_id);


--
-- Name: org_domain_domain_type_id_e8f2ab15; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domain_domain_type_id_e8f2ab15 ON public.org_domain USING btree (domain_type_id);


--
-- Name: org_domain_organization_id_81c4ef80; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domain_organization_id_81c4ef80 ON public.org_domain USING btree (organization_id);


--
-- Name: org_domain_parent_id_1831af05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domain_parent_id_1831af05 ON public.org_domain USING btree (parent_id);


--
-- Name: org_domain_tree_id_ce627f86; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domain_tree_id_ce627f86 ON public.org_domain USING btree (tree_id);


--
-- Name: org_domainsite_domain_id_e4685140; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domainsite_domain_id_e4685140 ON public.org_domainsite USING btree (domain_id);


--
-- Name: org_domainsite_site_id_5b1f60aa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domainsite_site_id_5b1f60aa ON public.org_domainsite USING btree (site_id);


--
-- Name: org_domaintype_organization_id_83b5ab25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domaintype_organization_id_83b5ab25 ON public.org_domaintype USING btree (organization_id);


--
-- Name: org_domaintype_tree_id_996dd308; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domaintype_tree_id_996dd308 ON public.org_domaintype USING btree (tree_id);


--
-- Name: org_domainuser_domain_id_58ae6b98; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domainuser_domain_id_58ae6b98 ON public.org_domainuser USING btree (domain_id);


--
-- Name: org_domainuser_user_id_ad810ab2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_domainuser_user_id_ad810ab2 ON public.org_domainuser USING btree (user_id);


--
-- Name: org_organizationdelegate_organization_id_3bf1b4d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_organizationdelegate_organization_id_3bf1b4d2 ON public.org_organizationdelegate USING btree (organization_id);


--
-- Name: org_organizationdelegate_user_id_b7442d9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_organizationdelegate_user_id_b7442d9f ON public.org_organizationdelegate USING btree (user_id);


--
-- Name: org_organizationuser_organization_id_86194f85; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_organizationuser_organization_id_86194f85 ON public.org_organizationuser USING btree (organization_id);


--
-- Name: org_usernode_parent_id_ee9cc191; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_usernode_parent_id_ee9cc191 ON public.org_usernode USING btree (parent_id);


--
-- Name: org_usernode_tree_id_15f63e43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_usernode_tree_id_15f63e43 ON public.org_usernode USING btree (tree_id);


--
-- Name: org_usernode_user_id_8108b655; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX org_usernode_user_id_8108b655 ON public.org_usernode USING btree (user_id);


--
-- Name: patrol_algoconfig_algo_id_f18ee31c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_algoconfig_algo_id_f18ee31c ON public.patrol_algoconfig USING btree (algo_id);


--
-- Name: patrol_algoconfig_target_id_71656a75; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_algoconfig_target_id_71656a75 ON public.patrol_algoconfig USING btree (target_id);


--
-- Name: patrol_algoreference_algo_config_id_daa44606; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_algoreference_algo_config_id_daa44606 ON public.patrol_algoreference USING btree (algo_config_id);


--
-- Name: patrol_algoreference_map_id_route_id_algo_con_107537bc_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_algoreference_map_id_route_id_algo_con_107537bc_idx ON public.patrol_algoreference USING btree (map_id, route_id, algo_config_id);


--
-- Name: patrol_building_site_id_8ae79087; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_building_site_id_8ae79087 ON public.patrol_building USING btree (site_id);


--
-- Name: patrol_detectiontask_inspection_id_68f75531; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_detectiontask_inspection_id_68f75531 ON public.patrol_detectiontask USING btree (inspection_id);


--
-- Name: patrol_detectiontask_review_status_id_b4f64b83_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_detectiontask_review_status_id_b4f64b83_idx ON public.patrol_detectiontask USING btree (review_status, id);


--
-- Name: patrol_detectiontask_target_id_26f70461; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_detectiontask_target_id_26f70461 ON public.patrol_detectiontask USING btree (target_id);


--
-- Name: patrol_floor_building_id_58c720d3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_floor_building_id_58c720d3 ON public.patrol_floor USING btree (building_id);


--
-- Name: patrol_floor_map_id_858f7b3e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_floor_map_id_858f7b3e ON public.patrol_floor USING btree (map_id);


--
-- Name: patrol_target_new_floor_id_675d67c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_target_new_floor_id_675d67c8 ON public.patrol_target USING btree (new_floor_id);


--
-- Name: patrol_target_site_id_51f276d4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_target_site_id_51f276d4 ON public.patrol_target USING btree (site_id);


--
-- Name: patrol_target_uuid_18420a04_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patrol_target_uuid_18420a04_like ON public.patrol_target USING btree (uuid varchar_pattern_ops);


--
-- Name: perm_action_resource_type_id_1423fc2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_action_resource_type_id_1423fc2a ON public.perm_action USING btree (resource_type_id);


--
-- Name: perm_resourcetype_code_name_81f9b9a3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_resourcetype_code_name_81f9b9a3_like ON public.perm_resourcetype USING btree (code_name varchar_pattern_ops);


--
-- Name: perm_role_code_name_b2505ea0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_role_code_name_b2505ea0_like ON public.perm_role USING btree (code_name varchar_pattern_ops);


--
-- Name: perm_role_users_role_id_e0485dc6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_role_users_role_id_e0485dc6 ON public.perm_role_users USING btree (role_id);


--
-- Name: perm_role_users_user_id_fba02434; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_role_users_user_id_fba02434 ON public.perm_role_users USING btree (user_id);


--
-- Name: perm_rolepolicy_actions_93fb7b2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_rolepolicy_actions_93fb7b2e ON public.perm_rolepolicy USING btree (actions);


--
-- Name: perm_rolepolicy_resource_type_id_41fb74de; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_rolepolicy_resource_type_id_41fb74de ON public.perm_rolepolicy USING btree (resource_type_id);


--
-- Name: perm_rolepolicy_role_id_ab4c12cc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX perm_rolepolicy_role_id_ab4c12cc ON public.perm_rolepolicy USING btree (role_id);


--
-- Name: push_notifications_apnsdevice_device_id_0ac3cde3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_apnsdevice_device_id_0ac3cde3 ON public.push_notifications_apnsdevice USING btree (device_id);


--
-- Name: push_notifications_apnsdevice_registration_id_5502bc8c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_apnsdevice_registration_id_5502bc8c_like ON public.push_notifications_apnsdevice USING btree (registration_id varchar_pattern_ops);


--
-- Name: push_notifications_apnsdevice_user_id_44cc44d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_apnsdevice_user_id_44cc44d2 ON public.push_notifications_apnsdevice USING btree (user_id);


--
-- Name: push_notifications_gcmdevice_device_id_0b22a9c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_gcmdevice_device_id_0b22a9c4 ON public.push_notifications_gcmdevice USING btree (device_id);


--
-- Name: push_notifications_gcmdevice_user_id_f3752f1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_gcmdevice_user_id_f3752f1b ON public.push_notifications_gcmdevice USING btree (user_id);


--
-- Name: push_notifications_wnsdevice_device_id_7e1c24c4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_wnsdevice_device_id_7e1c24c4 ON public.push_notifications_wnsdevice USING btree (device_id);


--
-- Name: push_notifications_wnsdevice_user_id_670eff0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX push_notifications_wnsdevice_user_id_670eff0d ON public.push_notifications_wnsdevice USING btree (user_id);


--
-- Name: third_auth_thirdauthconf_organization_id_22daaf23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX third_auth_thirdauthconf_organization_id_22daaf23 ON public.third_auth_thirdauthconf USING btree (organization_id);


--
-- Name: third_auth_thirdauthconf_sign_user_id_346c974d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX third_auth_thirdauthconf_sign_user_id_346c974d ON public.third_auth_thirdauthconf USING btree (sign_user_id);


--
-- Name: wechat_wechatuser_openid_a55ba02d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wechat_wechatuser_openid_a55ba02d_like ON public.wechat_wechatuser USING btree (openid varchar_pattern_ops);


--
-- Name: wechat_wechatuser_user_id_8b068f18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wechat_wechatuser_user_id_8b068f18 ON public.wechat_wechatuser USING btree (user_id);


--
-- Name: agreement_useragreement agreement_useragreem_agreement_id_5841d6c8_fk_agreement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_useragreement
    ADD CONSTRAINT agreement_useragreem_agreement_id_5841d6c8_fk_agreement FOREIGN KEY (agreement_id) REFERENCES public.agreement_agreement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: agreement_useragreement agreement_useragreement_user_id_4bf4dfad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement_useragreement
    ADD CONSTRAINT agreement_useragreement_user_id_4bf4dfad_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: algorithm_eventtype algorithm_eventtype_algorithm_id_86386090_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_eventtype
    ADD CONSTRAINT algorithm_eventtype_algorithm_id_86386090_fk_algorithm FOREIGN KEY (algorithm_id) REFERENCES public.algorithm_algorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: algorithm_productalgorithm algorithm_productalg_algorithm_id_809a127b_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_productalgorithm
    ADD CONSTRAINT algorithm_productalg_algorithm_id_809a127b_fk_algorithm FOREIGN KEY (algorithm_id) REFERENCES public.algorithm_algorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: algorithm_productalgorithm algorithm_productalg_product_type_id_0b380ac5_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.algorithm_productalgorithm
    ADD CONSTRAINT algorithm_productalg_product_type_id_0b380ac5_fk_algorithm FOREIGN KEY (product_type_id) REFERENCES public.algorithm_producttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_cameraprefix back_cameraprefix_camera_provider_id_653e2832_fk_back_came; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_cameraprefix
    ADD CONSTRAINT back_cameraprefix_camera_provider_id_653e2832_fk_back_came FOREIGN KEY (camera_provider_id) REFERENCES public.back_cameraprovider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: back_feedback back_feedback_user_id_6dc30cf3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.back_feedback
    ADD CONSTRAINT back_feedback_user_id_6dc30cf3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_box_subs_id_f282dba4_fk_bill_boxsubs_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_box_subs_id_f282dba4_fk_bill_boxsubs_id FOREIGN KEY (box_subs_id) REFERENCES public.bill_boxsubs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_client_id_db99ce81_fk_bill_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_client_id_db99ce81_fk_bill_client_id FOREIGN KEY (client_id) REFERENCES public.bill_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_distributor_id_18dd7de7_fk_bill_distributor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_distributor_id_18dd7de7_fk_bill_distributor_id FOREIGN KEY (distributor_id) REFERENCES public.bill_distributor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_employee_id_eac3e725_fk_bill_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_employee_id_eac3e725_fk_bill_employee_id FOREIGN KEY (employee_id) REFERENCES public.bill_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_payment_id_21e7c81e_fk_bill_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_payment_id_21e7c81e_fk_bill_payment_id FOREIGN KEY (payment_id) REFERENCES public.bill_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpayment bill_boxpayment_seller_id_f5965140_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpayment
    ADD CONSTRAINT bill_boxpayment_seller_id_f5965140_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxpricing bill_boxpricing_user_id_a9b8ee66_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxpricing
    ADD CONSTRAINT bill_boxpricing_user_id_a9b8ee66_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxsubs bill_boxsubs_client_id_a8a588e9_fk_bill_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_client_id_a8a588e9_fk_bill_client_id FOREIGN KEY (client_id) REFERENCES public.bill_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxsubs bill_boxsubs_distributor_id_31291122_fk_bill_distributor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_distributor_id_31291122_fk_bill_distributor_id FOREIGN KEY (distributor_id) REFERENCES public.bill_distributor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxsubs bill_boxsubs_employee_id_0d175c3b_fk_bill_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_employee_id_0d175c3b_fk_bill_employee_id FOREIGN KEY (employee_id) REFERENCES public.bill_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxsubs bill_boxsubs_id_5aee4a7a_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_id_5aee4a7a_fk_logic_box_id FOREIGN KEY (id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_boxsubs bill_boxsubs_seller_id_a55c8fd1_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_boxsubs
    ADD CONSTRAINT bill_boxsubs_seller_id_a55c8fd1_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_client bill_client_employee_id_ef54759d_fk_bill_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client
    ADD CONSTRAINT bill_client_employee_id_ef54759d_fk_bill_employee_id FOREIGN KEY (employee_id) REFERENCES public.bill_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_client bill_client_seller_id_a9799738_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client
    ADD CONSTRAINT bill_client_seller_id_a9799738_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_client bill_client_user_id_faea8c25_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_client
    ADD CONSTRAINT bill_client_user_id_faea8c25_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_customer bill_customer_guard_company_id_58f07e10_fk_guard_gua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_customer
    ADD CONSTRAINT bill_customer_guard_company_id_58f07e10_fk_guard_gua FOREIGN KEY (guard_company_id) REFERENCES public.guard_guardcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_customer bill_customer_id_5dd1e13c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_customer
    ADD CONSTRAINT bill_customer_id_5dd1e13c_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_distributor bill_distributor_id_b31a606d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_distributor
    ADD CONSTRAINT bill_distributor_id_b31a606d_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_employee bill_employee_id_0ce99cbb_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_employee
    ADD CONSTRAINT bill_employee_id_0ce99cbb_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_employee bill_employee_seller_id_d5e467a1_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_employee
    ADD CONSTRAINT bill_employee_seller_id_d5e467a1_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_payment bill_payment_customer_id_8b9bfb58_fk_bill_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_payment
    ADD CONSTRAINT bill_payment_customer_id_8b9bfb58_fk_bill_customer_id FOREIGN KEY (customer_id) REFERENCES public.bill_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_client_id_6a97131b_fk_bill_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_client_id_6a97131b_fk_bill_client_id FOREIGN KEY (client_id) REFERENCES public.bill_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_distributor_id_ff70ee08_fk_bill_dist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_distributor_id_ff70ee08_fk_bill_dist FOREIGN KEY (distributor_id) REFERENCES public.bill_distributor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_employee_id_8a43563b_fk_bill_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_employee_id_8a43563b_fk_bill_employee_id FOREIGN KEY (employee_id) REFERENCES public.bill_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_payment_id_ee696ac2_fk_bill_payment_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_payment_id_ee696ac2_fk_bill_payment_id FOREIGN KEY (payment_id) REFERENCES public.bill_payment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_robot_subs_id_852b7358_fk_bill_robotsubs_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_robot_subs_id_852b7358_fk_bill_robotsubs_id FOREIGN KEY (robot_subs_id) REFERENCES public.bill_robotsubs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotpayment bill_robotpayment_seller_id_3c254093_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotpayment
    ADD CONSTRAINT bill_robotpayment_seller_id_3c254093_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotsubs bill_robotsubs_client_id_021aada5_fk_bill_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_client_id_021aada5_fk_bill_client_id FOREIGN KEY (client_id) REFERENCES public.bill_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotsubs bill_robotsubs_distributor_id_58081570_fk_bill_distributor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_distributor_id_58081570_fk_bill_distributor_id FOREIGN KEY (distributor_id) REFERENCES public.bill_distributor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotsubs bill_robotsubs_employee_id_3c01ad69_fk_bill_employee_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_employee_id_3c01ad69_fk_bill_employee_id FOREIGN KEY (employee_id) REFERENCES public.bill_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotsubs bill_robotsubs_id_8b933d04_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_id_8b933d04_fk_logic_robot_id FOREIGN KEY (id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_robotsubs bill_robotsubs_seller_id_c49c3d73_fk_bill_seller_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_robotsubs
    ADD CONSTRAINT bill_robotsubs_seller_id_c49c3d73_fk_bill_seller_id FOREIGN KEY (seller_id) REFERENCES public.bill_seller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_seller bill_seller_distributor_id_b534b90e_fk_bill_distributor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_seller
    ADD CONSTRAINT bill_seller_distributor_id_b534b90e_fk_bill_distributor_id FOREIGN KEY (distributor_id) REFERENCES public.bill_distributor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bill_seller bill_seller_id_0a320f23_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill_seller
    ADD CONSTRAINT bill_seller_id_0a320f23_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_notifyinfo ccs_notifyinfo_box_id_8cc4577f_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_notifyinfo
    ADD CONSTRAINT ccs_notifyinfo_box_id_8cc4577f_fk_logic_box_id FOREIGN KEY (box_id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_notifyinfo ccs_notifyinfo_camera_id_91e681f2_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_notifyinfo
    ADD CONSTRAINT ccs_notifyinfo_camera_id_91e681f2_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_notifyinfo ccs_notifyinfo_user_id_f2d50863_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_notifyinfo
    ADD CONSTRAINT ccs_notifyinfo_user_id_f2d50863_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_rawevent ccs_rawevent_box_id_69c738d4_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_box_id_69c738d4_fk_logic_box_id FOREIGN KEY (box_id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_rawevent ccs_rawevent_camera_id_fbed59f1_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_camera_id_fbed59f1_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_rawevent ccs_rawevent_org_id_ba80432f_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_org_id_ba80432f_fk_logic_organization_id FOREIGN KEY (org_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_rawevent ccs_rawevent_site_id_414bbf54_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_site_id_414bbf54_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_rawevent ccs_rawevent_user_id_2b54e743_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_rawevent
    ADD CONSTRAINT ccs_rawevent_user_id_2b54e743_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_sample ccs_sample_camera_id_b9732e7d_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_sample
    ADD CONSTRAINT ccs_sample_camera_id_b9732e7d_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_sample ccs_sample_user_id_c6ba5a2c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_sample
    ADD CONSTRAINT ccs_sample_user_id_c6ba5a2c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_usersite ccs_usersite_site_id_5285a0f0_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_usersite
    ADD CONSTRAINT ccs_usersite_site_id_5285a0f0_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ccs_usersite ccs_usersite_user_id_f988e9ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ccs_usersite
    ADD CONSTRAINT ccs_usersite_user_id_f988e9ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: channel_forwardaction channel_forwardactio_resource_type_id_8ba234f7_fk_perm_reso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_forwardaction
    ADD CONSTRAINT channel_forwardactio_resource_type_id_8ba234f7_fk_perm_reso FOREIGN KEY (resource_type_id) REFERENCES public.perm_resourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: channel_forwardaction channel_forwardaction_action_id_cf3b6dbb_fk_perm_action_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel_forwardaction
    ADD CONSTRAINT channel_forwardaction_action_id_cf3b6dbb_fk_perm_action_id FOREIGN KEY (action_id) REFERENCES public.perm_action(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_eventandtrackingobject face_eventandtrackin_tracking_object_id_91470430_fk_face_trac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_eventandtrackingobject
    ADD CONSTRAINT face_eventandtrackin_tracking_object_id_91470430_fk_face_trac FOREIGN KEY (tracking_object_id) REFERENCES public.face_trackingobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_eventandtrackingobject face_eventandtrackingobject_event_id_f50b3304_fk_logic_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_eventandtrackingobject
    ADD CONSTRAINT face_eventandtrackingobject_event_id_f50b3304_fk_logic_event_id FOREIGN KEY (event_id) REFERENCES public.logic_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_face face_face_lib_id_b7aca93a_fk_face_facelib_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_face
    ADD CONSTRAINT face_face_lib_id_b7aca93a_fk_face_facelib_id FOREIGN KEY (lib_id) REFERENCES public.face_facelib(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_face face_face_tracking_object_id_b5f6d03d_fk_face_trackingobject_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_face
    ADD CONSTRAINT face_face_tracking_object_id_b5f6d03d_fk_face_trackingobject_id FOREIGN KEY (tracking_object_id) REFERENCES public.face_trackingobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_facelib face_facelib_organization_id_06074721_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_facelib
    ADD CONSTRAINT face_facelib_organization_id_06074721_fk_logic_organization_id FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_group face_group_organization_id_26bc67e7_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_group
    ADD CONSTRAINT face_group_organization_id_26bc67e7_fk_logic_organization_id FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_group face_group_parent_id_6ca7b914_fk_face_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_group
    ADD CONSTRAINT face_group_parent_id_6ca7b914_fk_face_group_id FOREIGN KEY (parent_id) REFERENCES public.face_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_groupuser face_groupuser_group_id_1b30fbd3_fk_face_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_groupuser
    ADD CONSTRAINT face_groupuser_group_id_1b30fbd3_fk_face_group_id FOREIGN KEY (group_id) REFERENCES public.face_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_groupuser face_groupuser_user_id_610d0694_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_groupuser
    ADD CONSTRAINT face_groupuser_user_id_610d0694_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_humancountmediafile face_humancountmedia_human_count_info_id_8e0522cc_fk_face_huma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_humancountmediafile
    ADD CONSTRAINT face_humancountmedia_human_count_info_id_8e0522cc_fk_face_huma FOREIGN KEY (human_count_info_id) REFERENCES public.face_humancountinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_questionnaire face_questionnaire_user_id_ebc869a2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaire
    ADD CONSTRAINT face_questionnaire_user_id_ebc869a2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_questionnaireresult face_questionnairere_questionnaire_id_10eec108_fk_face_ques; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_questionnaireresult
    ADD CONSTRAINT face_questionnairere_questionnaire_id_10eec108_fk_face_ques FOREIGN KEY (questionnaire_id) REFERENCES public.face_questionnaire(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_settings face_settings_organization_id_6904e1fa_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_settings
    ADD CONSTRAINT face_settings_organization_id_6904e1fa_fk_logic_organization_id FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_trackingobject face_trackingobject_group_id_31008f2e_fk_face_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_trackingobject
    ADD CONSTRAINT face_trackingobject_group_id_31008f2e_fk_face_group_id FOREIGN KEY (group_id) REFERENCES public.face_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_trackingobject face_trackingobject_organization_id_9fad20a9_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_trackingobject
    ADD CONSTRAINT face_trackingobject_organization_id_9fad20a9_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: face_trackingobject face_trackingobject_site_id_5c69e1fe_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.face_trackingobject
    ADD CONSTRAINT face_trackingobject_site_id_5c69e1fe_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_customer_id_b413b594_fk_bill_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_customer_id_b413b594_fk_bill_customer_id FOREIGN KEY (customer_id) REFERENCES public.bill_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_event_id_a4bbf7f2_fk_logic_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_event_id_a4bbf7f2_fk_logic_event_id FOREIGN KEY (event_id) REFERENCES public.logic_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_guard_id_e1aaf730_fk_guard_guard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_guard_id_e1aaf730_fk_guard_guard_id FOREIGN KEY (guard_id) REFERENCES public.guard_guard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_incident_id_d6fd0954_fk_guard_incident_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_incident_id_d6fd0954_fk_guard_incident_id FOREIGN KEY (incident_id) REFERENCES public.guard_incident(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_inspection_id_14fab140_fk_logic_inspection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_inspection_id_14fab140_fk_logic_inspection_id FOREIGN KEY (inspection_id) REFERENCES public.logic_inspection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_operator_id_642df3bd_fk_guard_monitoringoperator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_operator_id_642df3bd_fk_guard_monitoringoperator_id FOREIGN KEY (operator_id) REFERENCES public.guard_monitoringoperator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_case guard_case_robot_id_94c7371e_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_case
    ADD CONSTRAINT guard_case_robot_id_94c7371e_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_caseexportconfig guard_caseexportconfig_user_id_0c5a8b89_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportconfig
    ADD CONSTRAINT guard_caseexportconfig_user_id_0c5a8b89_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_caseexportrecord guard_caseexportreco_export_config_id_6ce0ae68_fk_guard_cas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_caseexportrecord
    ADD CONSTRAINT guard_caseexportreco_export_config_id_6ce0ae68_fk_guard_cas FOREIGN KEY (export_config_id) REFERENCES public.guard_caseexportconfig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_casehistory guard_casehistory_case_id_8a991eca_fk_guard_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casehistory
    ADD CONSTRAINT guard_casehistory_case_id_8a991eca_fk_guard_case_id FOREIGN KEY (case_id) REFERENCES public.guard_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_casehistory guard_casehistory_robot_id_27c97348_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casehistory
    ADD CONSTRAINT guard_casehistory_robot_id_27c97348_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_casehistory guard_casehistory_user_id_9a9ee216_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casehistory
    ADD CONSTRAINT guard_casehistory_user_id_9a9ee216_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_casemedium guard_casemedium_case_id_efdeb28e_fk_guard_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_casemedium
    ADD CONSTRAINT guard_casemedium_case_id_efdeb28e_fk_guard_case_id FOREIGN KEY (case_id) REFERENCES public.guard_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_guard guard_guard_id_b315c364_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guard
    ADD CONSTRAINT guard_guard_id_b315c364_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_guard guard_guard_organization_id_d4d69dd6_fk_guard_guardcompany_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guard
    ADD CONSTRAINT guard_guard_organization_id_d4d69dd6_fk_guard_guardcompany_id FOREIGN KEY (organization_id) REFERENCES public.guard_guardcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_guardadmin guard_guardadmin_id_99e1d32d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guardadmin
    ADD CONSTRAINT guard_guardadmin_id_99e1d32d_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_guardadmin guard_guardadmin_organization_id_307f8098_fk_guard_gua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_guardadmin
    ADD CONSTRAINT guard_guardadmin_organization_id_307f8098_fk_guard_gua FOREIGN KEY (organization_id) REFERENCES public.guard_guardcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_monitoringoperator guard_monitoringoper_organization_id_9cd0dee1_fk_guard_gua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_monitoringoperator
    ADD CONSTRAINT guard_monitoringoper_organization_id_9cd0dee1_fk_guard_gua FOREIGN KEY (organization_id) REFERENCES public.guard_guardcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_monitoringoperator guard_monitoringoperator_id_1cc3d0d4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_monitoringoperator
    ADD CONSTRAINT guard_monitoringoperator_id_1cc3d0d4_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_note guard_note_case_id_dac38bb4_fk_guard_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_note
    ADD CONSTRAINT guard_note_case_id_dac38bb4_fk_guard_case_id FOREIGN KEY (case_id) REFERENCES public.guard_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_note guard_note_user_id_22b8ff3b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_note
    ADD CONSTRAINT guard_note_user_id_22b8ff3b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_siteoperation guard_siteoperation_guard_company_id_73213803_fk_guard_gua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_siteoperation
    ADD CONSTRAINT guard_siteoperation_guard_company_id_73213803_fk_guard_gua FOREIGN KEY (guard_company_id) REFERENCES public.guard_guardcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_siteoperation guard_siteoperation_operator_id_9b8773eb_fk_guard_mon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_siteoperation
    ADD CONSTRAINT guard_siteoperation_operator_id_9b8773eb_fk_guard_mon FOREIGN KEY (operator_id) REFERENCES public.guard_monitoringoperator(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guard_siteoperation guard_siteoperation_site_id_7b3c4a03_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guard_siteoperation
    ADD CONSTRAINT guard_siteoperation_site_id_7b3c4a03_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_agent logic_agent_user_id_3fad632a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_agent
    ADD CONSTRAINT logic_agent_user_id_3fad632a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_box logic_box_id_709f81e5_fk_logic_devicekey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_box
    ADD CONSTRAINT logic_box_id_709f81e5_fk_logic_devicekey_id FOREIGN KEY (id) REFERENCES public.logic_devicekey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_box logic_box_site_id_92559395_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_box
    ADD CONSTRAINT logic_box_site_id_92559395_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_box logic_box_user_id_6e492d88_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_box
    ADD CONSTRAINT logic_box_user_id_6e492d88_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_boxlocation logic_boxlocation_box_id_5b7ba4da_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_boxlocation
    ADD CONSTRAINT logic_boxlocation_box_id_5b7ba4da_fk_logic_box_id FOREIGN KEY (box_id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_camera logic_camera_box_id_7d74ceeb_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera
    ADD CONSTRAINT logic_camera_box_id_7d74ceeb_fk_logic_box_id FOREIGN KEY (box_id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_camera logic_camera_firmware_version_id_b7d80e6b_fk_logic_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera
    ADD CONSTRAINT logic_camera_firmware_version_id_b7d80e6b_fk_logic_cam FOREIGN KEY (firmware_version_id) REFERENCES public.logic_camerafirmwareversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_camera logic_camera_user_id_888eb677_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camera
    ADD CONSTRAINT logic_camera_user_id_888eb677_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_cameralocation logic_cameralocation_camera_id_2099320c_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameralocation
    ADD CONSTRAINT logic_cameralocation_camera_id_2099320c_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_camerasavedvideo logic_camerasavedvideo_camera_id_052703e2_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_camerasavedvideo
    ADD CONSTRAINT logic_camerasavedvideo_camera_id_052703e2_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_cameratrackingobject logic_cameratracking_camera_id_e9068705_fk_logic_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameratrackingobject
    ADD CONSTRAINT logic_cameratracking_camera_id_e9068705_fk_logic_cam FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_cameratrackingobject logic_cameratracking_tracking_object_id_24907433_fk_face_trac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameratrackingobject
    ADD CONSTRAINT logic_cameratracking_tracking_object_id_24907433_fk_face_trac FOREIGN KEY (tracking_object_id) REFERENCES public.face_trackingobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_cameravideo logic_cameravideo_camera_id_1de87d50_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_cameravideo
    ADD CONSTRAINT logic_cameravideo_camera_id_1de87d50_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_customizedalgorithm logic_customizedalgo_algorithm_id_81e557e4_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm
    ADD CONSTRAINT logic_customizedalgo_algorithm_id_81e557e4_fk_algorithm FOREIGN KEY (algorithm_id) REFERENCES public.algorithm_algorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_customizedalgorithm logic_customizedalgo_organization_id_67ecdfee_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedalgorithm
    ADD CONSTRAINT logic_customizedalgo_organization_id_67ecdfee_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_customizedeventtype logic_customizedeven_customized_algorithm_46ab161a_fk_logic_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeven_customized_algorithm_46ab161a_fk_logic_cus FOREIGN KEY (customized_algorithm_id) REFERENCES public.logic_customizedalgorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_customizedeventtype logic_customizedeven_event_type_id_c9624905_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeven_event_type_id_c9624905_fk_algorithm FOREIGN KEY (event_type_id) REFERENCES public.algorithm_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_customizedeventtype logic_customizedeven_organization_id_9294846d_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_customizedeventtype
    ADD CONSTRAINT logic_customizedeven_organization_id_9294846d_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_departmentmanager logic_departmentmana_customer_id_81837092_fk_bill_cust; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_departmentmanager
    ADD CONSTRAINT logic_departmentmana_customer_id_81837092_fk_bill_cust FOREIGN KEY (customer_id) REFERENCES public.bill_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_departmentmanager logic_departmentmanager_id_197a04fa_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_departmentmanager
    ADD CONSTRAINT logic_departmentmanager_id_197a04fa_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_event logic_event_camera_id_08634625_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event
    ADD CONSTRAINT logic_event_camera_id_08634625_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_event logic_event_robot_id_87b504fc_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event
    ADD CONSTRAINT logic_event_robot_id_87b504fc_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_event logic_event_site_id_dc0d6829_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event
    ADD CONSTRAINT logic_event_site_id_dc0d6829_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_event logic_event_tracking_object_id_f394635c_fk_face_trac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_event
    ADD CONSTRAINT logic_event_tracking_object_id_f394635c_fk_face_trac FOREIGN KEY (tracking_object_id) REFERENCES public.face_trackingobject(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_eventbackup logic_eventbackup_camera_id_d8c8f50f_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_eventbackup
    ADD CONSTRAINT logic_eventbackup_camera_id_d8c8f50f_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_eventbackup logic_eventbackup_robot_id_88908c61_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_eventbackup
    ADD CONSTRAINT logic_eventbackup_robot_id_88908c61_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_inspection logic_inspection_robot_id_47b675ae_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection
    ADD CONSTRAINT logic_inspection_robot_id_47b675ae_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_inspection logic_inspection_site_id_ab0e49ee_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection
    ADD CONSTRAINT logic_inspection_site_id_ab0e49ee_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_inspection logic_inspection_target_id_a19b4c3b_fk_patrol_target_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspection
    ADD CONSTRAINT logic_inspection_target_id_a19b4c3b_fk_patrol_target_id FOREIGN KEY (target_id) REFERENCES public.patrol_target(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_inspectmedium logic_inspectmedium_inspection_id_d2844bcb_fk_logic_ins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_inspectmedium
    ADD CONSTRAINT logic_inspectmedium_inspection_id_d2844bcb_fk_logic_ins FOREIGN KEY (inspection_id) REFERENCES public.logic_inspection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_ipwhitelist logic_ipwhitelist_user_id_ec3911a7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_ipwhitelist
    ADD CONSTRAINT logic_ipwhitelist_user_id_ec3911a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_locationeventblacklist logic_locationeventb_event_type_id_90c1e504_fk_algorithm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_locationeventblacklist
    ADD CONSTRAINT logic_locationeventb_event_type_id_90c1e504_fk_algorithm FOREIGN KEY (event_type_id) REFERENCES public.algorithm_eventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_manualcleanuptask logic_manualcleanupt_organization_id_afb613e8_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_manualcleanuptask
    ADD CONSTRAINT logic_manualcleanupt_organization_id_afb613e8_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_manualcleanuptask logic_manualcleanuptask_user_id_1b6febe7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_manualcleanuptask
    ADD CONSTRAINT logic_manualcleanuptask_user_id_1b6febe7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_medium logic_medium_event_id_21a4448f_fk_logic_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_medium
    ADD CONSTRAINT logic_medium_event_id_21a4448f_fk_logic_event_id FOREIGN KEY (event_id) REFERENCES public.logic_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_mediumbackup logic_mediumbackup_event_id_b9df7e3d_fk_logic_eventbackup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_mediumbackup
    ADD CONSTRAINT logic_mediumbackup_event_id_b9df7e3d_fk_logic_eventbackup_id FOREIGN KEY (event_id) REFERENCES public.logic_eventbackup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_monitor logic_monitor_id_1b682792_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_monitor
    ADD CONSTRAINT logic_monitor_id_1b682792_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_notifyrule logic_notifyrule_box_id_4caee0a1_fk_logic_box_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule
    ADD CONSTRAINT logic_notifyrule_box_id_4caee0a1_fk_logic_box_id FOREIGN KEY (box_id) REFERENCES public.logic_box(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_notifyrule logic_notifyrule_camera_id_05444756_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule
    ADD CONSTRAINT logic_notifyrule_camera_id_05444756_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_notifyrule logic_notifyrule_organization_id_a10800f9_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule
    ADD CONSTRAINT logic_notifyrule_organization_id_a10800f9_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_notifyrule logic_notifyrule_site_id_87b7b7b7_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_notifyrule
    ADD CONSTRAINT logic_notifyrule_site_id_87b7b7b7_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_organization logic_organization_owner_id_586096d9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organization
    ADD CONSTRAINT logic_organization_owner_id_586096d9_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_organizationuistrategy logic_organizationui_organization_id_58f945fa_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organizationuistrategy
    ADD CONSTRAINT logic_organizationui_organization_id_58f945fa_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_organizationuistrategy logic_organizationui_strategy_id_a1562eec_fk_logic_uis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_organizationuistrategy
    ADD CONSTRAINT logic_organizationui_strategy_id_a1562eec_fk_logic_uis FOREIGN KEY (strategy_id) REFERENCES public.logic_uistrategy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_patrol logic_patrol_route_id_3143dc11_fk_logic_route_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_patrol
    ADD CONSTRAINT logic_patrol_route_id_3143dc11_fk_logic_route_id FOREIGN KEY (route_id) REFERENCES public.logic_route(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_patrol logic_patrol_task_id_fc7c25bb_fk_logic_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_patrol
    ADD CONSTRAINT logic_patrol_task_id_fc7c25bb_fk_logic_task_id FOREIGN KEY (task_id) REFERENCES public.logic_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_person logic_person_id_2ee0a530_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_person
    ADD CONSTRAINT logic_person_id_2ee0a530_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robot logic_robot_id_aff2cacc_fk_logic_devicekey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robot
    ADD CONSTRAINT logic_robot_id_aff2cacc_fk_logic_devicekey_id FOREIGN KEY (id) REFERENCES public.logic_devicekey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robot logic_robot_site_id_77281918_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robot
    ADD CONSTRAINT logic_robot_site_id_77281918_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robot logic_robot_user_id_98fcd8c8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robot
    ADD CONSTRAINT logic_robot_user_id_98fcd8c8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robotsavedvideo logic_robotsavedvideo_robot_id_fa69c6b7_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsavedvideo
    ADD CONSTRAINT logic_robotsavedvideo_robot_id_fa69c6b7_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robotsnap logic_robotsnap_robot_id_8a80d523_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotsnap
    ADD CONSTRAINT logic_robotsnap_robot_id_8a80d523_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_robotvideo logic_robotvideo_robot_id_4c72f3a3_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_robotvideo
    ADD CONSTRAINT logic_robotvideo_robot_id_4c72f3a3_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_route logic_route_user_id_b38935f5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_route
    ADD CONSTRAINT logic_route_user_id_b38935f5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_rule logic_rule_camera_id_ad3f43fc_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_rule
    ADD CONSTRAINT logic_rule_camera_id_ad3f43fc_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sharing logic_sharing_camera_saved_video_i_52fa6d28_fk_logic_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sharing
    ADD CONSTRAINT logic_sharing_camera_saved_video_i_52fa6d28_fk_logic_cam FOREIGN KEY (camera_saved_video_id) REFERENCES public.logic_camerasavedvideo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sharing logic_sharing_organization_id_cac25d86_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sharing
    ADD CONSTRAINT logic_sharing_organization_id_cac25d86_fk_logic_organization_id FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sharing logic_sharing_site_id_f38cae91_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sharing
    ADD CONSTRAINT logic_sharing_site_id_f38cae91_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sharing logic_sharing_user_id_545252c3_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sharing
    ADD CONSTRAINT logic_sharing_user_id_545252c3_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_site logic_site_customer_id_5788762b_fk_bill_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_site
    ADD CONSTRAINT logic_site_customer_id_5788762b_fk_bill_customer_id FOREIGN KEY (customer_id) REFERENCES public.bill_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sitemanagement logic_sitemanagement_site_id_74e55fba_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanagement
    ADD CONSTRAINT logic_sitemanagement_site_id_74e55fba_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sitemanagement logic_sitemanagement_site_manager_id_822984cc_fk_logic_sit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanagement
    ADD CONSTRAINT logic_sitemanagement_site_manager_id_822984cc_fk_logic_sit FOREIGN KEY (site_manager_id) REFERENCES public.logic_sitemanager(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sitemanager logic_sitemanager_customer_id_94c0d3fa_fk_bill_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanager
    ADD CONSTRAINT logic_sitemanager_customer_id_94c0d3fa_fk_bill_customer_id FOREIGN KEY (customer_id) REFERENCES public.bill_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_sitemanager logic_sitemanager_id_bb6fac6b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_sitemanager
    ADD CONSTRAINT logic_sitemanager_id_bb6fac6b_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_snap logic_snap_camera_id_8f14add3_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_snap
    ADD CONSTRAINT logic_snap_camera_id_8f14add3_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_task logic_task_polymorphic_ctype_id_d3657b17_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_task
    ADD CONSTRAINT logic_task_polymorphic_ctype_id_d3657b17_fk_django_co FOREIGN KEY (polymorphic_ctype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_task logic_task_robot_id_4f24345f_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_task
    ADD CONSTRAINT logic_task_robot_id_4f24345f_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_thermalcamerasettings logic_thermalcameras_camera_id_06bea220_fk_logic_cam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettings
    ADD CONSTRAINT logic_thermalcameras_camera_id_06bea220_fk_logic_cam FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_thermalcamerasettingsbatchupdaterecord logic_thermalcameras_user_id_5f5b87d4_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingsbatchupdaterecord
    ADD CONSTRAINT logic_thermalcameras_user_id_5f5b87d4_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_thermalcamerasettingscheckrecord logic_thermalcameras_user_id_8be351fb_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_thermalcamerasettingscheckrecord
    ADD CONSTRAINT logic_thermalcameras_user_id_8be351fb_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_waypoint logic_waypoint_site_id_5f7114bd_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypoint
    ADD CONSTRAINT logic_waypoint_site_id_5f7114bd_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: logic_waypointhistory logic_waypointhistor_way_point_id_28c83439_fk_logic_way; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logic_waypointhistory
    ADD CONSTRAINT logic_waypointhistor_way_point_id_28c83439_fk_logic_way FOREIGN KEY (way_point_id) REFERENCES public.logic_waypoint(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_map mapping_map_map_config_id_469220ba_fk_mapping_mapconfig_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_map
    ADD CONSTRAINT mapping_map_map_config_id_469220ba_fk_mapping_mapconfig_id FOREIGN KEY (map_config_id) REFERENCES public.mapping_mapconfig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_mapconfig mapping_mapconfig_organization_id_77cb33ec_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_mapconfig
    ADD CONSTRAINT mapping_mapconfig_organization_id_77cb33ec_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_maptarget mapping_maptarget_map_id_3d0c640e_fk_mapping_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_maptarget
    ADD CONSTRAINT mapping_maptarget_map_id_3d0c640e_fk_mapping_map_id FOREIGN KEY (map_id) REFERENCES public.mapping_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_maptarget mapping_maptarget_target_id_7bd25e75_fk_mapping_target_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_maptarget
    ADD CONSTRAINT mapping_maptarget_target_id_7bd25e75_fk_mapping_target_id FOREIGN KEY (target_id) REFERENCES public.mapping_target(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_sitemap mapping_sitemap_map_id_b4a6733c_fk_mapping_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_sitemap
    ADD CONSTRAINT mapping_sitemap_map_id_b4a6733c_fk_mapping_map_id FOREIGN KEY (map_id) REFERENCES public.mapping_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_sitemap mapping_sitemap_site_id_0d0ceb21_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_sitemap
    ADD CONSTRAINT mapping_sitemap_site_id_0d0ceb21_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_target mapping_target_camera_id_9f2f5788_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_camera_id_9f2f5788_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_target mapping_target_domain_id_03c7cfe4_fk_org_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_domain_id_03c7cfe4_fk_org_domain_id FOREIGN KEY (domain_id) REFERENCES public.org_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_target mapping_target_robot_id_dfe2d677_fk_logic_robot_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_robot_id_dfe2d677_fk_logic_robot_id FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mapping_target mapping_target_site_id_a6832efe_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapping_target
    ADD CONSTRAINT mapping_target_site_id_a6832efe_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_customalgonotify monitor_center_custo_site_id_8925b6bf_fk_logic_sit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgonotify
    ADD CONSTRAINT monitor_center_custo_site_id_8925b6bf_fk_logic_sit FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_customalgo monitor_center_customalgo_camera_id_ebc6409a_fk_logic_camera_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgo
    ADD CONSTRAINT monitor_center_customalgo_camera_id_ebc6409a_fk_logic_camera_id FOREIGN KEY (camera_id) REFERENCES public.logic_camera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_customalgo monitor_center_customalgo_site_id_5e4fc74c_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_customalgo
    ADD CONSTRAINT monitor_center_customalgo_site_id_5e4fc74c_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_device monitor_center_device_user_id_27d122d0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_device
    ADD CONSTRAINT monitor_center_device_user_id_27d122d0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_eventext monitor_center_eventext_event_ptr_id_7c1a1686_fk_logic_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_eventext
    ADD CONSTRAINT monitor_center_eventext_event_ptr_id_7c1a1686_fk_logic_event_id FOREIGN KEY (event_ptr_id) REFERENCES public.logic_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_fmevent monitor_center_fmevent_event_id_5e4bd8e4_fk_logic_event_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_fmevent
    ADD CONSTRAINT monitor_center_fmevent_event_id_5e4bd8e4_fk_logic_event_id FOREIGN KEY (event_id) REFERENCES public.logic_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_orgext monitor_center_orgext_id_5f02a998_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_orgext
    ADD CONSTRAINT monitor_center_orgext_id_5f02a998_fk_logic_organization_id FOREIGN KEY (id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_robotincidentnotifyrecord monitor_center_robot_incident_id_88ea011e_fk_guard_inc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotincidentnotifyrecord
    ADD CONSTRAINT monitor_center_robot_incident_id_88ea011e_fk_guard_inc FOREIGN KEY (incident_id) REFERENCES public.guard_incident(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_robotnotifier monitor_center_robot_robot_id_3abb2eda_fk_logic_rob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotnotifier
    ADD CONSTRAINT monitor_center_robot_robot_id_3abb2eda_fk_logic_rob FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_robotincidentnotifyrecord monitor_center_robot_robot_id_4d4ff3aa_fk_logic_rob; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotincidentnotifyrecord
    ADD CONSTRAINT monitor_center_robot_robot_id_4d4ff3aa_fk_logic_rob FOREIGN KEY (robot_id) REFERENCES public.logic_robot(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_robotincidentnotifyrecord monitor_center_robot_user_id_6f6f312d_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotincidentnotifyrecord
    ADD CONSTRAINT monitor_center_robot_user_id_6f6f312d_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_robotnotifier monitor_center_robotnotifier_user_id_df599730_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_robotnotifier
    ADD CONSTRAINT monitor_center_robotnotifier_user_id_df599730_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_rule monitor_center_rule_channel_id_2db50c4b_fk_monitor_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_rule
    ADD CONSTRAINT monitor_center_rule_channel_id_2db50c4b_fk_monitor_c FOREIGN KEY (channel_id) REFERENCES public.monitor_center_channel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_sitefloorvideo monitor_center_sitef_new_floor_id_6dba2fe9_fk_patrol_fl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_sitefloorvideo
    ADD CONSTRAINT monitor_center_sitef_new_floor_id_6dba2fe9_fk_patrol_fl FOREIGN KEY (new_floor_id) REFERENCES public.patrol_floor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_sitefloorvideo monitor_center_sitefloorvideo_site_id_73112c0c_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_sitefloorvideo
    ADD CONSTRAINT monitor_center_sitefloorvideo_site_id_73112c0c_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_userext monitor_center_usere_business_id_aa73cc9c_fk_monitor_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_userext
    ADD CONSTRAINT monitor_center_usere_business_id_aa73cc9c_fk_monitor_c FOREIGN KEY (business_id) REFERENCES public.monitor_center_business(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: monitor_center_userext monitor_center_userext_id_153d9a78_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.monitor_center_userext
    ADD CONSTRAINT monitor_center_userext_id_153d9a78_fk_auth_user_id FOREIGN KEY (id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domain org_domain_domain_type_id_e8f2ab15_fk_org_domaintype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_domain_type_id_e8f2ab15_fk_org_domaintype_id FOREIGN KEY (domain_type_id) REFERENCES public.org_domaintype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domain org_domain_map_id_5d763db5_fk_mapping_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_map_id_5d763db5_fk_mapping_map_id FOREIGN KEY (map_id) REFERENCES public.mapping_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domain org_domain_organization_id_81c4ef80_fk_logic_organization_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_organization_id_81c4ef80_fk_logic_organization_id FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domain org_domain_parent_id_1831af05_fk_org_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT org_domain_parent_id_1831af05_fk_org_domain_id FOREIGN KEY (parent_id) REFERENCES public.org_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domainsite org_domainsite_domain_id_e4685140_fk_org_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainsite
    ADD CONSTRAINT org_domainsite_domain_id_e4685140_fk_org_domain_id FOREIGN KEY (domain_id) REFERENCES public.org_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domainsite org_domainsite_site_id_5b1f60aa_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainsite
    ADD CONSTRAINT org_domainsite_site_id_5b1f60aa_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domaintype org_domaintype_organization_id_83b5ab25_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype
    ADD CONSTRAINT org_domaintype_organization_id_83b5ab25_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domaintype org_domaintype_parent_id_3d000093_fk_org_domaintype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domaintype
    ADD CONSTRAINT org_domaintype_parent_id_3d000093_fk_org_domaintype_id FOREIGN KEY (parent_id) REFERENCES public.org_domaintype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domainuser org_domainuser_domain_id_58ae6b98_fk_org_domain_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainuser
    ADD CONSTRAINT org_domainuser_domain_id_58ae6b98_fk_org_domain_id FOREIGN KEY (domain_id) REFERENCES public.org_domain(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_domainuser org_domainuser_user_id_ad810ab2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_domainuser
    ADD CONSTRAINT org_domainuser_user_id_ad810ab2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_organizationdelegate org_organizationdele_organization_id_3bf1b4d2_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationdelegate
    ADD CONSTRAINT org_organizationdele_organization_id_3bf1b4d2_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_organizationdelegate org_organizationdelegate_user_id_b7442d9f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationdelegate
    ADD CONSTRAINT org_organizationdelegate_user_id_b7442d9f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_organizationuser org_organizationuser_organization_id_86194f85_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationuser
    ADD CONSTRAINT org_organizationuser_organization_id_86194f85_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_organizationuser org_organizationuser_user_id_68ee845d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_organizationuser
    ADD CONSTRAINT org_organizationuser_user_id_68ee845d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_usernode org_usernode_parent_id_ee9cc191_fk_org_usernode_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_usernode
    ADD CONSTRAINT org_usernode_parent_id_ee9cc191_fk_org_usernode_id FOREIGN KEY (parent_id) REFERENCES public.org_usernode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: org_usernode org_usernode_user_id_8108b655_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.org_usernode
    ADD CONSTRAINT org_usernode_user_id_8108b655_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_algoconfig patrol_algoconfig_algo_id_f18ee31c_fk_logic_cus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoconfig
    ADD CONSTRAINT patrol_algoconfig_algo_id_f18ee31c_fk_logic_cus FOREIGN KEY (algo_id) REFERENCES public.logic_customizedalgorithm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_algoconfig patrol_algoconfig_target_id_71656a75_fk_patrol_target_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoconfig
    ADD CONSTRAINT patrol_algoconfig_target_id_71656a75_fk_patrol_target_id FOREIGN KEY (target_id) REFERENCES public.patrol_target(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_algoreference patrol_algoreference_algo_config_id_daa44606_fk_patrol_al; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_algoreference
    ADD CONSTRAINT patrol_algoreference_algo_config_id_daa44606_fk_patrol_al FOREIGN KEY (algo_config_id) REFERENCES public.patrol_algoconfig(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_building patrol_building_site_id_8ae79087_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_building
    ADD CONSTRAINT patrol_building_site_id_8ae79087_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_detectiontask patrol_detectiontask_inspection_id_68f75531_fk_logic_ins; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_detectiontask
    ADD CONSTRAINT patrol_detectiontask_inspection_id_68f75531_fk_logic_ins FOREIGN KEY (inspection_id) REFERENCES public.logic_inspection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_detectiontask patrol_detectiontask_target_id_26f70461_fk_patrol_target_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_detectiontask
    ADD CONSTRAINT patrol_detectiontask_target_id_26f70461_fk_patrol_target_id FOREIGN KEY (target_id) REFERENCES public.patrol_target(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_floor patrol_floor_building_id_58c720d3_fk_patrol_building_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_floor
    ADD CONSTRAINT patrol_floor_building_id_58c720d3_fk_patrol_building_id FOREIGN KEY (building_id) REFERENCES public.patrol_building(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_floor patrol_floor_map_id_858f7b3e_fk_mapping_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_floor
    ADD CONSTRAINT patrol_floor_map_id_858f7b3e_fk_mapping_map_id FOREIGN KEY (map_id) REFERENCES public.mapping_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_target patrol_target_new_floor_id_675d67c8_fk_patrol_floor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_target
    ADD CONSTRAINT patrol_target_new_floor_id_675d67c8_fk_patrol_floor_id FOREIGN KEY (new_floor_id) REFERENCES public.patrol_floor(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: patrol_target patrol_target_site_id_51f276d4_fk_logic_site_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patrol_target
    ADD CONSTRAINT patrol_target_site_id_51f276d4_fk_logic_site_id FOREIGN KEY (site_id) REFERENCES public.logic_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: perm_action perm_action_resource_type_id_1423fc2a_fk_perm_resourcetype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_action
    ADD CONSTRAINT perm_action_resource_type_id_1423fc2a_fk_perm_resourcetype_id FOREIGN KEY (resource_type_id) REFERENCES public.perm_resourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: perm_role_users perm_role_users_role_id_e0485dc6_fk_perm_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role_users
    ADD CONSTRAINT perm_role_users_role_id_e0485dc6_fk_perm_role_id FOREIGN KEY (role_id) REFERENCES public.perm_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: perm_role_users perm_role_users_user_id_fba02434_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_role_users
    ADD CONSTRAINT perm_role_users_user_id_fba02434_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: perm_rolepolicy perm_rolepolicy_resource_type_id_41fb74de_fk_perm_reso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_rolepolicy
    ADD CONSTRAINT perm_rolepolicy_resource_type_id_41fb74de_fk_perm_reso FOREIGN KEY (resource_type_id) REFERENCES public.perm_resourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: perm_rolepolicy perm_rolepolicy_role_id_ab4c12cc_fk_perm_role_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perm_rolepolicy
    ADD CONSTRAINT perm_rolepolicy_role_id_ab4c12cc_fk_perm_role_id FOREIGN KEY (role_id) REFERENCES public.perm_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: push_notifications_apnsdevice push_notifications_apnsdevice_user_id_44cc44d2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_apnsdevice
    ADD CONSTRAINT push_notifications_apnsdevice_user_id_44cc44d2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: push_notifications_gcmdevice push_notifications_gcmdevice_user_id_f3752f1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_gcmdevice
    ADD CONSTRAINT push_notifications_gcmdevice_user_id_f3752f1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: push_notifications_wnsdevice push_notifications_wnsdevice_user_id_670eff0d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.push_notifications_wnsdevice
    ADD CONSTRAINT push_notifications_wnsdevice_user_id_670eff0d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: third_auth_thirdauthconf third_auth_thirdauth_organization_id_22daaf23_fk_logic_org; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.third_auth_thirdauthconf
    ADD CONSTRAINT third_auth_thirdauth_organization_id_22daaf23_fk_logic_org FOREIGN KEY (organization_id) REFERENCES public.logic_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: third_auth_thirdauthconf third_auth_thirdauthconf_sign_user_id_346c974d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.third_auth_thirdauthconf
    ADD CONSTRAINT third_auth_thirdauthconf_sign_user_id_346c974d_fk_auth_user_id FOREIGN KEY (sign_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wechat_wechatuser wechat_wechatuser_user_id_8b068f18_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wechat_wechatuser
    ADD CONSTRAINT wechat_wechatuser_user_id_8b068f18_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

