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

UPDATE responses
SET response =
    'Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library. For more information about Java programming, you can visit the official Oracle Java documentation: <a href="https://docs.oracle.com/en/java/">https://docs.oracle.com/en/java/</a>'
WHERE response_id = 1;

UPDATE responses
SET response =
    'In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index. To learn more about working with arrays in Java, you can check out this tutorial: <a href="https://www.w3schools.com/java/java_arrays.asp">https://www.w3schools.com/java/java_arrays.asp</a>'
WHERE response_id = 2;

UPDATE responses
SET response =
    'JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development. For more information about JavaScript, you can check out this website: <a href="https://www.w3schools.com/js/">https://www.w3schools.com/js/</a>'
WHERE response_id = 3;

UPDATE responses
SET response =
    'Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers. To learn more about arrays in JavaScript, you can check out the MDN Web Docs: <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array</a>'
WHERE response_id = 4;

UPDATE responses
SET response =
    'Python is a high-level programming language known for its simplicity and readability. It emphasizes code readability and allows programmers to express concepts in fewer lines of code compared to other languages. Python is widely used in various domains including web development, scientific computing, and data analysis. To learn more about Python programming, you can visit the official Python website: <a href="https://www.python.org/">https://www.python.org/</a>'
WHERE response_id = 5;

UPDATE responses
SET response =
    'Functions in Python are blocks of reusable code that can be called with arguments. They allow you to modularize your code and make it more organized. Python supports both built-in functions and user-defined functions, providing a powerful way to encapsulate functionality. To explore Python functions further, you can refer to the Python documentation: <a href="https://docs.python.org/3/tutorial/controlflow.html#defining-functions">https://docs.python.org/3/tutorial/controlflow.html#defining-functions</a>'
WHERE response_id = 6;

UPDATE responses
SET response =
    'SQL (Structured Query Language) is a domain-specific language used to manage and manipulate relational databases. It provides a standardized way to define, query, and manage data stored in a relational database system. To learn more about SQL and its usage, you can check out the W3Schools SQL tutorial: <a href="https://www.w3schools.com/sql/">https://www.w3schools.com/sql/</a>'
WHERE response_id = 7;

UPDATE responses
SET response =
    'In SQL, joins are used to combine rows from two or more tables based on a related column between them. There are different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN, each serving different purposes in retrieving and combining data from multiple tables. To understand SQL joins and their usage, you can refer to this guide: <a href="https://www.w3schools.com/sql/sql_join.asp">https://www.w3schools.com/sql/sql_join.asp</a>'
WHERE response_id = 8;

UPDATE responses
SET response =
    'Polymorphism is a concept in object-oriented programming where objects of different classes can be treated as objects of a common superclass. It allows for flexible and extensible code. To delve into the concept of polymorphism in object-oriented programming, you can read this informative article: <a href="https://stackify.com/oop-concept-polymorphism/">https://stackify.com/oop-concept-polymorphism/</a>'
WHERE response_id = 9;

UPDATE responses
SET response =
    'Encapsulation is the practice of bundling data (attributes) and methods (functions) that operate on the data into a single unit (class). It provides data hiding and abstraction. For a detailed understanding of encapsulation and its significance in object-oriented programming, you can visit this resource: <a href="https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/">https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/</a>'
WHERE response_id = 10;

UPDATE responses
SET response =
    'Inheritance allows a class to inherit attributes and behaviors from a parent class. It promotes code reuse and hierarchy in class relationships. To learn more about inheritance in object-oriented programming and its implementation, you can refer to this tutorial: <a href="https://realpython.com/inheritance-composition-python/">https://realpython.com/inheritance-composition-python/</a>'
WHERE response_id = 11;

UPDATE responses
SET response =
    'Mutability refers to the ability of an object to change its state after creation. Objects with mutable states can be modified, potentially leading to complex interactions and unexpected behavior. To grasp the concept of mutability and its implications, you can read this insightful article: <a href="https://medium.com/@meghamohan/mutable-and-immutable-side-of-python-c2145cf72747/">https://medium.com/@meghamohan/mutable-and-immutable-side-of-python-c2145cf72747/</a>'
WHERE response_id = 12;

UPDATE responses
SET response =
    'Vue is a progressive JavaScript framework for building user interfaces. It is designed to be approachable and versatile. Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. To learn more about Vue.js and its features, you can check out the official Vue.js documentation: <a href="https://vuejs.org/">https://vuejs.org/</a>'
WHERE response_id = 21;

UPDATE responses
SET response =
    'Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application. To understand Vue components and how they work, you can refer to the Vue.js documentation on components: <a href="https://vuejs.org/v2/guide/components.html">https://vuejs.org/v2/guide/components.html</a>'
WHERE response_id = 22;

UPDATE responses
SET response =
    'Vue directives are special attributes used in templates to apply behavior to DOM elements. Examples include v-bind, v-if, and v-for. Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties. To learn more about Vue directives and state management, you can explore the Vue.js documentation on directives and state management: <a href="https://vuejs.org/v2/guide/directives.html">https://vuejs.org/v2/guide/directives.html</a>'
WHERE response_id = 23;











COMMIT;