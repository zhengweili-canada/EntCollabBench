--
-- PostgreSQL database dump
--

\restrict WGXwh3Sppd1sqdQi551cnNRgB0LcVHAEn8x9UZqdSmoFhqQFEo6DeUAvPAlFWZa

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

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
-- Name: access; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint,
    mode integer
);


ALTER TABLE public.access OWNER TO gitea;

--
-- Name: access_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.access_id_seq OWNER TO gitea;

--
-- Name: access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_id_seq OWNED BY public.access.id;


--
-- Name: access_token; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.access_token (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    token_hash character varying(255),
    token_salt character varying(255),
    token_last_eight character varying(255),
    scope character varying(255),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.access_token OWNER TO gitea;

--
-- Name: access_token_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.access_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.access_token_id_seq OWNER TO gitea;

--
-- Name: access_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.access_token_id_seq OWNED BY public.access_token.id;


--
-- Name: action; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action (
    id bigint NOT NULL,
    user_id bigint,
    op_type integer,
    act_user_id bigint,
    repo_id bigint,
    comment_id bigint,
    is_deleted boolean DEFAULT false NOT NULL,
    ref_name character varying(255),
    is_private boolean DEFAULT false NOT NULL,
    content text,
    created_unix bigint
);


ALTER TABLE public.action OWNER TO gitea;

--
-- Name: action_artifact; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_artifact (
    id bigint NOT NULL,
    run_id bigint,
    runner_id bigint,
    repo_id bigint,
    owner_id bigint,
    commit_sha character varying(255),
    storage_path character varying(255),
    file_size bigint,
    file_compressed_size bigint,
    content_encoding character varying(255),
    artifact_path character varying(255),
    artifact_name character varying(255),
    status bigint,
    created_unix bigint,
    updated_unix bigint,
    expired_unix bigint
);


ALTER TABLE public.action_artifact OWNER TO gitea;

--
-- Name: action_artifact_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_artifact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_artifact_id_seq OWNER TO gitea;

--
-- Name: action_artifact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_artifact_id_seq OWNED BY public.action_artifact.id;


--
-- Name: action_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_id_seq OWNER TO gitea;

--
-- Name: action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_id_seq OWNED BY public.action.id;


--
-- Name: action_run; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_run (
    id bigint NOT NULL,
    title character varying(255),
    repo_id bigint,
    owner_id bigint,
    workflow_id character varying(255),
    index bigint,
    trigger_user_id bigint,
    schedule_id bigint,
    ref character varying(255),
    commit_sha character varying(255),
    is_fork_pull_request boolean,
    need_approval boolean,
    approved_by bigint,
    event character varying(255),
    event_payload text,
    trigger_event character varying(255),
    status integer,
    version integer DEFAULT 0,
    started bigint,
    stopped bigint,
    previous_duration bigint,
    created bigint,
    updated bigint
);


ALTER TABLE public.action_run OWNER TO gitea;

--
-- Name: action_run_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_run_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_run_id_seq OWNER TO gitea;

--
-- Name: action_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_run_id_seq OWNED BY public.action_run.id;


--
-- Name: action_run_index; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_run_index (
    group_id bigint NOT NULL,
    max_index bigint
);


ALTER TABLE public.action_run_index OWNER TO gitea;

--
-- Name: action_run_job; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_run_job (
    id bigint NOT NULL,
    run_id bigint,
    repo_id bigint,
    owner_id bigint,
    commit_sha character varying(255),
    is_fork_pull_request boolean,
    name character varying(255),
    attempt bigint,
    workflow_payload bytea,
    job_id character varying(255),
    needs text,
    runs_on text,
    task_id bigint,
    status integer,
    started bigint,
    stopped bigint,
    created bigint,
    updated bigint
);


ALTER TABLE public.action_run_job OWNER TO gitea;

--
-- Name: action_run_job_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_run_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_run_job_id_seq OWNER TO gitea;

--
-- Name: action_run_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_run_job_id_seq OWNED BY public.action_run_job.id;


--
-- Name: action_runner; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_runner (
    id bigint NOT NULL,
    uuid character(36),
    name character varying(255),
    version character varying(64),
    owner_id bigint,
    repo_id bigint,
    description text,
    base integer,
    repo_range character varying(255),
    token_hash character varying(255),
    token_salt character varying(255),
    last_online bigint,
    last_active bigint,
    agent_labels text,
    ephemeral boolean DEFAULT false NOT NULL,
    created bigint,
    updated bigint,
    deleted bigint
);


ALTER TABLE public.action_runner OWNER TO gitea;

--
-- Name: action_runner_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_runner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_runner_id_seq OWNER TO gitea;

--
-- Name: action_runner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_runner_id_seq OWNED BY public.action_runner.id;


--
-- Name: action_runner_token; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_runner_token (
    id bigint NOT NULL,
    token character varying(255),
    owner_id bigint,
    repo_id bigint,
    is_active boolean,
    created bigint,
    updated bigint,
    deleted bigint
);


ALTER TABLE public.action_runner_token OWNER TO gitea;

--
-- Name: action_runner_token_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_runner_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_runner_token_id_seq OWNER TO gitea;

--
-- Name: action_runner_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_runner_token_id_seq OWNED BY public.action_runner_token.id;


--
-- Name: action_schedule; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_schedule (
    id bigint NOT NULL,
    title character varying(255),
    specs text,
    repo_id bigint,
    owner_id bigint,
    workflow_id character varying(255),
    trigger_user_id bigint,
    ref character varying(255),
    commit_sha character varying(255),
    event character varying(255),
    event_payload text,
    content bytea,
    created bigint,
    updated bigint
);


ALTER TABLE public.action_schedule OWNER TO gitea;

--
-- Name: action_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_schedule_id_seq OWNER TO gitea;

--
-- Name: action_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_schedule_id_seq OWNED BY public.action_schedule.id;


--
-- Name: action_schedule_spec; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_schedule_spec (
    id bigint NOT NULL,
    repo_id bigint,
    schedule_id bigint,
    next bigint,
    prev bigint,
    spec character varying(255),
    created bigint,
    updated bigint
);


ALTER TABLE public.action_schedule_spec OWNER TO gitea;

--
-- Name: action_schedule_spec_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_schedule_spec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_schedule_spec_id_seq OWNER TO gitea;

--
-- Name: action_schedule_spec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_schedule_spec_id_seq OWNED BY public.action_schedule_spec.id;


--
-- Name: action_task; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_task (
    id bigint NOT NULL,
    job_id bigint,
    attempt bigint,
    runner_id bigint,
    status integer,
    started bigint,
    stopped bigint,
    repo_id bigint,
    owner_id bigint,
    commit_sha character varying(255),
    is_fork_pull_request boolean,
    token_hash character varying(255),
    token_salt character varying(255),
    token_last_eight character varying(255),
    log_filename character varying(255),
    log_in_storage boolean,
    log_length bigint,
    log_size bigint,
    log_indexes bytea,
    log_expired boolean,
    created bigint,
    updated bigint
);


ALTER TABLE public.action_task OWNER TO gitea;

--
-- Name: action_task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_task_id_seq OWNER TO gitea;

--
-- Name: action_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_task_id_seq OWNED BY public.action_task.id;


--
-- Name: action_task_output; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_task_output (
    id bigint NOT NULL,
    task_id bigint,
    output_key character varying(255),
    output_value text
);


ALTER TABLE public.action_task_output OWNER TO gitea;

--
-- Name: action_task_output_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_task_output_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_task_output_id_seq OWNER TO gitea;

--
-- Name: action_task_output_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_task_output_id_seq OWNED BY public.action_task_output.id;


--
-- Name: action_task_step; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_task_step (
    id bigint NOT NULL,
    name character varying(255),
    task_id bigint,
    index bigint,
    repo_id bigint,
    status integer,
    log_index bigint,
    log_length bigint,
    started bigint,
    stopped bigint,
    created bigint,
    updated bigint
);


ALTER TABLE public.action_task_step OWNER TO gitea;

--
-- Name: action_task_step_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_task_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_task_step_id_seq OWNER TO gitea;

--
-- Name: action_task_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_task_step_id_seq OWNED BY public.action_task_step.id;


--
-- Name: action_tasks_version; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_tasks_version (
    id bigint NOT NULL,
    owner_id bigint,
    repo_id bigint,
    version bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.action_tasks_version OWNER TO gitea;

--
-- Name: action_tasks_version_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_tasks_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_tasks_version_id_seq OWNER TO gitea;

--
-- Name: action_tasks_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_tasks_version_id_seq OWNED BY public.action_tasks_version.id;


--
-- Name: action_variable; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.action_variable (
    id bigint NOT NULL,
    owner_id bigint,
    repo_id bigint,
    name character varying(255) NOT NULL,
    data text NOT NULL,
    description text,
    created_unix bigint NOT NULL,
    updated_unix bigint
);


ALTER TABLE public.action_variable OWNER TO gitea;

--
-- Name: action_variable_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.action_variable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_variable_id_seq OWNER TO gitea;

--
-- Name: action_variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.action_variable_id_seq OWNED BY public.action_variable.id;


--
-- Name: app_state; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.app_state (
    id character varying(200) NOT NULL,
    revision bigint,
    content text
);


ALTER TABLE public.app_state OWNER TO gitea;

--
-- Name: attachment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    uuid uuid,
    repo_id bigint,
    issue_id bigint,
    release_id bigint,
    uploader_id bigint DEFAULT 0,
    comment_id bigint,
    name character varying(255),
    download_count bigint DEFAULT 0,
    size bigint DEFAULT 0,
    created_unix bigint
);


ALTER TABLE public.attachment OWNER TO gitea;

--
-- Name: attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.attachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attachment_id_seq OWNER TO gitea;

--
-- Name: attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.attachment_id_seq OWNED BY public.attachment.id;


--
-- Name: auth_token; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.auth_token (
    id character varying(255) NOT NULL,
    token_hash character varying(255),
    user_id bigint,
    expires_unix bigint
);


ALTER TABLE public.auth_token OWNER TO gitea;

--
-- Name: badge; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.badge (
    id bigint NOT NULL,
    slug character varying(255),
    description character varying(255),
    image_url character varying(255)
);


ALTER TABLE public.badge OWNER TO gitea;

--
-- Name: badge_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.badge_id_seq OWNER TO gitea;

--
-- Name: badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.badge_id_seq OWNED BY public.badge.id;


--
-- Name: branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.branch (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255) NOT NULL,
    commit_id character varying(255),
    commit_message text,
    pusher_id bigint,
    is_deleted boolean,
    deleted_by_id bigint,
    deleted_unix bigint,
    commit_time bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.branch OWNER TO gitea;

--
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_id_seq OWNER TO gitea;

--
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- Name: collaboration; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.collaboration (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    user_id bigint NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.collaboration OWNER TO gitea;

--
-- Name: collaboration_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.collaboration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collaboration_id_seq OWNER TO gitea;

--
-- Name: collaboration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.collaboration_id_seq OWNED BY public.collaboration.id;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.comment (
    id bigint NOT NULL,
    type integer,
    poster_id bigint,
    original_author character varying(255),
    original_author_id bigint,
    issue_id bigint,
    label_id bigint,
    old_project_id bigint,
    project_id bigint,
    old_milestone_id bigint,
    milestone_id bigint,
    time_id bigint,
    assignee_id bigint,
    removed_assignee boolean,
    assignee_team_id bigint DEFAULT 0 NOT NULL,
    resolve_doer_id bigint,
    old_title character varying(255),
    new_title character varying(255),
    old_ref character varying(255),
    new_ref character varying(255),
    dependent_issue_id bigint,
    commit_id bigint,
    line bigint,
    tree_path character varying(4000),
    content text,
    content_version integer DEFAULT 0 NOT NULL,
    patch text,
    created_unix bigint,
    updated_unix bigint,
    commit_sha character varying(64),
    review_id bigint,
    invalidated boolean,
    ref_repo_id bigint,
    ref_issue_id bigint,
    ref_comment_id bigint,
    ref_action smallint,
    ref_is_pull boolean,
    comment_meta_data text
);


ALTER TABLE public.comment OWNER TO gitea;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_id_seq OWNER TO gitea;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: commit_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.commit_status (
    id bigint NOT NULL,
    index bigint,
    repo_id bigint,
    state character varying(7) NOT NULL,
    sha character varying(64) NOT NULL,
    target_url text,
    description text,
    context_hash character varying(64),
    context text,
    creator_id bigint,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.commit_status OWNER TO gitea;

--
-- Name: commit_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.commit_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commit_status_id_seq OWNER TO gitea;

--
-- Name: commit_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.commit_status_id_seq OWNED BY public.commit_status.id;


--
-- Name: commit_status_index; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.commit_status_index (
    id bigint NOT NULL,
    repo_id bigint,
    sha character varying(255),
    max_index bigint
);


ALTER TABLE public.commit_status_index OWNER TO gitea;

--
-- Name: commit_status_index_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.commit_status_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commit_status_index_id_seq OWNER TO gitea;

--
-- Name: commit_status_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.commit_status_index_id_seq OWNED BY public.commit_status_index.id;


--
-- Name: commit_status_summary; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.commit_status_summary (
    id bigint NOT NULL,
    repo_id bigint,
    sha character varying(64) NOT NULL,
    state character varying(7) NOT NULL,
    target_url text
);


ALTER TABLE public.commit_status_summary OWNER TO gitea;

--
-- Name: commit_status_summary_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.commit_status_summary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.commit_status_summary_id_seq OWNER TO gitea;

--
-- Name: commit_status_summary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.commit_status_summary_id_seq OWNED BY public.commit_status_summary.id;


--
-- Name: dbfs_data; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.dbfs_data (
    id bigint NOT NULL,
    revision bigint NOT NULL,
    meta_id bigint NOT NULL,
    blob_offset bigint NOT NULL,
    blob_size bigint NOT NULL,
    blob_data bytea NOT NULL
);


ALTER TABLE public.dbfs_data OWNER TO gitea;

--
-- Name: dbfs_data_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.dbfs_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dbfs_data_id_seq OWNER TO gitea;

--
-- Name: dbfs_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.dbfs_data_id_seq OWNED BY public.dbfs_data.id;


--
-- Name: dbfs_meta; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.dbfs_meta (
    id bigint NOT NULL,
    full_path character varying(500) NOT NULL,
    block_size bigint NOT NULL,
    file_size bigint NOT NULL,
    create_timestamp bigint NOT NULL,
    modify_timestamp bigint NOT NULL
);


ALTER TABLE public.dbfs_meta OWNER TO gitea;

--
-- Name: dbfs_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.dbfs_meta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dbfs_meta_id_seq OWNER TO gitea;

--
-- Name: dbfs_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.dbfs_meta_id_seq OWNED BY public.dbfs_meta.id;


--
-- Name: deploy_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.deploy_key (
    id bigint NOT NULL,
    key_id bigint,
    repo_id bigint,
    name character varying(255),
    fingerprint character varying(255),
    mode integer DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.deploy_key OWNER TO gitea;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.deploy_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deploy_key_id_seq OWNER TO gitea;

--
-- Name: deploy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.deploy_key_id_seq OWNED BY public.deploy_key.id;


--
-- Name: email_address; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.email_address (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    email character varying(255) NOT NULL,
    lower_email character varying(255) NOT NULL,
    is_activated boolean,
    is_primary boolean DEFAULT false NOT NULL
);


ALTER TABLE public.email_address OWNER TO gitea;

--
-- Name: email_address_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.email_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.email_address_id_seq OWNER TO gitea;

--
-- Name: email_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.email_address_id_seq OWNED BY public.email_address.id;


--
-- Name: email_hash; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.email_hash (
    hash character varying(32) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.email_hash OWNER TO gitea;

--
-- Name: external_login_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.external_login_user (
    external_id character varying(255) NOT NULL,
    user_id bigint NOT NULL,
    login_source_id bigint NOT NULL,
    raw_data text,
    provider character varying(25),
    email character varying(255),
    name character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    nick_name character varying(255),
    description character varying(255),
    avatar_url text,
    location character varying(255),
    access_token text,
    access_token_secret text,
    refresh_token text,
    expires_at timestamp without time zone
);


ALTER TABLE public.external_login_user OWNER TO gitea;

--
-- Name: follow; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.follow (
    id bigint NOT NULL,
    user_id bigint,
    follow_id bigint,
    created_unix bigint
);


ALTER TABLE public.follow OWNER TO gitea;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.follow_id_seq OWNER TO gitea;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.follow_id_seq OWNED BY public.follow.id;


--
-- Name: gpg_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.gpg_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    key_id character(16) NOT NULL,
    primary_key_id character(16),
    content text NOT NULL,
    created_unix bigint,
    expired_unix bigint,
    added_unix bigint,
    emails text,
    verified boolean DEFAULT false NOT NULL,
    can_sign boolean,
    can_encrypt_comms boolean,
    can_encrypt_storage boolean,
    can_certify boolean
);


ALTER TABLE public.gpg_key OWNER TO gitea;

--
-- Name: gpg_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.gpg_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gpg_key_id_seq OWNER TO gitea;

--
-- Name: gpg_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.gpg_key_id_seq OWNED BY public.gpg_key.id;


--
-- Name: gpg_key_import; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.gpg_key_import (
    key_id character(16) NOT NULL,
    content text NOT NULL
);


ALTER TABLE public.gpg_key_import OWNER TO gitea;

--
-- Name: hook_task; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.hook_task (
    id bigint NOT NULL,
    hook_id bigint,
    uuid character varying(255),
    payload_content text,
    payload_version integer DEFAULT 1,
    event_type character varying(255),
    is_delivered boolean,
    delivered bigint,
    is_succeed boolean,
    request_content text,
    response_content text
);


ALTER TABLE public.hook_task OWNER TO gitea;

--
-- Name: hook_task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.hook_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hook_task_id_seq OWNER TO gitea;

--
-- Name: hook_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.hook_task_id_seq OWNED BY public.hook_task.id;


--
-- Name: issue; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue (
    id bigint NOT NULL,
    repo_id bigint,
    index bigint,
    poster_id bigint,
    original_author character varying(255),
    original_author_id bigint,
    name character varying(255),
    content text,
    content_version integer DEFAULT 0 NOT NULL,
    milestone_id bigint,
    priority integer,
    is_closed boolean,
    is_pull boolean,
    num_comments integer,
    ref character varying(255),
    deadline_unix bigint,
    created_unix bigint,
    updated_unix bigint,
    closed_unix bigint,
    is_locked boolean DEFAULT false NOT NULL,
    time_estimate bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.issue OWNER TO gitea;

--
-- Name: issue_assignees; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_assignees (
    id bigint NOT NULL,
    assignee_id bigint,
    issue_id bigint
);


ALTER TABLE public.issue_assignees OWNER TO gitea;

--
-- Name: issue_assignees_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_assignees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_assignees_id_seq OWNER TO gitea;

--
-- Name: issue_assignees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_assignees_id_seq OWNED BY public.issue_assignees.id;


--
-- Name: issue_content_history; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_content_history (
    id bigint NOT NULL,
    poster_id bigint,
    issue_id bigint,
    comment_id bigint,
    edited_unix bigint,
    content_text text,
    is_first_created boolean,
    is_deleted boolean
);


ALTER TABLE public.issue_content_history OWNER TO gitea;

--
-- Name: issue_content_history_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_content_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_content_history_id_seq OWNER TO gitea;

--
-- Name: issue_content_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_content_history_id_seq OWNED BY public.issue_content_history.id;


--
-- Name: issue_dependency; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_dependency (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    dependency_id bigint NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.issue_dependency OWNER TO gitea;

--
-- Name: issue_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_dependency_id_seq OWNER TO gitea;

--
-- Name: issue_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_dependency_id_seq OWNED BY public.issue_dependency.id;


--
-- Name: issue_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_id_seq OWNER TO gitea;

--
-- Name: issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_id_seq OWNED BY public.issue.id;


--
-- Name: issue_index; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_index (
    group_id bigint NOT NULL,
    max_index bigint
);


ALTER TABLE public.issue_index OWNER TO gitea;

--
-- Name: issue_label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_label (
    id bigint NOT NULL,
    issue_id bigint,
    label_id bigint
);


ALTER TABLE public.issue_label OWNER TO gitea;

--
-- Name: issue_label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_label_id_seq OWNER TO gitea;

--
-- Name: issue_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_label_id_seq OWNED BY public.issue_label.id;


--
-- Name: issue_pin; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_pin (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    is_pull boolean NOT NULL,
    pin_order integer DEFAULT 0
);


ALTER TABLE public.issue_pin OWNER TO gitea;

--
-- Name: issue_pin_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_pin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_pin_id_seq OWNER TO gitea;

--
-- Name: issue_pin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_pin_id_seq OWNED BY public.issue_pin.id;


--
-- Name: issue_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_user (
    id bigint NOT NULL,
    uid bigint,
    issue_id bigint,
    is_read boolean,
    is_mentioned boolean
);


ALTER TABLE public.issue_user OWNER TO gitea;

--
-- Name: issue_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_user_id_seq OWNER TO gitea;

--
-- Name: issue_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_user_id_seq OWNED BY public.issue_user.id;


--
-- Name: issue_watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.issue_watch (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    issue_id bigint NOT NULL,
    is_watching boolean NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.issue_watch OWNER TO gitea;

--
-- Name: issue_watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.issue_watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.issue_watch_id_seq OWNER TO gitea;

--
-- Name: issue_watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.issue_watch_id_seq OWNED BY public.issue_watch.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.label (
    id bigint NOT NULL,
    repo_id bigint,
    org_id bigint,
    name character varying(255),
    exclusive boolean,
    exclusive_order integer DEFAULT 0,
    description character varying(255),
    color character varying(7),
    num_issues integer,
    num_closed_issues integer,
    created_unix bigint,
    updated_unix bigint,
    archived_unix bigint
);


ALTER TABLE public.label OWNER TO gitea;

--
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.label_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.label_id_seq OWNER TO gitea;

--
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- Name: language_stat; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.language_stat (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    commit_id character varying(255),
    is_primary boolean,
    language character varying(50) NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    created_unix bigint
);


ALTER TABLE public.language_stat OWNER TO gitea;

--
-- Name: language_stat_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.language_stat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.language_stat_id_seq OWNER TO gitea;

--
-- Name: language_stat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.language_stat_id_seq OWNED BY public.language_stat.id;


--
-- Name: lfs_lock; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_lock (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    owner_id bigint NOT NULL,
    path text,
    created timestamp without time zone
);


ALTER TABLE public.lfs_lock OWNER TO gitea;

--
-- Name: lfs_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_lock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lfs_lock_id_seq OWNER TO gitea;

--
-- Name: lfs_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_lock_id_seq OWNED BY public.lfs_lock.id;


--
-- Name: lfs_meta_object; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.lfs_meta_object (
    id bigint NOT NULL,
    oid character varying(255) NOT NULL,
    size bigint NOT NULL,
    repository_id bigint NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.lfs_meta_object OWNER TO gitea;

--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.lfs_meta_object_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lfs_meta_object_id_seq OWNER TO gitea;

--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.lfs_meta_object_id_seq OWNED BY public.lfs_meta_object.id;


--
-- Name: login_source; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.login_source (
    id bigint NOT NULL,
    type integer,
    name character varying(255),
    is_active boolean DEFAULT false NOT NULL,
    is_sync_enabled boolean DEFAULT false NOT NULL,
    two_factor_policy character varying(255) DEFAULT ''::character varying NOT NULL,
    cfg text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.login_source OWNER TO gitea;

--
-- Name: login_source_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.login_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.login_source_id_seq OWNER TO gitea;

--
-- Name: login_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.login_source_id_seq OWNED BY public.login_source.id;


--
-- Name: milestone; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.milestone (
    id bigint NOT NULL,
    repo_id bigint,
    name character varying(255),
    content text,
    is_closed boolean,
    num_issues integer,
    num_closed_issues integer,
    completeness integer,
    created_unix bigint,
    updated_unix bigint,
    deadline_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE public.milestone OWNER TO gitea;

--
-- Name: milestone_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.milestone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.milestone_id_seq OWNER TO gitea;

--
-- Name: milestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.milestone_id_seq OWNED BY public.milestone.id;


--
-- Name: mirror; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.mirror (
    id bigint NOT NULL,
    repo_id bigint,
    "interval" bigint,
    enable_prune boolean DEFAULT true NOT NULL,
    updated_unix bigint,
    next_update_unix bigint,
    lfs_enabled boolean DEFAULT false NOT NULL,
    lfs_endpoint text,
    remote_address character varying(2048)
);


ALTER TABLE public.mirror OWNER TO gitea;

--
-- Name: mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mirror_id_seq OWNER TO gitea;

--
-- Name: mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.mirror_id_seq OWNED BY public.mirror.id;


--
-- Name: notice; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notice (
    id bigint NOT NULL,
    type integer,
    description text,
    created_unix bigint
);


ALTER TABLE public.notice OWNER TO gitea;

--
-- Name: notice_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notice_id_seq OWNER TO gitea;

--
-- Name: notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notice_id_seq OWNED BY public.notice.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.notification (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    repo_id bigint NOT NULL,
    status smallint NOT NULL,
    source smallint NOT NULL,
    issue_id bigint NOT NULL,
    commit_id character varying(255),
    comment_id bigint,
    updated_by bigint NOT NULL,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.notification OWNER TO gitea;

--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_id_seq OWNER TO gitea;

--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;


--
-- Name: oauth2_application; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_application (
    id bigint NOT NULL,
    uid bigint,
    name character varying(255),
    client_id character varying(255),
    client_secret character varying(255),
    confidential_client boolean DEFAULT true NOT NULL,
    skip_secondary_authorization boolean DEFAULT false NOT NULL,
    redirect_uris text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.oauth2_application OWNER TO gitea;

--
-- Name: oauth2_application_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_application_id_seq OWNER TO gitea;

--
-- Name: oauth2_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_application_id_seq OWNED BY public.oauth2_application.id;


--
-- Name: oauth2_authorization_code; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_authorization_code (
    id bigint NOT NULL,
    grant_id bigint,
    code character varying(255),
    code_challenge character varying(255),
    code_challenge_method character varying(255),
    redirect_uri character varying(255),
    valid_until bigint
);


ALTER TABLE public.oauth2_authorization_code OWNER TO gitea;

--
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_authorization_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_authorization_code_id_seq OWNER TO gitea;

--
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_authorization_code_id_seq OWNED BY public.oauth2_authorization_code.id;


--
-- Name: oauth2_grant; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.oauth2_grant (
    id bigint NOT NULL,
    user_id bigint,
    application_id bigint,
    counter bigint DEFAULT 1 NOT NULL,
    scope text,
    nonce text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.oauth2_grant OWNER TO gitea;

--
-- Name: oauth2_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.oauth2_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oauth2_grant_id_seq OWNER TO gitea;

--
-- Name: oauth2_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.oauth2_grant_id_seq OWNED BY public.oauth2_grant.id;


--
-- Name: org_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.org_user (
    id bigint NOT NULL,
    uid bigint,
    org_id bigint,
    is_public boolean
);


ALTER TABLE public.org_user OWNER TO gitea;

--
-- Name: org_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.org_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.org_user_id_seq OWNER TO gitea;

--
-- Name: org_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.org_user_id_seq OWNED BY public.org_user.id;


--
-- Name: package; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    repo_id bigint,
    type character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    lower_name character varying(255) NOT NULL,
    semver_compatible boolean DEFAULT false NOT NULL,
    is_internal boolean DEFAULT false NOT NULL
);


ALTER TABLE public.package OWNER TO gitea;

--
-- Name: package_blob; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_blob (
    id bigint NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    hash_md5 character(32) NOT NULL,
    hash_sha1 character(40) NOT NULL,
    hash_sha256 character(64) NOT NULL,
    hash_sha512 character(128) NOT NULL,
    created_unix bigint NOT NULL
);


ALTER TABLE public.package_blob OWNER TO gitea;

--
-- Name: package_blob_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_blob_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_blob_id_seq OWNER TO gitea;

--
-- Name: package_blob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_blob_id_seq OWNED BY public.package_blob.id;


--
-- Name: package_blob_upload; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_blob_upload (
    id character varying(255) NOT NULL,
    bytes_received bigint DEFAULT 0 NOT NULL,
    hash_state_bytes bytea,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.package_blob_upload OWNER TO gitea;

--
-- Name: package_cleanup_rule; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_cleanup_rule (
    id bigint NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    owner_id bigint DEFAULT 0 NOT NULL,
    type character varying(255) NOT NULL,
    keep_count integer DEFAULT 0 NOT NULL,
    keep_pattern character varying(255) DEFAULT ''::character varying NOT NULL,
    remove_days integer DEFAULT 0 NOT NULL,
    remove_pattern character varying(255) DEFAULT ''::character varying NOT NULL,
    match_full_name boolean DEFAULT false NOT NULL,
    created_unix bigint DEFAULT 0 NOT NULL,
    updated_unix bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.package_cleanup_rule OWNER TO gitea;

--
-- Name: package_cleanup_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_cleanup_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_cleanup_rule_id_seq OWNER TO gitea;

--
-- Name: package_cleanup_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_cleanup_rule_id_seq OWNED BY public.package_cleanup_rule.id;


--
-- Name: package_file; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_file (
    id bigint NOT NULL,
    version_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    lower_name character varying(255) NOT NULL,
    composite_key character varying(255),
    is_lead boolean DEFAULT false NOT NULL,
    created_unix bigint NOT NULL
);


ALTER TABLE public.package_file OWNER TO gitea;

--
-- Name: package_file_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_file_id_seq OWNER TO gitea;

--
-- Name: package_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_file_id_seq OWNED BY public.package_file.id;


--
-- Name: package_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_id_seq OWNER TO gitea;

--
-- Name: package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_id_seq OWNED BY public.package.id;


--
-- Name: package_property; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_property (
    id bigint NOT NULL,
    ref_type bigint NOT NULL,
    ref_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.package_property OWNER TO gitea;

--
-- Name: package_property_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_property_id_seq OWNER TO gitea;

--
-- Name: package_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_property_id_seq OWNED BY public.package_property.id;


--
-- Name: package_version; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.package_version (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    creator_id bigint DEFAULT 0 NOT NULL,
    version character varying(255) NOT NULL,
    lower_version character varying(255) NOT NULL,
    created_unix bigint NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    metadata_json text,
    download_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.package_version OWNER TO gitea;

--
-- Name: package_version_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.package_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.package_version_id_seq OWNER TO gitea;

--
-- Name: package_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.package_version_id_seq OWNED BY public.package_version.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.project (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    owner_id bigint,
    repo_id bigint,
    creator_id bigint NOT NULL,
    is_closed boolean,
    board_type bigint,
    card_type bigint,
    type bigint,
    created_unix bigint,
    updated_unix bigint,
    closed_date_unix bigint
);


ALTER TABLE public.project OWNER TO gitea;

--
-- Name: project_board; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.project_board (
    id bigint NOT NULL,
    title character varying(255),
    "default" boolean DEFAULT false NOT NULL,
    sorting integer DEFAULT 0 NOT NULL,
    color character varying(7),
    project_id bigint NOT NULL,
    creator_id bigint NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.project_board OWNER TO gitea;

--
-- Name: project_board_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.project_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_board_id_seq OWNER TO gitea;

--
-- Name: project_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.project_board_id_seq OWNED BY public.project_board.id;


--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_id_seq OWNER TO gitea;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: project_issue; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.project_issue (
    id bigint NOT NULL,
    issue_id bigint,
    project_id bigint,
    project_board_id bigint,
    sorting bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.project_issue OWNER TO gitea;

--
-- Name: project_issue_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.project_issue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_issue_id_seq OWNER TO gitea;

--
-- Name: project_issue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.project_issue_id_seq OWNED BY public.project_issue.id;


--
-- Name: protected_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.protected_branch (
    id bigint NOT NULL,
    repo_id bigint,
    branch_name character varying(255),
    priority bigint DEFAULT 0 NOT NULL,
    can_push boolean DEFAULT false NOT NULL,
    enable_whitelist boolean,
    whitelist_user_i_ds text,
    whitelist_team_i_ds text,
    enable_merge_whitelist boolean DEFAULT false NOT NULL,
    whitelist_deploy_keys boolean DEFAULT false NOT NULL,
    merge_whitelist_user_i_ds text,
    merge_whitelist_team_i_ds text,
    can_force_push boolean DEFAULT false NOT NULL,
    enable_force_push_allowlist boolean DEFAULT false NOT NULL,
    force_push_allowlist_user_i_ds text,
    force_push_allowlist_team_i_ds text,
    force_push_allowlist_deploy_keys boolean DEFAULT false NOT NULL,
    enable_status_check boolean DEFAULT false NOT NULL,
    status_check_contexts text,
    enable_approvals_whitelist boolean DEFAULT false NOT NULL,
    approvals_whitelist_user_i_ds text,
    approvals_whitelist_team_i_ds text,
    required_approvals bigint DEFAULT 0 NOT NULL,
    block_on_rejected_reviews boolean DEFAULT false NOT NULL,
    block_on_official_review_requests boolean DEFAULT false NOT NULL,
    block_on_outdated_branch boolean DEFAULT false NOT NULL,
    dismiss_stale_approvals boolean DEFAULT false NOT NULL,
    ignore_stale_approvals boolean DEFAULT false NOT NULL,
    require_signed_commits boolean DEFAULT false NOT NULL,
    protected_file_patterns text,
    unprotected_file_patterns text,
    block_admin_merge_override boolean DEFAULT false NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.protected_branch OWNER TO gitea;

--
-- Name: protected_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.protected_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.protected_branch_id_seq OWNER TO gitea;

--
-- Name: protected_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.protected_branch_id_seq OWNED BY public.protected_branch.id;


--
-- Name: protected_tag; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.protected_tag (
    id bigint NOT NULL,
    repo_id bigint,
    name_pattern character varying(255),
    allowlist_user_i_ds text,
    allowlist_team_i_ds text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.protected_tag OWNER TO gitea;

--
-- Name: protected_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.protected_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.protected_tag_id_seq OWNER TO gitea;

--
-- Name: protected_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.protected_tag_id_seq OWNED BY public.protected_tag.id;


--
-- Name: public_key; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.public_key (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    fingerprint character varying(255) NOT NULL,
    content text NOT NULL,
    mode integer DEFAULT 2 NOT NULL,
    type integer DEFAULT 1 NOT NULL,
    login_source_id bigint DEFAULT 0 NOT NULL,
    created_unix bigint,
    updated_unix bigint,
    verified boolean DEFAULT false NOT NULL
);


ALTER TABLE public.public_key OWNER TO gitea;

--
-- Name: public_key_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.public_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.public_key_id_seq OWNER TO gitea;

--
-- Name: public_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.public_key_id_seq OWNED BY public.public_key.id;


--
-- Name: pull_auto_merge; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.pull_auto_merge (
    id bigint NOT NULL,
    pull_id bigint,
    doer_id bigint NOT NULL,
    merge_style character varying(30),
    message text,
    delete_branch_after_merge boolean,
    created_unix bigint
);


ALTER TABLE public.pull_auto_merge OWNER TO gitea;

--
-- Name: pull_auto_merge_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.pull_auto_merge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pull_auto_merge_id_seq OWNER TO gitea;

--
-- Name: pull_auto_merge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.pull_auto_merge_id_seq OWNED BY public.pull_auto_merge.id;


--
-- Name: pull_request; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.pull_request (
    id bigint NOT NULL,
    type integer,
    status integer,
    conflicted_files text,
    commits_ahead integer,
    commits_behind integer,
    changed_protected_files text,
    issue_id bigint,
    index bigint,
    head_repo_id bigint,
    base_repo_id bigint,
    head_branch character varying(255),
    base_branch character varying(255),
    merge_base character varying(64),
    allow_maintainer_edit boolean DEFAULT false NOT NULL,
    has_merged boolean,
    merged_commit_id character varying(64),
    merger_id bigint,
    merged_unix bigint,
    flow integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.pull_request OWNER TO gitea;

--
-- Name: pull_request_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.pull_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pull_request_id_seq OWNER TO gitea;

--
-- Name: pull_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.pull_request_id_seq OWNED BY public.pull_request.id;


--
-- Name: push_mirror; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.push_mirror (
    id bigint NOT NULL,
    repo_id bigint,
    remote_name character varying(255),
    remote_address character varying(2048),
    sync_on_commit boolean DEFAULT true NOT NULL,
    "interval" bigint,
    created_unix bigint,
    last_update bigint,
    last_error text
);


ALTER TABLE public.push_mirror OWNER TO gitea;

--
-- Name: push_mirror_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.push_mirror_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.push_mirror_id_seq OWNER TO gitea;

--
-- Name: push_mirror_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.push_mirror_id_seq OWNED BY public.push_mirror.id;


--
-- Name: reaction; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.reaction (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    issue_id bigint NOT NULL,
    comment_id bigint,
    user_id bigint NOT NULL,
    original_author_id bigint DEFAULT 0 NOT NULL,
    original_author character varying(255),
    created_unix bigint
);


ALTER TABLE public.reaction OWNER TO gitea;

--
-- Name: reaction_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.reaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reaction_id_seq OWNER TO gitea;

--
-- Name: reaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.reaction_id_seq OWNED BY public.reaction.id;


--
-- Name: release; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.release (
    id bigint NOT NULL,
    repo_id bigint,
    publisher_id bigint,
    tag_name character varying(255),
    original_author character varying(255),
    original_author_id bigint,
    lower_tag_name character varying(255),
    target character varying(255),
    title character varying(255),
    sha1 character varying(64),
    num_commits bigint,
    note text,
    is_draft boolean DEFAULT false NOT NULL,
    is_prerelease boolean DEFAULT false NOT NULL,
    is_tag boolean DEFAULT false NOT NULL,
    created_unix bigint
);


ALTER TABLE public.release OWNER TO gitea;

--
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.release_id_seq OWNER TO gitea;

--
-- Name: release_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.release_id_seq OWNED BY public.release.id;


--
-- Name: renamed_branch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.renamed_branch (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    "from" character varying(255),
    "to" character varying(255),
    created_unix bigint
);


ALTER TABLE public.renamed_branch OWNER TO gitea;

--
-- Name: renamed_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.renamed_branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.renamed_branch_id_seq OWNER TO gitea;

--
-- Name: renamed_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.renamed_branch_id_seq OWNED BY public.renamed_branch.id;


--
-- Name: repo_archiver; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_archiver (
    id bigint NOT NULL,
    repo_id bigint,
    type integer,
    status integer,
    commit_id character varying(64),
    created_unix bigint NOT NULL
);


ALTER TABLE public.repo_archiver OWNER TO gitea;

--
-- Name: repo_archiver_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_archiver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_archiver_id_seq OWNER TO gitea;

--
-- Name: repo_archiver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_archiver_id_seq OWNED BY public.repo_archiver.id;


--
-- Name: repo_indexer_status; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_indexer_status (
    id bigint NOT NULL,
    repo_id bigint,
    commit_sha character varying(64),
    indexer_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.repo_indexer_status OWNER TO gitea;

--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_indexer_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_indexer_status_id_seq OWNER TO gitea;

--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_indexer_status_id_seq OWNED BY public.repo_indexer_status.id;


--
-- Name: repo_license; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_license (
    id bigint NOT NULL,
    repo_id bigint NOT NULL,
    commit_id character varying(255),
    license character varying(255) NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.repo_license OWNER TO gitea;

--
-- Name: repo_license_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_license_id_seq OWNER TO gitea;

--
-- Name: repo_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_license_id_seq OWNED BY public.repo_license.id;


--
-- Name: repo_redirect; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_redirect (
    id bigint NOT NULL,
    owner_id bigint,
    lower_name character varying(255) NOT NULL,
    redirect_repo_id bigint
);


ALTER TABLE public.repo_redirect OWNER TO gitea;

--
-- Name: repo_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_redirect_id_seq OWNER TO gitea;

--
-- Name: repo_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_redirect_id_seq OWNED BY public.repo_redirect.id;


--
-- Name: repo_topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_topic (
    repo_id bigint NOT NULL,
    topic_id bigint NOT NULL
);


ALTER TABLE public.repo_topic OWNER TO gitea;

--
-- Name: repo_transfer; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_transfer (
    id bigint NOT NULL,
    doer_id bigint,
    recipient_id bigint,
    repo_id bigint,
    team_i_ds text,
    created_unix bigint NOT NULL,
    updated_unix bigint NOT NULL
);


ALTER TABLE public.repo_transfer OWNER TO gitea;

--
-- Name: repo_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_transfer_id_seq OWNER TO gitea;

--
-- Name: repo_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_transfer_id_seq OWNED BY public.repo_transfer.id;


--
-- Name: repo_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repo_unit (
    id bigint NOT NULL,
    repo_id bigint,
    type integer,
    config text,
    created_unix bigint,
    anonymous_access_mode integer DEFAULT 0 NOT NULL,
    everyone_access_mode integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.repo_unit OWNER TO gitea;

--
-- Name: repo_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repo_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repo_unit_id_seq OWNER TO gitea;

--
-- Name: repo_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repo_unit_id_seq OWNED BY public.repo_unit.id;


--
-- Name: repository; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.repository (
    id bigint NOT NULL,
    owner_id bigint,
    owner_name character varying(255),
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    website character varying(2048),
    original_service_type integer,
    original_url character varying(2048),
    default_branch character varying(255),
    default_wiki_branch character varying(255),
    num_watches integer,
    num_stars integer,
    num_forks integer,
    num_issues integer,
    num_closed_issues integer,
    num_pulls integer,
    num_closed_pulls integer,
    num_milestones integer DEFAULT 0 NOT NULL,
    num_closed_milestones integer DEFAULT 0 NOT NULL,
    num_projects integer DEFAULT 0 NOT NULL,
    num_closed_projects integer DEFAULT 0 NOT NULL,
    num_action_runs integer DEFAULT 0 NOT NULL,
    num_closed_action_runs integer DEFAULT 0 NOT NULL,
    is_private boolean,
    is_empty boolean,
    is_archived boolean,
    is_mirror boolean,
    status integer DEFAULT 0 NOT NULL,
    is_fork boolean DEFAULT false NOT NULL,
    fork_id bigint,
    is_template boolean DEFAULT false NOT NULL,
    template_id bigint,
    size bigint DEFAULT 0 NOT NULL,
    git_size bigint DEFAULT 0 NOT NULL,
    lfs_size bigint DEFAULT 0 NOT NULL,
    is_fsck_enabled boolean DEFAULT true NOT NULL,
    close_issues_via_commit_in_any_branch boolean DEFAULT false NOT NULL,
    topics text,
    object_format_name character varying(6) DEFAULT 'sha1'::character varying NOT NULL,
    trust_model integer,
    avatar character varying(64),
    created_unix bigint,
    updated_unix bigint,
    archived_unix bigint DEFAULT 0
);


ALTER TABLE public.repository OWNER TO gitea;

--
-- Name: repository_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.repository_id_seq OWNER TO gitea;

--
-- Name: repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.repository_id_seq OWNED BY public.repository.id;


--
-- Name: review; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.review (
    id bigint NOT NULL,
    type integer,
    reviewer_id bigint,
    reviewer_team_id bigint DEFAULT 0 NOT NULL,
    original_author character varying(255),
    original_author_id bigint,
    issue_id bigint,
    content text,
    official boolean DEFAULT false NOT NULL,
    commit_id character varying(64),
    stale boolean DEFAULT false NOT NULL,
    dismissed boolean DEFAULT false NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.review OWNER TO gitea;

--
-- Name: review_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_id_seq OWNER TO gitea;

--
-- Name: review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.review_id_seq OWNED BY public.review.id;


--
-- Name: review_state; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.review_state (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    pull_id bigint DEFAULT 0 NOT NULL,
    commit_sha character varying(64) NOT NULL,
    updated_files text NOT NULL,
    updated_unix bigint
);


ALTER TABLE public.review_state OWNER TO gitea;

--
-- Name: review_state_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.review_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_state_id_seq OWNER TO gitea;

--
-- Name: review_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.review_state_id_seq OWNED BY public.review_state.id;


--
-- Name: secret; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.secret (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    repo_id bigint DEFAULT 0 NOT NULL,
    name character varying(255) NOT NULL,
    data text,
    description text,
    created_unix bigint NOT NULL
);


ALTER TABLE public.secret OWNER TO gitea;

--
-- Name: secret_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.secret_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.secret_id_seq OWNER TO gitea;

--
-- Name: secret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.secret_id_seq OWNED BY public.secret.id;


--
-- Name: session; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.session (
    key character(16) NOT NULL,
    data bytea,
    expiry bigint
);


ALTER TABLE public.session OWNER TO gitea;

--
-- Name: star; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.star (
    id bigint NOT NULL,
    uid bigint,
    repo_id bigint,
    created_unix bigint
);


ALTER TABLE public.star OWNER TO gitea;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_id_seq OWNER TO gitea;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.id;


--
-- Name: stopwatch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.stopwatch (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint
);


ALTER TABLE public.stopwatch OWNER TO gitea;

--
-- Name: stopwatch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.stopwatch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stopwatch_id_seq OWNER TO gitea;

--
-- Name: stopwatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.stopwatch_id_seq OWNED BY public.stopwatch.id;


--
-- Name: system_setting; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.system_setting (
    id bigint NOT NULL,
    setting_key character varying(255),
    setting_value text,
    version integer,
    created bigint,
    updated bigint
);


ALTER TABLE public.system_setting OWNER TO gitea;

--
-- Name: system_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.system_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_setting_id_seq OWNER TO gitea;

--
-- Name: system_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.system_setting_id_seq OWNED BY public.system_setting.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    doer_id bigint,
    owner_id bigint,
    repo_id bigint,
    type integer,
    status integer,
    start_time bigint,
    end_time bigint,
    payload_content text,
    message text,
    created bigint
);


ALTER TABLE public.task OWNER TO gitea;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_id_seq OWNER TO gitea;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team (
    id bigint NOT NULL,
    org_id bigint,
    lower_name character varying(255),
    name character varying(255),
    description character varying(255),
    authorize integer,
    num_repos integer,
    num_members integer,
    includes_all_repositories boolean DEFAULT false NOT NULL,
    can_create_org_repo boolean DEFAULT false NOT NULL
);


ALTER TABLE public.team OWNER TO gitea;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_id_seq OWNER TO gitea;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: team_invite; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_invite (
    id bigint NOT NULL,
    token character varying(255) DEFAULT ''::character varying NOT NULL,
    inviter_id bigint DEFAULT 0 NOT NULL,
    org_id bigint DEFAULT 0 NOT NULL,
    team_id bigint DEFAULT 0 NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.team_invite OWNER TO gitea;

--
-- Name: team_invite_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_invite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_invite_id_seq OWNER TO gitea;

--
-- Name: team_invite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_invite_id_seq OWNED BY public.team_invite.id;


--
-- Name: team_repo; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_repo (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    repo_id bigint
);


ALTER TABLE public.team_repo OWNER TO gitea;

--
-- Name: team_repo_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_repo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_repo_id_seq OWNER TO gitea;

--
-- Name: team_repo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_repo_id_seq OWNED BY public.team_repo.id;


--
-- Name: team_unit; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_unit (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    type integer,
    access_mode integer
);


ALTER TABLE public.team_unit OWNER TO gitea;

--
-- Name: team_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_unit_id_seq OWNER TO gitea;

--
-- Name: team_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_unit_id_seq OWNED BY public.team_unit.id;


--
-- Name: team_user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.team_user (
    id bigint NOT NULL,
    org_id bigint,
    team_id bigint,
    uid bigint
);


ALTER TABLE public.team_user OWNER TO gitea;

--
-- Name: team_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.team_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_user_id_seq OWNER TO gitea;

--
-- Name: team_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.team_user_id_seq OWNED BY public.team_user.id;


--
-- Name: topic; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.topic (
    id bigint NOT NULL,
    name character varying(50),
    repo_count integer,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.topic OWNER TO gitea;

--
-- Name: topic_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.topic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topic_id_seq OWNER TO gitea;

--
-- Name: topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.topic_id_seq OWNED BY public.topic.id;


--
-- Name: tracked_time; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.tracked_time (
    id bigint NOT NULL,
    issue_id bigint,
    user_id bigint,
    created_unix bigint,
    "time" bigint NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tracked_time OWNER TO gitea;

--
-- Name: tracked_time_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.tracked_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tracked_time_id_seq OWNER TO gitea;

--
-- Name: tracked_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.tracked_time_id_seq OWNED BY public.tracked_time.id;


--
-- Name: two_factor; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.two_factor (
    id bigint NOT NULL,
    uid bigint,
    secret character varying(255),
    scratch_salt character varying(255),
    scratch_hash character varying(255),
    last_used_passcode character varying(10),
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.two_factor OWNER TO gitea;

--
-- Name: two_factor_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.two_factor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_id_seq OWNER TO gitea;

--
-- Name: two_factor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.two_factor_id_seq OWNED BY public.two_factor.id;


--
-- Name: upload; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.upload (
    id bigint NOT NULL,
    uuid uuid,
    name character varying(255)
);


ALTER TABLE public.upload OWNER TO gitea;

--
-- Name: upload_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_id_seq OWNER TO gitea;

--
-- Name: upload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.upload_id_seq OWNED BY public.upload.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    keep_email_private boolean,
    email_notifications_preference character varying(20) DEFAULT 'enabled'::character varying NOT NULL,
    passwd character varying(255) NOT NULL,
    passwd_hash_algo character varying(255) DEFAULT 'argon2'::character varying NOT NULL,
    must_change_password boolean DEFAULT false NOT NULL,
    login_type integer,
    login_source bigint DEFAULT 0 NOT NULL,
    login_name character varying(255),
    type integer,
    location character varying(255),
    website character varying(255),
    rands character varying(32),
    salt character varying(32),
    language character varying(5),
    description character varying(255),
    created_unix bigint,
    updated_unix bigint,
    last_login_unix bigint,
    last_repo_visibility boolean,
    max_repo_creation integer DEFAULT '-1'::integer NOT NULL,
    is_active boolean,
    is_admin boolean,
    is_restricted boolean DEFAULT false NOT NULL,
    allow_git_hook boolean,
    allow_import_local boolean,
    allow_create_organization boolean DEFAULT true,
    prohibit_login boolean DEFAULT false NOT NULL,
    avatar character varying(2048) NOT NULL,
    avatar_email character varying(255) NOT NULL,
    use_custom_avatar boolean,
    num_followers integer,
    num_following integer DEFAULT 0 NOT NULL,
    num_stars integer,
    num_repos integer,
    num_teams integer,
    num_members integer,
    visibility integer DEFAULT 0 NOT NULL,
    repo_admin_change_team_access boolean DEFAULT false NOT NULL,
    diff_view_style character varying(255) DEFAULT ''::character varying NOT NULL,
    theme character varying(255) DEFAULT ''::character varying NOT NULL,
    keep_activity_private boolean DEFAULT false NOT NULL
);


ALTER TABLE public."user" OWNER TO gitea;

--
-- Name: user_badge; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_badge (
    id bigint NOT NULL,
    badge_id bigint,
    user_id bigint
);


ALTER TABLE public.user_badge OWNER TO gitea;

--
-- Name: user_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_badge_id_seq OWNER TO gitea;

--
-- Name: user_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_badge_id_seq OWNED BY public.user_badge.id;


--
-- Name: user_blocking; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_blocking (
    id bigint NOT NULL,
    blocker_id bigint,
    blockee_id bigint,
    note character varying(255),
    created_unix bigint
);


ALTER TABLE public.user_blocking OWNER TO gitea;

--
-- Name: user_blocking_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_blocking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_blocking_id_seq OWNER TO gitea;

--
-- Name: user_blocking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_blocking_id_seq OWNED BY public.user_blocking.id;


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO gitea;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_open_id; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_open_id (
    id bigint NOT NULL,
    uid bigint NOT NULL,
    uri character varying(255) NOT NULL,
    show boolean DEFAULT false
);


ALTER TABLE public.user_open_id OWNER TO gitea;

--
-- Name: user_open_id_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_open_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_open_id_id_seq OWNER TO gitea;

--
-- Name: user_open_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_open_id_id_seq OWNED BY public.user_open_id.id;


--
-- Name: user_redirect; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_redirect (
    id bigint NOT NULL,
    lower_name character varying(255) NOT NULL,
    redirect_user_id bigint
);


ALTER TABLE public.user_redirect OWNER TO gitea;

--
-- Name: user_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_redirect_id_seq OWNER TO gitea;

--
-- Name: user_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_redirect_id_seq OWNED BY public.user_redirect.id;


--
-- Name: user_setting; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.user_setting (
    id bigint NOT NULL,
    user_id bigint,
    setting_key character varying(255),
    setting_value text
);


ALTER TABLE public.user_setting OWNER TO gitea;

--
-- Name: user_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.user_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_setting_id_seq OWNER TO gitea;

--
-- Name: user_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.user_setting_id_seq OWNED BY public.user_setting.id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.version (
    id bigint NOT NULL,
    version bigint
);


ALTER TABLE public.version OWNER TO gitea;

--
-- Name: version_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.version_id_seq OWNER TO gitea;

--
-- Name: version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.version_id_seq OWNED BY public.version.id;


--
-- Name: watch; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.watch (
    id bigint NOT NULL,
    user_id bigint,
    repo_id bigint,
    mode smallint DEFAULT 1 NOT NULL,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.watch OWNER TO gitea;

--
-- Name: watch_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.watch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.watch_id_seq OWNER TO gitea;

--
-- Name: watch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.watch_id_seq OWNED BY public.watch.id;


--
-- Name: webauthn_credential; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.webauthn_credential (
    id bigint NOT NULL,
    name character varying(255),
    lower_name character varying(255),
    user_id bigint,
    credential_id bytea,
    public_key bytea,
    attestation_type character varying(255),
    aaguid bytea,
    sign_count bigint,
    clone_warning boolean,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.webauthn_credential OWNER TO gitea;

--
-- Name: webauthn_credential_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.webauthn_credential_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webauthn_credential_id_seq OWNER TO gitea;

--
-- Name: webauthn_credential_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.webauthn_credential_id_seq OWNED BY public.webauthn_credential.id;


--
-- Name: webhook; Type: TABLE; Schema: public; Owner: gitea
--

CREATE TABLE public.webhook (
    id bigint NOT NULL,
    repo_id bigint,
    owner_id bigint,
    is_system_webhook boolean,
    url text,
    http_method character varying(255),
    content_type integer,
    secret text,
    events text,
    is_active boolean,
    type character varying(16),
    meta text,
    last_status integer,
    header_authorization_encrypted text,
    created_unix bigint,
    updated_unix bigint
);


ALTER TABLE public.webhook OWNER TO gitea;

--
-- Name: webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: gitea
--

CREATE SEQUENCE public.webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webhook_id_seq OWNER TO gitea;

--
-- Name: webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gitea
--

ALTER SEQUENCE public.webhook_id_seq OWNED BY public.webhook.id;


--
-- Name: access id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access ALTER COLUMN id SET DEFAULT nextval('public.access_id_seq'::regclass);


--
-- Name: access_token id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token ALTER COLUMN id SET DEFAULT nextval('public.access_token_id_seq'::regclass);


--
-- Name: action id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action ALTER COLUMN id SET DEFAULT nextval('public.action_id_seq'::regclass);


--
-- Name: action_artifact id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_artifact ALTER COLUMN id SET DEFAULT nextval('public.action_artifact_id_seq'::regclass);


--
-- Name: action_run id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_run ALTER COLUMN id SET DEFAULT nextval('public.action_run_id_seq'::regclass);


--
-- Name: action_run_job id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_run_job ALTER COLUMN id SET DEFAULT nextval('public.action_run_job_id_seq'::regclass);


--
-- Name: action_runner id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_runner ALTER COLUMN id SET DEFAULT nextval('public.action_runner_id_seq'::regclass);


--
-- Name: action_runner_token id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_runner_token ALTER COLUMN id SET DEFAULT nextval('public.action_runner_token_id_seq'::regclass);


--
-- Name: action_schedule id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_schedule ALTER COLUMN id SET DEFAULT nextval('public.action_schedule_id_seq'::regclass);


--
-- Name: action_schedule_spec id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_schedule_spec ALTER COLUMN id SET DEFAULT nextval('public.action_schedule_spec_id_seq'::regclass);


--
-- Name: action_task id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task ALTER COLUMN id SET DEFAULT nextval('public.action_task_id_seq'::regclass);


--
-- Name: action_task_output id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task_output ALTER COLUMN id SET DEFAULT nextval('public.action_task_output_id_seq'::regclass);


--
-- Name: action_task_step id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task_step ALTER COLUMN id SET DEFAULT nextval('public.action_task_step_id_seq'::regclass);


--
-- Name: action_tasks_version id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_tasks_version ALTER COLUMN id SET DEFAULT nextval('public.action_tasks_version_id_seq'::regclass);


--
-- Name: action_variable id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_variable ALTER COLUMN id SET DEFAULT nextval('public.action_variable_id_seq'::regclass);


--
-- Name: attachment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment ALTER COLUMN id SET DEFAULT nextval('public.attachment_id_seq'::regclass);


--
-- Name: badge id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.badge ALTER COLUMN id SET DEFAULT nextval('public.badge_id_seq'::regclass);


--
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- Name: collaboration id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration ALTER COLUMN id SET DEFAULT nextval('public.collaboration_id_seq'::regclass);


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: commit_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status ALTER COLUMN id SET DEFAULT nextval('public.commit_status_id_seq'::regclass);


--
-- Name: commit_status_index id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status_index ALTER COLUMN id SET DEFAULT nextval('public.commit_status_index_id_seq'::regclass);


--
-- Name: commit_status_summary id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status_summary ALTER COLUMN id SET DEFAULT nextval('public.commit_status_summary_id_seq'::regclass);


--
-- Name: dbfs_data id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.dbfs_data ALTER COLUMN id SET DEFAULT nextval('public.dbfs_data_id_seq'::regclass);


--
-- Name: dbfs_meta id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.dbfs_meta ALTER COLUMN id SET DEFAULT nextval('public.dbfs_meta_id_seq'::regclass);


--
-- Name: deploy_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key ALTER COLUMN id SET DEFAULT nextval('public.deploy_key_id_seq'::regclass);


--
-- Name: email_address id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address ALTER COLUMN id SET DEFAULT nextval('public.email_address_id_seq'::regclass);


--
-- Name: follow id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow ALTER COLUMN id SET DEFAULT nextval('public.follow_id_seq'::regclass);


--
-- Name: gpg_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key ALTER COLUMN id SET DEFAULT nextval('public.gpg_key_id_seq'::regclass);


--
-- Name: hook_task id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task ALTER COLUMN id SET DEFAULT nextval('public.hook_task_id_seq'::regclass);


--
-- Name: issue id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue ALTER COLUMN id SET DEFAULT nextval('public.issue_id_seq'::regclass);


--
-- Name: issue_assignees id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees ALTER COLUMN id SET DEFAULT nextval('public.issue_assignees_id_seq'::regclass);


--
-- Name: issue_content_history id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_content_history ALTER COLUMN id SET DEFAULT nextval('public.issue_content_history_id_seq'::regclass);


--
-- Name: issue_dependency id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency ALTER COLUMN id SET DEFAULT nextval('public.issue_dependency_id_seq'::regclass);


--
-- Name: issue_label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label ALTER COLUMN id SET DEFAULT nextval('public.issue_label_id_seq'::regclass);


--
-- Name: issue_pin id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_pin ALTER COLUMN id SET DEFAULT nextval('public.issue_pin_id_seq'::regclass);


--
-- Name: issue_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user ALTER COLUMN id SET DEFAULT nextval('public.issue_user_id_seq'::regclass);


--
-- Name: issue_watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch ALTER COLUMN id SET DEFAULT nextval('public.issue_watch_id_seq'::regclass);


--
-- Name: label id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- Name: language_stat id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.language_stat ALTER COLUMN id SET DEFAULT nextval('public.language_stat_id_seq'::regclass);


--
-- Name: lfs_lock id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock ALTER COLUMN id SET DEFAULT nextval('public.lfs_lock_id_seq'::regclass);


--
-- Name: lfs_meta_object id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object ALTER COLUMN id SET DEFAULT nextval('public.lfs_meta_object_id_seq'::regclass);


--
-- Name: login_source id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source ALTER COLUMN id SET DEFAULT nextval('public.login_source_id_seq'::regclass);


--
-- Name: milestone id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone ALTER COLUMN id SET DEFAULT nextval('public.milestone_id_seq'::regclass);


--
-- Name: mirror id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror ALTER COLUMN id SET DEFAULT nextval('public.mirror_id_seq'::regclass);


--
-- Name: notice id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice ALTER COLUMN id SET DEFAULT nextval('public.notice_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);


--
-- Name: oauth2_application id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_application ALTER COLUMN id SET DEFAULT nextval('public.oauth2_application_id_seq'::regclass);


--
-- Name: oauth2_authorization_code id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_authorization_code ALTER COLUMN id SET DEFAULT nextval('public.oauth2_authorization_code_id_seq'::regclass);


--
-- Name: oauth2_grant id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_grant ALTER COLUMN id SET DEFAULT nextval('public.oauth2_grant_id_seq'::regclass);


--
-- Name: org_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user ALTER COLUMN id SET DEFAULT nextval('public.org_user_id_seq'::regclass);


--
-- Name: package id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package ALTER COLUMN id SET DEFAULT nextval('public.package_id_seq'::regclass);


--
-- Name: package_blob id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_blob ALTER COLUMN id SET DEFAULT nextval('public.package_blob_id_seq'::regclass);


--
-- Name: package_cleanup_rule id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_cleanup_rule ALTER COLUMN id SET DEFAULT nextval('public.package_cleanup_rule_id_seq'::regclass);


--
-- Name: package_file id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_file ALTER COLUMN id SET DEFAULT nextval('public.package_file_id_seq'::regclass);


--
-- Name: package_property id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_property ALTER COLUMN id SET DEFAULT nextval('public.package_property_id_seq'::regclass);


--
-- Name: package_version id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_version ALTER COLUMN id SET DEFAULT nextval('public.package_version_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: project_board id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project_board ALTER COLUMN id SET DEFAULT nextval('public.project_board_id_seq'::regclass);


--
-- Name: project_issue id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project_issue ALTER COLUMN id SET DEFAULT nextval('public.project_issue_id_seq'::regclass);


--
-- Name: protected_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch ALTER COLUMN id SET DEFAULT nextval('public.protected_branch_id_seq'::regclass);


--
-- Name: protected_tag id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_tag ALTER COLUMN id SET DEFAULT nextval('public.protected_tag_id_seq'::regclass);


--
-- Name: public_key id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key ALTER COLUMN id SET DEFAULT nextval('public.public_key_id_seq'::regclass);


--
-- Name: pull_auto_merge id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_auto_merge ALTER COLUMN id SET DEFAULT nextval('public.pull_auto_merge_id_seq'::regclass);


--
-- Name: pull_request id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request ALTER COLUMN id SET DEFAULT nextval('public.pull_request_id_seq'::regclass);


--
-- Name: push_mirror id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.push_mirror ALTER COLUMN id SET DEFAULT nextval('public.push_mirror_id_seq'::regclass);


--
-- Name: reaction id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction ALTER COLUMN id SET DEFAULT nextval('public.reaction_id_seq'::regclass);


--
-- Name: release id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release ALTER COLUMN id SET DEFAULT nextval('public.release_id_seq'::regclass);


--
-- Name: renamed_branch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.renamed_branch ALTER COLUMN id SET DEFAULT nextval('public.renamed_branch_id_seq'::regclass);


--
-- Name: repo_archiver id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_archiver ALTER COLUMN id SET DEFAULT nextval('public.repo_archiver_id_seq'::regclass);


--
-- Name: repo_indexer_status id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status ALTER COLUMN id SET DEFAULT nextval('public.repo_indexer_status_id_seq'::regclass);


--
-- Name: repo_license id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_license ALTER COLUMN id SET DEFAULT nextval('public.repo_license_id_seq'::regclass);


--
-- Name: repo_redirect id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect ALTER COLUMN id SET DEFAULT nextval('public.repo_redirect_id_seq'::regclass);


--
-- Name: repo_transfer id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_transfer ALTER COLUMN id SET DEFAULT nextval('public.repo_transfer_id_seq'::regclass);


--
-- Name: repo_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit ALTER COLUMN id SET DEFAULT nextval('public.repo_unit_id_seq'::regclass);


--
-- Name: repository id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository ALTER COLUMN id SET DEFAULT nextval('public.repository_id_seq'::regclass);


--
-- Name: review id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review ALTER COLUMN id SET DEFAULT nextval('public.review_id_seq'::regclass);


--
-- Name: review_state id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review_state ALTER COLUMN id SET DEFAULT nextval('public.review_state_id_seq'::regclass);


--
-- Name: secret id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.secret ALTER COLUMN id SET DEFAULT nextval('public.secret_id_seq'::regclass);


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star ALTER COLUMN id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: stopwatch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch ALTER COLUMN id SET DEFAULT nextval('public.stopwatch_id_seq'::regclass);


--
-- Name: system_setting id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.system_setting ALTER COLUMN id SET DEFAULT nextval('public.system_setting_id_seq'::regclass);


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: team_invite id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_invite ALTER COLUMN id SET DEFAULT nextval('public.team_invite_id_seq'::regclass);


--
-- Name: team_repo id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo ALTER COLUMN id SET DEFAULT nextval('public.team_repo_id_seq'::regclass);


--
-- Name: team_unit id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit ALTER COLUMN id SET DEFAULT nextval('public.team_unit_id_seq'::regclass);


--
-- Name: team_user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user ALTER COLUMN id SET DEFAULT nextval('public.team_user_id_seq'::regclass);


--
-- Name: topic id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic ALTER COLUMN id SET DEFAULT nextval('public.topic_id_seq'::regclass);


--
-- Name: tracked_time id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time ALTER COLUMN id SET DEFAULT nextval('public.tracked_time_id_seq'::regclass);


--
-- Name: two_factor id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor ALTER COLUMN id SET DEFAULT nextval('public.two_factor_id_seq'::regclass);


--
-- Name: upload id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload ALTER COLUMN id SET DEFAULT nextval('public.upload_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_badge id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_badge ALTER COLUMN id SET DEFAULT nextval('public.user_badge_id_seq'::regclass);


--
-- Name: user_blocking id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_blocking ALTER COLUMN id SET DEFAULT nextval('public.user_blocking_id_seq'::regclass);


--
-- Name: user_open_id id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id ALTER COLUMN id SET DEFAULT nextval('public.user_open_id_id_seq'::regclass);


--
-- Name: user_redirect id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_redirect ALTER COLUMN id SET DEFAULT nextval('public.user_redirect_id_seq'::regclass);


--
-- Name: user_setting id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_setting ALTER COLUMN id SET DEFAULT nextval('public.user_setting_id_seq'::regclass);


--
-- Name: version id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version ALTER COLUMN id SET DEFAULT nextval('public.version_id_seq'::regclass);


--
-- Name: watch id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch ALTER COLUMN id SET DEFAULT nextval('public.watch_id_seq'::regclass);


--
-- Name: webauthn_credential id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webauthn_credential ALTER COLUMN id SET DEFAULT nextval('public.webauthn_credential_id_seq'::regclass);


--
-- Name: webhook id; Type: DEFAULT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook ALTER COLUMN id SET DEFAULT nextval('public.webhook_id_seq'::regclass);


--
-- Data for Name: access; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access (id, user_id, repo_id, mode) FROM stdin;
1	1	4	4
2	1	5	4
3	1	6	4
4	2	1	2
5	3	1	2
6	4	1	2
7	6	1	3
8	7	1	2
9	2	4	2
10	3	4	2
11	5	4	3
12	6	4	2
13	7	4	2
14	2	5	2
15	3	5	2
16	5	5	3
17	6	5	2
18	7	5	2
19	2	6	2
20	3	6	2
21	5	6	3
22	6	6	2
23	7	6	2
\.


--
-- Data for Name: access_token; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.access_token (id, uid, name, token_hash, token_salt, token_last_eight, scope, created_unix, updated_unix) FROM stdin;
1	1	seed-admin-1776437164-1032-1	0864a377389ae5575db7dc3fa5925b0a97adb03fded506228360044c6466c12677973ebc577019a913cd674c15f604b358c2	SYwwVPJap5	4c30294a	all	1776437175	1776437183
2	2	seed-alice-1776437164-1032-1	25b6b8962e8a5a84be4b068280a78b291a040a364a799c7a23b2ad16405a910e80e949433685d1eadbf8060c204c2171399e	oF7f4ZB817	a81f0736	all	1776437175	1776437183
3	3	seed-bob-1776437164-1032-1	388d5c4464d7216a9067248cd059035b2675bd999468626d4927b993c021a8abddd53324de1c17ad6104dbf0d83a0ff3ea95	Uh7B7wGtyl	84bab0c4	all	1776437175	1776437182
4	4	seed-caro-1776437164-1032-1	8f99a5055428defb660d6e3a239c33072d25343dee191611bd6c469f17072e45efd772615bd03052a27c5dfcac8d4d88d089	02BxlKDIPb	ec169479	all	1776437175	1776437182
7	7	AGT_QA_ENG_TOKEN_V1	9d2cf320a2aeec6adce626bab70c7c656b2cb0d87c736ac5adc1fcaceeeef14daef1f3470ab56936aff61f7a35a51db4eda7	TWc8aVND1A	5da8bf9b	all	1776437176	1776437182
6	6	AGT_DEV_ENG_TOKEN_V1	12b046e225cb953d518223f35dc24d4579847550a1947eef6045e78025a04cc3e2ed0e455afb7f06b94951b070e6fe5a37e9	K4W777Zy5I	860b748a	all	1776437176	1776437182
5	5	seed-dan-1776437164-1032-1	2971ac25f7bfd8a2b35ff4ad845d9f73ddbbc54a89e5af91a5e4dff05a7336b1d29f290b8103a375738600947a419d33d50a	5yCGJbo27G	01c7368a	all	1776437175	1776437181
\.


--
-- Data for Name: action; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action (id, user_id, op_type, act_user_id, repo_id, comment_id, is_deleted, ref_name, is_private, content, created_unix) FROM stdin;
1	1	1	1	1	0	f		f		1776437176
2	1	1	1	2	0	f		f		1776437176
3	1	1	1	3	0	f		t		1776437176
4	1	1	1	4	0	f		f		1776437176
5	8	1	1	4	0	f		f		1776437176
6	1	1	1	5	0	f		f		1776437176
7	8	1	1	5	0	f		f		1776437176
8	1	1	1	6	0	f		f		1776437176
9	8	1	1	6	0	f		f		1776437176
10	1	5	1	1	0	f	refs/heads/main	f		1776437178
11	1	5	1	1	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"90fde9f399190d3f24566ec288718a4fafb2d48b","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"","Len":0}	1776437178
12	1	5	1	1	0	f	refs/heads/feature/login	f		1776437178
13	1	5	1	1	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"768815c98c25700a99cf64f76d1d1d6e280e538e","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"}],"HeadCommit":{"Sha1":"768815c98c25700a99cf64f76d1d1d6e280e538e","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...768815c98c25700a99cf64f76d1d1d6e280e538e","Len":1}	1776437178
14	1	5	1	4	0	f	refs/heads/main	f		1776437178
15	8	5	1	4	0	f	refs/heads/main	f		1776437178
16	1	5	1	4	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"eb2773d81c81d42e43733cfed3cd538e7d253580","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"","Len":0}	1776437178
17	8	5	1	4	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"eb2773d81c81d42e43733cfed3cd538e7d253580","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"","Len":0}	1776437178
18	1	5	1	1	0	f	refs/heads/feature/payments	f		1776437178
19	1	5	1	1	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"}],"HeadCommit":{"Sha1":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...05a3cd50e905f4aebf20bf78acded039dfdaeaf6","Len":1}	1776437178
20	1	5	1	1	0	f	refs/heads/fix/docs	f		1776437178
21	1	5	1	1	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"7af3ed18eda760df6738550bbf521c548af6e1c2","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"}],"HeadCommit":{"Sha1":"7af3ed18eda760df6738550bbf521c548af6e1c2","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...7af3ed18eda760df6738550bbf521c548af6e1c2","Len":1}	1776437178
22	1	5	1	2	0	f	refs/heads/main	f		1776437178
23	1	5	1	2	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"cea62bb561f9840850ae5540bae7b033b1f38666","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"","Len":0}	1776437178
24	1	5	1	4	0	f	refs/heads/feature/login	f		1776437179
25	8	5	1	4	0	f	refs/heads/feature/login	f		1776437179
26	1	5	1	4	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...1e20b9bd9f045317178243cc3e37f97994ebe6d1","Len":1}	1776437179
27	8	5	1	4	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...1e20b9bd9f045317178243cc3e37f97994ebe6d1","Len":1}	1776437179
28	1	5	1	2	0	f	refs/heads/feature/login	f		1776437179
34	1	5	1	2	0	f	refs/heads/feature/payments	f		1776437179
29	1	5	1	2	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"73823d66ed4041f4ad1b519744a14938c7d0b580","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"73823d66ed4041f4ad1b519744a14938c7d0b580","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...73823d66ed4041f4ad1b519744a14938c7d0b580","Len":1}	1776437179
30	1	5	1	4	0	f	refs/heads/feature/payments	f		1776437179
31	8	5	1	4	0	f	refs/heads/feature/payments	f		1776437179
32	1	5	1	4	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Len":1}	1776437179
33	8	5	1	4	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","Len":1}	1776437179
35	1	5	1	2	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"a71db34f967081dec5cb2a92ea6f661ed5028456","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"a71db34f967081dec5cb2a92ea6f661ed5028456","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...a71db34f967081dec5cb2a92ea6f661ed5028456","Len":1}	1776437179
36	1	5	1	4	0	f	refs/heads/fix/docs	f		1776437179
37	8	5	1	4	0	f	refs/heads/fix/docs	f		1776437179
38	1	5	1	4	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...314f30aba83d532b0d95e7a2dbde510e4e89f0af","Len":1}	1776437179
39	8	5	1	4	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...314f30aba83d532b0d95e7a2dbde510e4e89f0af","Len":1}	1776437179
40	1	5	1	2	0	f	refs/heads/fix/docs	f		1776437179
41	1	5	1	2	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"d75fe51928cca8af29e2bf29d6acb49d472ba6ae","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"d75fe51928cca8af29e2bf29d6acb49d472ba6ae","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...d75fe51928cca8af29e2bf29d6acb49d472ba6ae","Len":1}	1776437179
42	1	5	1	5	0	f	refs/heads/main	f		1776437179
43	8	5	1	5	0	f	refs/heads/main	f		1776437179
44	1	5	1	5	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"a0db46acc393664445afef2ea94fe3f89fb5058e","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"","Len":0}	1776437179
45	8	5	1	5	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"a0db46acc393664445afef2ea94fe3f89fb5058e","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"","Len":0}	1776437179
46	1	5	1	3	0	f	refs/heads/main	t		1776437179
47	1	5	1	3	0	f	refs/heads/main	t	{"Commits":[],"HeadCommit":{"Sha1":"5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"","Len":0}	1776437179
50	1	5	1	3	0	f	refs/heads/feature/payments	t		1776437179
52	1	5	1	5	0	f	refs/heads/feature/login	f		1776437179
53	8	5	1	5	0	f	refs/heads/feature/login	f		1776437179
55	1	5	1	5	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"aee60e6cac1fb19025c9537869dda9ff587d32e4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"aee60e6cac1fb19025c9537869dda9ff587d32e4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...aee60e6cac1fb19025c9537869dda9ff587d32e4","Len":1}	1776437179
56	8	5	1	5	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"aee60e6cac1fb19025c9537869dda9ff587d32e4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"aee60e6cac1fb19025c9537869dda9ff587d32e4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...aee60e6cac1fb19025c9537869dda9ff587d32e4","Len":1}	1776437179
58	1	5	1	5	0	f	refs/heads/feature/payments	f		1776437179
59	8	5	1	5	0	f	refs/heads/feature/payments	f		1776437179
62	1	5	1	5	0	f	refs/heads/fix/docs	f		1776437179
63	8	5	1	5	0	f	refs/heads/fix/docs	f		1776437179
64	1	5	1	5	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"213daa64b907b6ab1e7c952aca8df04b350d0cce","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"213daa64b907b6ab1e7c952aca8df04b350d0cce","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...213daa64b907b6ab1e7c952aca8df04b350d0cce","Len":1}	1776437179
65	8	5	1	5	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"213daa64b907b6ab1e7c952aca8df04b350d0cce","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"213daa64b907b6ab1e7c952aca8df04b350d0cce","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...213daa64b907b6ab1e7c952aca8df04b350d0cce","Len":1}	1776437179
70	1	5	1	6	0	f	refs/heads/feature/login	f		1776437180
71	8	5	1	6	0	f	refs/heads/feature/login	f		1776437180
72	1	5	1	6	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Len":1}	1776437180
73	8	5	1	6	0	f	refs/heads/feature/login	f	{"Commits":[{"Sha1":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","Len":1}	1776437180
76	1	5	1	6	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"b229287050e436012bc103d0242e77471e637422","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"b229287050e436012bc103d0242e77471e637422","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b229287050e436012bc103d0242e77471e637422","Len":1}	1776437180
48	1	5	1	3	0	f	refs/heads/feature/login	t		1776437179
49	1	5	1	3	0	f	refs/heads/feature/login	t	{"Commits":[{"Sha1":"77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","Message":"feat(auth): add guarded login flow with mfa checks\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","Len":1}	1776437179
51	1	5	1	3	0	f	refs/heads/feature/payments	t	{"Commits":[{"Sha1":"74d665004f9841e6456e1e6a4e0c71cd1f9c5717","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"74d665004f9841e6456e1e6a4e0c71cd1f9c5717","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...74d665004f9841e6456e1e6a4e0c71cd1f9c5717","Len":1}	1776437179
54	1	5	1	3	0	f	refs/heads/fix/docs	t		1776437179
57	1	5	1	3	0	f	refs/heads/fix/docs	t	{"Commits":[{"Sha1":"46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"}],"HeadCommit":{"Sha1":"46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:17+08:00"},"CompareURL":"platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","Len":1}	1776437179
60	1	5	1	5	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"65dcd79de237b319fc40f684c77dbc5a1a277e50","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"65dcd79de237b319fc40f684c77dbc5a1a277e50","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...65dcd79de237b319fc40f684c77dbc5a1a277e50","Len":1}	1776437179
61	8	5	1	5	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"65dcd79de237b319fc40f684c77dbc5a1a277e50","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"}],"HeadCommit":{"Sha1":"65dcd79de237b319fc40f684c77dbc5a1a277e50","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:18+08:00"},"CompareURL":"acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...65dcd79de237b319fc40f684c77dbc5a1a277e50","Len":1}	1776437179
66	1	5	1	6	0	f	refs/heads/main	f		1776437180
67	8	5	1	6	0	f	refs/heads/main	f		1776437180
68	1	5	1	6	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"6fcd155b3cb493770d73395917a0472b706433c0","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"","Len":0}	1776437180
69	8	5	1	6	0	f	refs/heads/main	f	{"Commits":[],"HeadCommit":{"Sha1":"6fcd155b3cb493770d73395917a0472b706433c0","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"","Len":0}	1776437180
74	1	5	1	6	0	f	refs/heads/feature/payments	f		1776437180
75	8	5	1	6	0	f	refs/heads/feature/payments	f		1776437180
77	8	5	1	6	0	f	refs/heads/feature/payments	f	{"Commits":[{"Sha1":"b229287050e436012bc103d0242e77471e637422","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"b229287050e436012bc103d0242e77471e637422","Message":"feat(billing): introduce payment charge path with retries\\n","AuthorEmail":"ethan.walker@techcorp.com","AuthorName":"Ethan Walker","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b229287050e436012bc103d0242e77471e637422","Len":1}	1776437180
78	1	5	1	6	0	f	refs/heads/fix/docs	f		1776437180
79	8	5	1	6	0	f	refs/heads/fix/docs	f		1776437180
80	1	5	1	6	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Len":1}	1776437180
81	8	5	1	6	0	f	refs/heads/fix/docs	f	{"Commits":[{"Sha1":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"}],"HeadCommit":{"Sha1":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Message":"docs(qa): add release notes and sign-off checklist\\n","AuthorEmail":"mia.kim@techcorp.com","AuthorName":"Mia Kim","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:19+08:00"},"CompareURL":"acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...1cf7dd1a97af7294b16c577a3f99ece633b87fbf","Len":1}	1776437180
82	1	6	1	1	0	f		f	1|Login error on Safari	1776437180
83	1	6	1	1	0	f		f	2|Add payment retries	1776437181
84	1	6	1	1	0	f		f	3|Improve README setup	1776437181
85	1	6	1	1	0	f		f	4|Rotate deployment secrets	1776437181
86	1	6	1	1	0	f		f	5|Document release process	1776437181
87	3	10	3	1	5	f		f	1|I can reproduce this on macOS + Safari.	1776437181
88	1	10	3	1	5	f		f	1|I can reproduce this on macOS + Safari.	1776437181
89	2	10	2	1	6	f		f	2|Retry policy draft is ready for review.	1776437181
90	1	10	2	1	6	f		f	2|Retry policy draft is ready for review.	1776437181
91	4	10	4	1	7	f		f	3|Please include screenshots for the setup docs.	1776437181
92	1	10	4	1	7	f		f	3|Please include screenshots for the setup docs.	1776437181
93	5	10	5	1	8	f		f	4|Rotation window scheduled for Friday 22:00 UTC.	1776437181
94	1	10	5	1	8	f		f	4|Rotation window scheduled for Friday 22:00 UTC.	1776437181
95	1	10	1	1	9	f		f	5|Will align this with v1 launch checklist.	1776437181
96	6	10	6	1	10	f		f	1|I will own the fix rollout and PR merge strategy.	1776437181
97	1	10	6	1	10	f		f	1|I will own the fix rollout and PR merge strategy.	1776437181
98	7	10	7	1	11	f		f	2|QA scenario matrix added for retry edge cases.	1776437181
99	1	10	7	1	11	f		f	2|QA scenario matrix added for retry edge cases.	1776437181
100	1	12	1	1	12	f		f	3|	1776437181
101	1	12	1	1	13	f		f	4|	1776437181
102	2	7	2	1	0	f		f	6|feat: login flow	1776437181
103	1	7	2	1	0	f		f	6|feat: login flow	1776437181
104	3	7	3	1	0	f		f	7|feat: payment retries	1776437182
105	1	7	3	1	0	f		f	7|feat: payment retries	1776437182
106	1	7	1	1	0	f		f	8|docs: benchmark notes	1776437182
107	3	21	3	1	20	f		f	6|Looks good overall.	1776437182
108	1	21	3	1	20	f		f	6|Looks good overall.	1776437182
109	4	23	4	1	21	f		f	7|Please add edge-case tests.	1776437182
110	1	23	4	1	21	f		f	7|Please add edge-case tests.	1776437182
111	2	21	2	1	22	f		f	8|Docs update is clear.	1776437182
112	1	21	2	1	22	f		f	8|Docs update is clear.	1776437182
113	7	21	7	1	23	f		f	6|QA checks passed for login path.	1776437182
114	1	21	7	1	23	f		f	6|QA checks passed for login path.	1776437182
115	6	21	6	1	24	f		f	7|Engineering review complete, ready to merge.	1776437182
116	1	21	6	1	24	f		f	7|Engineering review complete, ready to merge.	1776437182
117	1	9	1	1	0	f	refs/tags/v0.1.0	f	{"Commits":null,"HeadCommit":{"Sha1":"90fde9f399190d3f24566ec288718a4fafb2d48b","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/0000000000000000000000000000000000000000...90fde9f399190d3f24566ec288718a4fafb2d48b","Len":0}	1776437182
118	1	9	1	1	0	f	refs/tags/v0.2.0	f	{"Commits":null,"HeadCommit":{"Sha1":"90fde9f399190d3f24566ec288718a4fafb2d48b","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/0000000000000000000000000000000000000000...90fde9f399190d3f24566ec288718a4fafb2d48b","Len":0}	1776437182
119	1	9	1	1	0	f	refs/tags/v1.0.0	f	{"Commits":null,"HeadCommit":{"Sha1":"90fde9f399190d3f24566ec288718a4fafb2d48b","Message":"ops(data): add backfill helper for business events\\n","AuthorEmail":"nina.patel@techcorp.com","AuthorName":"Nina Patel","CommitterEmail":"ethan.walker@techcorp.com","CommitterName":"Ethan Walker","Timestamp":"2026-04-17T22:46:16+08:00"},"CompareURL":"platform_admin/mini-seed-repo/compare/0000000000000000000000000000000000000000...90fde9f399190d3f24566ec288718a4fafb2d48b","Len":0}	1776437182
120	1	24	1	1	0	f	refs/tags/v0.1.0	f	v0.1.0	1776437182
121	1	24	1	1	0	f	refs/tags/v0.2.0	f	v0.2.0	1776437182
122	1	24	1	1	0	f	refs/tags/v1.0.0	f	v1.0.0	1776437183
123	2	1	2	7	0	f		f		1776437183
\.


--
-- Data for Name: action_artifact; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_artifact (id, run_id, runner_id, repo_id, owner_id, commit_sha, storage_path, file_size, file_compressed_size, content_encoding, artifact_path, artifact_name, status, created_unix, updated_unix, expired_unix) FROM stdin;
\.


--
-- Data for Name: action_run; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_run (id, title, repo_id, owner_id, workflow_id, index, trigger_user_id, schedule_id, ref, commit_sha, is_fork_pull_request, need_approval, approved_by, event, event_payload, trigger_event, status, version, started, stopped, previous_duration, created, updated) FROM stdin;
1	ops(data): add backfill helper for business events	1	1	ci.yml	1	1	0	refs/heads/main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"90fde9f399190d3f24566ec288718a4fafb2d48b","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"90fde9f399190d3f24566ec288718a4fafb2d48b","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/90fde9f399190d3f24566ec288718a4fafb2d48b","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
2	feat(auth): add guarded login flow with mfa checks	1	1	ci.yml	2	1	0	refs/heads/feature/login	768815c98c25700a99cf64f76d1d1d6e280e538e	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"768815c98c25700a99cf64f76d1d1d6e280e538e","compare_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...768815c98c25700a99cf64f76d1d1d6e280e538e","commits":[{"id":"768815c98c25700a99cf64f76d1d1d6e280e538e","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/768815c98c25700a99cf64f76d1d1d6e280e538e","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"768815c98c25700a99cf64f76d1d1d6e280e538e","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/768815c98c25700a99cf64f76d1d1d6e280e538e","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
3	ops(data): add backfill helper for business events	4	8	ci.yml	1	1	0	refs/heads/main	eb2773d81c81d42e43733cfed3cd538e7d253580	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"eb2773d81c81d42e43733cfed3cd538e7d253580","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"eb2773d81c81d42e43733cfed3cd538e7d253580","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/eb2773d81c81d42e43733cfed3cd538e7d253580","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":4,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"checkout-service","full_name":"acme-platform/checkout-service","description":"Checkout service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/checkout-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service","link":"","ssh_url":"git@localhost:acme-platform/checkout-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/checkout-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
4	feat(billing): introduce payment charge path with retries	1	1	ci.yml	3	1	0	refs/heads/feature/payments	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","compare_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...05a3cd50e905f4aebf20bf78acded039dfdaeaf6","commits":[{"id":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/05a3cd50e905f4aebf20bf78acded039dfdaeaf6","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/05a3cd50e905f4aebf20bf78acded039dfdaeaf6","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
5	docs(qa): add release notes and sign-off checklist	1	1	ci.yml	4	1	0	refs/heads/fix/docs	7af3ed18eda760df6738550bbf521c548af6e1c2	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"7af3ed18eda760df6738550bbf521c548af6e1c2","compare_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/compare/90fde9f399190d3f24566ec288718a4fafb2d48b...7af3ed18eda760df6738550bbf521c548af6e1c2","commits":[{"id":"7af3ed18eda760df6738550bbf521c548af6e1c2","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/7af3ed18eda760df6738550bbf521c548af6e1c2","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"7af3ed18eda760df6738550bbf521c548af6e1c2","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/commit/7af3ed18eda760df6738550bbf521c548af6e1c2","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:16+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
8	feat(auth): add guarded login flow with mfa checks	2	1	ci.yml	2	1	0	refs/heads/feature/login	73823d66ed4041f4ad1b519744a14938c7d0b580	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"73823d66ed4041f4ad1b519744a14938c7d0b580","compare_url":"http://127.0.0.1:54307/platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...73823d66ed4041f4ad1b519744a14938c7d0b580","commits":[{"id":"73823d66ed4041f4ad1b519744a14938c7d0b580","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/73823d66ed4041f4ad1b519744a14938c7d0b580","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"73823d66ed4041f4ad1b519744a14938c7d0b580","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/73823d66ed4041f4ad1b519744a14938c7d0b580","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":2,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"platform-api","full_name":"platform_admin/platform-api","description":"Personal platform api repo","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api/languages","html_url":"http://127.0.0.1:54307/platform_admin/platform-api","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api","link":"","ssh_url":"git@localhost:platform_admin/platform-api.git","clone_url":"http://127.0.0.1:54307/platform_admin/platform-api.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
9	feat(billing): introduce payment charge path with retries	4	8	ci.yml	3	1	0	refs/heads/feature/payments	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","compare_url":"http://127.0.0.1:54307/acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","commits":[{"id":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":4,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"checkout-service","full_name":"acme-platform/checkout-service","description":"Checkout service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/checkout-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service","link":"","ssh_url":"git@localhost:acme-platform/checkout-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/checkout-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
6	ops(data): add backfill helper for business events	2	1	ci.yml	1	1	0	refs/heads/main	cea62bb561f9840850ae5540bae7b033b1f38666	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"cea62bb561f9840850ae5540bae7b033b1f38666","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"cea62bb561f9840850ae5540bae7b033b1f38666","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/cea62bb561f9840850ae5540bae7b033b1f38666","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":2,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"platform-api","full_name":"platform_admin/platform-api","description":"Personal platform api repo","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api/languages","html_url":"http://127.0.0.1:54307/platform_admin/platform-api","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api","link":"","ssh_url":"git@localhost:platform_admin/platform-api.git","clone_url":"http://127.0.0.1:54307/platform_admin/platform-api.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437178	1776437178
7	feat(auth): add guarded login flow with mfa checks	4	8	ci.yml	2	1	0	refs/heads/feature/login	1e20b9bd9f045317178243cc3e37f97994ebe6d1	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","compare_url":"http://127.0.0.1:54307/acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...1e20b9bd9f045317178243cc3e37f97994ebe6d1","commits":[{"id":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/1e20b9bd9f045317178243cc3e37f97994ebe6d1","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"1e20b9bd9f045317178243cc3e37f97994ebe6d1","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/1e20b9bd9f045317178243cc3e37f97994ebe6d1","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":4,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"checkout-service","full_name":"acme-platform/checkout-service","description":"Checkout service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/checkout-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service","link":"","ssh_url":"git@localhost:acme-platform/checkout-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/checkout-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
10	feat(billing): introduce payment charge path with retries	2	1	ci.yml	3	1	0	refs/heads/feature/payments	a71db34f967081dec5cb2a92ea6f661ed5028456	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"a71db34f967081dec5cb2a92ea6f661ed5028456","compare_url":"http://127.0.0.1:54307/platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...a71db34f967081dec5cb2a92ea6f661ed5028456","commits":[{"id":"a71db34f967081dec5cb2a92ea6f661ed5028456","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/a71db34f967081dec5cb2a92ea6f661ed5028456","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"a71db34f967081dec5cb2a92ea6f661ed5028456","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/a71db34f967081dec5cb2a92ea6f661ed5028456","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":2,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"platform-api","full_name":"platform_admin/platform-api","description":"Personal platform api repo","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api/languages","html_url":"http://127.0.0.1:54307/platform_admin/platform-api","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api","link":"","ssh_url":"git@localhost:platform_admin/platform-api.git","clone_url":"http://127.0.0.1:54307/platform_admin/platform-api.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
11	docs(qa): add release notes and sign-off checklist	4	8	ci.yml	4	1	0	refs/heads/fix/docs	314f30aba83d532b0d95e7a2dbde510e4e89f0af	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","compare_url":"http://127.0.0.1:54307/acme-platform/checkout-service/compare/eb2773d81c81d42e43733cfed3cd538e7d253580...314f30aba83d532b0d95e7a2dbde510e4e89f0af","commits":[{"id":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/314f30aba83d532b0d95e7a2dbde510e4e89f0af","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"314f30aba83d532b0d95e7a2dbde510e4e89f0af","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/checkout-service/commit/314f30aba83d532b0d95e7a2dbde510e4e89f0af","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":4,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"checkout-service","full_name":"acme-platform/checkout-service","description":"Checkout service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/checkout-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/checkout-service","link":"","ssh_url":"git@localhost:acme-platform/checkout-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/checkout-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
12	docs(qa): add release notes and sign-off checklist	2	1	ci.yml	4	1	0	refs/heads/fix/docs	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"d75fe51928cca8af29e2bf29d6acb49d472ba6ae","compare_url":"http://127.0.0.1:54307/platform_admin/platform-api/compare/cea62bb561f9840850ae5540bae7b033b1f38666...d75fe51928cca8af29e2bf29d6acb49d472ba6ae","commits":[{"id":"d75fe51928cca8af29e2bf29d6acb49d472ba6ae","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/d75fe51928cca8af29e2bf29d6acb49d472ba6ae","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"d75fe51928cca8af29e2bf29d6acb49d472ba6ae","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/platform-api/commit/d75fe51928cca8af29e2bf29d6acb49d472ba6ae","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":2,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"platform-api","full_name":"platform_admin/platform-api","description":"Personal platform api repo","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api/languages","html_url":"http://127.0.0.1:54307/platform_admin/platform-api","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/platform-api","link":"","ssh_url":"git@localhost:platform_admin/platform-api.git","clone_url":"http://127.0.0.1:54307/platform_admin/platform-api.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
13	ops(data): add backfill helper for business events	5	8	ci.yml	1	1	0	refs/heads/main	a0db46acc393664445afef2ea94fe3f89fb5058e	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"a0db46acc393664445afef2ea94fe3f89fb5058e","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"a0db46acc393664445afef2ea94fe3f89fb5058e","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/a0db46acc393664445afef2ea94fe3f89fb5058e","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":5,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"billing-service","full_name":"acme-platform/billing-service","description":"Billing service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/billing-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service","link":"","ssh_url":"git@localhost:acme-platform/billing-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/billing-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
14	ops(data): add backfill helper for business events	3	1	ci.yml	1	1	0	refs/heads/main	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":3,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"infra-scripts","full_name":"platform_admin/infra-scripts","description":"Infrastructure scripts repo","empty":false,"private":true,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts/languages","html_url":"http://127.0.0.1:54307/platform_admin/infra-scripts","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts","link":"","ssh_url":"git@localhost:platform_admin/infra-scripts.git","clone_url":"http://127.0.0.1:54307/platform_admin/infra-scripts.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
15	feat(auth): add guarded login flow with mfa checks	3	1	ci.yml	2	1	0	refs/heads/feature/login	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","compare_url":"http://127.0.0.1:54307/platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","commits":[{"id":"77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/77535b8e75344bc2f3c7e2dd28ec1c70e09415a4","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":3,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"infra-scripts","full_name":"platform_admin/infra-scripts","description":"Infrastructure scripts repo","empty":false,"private":true,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts/languages","html_url":"http://127.0.0.1:54307/platform_admin/infra-scripts","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts","link":"","ssh_url":"git@localhost:platform_admin/infra-scripts.git","clone_url":"http://127.0.0.1:54307/platform_admin/infra-scripts.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
16	feat(billing): introduce payment charge path with retries	3	1	ci.yml	3	1	0	refs/heads/feature/payments	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"74d665004f9841e6456e1e6a4e0c71cd1f9c5717","compare_url":"http://127.0.0.1:54307/platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...74d665004f9841e6456e1e6a4e0c71cd1f9c5717","commits":[{"id":"74d665004f9841e6456e1e6a4e0c71cd1f9c5717","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/74d665004f9841e6456e1e6a4e0c71cd1f9c5717","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"74d665004f9841e6456e1e6a4e0c71cd1f9c5717","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/74d665004f9841e6456e1e6a4e0c71cd1f9c5717","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":3,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"infra-scripts","full_name":"platform_admin/infra-scripts","description":"Infrastructure scripts repo","empty":false,"private":true,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts/languages","html_url":"http://127.0.0.1:54307/platform_admin/infra-scripts","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts","link":"","ssh_url":"git@localhost:platform_admin/infra-scripts.git","clone_url":"http://127.0.0.1:54307/platform_admin/infra-scripts.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
18	docs(qa): add release notes and sign-off checklist	3	1	ci.yml	4	1	0	refs/heads/fix/docs	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","compare_url":"http://127.0.0.1:54307/platform_admin/infra-scripts/compare/5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7...46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","commits":[{"id":"46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/platform_admin/infra-scripts/commit/46c7ca2aea3adbc18f68bf4820c9be3a435afdd8","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:17+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":3,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"infra-scripts","full_name":"platform_admin/infra-scripts","description":"Infrastructure scripts repo","empty":false,"private":true,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts/languages","html_url":"http://127.0.0.1:54307/platform_admin/infra-scripts","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/infra-scripts","link":"","ssh_url":"git@localhost:platform_admin/infra-scripts.git","clone_url":"http://127.0.0.1:54307/platform_admin/infra-scripts.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
22	feat(auth): add guarded login flow with mfa checks	6	8	ci.yml	2	1	0	refs/heads/feature/login	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","compare_url":"http://127.0.0.1:54307/acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","commits":[{"id":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":6,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"mobile-app","full_name":"acme-platform/mobile-app","description":"Mobile app repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app/languages","html_url":"http://127.0.0.1:54307/acme-platform/mobile-app","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app","link":"","ssh_url":"git@localhost:acme-platform/mobile-app.git","clone_url":"http://127.0.0.1:54307/acme-platform/mobile-app.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:20Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437180	1776437180
24	docs(qa): add release notes and sign-off checklist	6	8	ci.yml	4	1	0	refs/heads/fix/docs	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","compare_url":"http://127.0.0.1:54307/acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...1cf7dd1a97af7294b16c577a3f99ece633b87fbf","commits":[{"id":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/1cf7dd1a97af7294b16c577a3f99ece633b87fbf","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"1cf7dd1a97af7294b16c577a3f99ece633b87fbf","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/1cf7dd1a97af7294b16c577a3f99ece633b87fbf","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":6,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"mobile-app","full_name":"acme-platform/mobile-app","description":"Mobile app repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app/languages","html_url":"http://127.0.0.1:54307/acme-platform/mobile-app","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app","link":"","ssh_url":"git@localhost:acme-platform/mobile-app.git","clone_url":"http://127.0.0.1:54307/acme-platform/mobile-app.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:20Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437180	1776437180
17	feat(auth): add guarded login flow with mfa checks	5	8	ci.yml	2	1	0	refs/heads/feature/login	aee60e6cac1fb19025c9537869dda9ff587d32e4	f	f	0	push	{"ref":"refs/heads/feature/login","before":"0000000000000000000000000000000000000000","after":"aee60e6cac1fb19025c9537869dda9ff587d32e4","compare_url":"http://127.0.0.1:54307/acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...aee60e6cac1fb19025c9537869dda9ff587d32e4","commits":[{"id":"aee60e6cac1fb19025c9537869dda9ff587d32e4","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/aee60e6cac1fb19025c9537869dda9ff587d32e4","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/login.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"aee60e6cac1fb19025c9537869dda9ff587d32e4","message":"feat(auth): add guarded login flow with mfa checks\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/aee60e6cac1fb19025c9537869dda9ff587d32e4","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/login.py"],"removed":[],"modified":[]},"repository":{"id":5,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"billing-service","full_name":"acme-platform/billing-service","description":"Billing service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/billing-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service","link":"","ssh_url":"git@localhost:acme-platform/billing-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/billing-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
19	feat(billing): introduce payment charge path with retries	5	8	ci.yml	3	1	0	refs/heads/feature/payments	65dcd79de237b319fc40f684c77dbc5a1a277e50	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"65dcd79de237b319fc40f684c77dbc5a1a277e50","compare_url":"http://127.0.0.1:54307/acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...65dcd79de237b319fc40f684c77dbc5a1a277e50","commits":[{"id":"65dcd79de237b319fc40f684c77dbc5a1a277e50","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/65dcd79de237b319fc40f684c77dbc5a1a277e50","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"65dcd79de237b319fc40f684c77dbc5a1a277e50","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/65dcd79de237b319fc40f684c77dbc5a1a277e50","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":5,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"billing-service","full_name":"acme-platform/billing-service","description":"Billing service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/billing-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service","link":"","ssh_url":"git@localhost:acme-platform/billing-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/billing-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437179	1776437179
20	docs(qa): add release notes and sign-off checklist	5	8	ci.yml	4	1	0	refs/heads/fix/docs	213daa64b907b6ab1e7c952aca8df04b350d0cce	f	f	0	push	{"ref":"refs/heads/fix/docs","before":"0000000000000000000000000000000000000000","after":"213daa64b907b6ab1e7c952aca8df04b350d0cce","compare_url":"http://127.0.0.1:54307/acme-platform/billing-service/compare/a0db46acc393664445afef2ea94fe3f89fb5058e...213daa64b907b6ab1e7c952aca8df04b350d0cce","commits":[{"id":"213daa64b907b6ab1e7c952aca8df04b350d0cce","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/213daa64b907b6ab1e7c952aca8df04b350d0cce","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["docs/notes.md"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"213daa64b907b6ab1e7c952aca8df04b350d0cce","message":"docs(qa): add release notes and sign-off checklist\\n","url":"http://127.0.0.1:54307/acme-platform/billing-service/commit/213daa64b907b6ab1e7c952aca8df04b350d0cce","author":{"name":"Mia Kim","email":"mia.kim@techcorp.com","username":"mia.kim"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:18+08:00","added":["docs/notes.md"],"removed":[],"modified":[]},"repository":{"id":5,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"billing-service","full_name":"acme-platform/billing-service","description":"Billing service repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service/languages","html_url":"http://127.0.0.1:54307/acme-platform/billing-service","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/billing-service","link":"","ssh_url":"git@localhost:acme-platform/billing-service.git","clone_url":"http://127.0.0.1:54307/acme-platform/billing-service.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:19Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437180	1776437180
21	ops(data): add backfill helper for business events	6	8	ci.yml	1	1	0	refs/heads/main	6fcd155b3cb493770d73395917a0472b706433c0	f	f	0	push	{"ref":"refs/heads/main","before":"0000000000000000000000000000000000000000","after":"6fcd155b3cb493770d73395917a0472b706433c0","compare_url":"http://127.0.0.1:54307/","commits":[],"total_commits":0,"head_commit":{"id":"6fcd155b3cb493770d73395917a0472b706433c0","message":"ops(data): add backfill helper for business events\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/6fcd155b3cb493770d73395917a0472b706433c0","author":{"name":"Nina Patel","email":"nina.patel@techcorp.com","username":""},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["scripts/backfill_business_events.sh"],"removed":[],"modified":[]},"repository":{"id":6,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"mobile-app","full_name":"acme-platform/mobile-app","description":"Mobile app repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":22,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app/languages","html_url":"http://127.0.0.1:54307/acme-platform/mobile-app","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app","link":"","ssh_url":"git@localhost:acme-platform/mobile-app.git","clone_url":"http://127.0.0.1:54307/acme-platform/mobile-app.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:20Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437180	1776437180
23	feat(billing): introduce payment charge path with retries	6	8	ci.yml	3	1	0	refs/heads/feature/payments	b229287050e436012bc103d0242e77471e637422	f	f	0	push	{"ref":"refs/heads/feature/payments","before":"0000000000000000000000000000000000000000","after":"b229287050e436012bc103d0242e77471e637422","compare_url":"http://127.0.0.1:54307/acme-platform/mobile-app/compare/6fcd155b3cb493770d73395917a0472b706433c0...b229287050e436012bc103d0242e77471e637422","commits":[{"id":"b229287050e436012bc103d0242e77471e637422","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/b229287050e436012bc103d0242e77471e637422","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["src/payments.py"],"removed":[],"modified":[]}],"total_commits":0,"head_commit":{"id":"b229287050e436012bc103d0242e77471e637422","message":"feat(billing): introduce payment charge path with retries\\n","url":"http://127.0.0.1:54307/acme-platform/mobile-app/commit/b229287050e436012bc103d0242e77471e637422","author":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"committer":{"name":"Ethan Walker","email":"ethan.walker@techcorp.com","username":"ethan.walker"},"verification":null,"timestamp":"2026-04-17T22:46:19+08:00","added":["src/payments.py"],"removed":[],"modified":[]},"repository":{"id":6,"owner":{"id":8,"login":"acme-platform","login_name":"","source_id":0,"full_name":"Acme Platform","email":"","avatar_url":"http://127.0.0.1:54307/avatars/fa5a4105fbd4e59483b803d9b79af636","html_url":"http://127.0.0.1:54307/acme-platform","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:16Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"Platform engineering org","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"acme-platform"},"name":"mobile-app","full_name":"acme-platform/mobile-app","description":"Mobile app repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app/languages","html_url":"http://127.0.0.1:54307/acme-platform/mobile-app","url":"http://127.0.0.1:54307/api/v1/repos/acme-platform/mobile-app","link":"","ssh_url":"git@localhost:acme-platform/mobile-app.git","clone_url":"http://127.0.0.1:54307/acme-platform/mobile-app.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":0,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:20Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"pusher":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"}}	push	5	1	0	0	0	1776437180	1776437180
25	feat(auth): add guarded login flow with mfa checks	1	1	lint.yml	5	2	0	refs/pull/6/head	768815c98c25700a99cf64f76d1d1d6e280e538e	f	f	0	pull_request	{"action":"opened","number":6,"pull_request":{"id":1,"url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/6","number":6,"user":{"id":2,"login":"dev_alice","login_name":"","source_id":0,"full_name":"","email":"dev_alice@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/00297b11bfd9b6ff690806b32bcf882f","html_url":"http://127.0.0.1:54307/dev_alice","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"dev_alice"},"title":"feat: login flow","body":"Implements login module","labels":[],"milestone":null,"assignee":null,"assignees":[],"requested_reviewers":[],"requested_reviewers_teams":[],"state":"open","draft":false,"is_locked":false,"comments":0,"additions":6,"deletions":0,"changed_files":1,"html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/6","diff_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/6.diff","patch_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/6.patch","mergeable":true,"merged":false,"merged_at":null,"merge_commit_sha":null,"merged_by":null,"allow_maintainer_edit":false,"base":{"label":"main","ref":"main","sha":"90fde9f399190d3f24566ec288718a4fafb2d48b","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"head":{"label":"feature/login","ref":"feature/login","sha":"768815c98c25700a99cf64f76d1d1d6e280e538e","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"merge_base":"90fde9f399190d3f24566ec288718a4fafb2d48b","due_date":null,"created_at":"2026-04-17T14:46:21Z","updated_at":"2026-04-17T14:46:21Z","closed_at":null,"pin_order":0},"requested_reviewer":null,"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":0,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"sender":{"id":2,"login":"dev_alice","login_name":"","source_id":0,"full_name":"","email":"dev_alice@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/00297b11bfd9b6ff690806b32bcf882f","html_url":"http://127.0.0.1:54307/dev_alice","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"dev_alice"},"commit_id":"","review":null}	pull_request	5	1	0	0	0	1776437181	1776437181
26	feat(billing): introduce payment charge path with retries	1	1	lint.yml	6	3	0	refs/pull/7/head	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	f	0	pull_request	{"action":"opened","number":7,"pull_request":{"id":2,"url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/7","number":7,"user":{"id":3,"login":"dev_bob","login_name":"","source_id":0,"full_name":"","email":"dev_bob@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/3c4bb300edfa887cc83a3bd6207f933e","html_url":"http://127.0.0.1:54307/dev_bob","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"dev_bob"},"title":"feat: payment retries","body":"Adds payment retries","labels":[],"milestone":null,"assignee":null,"assignees":[],"requested_reviewers":[],"requested_reviewers_teams":[],"state":"open","draft":false,"is_locked":false,"comments":0,"additions":6,"deletions":0,"changed_files":1,"html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/7","diff_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/7.diff","patch_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/7.patch","mergeable":true,"merged":false,"merged_at":null,"merge_commit_sha":null,"merged_by":null,"allow_maintainer_edit":false,"base":{"label":"main","ref":"main","sha":"90fde9f399190d3f24566ec288718a4fafb2d48b","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":1,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"head":{"label":"feature/payments","ref":"feature/payments","sha":"05a3cd50e905f4aebf20bf78acded039dfdaeaf6","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":1,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"merge_base":"90fde9f399190d3f24566ec288718a4fafb2d48b","due_date":null,"created_at":"2026-04-17T14:46:21Z","updated_at":"2026-04-17T14:46:22Z","closed_at":null,"pin_order":0},"requested_reviewer":null,"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":1,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"sender":{"id":3,"login":"dev_bob","login_name":"","source_id":0,"full_name":"","email":"dev_bob@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/3c4bb300edfa887cc83a3bd6207f933e","html_url":"http://127.0.0.1:54307/dev_bob","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"dev_bob"},"commit_id":"","review":null}	pull_request	5	1	0	0	0	1776437182	1776437182
27	docs(qa): add release notes and sign-off checklist	1	1	lint.yml	7	1	0	refs/pull/8/head	7af3ed18eda760df6738550bbf521c548af6e1c2	f	f	0	pull_request	{"action":"opened","number":8,"pull_request":{"id":3,"url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/8","number":8,"user":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"title":"docs: benchmark notes","body":"Adds benchmark notes","labels":[],"milestone":null,"assignee":null,"assignees":[],"requested_reviewers":[],"requested_reviewers_teams":[],"state":"open","draft":false,"is_locked":false,"comments":0,"additions":6,"deletions":0,"changed_files":1,"html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/8","diff_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/8.diff","patch_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo/pulls/8.patch","mergeable":true,"merged":false,"merged_at":null,"merge_commit_sha":null,"merged_by":null,"allow_maintainer_edit":false,"base":{"label":"main","ref":"main","sha":"90fde9f399190d3f24566ec288718a4fafb2d48b","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":2,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"head":{"label":"fix/docs","ref":"fix/docs","sha":"7af3ed18eda760df6738550bbf521c548af6e1c2","repo_id":1,"repo":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":2,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":false,"push":false,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]}},"merge_base":"90fde9f399190d3f24566ec288718a4fafb2d48b","due_date":null,"created_at":"2026-04-17T14:46:22Z","updated_at":"2026-04-17T14:46:22Z","closed_at":null,"pin_order":0},"requested_reviewer":null,"repository":{"id":1,"owner":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform.admin@techcorp.com","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"name":"mini-seed-repo","full_name":"platform_admin/mini-seed-repo","description":"Primary seed repository","empty":false,"private":false,"fork":false,"template":false,"mirror":false,"size":30,"language":"","languages_url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages","html_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo","url":"http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo","link":"","ssh_url":"git@localhost:platform_admin/mini-seed-repo.git","clone_url":"http://127.0.0.1:54307/platform_admin/mini-seed-repo.git","original_url":"","website":"","stars_count":0,"forks_count":0,"watchers_count":1,"open_issues_count":3,"open_pr_counter":2,"release_counter":0,"default_branch":"main","archived":false,"created_at":"2026-04-17T14:46:16Z","updated_at":"2026-04-17T14:46:18Z","archived_at":"1970-01-01T00:00:00Z","permissions":{"admin":true,"push":true,"pull":true},"has_code":true,"has_issues":true,"internal_tracker":{"enable_time_tracker":true,"allow_only_contributors_to_track_time":true,"enable_issue_dependencies":true},"has_wiki":true,"has_pull_requests":true,"has_projects":true,"projects_mode":"all","has_releases":true,"has_packages":true,"has_actions":true,"ignore_whitespace_conflicts":false,"allow_merge_commits":true,"allow_rebase":true,"allow_rebase_explicit":true,"allow_squash_merge":true,"allow_fast_forward_only_merge":true,"allow_rebase_update":true,"allow_manual_merge":false,"autodetect_manual_merge":false,"default_delete_branch_after_merge":false,"default_merge_style":"merge","default_allow_maintainer_edit":false,"avatar_url":"","internal":false,"mirror_interval":"","object_format_name":"sha1","mirror_updated":"0001-01-01T00:00:00Z","topics":[],"licenses":[]},"sender":{"id":1,"login":"platform_admin","login_name":"","source_id":0,"full_name":"","email":"platform_admin@noreply.localhost","avatar_url":"http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741","html_url":"http://127.0.0.1:54307/platform_admin","language":"","is_admin":false,"last_login":"0001-01-01T00:00:00Z","created":"2026-04-17T14:46:14Z","restricted":false,"active":false,"prohibit_login":false,"location":"","website":"","description":"","visibility":"public","followers_count":0,"following_count":0,"starred_repos_count":0,"username":"platform_admin"},"commit_id":"","review":null}	pull_request	5	1	0	0	0	1776437182	1776437182
28	ops(data): add backfill helper for business events	1	1	ci.yml	8	1	0	refs/heads/main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f	0	workflow_dispatch	{\n  "workflow": "ci.yml",\n  "ref": "main",\n  "inputs": {},\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "login": "platform_admin",\n      "login_name": "",\n      "source_id": 0,\n      "full_name": "",\n      "email": "platform_admin@noreply.localhost",\n      "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n      "html_url": "http://127.0.0.1:54307/platform_admin",\n      "language": "",\n      "is_admin": false,\n      "last_login": "0001-01-01T00:00:00Z",\n      "created": "2026-04-17T14:46:14Z",\n      "restricted": false,\n      "active": false,\n      "prohibit_login": false,\n      "location": "",\n      "website": "",\n      "description": "",\n      "visibility": "public",\n      "followers_count": 0,\n      "following_count": 0,\n      "starred_repos_count": 0,\n      "username": "platform_admin"\n    },\n    "name": "mini-seed-repo",\n    "full_name": "platform_admin/mini-seed-repo",\n    "description": "Primary seed repository",\n    "empty": false,\n    "private": false,\n    "fork": false,\n    "template": false,\n    "mirror": false,\n    "size": 30,\n    "language": "",\n    "languages_url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages",\n    "html_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo",\n    "url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo",\n    "link": "",\n    "ssh_url": "git@localhost:platform_admin/mini-seed-repo.git",\n    "clone_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo.git",\n    "original_url": "",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 3,\n    "open_pr_counter": 3,\n    "release_counter": 3,\n    "default_branch": "main",\n    "archived": false,\n    "created_at": "2026-04-17T14:46:16Z",\n    "updated_at": "2026-04-17T14:46:18Z",\n    "archived_at": "1970-01-01T00:00:00Z",\n    "permissions": {\n      "admin": false,\n      "push": false,\n      "pull": false\n    },\n    "has_code": true,\n    "has_issues": true,\n    "internal_tracker": {\n      "enable_time_tracker": true,\n      "allow_only_contributors_to_track_time": true,\n      "enable_issue_dependencies": true\n    },\n    "has_wiki": true,\n    "has_pull_requests": true,\n    "has_projects": true,\n    "projects_mode": "all",\n    "has_releases": true,\n    "has_packages": true,\n    "has_actions": true,\n    "ignore_whitespace_conflicts": false,\n    "allow_merge_commits": true,\n    "allow_rebase": true,\n    "allow_rebase_explicit": true,\n    "allow_squash_merge": true,\n    "allow_fast_forward_only_merge": true,\n    "allow_rebase_update": true,\n    "allow_manual_merge": false,\n    "autodetect_manual_merge": false,\n    "default_delete_branch_after_merge": false,\n    "default_merge_style": "merge",\n    "default_allow_maintainer_edit": false,\n    "avatar_url": "",\n    "internal": false,\n    "mirror_interval": "",\n    "object_format_name": "sha1",\n    "mirror_updated": "0001-01-01T00:00:00Z",\n    "topics": [],\n    "licenses": []\n  },\n  "sender": {\n    "id": 1,\n    "login": "platform_admin",\n    "login_name": "",\n    "source_id": 0,\n    "full_name": "",\n    "email": "platform_admin@noreply.localhost",\n    "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n    "html_url": "http://127.0.0.1:54307/platform_admin",\n    "language": "",\n    "is_admin": false,\n    "last_login": "0001-01-01T00:00:00Z",\n    "created": "2026-04-17T14:46:14Z",\n    "restricted": false,\n    "active": false,\n    "prohibit_login": false,\n    "location": "",\n    "website": "",\n    "description": "",\n    "visibility": "public",\n    "followers_count": 0,\n    "following_count": 0,\n    "starred_repos_count": 0,\n    "username": "platform_admin"\n  }\n}	workflow_dispatch	5	1	0	0	0	1776437183	1776437183
29	ops(data): add backfill helper for business events	1	1	lint.yml	9	1	0	refs/heads/main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f	0	workflow_dispatch	{\n  "workflow": "lint.yml",\n  "ref": "main",\n  "inputs": {},\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "login": "platform_admin",\n      "login_name": "",\n      "source_id": 0,\n      "full_name": "",\n      "email": "platform_admin@noreply.localhost",\n      "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n      "html_url": "http://127.0.0.1:54307/platform_admin",\n      "language": "",\n      "is_admin": false,\n      "last_login": "0001-01-01T00:00:00Z",\n      "created": "2026-04-17T14:46:14Z",\n      "restricted": false,\n      "active": false,\n      "prohibit_login": false,\n      "location": "",\n      "website": "",\n      "description": "",\n      "visibility": "public",\n      "followers_count": 0,\n      "following_count": 0,\n      "starred_repos_count": 0,\n      "username": "platform_admin"\n    },\n    "name": "mini-seed-repo",\n    "full_name": "platform_admin/mini-seed-repo",\n    "description": "Primary seed repository",\n    "empty": false,\n    "private": false,\n    "fork": false,\n    "template": false,\n    "mirror": false,\n    "size": 30,\n    "language": "",\n    "languages_url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages",\n    "html_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo",\n    "url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo",\n    "link": "",\n    "ssh_url": "git@localhost:platform_admin/mini-seed-repo.git",\n    "clone_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo.git",\n    "original_url": "",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 3,\n    "open_pr_counter": 3,\n    "release_counter": 3,\n    "default_branch": "main",\n    "archived": false,\n    "created_at": "2026-04-17T14:46:16Z",\n    "updated_at": "2026-04-17T14:46:18Z",\n    "archived_at": "1970-01-01T00:00:00Z",\n    "permissions": {\n      "admin": false,\n      "push": false,\n      "pull": false\n    },\n    "has_code": true,\n    "has_issues": true,\n    "internal_tracker": {\n      "enable_time_tracker": true,\n      "allow_only_contributors_to_track_time": true,\n      "enable_issue_dependencies": true\n    },\n    "has_wiki": true,\n    "has_pull_requests": true,\n    "has_projects": true,\n    "projects_mode": "all",\n    "has_releases": true,\n    "has_packages": true,\n    "has_actions": true,\n    "ignore_whitespace_conflicts": false,\n    "allow_merge_commits": true,\n    "allow_rebase": true,\n    "allow_rebase_explicit": true,\n    "allow_squash_merge": true,\n    "allow_fast_forward_only_merge": true,\n    "allow_rebase_update": true,\n    "allow_manual_merge": false,\n    "autodetect_manual_merge": false,\n    "default_delete_branch_after_merge": false,\n    "default_merge_style": "merge",\n    "default_allow_maintainer_edit": false,\n    "avatar_url": "",\n    "internal": false,\n    "mirror_interval": "",\n    "object_format_name": "sha1",\n    "mirror_updated": "0001-01-01T00:00:00Z",\n    "topics": [],\n    "licenses": []\n  },\n  "sender": {\n    "id": 1,\n    "login": "platform_admin",\n    "login_name": "",\n    "source_id": 0,\n    "full_name": "",\n    "email": "platform_admin@noreply.localhost",\n    "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n    "html_url": "http://127.0.0.1:54307/platform_admin",\n    "language": "",\n    "is_admin": false,\n    "last_login": "0001-01-01T00:00:00Z",\n    "created": "2026-04-17T14:46:14Z",\n    "restricted": false,\n    "active": false,\n    "prohibit_login": false,\n    "location": "",\n    "website": "",\n    "description": "",\n    "visibility": "public",\n    "followers_count": 0,\n    "following_count": 0,\n    "starred_repos_count": 0,\n    "username": "platform_admin"\n  }\n}	workflow_dispatch	5	1	0	0	0	1776437183	1776437183
30	ops(data): add backfill helper for business events	1	1	release.yml	10	1	0	refs/heads/main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f	0	workflow_dispatch	{\n  "workflow": "release.yml",\n  "ref": "main",\n  "inputs": {\n    "release_tag": "v1.0.0"\n  },\n  "repository": {\n    "id": 1,\n    "owner": {\n      "id": 1,\n      "login": "platform_admin",\n      "login_name": "",\n      "source_id": 0,\n      "full_name": "",\n      "email": "platform_admin@noreply.localhost",\n      "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n      "html_url": "http://127.0.0.1:54307/platform_admin",\n      "language": "",\n      "is_admin": false,\n      "last_login": "0001-01-01T00:00:00Z",\n      "created": "2026-04-17T14:46:14Z",\n      "restricted": false,\n      "active": false,\n      "prohibit_login": false,\n      "location": "",\n      "website": "",\n      "description": "",\n      "visibility": "public",\n      "followers_count": 0,\n      "following_count": 0,\n      "starred_repos_count": 0,\n      "username": "platform_admin"\n    },\n    "name": "mini-seed-repo",\n    "full_name": "platform_admin/mini-seed-repo",\n    "description": "Primary seed repository",\n    "empty": false,\n    "private": false,\n    "fork": false,\n    "template": false,\n    "mirror": false,\n    "size": 30,\n    "language": "",\n    "languages_url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo/languages",\n    "html_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo",\n    "url": "http://127.0.0.1:54307/api/v1/repos/platform_admin/mini-seed-repo",\n    "link": "",\n    "ssh_url": "git@localhost:platform_admin/mini-seed-repo.git",\n    "clone_url": "http://127.0.0.1:54307/platform_admin/mini-seed-repo.git",\n    "original_url": "",\n    "website": "",\n    "stars_count": 0,\n    "forks_count": 0,\n    "watchers_count": 1,\n    "open_issues_count": 3,\n    "open_pr_counter": 3,\n    "release_counter": 3,\n    "default_branch": "main",\n    "archived": false,\n    "created_at": "2026-04-17T14:46:16Z",\n    "updated_at": "2026-04-17T14:46:18Z",\n    "archived_at": "1970-01-01T00:00:00Z",\n    "permissions": {\n      "admin": false,\n      "push": false,\n      "pull": false\n    },\n    "has_code": true,\n    "has_issues": true,\n    "internal_tracker": {\n      "enable_time_tracker": true,\n      "allow_only_contributors_to_track_time": true,\n      "enable_issue_dependencies": true\n    },\n    "has_wiki": true,\n    "has_pull_requests": true,\n    "has_projects": true,\n    "projects_mode": "all",\n    "has_releases": true,\n    "has_packages": true,\n    "has_actions": true,\n    "ignore_whitespace_conflicts": false,\n    "allow_merge_commits": true,\n    "allow_rebase": true,\n    "allow_rebase_explicit": true,\n    "allow_squash_merge": true,\n    "allow_fast_forward_only_merge": true,\n    "allow_rebase_update": true,\n    "allow_manual_merge": false,\n    "autodetect_manual_merge": false,\n    "default_delete_branch_after_merge": false,\n    "default_merge_style": "merge",\n    "default_allow_maintainer_edit": false,\n    "avatar_url": "",\n    "internal": false,\n    "mirror_interval": "",\n    "object_format_name": "sha1",\n    "mirror_updated": "0001-01-01T00:00:00Z",\n    "topics": [],\n    "licenses": []\n  },\n  "sender": {\n    "id": 1,\n    "login": "platform_admin",\n    "login_name": "",\n    "source_id": 0,\n    "full_name": "",\n    "email": "platform_admin@noreply.localhost",\n    "avatar_url": "http://127.0.0.1:54307/avatars/5ae85542d5c363ae1cd2209ad29a0741",\n    "html_url": "http://127.0.0.1:54307/platform_admin",\n    "language": "",\n    "is_admin": false,\n    "last_login": "0001-01-01T00:00:00Z",\n    "created": "2026-04-17T14:46:14Z",\n    "restricted": false,\n    "active": false,\n    "prohibit_login": false,\n    "location": "",\n    "website": "",\n    "description": "",\n    "visibility": "public",\n    "followers_count": 0,\n    "following_count": 0,\n    "starred_repos_count": 0,\n    "username": "platform_admin"\n  }\n}	workflow_dispatch	5	1	0	0	0	1776437183	1776437183
\.


--
-- Data for Name: action_run_index; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_run_index (group_id, max_index) FROM stdin;
4	4
2	4
3	4
5	4
6	4
1	10
\.


--
-- Data for Name: action_run_job; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_run_job (id, run_id, repo_id, owner_id, commit_sha, is_fork_pull_request, name, attempt, workflow_payload, job_id, needs, runs_on, task_id, status, started, stopped, created, updated) FROM stdin;
1	1	1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
2	2	1	1	768815c98c25700a99cf64f76d1d1d6e280e538e	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
3	3	4	8	eb2773d81c81d42e43733cfed3cd538e7d253580	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
4	4	1	1	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
5	5	1	1	7af3ed18eda760df6738550bbf521c548af6e1c2	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
6	6	2	1	cea62bb561f9840850ae5540bae7b033b1f38666	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437178	1776437178
7	7	4	8	1e20b9bd9f045317178243cc3e37f97994ebe6d1	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
8	8	2	1	73823d66ed4041f4ad1b519744a14938c7d0b580	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
9	9	4	8	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
10	10	2	1	a71db34f967081dec5cb2a92ea6f661ed5028456	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
11	11	4	8	314f30aba83d532b0d95e7a2dbde510e4e89f0af	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
12	12	2	1	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
13	13	5	8	a0db46acc393664445afef2ea94fe3f89fb5058e	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
14	14	3	1	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
15	15	3	1	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
17	17	5	8	aee60e6cac1fb19025c9537869dda9ff587d32e4	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
19	19	5	8	65dcd79de237b319fc40f684c77dbc5a1a277e50	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
20	20	5	8	213daa64b907b6ab1e7c952aca8df04b350d0cce	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437180	1776437180
21	21	6	8	6fcd155b3cb493770d73395917a0472b706433c0	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437180	1776437180
23	23	6	8	b229287050e436012bc103d0242e77471e637422	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437180	1776437180
16	16	3	1	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
18	18	3	1	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437179	1776437179
22	22	6	8	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437180	1776437180
24	24	6	8	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437180	1776437180
25	25	1	1	768815c98c25700a99cf64f76d1d1d6e280e538e	f	lint	0	\\x6e616d653a206c696e740a226f6e223a0a2020202070756c6c5f726571756573743a0a6a6f62733a0a202020206c696e743a0a20202020202020206e616d653a206c696e740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a206c696e740a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c20727566660a202020202020202020202020202020207275666620636865636b207372632074657374730a	lint	null	["ubuntu-latest"]	0	5	0	0	1776437181	1776437181
26	26	1	1	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	lint	0	\\x6e616d653a206c696e740a226f6e223a0a2020202070756c6c5f726571756573743a0a6a6f62733a0a202020206c696e743a0a20202020202020206e616d653a206c696e740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a206c696e740a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c20727566660a202020202020202020202020202020207275666620636865636b207372632074657374730a	lint	null	["ubuntu-latest"]	0	5	0	0	1776437182	1776437182
27	27	1	1	7af3ed18eda760df6738550bbf521c548af6e1c2	f	lint	0	\\x6e616d653a206c696e740a226f6e223a0a2020202070756c6c5f726571756573743a0a6a6f62733a0a202020206c696e743a0a20202020202020206e616d653a206c696e740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a206c696e740a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c20727566660a202020202020202020202020202020207275666620636865636b207372632074657374730a	lint	null	["ubuntu-latest"]	0	5	0	0	1776437182	1776437182
28	28	1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	f	test	0	\\x6e616d653a2063690a226f6e223a0a20202020707573683a0a20202020202020206272616e636865733a205b6d61696e2c20666561747572652f6c6f67696e2c20666561747572652f7061796d656e74732c206669782f646f63735d0a6a6f62733a0a20202020746573743a0a20202020202020206e616d653a20746573740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a2072756e2074657374730a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c207079746573740a20202020202020202020202020202020707974657374202d710a	test	null	["ubuntu-latest"]	0	5	0	0	1776437183	1776437183
29	29	1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	f	lint	0	\\x6e616d653a206c696e740a226f6e223a0a2020202070756c6c5f726571756573743a0a6a6f62733a0a202020206c696e743a0a20202020202020206e616d653a206c696e740a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d20757365733a20616374696f6e732f636865636b6f75744076340a2020202020202020202020202d206e616d653a206c696e740a202020202020202020202020202072756e3a207c0a20202020202020202020202020202020707974686f6e202d6d2070697020696e7374616c6c202d2d75706772616465207069700a2020202020202020202020202020202070697020696e7374616c6c20727566660a202020202020202020202020202020207275666620636865636b207372632074657374730a	lint	null	["ubuntu-latest"]	0	5	0	0	1776437183	1776437183
30	30	1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	f	package	0	\\x6e616d653a2072656c656173650a226f6e223a0a20202020776f726b666c6f775f64697370617463683a0a2020202020202020696e707574733a0a20202020202020202020202072656c656173655f7461673a0a202020202020202020202020202020206465736372697074696f6e3a2072656c65617365207461670a2020202020202020202020202020202072657175697265643a2066616c73650a6a6f62733a0a202020207061636b6167653a0a20202020202020206e616d653a207061636b6167650a202020202020202072756e732d6f6e3a207562756e74752d6c61746573740a202020202020202073746570733a0a2020202020202020202020202d206e616d653a207061636b6167650a202020202020202020202020202072756e3a207c0a202020202020202020202020202020206563686f20225061636b6167696e6720247b47495445415f5245504f5349544f52593a2d736572766963657d20666f722072656c656173652074616720247b7b20696e707574732e72656c656173655f746167207d7d220a	package	null	["ubuntu-latest"]	0	5	0	0	1776437183	1776437183
\.


--
-- Data for Name: action_runner; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_runner (id, uuid, name, version, owner_id, repo_id, description, base, repo_range, token_hash, token_salt, last_online, last_active, agent_labels, ephemeral, created, updated, deleted) FROM stdin;
\.


--
-- Data for Name: action_runner_token; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_runner_token (id, token, owner_id, repo_id, is_active, created, updated, deleted) FROM stdin;
\.


--
-- Data for Name: action_schedule; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_schedule (id, title, specs, repo_id, owner_id, workflow_id, trigger_user_id, ref, commit_sha, event, event_payload, content, created, updated) FROM stdin;
\.


--
-- Data for Name: action_schedule_spec; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_schedule_spec (id, repo_id, schedule_id, next, prev, spec, created, updated) FROM stdin;
\.


--
-- Data for Name: action_task; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_task (id, job_id, attempt, runner_id, status, started, stopped, repo_id, owner_id, commit_sha, is_fork_pull_request, token_hash, token_salt, token_last_eight, log_filename, log_in_storage, log_length, log_size, log_indexes, log_expired, created, updated) FROM stdin;
\.


--
-- Data for Name: action_task_output; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_task_output (id, task_id, output_key, output_value) FROM stdin;
\.


--
-- Data for Name: action_task_step; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_task_step (id, name, task_id, index, repo_id, status, log_index, log_length, started, stopped, created, updated) FROM stdin;
\.


--
-- Data for Name: action_tasks_version; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_tasks_version (id, owner_id, repo_id, version, created_unix, updated_unix) FROM stdin;
5	0	4	4	1776437178	1776437178
6	0	2	4	1776437178	1776437178
8	0	3	4	1776437179	1776437179
7	0	5	4	1776437179	1776437179
4	8	0	12	1776437178	1776437178
9	0	6	4	1776437180	1776437180
1	0	0	30	1776437178	1776437178
2	1	0	18	1776437178	1776437178
3	0	1	10	1776437178	1776437178
\.


--
-- Data for Name: action_variable; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.action_variable (id, owner_id, repo_id, name, data, description, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: app_state; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.app_state (id, revision, content) FROM stdin;
runtime-state	0	{"last_app_path":"/usr/local/bin/gitea","last_custom_conf":"/data/gitea/conf/app.ini"}
\.


--
-- Data for Name: attachment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.attachment (id, uuid, repo_id, issue_id, release_id, uploader_id, comment_id, name, download_count, size, created_unix) FROM stdin;
\.


--
-- Data for Name: auth_token; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.auth_token (id, token_hash, user_id, expires_unix) FROM stdin;
\.


--
-- Data for Name: badge; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.badge (id, slug, description, image_url) FROM stdin;
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.branch (id, repo_id, name, commit_id, commit_message, pusher_id, is_deleted, deleted_by_id, deleted_unix, commit_time, created_unix, updated_unix) FROM stdin;
1	1	main	90fde9f399190d3f24566ec288718a4fafb2d48b	ops(data): add backfill helper for business events	1	f	0	0	1776437176	1776437176	1776437176
2	1	feature/login	768815c98c25700a99cf64f76d1d1d6e280e538e	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437176	1776437177	1776437177
3	1	feature/payments	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437176	1776437177	1776437177
4	1	fix/docs	7af3ed18eda760df6738550bbf521c548af6e1c2	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437176	1776437177	1776437177
5	2	main	cea62bb561f9840850ae5540bae7b033b1f38666	ops(data): add backfill helper for business events	1	f	0	0	1776437177	1776437177	1776437177
6	2	feature/login	73823d66ed4041f4ad1b519744a14938c7d0b580	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437177	1776437177	1776437177
7	2	feature/payments	a71db34f967081dec5cb2a92ea6f661ed5028456	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437177	1776437177	1776437177
8	2	fix/docs	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437177	1776437177	1776437177
9	3	main	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	ops(data): add backfill helper for business events	1	f	0	0	1776437177	1776437177	1776437177
10	3	feature/login	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437177	1776437178	1776437178
11	3	feature/payments	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437177	1776437178	1776437178
12	3	fix/docs	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437177	1776437178	1776437178
13	4	main	eb2773d81c81d42e43733cfed3cd538e7d253580	ops(data): add backfill helper for business events	1	f	0	0	1776437178	1776437178	1776437178
14	4	feature/login	1e20b9bd9f045317178243cc3e37f97994ebe6d1	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437178	1776437178	1776437178
15	4	feature/payments	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437178	1776437178	1776437178
16	4	fix/docs	314f30aba83d532b0d95e7a2dbde510e4e89f0af	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437178	1776437178	1776437178
17	5	main	a0db46acc393664445afef2ea94fe3f89fb5058e	ops(data): add backfill helper for business events	1	f	0	0	1776437178	1776437179	1776437179
18	5	feature/login	aee60e6cac1fb19025c9537869dda9ff587d32e4	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437178	1776437179	1776437179
19	5	feature/payments	65dcd79de237b319fc40f684c77dbc5a1a277e50	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437178	1776437179	1776437179
20	5	fix/docs	213daa64b907b6ab1e7c952aca8df04b350d0cce	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437178	1776437179	1776437179
21	6	main	6fcd155b3cb493770d73395917a0472b706433c0	ops(data): add backfill helper for business events	1	f	0	0	1776437179	1776437179	1776437179
22	6	feature/login	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	feat(auth): add guarded login flow with mfa checks	1	f	0	0	1776437179	1776437180	1776437180
23	6	feature/payments	b229287050e436012bc103d0242e77471e637422	feat(billing): introduce payment charge path with retries	1	f	0	0	1776437179	1776437180	1776437180
24	6	fix/docs	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	docs(qa): add release notes and sign-off checklist	1	f	0	0	1776437179	1776437180	1776437180
25	7	feature/login	768815c98c25700a99cf64f76d1d1d6e280e538e	feat(auth): add guarded login flow with mfa checks	2	f	0	0	1776437176	1776437183	1776437183
26	7	feature/payments	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	feat(billing): introduce payment charge path with retries	2	f	0	0	1776437176	1776437183	1776437183
27	7	fix/docs	7af3ed18eda760df6738550bbf521c548af6e1c2	docs(qa): add release notes and sign-off checklist	2	f	0	0	1776437176	1776437183	1776437183
28	7	main	90fde9f399190d3f24566ec288718a4fafb2d48b	ops(data): add backfill helper for business events	2	f	0	0	1776437176	1776437183	1776437183
\.


--
-- Data for Name: collaboration; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.collaboration (id, repo_id, user_id, mode, created_unix, updated_unix) FROM stdin;
1	1	2	2	1776437180	1776437180
2	1	3	2	1776437180	1776437180
3	1	4	2	1776437180	1776437180
4	1	6	3	1776437180	1776437180
5	1	7	2	1776437180	1776437180
6	4	2	2	1776437180	1776437180
7	4	3	2	1776437180	1776437180
8	4	4	1	1776437180	1776437180
9	4	5	3	1776437180	1776437180
10	4	6	2	1776437180	1776437180
11	4	7	2	1776437180	1776437180
12	5	2	2	1776437180	1776437180
13	5	3	2	1776437180	1776437180
14	5	4	1	1776437180	1776437180
15	5	5	3	1776437180	1776437180
16	5	6	2	1776437180	1776437180
17	5	7	2	1776437180	1776437180
18	6	2	2	1776437180	1776437180
19	6	3	2	1776437180	1776437180
20	6	4	1	1776437180	1776437180
21	6	5	3	1776437180	1776437180
22	6	6	2	1776437180	1776437180
23	6	7	2	1776437180	1776437180
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.comment (id, type, poster_id, original_author, original_author_id, issue_id, label_id, old_project_id, project_id, old_milestone_id, milestone_id, time_id, assignee_id, removed_assignee, assignee_team_id, resolve_doer_id, old_title, new_title, old_ref, new_ref, dependent_issue_id, commit_id, line, tree_path, content, content_version, patch, created_unix, updated_unix, commit_sha, review_id, invalidated, ref_repo_id, ref_issue_id, ref_comment_id, ref_action, ref_is_pull, comment_meta_data) FROM stdin;
1	9	1		0	1	0	0	0	0	0	0	2	f	0	0					0	0	0			0		1776437180	1776437180		0	f	0	0	0	0	f	\N
2	9	1		0	2	0	0	0	0	0	0	3	f	0	0					0	0	0			0		1776437180	1776437180		0	f	0	0	0	0	f	\N
3	9	1		0	3	0	0	0	0	0	0	4	f	0	0					0	0	0			0		1776437181	1776437181		0	f	0	0	0	0	f	\N
4	9	1		0	4	0	0	0	0	0	0	5	f	0	0					0	0	0			0		1776437181	1776437181		0	f	0	0	0	0	f	\N
5	0	3		0	1	0	0	0	0	0	0	0	f	0	0					0	0	0		I can reproduce this on macOS + Safari.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
6	0	2		0	2	0	0	0	0	0	0	0	f	0	0					0	0	0		Retry policy draft is ready for review.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
7	0	4		0	3	0	0	0	0	0	0	0	f	0	0					0	0	0		Please include screenshots for the setup docs.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
8	0	5		0	4	0	0	0	0	0	0	0	f	0	0					0	0	0		Rotation window scheduled for Friday 22:00 UTC.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
9	0	1		0	5	0	0	0	0	0	0	0	f	0	0					0	0	0		Will align this with v1 launch checklist.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
10	0	6		0	1	0	0	0	0	0	0	0	f	0	0					0	0	0		I will own the fix rollout and PR merge strategy.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
11	0	7		0	2	0	0	0	0	0	0	0	f	0	0					0	0	0		QA scenario matrix added for retry edge cases.	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
12	2	1		0	3	0	0	0	0	0	0	0	f	0	0					0	0	0			0		1776437181	1776437181		0	f	0	0	0	0	f	\N
13	2	1		0	4	0	0	0	0	0	0	0	f	0	0					0	0	0			0		1776437181	1776437181		0	f	0	0	0	0	f	\N
14	14	1		0	1	0	0	0	0	0	1	0	f	0	0					0	0	0		|1800	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
15	14	2		0	2	0	0	0	0	0	2	0	f	0	0					0	0	0		|3600	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
16	14	3		0	5	0	0	0	0	0	3	0	f	0	0					0	0	0		|2400	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
17	29	2		0	6	0	0	0	0	0	0	0	f	0	0					0	0	0		{"is_force_push":false,"commit_ids":["768815c98c25700a99cf64f76d1d1d6e280e538e"]}	0		1776437181	1776437181		0	f	0	0	0	0	f	\N
18	29	3		0	7	0	0	0	0	0	0	0	f	0	0					0	0	0		{"is_force_push":false,"commit_ids":["05a3cd50e905f4aebf20bf78acded039dfdaeaf6"]}	0		1776437182	1776437182		0	f	0	0	0	0	f	\N
19	29	1		0	8	0	0	0	0	0	0	0	f	0	0					0	0	0		{"is_force_push":false,"commit_ids":["7af3ed18eda760df6738550bbf521c548af6e1c2"]}	0		1776437182	1776437182		0	f	0	0	0	0	f	\N
20	22	3		0	6	0	0	0	0	0	0	0	f	0	0					0	0	0		Looks good overall.	0		1776437182	1776437182		1	f	0	0	0	0	f	\N
21	22	4		0	7	0	0	0	0	0	0	0	f	0	0					0	0	0		Please add edge-case tests.	0		1776437182	1776437182		2	f	0	0	0	0	f	\N
22	22	2		0	8	0	0	0	0	0	0	0	f	0	0					0	0	0		Docs update is clear.	0		1776437182	1776437182		3	f	0	0	0	0	f	\N
23	22	7		0	6	0	0	0	0	0	0	0	f	0	0					0	0	0		QA checks passed for login path.	0		1776437182	1776437182		4	f	0	0	0	0	f	\N
24	22	6		0	7	0	0	0	0	0	0	0	f	0	0					0	0	0		Engineering review complete, ready to merge.	0		1776437182	1776437182		5	f	0	0	0	0	f	\N
\.


--
-- Data for Name: commit_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.commit_status (id, index, repo_id, state, sha, target_url, description, context_hash, context, creator_id, created_unix, updated_unix) FROM stdin;
1	1	1	pending	90fde9f399190d3f24566ec288718a4fafb2d48b	/platform_admin/mini-seed-repo/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437178	1776437178
2	1	1	pending	768815c98c25700a99cf64f76d1d1d6e280e538e	/platform_admin/mini-seed-repo/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437178	1776437178
3	1	4	pending	eb2773d81c81d42e43733cfed3cd538e7d253580	/acme-platform/checkout-service/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437178	1776437178
4	1	1	pending	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	/platform_admin/mini-seed-repo/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437178	1776437178
5	1	1	pending	7af3ed18eda760df6738550bbf521c548af6e1c2	/platform_admin/mini-seed-repo/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437178	1776437178
6	1	2	pending	cea62bb561f9840850ae5540bae7b033b1f38666	/platform_admin/platform-api/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
7	1	4	pending	1e20b9bd9f045317178243cc3e37f97994ebe6d1	/acme-platform/checkout-service/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
8	1	2	pending	73823d66ed4041f4ad1b519744a14938c7d0b580	/platform_admin/platform-api/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
9	1	4	pending	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	/acme-platform/checkout-service/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
10	1	2	pending	a71db34f967081dec5cb2a92ea6f661ed5028456	/platform_admin/platform-api/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
11	1	4	pending	314f30aba83d532b0d95e7a2dbde510e4e89f0af	/acme-platform/checkout-service/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
12	1	2	pending	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	/platform_admin/platform-api/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
13	1	5	pending	a0db46acc393664445afef2ea94fe3f89fb5058e	/acme-platform/billing-service/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
14	1	3	pending	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	/platform_admin/infra-scripts/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
15	1	3	pending	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	/platform_admin/infra-scripts/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
16	1	3	pending	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	/platform_admin/infra-scripts/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
17	1	5	pending	aee60e6cac1fb19025c9537869dda9ff587d32e4	/acme-platform/billing-service/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
18	1	3	pending	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	/platform_admin/infra-scripts/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
19	1	5	pending	65dcd79de237b319fc40f684c77dbc5a1a277e50	/acme-platform/billing-service/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437179	1776437179
20	1	5	pending	213daa64b907b6ab1e7c952aca8df04b350d0cce	/acme-platform/billing-service/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437180	1776437180
21	1	6	pending	6fcd155b3cb493770d73395917a0472b706433c0	/acme-platform/mobile-app/actions/runs/1/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437180	1776437180
22	1	6	pending	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	/acme-platform/mobile-app/actions/runs/2/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437180	1776437180
23	1	6	pending	b229287050e436012bc103d0242e77471e637422	/acme-platform/mobile-app/actions/runs/3/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437180	1776437180
24	1	6	pending	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	/acme-platform/mobile-app/actions/runs/4/jobs/0	Waiting to run	ef81983caac4afb9d84f29526f6688b3f1b2e0a5	ci / test (push)	-2	1776437180	1776437180
25	2	1	pending	768815c98c25700a99cf64f76d1d1d6e280e538e	/platform_admin/mini-seed-repo/actions/runs/5/jobs/0	Waiting to run	3e4e70b0bdc6a93c32a0848d8ef147c307d35c7e	lint / lint (pull_request)	-2	1776437181	1776437181
26	2	1	pending	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	/platform_admin/mini-seed-repo/actions/runs/6/jobs/0	Waiting to run	3e4e70b0bdc6a93c32a0848d8ef147c307d35c7e	lint / lint (pull_request)	-2	1776437182	1776437182
27	2	1	pending	7af3ed18eda760df6738550bbf521c548af6e1c2	/platform_admin/mini-seed-repo/actions/runs/7/jobs/0	Waiting to run	3e4e70b0bdc6a93c32a0848d8ef147c307d35c7e	lint / lint (pull_request)	-2	1776437182	1776437182
\.


--
-- Data for Name: commit_status_index; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.commit_status_index (id, repo_id, sha, max_index) FROM stdin;
1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	1
3	4	eb2773d81c81d42e43733cfed3cd538e7d253580	1
6	2	cea62bb561f9840850ae5540bae7b033b1f38666	1
7	4	1e20b9bd9f045317178243cc3e37f97994ebe6d1	1
8	2	73823d66ed4041f4ad1b519744a14938c7d0b580	1
9	4	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	1
10	2	a71db34f967081dec5cb2a92ea6f661ed5028456	1
11	4	314f30aba83d532b0d95e7a2dbde510e4e89f0af	1
12	2	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	1
13	5	a0db46acc393664445afef2ea94fe3f89fb5058e	1
14	3	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	1
15	3	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	1
16	3	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	1
17	5	aee60e6cac1fb19025c9537869dda9ff587d32e4	1
18	3	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	1
19	5	65dcd79de237b319fc40f684c77dbc5a1a277e50	1
20	5	213daa64b907b6ab1e7c952aca8df04b350d0cce	1
21	6	6fcd155b3cb493770d73395917a0472b706433c0	1
22	6	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	1
23	6	b229287050e436012bc103d0242e77471e637422	1
24	6	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	1
2	1	768815c98c25700a99cf64f76d1d1d6e280e538e	2
4	1	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	2
5	1	7af3ed18eda760df6738550bbf521c548af6e1c2	2
\.


--
-- Data for Name: commit_status_summary; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.commit_status_summary (id, repo_id, sha, state, target_url) FROM stdin;
1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	pending	/platform_admin/mini-seed-repo/actions/runs/1/jobs/0
3	4	eb2773d81c81d42e43733cfed3cd538e7d253580	pending	/acme-platform/checkout-service/actions/runs/1/jobs/0
6	2	cea62bb561f9840850ae5540bae7b033b1f38666	pending	/platform_admin/platform-api/actions/runs/1/jobs/0
7	4	1e20b9bd9f045317178243cc3e37f97994ebe6d1	pending	/acme-platform/checkout-service/actions/runs/2/jobs/0
8	2	73823d66ed4041f4ad1b519744a14938c7d0b580	pending	/platform_admin/platform-api/actions/runs/2/jobs/0
9	4	cf9a3b4f81e1f3cc1716248439d35b1c3b5fd5d5	pending	/acme-platform/checkout-service/actions/runs/3/jobs/0
10	2	a71db34f967081dec5cb2a92ea6f661ed5028456	pending	/platform_admin/platform-api/actions/runs/3/jobs/0
11	4	314f30aba83d532b0d95e7a2dbde510e4e89f0af	pending	/acme-platform/checkout-service/actions/runs/4/jobs/0
12	2	d75fe51928cca8af29e2bf29d6acb49d472ba6ae	pending	/platform_admin/platform-api/actions/runs/4/jobs/0
13	5	a0db46acc393664445afef2ea94fe3f89fb5058e	pending	/acme-platform/billing-service/actions/runs/1/jobs/0
14	3	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	pending	/platform_admin/infra-scripts/actions/runs/1/jobs/0
15	3	77535b8e75344bc2f3c7e2dd28ec1c70e09415a4	pending	/platform_admin/infra-scripts/actions/runs/2/jobs/0
16	3	74d665004f9841e6456e1e6a4e0c71cd1f9c5717	pending	/platform_admin/infra-scripts/actions/runs/3/jobs/0
17	5	aee60e6cac1fb19025c9537869dda9ff587d32e4	pending	/acme-platform/billing-service/actions/runs/2/jobs/0
18	3	46c7ca2aea3adbc18f68bf4820c9be3a435afdd8	pending	/platform_admin/infra-scripts/actions/runs/4/jobs/0
19	5	65dcd79de237b319fc40f684c77dbc5a1a277e50	pending	/acme-platform/billing-service/actions/runs/3/jobs/0
20	5	213daa64b907b6ab1e7c952aca8df04b350d0cce	pending	/acme-platform/billing-service/actions/runs/4/jobs/0
21	6	6fcd155b3cb493770d73395917a0472b706433c0	pending	/acme-platform/mobile-app/actions/runs/1/jobs/0
22	6	b03ba7c658782ed7fe9340c3cb3e6b2c471ac8a6	pending	/acme-platform/mobile-app/actions/runs/2/jobs/0
23	6	b229287050e436012bc103d0242e77471e637422	pending	/acme-platform/mobile-app/actions/runs/3/jobs/0
24	6	1cf7dd1a97af7294b16c577a3f99ece633b87fbf	pending	/acme-platform/mobile-app/actions/runs/4/jobs/0
2	1	768815c98c25700a99cf64f76d1d1d6e280e538e	pending	/platform_admin/mini-seed-repo/actions/runs/5/jobs/0
4	1	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	pending	/platform_admin/mini-seed-repo/actions/runs/6/jobs/0
5	1	7af3ed18eda760df6738550bbf521c548af6e1c2	pending	/platform_admin/mini-seed-repo/actions/runs/7/jobs/0
\.


--
-- Data for Name: dbfs_data; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.dbfs_data (id, revision, meta_id, blob_offset, blob_size, blob_data) FROM stdin;
\.


--
-- Data for Name: dbfs_meta; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.dbfs_meta (id, full_path, block_size, file_size, create_timestamp, modify_timestamp) FROM stdin;
\.


--
-- Data for Name: deploy_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.deploy_key (id, key_id, repo_id, name, fingerprint, mode, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: email_address; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.email_address (id, uid, email, lower_email, is_activated, is_primary) FROM stdin;
1	1	platform.admin@techcorp.com	platform.admin@techcorp.com	t	t
2	2	dev_alice@example.com	dev_alice@example.com	t	t
3	3	dev_bob@example.com	dev_bob@example.com	t	t
4	4	qa_caro@example.com	qa_caro@example.com	t	t
5	5	ops_dan@example.com	ops_dan@example.com	t	t
6	6	ethan.walker@techcorp.com	ethan.walker@techcorp.com	t	t
7	7	mia.kim@techcorp.com	mia.kim@techcorp.com	t	t
\.


--
-- Data for Name: email_hash; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.email_hash (hash, email) FROM stdin;
\.


--
-- Data for Name: external_login_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.external_login_user (external_id, user_id, login_source_id, raw_data, provider, email, name, first_name, last_name, nick_name, description, avatar_url, location, access_token, access_token_secret, refresh_token, expires_at) FROM stdin;
\.


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.follow (id, user_id, follow_id, created_unix) FROM stdin;
\.


--
-- Data for Name: gpg_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.gpg_key (id, owner_id, key_id, primary_key_id, content, created_unix, expired_unix, added_unix, emails, verified, can_sign, can_encrypt_comms, can_encrypt_storage, can_certify) FROM stdin;
\.


--
-- Data for Name: gpg_key_import; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.gpg_key_import (key_id, content) FROM stdin;
\.


--
-- Data for Name: hook_task; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.hook_task (id, hook_id, uuid, payload_content, payload_version, event_type, is_delivered, delivered, is_succeed, request_content, response_content) FROM stdin;
\.


--
-- Data for Name: issue; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue (id, repo_id, index, poster_id, original_author, original_author_id, name, content, content_version, milestone_id, priority, is_closed, is_pull, num_comments, ref, deadline_unix, created_unix, updated_unix, closed_unix, is_locked, time_estimate) FROM stdin;
8	1	8	1		0	docs: benchmark notes	Adds benchmark notes	0	0	0	f	t	0		0	1776437182	1776437182	0	f	0
6	1	6	2		0	feat: login flow	Implements login module	0	0	0	f	t	0		0	1776437181	1776437182	0	f	0
7	1	7	3		0	feat: payment retries	Adds payment retries	0	0	0	f	t	0		0	1776437181	1776437182	0	f	0
3	1	3	1		0	Improve README setup	Add local setup instructions.	0	0	0	t	f	1		0	1776437181	1776437181	1776437181	f	0
4	1	4	1		0	Rotate deployment secrets	Monthly secret rotation.	0	0	0	t	f	1		0	1776437181	1776437181	1776437181	f	0
1	1	1	1		0	Login error on Safari	Users cannot login on Safari 17.	0	0	0	f	f	2		0	1776437180	1776437181	0	f	0
2	1	2	1		0	Add payment retries	Implement retry strategy for payment failures.	0	0	0	f	f	2		0	1776437180	1776437181	0	f	0
5	1	5	1		0	Document release process	Create release runbook.	0	0	0	f	f	1		0	1776437181	1776437181	0	f	0
\.


--
-- Data for Name: issue_assignees; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_assignees (id, assignee_id, issue_id) FROM stdin;
1	2	1
2	3	2
3	4	3
4	5	4
\.


--
-- Data for Name: issue_content_history; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_content_history (id, poster_id, issue_id, comment_id, edited_unix, content_text, is_first_created, is_deleted) FROM stdin;
\.


--
-- Data for Name: issue_dependency; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_dependency (id, user_id, issue_id, dependency_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: issue_index; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_index (group_id, max_index) FROM stdin;
1	8
\.


--
-- Data for Name: issue_label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_label (id, issue_id, label_id) FROM stdin;
\.


--
-- Data for Name: issue_pin; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_pin (id, repo_id, issue_id, is_pull, pin_order) FROM stdin;
\.


--
-- Data for Name: issue_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_user (id, uid, issue_id, is_read, is_mentioned) FROM stdin;
1	2	1	f	f
2	3	1	f	f
3	6	1	f	f
4	7	1	f	f
5	4	1	f	f
6	1	1	f	f
7	2	2	f	f
8	3	2	f	f
9	6	2	f	f
10	7	2	f	f
11	4	2	f	f
12	1	2	f	f
13	2	3	f	f
14	3	3	f	f
15	6	3	f	f
16	7	3	f	f
17	4	3	f	f
18	1	3	f	f
19	2	4	f	f
20	3	4	f	f
21	6	4	f	f
22	7	4	f	f
23	4	4	f	f
24	1	4	f	f
25	2	5	f	f
26	3	5	f	f
27	6	5	f	f
28	7	5	f	f
29	4	5	f	f
30	1	5	f	f
31	2	6	f	f
32	3	6	f	f
33	6	6	f	f
34	7	6	f	f
35	4	6	f	f
36	1	6	f	f
37	2	7	f	f
38	3	7	f	f
39	6	7	f	f
40	7	7	f	f
41	4	7	f	f
42	1	7	f	f
43	2	8	f	f
44	3	8	f	f
45	6	8	f	f
46	7	8	f	f
47	4	8	f	f
48	1	8	f	f
\.


--
-- Data for Name: issue_watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.issue_watch (id, user_id, issue_id, is_watching, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.label (id, repo_id, org_id, name, exclusive, exclusive_order, description, color, num_issues, num_closed_issues, created_unix, updated_unix, archived_unix) FROM stdin;
1	1	0	bug	f	0	Something is not working	#d73a4a	0	0	1776437180	1776437180	0
2	1	0	feature	f	0	New feature request	#0e8a16	0	0	1776437180	1776437180	0
3	1	0	docs	f	0	Documentation work	#0052cc	0	0	1776437180	1776437180	0
4	1	0	ops	f	0	Operations task	#5319e7	0	0	1776437180	1776437180	0
5	1	0	urgent	f	0	Needs immediate attention	#b60205	0	0	1776437180	1776437180	0
6	0	8	org-priority	f	0	Org level priority	#fbca04	0	0	1776437180	1776437180	0
7	0	8	org-risk	f	0	Org level risk	#c2e0c6	0	0	1776437180	1776437180	0
8	0	8	org-roadmap	f	0	Org roadmap	#1d76db	0	0	1776437180	1776437180	0
\.


--
-- Data for Name: language_stat; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.language_stat (id, repo_id, commit_id, is_primary, language, size, created_unix) FROM stdin;
1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	f	Shell	112	1776437180
2	1	90fde9f399190d3f24566ec288718a4fafb2d48b	t	Python	858	1776437180
3	4	eb2773d81c81d42e43733cfed3cd538e7d253580	t	Python	860	1776437180
4	4	eb2773d81c81d42e43733cfed3cd538e7d253580	f	Shell	112	1776437180
5	2	cea62bb561f9840850ae5540bae7b033b1f38666	f	Shell	112	1776437180
6	2	cea62bb561f9840850ae5540bae7b033b1f38666	t	Python	856	1776437180
7	5	a0db46acc393664445afef2ea94fe3f89fb5058e	f	Shell	112	1776437180
8	5	a0db46acc393664445afef2ea94fe3f89fb5058e	t	Python	859	1776437180
9	3	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	f	Shell	112	1776437180
10	3	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	t	Python	857	1776437180
11	6	6fcd155b3cb493770d73395917a0472b706433c0	t	Python	854	1776437180
12	6	6fcd155b3cb493770d73395917a0472b706433c0	f	Shell	112	1776437180
13	7	90fde9f399190d3f24566ec288718a4fafb2d48b	t	Python	858	1776437183
14	7	90fde9f399190d3f24566ec288718a4fafb2d48b	f	Shell	112	1776437183
\.


--
-- Data for Name: lfs_lock; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_lock (id, repo_id, owner_id, path, created) FROM stdin;
\.


--
-- Data for Name: lfs_meta_object; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.lfs_meta_object (id, oid, size, repository_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: login_source; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.login_source (id, type, name, is_active, is_sync_enabled, two_factor_policy, cfg, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: milestone; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.milestone (id, repo_id, name, content, is_closed, num_issues, num_closed_issues, completeness, created_unix, updated_unix, deadline_unix, closed_date_unix) FROM stdin;
1	1	Sprint 1	First sprint	f	0	0	0	1776437180	1776437180	0	0
2	1	Sprint 2	Second sprint	f	0	0	0	1776437180	1776437180	0	0
3	1	v1 Launch	Launch milestone	f	0	0	0	1776437180	1776437180	0	0
\.


--
-- Data for Name: mirror; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.mirror (id, repo_id, "interval", enable_prune, updated_unix, next_update_unix, lfs_enabled, lfs_endpoint, remote_address) FROM stdin;
\.


--
-- Data for Name: notice; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notice (id, type, description, created_unix) FROM stdin;
\.


--
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.notification (id, user_id, repo_id, status, source, issue_id, commit_id, comment_id, updated_by, created_unix, updated_unix) FROM stdin;
1	2	1	1	1	1		1	1	1776437181	1776437181
4	3	1	1	1	2		2	1	1776437181	1776437181
3	6	1	1	1	1		0	1	1776437181	1776437181
5	7	1	1	1	2		0	1	1776437181	1776437181
11	1	1	1	1	3		7	4	1776437181	1776437181
12	1	1	1	1	4		8	5	1776437181	1776437181
9	1	1	1	1	1		5	3	1776437181	1776437181
2	3	1	1	1	1		0	1	1776437181	1776437181
6	2	1	1	1	2		0	1	1776437181	1776437181
10	1	1	1	1	2		6	2	1776437181	1776437181
7	4	1	1	1	3		3	1	1776437181	1776437181
8	5	1	1	1	4		4	1	1776437181	1776437181
17	1	1	1	2	8		22	2	1776437182	1776437182
15	2	1	1	2	6		20	3	1776437182	1776437182
13	1	1	1	2	6		0	2	1776437181	1776437182
18	3	1	1	2	6		23	7	1776437182	1776437182
19	4	1	1	2	7		24	6	1776437182	1776437182
16	3	1	1	2	7		21	4	1776437182	1776437182
14	1	1	1	2	7		0	3	1776437182	1776437182
\.


--
-- Data for Name: oauth2_application; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_application (id, uid, name, client_id, client_secret, confidential_client, skip_secondary_authorization, redirect_uris, created_unix, updated_unix) FROM stdin;
1	0	git-credential-oauth	a4792ccc-144e-407e-86c9-5e7d8d9c3269		f	f	["http://127.0.0.1","https://127.0.0.1"]	1776437173	1776437173
2	0	Git Credential Manager	e90ee53c-94e2-48ac-9358-a874fb9e0662		f	f	["http://127.0.0.1","https://127.0.0.1"]	1776437173	1776437173
3	0	tea	d57cb8c4-630c-4168-8324-ec79935e18d4		f	f	["http://127.0.0.1","https://127.0.0.1"]	1776437173	1776437173
\.


--
-- Data for Name: oauth2_authorization_code; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_authorization_code (id, grant_id, code, code_challenge, code_challenge_method, redirect_uri, valid_until) FROM stdin;
\.


--
-- Data for Name: oauth2_grant; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.oauth2_grant (id, user_id, application_id, counter, scope, nonce, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: org_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.org_user (id, uid, org_id, is_public) FROM stdin;
1	1	8	f
2	1	9	f
3	1	10	f
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package (id, owner_id, repo_id, type, name, lower_name, semver_compatible, is_internal) FROM stdin;
\.


--
-- Data for Name: package_blob; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_blob (id, size, hash_md5, hash_sha1, hash_sha256, hash_sha512, created_unix) FROM stdin;
\.


--
-- Data for Name: package_blob_upload; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_blob_upload (id, bytes_received, hash_state_bytes, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: package_cleanup_rule; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_cleanup_rule (id, enabled, owner_id, type, keep_count, keep_pattern, remove_days, remove_pattern, match_full_name, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: package_file; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_file (id, version_id, blob_id, name, lower_name, composite_key, is_lead, created_unix) FROM stdin;
\.


--
-- Data for Name: package_property; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_property (id, ref_type, ref_id, name, value) FROM stdin;
\.


--
-- Data for Name: package_version; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.package_version (id, package_id, creator_id, version, lower_version, created_unix, is_internal, metadata_json, download_count) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.project (id, title, description, owner_id, repo_id, creator_id, is_closed, board_type, card_type, type, created_unix, updated_unix, closed_date_unix) FROM stdin;
\.


--
-- Data for Name: project_board; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.project_board (id, title, "default", sorting, color, project_id, creator_id, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: project_issue; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.project_issue (id, issue_id, project_id, project_board_id, sorting) FROM stdin;
\.


--
-- Data for Name: protected_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.protected_branch (id, repo_id, branch_name, priority, can_push, enable_whitelist, whitelist_user_i_ds, whitelist_team_i_ds, enable_merge_whitelist, whitelist_deploy_keys, merge_whitelist_user_i_ds, merge_whitelist_team_i_ds, can_force_push, enable_force_push_allowlist, force_push_allowlist_user_i_ds, force_push_allowlist_team_i_ds, force_push_allowlist_deploy_keys, enable_status_check, status_check_contexts, enable_approvals_whitelist, approvals_whitelist_user_i_ds, approvals_whitelist_team_i_ds, required_approvals, block_on_rejected_reviews, block_on_official_review_requests, block_on_outdated_branch, dismiss_stale_approvals, ignore_stale_approvals, require_signed_commits, protected_file_patterns, unprotected_file_patterns, block_admin_merge_override, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: protected_tag; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.protected_tag (id, repo_id, name_pattern, allowlist_user_i_ds, allowlist_team_i_ds, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: public_key; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.public_key (id, owner_id, name, fingerprint, content, mode, type, login_source_id, created_unix, updated_unix, verified) FROM stdin;
\.


--
-- Data for Name: pull_auto_merge; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.pull_auto_merge (id, pull_id, doer_id, merge_style, message, delete_branch_after_merge, created_unix) FROM stdin;
\.


--
-- Data for Name: pull_request; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.pull_request (id, type, status, conflicted_files, commits_ahead, commits_behind, changed_protected_files, issue_id, index, head_repo_id, base_repo_id, head_branch, base_branch, merge_base, allow_maintainer_edit, has_merged, merged_commit_id, merger_id, merged_unix, flow) FROM stdin;
1	0	2	null	1	0	null	6	6	1	1	feature/login	main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f		0	1776437181	0
2	0	2	null	1	0	null	7	7	1	1	feature/payments	main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f		0	1776437181	0
3	0	2	null	1	0	null	8	8	1	1	fix/docs	main	90fde9f399190d3f24566ec288718a4fafb2d48b	f	f		0	1776437182	0
\.


--
-- Data for Name: push_mirror; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.push_mirror (id, repo_id, remote_name, remote_address, sync_on_commit, "interval", created_unix, last_update, last_error) FROM stdin;
\.


--
-- Data for Name: reaction; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.reaction (id, type, issue_id, comment_id, user_id, original_author_id, original_author, created_unix) FROM stdin;
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.release (id, repo_id, publisher_id, tag_name, original_author, original_author_id, lower_tag_name, target, title, sha1, num_commits, note, is_draft, is_prerelease, is_tag, created_unix) FROM stdin;
1	1	1	v0.1.0		0	v0.1.0	main	v0.1.0	90fde9f399190d3f24566ec288718a4fafb2d48b	3	Initial preview release	f	t	f	1776437182
2	1	1	v0.2.0		0	v0.2.0	main	v0.2.0	90fde9f399190d3f24566ec288718a4fafb2d48b	3	Beta release	f	t	f	1776437182
3	1	1	v1.0.0		0	v1.0.0	main	v1.0.0	90fde9f399190d3f24566ec288718a4fafb2d48b	3	General availability	f	f	f	1776437182
4	7	0	v0.1.0		0	v0.1.0			90fde9f399190d3f24566ec288718a4fafb2d48b	-1		f	f	t	1776437182
5	7	0	v0.2.0		0	v0.2.0			90fde9f399190d3f24566ec288718a4fafb2d48b	-1		f	f	t	1776437182
6	7	0	v1.0.0		0	v1.0.0			90fde9f399190d3f24566ec288718a4fafb2d48b	-1		f	f	t	1776437182
\.


--
-- Data for Name: renamed_branch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.renamed_branch (id, repo_id, "from", "to", created_unix) FROM stdin;
\.


--
-- Data for Name: repo_archiver; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_archiver (id, repo_id, type, status, commit_id, created_unix) FROM stdin;
\.


--
-- Data for Name: repo_indexer_status; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_indexer_status (id, repo_id, commit_sha, indexer_type) FROM stdin;
1	1	90fde9f399190d3f24566ec288718a4fafb2d48b	1
2	4	eb2773d81c81d42e43733cfed3cd538e7d253580	1
3	2	cea62bb561f9840850ae5540bae7b033b1f38666	1
4	5	a0db46acc393664445afef2ea94fe3f89fb5058e	1
5	3	5ce14880d2c5a2d500cf5af8cd583c89ce74a1d7	1
6	6	6fcd155b3cb493770d73395917a0472b706433c0	1
7	7	90fde9f399190d3f24566ec288718a4fafb2d48b	1
\.


--
-- Data for Name: repo_license; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_license (id, repo_id, commit_id, license, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: repo_redirect; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_redirect (id, owner_id, lower_name, redirect_repo_id) FROM stdin;
\.


--
-- Data for Name: repo_topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_topic (repo_id, topic_id) FROM stdin;
\.


--
-- Data for Name: repo_transfer; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_transfer (id, doer_id, recipient_id, repo_id, team_i_ds, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: repo_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repo_unit (id, repo_id, type, config, created_unix, anonymous_access_mode, everyone_access_mode) FROM stdin;
1	1	1	\N	1776437176	0	0
2	1	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
3	1	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
4	1	4	\N	1776437176	0	0
5	1	5	\N	1776437176	0	0
6	1	8	{"ProjectsMode":"all"}	1776437176	0	0
7	1	9	\N	1776437176	0	0
8	1	10	\N	1776437176	0	0
9	2	1	\N	1776437176	0	0
10	2	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
11	2	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
12	2	4	\N	1776437176	0	0
13	2	5	\N	1776437176	0	0
14	2	8	{"ProjectsMode":"all"}	1776437176	0	0
15	2	9	\N	1776437176	0	0
16	2	10	\N	1776437176	0	0
17	3	1	\N	1776437176	0	0
18	3	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
19	3	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
20	3	4	\N	1776437176	0	0
21	3	5	\N	1776437176	0	0
22	3	8	{"ProjectsMode":"all"}	1776437176	0	0
23	3	9	\N	1776437176	0	0
24	3	10	\N	1776437176	0	0
25	4	1	\N	1776437176	0	0
26	4	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
27	4	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
28	4	4	\N	1776437176	0	0
29	4	5	\N	1776437176	0	0
30	4	8	{"ProjectsMode":"all"}	1776437176	0	0
31	4	9	\N	1776437176	0	0
32	4	10	\N	1776437176	0	0
33	5	1	\N	1776437176	0	0
34	5	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
35	5	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
36	5	4	\N	1776437176	0	0
37	5	5	\N	1776437176	0	0
38	5	8	{"ProjectsMode":"all"}	1776437176	0	0
39	5	9	\N	1776437176	0	0
40	5	10	\N	1776437176	0	0
41	6	1	\N	1776437176	0	0
42	6	2	{"EnableTimetracker":true,"AllowOnlyContributorsToTrackTime":true,"EnableDependencies":true}	1776437176	0	0
43	6	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437176	0	0
44	6	4	\N	1776437176	0	0
45	6	5	\N	1776437176	0	0
46	6	8	{"ProjectsMode":"all"}	1776437176	0	0
47	6	9	\N	1776437176	0	0
48	6	10	\N	1776437176	0	0
49	7	1	\N	1776437183	0	0
50	7	3	{"IgnoreWhitespaceConflicts":false,"AllowMerge":true,"AllowRebase":true,"AllowRebaseMerge":true,"AllowSquash":true,"AllowFastForwardOnly":true,"AllowManualMerge":false,"AutodetectManualMerge":false,"AllowRebaseUpdate":true,"DefaultDeleteBranchAfterMerge":false,"DefaultMergeStyle":"merge","DefaultAllowMaintainerEdit":false}	1776437183	0	0
\.


--
-- Data for Name: repository; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.repository (id, owner_id, owner_name, lower_name, name, description, website, original_service_type, original_url, default_branch, default_wiki_branch, num_watches, num_stars, num_forks, num_issues, num_closed_issues, num_pulls, num_closed_pulls, num_milestones, num_closed_milestones, num_projects, num_closed_projects, num_action_runs, num_closed_action_runs, is_private, is_empty, is_archived, is_mirror, status, is_fork, fork_id, is_template, template_id, size, git_size, lfs_size, is_fsck_enabled, close_issues_via_commit_in_any_branch, topics, object_format_name, trust_model, avatar, created_unix, updated_unix, archived_unix) FROM stdin;
1	1	platform_admin	mini-seed-repo	mini-seed-repo	Primary seed repository		0		main	main	1	0	1	5	2	3	0	3	0	0	0	10	0	f	f	f	f	0	f	0	f	0	31738	31738	0	t	f	null	sha1	0		1776437176	1776437178	0
7	2	dev_alice	mini-seed-repo-fork	mini-seed-repo-fork	Primary seed repository		0		main		1	0	0	0	0	0	0	0	0	0	0	0	0	f	f	f	f	0	t	1	f	0	32496	32496	0	f	f	null	sha1	0		1776437183	1776437183	0
3	1	platform_admin	infra-scripts	infra-scripts	Infrastructure scripts repo		0		main	main	1	0	0	0	0	0	0	0	0	0	0	4	0	t	f	f	f	0	f	0	f	0	31731	31731	0	t	f	null	sha1	0		1776437176	1776437179	0
5	8	acme-platform	billing-service	billing-service	Billing service repository		0		main	main	1	0	0	0	0	0	0	0	0	0	0	4	0	f	f	f	f	0	f	0	f	0	31695	31695	0	t	f	null	sha1	0		1776437176	1776437180	0
4	8	acme-platform	checkout-service	checkout-service	Checkout service repository		0		main	main	1	0	0	0	0	0	0	0	0	0	0	4	0	f	f	f	f	0	f	0	f	0	31717	31717	0	t	f	null	sha1	0		1776437176	1776437179	0
2	1	platform_admin	platform-api	platform-api	Personal platform api repo		0		main	main	1	0	0	0	0	0	0	0	0	0	0	4	0	f	f	f	f	0	f	0	f	0	31686	31686	0	t	f	null	sha1	0		1776437176	1776437179	0
6	8	acme-platform	mobile-app	mobile-app	Mobile app repository		0		main	main	1	0	0	0	0	0	0	0	0	0	0	4	0	f	f	f	f	0	f	0	f	0	31700	31700	0	t	f	null	sha1	0		1776437176	1776437180	0
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.review (id, type, reviewer_id, reviewer_team_id, original_author, original_author_id, issue_id, content, official, commit_id, stale, dismissed, created_unix, updated_unix) FROM stdin;
1	1	3	0		0	6	Looks good overall.	t	768815c98c25700a99cf64f76d1d1d6e280e538e	f	f	1776437182	1776437182
2	2	4	0		0	7	Please add edge-case tests.	f	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	f	1776437182	1776437182
3	1	2	0		0	8	Docs update is clear.	t	7af3ed18eda760df6738550bbf521c548af6e1c2	f	f	1776437182	1776437182
4	1	7	0		0	6	QA checks passed for login path.	t	768815c98c25700a99cf64f76d1d1d6e280e538e	f	f	1776437182	1776437182
5	1	6	0		0	7	Engineering review complete, ready to merge.	t	05a3cd50e905f4aebf20bf78acded039dfdaeaf6	f	f	1776437182	1776437182
\.


--
-- Data for Name: review_state; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.review_state (id, user_id, pull_id, commit_sha, updated_files, updated_unix) FROM stdin;
\.


--
-- Data for Name: secret; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.secret (id, owner_id, repo_id, name, data, description, created_unix) FROM stdin;
1	0	1	SEED_TOKEN	5b8929e72eb61181478c3029c2edc00c424654dbefad74447ac27d9957d682882568a5a36dc9418c		1776437183
2	0	1	SEED_API_KEY	c99dc20ebde470bd3e896e0b2ef7067b3f1b3dba2198e5775e2560d1b5e862d0		1776437183
3	0	1	SEED_WEBHOOK	ddd95b42d9a498c5c35223bc57e3ca568f89a7c533b39277acec84961f75fc99247bbf7baad3ff33		1776437183
4	8	0	ORG_SEED_TOKEN	27522c5d1a05c3d84635bf5738d0dc7bf96293b4569b0273c472013c11df075f82a60276		1776437183
5	8	0	ORG_SEED_CERT	69651b8dac3642b424e229fcaafd8541b47ebb3f05cb8fb8c80b19bd34c47ee795ab016d		1776437183
6	8	0	ORG_SEED_ENDPOINT	b1108f3889a36a733937779a1c68f76d6fc6b944eacd603eaa33d79f248e3f582367203ca917a2c7		1776437183
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.session (key, data, expiry) FROM stdin;
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.star (id, uid, repo_id, created_unix) FROM stdin;
\.


--
-- Data for Name: stopwatch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.stopwatch (id, issue_id, user_id, created_unix) FROM stdin;
\.


--
-- Data for Name: system_setting; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.system_setting (id, setting_key, setting_value, version, created, updated) FROM stdin;
1	revision		1	1776437176	1776437176
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.task (id, doer_id, owner_id, repo_id, type, status, start_time, end_time, payload_content, message, created) FROM stdin;
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team (id, org_id, lower_name, name, description, authorize, num_repos, num_members, includes_all_repositories, can_create_org_repo) FROM stdin;
2	9	owners	Owners		4	0	1	t	t
3	10	owners	Owners		4	0	1	t	t
1	8	owners	Owners		4	3	1	t	t
\.


--
-- Data for Name: team_invite; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_invite (id, token, inviter_id, org_id, team_id, email, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: team_repo; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_repo (id, org_id, team_id, repo_id) FROM stdin;
1	8	1	4
2	8	1	5
3	8	1	6
\.


--
-- Data for Name: team_unit; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_unit (id, org_id, team_id, type, access_mode) FROM stdin;
1	8	1	1	4
2	8	1	2	4
3	8	1	3	4
4	8	1	4	4
5	8	1	5	4
6	8	1	6	1
7	8	1	7	1
8	8	1	8	4
9	8	1	9	4
10	8	1	10	4
11	9	2	1	4
12	9	2	2	4
13	9	2	3	4
14	9	2	4	4
15	9	2	5	4
16	9	2	6	1
17	9	2	7	1
18	9	2	8	4
19	9	2	9	4
20	9	2	10	4
21	10	3	1	4
22	10	3	2	4
23	10	3	3	4
24	10	3	4	4
25	10	3	5	4
26	10	3	6	1
27	10	3	7	1
28	10	3	8	4
29	10	3	9	4
30	10	3	10	4
\.


--
-- Data for Name: team_user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.team_user (id, org_id, team_id, uid) FROM stdin;
1	8	1	1
2	9	2	1
3	10	3	1
\.


--
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.topic (id, name, repo_count, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: tracked_time; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.tracked_time (id, issue_id, user_id, created_unix, "time", deleted) FROM stdin;
1	1	1	1776437181	1800	f
2	2	2	1776437181	3600	f
3	5	3	1776437181	2400	f
\.


--
-- Data for Name: two_factor; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.two_factor (id, uid, secret, scratch_salt, scratch_hash, last_used_passcode, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: upload; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.upload (id, uuid, name) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public."user" (id, lower_name, name, full_name, email, keep_email_private, email_notifications_preference, passwd, passwd_hash_algo, must_change_password, login_type, login_source, login_name, type, location, website, rands, salt, language, description, created_unix, updated_unix, last_login_unix, last_repo_visibility, max_repo_creation, is_active, is_admin, is_restricted, allow_git_hook, allow_import_local, allow_create_organization, prohibit_login, avatar, avatar_email, use_custom_avatar, num_followers, num_following, num_stars, num_repos, num_teams, num_members, visibility, repo_admin_change_team_access, diff_view_style, theme, keep_activity_private) FROM stdin;
4	qa_caro	qa_caro		qa_caro@example.com	f	enabled	1b720e07c15b4bfdf540dd2639612f9c5c36c38aece08a50032577357d4f878c3611152cef2d0bebdab6a7a194a0775533ac	pbkdf2$50000$50	f	0	0		0			816e8fabfb5918408f0079c8926a7d47	026af525481d75030e0950ceba9db8db			1776437174	1776437181	0	f	-1	t	f	f	f	f	t	f	c58916c3d4db4f90792f59fd6a7e5337	qa_caro@example.com	f	0	0	0	0	0	0	0	f		gitea-auto	f
9	acme-data	acme-data	Acme Data		f				f	0	0		1			2cabdd08147e2fd5c79bf36de1867d80	bc0b66f149adde214409e5c7b1c6e608		Data engineering org	1776437176	1776437176	0	f	-1	t	f	f	f	f	f	f	0c824d08e0ec50760de3d20e3b3aa76a		t	0	0	0	0	1	1	0	f			f
10	acme-mobile	acme-mobile	Acme Mobile		f				f	0	0		1			967f8be5f82ec720000e2d0a6701176c	14d63148a26ccdf85db45a3491148de0		Mobile engineering org	1776437176	1776437176	0	f	-1	t	f	f	f	f	f	f	83172b4d7f55de8f8e2d8a38f8e158c3		t	0	0	0	0	1	1	0	f			f
1	platform_admin	platform_admin		platform.admin@techcorp.com	f	enabled	e670665cce9a906371013a6e4166b25456dd8da6d51ffc3554d209c3d45c9c17083f88612421b4682cef5f7fa8047376f416	pbkdf2$50000$50	f	0	0		0			a44ab0707826893bdbdbadfb75ed3c0f	61a4e118009b7f8bdeda0497d463f91a			1776437174	1776437176	0	t	-1	t	f	f	f	f	t	f	5ae85542d5c363ae1cd2209ad29a0741	platform.admin@techcorp.com	f	0	0	0	3	0	0	0	f		gitea-auto	f
5	ops_dan	ops_dan		ops_dan@example.com	f	enabled	9d39b9ff545753609fb9f2eef5ff36faaf643cfc58cd9a88cd1fd93df97831cb3d112b35fcd28b70124ede350e8871db03a6	pbkdf2$50000$50	f	0	0		0			b5f7134f76f02021b25a68fecc43a3f8	a124537f973c4335f5c2d934b20d5c66			1776437174	1776437181	0	f	-1	t	f	f	f	f	t	f	c3676d458efdd609b6d95d32f712fa6d	ops_dan@example.com	f	0	0	0	0	0	0	0	f		gitea-auto	f
6	ethan.walker	ethan.walker		ethan.walker@techcorp.com	f	enabled	236e5e1958ba3e7bd00d9ef14973c1792b08e8525fe6a26b84fb6be5fc8883a56fb332cf310b5a48d910614cd7cdf9940c0c	pbkdf2$50000$50	f	0	0		0			836ad1458884da527709cc83e4d76b9d	6f01106e640060cab7cf73ae5eb9c4e5			1776437174	1776437181	0	f	-1	t	f	f	f	f	t	f	815f5a1f17178c63f0e5de27b9489672	ethan.walker@techcorp.com	f	0	0	0	0	0	0	0	f		gitea-auto	f
7	mia.kim	mia.kim		mia.kim@techcorp.com	f	enabled	b229634a12a1e11a32d3d39f649f8f4ffdf4570f4329d969b9400dd1c93d9246eae47098954ee40aff50fbb75677972ac1e4	pbkdf2$50000$50	f	0	0		0			3dc2b46e9ea3f6dc4c11e3800a9931d7	f80c76908666622a082dd20883f06d8e			1776437175	1776437181	0	f	-1	t	f	f	f	f	t	f	790f45249cbd797851c7c9581e7b413c	mia.kim@techcorp.com	f	0	0	0	0	0	0	0	f		gitea-auto	f
2	dev_alice	dev_alice		dev_alice@example.com	f	enabled	2010454db23eacd572376993468fa29c961eac5b18571c60c705e830017dda1fe3b7dadfa629b4bd4b32b182caa0edc4de6c	pbkdf2$50000$50	f	0	0		0			fd42be8669167d46fa71b89389ea9e08	428f0dd0cde75919d59a11698675e429			1776437174	1776437183	0	f	-1	t	f	f	f	f	t	f	00297b11bfd9b6ff690806b32bcf882f	dev_alice@example.com	f	0	0	0	1	0	0	0	f		gitea-auto	f
8	acme-platform	acme-platform	Acme Platform		f				f	0	0		1			ae7c8fead0148644d30cfac0b97c876b	514bf4d9fb0e69527ea2224d370c2847		Platform engineering org	1776437176	1776437176	0	f	-1	t	f	f	f	f	f	f	fa5a4105fbd4e59483b803d9b79af636		t	0	0	0	3	1	1	0	f			f
3	dev_bob	dev_bob		dev_bob@example.com	f	enabled	41867f834a747742599e8628e25934217263b582d81a4d11c15d8a13aa26daf97c75ca35c0f8931f10ab347d985f939072d4	pbkdf2$50000$50	f	0	0		0			7997684de6830b6549a0f1c7d5bccfdd	e829d46d967616bf430331232cfca5aa			1776437174	1776437180	0	f	-1	t	f	f	f	f	t	f	3c4bb300edfa887cc83a3bd6207f933e	dev_bob@example.com	f	0	0	0	0	0	0	0	f		gitea-auto	f
\.


--
-- Data for Name: user_badge; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_badge (id, badge_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_blocking; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_blocking (id, blocker_id, blockee_id, note, created_unix) FROM stdin;
\.


--
-- Data for Name: user_open_id; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_open_id (id, uid, uri, show) FROM stdin;
\.


--
-- Data for Name: user_redirect; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_redirect (id, lower_name, redirect_user_id) FROM stdin;
\.


--
-- Data for Name: user_setting; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.user_setting (id, user_id, setting_key, setting_value) FROM stdin;
\.


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.version (id, version) FROM stdin;
1	323
\.


--
-- Data for Name: watch; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.watch (id, user_id, repo_id, mode, created_unix, updated_unix) FROM stdin;
1	1	1	1	1776437176	1776437176
2	1	2	1	1776437176	1776437176
3	1	3	1	1776437176	1776437176
4	1	4	1	1776437176	1776437176
5	1	5	1	1776437176	1776437176
6	1	6	1	1776437176	1776437176
7	2	7	1	1776437183	1776437183
\.


--
-- Data for Name: webauthn_credential; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.webauthn_credential (id, name, lower_name, user_id, credential_id, public_key, attestation_type, aaguid, sign_count, clone_warning, created_unix, updated_unix) FROM stdin;
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: gitea
--

COPY public.webhook (id, repo_id, owner_id, is_system_webhook, url, http_method, content_type, secret, events, is_active, type, meta, last_status, header_authorization_encrypted, created_unix, updated_unix) FROM stdin;
\.


--
-- Name: access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_id_seq', 23, true);


--
-- Name: access_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.access_token_id_seq', 7, true);


--
-- Name: action_artifact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_artifact_id_seq', 1, false);


--
-- Name: action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_id_seq', 123, true);


--
-- Name: action_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_run_id_seq', 30, true);


--
-- Name: action_run_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_run_job_id_seq', 30, true);


--
-- Name: action_runner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_runner_id_seq', 1, false);


--
-- Name: action_runner_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_runner_token_id_seq', 1, false);


--
-- Name: action_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_schedule_id_seq', 1, false);


--
-- Name: action_schedule_spec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_schedule_spec_id_seq', 1, false);


--
-- Name: action_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_task_id_seq', 1, false);


--
-- Name: action_task_output_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_task_output_id_seq', 1, false);


--
-- Name: action_task_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_task_step_id_seq', 1, false);


--
-- Name: action_tasks_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_tasks_version_id_seq', 9, true);


--
-- Name: action_variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.action_variable_id_seq', 1, false);


--
-- Name: attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.attachment_id_seq', 1, false);


--
-- Name: badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.badge_id_seq', 1, false);


--
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.branch_id_seq', 28, true);


--
-- Name: collaboration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.collaboration_id_seq', 23, true);


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.comment_id_seq', 24, true);


--
-- Name: commit_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.commit_status_id_seq', 27, true);


--
-- Name: commit_status_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.commit_status_index_id_seq', 27, true);


--
-- Name: commit_status_summary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.commit_status_summary_id_seq', 24, true);


--
-- Name: dbfs_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.dbfs_data_id_seq', 1, false);


--
-- Name: dbfs_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.dbfs_meta_id_seq', 1, false);


--
-- Name: deploy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.deploy_key_id_seq', 1, false);


--
-- Name: email_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.email_address_id_seq', 7, true);


--
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.follow_id_seq', 1, false);


--
-- Name: gpg_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.gpg_key_id_seq', 1, false);


--
-- Name: hook_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.hook_task_id_seq', 1, false);


--
-- Name: issue_assignees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_assignees_id_seq', 4, true);


--
-- Name: issue_content_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_content_history_id_seq', 1, false);


--
-- Name: issue_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_dependency_id_seq', 1, false);


--
-- Name: issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_id_seq', 8, true);


--
-- Name: issue_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_label_id_seq', 1, false);


--
-- Name: issue_pin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_pin_id_seq', 1, false);


--
-- Name: issue_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_user_id_seq', 48, true);


--
-- Name: issue_watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.issue_watch_id_seq', 1, false);


--
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.label_id_seq', 8, true);


--
-- Name: language_stat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.language_stat_id_seq', 14, true);


--
-- Name: lfs_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_lock_id_seq', 1, false);


--
-- Name: lfs_meta_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.lfs_meta_object_id_seq', 1, false);


--
-- Name: login_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.login_source_id_seq', 1, false);


--
-- Name: milestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.milestone_id_seq', 3, true);


--
-- Name: mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.mirror_id_seq', 1, false);


--
-- Name: notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notice_id_seq', 1, false);


--
-- Name: notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.notification_id_seq', 19, true);


--
-- Name: oauth2_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_application_id_seq', 3, true);


--
-- Name: oauth2_authorization_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_authorization_code_id_seq', 1, false);


--
-- Name: oauth2_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.oauth2_grant_id_seq', 1, false);


--
-- Name: org_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.org_user_id_seq', 3, true);


--
-- Name: package_blob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_blob_id_seq', 1, false);


--
-- Name: package_cleanup_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_cleanup_rule_id_seq', 1, false);


--
-- Name: package_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_file_id_seq', 1, false);


--
-- Name: package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_id_seq', 1, false);


--
-- Name: package_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_property_id_seq', 1, false);


--
-- Name: package_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.package_version_id_seq', 1, false);


--
-- Name: project_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.project_board_id_seq', 1, false);


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: project_issue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.project_issue_id_seq', 1, false);


--
-- Name: protected_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.protected_branch_id_seq', 1, false);


--
-- Name: protected_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.protected_tag_id_seq', 1, false);


--
-- Name: public_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.public_key_id_seq', 1, false);


--
-- Name: pull_auto_merge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.pull_auto_merge_id_seq', 1, false);


--
-- Name: pull_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.pull_request_id_seq', 3, true);


--
-- Name: push_mirror_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.push_mirror_id_seq', 1, false);


--
-- Name: reaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.reaction_id_seq', 1, false);


--
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.release_id_seq', 6, true);


--
-- Name: renamed_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.renamed_branch_id_seq', 1, false);


--
-- Name: repo_archiver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_archiver_id_seq', 1, false);


--
-- Name: repo_indexer_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_indexer_status_id_seq', 7, true);


--
-- Name: repo_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_license_id_seq', 1, false);


--
-- Name: repo_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_redirect_id_seq', 1, false);


--
-- Name: repo_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_transfer_id_seq', 1, false);


--
-- Name: repo_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repo_unit_id_seq', 50, true);


--
-- Name: repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.repository_id_seq', 7, true);


--
-- Name: review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.review_id_seq', 5, true);


--
-- Name: review_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.review_state_id_seq', 1, false);


--
-- Name: secret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.secret_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: stopwatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.stopwatch_id_seq', 1, false);


--
-- Name: system_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.system_setting_id_seq', 1, true);


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.task_id_seq', 1, false);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_id_seq', 3, true);


--
-- Name: team_invite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_invite_id_seq', 1, false);


--
-- Name: team_repo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_repo_id_seq', 3, true);


--
-- Name: team_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_unit_id_seq', 30, true);


--
-- Name: team_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.team_user_id_seq', 3, true);


--
-- Name: topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.topic_id_seq', 1, false);


--
-- Name: tracked_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.tracked_time_id_seq', 3, true);


--
-- Name: two_factor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.two_factor_id_seq', 1, false);


--
-- Name: upload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.upload_id_seq', 1, false);


--
-- Name: user_badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_badge_id_seq', 1, false);


--
-- Name: user_blocking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_blocking_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_id_seq', 10, true);


--
-- Name: user_open_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_open_id_id_seq', 1, false);


--
-- Name: user_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_redirect_id_seq', 1, false);


--
-- Name: user_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.user_setting_id_seq', 1, false);


--
-- Name: version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.version_id_seq', 1, true);


--
-- Name: watch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.watch_id_seq', 7, true);


--
-- Name: webauthn_credential_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.webauthn_credential_id_seq', 1, false);


--
-- Name: webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gitea
--

SELECT pg_catalog.setval('public.webhook_id_seq', 1, false);


--
-- Name: access access_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access
    ADD CONSTRAINT access_pkey PRIMARY KEY (id);


--
-- Name: access_token access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.access_token
    ADD CONSTRAINT access_token_pkey PRIMARY KEY (id);


--
-- Name: action_artifact action_artifact_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_artifact
    ADD CONSTRAINT action_artifact_pkey PRIMARY KEY (id);


--
-- Name: action action_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action
    ADD CONSTRAINT action_pkey PRIMARY KEY (id);


--
-- Name: action_run_index action_run_index_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_run_index
    ADD CONSTRAINT action_run_index_pkey PRIMARY KEY (group_id);


--
-- Name: action_run_job action_run_job_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_run_job
    ADD CONSTRAINT action_run_job_pkey PRIMARY KEY (id);


--
-- Name: action_run action_run_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_run
    ADD CONSTRAINT action_run_pkey PRIMARY KEY (id);


--
-- Name: action_runner action_runner_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_runner
    ADD CONSTRAINT action_runner_pkey PRIMARY KEY (id);


--
-- Name: action_runner_token action_runner_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_runner_token
    ADD CONSTRAINT action_runner_token_pkey PRIMARY KEY (id);


--
-- Name: action_schedule action_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_schedule
    ADD CONSTRAINT action_schedule_pkey PRIMARY KEY (id);


--
-- Name: action_schedule_spec action_schedule_spec_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_schedule_spec
    ADD CONSTRAINT action_schedule_spec_pkey PRIMARY KEY (id);


--
-- Name: action_task_output action_task_output_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task_output
    ADD CONSTRAINT action_task_output_pkey PRIMARY KEY (id);


--
-- Name: action_task action_task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task
    ADD CONSTRAINT action_task_pkey PRIMARY KEY (id);


--
-- Name: action_task_step action_task_step_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_task_step
    ADD CONSTRAINT action_task_step_pkey PRIMARY KEY (id);


--
-- Name: action_tasks_version action_tasks_version_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_tasks_version
    ADD CONSTRAINT action_tasks_version_pkey PRIMARY KEY (id);


--
-- Name: action_variable action_variable_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.action_variable
    ADD CONSTRAINT action_variable_pkey PRIMARY KEY (id);


--
-- Name: app_state app_state_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.app_state
    ADD CONSTRAINT app_state_pkey PRIMARY KEY (id);


--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: auth_token auth_token_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.auth_token
    ADD CONSTRAINT auth_token_pkey PRIMARY KEY (id);


--
-- Name: badge badge_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.badge
    ADD CONSTRAINT badge_pkey PRIMARY KEY (id);


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- Name: collaboration collaboration_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.collaboration
    ADD CONSTRAINT collaboration_pkey PRIMARY KEY (id);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: commit_status_index commit_status_index_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status_index
    ADD CONSTRAINT commit_status_index_pkey PRIMARY KEY (id);


--
-- Name: commit_status commit_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status
    ADD CONSTRAINT commit_status_pkey PRIMARY KEY (id);


--
-- Name: commit_status_summary commit_status_summary_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.commit_status_summary
    ADD CONSTRAINT commit_status_summary_pkey PRIMARY KEY (id);


--
-- Name: dbfs_data dbfs_data_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.dbfs_data
    ADD CONSTRAINT dbfs_data_pkey PRIMARY KEY (id);


--
-- Name: dbfs_meta dbfs_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.dbfs_meta
    ADD CONSTRAINT dbfs_meta_pkey PRIMARY KEY (id);


--
-- Name: deploy_key deploy_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.deploy_key
    ADD CONSTRAINT deploy_key_pkey PRIMARY KEY (id);


--
-- Name: email_address email_address_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_address
    ADD CONSTRAINT email_address_pkey PRIMARY KEY (id);


--
-- Name: email_hash email_hash_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.email_hash
    ADD CONSTRAINT email_hash_pkey PRIMARY KEY (hash);


--
-- Name: external_login_user external_login_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.external_login_user
    ADD CONSTRAINT external_login_user_pkey PRIMARY KEY (external_id, login_source_id);


--
-- Name: follow follow_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: gpg_key_import gpg_key_import_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key_import
    ADD CONSTRAINT gpg_key_import_pkey PRIMARY KEY (key_id);


--
-- Name: gpg_key gpg_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.gpg_key
    ADD CONSTRAINT gpg_key_pkey PRIMARY KEY (id);


--
-- Name: hook_task hook_task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.hook_task
    ADD CONSTRAINT hook_task_pkey PRIMARY KEY (id);


--
-- Name: issue_assignees issue_assignees_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_assignees
    ADD CONSTRAINT issue_assignees_pkey PRIMARY KEY (id);


--
-- Name: issue_content_history issue_content_history_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_content_history
    ADD CONSTRAINT issue_content_history_pkey PRIMARY KEY (id);


--
-- Name: issue_dependency issue_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_dependency
    ADD CONSTRAINT issue_dependency_pkey PRIMARY KEY (id);


--
-- Name: issue_index issue_index_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_index
    ADD CONSTRAINT issue_index_pkey PRIMARY KEY (group_id);


--
-- Name: issue_label issue_label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_label
    ADD CONSTRAINT issue_label_pkey PRIMARY KEY (id);


--
-- Name: issue_pin issue_pin_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_pin
    ADD CONSTRAINT issue_pin_pkey PRIMARY KEY (id);


--
-- Name: issue issue_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue
    ADD CONSTRAINT issue_pkey PRIMARY KEY (id);


--
-- Name: issue_user issue_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_user
    ADD CONSTRAINT issue_user_pkey PRIMARY KEY (id);


--
-- Name: issue_watch issue_watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.issue_watch
    ADD CONSTRAINT issue_watch_pkey PRIMARY KEY (id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: language_stat language_stat_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.language_stat
    ADD CONSTRAINT language_stat_pkey PRIMARY KEY (id);


--
-- Name: lfs_lock lfs_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_lock
    ADD CONSTRAINT lfs_lock_pkey PRIMARY KEY (id);


--
-- Name: lfs_meta_object lfs_meta_object_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.lfs_meta_object
    ADD CONSTRAINT lfs_meta_object_pkey PRIMARY KEY (id);


--
-- Name: login_source login_source_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.login_source
    ADD CONSTRAINT login_source_pkey PRIMARY KEY (id);


--
-- Name: milestone milestone_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.milestone
    ADD CONSTRAINT milestone_pkey PRIMARY KEY (id);


--
-- Name: mirror mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.mirror
    ADD CONSTRAINT mirror_pkey PRIMARY KEY (id);


--
-- Name: notice notice_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notice
    ADD CONSTRAINT notice_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: oauth2_application oauth2_application_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_application
    ADD CONSTRAINT oauth2_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_authorization_code oauth2_authorization_code_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_authorization_code
    ADD CONSTRAINT oauth2_authorization_code_pkey PRIMARY KEY (id);


--
-- Name: oauth2_grant oauth2_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.oauth2_grant
    ADD CONSTRAINT oauth2_grant_pkey PRIMARY KEY (id);


--
-- Name: org_user org_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.org_user
    ADD CONSTRAINT org_user_pkey PRIMARY KEY (id);


--
-- Name: package_blob package_blob_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_blob
    ADD CONSTRAINT package_blob_pkey PRIMARY KEY (id);


--
-- Name: package_blob_upload package_blob_upload_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_blob_upload
    ADD CONSTRAINT package_blob_upload_pkey PRIMARY KEY (id);


--
-- Name: package_cleanup_rule package_cleanup_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_cleanup_rule
    ADD CONSTRAINT package_cleanup_rule_pkey PRIMARY KEY (id);


--
-- Name: package_file package_file_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_file
    ADD CONSTRAINT package_file_pkey PRIMARY KEY (id);


--
-- Name: package package_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: package_property package_property_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_property
    ADD CONSTRAINT package_property_pkey PRIMARY KEY (id);


--
-- Name: package_version package_version_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.package_version
    ADD CONSTRAINT package_version_pkey PRIMARY KEY (id);


--
-- Name: project_board project_board_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project_board
    ADD CONSTRAINT project_board_pkey PRIMARY KEY (id);


--
-- Name: project_issue project_issue_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project_issue
    ADD CONSTRAINT project_issue_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: protected_branch protected_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_branch
    ADD CONSTRAINT protected_branch_pkey PRIMARY KEY (id);


--
-- Name: protected_tag protected_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.protected_tag
    ADD CONSTRAINT protected_tag_pkey PRIMARY KEY (id);


--
-- Name: public_key public_key_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.public_key
    ADD CONSTRAINT public_key_pkey PRIMARY KEY (id);


--
-- Name: pull_auto_merge pull_auto_merge_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_auto_merge
    ADD CONSTRAINT pull_auto_merge_pkey PRIMARY KEY (id);


--
-- Name: pull_request pull_request_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.pull_request
    ADD CONSTRAINT pull_request_pkey PRIMARY KEY (id);


--
-- Name: push_mirror push_mirror_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.push_mirror
    ADD CONSTRAINT push_mirror_pkey PRIMARY KEY (id);


--
-- Name: reaction reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.reaction
    ADD CONSTRAINT reaction_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: renamed_branch renamed_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.renamed_branch
    ADD CONSTRAINT renamed_branch_pkey PRIMARY KEY (id);


--
-- Name: repo_archiver repo_archiver_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_archiver
    ADD CONSTRAINT repo_archiver_pkey PRIMARY KEY (id);


--
-- Name: repo_indexer_status repo_indexer_status_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_indexer_status
    ADD CONSTRAINT repo_indexer_status_pkey PRIMARY KEY (id);


--
-- Name: repo_license repo_license_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_license
    ADD CONSTRAINT repo_license_pkey PRIMARY KEY (id);


--
-- Name: repo_redirect repo_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_redirect
    ADD CONSTRAINT repo_redirect_pkey PRIMARY KEY (id);


--
-- Name: repo_topic repo_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_topic
    ADD CONSTRAINT repo_topic_pkey PRIMARY KEY (repo_id, topic_id);


--
-- Name: repo_transfer repo_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_transfer
    ADD CONSTRAINT repo_transfer_pkey PRIMARY KEY (id);


--
-- Name: repo_unit repo_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repo_unit
    ADD CONSTRAINT repo_unit_pkey PRIMARY KEY (id);


--
-- Name: repository repository_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.repository
    ADD CONSTRAINT repository_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: review_state review_state_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.review_state
    ADD CONSTRAINT review_state_pkey PRIMARY KEY (id);


--
-- Name: secret secret_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.secret
    ADD CONSTRAINT secret_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (key);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (id);


--
-- Name: stopwatch stopwatch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.stopwatch
    ADD CONSTRAINT stopwatch_pkey PRIMARY KEY (id);


--
-- Name: system_setting system_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.system_setting
    ADD CONSTRAINT system_setting_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: team_invite team_invite_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_invite
    ADD CONSTRAINT team_invite_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: team_repo team_repo_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_repo
    ADD CONSTRAINT team_repo_pkey PRIMARY KEY (id);


--
-- Name: team_unit team_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_unit
    ADD CONSTRAINT team_unit_pkey PRIMARY KEY (id);


--
-- Name: team_user team_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.team_user
    ADD CONSTRAINT team_user_pkey PRIMARY KEY (id);


--
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- Name: tracked_time tracked_time_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.tracked_time
    ADD CONSTRAINT tracked_time_pkey PRIMARY KEY (id);


--
-- Name: two_factor two_factor_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.two_factor
    ADD CONSTRAINT two_factor_pkey PRIMARY KEY (id);


--
-- Name: upload upload_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.upload
    ADD CONSTRAINT upload_pkey PRIMARY KEY (id);


--
-- Name: user_badge user_badge_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_badge
    ADD CONSTRAINT user_badge_pkey PRIMARY KEY (id);


--
-- Name: user_blocking user_blocking_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_blocking
    ADD CONSTRAINT user_blocking_pkey PRIMARY KEY (id);


--
-- Name: user_open_id user_open_id_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_open_id
    ADD CONSTRAINT user_open_id_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_redirect user_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_redirect
    ADD CONSTRAINT user_redirect_pkey PRIMARY KEY (id);


--
-- Name: user_setting user_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.user_setting
    ADD CONSTRAINT user_setting_pkey PRIMARY KEY (id);


--
-- Name: version version_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- Name: watch watch_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.watch
    ADD CONSTRAINT watch_pkey PRIMARY KEY (id);


--
-- Name: webauthn_credential webauthn_credential_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webauthn_credential
    ADD CONSTRAINT webauthn_credential_pkey PRIMARY KEY (id);


--
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: gitea
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (id);


--
-- Name: IDX_access_token_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_created_unix" ON public.access_token USING btree (created_unix);


--
-- Name: IDX_access_token_token_last_eight; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_token_last_eight" ON public.access_token USING btree (token_last_eight);


--
-- Name: IDX_access_token_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_uid" ON public.access_token USING btree (uid);


--
-- Name: IDX_access_token_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_access_token_updated_unix" ON public.access_token USING btree (updated_unix);


--
-- Name: IDX_action_artifact_artifact_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_artifact_name" ON public.action_artifact USING btree (artifact_name);


--
-- Name: IDX_action_artifact_artifact_path; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_artifact_path" ON public.action_artifact USING btree (artifact_path);


--
-- Name: IDX_action_artifact_expired_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_expired_unix" ON public.action_artifact USING btree (expired_unix);


--
-- Name: IDX_action_artifact_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_repo_id" ON public.action_artifact USING btree (repo_id);


--
-- Name: IDX_action_artifact_run_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_run_id" ON public.action_artifact USING btree (run_id);


--
-- Name: IDX_action_artifact_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_status" ON public.action_artifact USING btree (status);


--
-- Name: IDX_action_artifact_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_artifact_updated_unix" ON public.action_artifact USING btree (updated_unix);


--
-- Name: IDX_action_au_c_u; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_au_c_u" ON public.action USING btree (act_user_id, created_unix, user_id);


--
-- Name: IDX_action_au_r_c_u_d; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_au_r_c_u_d" ON public.action USING btree (act_user_id, repo_id, created_unix, user_id, is_deleted);


--
-- Name: IDX_action_c_u; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_c_u" ON public.action USING btree (user_id, is_deleted);


--
-- Name: IDX_action_c_u_d; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_c_u_d" ON public.action USING btree (created_unix, user_id, is_deleted);


--
-- Name: IDX_action_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_comment_id" ON public.action USING btree (comment_id);


--
-- Name: IDX_action_r_u_d; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_r_u_d" ON public.action USING btree (repo_id, user_id, is_deleted);


--
-- Name: IDX_action_run_approved_by; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_approved_by" ON public.action_run USING btree (approved_by);


--
-- Name: IDX_action_run_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_index" ON public.action_run USING btree (index);


--
-- Name: IDX_action_run_index_max_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_index_max_index" ON public.action_run_index USING btree (max_index);


--
-- Name: IDX_action_run_job_commit_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_commit_sha" ON public.action_run_job USING btree (commit_sha);


--
-- Name: IDX_action_run_job_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_owner_id" ON public.action_run_job USING btree (owner_id);


--
-- Name: IDX_action_run_job_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_repo_id" ON public.action_run_job USING btree (repo_id);


--
-- Name: IDX_action_run_job_run_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_run_id" ON public.action_run_job USING btree (run_id);


--
-- Name: IDX_action_run_job_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_status" ON public.action_run_job USING btree (status);


--
-- Name: IDX_action_run_job_updated; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_job_updated" ON public.action_run_job USING btree (updated);


--
-- Name: IDX_action_run_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_owner_id" ON public.action_run USING btree (owner_id);


--
-- Name: IDX_action_run_ref; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_ref" ON public.action_run USING btree (ref);


--
-- Name: IDX_action_run_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_repo_id" ON public.action_run USING btree (repo_id);


--
-- Name: IDX_action_run_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_status" ON public.action_run USING btree (status);


--
-- Name: IDX_action_run_trigger_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_trigger_user_id" ON public.action_run USING btree (trigger_user_id);


--
-- Name: IDX_action_run_workflow_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_run_workflow_id" ON public.action_run USING btree (workflow_id);


--
-- Name: IDX_action_runner_last_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_last_active" ON public.action_runner USING btree (last_active);


--
-- Name: IDX_action_runner_last_online; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_last_online" ON public.action_runner USING btree (last_online);


--
-- Name: IDX_action_runner_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_owner_id" ON public.action_runner USING btree (owner_id);


--
-- Name: IDX_action_runner_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_repo_id" ON public.action_runner USING btree (repo_id);


--
-- Name: IDX_action_runner_token_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_token_owner_id" ON public.action_runner_token USING btree (owner_id);


--
-- Name: IDX_action_runner_token_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_runner_token_repo_id" ON public.action_runner_token USING btree (repo_id);


--
-- Name: IDX_action_schedule_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_schedule_owner_id" ON public.action_schedule USING btree (owner_id);


--
-- Name: IDX_action_schedule_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_schedule_repo_id" ON public.action_schedule USING btree (repo_id);


--
-- Name: IDX_action_schedule_spec_next; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_schedule_spec_next" ON public.action_schedule_spec USING btree (next);


--
-- Name: IDX_action_schedule_spec_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_schedule_spec_repo_id" ON public.action_schedule_spec USING btree (repo_id);


--
-- Name: IDX_action_schedule_spec_schedule_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_schedule_spec_schedule_id" ON public.action_schedule_spec USING btree (schedule_id);


--
-- Name: IDX_action_task_commit_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_commit_sha" ON public.action_task USING btree (commit_sha);


--
-- Name: IDX_action_task_output_task_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_output_task_id" ON public.action_task_output USING btree (task_id);


--
-- Name: IDX_action_task_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_owner_id" ON public.action_task USING btree (owner_id);


--
-- Name: IDX_action_task_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_repo_id" ON public.action_task USING btree (repo_id);


--
-- Name: IDX_action_task_runner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_runner_id" ON public.action_task USING btree (runner_id);


--
-- Name: IDX_action_task_started; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_started" ON public.action_task USING btree (started);


--
-- Name: IDX_action_task_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_status" ON public.action_task USING btree (status);


--
-- Name: IDX_action_task_step_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_step_index" ON public.action_task_step USING btree (index);


--
-- Name: IDX_action_task_step_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_step_repo_id" ON public.action_task_step USING btree (repo_id);


--
-- Name: IDX_action_task_step_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_step_status" ON public.action_task_step USING btree (status);


--
-- Name: IDX_action_task_step_task_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_step_task_id" ON public.action_task_step USING btree (task_id);


--
-- Name: IDX_action_task_stopped_log_expired; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_stopped_log_expired" ON public.action_task USING btree (stopped, log_expired);


--
-- Name: IDX_action_task_token_last_eight; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_token_last_eight" ON public.action_task USING btree (token_last_eight);


--
-- Name: IDX_action_task_updated; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_task_updated" ON public.action_task USING btree (updated);


--
-- Name: IDX_action_tasks_version_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_tasks_version_repo_id" ON public.action_tasks_version USING btree (repo_id);


--
-- Name: IDX_action_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_user_id" ON public.action USING btree (user_id);


--
-- Name: IDX_action_variable_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_action_variable_repo_id" ON public.action_variable USING btree (repo_id);


--
-- Name: IDX_attachment_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_comment_id" ON public.attachment USING btree (comment_id);


--
-- Name: IDX_attachment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_issue_id" ON public.attachment USING btree (issue_id);


--
-- Name: IDX_attachment_release_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_release_id" ON public.attachment USING btree (release_id);


--
-- Name: IDX_attachment_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_repo_id" ON public.attachment USING btree (repo_id);


--
-- Name: IDX_attachment_uploader_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_attachment_uploader_id" ON public.attachment USING btree (uploader_id);


--
-- Name: IDX_auth_token_expires_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_auth_token_expires_unix" ON public.auth_token USING btree (expires_unix);


--
-- Name: IDX_auth_token_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_auth_token_user_id" ON public.auth_token USING btree (user_id);


--
-- Name: IDX_branch_deleted_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_branch_deleted_unix" ON public.branch USING btree (deleted_unix);


--
-- Name: IDX_branch_is_deleted; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_branch_is_deleted" ON public.branch USING btree (is_deleted);


--
-- Name: IDX_collaboration_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_created_unix" ON public.collaboration USING btree (created_unix);


--
-- Name: IDX_collaboration_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_repo_id" ON public.collaboration USING btree (repo_id);


--
-- Name: IDX_collaboration_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_updated_unix" ON public.collaboration USING btree (updated_unix);


--
-- Name: IDX_collaboration_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_collaboration_user_id" ON public.collaboration USING btree (user_id);


--
-- Name: IDX_comment_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_created_unix" ON public.comment USING btree (created_unix);


--
-- Name: IDX_comment_dependent_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_dependent_issue_id" ON public.comment USING btree (dependent_issue_id);


--
-- Name: IDX_comment_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_issue_id" ON public.comment USING btree (issue_id);


--
-- Name: IDX_comment_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_poster_id" ON public.comment USING btree (poster_id);


--
-- Name: IDX_comment_ref_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_ref_comment_id" ON public.comment USING btree (ref_comment_id);


--
-- Name: IDX_comment_ref_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_ref_issue_id" ON public.comment USING btree (ref_issue_id);


--
-- Name: IDX_comment_ref_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_ref_repo_id" ON public.comment USING btree (ref_repo_id);


--
-- Name: IDX_comment_review_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_review_id" ON public.comment USING btree (review_id);


--
-- Name: IDX_comment_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_type" ON public.comment USING btree (type);


--
-- Name: IDX_comment_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_comment_updated_unix" ON public.comment USING btree (updated_unix);


--
-- Name: IDX_commit_status_context_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_context_hash" ON public.commit_status USING btree (context_hash);


--
-- Name: IDX_commit_status_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_created_unix" ON public.commit_status USING btree (created_unix);


--
-- Name: IDX_commit_status_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_index" ON public.commit_status USING btree (index);


--
-- Name: IDX_commit_status_index_max_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_index_max_index" ON public.commit_status_index USING btree (max_index);


--
-- Name: IDX_commit_status_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_repo_id" ON public.commit_status USING btree (repo_id);


--
-- Name: IDX_commit_status_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_sha" ON public.commit_status USING btree (sha);


--
-- Name: IDX_commit_status_summary_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_summary_repo_id" ON public.commit_status_summary USING btree (repo_id);


--
-- Name: IDX_commit_status_summary_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_summary_sha" ON public.commit_status_summary USING btree (sha);


--
-- Name: IDX_commit_status_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_commit_status_updated_unix" ON public.commit_status USING btree (updated_unix);


--
-- Name: IDX_dbfs_data_meta_offset; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_dbfs_data_meta_offset" ON public.dbfs_data USING btree (meta_id, blob_offset);


--
-- Name: IDX_deploy_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_key_id" ON public.deploy_key USING btree (key_id);


--
-- Name: IDX_deploy_key_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_deploy_key_repo_id" ON public.deploy_key USING btree (repo_id);


--
-- Name: IDX_email_address_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_email_address_uid" ON public.email_address USING btree (uid);


--
-- Name: IDX_external_login_user_provider; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_external_login_user_provider" ON public.external_login_user USING btree (provider);


--
-- Name: IDX_external_login_user_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_external_login_user_user_id" ON public.external_login_user USING btree (user_id);


--
-- Name: IDX_follow_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_follow_created_unix" ON public.follow USING btree (created_unix);


--
-- Name: IDX_gpg_key_key_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_key_id" ON public.gpg_key USING btree (key_id);


--
-- Name: IDX_gpg_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_gpg_key_owner_id" ON public.gpg_key USING btree (owner_id);


--
-- Name: IDX_hook_task_hook_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_hook_task_hook_id" ON public.hook_task USING btree (hook_id);


--
-- Name: IDX_issue_assignees_assignee_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_assignee_id" ON public.issue_assignees USING btree (assignee_id);


--
-- Name: IDX_issue_assignees_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_assignees_issue_id" ON public.issue_assignees USING btree (issue_id);


--
-- Name: IDX_issue_closed_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_closed_unix" ON public.issue USING btree (closed_unix);


--
-- Name: IDX_issue_content_history_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_content_history_comment_id" ON public.issue_content_history USING btree (comment_id);


--
-- Name: IDX_issue_content_history_edited_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_content_history_edited_unix" ON public.issue_content_history USING btree (edited_unix);


--
-- Name: IDX_issue_content_history_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_content_history_issue_id" ON public.issue_content_history USING btree (issue_id);


--
-- Name: IDX_issue_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_created_unix" ON public.issue USING btree (created_unix);


--
-- Name: IDX_issue_deadline_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_deadline_unix" ON public.issue USING btree (deadline_unix);


--
-- Name: IDX_issue_index_max_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_index_max_index" ON public.issue_index USING btree (max_index);


--
-- Name: IDX_issue_is_closed; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_closed" ON public.issue USING btree (is_closed);


--
-- Name: IDX_issue_is_pull; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_is_pull" ON public.issue USING btree (is_pull);


--
-- Name: IDX_issue_milestone_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_milestone_id" ON public.issue USING btree (milestone_id);


--
-- Name: IDX_issue_original_author_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_original_author_id" ON public.issue USING btree (original_author_id);


--
-- Name: IDX_issue_poster_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_poster_id" ON public.issue USING btree (poster_id);


--
-- Name: IDX_issue_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_repo_id" ON public.issue USING btree (repo_id);


--
-- Name: IDX_issue_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_updated_unix" ON public.issue USING btree (updated_unix);


--
-- Name: IDX_issue_user_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_user_issue_id" ON public.issue_user USING btree (issue_id);


--
-- Name: IDX_issue_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_issue_user_uid" ON public.issue_user USING btree (uid);


--
-- Name: IDX_label_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_created_unix" ON public.label USING btree (created_unix);


--
-- Name: IDX_label_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_org_id" ON public.label USING btree (org_id);


--
-- Name: IDX_label_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_repo_id" ON public.label USING btree (repo_id);


--
-- Name: IDX_label_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_label_updated_unix" ON public.label USING btree (updated_unix);


--
-- Name: IDX_language_stat_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_language_stat_created_unix" ON public.language_stat USING btree (created_unix);


--
-- Name: IDX_language_stat_language; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_language_stat_language" ON public.language_stat USING btree (language);


--
-- Name: IDX_language_stat_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_language_stat_repo_id" ON public.language_stat USING btree (repo_id);


--
-- Name: IDX_lfs_lock_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_owner_id" ON public.lfs_lock USING btree (owner_id);


--
-- Name: IDX_lfs_lock_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_lock_repo_id" ON public.lfs_lock USING btree (repo_id);


--
-- Name: IDX_lfs_meta_object_oid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_oid" ON public.lfs_meta_object USING btree (oid);


--
-- Name: IDX_lfs_meta_object_repository_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_repository_id" ON public.lfs_meta_object USING btree (repository_id);


--
-- Name: IDX_lfs_meta_object_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_lfs_meta_object_updated_unix" ON public.lfs_meta_object USING btree (updated_unix);


--
-- Name: IDX_login_source_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_created_unix" ON public.login_source USING btree (created_unix);


--
-- Name: IDX_login_source_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_active" ON public.login_source USING btree (is_active);


--
-- Name: IDX_login_source_is_sync_enabled; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_is_sync_enabled" ON public.login_source USING btree (is_sync_enabled);


--
-- Name: IDX_login_source_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_login_source_updated_unix" ON public.login_source USING btree (updated_unix);


--
-- Name: IDX_milestone_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_milestone_created_unix" ON public.milestone USING btree (created_unix);


--
-- Name: IDX_milestone_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_milestone_repo_id" ON public.milestone USING btree (repo_id);


--
-- Name: IDX_milestone_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_milestone_updated_unix" ON public.milestone USING btree (updated_unix);


--
-- Name: IDX_mirror_next_update_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_next_update_unix" ON public.mirror USING btree (next_update_unix);


--
-- Name: IDX_mirror_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_repo_id" ON public.mirror USING btree (repo_id);


--
-- Name: IDX_mirror_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_mirror_updated_unix" ON public.mirror USING btree (updated_unix);


--
-- Name: IDX_notice_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notice_created_unix" ON public.notice USING btree (created_unix);


--
-- Name: IDX_notification_idx_notification_commit_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_commit_id" ON public.notification USING btree (commit_id);


--
-- Name: IDX_notification_idx_notification_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_issue_id" ON public.notification USING btree (issue_id);


--
-- Name: IDX_notification_idx_notification_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_repo_id" ON public.notification USING btree (repo_id);


--
-- Name: IDX_notification_idx_notification_source; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_source" ON public.notification USING btree (source);


--
-- Name: IDX_notification_idx_notification_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_status" ON public.notification USING btree (status);


--
-- Name: IDX_notification_idx_notification_updated_by; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_updated_by" ON public.notification USING btree (updated_by);


--
-- Name: IDX_notification_idx_notification_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_idx_notification_user_id" ON public.notification USING btree (user_id);


--
-- Name: IDX_notification_u_s_uu; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_notification_u_s_uu" ON public.notification USING btree (user_id, status, updated_unix);


--
-- Name: IDX_oauth2_application_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_created_unix" ON public.oauth2_application USING btree (created_unix);


--
-- Name: IDX_oauth2_application_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_uid" ON public.oauth2_application USING btree (uid);


--
-- Name: IDX_oauth2_application_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_application_updated_unix" ON public.oauth2_application USING btree (updated_unix);


--
-- Name: IDX_oauth2_authorization_code_valid_until; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_authorization_code_valid_until" ON public.oauth2_authorization_code USING btree (valid_until);


--
-- Name: IDX_oauth2_grant_application_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_grant_application_id" ON public.oauth2_grant USING btree (application_id);


--
-- Name: IDX_oauth2_grant_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_oauth2_grant_user_id" ON public.oauth2_grant USING btree (user_id);


--
-- Name: IDX_org_user_is_public; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_is_public" ON public.org_user USING btree (is_public);


--
-- Name: IDX_org_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_org_id" ON public.org_user USING btree (org_id);


--
-- Name: IDX_org_user_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_org_user_uid" ON public.org_user USING btree (uid);


--
-- Name: IDX_package_blob_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_created_unix" ON public.package_blob USING btree (created_unix);


--
-- Name: IDX_package_blob_hash_md5; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_hash_md5" ON public.package_blob USING btree (hash_md5);


--
-- Name: IDX_package_blob_hash_sha1; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_hash_sha1" ON public.package_blob USING btree (hash_sha1);


--
-- Name: IDX_package_blob_hash_sha256; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_hash_sha256" ON public.package_blob USING btree (hash_sha256);


--
-- Name: IDX_package_blob_hash_sha512; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_hash_sha512" ON public.package_blob USING btree (hash_sha512);


--
-- Name: IDX_package_blob_upload_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_blob_upload_updated_unix" ON public.package_blob_upload USING btree (updated_unix);


--
-- Name: IDX_package_cleanup_rule_enabled; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_cleanup_rule_enabled" ON public.package_cleanup_rule USING btree (enabled);


--
-- Name: IDX_package_cleanup_rule_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_cleanup_rule_owner_id" ON public.package_cleanup_rule USING btree (owner_id);


--
-- Name: IDX_package_cleanup_rule_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_cleanup_rule_type" ON public.package_cleanup_rule USING btree (type);


--
-- Name: IDX_package_file_blob_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_file_blob_id" ON public.package_file USING btree (blob_id);


--
-- Name: IDX_package_file_composite_key; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_file_composite_key" ON public.package_file USING btree (composite_key);


--
-- Name: IDX_package_file_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_file_created_unix" ON public.package_file USING btree (created_unix);


--
-- Name: IDX_package_file_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_file_lower_name" ON public.package_file USING btree (lower_name);


--
-- Name: IDX_package_file_version_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_file_version_id" ON public.package_file USING btree (version_id);


--
-- Name: IDX_package_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_lower_name" ON public.package USING btree (lower_name);


--
-- Name: IDX_package_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_owner_id" ON public.package USING btree (owner_id);


--
-- Name: IDX_package_property_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_property_name" ON public.package_property USING btree (name);


--
-- Name: IDX_package_property_ref_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_property_ref_id" ON public.package_property USING btree (ref_id);


--
-- Name: IDX_package_property_ref_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_property_ref_type" ON public.package_property USING btree (ref_type);


--
-- Name: IDX_package_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_repo_id" ON public.package USING btree (repo_id);


--
-- Name: IDX_package_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_type" ON public.package USING btree (type);


--
-- Name: IDX_package_version_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_version_created_unix" ON public.package_version USING btree (created_unix);


--
-- Name: IDX_package_version_is_internal; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_version_is_internal" ON public.package_version USING btree (is_internal);


--
-- Name: IDX_package_version_lower_version; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_version_lower_version" ON public.package_version USING btree (lower_version);


--
-- Name: IDX_package_version_package_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_package_version_package_id" ON public.package_version USING btree (package_id);


--
-- Name: IDX_project_board_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_board_created_unix" ON public.project_board USING btree (created_unix);


--
-- Name: IDX_project_board_project_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_board_project_id" ON public.project_board USING btree (project_id);


--
-- Name: IDX_project_board_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_board_updated_unix" ON public.project_board USING btree (updated_unix);


--
-- Name: IDX_project_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_created_unix" ON public.project USING btree (created_unix);


--
-- Name: IDX_project_is_closed; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_is_closed" ON public.project USING btree (is_closed);


--
-- Name: IDX_project_issue_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_issue_issue_id" ON public.project_issue USING btree (issue_id);


--
-- Name: IDX_project_issue_project_board_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_issue_project_board_id" ON public.project_issue USING btree (project_board_id);


--
-- Name: IDX_project_issue_project_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_issue_project_id" ON public.project_issue USING btree (project_id);


--
-- Name: IDX_project_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_owner_id" ON public.project USING btree (owner_id);


--
-- Name: IDX_project_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_repo_id" ON public.project USING btree (repo_id);


--
-- Name: IDX_project_title; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_title" ON public.project USING btree (title);


--
-- Name: IDX_project_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_project_updated_unix" ON public.project USING btree (updated_unix);


--
-- Name: IDX_public_key_fingerprint; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_fingerprint" ON public.public_key USING btree (fingerprint);


--
-- Name: IDX_public_key_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_public_key_owner_id" ON public.public_key USING btree (owner_id);


--
-- Name: IDX_pull_auto_merge_doer_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_auto_merge_doer_id" ON public.pull_auto_merge USING btree (doer_id);


--
-- Name: IDX_pull_request_base_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_base_repo_id" ON public.pull_request USING btree (base_repo_id);


--
-- Name: IDX_pull_request_has_merged; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_has_merged" ON public.pull_request USING btree (has_merged);


--
-- Name: IDX_pull_request_head_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_head_repo_id" ON public.pull_request USING btree (head_repo_id);


--
-- Name: IDX_pull_request_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_issue_id" ON public.pull_request USING btree (issue_id);


--
-- Name: IDX_pull_request_merged_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merged_unix" ON public.pull_request USING btree (merged_unix);


--
-- Name: IDX_pull_request_merger_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_pull_request_merger_id" ON public.pull_request USING btree (merger_id);


--
-- Name: IDX_push_mirror_last_update; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_push_mirror_last_update" ON public.push_mirror USING btree (last_update);


--
-- Name: IDX_push_mirror_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_push_mirror_repo_id" ON public.push_mirror USING btree (repo_id);


--
-- Name: IDX_reaction_comment_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_comment_id" ON public.reaction USING btree (comment_id);


--
-- Name: IDX_reaction_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_created_unix" ON public.reaction USING btree (created_unix);


--
-- Name: IDX_reaction_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_issue_id" ON public.reaction USING btree (issue_id);


--
-- Name: IDX_reaction_original_author; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_original_author" ON public.reaction USING btree (original_author);


--
-- Name: IDX_reaction_original_author_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_original_author_id" ON public.reaction USING btree (original_author_id);


--
-- Name: IDX_reaction_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_type" ON public.reaction USING btree (type);


--
-- Name: IDX_reaction_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_reaction_user_id" ON public.reaction USING btree (user_id);


--
-- Name: IDX_release_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_created_unix" ON public.release USING btree (created_unix);


--
-- Name: IDX_release_original_author_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_original_author_id" ON public.release USING btree (original_author_id);


--
-- Name: IDX_release_publisher_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_publisher_id" ON public.release USING btree (publisher_id);


--
-- Name: IDX_release_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_repo_id" ON public.release USING btree (repo_id);


--
-- Name: IDX_release_sha1; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_sha1" ON public.release USING btree (sha1);


--
-- Name: IDX_release_tag_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_release_tag_name" ON public.release USING btree (tag_name);


--
-- Name: IDX_renamed_branch_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_renamed_branch_repo_id" ON public.renamed_branch USING btree (repo_id);


--
-- Name: IDX_repo_archiver_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_archiver_created_unix" ON public.repo_archiver USING btree (created_unix);


--
-- Name: IDX_repo_archiver_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_archiver_repo_id" ON public.repo_archiver USING btree (repo_id);


--
-- Name: IDX_repo_indexer_status_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_indexer_status_s" ON public.repo_indexer_status USING btree (repo_id, indexer_type);


--
-- Name: IDX_repo_license_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_license_created_unix" ON public.repo_license USING btree (created_unix);


--
-- Name: IDX_repo_license_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_license_updated_unix" ON public.repo_license USING btree (updated_unix);


--
-- Name: IDX_repo_redirect_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_redirect_lower_name" ON public.repo_redirect USING btree (lower_name);


--
-- Name: IDX_repo_transfer_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_transfer_created_unix" ON public.repo_transfer USING btree (created_unix);


--
-- Name: IDX_repo_transfer_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_transfer_updated_unix" ON public.repo_transfer USING btree (updated_unix);


--
-- Name: IDX_repo_unit_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_created_unix" ON public.repo_unit USING btree (created_unix);


--
-- Name: IDX_repo_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repo_unit_s" ON public.repo_unit USING btree (repo_id, type);


--
-- Name: IDX_repository_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_created_unix" ON public.repository USING btree (created_unix);


--
-- Name: IDX_repository_fork_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_fork_id" ON public.repository USING btree (fork_id);


--
-- Name: IDX_repository_is_archived; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_archived" ON public.repository USING btree (is_archived);


--
-- Name: IDX_repository_is_empty; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_empty" ON public.repository USING btree (is_empty);


--
-- Name: IDX_repository_is_fork; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_fork" ON public.repository USING btree (is_fork);


--
-- Name: IDX_repository_is_mirror; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_mirror" ON public.repository USING btree (is_mirror);


--
-- Name: IDX_repository_is_private; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_private" ON public.repository USING btree (is_private);


--
-- Name: IDX_repository_is_template; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_is_template" ON public.repository USING btree (is_template);


--
-- Name: IDX_repository_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_lower_name" ON public.repository USING btree (lower_name);


--
-- Name: IDX_repository_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_name" ON public.repository USING btree (name);


--
-- Name: IDX_repository_original_service_type; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_original_service_type" ON public.repository USING btree (original_service_type);


--
-- Name: IDX_repository_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_owner_id" ON public.repository USING btree (owner_id);


--
-- Name: IDX_repository_template_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_template_id" ON public.repository USING btree (template_id);


--
-- Name: IDX_repository_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_repository_updated_unix" ON public.repository USING btree (updated_unix);


--
-- Name: IDX_review_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_created_unix" ON public.review USING btree (created_unix);


--
-- Name: IDX_review_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_issue_id" ON public.review USING btree (issue_id);


--
-- Name: IDX_review_reviewer_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_reviewer_id" ON public.review USING btree (reviewer_id);


--
-- Name: IDX_review_state_pull_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_state_pull_id" ON public.review_state USING btree (pull_id);


--
-- Name: IDX_review_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_review_updated_unix" ON public.review USING btree (updated_unix);


--
-- Name: IDX_secret_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_secret_owner_id" ON public.secret USING btree (owner_id);


--
-- Name: IDX_secret_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_secret_repo_id" ON public.secret USING btree (repo_id);


--
-- Name: IDX_star_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_star_created_unix" ON public.star USING btree (created_unix);


--
-- Name: IDX_stopwatch_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_issue_id" ON public.stopwatch USING btree (issue_id);


--
-- Name: IDX_stopwatch_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_stopwatch_user_id" ON public.stopwatch USING btree (user_id);


--
-- Name: IDX_task_doer_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_task_doer_id" ON public.task USING btree (doer_id);


--
-- Name: IDX_task_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_task_owner_id" ON public.task USING btree (owner_id);


--
-- Name: IDX_task_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_task_repo_id" ON public.task USING btree (repo_id);


--
-- Name: IDX_task_status; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_task_status" ON public.task USING btree (status);


--
-- Name: IDX_team_invite_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_invite_created_unix" ON public.team_invite USING btree (created_unix);


--
-- Name: IDX_team_invite_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_invite_org_id" ON public.team_invite USING btree (org_id);


--
-- Name: IDX_team_invite_team_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_invite_team_id" ON public.team_invite USING btree (team_id);


--
-- Name: IDX_team_invite_token; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_invite_token" ON public.team_invite USING btree (token);


--
-- Name: IDX_team_invite_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_invite_updated_unix" ON public.team_invite USING btree (updated_unix);


--
-- Name: IDX_team_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_org_id" ON public.team USING btree (org_id);


--
-- Name: IDX_team_repo_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_repo_org_id" ON public.team_repo USING btree (org_id);


--
-- Name: IDX_team_unit_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_unit_org_id" ON public.team_unit USING btree (org_id);


--
-- Name: IDX_team_user_org_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_team_user_org_id" ON public.team_user USING btree (org_id);


--
-- Name: IDX_topic_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_created_unix" ON public.topic USING btree (created_unix);


--
-- Name: IDX_topic_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_topic_updated_unix" ON public.topic USING btree (updated_unix);


--
-- Name: IDX_tracked_time_issue_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_issue_id" ON public.tracked_time USING btree (issue_id);


--
-- Name: IDX_tracked_time_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_tracked_time_user_id" ON public.tracked_time USING btree (user_id);


--
-- Name: IDX_two_factor_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_created_unix" ON public.two_factor USING btree (created_unix);


--
-- Name: IDX_two_factor_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_two_factor_updated_unix" ON public.two_factor USING btree (updated_unix);


--
-- Name: IDX_user_badge_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_badge_user_id" ON public.user_badge USING btree (user_id);


--
-- Name: IDX_user_blocking_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_blocking_created_unix" ON public.user_blocking USING btree (created_unix);


--
-- Name: IDX_user_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_created_unix" ON public."user" USING btree (created_unix);


--
-- Name: IDX_user_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_is_active" ON public."user" USING btree (is_active);


--
-- Name: IDX_user_last_login_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_last_login_unix" ON public."user" USING btree (last_login_unix);


--
-- Name: IDX_user_open_id_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_open_id_uid" ON public.user_open_id USING btree (uid);


--
-- Name: IDX_user_redirect_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_redirect_lower_name" ON public.user_redirect USING btree (lower_name);


--
-- Name: IDX_user_setting_setting_key; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_setting_setting_key" ON public.user_setting USING btree (setting_key);


--
-- Name: IDX_user_setting_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_setting_user_id" ON public.user_setting USING btree (user_id);


--
-- Name: IDX_user_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_user_updated_unix" ON public."user" USING btree (updated_unix);


--
-- Name: IDX_watch_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_watch_created_unix" ON public.watch USING btree (created_unix);


--
-- Name: IDX_watch_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_watch_updated_unix" ON public.watch USING btree (updated_unix);


--
-- Name: IDX_webauthn_credential_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webauthn_credential_created_unix" ON public.webauthn_credential USING btree (created_unix);


--
-- Name: IDX_webauthn_credential_credential_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webauthn_credential_credential_id" ON public.webauthn_credential USING btree (credential_id);


--
-- Name: IDX_webauthn_credential_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webauthn_credential_updated_unix" ON public.webauthn_credential USING btree (updated_unix);


--
-- Name: IDX_webauthn_credential_user_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webauthn_credential_user_id" ON public.webauthn_credential USING btree (user_id);


--
-- Name: IDX_webhook_created_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_created_unix" ON public.webhook USING btree (created_unix);


--
-- Name: IDX_webhook_is_active; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_is_active" ON public.webhook USING btree (is_active);


--
-- Name: IDX_webhook_owner_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_owner_id" ON public.webhook USING btree (owner_id);


--
-- Name: IDX_webhook_repo_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_repo_id" ON public.webhook USING btree (repo_id);


--
-- Name: IDX_webhook_updated_unix; Type: INDEX; Schema: public; Owner: gitea
--

CREATE INDEX "IDX_webhook_updated_unix" ON public.webhook USING btree (updated_unix);


--
-- Name: UQE_access_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_s" ON public.access USING btree (user_id, repo_id);


--
-- Name: UQE_access_token_token_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_access_token_token_hash" ON public.access_token USING btree (token_hash);


--
-- Name: UQE_action_artifact_runid_name_path; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_artifact_runid_name_path" ON public.action_artifact USING btree (run_id, artifact_path, artifact_name);


--
-- Name: UQE_action_run_repo_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_run_repo_index" ON public.action_run USING btree (repo_id, index);


--
-- Name: UQE_action_runner_token_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_runner_token_hash" ON public.action_runner USING btree (token_hash);


--
-- Name: UQE_action_runner_token_token; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_runner_token_token" ON public.action_runner_token USING btree (token);


--
-- Name: UQE_action_runner_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_runner_uuid" ON public.action_runner USING btree (uuid);


--
-- Name: UQE_action_task_output_task_id_output_key; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_task_output_task_id_output_key" ON public.action_task_output USING btree (task_id, output_key);


--
-- Name: UQE_action_task_step_task_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_task_step_task_index" ON public.action_task_step USING btree (task_id, index);


--
-- Name: UQE_action_task_token_hash; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_task_token_hash" ON public.action_task USING btree (token_hash);


--
-- Name: UQE_action_tasks_version_owner_repo; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_tasks_version_owner_repo" ON public.action_tasks_version USING btree (owner_id, repo_id);


--
-- Name: UQE_action_variable_owner_repo_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_action_variable_owner_repo_name" ON public.action_variable USING btree (owner_id, repo_id, name);


--
-- Name: UQE_attachment_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_attachment_uuid" ON public.attachment USING btree (uuid);


--
-- Name: UQE_badge_slug; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_badge_slug" ON public.badge USING btree (slug);


--
-- Name: UQE_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_branch_s" ON public.branch USING btree (repo_id, name);


--
-- Name: UQE_collaboration_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_collaboration_s" ON public.collaboration USING btree (repo_id, user_id);


--
-- Name: UQE_commit_status_index_repo_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_commit_status_index_repo_sha" ON public.commit_status_index USING btree (repo_id, sha);


--
-- Name: UQE_commit_status_repo_sha_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_commit_status_repo_sha_index" ON public.commit_status USING btree (index, repo_id, sha);


--
-- Name: UQE_commit_status_summary_repo_id_sha; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_commit_status_summary_repo_id_sha" ON public.commit_status_summary USING btree (repo_id, sha);


--
-- Name: UQE_dbfs_meta_full_path; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_dbfs_meta_full_path" ON public.dbfs_meta USING btree (full_path);


--
-- Name: UQE_deploy_key_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_deploy_key_s" ON public.deploy_key USING btree (key_id, repo_id);


--
-- Name: UQE_email_address_email; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_email_address_email" ON public.email_address USING btree (email);


--
-- Name: UQE_email_address_lower_email; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_email_address_lower_email" ON public.email_address USING btree (lower_email);


--
-- Name: UQE_email_hash_email; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_email_hash_email" ON public.email_hash USING btree (email);


--
-- Name: UQE_follow_follow; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_follow_follow" ON public.follow USING btree (user_id, follow_id);


--
-- Name: UQE_hook_task_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_hook_task_uuid" ON public.hook_task USING btree (uuid);


--
-- Name: UQE_issue_dependency_issue_dependency; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_dependency_issue_dependency" ON public.issue_dependency USING btree (issue_id, dependency_id);


--
-- Name: UQE_issue_label_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_label_s" ON public.issue_label USING btree (issue_id, label_id);


--
-- Name: UQE_issue_pin_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_pin_s" ON public.issue_pin USING btree (repo_id, issue_id);


--
-- Name: UQE_issue_repo_index; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_repo_index" ON public.issue USING btree (repo_id, index);


--
-- Name: UQE_issue_user_uid_to_issue; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_user_uid_to_issue" ON public.issue_user USING btree (uid, issue_id);


--
-- Name: UQE_issue_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_issue_watch_watch" ON public.issue_watch USING btree (user_id, issue_id);


--
-- Name: UQE_language_stat_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_language_stat_s" ON public.language_stat USING btree (repo_id, language);


--
-- Name: UQE_lfs_meta_object_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_lfs_meta_object_s" ON public.lfs_meta_object USING btree (oid, repository_id);


--
-- Name: UQE_login_source_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_login_source_name" ON public.login_source USING btree (name);


--
-- Name: UQE_oauth2_application_client_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_application_client_id" ON public.oauth2_application USING btree (client_id);


--
-- Name: UQE_oauth2_authorization_code_code; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_authorization_code_code" ON public.oauth2_authorization_code USING btree (code);


--
-- Name: UQE_oauth2_grant_user_application; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_oauth2_grant_user_application" ON public.oauth2_grant USING btree (user_id, application_id);


--
-- Name: UQE_org_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_org_user_s" ON public.org_user USING btree (uid, org_id);


--
-- Name: UQE_package_blob_md5; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_blob_md5" ON public.package_blob USING btree (hash_md5);


--
-- Name: UQE_package_blob_sha1; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_blob_sha1" ON public.package_blob USING btree (hash_sha1);


--
-- Name: UQE_package_blob_sha256; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_blob_sha256" ON public.package_blob USING btree (hash_sha256);


--
-- Name: UQE_package_blob_sha512; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_blob_sha512" ON public.package_blob USING btree (hash_sha512);


--
-- Name: UQE_package_cleanup_rule_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_cleanup_rule_s" ON public.package_cleanup_rule USING btree (owner_id, type);


--
-- Name: UQE_package_file_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_file_s" ON public.package_file USING btree (version_id, lower_name, composite_key);


--
-- Name: UQE_package_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_s" ON public.package USING btree (owner_id, type, lower_name);


--
-- Name: UQE_package_version_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_package_version_s" ON public.package_version USING btree (package_id, lower_version);


--
-- Name: UQE_protected_branch_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_protected_branch_s" ON public.protected_branch USING btree (repo_id, branch_name);


--
-- Name: UQE_pull_auto_merge_pull_id; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_pull_auto_merge_pull_id" ON public.pull_auto_merge USING btree (pull_id);


--
-- Name: UQE_reaction_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_reaction_s" ON public.reaction USING btree (type, issue_id, comment_id, user_id, original_author_id, original_author);


--
-- Name: UQE_release_n; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_release_n" ON public.release USING btree (repo_id, tag_name);


--
-- Name: UQE_repo_archiver_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_archiver_s" ON public.repo_archiver USING btree (repo_id, type, commit_id);


--
-- Name: UQE_repo_license_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_license_s" ON public.repo_license USING btree (repo_id, license);


--
-- Name: UQE_repo_redirect_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repo_redirect_s" ON public.repo_redirect USING btree (owner_id, lower_name);


--
-- Name: UQE_repository_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_repository_s" ON public.repository USING btree (owner_id, lower_name);


--
-- Name: UQE_review_state_pull_commit_user; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_review_state_pull_commit_user" ON public.review_state USING btree (user_id, pull_id, commit_sha);


--
-- Name: UQE_secret_owner_repo_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_secret_owner_repo_name" ON public.secret USING btree (owner_id, repo_id, name);


--
-- Name: UQE_star_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_star_s" ON public.star USING btree (uid, repo_id);


--
-- Name: UQE_system_setting_setting_key; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_system_setting_setting_key" ON public.system_setting USING btree (setting_key);


--
-- Name: UQE_team_invite_team_mail; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_invite_team_mail" ON public.team_invite USING btree (team_id, email);


--
-- Name: UQE_team_repo_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_repo_s" ON public.team_repo USING btree (team_id, repo_id);


--
-- Name: UQE_team_unit_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_unit_s" ON public.team_unit USING btree (team_id, type);


--
-- Name: UQE_team_user_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_team_user_s" ON public.team_user USING btree (team_id, uid);


--
-- Name: UQE_topic_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_topic_name" ON public.topic USING btree (name);


--
-- Name: UQE_two_factor_uid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_two_factor_uid" ON public.two_factor USING btree (uid);


--
-- Name: UQE_upload_uuid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_upload_uuid" ON public.upload USING btree (uuid);


--
-- Name: UQE_user_blocking_block; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_blocking_block" ON public.user_blocking USING btree (blocker_id, blockee_id);


--
-- Name: UQE_user_lower_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_lower_name" ON public."user" USING btree (lower_name);


--
-- Name: UQE_user_name; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_name" ON public."user" USING btree (name);


--
-- Name: UQE_user_open_id_uri; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_open_id_uri" ON public.user_open_id USING btree (uri);


--
-- Name: UQE_user_redirect_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_redirect_s" ON public.user_redirect USING btree (lower_name);


--
-- Name: UQE_user_setting_key_userid; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_user_setting_key_userid" ON public.user_setting USING btree (user_id, setting_key);


--
-- Name: UQE_watch_watch; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_watch_watch" ON public.watch USING btree (user_id, repo_id);


--
-- Name: UQE_webauthn_credential_s; Type: INDEX; Schema: public; Owner: gitea
--

CREATE UNIQUE INDEX "UQE_webauthn_credential_s" ON public.webauthn_credential USING btree (lower_name, user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict WGXwh3Sppd1sqdQi551cnNRgB0LcVHAEn8x9UZqdSmoFhqQFEo6DeUAvPAlFWZa

