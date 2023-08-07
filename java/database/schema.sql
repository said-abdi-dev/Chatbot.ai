-- table creations go HERE
--no data

--run sh create.sh command, anytime database changes
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS topics CASCADE;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE subjects
(
    subject_id serial NOT NULL,
    subject_name character varying(50),
    CONSTRAINT subjects_pkey PRIMARY KEY (subject_id),
    CONSTRAINT subjects_subject_name_key UNIQUE (subject_name)
);
CREATE TABLE topics
(
    topic_id serial NOT NULL,
    topic_name character varying(255) NOT NULL,
    chatbot_response text NOT NULL,
    subject_name character varying(50) NOT NULL,
    CONSTRAINT topics_pkey PRIMARY KEY (topic_id),
    CONSTRAINT fk_subject_name FOREIGN KEY (subject_name)
        REFERENCES subjects (subject_name)
)
--same for other table