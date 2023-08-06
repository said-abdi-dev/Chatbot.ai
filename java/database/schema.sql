BEGIN TRANSACTION;

DROP TABLE IF EXISTS subjects, topics;
DROP SEQUENCE IF EXISTS seq_user_id, seq_account_id, seq_transfer_id;




COMMIT;






-- This SQL script creates the "chatbot" database
CREATE DATABASE chatbot;

-- Create the "subjects" table
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    subject_name VARCHAR(255) UNIQUE NOT NULL
);

-- Create the "topics" table
CREATE TABLE topics (
    id SERIAL PRIMARY KEY,
    subject_name VARCHAR(255) REFERENCES subjects(subject_name),
    topic_name VARCHAR(255) NOT NULL,
    responses TEXT
);

-- Insert data into the "subjects" table
INSERT INTO subjects (subject_name) VALUES
    ('java'),
    ('javascript');

-- Insert data into the "topics" table
INSERT INTO topics (subject_id, topic_name, responses) VALUES
    (java, 'definition', 'Java is a versatile and widely-used programming language that follows the principles of object-oriented programming (OOP). It was developed by Sun Microsystems (now owned by Oracle Corporation) and released in 1995. Java is known for its "write once, run anywhere" capability, meaning that Java code can be compiled into platform-independent bytecode and executed on any device with a Java Virtual Machine (JVM). Java is commonly used for building a wide range of applications, from desktop software to web applications and mobile apps.'),
    (java, 'array', 'In Java, an array is a data structure that allows you to store multiple values of the same data type in a single variable. Arrays provide a way to efficiently manage and access collections of elements. Each element in an array is accessed using an index, which represents the position of the element within the array. Arrays are an essential part of Java programming and are used extensively for various tasks.'),
    (javascript, 'definition', 'JavaScript is a dynamic programming language primarily used for adding interactivity and behavior to web pages. It was created by Brendan Eich at Netscape Communications in the mid-1990s. Unlike Java, JavaScript is not related to Java in terms of syntax or functionality. JavaScript is mainly used in web development to create dynamic content, control the Document Object Model (DOM), and enable client-side interactions. With the advent of technologies like Node.js, JavaScript can now be used for server-side programming as well, allowing developers to create full-stack applications using a single language.'),
    (javascript, 'array', 'In JavaScript, an array is a data structure that allows you to store multiple values of different data types in a single variable. Arrays are dynamic and versatile, and they are commonly used to store collections of items, such as numbers, strings, objects, or even other arrays. Arrays in JavaScript have a flexible structure, making them a fundamental part of the language for managing and manipulating data.');