select * from topics
select * from subjects

select * from


rollback
begin transaction

ALTER TABLE subjects
ADD COLUMN
subject_name varchar(50) UNIQUE 

UPDATE subjects SET subject_name = 'javascript' WHERE subject_id = 2;

ALTER TABLE topics 
ADD COLUMN
subject_name 
commit




begin transaction

UPDATE topics SET subject_name = 'javascript' WHERE topic_id = 4

commit
rollback