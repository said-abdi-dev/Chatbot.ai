select * from topics

UPDATE topics SET subject_name = 'javascript' WHERE topic_id = 4

select * from topics
select * from subjects
rollback;

select topics.chatbot_response from topics 
JOIN subjects on subjects.subject_name = topics.subject_name
WHERE topics.subject_name = 'java' AND topic_name = 'array'

commit;