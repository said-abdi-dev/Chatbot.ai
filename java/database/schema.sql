-- table creations go HERE
--no data

--run sh create.sh command, anytime database changes
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS topics CASCADE;
DROP TABLE IF EXISTS responses CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE subjects
(
    subject_id SERIAL NOT NULL,
    subject_name character varying(50),
    CONSTRAINT subjects_pkey PRIMARY KEY (subject_id),
    CONSTRAINT subjects_subject_name_key UNIQUE (subject_name)
);
CREATE TABLE topics
(
    topic_id SERIAL NOT NULL,
    topic_name character varying(255) NOT NULL,
    subject_name character varying(50) NOT NULL,
    CONSTRAINT topics_pkey PRIMARY KEY (topic_id),
    CONSTRAINT fk_subject_name FOREIGN KEY (subject_name)
        REFERENCES subjects (subject_name)
);
CREATE TABLE responses
(
    response_id SERIAL NOT NULL,
    topic_id INTEGER,
    response TEXT NOT NULL,

    CONSTRAINT response_pkey PRIMARY KEY (response_id),
    CONSTRAINT fk_topic_id FOREIGN KEY (topic_id)
        REFERENCES topics (topic_id)
)
--same for other table