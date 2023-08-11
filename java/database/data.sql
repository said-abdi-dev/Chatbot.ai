--any data goes here
--inserts, updates, deletes

--create.

BEGIN TRANSACTION;

--INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

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
    ('topicnotfound'),
    ('random');

INSERT INTO responses (response)
VALUES

    ('Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library. For more information about Java programming, you can visit the official Oracle Java documentation: <a href="https://docs.oracle.com/en/java/">https://docs.oracle.com/en/java/</a>. Additionally, if you are interested in watching a video, you can check out this YouTube link: <a href="https://www.youtube.com/watch?v=mG4NLNZ37y4">https://www.youtube.com/watch?v=mG4NLNZ37y4</a>.'),
    ('In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index. To learn more about working with arrays in Java, you can check out this tutorial: <a href="https://www.w3schools.com/java/java_arrays.asp">https://www.w3schools.com/java/java_arrays.asp</a>. Additionally, if you prefer a video explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=2BM7VuASaJI">https://www.youtube.com/watch?v=2BM7VuASaJI</a>.'),
    ('JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development. For more information about JavaScript, you can check out this website: <a href="https://www.w3schools.com/js/">https://www.w3schools.com/js/</a>. Additionally, if you prefer a video introduction, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=W6NZfCO5SIk">https://www.youtube.com/watch?v=W6NZfCO5SIk</a>.'),
    ('Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers. To learn more about arrays in JavaScript, you can check out the MDN Web Docs: <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array</a>. Additionally, if you prefer a video tutorial, you can watch this YouTube video: <a href="https://www.youtube.com/watch?v=8FmBEN0XZyI">https://www.youtube.com/watch?v=8FmBEN0XZyI</a>.'),
    ('Python is a high-level programming language known for its simplicity and readability. It emphasizes code readability and allows programmers to express concepts in fewer lines of code compared to other languages. Python is widely used in various domains including web development, scientific computing, and data analysis. To learn more about Python programming, you can visit the official Python website: <a href="https://www.python.org/">https://www.python.org/</a>. Additionally, if you are interested in watching a video, you can check out this YouTube tutorial: <a href="https://www.youtube.com/watch?v=mpnBNGOSplA">https://www.youtube.com/watch?v=mpnBNGOSplA</a>.'),
    ('Functions in Python are blocks of reusable code that can be called with arguments. They allow you to modularize your code and make it more organized. Python supports both built-in functions and user-defined functions, providing a powerful way to encapsulate functionality. To explore Python functions further, you can refer to the Python documentation: <a href="https://docs.python.org/3/tutorial/controlflow.html#defining-functions">https://docs.python.org/3/tutorial/controlflow.html#defining-functions</a>. Additionally, if you are looking for a video explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=l_4ItVEbtp4">https://www.youtube.com/watch?v=l_4ItVEbtp4</a>.'),
    ('SQL (Structured Query Language) is a domain-specific language used to manage and manipulate relational databases. It provides a standardized way to define, query, and manage data stored in a relational database system. To learn more about SQL and its usage, you can check out the W3Schools SQL tutorial: <a href="https://www.w3schools.com/sql/">https://www.w3schools.com/sql/</a>. Additionally, if you are interested in watching a video, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=pFq1pgli0OQ">https://www.youtube.com/watch?v=pFq1pgli0OQ</a>.'),
    ('In SQL, joins are used to combine rows from two or more tables based on a related column between them. There are different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN, each serving different purposes in retrieving and combining data from multiple tables. To understand SQL joins and their usage, you can refer to this guide: <a href="https://www.w3schools.com/sql/sql_join.asp">https://www.w3schools.com/sql/sql_join.asp</a>. Additionally, if you are looking for a visual explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=DE6zMthcAEI">https://www.youtube.com/watch?v=DE6zMthcAEI</a>.'),
    ('Polymorphism is a concept in object-oriented programming where objects of different classes can be treated as objects of a common superclass. It allows for flexible and extensible code. To delve into the concept of polymorphism in object-oriented programming, you can read this informative article: <a href="https://stackify.com/oop-concept-polymorphism/">https://stackify.com/oop-concept-polymorphism/</a>. Additionally, if you prefer a video explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=tIWm3I_Zu7I">https://www.youtube.com/watch?v=tIWm3I_Zu7I</a>.'),
    ('Encapsulation is the practice of bundling data (attributes) and methods (functions) that operate on the data into a single unit (class). It provides data hiding and abstraction. For a detailed understanding of encapsulation and its significance in object-oriented programming, you can visit this resource: <a href="https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/">https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/</a>. Additionally, you can learn more from this article: <a href="https://www.techtarget.com/searchnetworking/definition/encapsulation">https://www.techtarget.com/searchnetworking/definition/encapsulation</a>.'),
    ('Inheritance allows a class to inherit attributes and behaviors from a parent class. It promotes code reuse and hierarchy in class relationships. To learn more about inheritance in object-oriented programming and its implementation, you can refer to this tutorial: <a href="https://realpython.com/inheritance-composition-python/">https://realpython.com/inheritance-composition-python/</a>. Additionally, if you are looking for a video tutorial, you can watch this YouTube video: <a href="https://www.youtube.com/watch?v=0oFNaht1Hpo">https://www.youtube.com/watch?v=0oFNaht1Hpo</a>.'),
    ('Mutability refers to the ability of an object to change its state after creation. Objects with mutable states can be modified, potentially leading to complex interactions and unexpected behavior. To grasp the concept of mutability and its implications, you can read this insightful article: <a href="https://medium.com/@meghamohan/mutable-and-immutable-side-of-python-c2145cf72747/">https://medium.com/@meghamohan/mutable-and-immutable-side-of-python-c2145cf72747/</a>. Additionally, you can learn more from this article: <a href="https://www.mygreatlearning.com/blog/understanding-mutable-and-immutable-in-python/">https://www.mygreatlearning.com/blog/understanding-mutable-and-immutable-in-python/</a>.'),
    ('Immutable objects cannot be changed after creation. For example, strings in many programming languages are immutable.'),
    ('Mutable objects can be modified after creation. Consequences include potential data integrity issues and difficulty in reasoning about code.'),
    ('Primitive types hold simple values directly, like integers or floating-point numbers.'),
    ('Need help with building  an awesome  resume? click here: <a> href = https://www.youtube.com/watch?v=lm6dHeoKcuY</a>'),
    ('Reference types hold references to objects, allowing for more complex data structures.'),
    ('Vue is a progressive JavaScript framework for building user interfaces. It is designed to be approachable and versatile. Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. To learn more about Vue.js and its features, you can check out the official Vue.js documentation: <a href="https://vuejs.org/">https://vuejs.org/</a>. Additionally, if you prefer a video introduction, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=VpB0eVZir8U">https://www.youtube.com/watch?v=VpB0eVZir8U</a>.'),
    ('Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application. To understand Vue components and how they work, you can refer to the Vue.js documentation on components: <a href="https://vuejs.org/v2/guide/components.html">https://vuejs.org/v2/guide/components.html</a>. Additionally, if you are looking for a video tutorial, you can watch this YouTube video: <a href="https://www.youtube.com/watch?v=gL47rcvC-jA">https://www.youtube.com/watch?v=gL47rcvC-jA</a>.'),
    ('In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application.'),
    ('Vue directives are special attributes used in templates to apply behavior to DOM elements. Examples include v-bind, v-if, and v-for. Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties.'),
    ('Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties.'),
    ('Need Help? Here is a list of common questions that you can ask. Please provide a subject and a specific topic. For example: "What is an array in JavaScript?" or "How do functions work in Python?"'),
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
    ('array', 'javascript', 4),
   ('whatis', 'python', 5),
    ('what', 'python', 5),
    ('define', 'python', 5),
    ('definition', 'python', 5),
    ('functions', 'python', 6),
    ('whatis', 'sql', 7),
    ('what', 'sql', 7),
    ('define', 'sql', 7),
    ('definition', 'sql', 7),
    ('joins', 'sql', 8),
    ('polymorphism', 'oop', 9),
    ('encapsulation', 'oop', 10),
    ('inheritance', 'oop', 11),
    ('polymorphism', 'objectoriented', 9),
    ('encapsulation', 'objectoriented', 10),
    ('inheritance', 'objectoriented', 11),
    ('mutability', 'mutability', 12),
    ('immutable Objects', 'mutability', 13),
    ('mutable Objects', 'mutability', 14),
    ('primitive Types', 'datatype', 15),
    ('reference Types', 'datatype', 16),
    ('whatis', 'vue', 17),
    ('what', 'vue', 17),
    ('define', 'vue', 17),
    ('definition', 'vue', 17),
    ('features', 'vue', 18),
    ('components', 'vue', 19),
    ('directives', 'vue', 20),
    ('statemanagement', 'vue', 21),
    ('managementofstate', 'vue', 21),
    ('managingstate', 'vue', 21),
    ('help','help', 22),
    ('subjectnotfound', 'subjectnotfound', 23),
    ('topicnotfound', 'topicnotfound', 24);

COMMIT;

