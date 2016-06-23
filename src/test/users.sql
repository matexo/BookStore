INSERT INTO role(user_id , role) VALUES (null , 'USER_ROLE');
INSERT INTO users(id , role_id , activated , email , password , token , username , acv_time_stamp)
VALUES (1 , 1 , FALSE , 'test@test.pl' , 'testtest' , 'test' , 'test' , to_date('2014/04/25', 'YYYY/MM/DD'));
UPDATE role SET user_id = 1 WHERE id = 1;

INSERT INTO book_rating(comment , nick , rating_date , rating , book_id) values ('TESTC' , 'TESTN' , current_date , 1 , 1);
INSERT INTO customer_message(customer_email , date , message) values ('test@test.pl' , current_date , 'testm');