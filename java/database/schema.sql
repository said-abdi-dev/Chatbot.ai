-- table creations go HERE
-- no data

-- run sh create.sh command, anytime database changes
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS responses CASCADE;
DROP TABLE IF EXISTS topics CASCADE;

CREATE TABLE users (
   user_id SERIAL PRIMARY KEY,
   username varchar(50) NOT NULL UNIQUE,
   password_hash varchar(200) NOT NULL,
   role varchar(50) NOT NULL
);

CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    subject_name varchar(50) UNIQUE
);

CREATE TABLE responses (
    response_id SERIAL PRIMARY KEY,
    response TEXT NOT NULL
);

CREATE TABLE topics (
    topic_id SERIAL PRIMARY KEY,
    topic_name varchar(255) NOT NULL,
    subject_name varchar(50) REFERENCES subjects (subject_name),
    response_id INTEGER REFERENCES responses (response_id)
);