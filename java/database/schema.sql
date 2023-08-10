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

--any data goes here
--inserts, updates, deletes

--create.

BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

--makes java, js tables with data

INSERT INTO subjects (subject_name)
VALUES
    ('java'),
    ('javascript'),
    ('python'),
    ('sql'),
    ('oop'),
    ('mutability'),
    ('objectoriented'),
    ('datatype'),
    ('vue'),
    ('help'),
    ('subjectnotfound'),
   ('random');

INSERT INTO responses (response)
VALUES
    ('Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library.'),
    ('In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index.'),
    ('JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development.'),
    ('Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers.'),
    ('Python is a high-level programming language known for its simplicity and readability. It emphasizes code readability and allows programmers to express concepts in fewer lines of code compared to other languages. Python is widely used in various domains including web development, scientific computing, and data analysis.'),
    ('Functions in Python are blocks of reusable code that can be called with arguments. They allow you to modularize your code and make it more organized. Python supports both built-in functions and user-defined functions, providing a powerful way to encapsulate functionality.'),
    ('SQL (Structured Query Language) is a domain-specific language used to manage and manipulate relational databases. It provides a standardized way to define, query, and manage data stored in a relational database system.'),
    ('An SQL (Structured Query Language) query is a command used to retrieve, manipulate, or manage data in a relational database. SQL queries are written in a specific syntax that allows you to communicate with the database management system (DBMS) and perform various operations on the data stored in the database. SQL is the standard language for interacting with relational databases, and it is used for tasks such as retrieving data, inserting new records, updating existing records, and deleting records.'),
    ('In SQL, joins are used to combine rows from two or more tables based on a related column between them. There are different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN, each serving different purposes in retrieving and combining data from multiple tables.'),
    ('Polymorphism is a concept in object-oriented programming where objects of different classes can be treated as objects of a common superclass. It allows for flexible and extensible code.'),
    ('Encapsulation is the practice of bundling data (attributes) and methods (functions) that operate on the data into a single unit (class). It provides data hiding and abstraction.'),
    ('Inheritance allows a class to inherit attributes and behaviors from a parent class. It promotes code reuse and hierarchy in class relationships.'),
    ('Mutability refers to the ability of an object to change its state after creation.'),
    ('Immutable objects cannot be changed after creation. For example, strings in many programming languages are immutable.'),
    ('Mutable objects can be modified after creation. Consequences include potential data integrity issues and difficulty in reasoning about code.'),
    ('Primitive types hold simple values directly, like integers or floating-point numbers.'),
    ('Reference types hold references to objects, allowing for more complex data structures.'),
    ('Primitive types are usually stored in the stack, while reference types (objects) are stored in the heap.'),
    ('Vue is a progressive JavaScript framework for building user interfaces. It is designed to be approachable and versatile.'),
    ('Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more.'),
    ('In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application.'),
    ('Vue directives are special attributes used in templates to apply behavior to DOM elements. Examples include v-bind, v-if, and v-for.'),
    ('Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties.'),
    ('Need Help? Here are a list of common questions that you can ask. Please add a subject, and a specific topic What is an array in javascript? What are functions in python? What is the definition of javascript? What are joins in sql?'),
    ('Unable to read response. Please enter a more specific subject for the topic of '),
    ('Unable to read response. Please enter a more specific topic for the subject of ');

INSERT INTO topics (topic_name, subject_name, response_id)
VALUES
   ('whatis', 'java', 1),
   ('what', 'java', 1),
   ('define', 'java', 1),
   ('definition', 'java', 1),
   ('array', 'java', 2),
    ('whatis', 'javascript', 3),
    ('what', 'javascript', 3),
    ('define', 'javascript', 3),
    ('definition', 'javascript', 3),
    ('array', 'python', 4),
   ('whatis', 'python', 5),
    ('what', 'python', 5),
    ('define', 'python', 5),
    ('definition', 'python', 5),
    ('functions', 'python', 6),
   ('whatis', 'python', 7),
    ('what', 'python', 7),
    ('define', 'python', 7),
    ('definition', 'python', 7),
   ('whatis', 'python', 7),
    ('what', 'python', 7),
    ('define', 'python', 7),
    ('definition', 'python', 7),
    ('whatis', 'sql', 7),
    ('what', 'sql', 7),
    ('define', 'sql', 7),
    ('definition', 'sql', 7),
    ('queries', 'sql', 8),
    ('joins', 'sql', 9),
    ('polymorphism', 'oop', 10),
    ('encapsulation', 'oop', 11),
    ('inheritance', 'oop', 12),
    ('polymorphism', 'objectoriented', 10),
    ('encapsulation', 'objectoriented', 11),
    ('inheritance', 'objectoriented', 12),
    ('mutability', 'mutability', 13),
    ('immutable Objects', 'mutability', 14),
    ('mutable Objects', 'mutability', 15),
    ('primitive Types', 'datatype', 16),
    ('reference Types', 'datatype', 17),
    ('memory Allocation', 'datatype', 18),
    ('whatis', 'vue', 19),
    ('what', 'vue', 19),
    ('define', 'vue', 19),
    ('definition', 'vue', 19),
    ('features', 'vue', 20),
    ('components', 'vue', 21),
    ('directives', 'vue', 22),
    ('statemanagement', 'vue', 23),
    ('managementofstate', 'vue', 23),
    ('managingstate', 'vue', 23),
    ('help','help', 24),
    ('subjectnotfound', 'subjectnotfound', 25),
   ('topicnotfound', 'random', 26);

COMMIT;