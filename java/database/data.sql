--any data goes here
--inserts, updates, deletes
--create.
BEGIN TRANSACTION;
--INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
--INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
--makes java, js tables with data

INSERT INTO subjects (subject_name)
VALUES
    ('java'), --1
    ('javascript'), --2
    ('python'), --3
    ('sql'), --4
    ('oop'), --5
    ('mutability'), --6
    ('objectoriented'), --7
    ('datatype'), --8
    ('vue'), --9
    ('help'), --10
    ('random'), --11
    ('postgres'), --12
    ('html'), --13
    ('css'), --14
    ('ide'), --15
    ('npm'), --16
    ('jeff'), --17
    ('muter'), --18
    ('noah'), --19
    ('olsen'), --20
    ('said'), --21
    ('abdi'), --22
    ('shirdon'), -- 23
    ('team'), --24
    ('developers'), --25
    ('elevator'), --26


INSERT INTO responses (response)
VALUES
    ('Java is a widely-used high-level programming language known for its portability and versatility. It is designed to be platform-independent, allowing developers to write code that can run on various systems without modification. Java is popular for its object-oriented programming features and rich standard library. For more information about Java programming, you can visit the official Oracle Java documentation: <br><br><a href="https://docs.oracle.com/en/java/">Learn more about Java</a>.<br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/l9AzO1FMgM8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('In Java, arrays are data structures used to store a collection of elements of the same type. They provide a way to efficiently manage and access multiple values using a single variable. Arrays in Java have a fixed size once they are created, and elements are accessed by their index. To learn more about working with arrays in Java, you can check out this tutorial: <br><br><a href="https://www.w3schools.com/java/java_arrays.asp">Learn more about arrays in Java</a>'),
    ('JavaScript is a dynamic and versatile scripting language primarily used for web development. It enables interactive and dynamic content on websites, enhancing user experience. JavaScript can be executed directly in web browsers, making it an essential tool for front-end development. For more information about JavaScript, you can check out this website: <br><br><a href="https://www.w3schools.com/js/">Learn more about JavaScript</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/DHjqpvDnNGE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Arrays in JavaScript are essential data structures that store a collection of elements. Unlike some programming languages, JavaScript arrays can hold values of different types within the same array. They offer various built-in methods for manipulation and iteration, making them powerful tools for developers. To learn more about arrays in JavaScript, you can check out the MDN Web Docs: <br><br><a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array">https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array</a>. Additionally, if you prefer a video tutorial, you can watch this YouTube video: <a href="https://www.youtube.com/watch?v=8FmBEN0XZyI">https://www.youtube.com/watch?v=8FmBEN0XZyI</a>.'),
    ('Python is a high-level programming language known for its simplicity and readability. It emphasizes code readability and allows programmers to express concepts in fewer lines of code compared to other languages. Python is widely used in various domains including web development, scientific computing, and data analysis. To learn more about Python programming, you can visit the official Python website: <br><br><a href="https://www.python.org/">https://www.python.org/</a>. Additionally, if you are interested in watching a video, you can check out this YouTube tutorial: <a href="https://www.youtube.com/watch?v=mpnBNGOSplA">https://www.youtube.com/watch?v=mpnBNGOSplA</a>.'),
    ('Functions in Python are blocks of reusable code that can be called with arguments. They allow you to modularize your code and make it more organized. Python supports both built-in functions and user-defined functions, providing a powerful way to encapsulate functionality. To explore Python functions further, you can refer to the Python documentation: <br><br><a href="https://docs.python.org/3/tutorial/controlflow.html#defining-functions">https://docs.python.org/3/tutorial/controlflow.html#defining-functions</a>. Additionally, if you are looking for a video explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=l_4ItVEbtp4">https://www.youtube.com/watch?v=l_4ItVEbtp4</a>.'),
    ('SQL (Structured Query Language) is a domain-specific language used to manage and manipulate relational databases. It provides a standardized way to define, query, and manage data stored in a relational database system. To learn more about SQL and its usage, you can check out the W3Schools SQL tutorial: <br><br><a href="https://www.w3schools.com/sql/">Learn more about SQL</a>.<br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/zsjvFFKOm3c" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('In SQL, joins are used to combine rows from two or more tables based on a related column between them. There are different types of joins, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN, each serving different purposes in retrieving and combining data from multiple tables. To understand SQL joins and their usage, you can refer to this guide: <br><br><a href="https://www.w3schools.com/sql/sql_join.asp">Learn more about JOIN in SQL</a>'),
    ('Polymorphism is a concept in object-oriented programming where objects of different classes can be treated as objects of a common superclass. It allows for flexible and extensible code. To delve into the concept of polymorphism in object-oriented programming, you can read this informative article: <br><br><a href="https://stackify.com/oop-concept-polymorphism/">https://stackify.com/oop-concept-polymorphism/</a>. Additionally, if you prefer a video explanation, you can watch this YouTube tutorial: <a href="https://www.youtube.com/watch?v=tIWm3I_Zu7I">https://www.youtube.com/watch?v=tIWm3I_Zu7I</a>.'),
    ('Encapsulation is the practice of bundling data (attributes) and methods (functions) that operate on the data into a single unit (class). It provides data hiding and abstraction. For a detailed understanding of encapsulation and its significance in object-oriented programming, you can visit this resource: <br><br><a href="https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/">https://stackify.com/oop-concept-for-beginners-what-is-encapsulation/</a>. Additionally, you can learn more from this article: <a href="https://www.techtarget.com/searchnetworking/definition/encapsulation">https://www.techtarget.com/searchnetworking/definition/encapsulation</a>.'),
    ('Inheritance allows a class to inherit attributes and behaviors from a parent class. It promotes code reuse and hierarchy in class relationships. To learn more about inheritance in object-oriented programming and its implementation, you can refer to this tutorial: <br><br><a href="https://realpython.com/inheritance-composition-python/">Learn more about inheritance</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/Zs342ePFvRI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Mutability refers to the ability of an object to change its state after creation. Objects with mutable states can be modified, potentially leading to complex interactions and unexpected behavior. To grasp the concept of mutability and its implications, you can read this insightful article:<br><br><a href="https://www.gearbrain.com/why-mutability-essential-data-analytics-2658324758.html">Learn more about mutability here</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/5qQQ3yzbKp8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Immutable objects cannot be changed after creation. For example, strings in many programming languages are immutable.'),
    ('Mutable objects can be modified after creation. Consequences include potential data integrity issues and difficulty in reasoning about code.'),
    ('Primitive types hold simple values directly, like integers, booleans, floating-point numbers(commonly called decimals).'),
    ('Need help with building  an awesome  resume? click here: <a> href = https://www.youtube.com/watch?v=lm6dHeoKcuY</a>'),
    ('Reference types hold references to objects, allowing for more complex data structures.'),
    ('Vue is a progressive JavaScript framework for building user interfaces. It is designed to be approachable and versatile. Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. To learn more about Vue.js and its features, you can check out the official Vue.js documentation: <br><br><a href="https://vuejs.org/">Learn more about Vue.js</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/nhBVL41-_Cw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Vue comes with a set of features including declarative templates, reactivity, component-based architecture, and more. In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application. To understand Vue components and how they work, you can refer to the Vue.js documentation on components: <a href="https://vuejs.org/v2/guide/components.html">Learn more about Vue.js</a>'),
    ('In Vue, components are the basic building blocks. They encapsulate a portion of the user interface and can be reused throughout the application.'),
    ('Vue directives are special attributes used in templates to apply behavior to DOM elements. Examples include v-bind, v-if, and v-for. Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties.'),
    ('Vue offers various mechanisms for managing application state, including Vuex for centralized state management and reactive data properties.'),
    ('Need Help? Here is a list of common questions that you can ask. Please provide a subject and a specific topic. For example: "What is an array in JavaScript?" or "How do functions work in Python?"'),
    ('Unable to read response. Please enter a more specific subject for the topic of '),
    ('Unable to read response. Please enter a more specific topic for the subject of '),
    ('Loops are control structures in Java that repeatedly execute a block of code as long as a specified condition is true. Common types include "for," "while," and "do-while" loops. To create a loop, specify the loop type, condition, and code to be executed within curly braces.'),
    ('NPM (Node Package Manager) is a widely used package manager for JavaScript. It allows developers to easily install, share, and manage libraries, frameworks, and tools necessary for building web applications using Node.js. NPM simplifies dependency management and offers a vast ecosystem of reusable code packages'),
    ('HTML (Hypertext Markup Language) is the standard language for creating and structuring web content. It uses tags to define elements like headings, paragraphs, links, and images. HTML provides the foundation for displaying information and resources on the internet, shaping the structure and layout of web pages.'),
    ('CSS (Cascading Style Sheets) is a styling language used in web development. It defines the visual presentation and layout of HTML elements, enabling control over aspects like colors, fonts, spacing, and positioning. CSS separates design from content, enhancing the aesthetics and user experience of websites and web applications.'),
    ('An IDE (Integrated Development Environment) is a software tool that provides a comprehensive environment for software development. It combines code editing, debugging, testing, and project management features into a single interface, streamlining the coding process and enhancing efficiency for programmers during software creation.'),
    ('Testing in Java ensures code quality by verifying correctness. JUnit, a popular testing framework, simplifies testing with annotations and assertions. It automates test execution, allowing developers to create unit tests for individual methods. This aids in identifying and rectifying issues early in the development process.<br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/X3jw1JVNdPE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Object-Oriented Programming (OOP) is a programming paradigm that organizes code into objects, encapsulating data and behaviors. It promotes concepts like inheritance, encapsulation, and polymorphism, facilitating modular, reusable, and easier-to-maintain code structures. OOP models real-world entities, improving code organization and design.<br><br><a href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object-oriented_programming">Learn more about Object Oriented Programming</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/AjR2Rc9wQ6s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('Jeff Muter:<br><br>Development is more than a hobby, it is a true passion for me. What I love about tech is the ability to constantly learn and never have mastered the field. It keeps me constantly growing, constantly learning. What is more of a call to adventure than that?<br><br><a href="https://jeffmuter.com/">Check out my portfolio page</a>'),
    ('In Java, a "class" serves as a template for creating objects. It defines the objects properties and behaviors, encapsulating them within a reusable structure.'),
    ('A "method" in Java is a block of code within a class that performs a specific task or action. It encapsulates behavior and can be invoked on objects.'),
    ('A "constructor" is a special method in a class that initializes object instances. It runs automatically when an object is created, setting initial values for its properties.'),
    ('The "garbage collector" is a component in Java that automatically manages memory by identifying and reclaiming unused objects, preventing memory leaks and improving program efficiency.<br><br><a href="https://blogs.oracle.com/javamagazine/post/understanding-garbage-collectors">Learn more about the java garbage collector</a><br><br><iframe width="300" height="200" src="https://www.youtube.com/embed/c32zXYAK7CI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>'),
    ('"Input/Output (I/O)" in Java involves reading and writing data from/to external sources like files or streams. It enables communication between a program and its environment.'),
    ('"Override" is a mechanism where a subclass provides a new implementation for a method already defined in its superclass. It allows customizing behavior while maintaining the methods signature.'),
    ('The "Java Virtual Machine (JVM)" is a runtime environment that executes Java bytecode. It abstracts hardware and OS differences, enabling Java programs to run consistently across various platforms.'),
    ('Identifying and fixing errors in JavaScript code using tools like browser consoles, breakpoints, and error messages to ensure the program runs smoothly and as intended.'),
    ('JavaScript has fundamental types like numbers, strings, and booleans, as well as objects and arrays for more complex data structures.'),
    ('A concise way to write conditional expressions with a true/false condition, resulting in one of two specified values depending on the conditions outcome.'),
    ('Code constructs like if, else if, and switch used for making decisions based on conditions and controlling program flow.'),
    ('A programming interface for web documents, allowing JavaScript to interact with HTML and XML, enabling dynamic content manipulation.'),
    ('JavaScript captures and responds to user interactions or occurrences like clicks and keyboard input, enhancing interactivity on web pages.'),
    ('In JavaScript, promises manage asynchronous operations, representing eventual completion or failure of an operation. They enhance code readability and handle callbacks elegantly. Async/Await is a modern syntax built on top of promises, simplifying asynchronous code further by using async functions to write non-blocking code that resembles synchronous style, making asynchronous operations more intuitive and manageable.'),
    ('Functions are blocks of reusable code, while methods are functions attached to objects, often used in object-oriented programming.'),
    ('A function is a self-contained block of code that can accept parameters, execute tasks, and return values, promoting code reusability and modularity in JavaScript applications.'),
    ('Closures are functions that remember the scope in which they were created, allowing them to access variables from their outer function even after that function has finished executing. They play a crucial role in encapsulation, data privacy, and creating modular and maintainable code.'),
    ('Great question!<br><br>This application was built by Jeff Muter, Noah Olsen, Said Abdi, and Abdi Shirdon. This project was built in less than two weeks by the four of them in an Agile environment with periodic presentations with a product owner to deliver features in a high-pressure environment. If you would like to know more about the team, type which member you would like more info about!'),
    ('Of course! Jeff Muter worked across the whole application. The notable parts of the application he developed was developing the ability for the API to remember subjects or topics to allow for users to have more authentic interractions with the Chatbot. He also developed the original database design, and developed the profile pricture functionality. Jeff found this part of the application especially fun as he never used local storage to save information about a user between uses of the site without a user logging in.'),
    ('Yes, Noah Olsen worked accross the entire application. He played a crucial role in both the front and back-end of the application. He really honed his ability to find and use Axios to create quick and free functionality with APIs. Most notably, Noah built out the audio functionality, recording user voices, and creating a speaker to play back previous messages from the chatbot.'),
    ('I am glad you asked! Said Abdi had a hand in both the front and back-end of the application. He was originally adamant to stick to what he was familiar with, which was Java & Spring Boot in the back-end. However, over the course of the project, Said truly grew into building crucial functionality in the front-end, most notably, the suggestions that the database provides when the user is close to providing a valid subject.'),
    ('Abdi Shirdon worked primarily on the front-end of the application. Notably building out the camera functionality, and developing the majority of the styling.'),
    ('Great question! Tech Elevator is a company with a mission to provide the best talent to the tech industry! By providing a rigorous curriculum, Java or C#, and Vue.js on the front-end. By selecting strong students, and pairing them with instructors with decades fo experience, Tech Elevator has developed an impressive reputation for not only finding great students, but being able to support those students dreams of being able to enter the tech industry.');


INSERT INTO topics (topic_name, subject_name, response_id)
VALUES
   ('define', 'java', 1),
   ('loop', 'java', 26),
   ('junit', 'java', 31),
   ('what', 'java', 1),
   ('about', 'java', 1),
   ('definition', 'java', 1),
   ('what is', 'java', 1),
   ('whats', 'java', 1),
   ('class', 'java', 34),
   ('method', 'java', 35),
   ('constructor', 'java', 36),
   ('garbage collector', 'java', 37),
   ('garbage collection', 'java', 37),
   ('io', 'java', 38),
   ('override', 'java', 39),
   ('jvm', 'java', 40),
   ('test', 'java', 31),
   ('array', 'java', 2),
   ('what is', 'javascript', 3),
   ('what', 'javascript', 3),
   ('about', 'javascript', 3),
   ('define', 'javascript', 3),
   ('definition', 'javascript', 3),
   ('array', 'javascript', 4),
   ('debug', 'javascript', 41),
   ('debugging', 'javascript', 41),
   ('data', 'javascript', 42),
   ('ternary', 'javascript', 44),
   ('conditional', 'javascript', 44),
   ('condition', 'javascript', 44),
   ('dom', 'javascript', 45),
   ('event', 'javascript', 46),
   ('events', 'javascript', 46),
   ('promise', 'javascript', 47),
   ('promises', 'javascript', 47),
   ('async', 'javascript', 47),
   ('function method', 'javascript', 48),
   ('function', 'javascript', 49),
   ('closure', 'javascript', 50),
   ('closures', 'javascript', 50),
   ('what is', 'python', 5),
   ('what', 'python', 5),
   ('define', 'python', 5),
   ('definition', 'python', 5),
   ('functions', 'python', 6),
   ('what is', 'sql', 7),
   ('about', 'sql', 7),
   ('what', 'sql', 7),
   ('define', 'sql', 7),
   ('definition', 'sql', 7),
   ('join', 'sql', 8),
   -- ('query', 'sql', ?)
   ('what is', 'oop', 32),
   ('about', 'oop', 32),
   ('what', 'oop', 32),
   ('define', 'oop', 32),
   ('definition', 'oop', 32),
   ('polymorphism', 'oop', 9),
   ('encapsulation', 'oop', 10),
   ('inheritance', 'oop', 11),
  -- ('abstraction', 'oop', ?)
--   ('polymorphism', 'objectoriented', 9), these dont work unless we add multi word subjects
--   ('encapsulation', 'objectoriented', 10),
--   ('inheritance', 'objectoriented', 11),
--     ('abstraction', 'objectoriented', ?)
   ('mutability', 'mutability', 12),
   ('object', 'mutability', 13),
   ('object', 'mutability', 14),
   ('primitive type', 'datatype', 15),
   ('reference type', 'datatype', 16),
   ('what is', 'vue', 18),
   ('about', 'vue', 18),
   ('what', 'vue', 18),
   ('define', 'vue', 18),
   ('definition', 'vue', 18),
   ('features', 'vue', 19),
   ('components', 'vue', 20),
   ('directives', 'vue', 21),
   ('state management', 'vue', 22),
   ('management of state', 'vue', 22),
   ('managing state', 'vue', 22),
   ('help','help', 28),
   ('what is', 'html', 28),
   ('what', 'html', 28),
   ('define', 'html', 28),
   ('about', 'html', 28),
   ('definition', 'html', 28),
   ('what is', 'html', 29),
   ('what', 'html', 29),
   ('define', 'html', 29),
   ('about', 'html', 29),
   ('definition', 'html', 29),
   ('what', 'ide', 30),
   ('jeff', 'jeff', 33),
   ('muter', 'muter', 33),
   ('jeff', 'team', 52),
   ('jeff', 'developers', 52),
   ('noah', 'team', 53),
   ('noah', 'developers', 53),
   ('said', 'team', 54),
   ('said', 'developers', 54),
   ('abdi', 'team', 55),
   ('abdi', 'developers', 55),
   ('elevator', 'elevator', 56);

COMMIT;

