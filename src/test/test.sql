INSERT INTO book_category VALUES ( 'TST' , 'TEST');
INSERT INTO book( author , deleted , description , pages , quantity, title , unit_price , year , category_id)
VALUES ('TESTA',FALSE,'TESTD',111,100,'TESTT',120.5 , 2015, 'TST');
INSERT INTO book_rating(comment , nick , rating_date , rating , book_id) values ('TESTC' , 'TESTN' , current_date , 1 , 1);
INSERT INTO customer_message(customer_email , date , message) values ('test@test.pl' , current_date , 'testm');
