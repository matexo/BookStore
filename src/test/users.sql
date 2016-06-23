INSERT INTO role(user_id , role) VALUES (null , 'USER_ROLE');
INSERT INTO role(user_id , role) VALUES (null , 'ADMIN_ROLE');

INSERT INTO users(id , role_id , activated , email , password , token , username , acv_time_stamp)
VALUES (1 , 1 , FALSE , 'admin@test.pl' , 'admin' , 'admin' , 'admin' , to_date('2014/04/25', 'YYYY/MM/DD'));
INSERT INTO users(id , role_id , activated , email , password , token , username , acv_time_stamp)
VALUES (1 , 1 , FALSE , 'user@test.pl' , 'user' , 'user' , 'user' , to_date('2014/04/25', 'YYYY/MM/DD'));

UPDATE role SET user_id = 1 WHERE id = 1;
UPDATE role SET user_id = 2 WHERE id = 2;

INSERT INTO book_rating(comment , nick , rating_date , rating , book_id) values ('Bardzo dobra książka' , 'Mól książkowy' , current_date , 5 , 1);
INSERT INTO book_rating(comment , nick , rating_date , rating , book_id) values ('Trochę nudna' , 'anonim' , current_date , 2 , 2);
INSERT INTO book_rating(comment , nick , rating_date , rating , book_id) values ('Końcówka do przewidzenia...' , 'Andrzej' , current_date , 3 , 10);


INSERT INTO customer_message(customer_email , date , message) values ('user@test.pl' , current_date , 'Zamówienie gotowe do odbioru');