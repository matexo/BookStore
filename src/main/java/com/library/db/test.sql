INSERT INTO role(user_id , role) VALUES (null , "USER_ROLE");
INSERT INTO client(role_id , activated , email , password , token , username)
VALUES (1 , FALSE , "test@test.pl" , "test" , "test" , "test");
UPDATE role SET user_id = 1 WHERE id = 1;