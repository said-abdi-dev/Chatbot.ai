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

INSERT INTO subjects (subject_name)
VALUES
    ('oop');

INSERT INTO topics (topic_name, subject_name)
VALUES
    ('polymorphism', 'oop'),
    ('encapsulation', 'oop'),
    ('inheritance', 'oop');

INSERT INTO responses (topic_id, response)
VALUES
    (9, 'Polymorphism is a concept in object-oriented programming where objects of different classes can be treated as objects of a common superclass. It allows for flexible and extensible code.'),
    (10, 'Encapsulation is the practice of bundling data (attributes) and methods (functions) that operate on the data into a single unit (class). It provides data hiding and abstraction.'),
    (11, 'Inheritance allows a class to inherit attributes and behaviors from a parent class. It promotes code reuse and hierarchy in class relationships.');

-- Insert data related to mutability
INSERT INTO subjects (subject_name)
VALUES
    ('mutability');

INSERT INTO topics (topic_name, subject_name)
VALUES
    ('mutability', 'mutability'),
    ('immutable Objects', 'mutability'),
    ('mutable Objects', 'mutability');

INSERT INTO responses (topic_id, response)
VALUES
    (12, 'Mutability refers to the ability of an object to change its state after creation.'),
    (13, 'Immutable objects cannot be changed after creation. For example, strings in many programming languages are immutable.'),
    (14, 'Mutable objects can be modified after creation. Consequences include potential data integrity issues and difficulty in reasoning about code.');

-- Continue with similar insert statements for other topics...

INSERT INTO subjects (subject_name)
VALUES
    ('types');

INSERT INTO topics (topic_name, subject_name)
VALUES
    ('primitive Types', 'types'),
	('reference Types', 'types'),
    ('memory Allocation', 'types');

INSERT INTO responses (topic_id, response)
VALUES
    (15, 'Primitive types hold simple values directly, like integers or floating-point numbers.'),
    (16, 'Reference types hold references to objects, allowing for more complex data structures.'),
    (17, 'Primitive types are usually stored in the stack, while reference types (objects) are stored in the heap.');

-- Inserts of help message


INSERT INTO subjects (subject_name)
VALUES ('help');

INSERT INTO topics (topic_name, subject_name)
VALUES ('help','help');

INSERT INTO responses (topic_id, response)
VALUES ( 'Need Help? Here are a list of common questions that you can ask. Please add a subject, and a specific topic What is an array in javascript? What are functions in python? What is the definition of javascript? What are joins in sql?');




COMMIT;



