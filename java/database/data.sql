--any data goes here
--inserts, updates, deletes

--create.

BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');



--makes java, js tables with data

INSERT INTO subjects (subject_name) VALUES ('java');
INSERT INTO subjects (subject_name) VALUES ('javascript');

-- Insert statements for topics
INSERT INTO topics (topic_name, chatbot_response, subject_name)
VALUES
    ('definition', 'Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library.', 'java'),
    ('array', 'In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index.', 'java'),
    ('definition', 'JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development.', 'javascript'),
    ('array', 'Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers.', 'javascript');

COMMIT;

