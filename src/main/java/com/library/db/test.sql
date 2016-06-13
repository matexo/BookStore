INSERT INTO role(user_id , role) VALUES (null , 'USER_ROLE');
INSERT INTO client(id , role_id , activated , email , password , token , username , acv_time_stamp)
VALUES (1 , 1 , FALSE , 'test@test.pl' , 'testtest' , 'test' , 'test' , to_date('2014/04/25', 'YYYY/MM/DD'));
UPDATE role SET user_id = 1 WHERE id = 1;