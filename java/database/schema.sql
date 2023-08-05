
select * from topics
select * from subjects

select * from subjects
JOIN topics on subjects.subject_id = topics.topic_id
WHERE subject_name = 'Java'