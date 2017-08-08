--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id integer,
    resource_type character varying,
    author_id integer,
    author_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    trackable_id integer,
    trackable_type character varying,
    owner_id integer,
    owner_type character varying,
    key character varying,
    parameters text,
    recipient_id integer,
    recipient_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: address_subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE address_subscriptions (
    id integer NOT NULL,
    address character varying,
    opportunity_id integer
);


--
-- Name: address_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE address_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE address_subscriptions_id_seq OWNED BY address_subscriptions.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying NOT NULL,
    proid character varying NOT NULL,
    token character varying,
    refresh_token character varying,
    secret character varying,
    expires_at timestamp without time zone,
    username character varying,
    image_url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentications_id_seq OWNED BY authentications.id;


--
-- Name: authorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authorizations (
    id integer NOT NULL,
    user_id integer,
    username character varying(100),
    provider character varying,
    uid character varying,
    token character varying,
    secret character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authorizations_id_seq OWNED BY authorizations.id;


--
-- Name: avatars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE avatars (
    id integer NOT NULL,
    profile_id integer,
    use_this boolean DEFAULT false,
    avatar_data text,
    priority integer
);


--
-- Name: avatars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE avatars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: avatars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE avatars_id_seq OWNED BY avatars.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commentable_id integer,
    commentable_type character varying,
    title character varying,
    body text,
    subject character varying,
    user_id integer NOT NULL,
    parent_id integer,
    lft integer,
    rgt integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: crono_jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE crono_jobs (
    id integer NOT NULL,
    job_id character varying NOT NULL,
    log text,
    last_performed_at timestamp without time zone,
    healthy boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crono_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE crono_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crono_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE crono_jobs_id_seq OWNED BY crono_jobs.id;


--
-- Name: docs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE docs (
    id integer NOT NULL,
    opportunity_id integer,
    description character varying,
    language character varying,
    doc_type character varying,
    doc character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    doc_data text
);


--
-- Name: docs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE docs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: docs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE docs_id_seq OWNED BY docs.id;


--
-- Name: email_subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE email_subscriptions (
    id integer NOT NULL,
    email character varying,
    opportunity_id integer
);


--
-- Name: email_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE email_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE email_subscriptions_id_seq OWNED BY email_subscriptions.id;


--
-- Name: entry_manners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entry_manners (
    id integer NOT NULL,
    entry_type integer,
    opportunity_id integer,
    content character varying
);


--
-- Name: entry_manners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entry_manners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entry_manners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entry_manners_id_seq OWNED BY entry_manners.id;


--
-- Name: extended_subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE extended_subscriptions (
    id integer NOT NULL,
    opportunity_id integer,
    extended timestamp without time zone
);


--
-- Name: extended_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE extended_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: extended_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE extended_subscriptions_id_seq OWNED BY extended_subscriptions.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE follows (
    id integer NOT NULL,
    followable_id integer NOT NULL,
    followable_type character varying(255) NOT NULL,
    follower_id integer NOT NULL,
    follower_type character varying(255) NOT NULL,
    blocked boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE follows_id_seq OWNED BY follows.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendly_id_slugs (
    id integer NOT NULL,
    slug character varying(191) NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying(191),
    created_at timestamp without time zone NOT NULL
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: grants; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE grants (
    id integer NOT NULL,
    name character varying(255),
    description text,
    quantity integer DEFAULT 1,
    opportunity_id integer,
    row_order integer
);


--
-- Name: grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grants_id_seq OWNED BY grants.id;


--
-- Name: impressions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE impressions (
    id integer NOT NULL,
    impressionable_type character varying(255),
    impressionable_id integer,
    user_id integer,
    controller_name character varying(255),
    action_name character varying(255),
    view_name character varying(255),
    request_hash character varying(255),
    ip_address character varying(255),
    session_hash character varying(255),
    message text,
    referrer text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: impressions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE impressions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: impressions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE impressions_id_seq OWNED BY impressions.id;


--
-- Name: oauth_caches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE oauth_caches (
    authentication_id integer NOT NULL,
    data_json text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE opportunities (
    id integer NOT NULL,
    title character varying(255),
    beginning date,
    end_subscription date,
    result date,
    extended date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    author_id integer,
    entry_manner integer DEFAULT 0,
    local_restriction integer DEFAULT 0,
    opportunity_views_counter_cache integer DEFAULT 0,
    url_source character varying,
    featured_image_data text,
    published_at timestamp without time zone,
    email_contact character varying,
    ongoing boolean DEFAULT false NOT NULL,
    prospectus_url character varying,
    scrapper_source character varying,
    original_source_id integer,
    location character varying,
    content text,
    summary character varying,
    raw_page_source text,
    notification_already_sent boolean DEFAULT false NOT NULL,
    likes_count integer DEFAULT 0
);


--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE opportunities_id_seq OWNED BY opportunities.id;


--
-- Name: opportunity_email_notifications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE opportunity_email_notifications (
    id integer NOT NULL,
    opportunity_id integer,
    closure boolean DEFAULT false,
    recent_added boolean DEFAULT false,
    follower_closure boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: opportunity_email_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE opportunity_email_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opportunity_email_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE opportunity_email_notifications_id_seq OWNED BY opportunity_email_notifications.id;


--
-- Name: prizes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE prizes (
    id integer NOT NULL,
    grant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    value_centavos integer DEFAULT 0 NOT NULL,
    value_currency character varying(255) DEFAULT 'BRL'::character varying NOT NULL,
    description text,
    exact_value boolean DEFAULT true,
    opportunity_id integer
);


--
-- Name: prizes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prizes_id_seq OWNED BY prizes.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    fullname character varying(255),
    sumary character varying(255),
    content text,
    beginning_activity date,
    end_activity date,
    email character varying(255),
    website character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sigla character varying(255),
    profile_type integer,
    user_id integer,
    first_name character varying,
    last_name character varying,
    art_statment text,
    short_bio character varying
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: program_responsibles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE program_responsibles (
    id integer NOT NULL,
    program_id integer,
    profile_id integer
);


--
-- Name: program_responsibles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE program_responsibles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: program_responsibles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE program_responsibles_id_seq OWNED BY program_responsibles.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    name character varying(255),
    content text,
    start_activity timestamp without time zone,
    end_activity timestamp without time zone,
    program_type integer,
    email character varying(255),
    url character varying(255)
);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programs_id_seq OWNED BY programs.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: rs_evaluations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rs_evaluations (
    id integer NOT NULL,
    reputation_name character varying,
    source_id integer,
    source_type character varying,
    target_id integer,
    target_type character varying,
    value double precision DEFAULT 0.0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    data text
);


--
-- Name: rs_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rs_evaluations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rs_evaluations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rs_evaluations_id_seq OWNED BY rs_evaluations.id;


--
-- Name: rs_reputation_messages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rs_reputation_messages (
    id integer NOT NULL,
    sender_id integer,
    sender_type character varying,
    receiver_id integer,
    weight double precision DEFAULT 1.0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rs_reputation_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rs_reputation_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rs_reputation_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rs_reputation_messages_id_seq OWNED BY rs_reputation_messages.id;


--
-- Name: rs_reputations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rs_reputations (
    id integer NOT NULL,
    reputation_name character varying,
    value double precision DEFAULT 0.0,
    aggregated_by character varying,
    target_id integer,
    target_type character varying,
    active boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    data text
);


--
-- Name: rs_reputations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rs_reputations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rs_reputations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rs_reputations_id_seq OWNED BY rs_reputations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    var character varying NOT NULL,
    value text,
    thing_id integer,
    thing_type character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    taggable_type character varying(255),
    tagger_id integer,
    tagger_type character varying(255),
    context character varying(128),
    created_at timestamp without time zone
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    taggings_count integer DEFAULT 0,
    parent_id integer,
    lft integer,
    rgt integer,
    depth integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    content text,
    name character varying
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taxes (
    id integer NOT NULL,
    opportunity_id integer,
    description text,
    value_centavos integer DEFAULT 0 NOT NULL,
    value_currency character varying(255) DEFAULT 'BRL'::character varying NOT NULL,
    tax_type integer
);


--
-- Name: taxes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taxes_id_seq OWNED BY taxes.id;


--
-- Name: url_subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE url_subscriptions (
    id integer NOT NULL,
    url character varying,
    opportunity_id integer
);


--
-- Name: url_subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE url_subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: url_subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE url_subscriptions_id_seq OWNED BY url_subscriptions.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_preferences (
    id integer NOT NULL,
    user_id integer,
    notify_on_new_opportunity boolean DEFAULT true NOT NULL,
    send_daily_email boolean DEFAULT true NOT NULL,
    send_weekly_email boolean DEFAULT true NOT NULL,
    send_monthly_email boolean DEFAULT true NOT NULL,
    notify_on_closing_opportunities boolean DEFAULT true NOT NULL,
    never_notify_me boolean DEFAULT false NOT NULL
);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_preferences_id_seq OWNED BY user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    username character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    date_birth date,
    name character varying,
    admin boolean DEFAULT false NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    image_url character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY address_subscriptions ALTER COLUMN id SET DEFAULT nextval('address_subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications ALTER COLUMN id SET DEFAULT nextval('authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations ALTER COLUMN id SET DEFAULT nextval('authorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY avatars ALTER COLUMN id SET DEFAULT nextval('avatars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY crono_jobs ALTER COLUMN id SET DEFAULT nextval('crono_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY docs ALTER COLUMN id SET DEFAULT nextval('docs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY email_subscriptions ALTER COLUMN id SET DEFAULT nextval('email_subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entry_manners ALTER COLUMN id SET DEFAULT nextval('entry_manners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY extended_subscriptions ALTER COLUMN id SET DEFAULT nextval('extended_subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY follows ALTER COLUMN id SET DEFAULT nextval('follows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grants ALTER COLUMN id SET DEFAULT nextval('grants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY impressions ALTER COLUMN id SET DEFAULT nextval('impressions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY opportunities ALTER COLUMN id SET DEFAULT nextval('opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY opportunity_email_notifications ALTER COLUMN id SET DEFAULT nextval('opportunity_email_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prizes ALTER COLUMN id SET DEFAULT nextval('prizes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY program_responsibles ALTER COLUMN id SET DEFAULT nextval('program_responsibles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rs_evaluations ALTER COLUMN id SET DEFAULT nextval('rs_evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rs_reputation_messages ALTER COLUMN id SET DEFAULT nextval('rs_reputation_messages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rs_reputations ALTER COLUMN id SET DEFAULT nextval('rs_reputations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taxes ALTER COLUMN id SET DEFAULT nextval('taxes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY url_subscriptions ALTER COLUMN id SET DEFAULT nextval('url_subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_preferences ALTER COLUMN id SET DEFAULT nextval('user_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: address_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY address_subscriptions
    ADD CONSTRAINT address_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT authorizations_pkey PRIMARY KEY (id);


--
-- Name: avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: crono_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY crono_jobs
    ADD CONSTRAINT crono_jobs_pkey PRIMARY KEY (id);


--
-- Name: docs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY docs
    ADD CONSTRAINT docs_pkey PRIMARY KEY (id);


--
-- Name: email_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY email_subscriptions
    ADD CONSTRAINT email_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: entry_manners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entry_manners
    ADD CONSTRAINT entry_manners_pkey PRIMARY KEY (id);


--
-- Name: extended_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY extended_subscriptions
    ADD CONSTRAINT extended_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY opportunities
    ADD CONSTRAINT grants_pkey PRIMARY KEY (id);


--
-- Name: grants_pkey1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY grants
    ADD CONSTRAINT grants_pkey1 PRIMARY KEY (id);


--
-- Name: impressions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY impressions
    ADD CONSTRAINT impressions_pkey PRIMARY KEY (id);


--
-- Name: opportunity_email_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY opportunity_email_notifications
    ADD CONSTRAINT opportunity_email_notifications_pkey PRIMARY KEY (id);


--
-- Name: places_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: prizes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prizes
    ADD CONSTRAINT prizes_pkey PRIMARY KEY (id);


--
-- Name: program_responsibles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY program_responsibles
    ADD CONSTRAINT program_responsibles_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: rs_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rs_evaluations
    ADD CONSTRAINT rs_evaluations_pkey PRIMARY KEY (id);


--
-- Name: rs_reputation_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rs_reputation_messages
    ADD CONSTRAINT rs_reputation_messages_pkey PRIMARY KEY (id);


--
-- Name: rs_reputations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rs_reputations
    ADD CONSTRAINT rs_reputations_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (id);


--
-- Name: url_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY url_subscriptions
    ADD CONSTRAINT url_subscriptions_pkey PRIMARY KEY (id);


--
-- Name: user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: controlleraction_ip_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_ip_index ON impressions USING btree (controller_name, action_name, ip_address);


--
-- Name: controlleraction_request_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_request_index ON impressions USING btree (controller_name, action_name, request_hash);


--
-- Name: controlleraction_session_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX controlleraction_session_index ON impressions USING btree (controller_name, action_name, session_hash);


--
-- Name: fk_followables; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_followables ON follows USING btree (followable_id, followable_type);


--
-- Name: fk_follows; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX fk_follows ON follows USING btree (follower_id, follower_type);


--
-- Name: impressionable_type_message_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX impressionable_type_message_index ON impressions USING btree (impressionable_type, message, impressionable_id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_activities_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_owner_id_and_owner_type ON activities USING btree (owner_id, owner_type);


--
-- Name: index_activities_on_recipient_id_and_recipient_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_recipient_id_and_recipient_type ON activities USING btree (recipient_id, recipient_type);


--
-- Name: index_activities_on_trackable_id_and_trackable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_trackable_id_and_trackable_type ON activities USING btree (trackable_id, trackable_type);


--
-- Name: index_address_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_address_subscriptions_on_opportunity_id ON address_subscriptions USING btree (opportunity_id);


--
-- Name: index_authentications_on_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authentications_on_provider ON authentications USING btree (provider);


--
-- Name: index_authorizations_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_authorizations_on_user_id ON authorizations USING btree (user_id);


--
-- Name: index_avatars_on_profile_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_avatars_on_profile_id ON avatars USING btree (profile_id);


--
-- Name: index_comments_on_commentable_id_and_commentable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_commentable_id_and_commentable_type ON comments USING btree (commentable_id, commentable_type);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_crono_jobs_on_job_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_crono_jobs_on_job_id ON crono_jobs USING btree (job_id);


--
-- Name: index_docs_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_docs_on_opportunity_id ON docs USING btree (opportunity_id);


--
-- Name: index_email_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_email_subscriptions_on_opportunity_id ON email_subscriptions USING btree (opportunity_id);


--
-- Name: index_entry_manners_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_entry_manners_on_opportunity_id ON entry_manners USING btree (opportunity_id);


--
-- Name: index_extended_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_extended_subscriptions_on_opportunity_id ON extended_subscriptions USING btree (opportunity_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_grants_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_grants_on_opportunity_id ON grants USING btree (opportunity_id);


--
-- Name: index_impressions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_impressions_on_user_id ON impressions USING btree (user_id);


--
-- Name: index_opportunities_on_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_opportunities_on_author_id ON opportunities USING btree (author_id);


--
-- Name: index_opportunity_email_notifications_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_opportunity_email_notifications_on_opportunity_id ON opportunity_email_notifications USING btree (opportunity_id);


--
-- Name: index_prizes_on_grant_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_prizes_on_grant_id ON prizes USING btree (grant_id);


--
-- Name: index_prizes_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_prizes_on_opportunity_id ON prizes USING btree (opportunity_id);


--
-- Name: index_program_responsibles_on_profile_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_program_responsibles_on_profile_id ON program_responsibles USING btree (profile_id);


--
-- Name: index_program_responsibles_on_program_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_program_responsibles_on_program_id ON program_responsibles USING btree (program_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_rs_evaluations_on_reputation_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_evaluations_on_reputation_name ON rs_evaluations USING btree (reputation_name);


--
-- Name: index_rs_evaluations_on_reputation_name_and_source_and_target; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_rs_evaluations_on_reputation_name_and_source_and_target ON rs_evaluations USING btree (reputation_name, source_id, source_type, target_id, target_type);


--
-- Name: index_rs_evaluations_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_evaluations_on_source_id_and_source_type ON rs_evaluations USING btree (source_id, source_type);


--
-- Name: index_rs_evaluations_on_target_id_and_target_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_evaluations_on_target_id_and_target_type ON rs_evaluations USING btree (target_id, target_type);


--
-- Name: index_rs_reputation_messages_on_receiver_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_reputation_messages_on_receiver_id ON rs_reputation_messages USING btree (receiver_id);


--
-- Name: index_rs_reputation_messages_on_receiver_id_and_sender; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_rs_reputation_messages_on_receiver_id_and_sender ON rs_reputation_messages USING btree (receiver_id, sender_id, sender_type);


--
-- Name: index_rs_reputation_messages_on_sender_id_and_sender_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_reputation_messages_on_sender_id_and_sender_type ON rs_reputation_messages USING btree (sender_id, sender_type);


--
-- Name: index_rs_reputations_on_reputation_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_reputations_on_reputation_name ON rs_reputations USING btree (reputation_name);


--
-- Name: index_rs_reputations_on_reputation_name_and_target; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_rs_reputations_on_reputation_name_and_target ON rs_reputations USING btree (reputation_name, target_id, target_type);


--
-- Name: index_rs_reputations_on_target_id_and_target_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rs_reputations_on_target_id_and_target_type ON rs_reputations USING btree (target_id, target_type);


--
-- Name: index_settings_on_thing_type_and_thing_id_and_var; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_settings_on_thing_type_and_thing_id_and_var ON settings USING btree (thing_type, thing_id, var);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_taxes_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taxes_on_opportunity_id ON taxes USING btree (opportunity_id);


--
-- Name: index_url_subscriptions_on_opportunity_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_url_subscriptions_on_opportunity_id ON url_subscriptions USING btree (opportunity_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_user_preferences_on_user_id ON user_preferences USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: poly_ip_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_ip_index ON impressions USING btree (impressionable_type, impressionable_id, ip_address);


--
-- Name: poly_request_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_request_index ON impressions USING btree (impressionable_type, impressionable_id, request_hash);


--
-- Name: poly_session_index; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX poly_session_index ON impressions USING btree (impressionable_type, impressionable_id, session_hash);


--
-- Name: taggings_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX taggings_idx ON taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_273d330652; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY opportunity_email_notifications
    ADD CONSTRAINT fk_rails_273d330652 FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_281f34fe16; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avatars
    ADD CONSTRAINT fk_rails_281f34fe16 FOREIGN KEY (profile_id) REFERENCES profiles(id);


--
-- Name: fk_rails_46def75dff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY email_subscriptions
    ADD CONSTRAINT fk_rails_46def75dff FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_4ecef5b8c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT fk_rails_4ecef5b8c5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_554133d42a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prizes
    ADD CONSTRAINT fk_rails_554133d42a FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_5cb86641fa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY url_subscriptions
    ADD CONSTRAINT fk_rails_5cb86641fa FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_a4f627e5a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY address_subscriptions
    ADD CONSTRAINT fk_rails_a4f627e5a2 FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_a69bfcfd81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT fk_rails_a69bfcfd81 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_d23a354a40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY extended_subscriptions
    ADD CONSTRAINT fk_rails_d23a354a40 FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_df9a8fd891; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY docs
    ADD CONSTRAINT fk_rails_df9a8fd891 FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- Name: fk_rails_f1e79eaa00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entry_manners
    ADD CONSTRAINT fk_rails_f1e79eaa00 FOREIGN KEY (opportunity_id) REFERENCES opportunities(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20130909194719');

INSERT INTO schema_migrations (version) VALUES ('20140204233100');

INSERT INTO schema_migrations (version) VALUES ('20140204233952');

INSERT INTO schema_migrations (version) VALUES ('20141019214949');

INSERT INTO schema_migrations (version) VALUES ('20141019214951');

INSERT INTO schema_migrations (version) VALUES ('20141019214954');

INSERT INTO schema_migrations (version) VALUES ('20141019214957');

INSERT INTO schema_migrations (version) VALUES ('20141019214959');

INSERT INTO schema_migrations (version) VALUES ('20141019215002');

INSERT INTO schema_migrations (version) VALUES ('20141019215005');

INSERT INTO schema_migrations (version) VALUES ('20141019215008');

INSERT INTO schema_migrations (version) VALUES ('20141019215011');

INSERT INTO schema_migrations (version) VALUES ('20141019215014');

INSERT INTO schema_migrations (version) VALUES ('20141019215016');

INSERT INTO schema_migrations (version) VALUES ('20141019215020');

INSERT INTO schema_migrations (version) VALUES ('20141019224952');

INSERT INTO schema_migrations (version) VALUES ('20141019225535');

INSERT INTO schema_migrations (version) VALUES ('20141020010350');

INSERT INTO schema_migrations (version) VALUES ('20141020010614');

INSERT INTO schema_migrations (version) VALUES ('20141020062422');

INSERT INTO schema_migrations (version) VALUES ('20141020063037');

INSERT INTO schema_migrations (version) VALUES ('20141023044847');

INSERT INTO schema_migrations (version) VALUES ('20141024000504');

INSERT INTO schema_migrations (version) VALUES ('20141024023829');

INSERT INTO schema_migrations (version) VALUES ('20141024044353');

INSERT INTO schema_migrations (version) VALUES ('20141025002604');

INSERT INTO schema_migrations (version) VALUES ('20141102045201');

INSERT INTO schema_migrations (version) VALUES ('20141102045202');

INSERT INTO schema_migrations (version) VALUES ('20141102045203');

INSERT INTO schema_migrations (version) VALUES ('20141102045204');

INSERT INTO schema_migrations (version) VALUES ('20141103025201');

INSERT INTO schema_migrations (version) VALUES ('20141106051403');

INSERT INTO schema_migrations (version) VALUES ('20141106051438');

INSERT INTO schema_migrations (version) VALUES ('20141106051505');

INSERT INTO schema_migrations (version) VALUES ('20141106051526');

INSERT INTO schema_migrations (version) VALUES ('20141106051602');

INSERT INTO schema_migrations (version) VALUES ('20141106051643');

INSERT INTO schema_migrations (version) VALUES ('20141106051704');

INSERT INTO schema_migrations (version) VALUES ('20141106060233');

INSERT INTO schema_migrations (version) VALUES ('20141106144003');

INSERT INTO schema_migrations (version) VALUES ('20141106144040');

INSERT INTO schema_migrations (version) VALUES ('20141106152807');

INSERT INTO schema_migrations (version) VALUES ('20141106153024');

INSERT INTO schema_migrations (version) VALUES ('20141106153025');

INSERT INTO schema_migrations (version) VALUES ('20141106153026');

INSERT INTO schema_migrations (version) VALUES ('20141106153027');

INSERT INTO schema_migrations (version) VALUES ('20141106153028');

INSERT INTO schema_migrations (version) VALUES ('20141106153029');

INSERT INTO schema_migrations (version) VALUES ('20141106153030');

INSERT INTO schema_migrations (version) VALUES ('20141106153031');

INSERT INTO schema_migrations (version) VALUES ('20141106153032');

INSERT INTO schema_migrations (version) VALUES ('20141107022144');

INSERT INTO schema_migrations (version) VALUES ('20141107031601');

INSERT INTO schema_migrations (version) VALUES ('20141107033746');

INSERT INTO schema_migrations (version) VALUES ('20141109222251');

INSERT INTO schema_migrations (version) VALUES ('20141110115330');

INSERT INTO schema_migrations (version) VALUES ('20141111184529');

INSERT INTO schema_migrations (version) VALUES ('20141111190907');

INSERT INTO schema_migrations (version) VALUES ('20141111195627');

INSERT INTO schema_migrations (version) VALUES ('20141111201102');

INSERT INTO schema_migrations (version) VALUES ('20141120175257');

INSERT INTO schema_migrations (version) VALUES ('20141123123358');

INSERT INTO schema_migrations (version) VALUES ('20141215025716');

INSERT INTO schema_migrations (version) VALUES ('20141215033437');

INSERT INTO schema_migrations (version) VALUES ('20141224042444');

INSERT INTO schema_migrations (version) VALUES ('20141224085642');

INSERT INTO schema_migrations (version) VALUES ('20141226114515');

INSERT INTO schema_migrations (version) VALUES ('20141226121619');

INSERT INTO schema_migrations (version) VALUES ('20141226122900');

INSERT INTO schema_migrations (version) VALUES ('20141226124610');

INSERT INTO schema_migrations (version) VALUES ('20141227085523');

INSERT INTO schema_migrations (version) VALUES ('20150102004835');

INSERT INTO schema_migrations (version) VALUES ('20150102065959');

INSERT INTO schema_migrations (version) VALUES ('20150103180048');

INSERT INTO schema_migrations (version) VALUES ('20150103193830');

INSERT INTO schema_migrations (version) VALUES ('20150103202204');

INSERT INTO schema_migrations (version) VALUES ('20150207172252');

INSERT INTO schema_migrations (version) VALUES ('20150207173838');

INSERT INTO schema_migrations (version) VALUES ('20150208130929');

INSERT INTO schema_migrations (version) VALUES ('20150213141056');

INSERT INTO schema_migrations (version) VALUES ('20150217191158');

INSERT INTO schema_migrations (version) VALUES ('20150217191744');

INSERT INTO schema_migrations (version) VALUES ('20150217195109');

INSERT INTO schema_migrations (version) VALUES ('20150218044658');

INSERT INTO schema_migrations (version) VALUES ('20150505184403');

INSERT INTO schema_migrations (version) VALUES ('20150506135457');

INSERT INTO schema_migrations (version) VALUES ('20150506135647');

INSERT INTO schema_migrations (version) VALUES ('20150506140733');

INSERT INTO schema_migrations (version) VALUES ('20150506140903');

INSERT INTO schema_migrations (version) VALUES ('20150506140919');

INSERT INTO schema_migrations (version) VALUES ('20150506141009');

INSERT INTO schema_migrations (version) VALUES ('20150506141601');

INSERT INTO schema_migrations (version) VALUES ('20150506141636');

INSERT INTO schema_migrations (version) VALUES ('20150506142010');

INSERT INTO schema_migrations (version) VALUES ('20150506142408');

INSERT INTO schema_migrations (version) VALUES ('20150507161900');

INSERT INTO schema_migrations (version) VALUES ('20150515135225');

INSERT INTO schema_migrations (version) VALUES ('20150515151715');

INSERT INTO schema_migrations (version) VALUES ('20150515193012');

INSERT INTO schema_migrations (version) VALUES ('20150515223314');

INSERT INTO schema_migrations (version) VALUES ('20150516000019');

INSERT INTO schema_migrations (version) VALUES ('20150517133913');

INSERT INTO schema_migrations (version) VALUES ('20150517141524');

INSERT INTO schema_migrations (version) VALUES ('20150517142906');

INSERT INTO schema_migrations (version) VALUES ('20150523010354');

INSERT INTO schema_migrations (version) VALUES ('20150526133809');

INSERT INTO schema_migrations (version) VALUES ('20150613231548');

INSERT INTO schema_migrations (version) VALUES ('20150614000636');

INSERT INTO schema_migrations (version) VALUES ('20150614001010');

INSERT INTO schema_migrations (version) VALUES ('20150614153313');

INSERT INTO schema_migrations (version) VALUES ('20150614153950');

INSERT INTO schema_migrations (version) VALUES ('20150615125021');

INSERT INTO schema_migrations (version) VALUES ('20150615125351');

INSERT INTO schema_migrations (version) VALUES ('20150615202626');

INSERT INTO schema_migrations (version) VALUES ('20150615204218');

INSERT INTO schema_migrations (version) VALUES ('20150615205606');

INSERT INTO schema_migrations (version) VALUES ('20150619183346');

INSERT INTO schema_migrations (version) VALUES ('20150621165446');

INSERT INTO schema_migrations (version) VALUES ('20150621214450');

INSERT INTO schema_migrations (version) VALUES ('20150621214451');

INSERT INTO schema_migrations (version) VALUES ('20150622140258');

INSERT INTO schema_migrations (version) VALUES ('20150625030520');

INSERT INTO schema_migrations (version) VALUES ('20150701003751');

INSERT INTO schema_migrations (version) VALUES ('20150701210907');

INSERT INTO schema_migrations (version) VALUES ('20150709175922');

INSERT INTO schema_migrations (version) VALUES ('20150709180425');

INSERT INTO schema_migrations (version) VALUES ('20150713212952');

INSERT INTO schema_migrations (version) VALUES ('20150925135333');

INSERT INTO schema_migrations (version) VALUES ('20150925150653');

INSERT INTO schema_migrations (version) VALUES ('20150925151711');

INSERT INTO schema_migrations (version) VALUES ('20150925182046');

INSERT INTO schema_migrations (version) VALUES ('20150925185021');

INSERT INTO schema_migrations (version) VALUES ('20150925190044');

INSERT INTO schema_migrations (version) VALUES ('20150925190358');

INSERT INTO schema_migrations (version) VALUES ('20150925190627');

INSERT INTO schema_migrations (version) VALUES ('20150925191013');

INSERT INTO schema_migrations (version) VALUES ('20150925192828');

INSERT INTO schema_migrations (version) VALUES ('20150925193155');

INSERT INTO schema_migrations (version) VALUES ('20150925193308');

INSERT INTO schema_migrations (version) VALUES ('20150925194955');

INSERT INTO schema_migrations (version) VALUES ('20150925201131');

INSERT INTO schema_migrations (version) VALUES ('20150925201336');

INSERT INTO schema_migrations (version) VALUES ('20150925202043');

INSERT INTO schema_migrations (version) VALUES ('20150925202224');

INSERT INTO schema_migrations (version) VALUES ('20150925202337');

INSERT INTO schema_migrations (version) VALUES ('20150925202419');

INSERT INTO schema_migrations (version) VALUES ('20150925202447');

INSERT INTO schema_migrations (version) VALUES ('20150925202929');

INSERT INTO schema_migrations (version) VALUES ('20150925203913');

INSERT INTO schema_migrations (version) VALUES ('20151001130403');

INSERT INTO schema_migrations (version) VALUES ('20151001220732');

INSERT INTO schema_migrations (version) VALUES ('20151001221007');

INSERT INTO schema_migrations (version) VALUES ('20151001221255');

INSERT INTO schema_migrations (version) VALUES ('20151001221603');

INSERT INTO schema_migrations (version) VALUES ('20151005013546');

INSERT INTO schema_migrations (version) VALUES ('20151006070007');

INSERT INTO schema_migrations (version) VALUES ('20151009232748');

INSERT INTO schema_migrations (version) VALUES ('20151009235201');

INSERT INTO schema_migrations (version) VALUES ('20151011023139');

INSERT INTO schema_migrations (version) VALUES ('20151011122838');

INSERT INTO schema_migrations (version) VALUES ('20151027141450');

INSERT INTO schema_migrations (version) VALUES ('20151027143934');

INSERT INTO schema_migrations (version) VALUES ('20151027151322');

INSERT INTO schema_migrations (version) VALUES ('20151028223317');

INSERT INTO schema_migrations (version) VALUES ('20151029181453');

INSERT INTO schema_migrations (version) VALUES ('20151110014311');

INSERT INTO schema_migrations (version) VALUES ('20151111160816');

INSERT INTO schema_migrations (version) VALUES ('20151117132108');

INSERT INTO schema_migrations (version) VALUES ('20151117132420');

INSERT INTO schema_migrations (version) VALUES ('20151118171927');

INSERT INTO schema_migrations (version) VALUES ('20151121182749');

INSERT INTO schema_migrations (version) VALUES ('20151123054655');

INSERT INTO schema_migrations (version) VALUES ('20151123221914');

INSERT INTO schema_migrations (version) VALUES ('20151125140652');

INSERT INTO schema_migrations (version) VALUES ('20151125161105');

INSERT INTO schema_migrations (version) VALUES ('20151125161834');

INSERT INTO schema_migrations (version) VALUES ('20151125164517');

INSERT INTO schema_migrations (version) VALUES ('20151125165400');

INSERT INTO schema_migrations (version) VALUES ('20151125165635');

INSERT INTO schema_migrations (version) VALUES ('20151127103559');

INSERT INTO schema_migrations (version) VALUES ('20151127103919');

INSERT INTO schema_migrations (version) VALUES ('20151127110245');

INSERT INTO schema_migrations (version) VALUES ('20151127110347');

INSERT INTO schema_migrations (version) VALUES ('20151127115815');

INSERT INTO schema_migrations (version) VALUES ('20151127145538');

INSERT INTO schema_migrations (version) VALUES ('20151201183127');

INSERT INTO schema_migrations (version) VALUES ('20151211182949');

INSERT INTO schema_migrations (version) VALUES ('20160121181145');

INSERT INTO schema_migrations (version) VALUES ('20160121184239');

INSERT INTO schema_migrations (version) VALUES ('20160121192138');

INSERT INTO schema_migrations (version) VALUES ('20160121192228');

INSERT INTO schema_migrations (version) VALUES ('20160122193631');

INSERT INTO schema_migrations (version) VALUES ('20160125200429');

INSERT INTO schema_migrations (version) VALUES ('20160125203622');

INSERT INTO schema_migrations (version) VALUES ('20160211144058');

INSERT INTO schema_migrations (version) VALUES ('20160211144936');

INSERT INTO schema_migrations (version) VALUES ('20160216053328');

INSERT INTO schema_migrations (version) VALUES ('20160221000745');

INSERT INTO schema_migrations (version) VALUES ('20160223161022');

INSERT INTO schema_migrations (version) VALUES ('20160224055325');

INSERT INTO schema_migrations (version) VALUES ('20160224055416');

INSERT INTO schema_migrations (version) VALUES ('20160224055447');

INSERT INTO schema_migrations (version) VALUES ('20160229231847');

INSERT INTO schema_migrations (version) VALUES ('20160301214906');

INSERT INTO schema_migrations (version) VALUES ('20160301214954');

INSERT INTO schema_migrations (version) VALUES ('20160301222303');

INSERT INTO schema_migrations (version) VALUES ('20160301222357');

INSERT INTO schema_migrations (version) VALUES ('20160301222756');

INSERT INTO schema_migrations (version) VALUES ('20160301223021');

INSERT INTO schema_migrations (version) VALUES ('20160301223206');

INSERT INTO schema_migrations (version) VALUES ('20160301223426');

INSERT INTO schema_migrations (version) VALUES ('20160319143500');

INSERT INTO schema_migrations (version) VALUES ('20160325141101');

INSERT INTO schema_migrations (version) VALUES ('20160415020409');

INSERT INTO schema_migrations (version) VALUES ('20160511140023');

INSERT INTO schema_migrations (version) VALUES ('20160511161333');

INSERT INTO schema_migrations (version) VALUES ('20160525212745');

INSERT INTO schema_migrations (version) VALUES ('20160527201302');

INSERT INTO schema_migrations (version) VALUES ('20160527201353');

INSERT INTO schema_migrations (version) VALUES ('20160527201513');

INSERT INTO schema_migrations (version) VALUES ('20160527201609');

INSERT INTO schema_migrations (version) VALUES ('20160527201659');

INSERT INTO schema_migrations (version) VALUES ('20160527201801');

INSERT INTO schema_migrations (version) VALUES ('20160527201933');

INSERT INTO schema_migrations (version) VALUES ('20160527201957');

INSERT INTO schema_migrations (version) VALUES ('20160527202051');

INSERT INTO schema_migrations (version) VALUES ('20160527202105');

INSERT INTO schema_migrations (version) VALUES ('20160527202222');

INSERT INTO schema_migrations (version) VALUES ('20160527202249');

INSERT INTO schema_migrations (version) VALUES ('20160530203301');

INSERT INTO schema_migrations (version) VALUES ('20160610002946');

INSERT INTO schema_migrations (version) VALUES ('20160617203008');

INSERT INTO schema_migrations (version) VALUES ('20160617205640');

INSERT INTO schema_migrations (version) VALUES ('20160706030303');

INSERT INTO schema_migrations (version) VALUES ('20161004184817');

INSERT INTO schema_migrations (version) VALUES ('20161004192220');

INSERT INTO schema_migrations (version) VALUES ('20161006134932');

INSERT INTO schema_migrations (version) VALUES ('20161006144220');

INSERT INTO schema_migrations (version) VALUES ('20161011151924');

INSERT INTO schema_migrations (version) VALUES ('20161017141926');

INSERT INTO schema_migrations (version) VALUES ('20161113180523');

INSERT INTO schema_migrations (version) VALUES ('20161129173006');

INSERT INTO schema_migrations (version) VALUES ('20161220170948');

INSERT INTO schema_migrations (version) VALUES ('20161222175158');

INSERT INTO schema_migrations (version) VALUES ('20170120164021');

INSERT INTO schema_migrations (version) VALUES ('20170124171358');

INSERT INTO schema_migrations (version) VALUES ('20170124171757');

INSERT INTO schema_migrations (version) VALUES ('20170207170308');

INSERT INTO schema_migrations (version) VALUES ('20170207170419');

INSERT INTO schema_migrations (version) VALUES ('20170311043816');

INSERT INTO schema_migrations (version) VALUES ('20170311052847');

INSERT INTO schema_migrations (version) VALUES ('20170314190700');

INSERT INTO schema_migrations (version) VALUES ('20170410141611');

INSERT INTO schema_migrations (version) VALUES ('20170508182547');

INSERT INTO schema_migrations (version) VALUES ('20170511223137');

INSERT INTO schema_migrations (version) VALUES ('20170516185117');

INSERT INTO schema_migrations (version) VALUES ('20170706043428');

INSERT INTO schema_migrations (version) VALUES ('20170706044434');

INSERT INTO schema_migrations (version) VALUES ('20170706044435');

INSERT INTO schema_migrations (version) VALUES ('20170706044436');

INSERT INTO schema_migrations (version) VALUES ('20170706044437');

INSERT INTO schema_migrations (version) VALUES ('20170706044438');

INSERT INTO schema_migrations (version) VALUES ('20170706044439');

INSERT INTO schema_migrations (version) VALUES ('20170706044440');

INSERT INTO schema_migrations (version) VALUES ('20170706044441');

INSERT INTO schema_migrations (version) VALUES ('20170706044442');

INSERT INTO schema_migrations (version) VALUES ('20170721215407');

INSERT INTO schema_migrations (version) VALUES ('20170728194906');

INSERT INTO schema_migrations (version) VALUES ('20170806063902');

INSERT INTO schema_migrations (version) VALUES ('20170808025854');

