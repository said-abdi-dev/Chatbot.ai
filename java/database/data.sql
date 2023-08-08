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
INSERT INTO topics (topic_name, subject_name)
VALUES
    ('definition', 'java'),
    ('array', 'java'),
    ('definition', 'javascript'),
    ('array', 'javascript');


INSERT INTO responses (topic_id, response)
VALUES 
    (1, 'Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library.'),
    (2, 'In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index.'),
    (3, 'JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development.'),
    (4, 'Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers.');

-- Inserts from 8/8/2023, 1:32pm

INSERT INTO subjects (subject_name)
VALUES
    ('python'),
    ('sql');

-- Additional topics
INSERT INTO topics (topic_name, subject_name)
VALUES
    ('basics', 'python'),
    ('functions', 'python'),
    ('queries', 'sql'),
    ('joins', 'sql');

-- Additional responses
INSERT INTO responses (topic_id, response)
VALUES
    (5, 'Python is a high-level programming language known for its simplicity and readability. It emphasizes code readability and allows programmers to express concepts in fewer lines of code compared to other languages. Python is widely used in various domains including web development, scientific computing, and data analysis.'),
    (6, 'Functions in Python are blocks of reusable code that can be called with arguments. They allow you to modularize your code and make it more organized. Python supports both built-in functions and user-defined functions, providing a powerful way to encapsulate functionality.'),
    (7, 'SQL (Structured Query Language) is a domain-specific language used to manage and manipulate relational databases. It provides a standardized way to define, query, and manage data stored in a relational database system.'),

    (8, 'In SQL, joins are used to combine rows from two or more tables based on a related column between them. There are different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN, each serving different purposes in retrieving and combining data from multiple tables.');
COMMIT;



