CREATE TABLE book (
        book_id INT PRIMARY KEY,
        title VARCHAR(255) NOT NULL,
author_id INT,
publication_year INT,
genre VARCHAR(100),
isbn VARCHAR(20),
available_copies INT,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
        );

CREATE TABLE authors (
        author_id INT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
nationality VARCHAR(100)
);

CREATE TABLE members (
        member_id INT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
date_of_birth DATE,
contact_number VARCHAR(20),
email VARCHAR(100),
membership_date DATE
);

alter  table members add email varchar(100);
CREATE TABLE loans (
        loan_id INT PRIMARY KEY,
        book_id INT,
        member_id INT,
        loan_date DATE,
        return_date DATE,
        actual_return_date DATE,
        FOREIGN KEY (book_id) REFERENCES book(book_id),
FOREIGN KEY (member_id) REFERENCES members(member_id)
        );

CREATE TABLE staff (
        staff_id INT PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
position VARCHAR(100),
contact_number VARCHAR(20),
email VARCHAR(100),
hire_date DATE
);



ALTER TABLE book
ADD COLUMN new_column_name VARCHAR(255);

ALTER TABLE staff
RENAME COLUMN position TO job_title;

ALTER TABLE members
DROP COLUMN email;


select * from book;
select * from staff;
select * from members;
select * from authors;

INSERT INTO book (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES (1, 'Godfather', 01, 1960, 'Fiction', '978-0-06-112008-4', 5);



INSERT INTO book (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES (2, 'Seven Samurai', 02, 1949, 'Fantasy', '978-0-452-28423-4', 3);

INSERT INTO book (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES (3, 'Titanic', 03, 1925, 'Fiction', '978-0-7432-7356-5', 4);

select * from book;

alter table book rename column new_column_name to sold_copies;
select * from book;

UPDATE book SET sold_copies = 10 WHERE book_id = 1;
UPDATE book SET sold_copies = 5 WHERE book_id = 2;
UPDATE book SET sold_copies = 8 WHERE book_id = 3;
select * from book;

select * from members;

INSERT INTO members (member_id,first_name ,last_name ,date_of_birth ,contact_number ,membership_date,email)
VALUES (01, 'Joseph','Vijay','1978-10-05', '9898767606','2023-09-12','jo.vij@mail.com' );
INSERT INTO members (member_id,first_name ,last_name ,date_of_birth ,contact_number ,membership_date,email)
VALUES (02, 'Jose','Vithay','1956-09-27', '9123456780','2021-08-02','xy.vit@mail.com');
INSERT INTO members (member_id,first_name ,last_name ,date_of_birth ,contact_number ,membership_date,email)
VALUES (03, 'Jo','Ajay','1999-01-22', '2314569870','2024-08-24','tjh.vvjc@mail.com');

select * from members;

select * from book;
update members set contact_number ='7865786509'where member_id =1;

select * from members;

insert into loans (loan_id,book_id,member_id,loan_date,return_date,actual_return_date)values(001,1,1,'2024-05-29','2024-06-10','2024-06-08');
insert into loans (loan_id,book_id,member_id,loan_date,return_date,actual_return_date)values(002,2,2,'2024-02-10','2024-02-15','2024-02-18');
insert into loans (loan_id,book_id,member_id,loan_date,return_date,actual_return_date)values(003,3,3,'2025-05-29','2024-06-10','2024-06-08');

select * from loans;
insert into loans (loan_id,book_id,member_id,loan_date,return_date,actual_return_date)values(004,2,1,'2024-06-21','2024-06-30','2024-07-01');

insert into authors (author_id,first_name,last_name,date_of_birth,nationality)values(1,'Martin','Sorcese','1956-09-21','French');
insert into authors (author_id,first_name,last_name,date_of_birth,nationality)values(2,'Jack','Sparrow','1966-04-11','German');
insert into authors (author_id,first_name,last_name,date_of_birth,nationality)values(3,'James','Cameroon','1956-06-29','American');
select * from authors;
select * from staff;
insert into staff (staff_id,first_name,last_name,job_title,contact_number,hire_date)values(100,'revanth','sharp','librarian','2016')
        --inner join


select b.title,a.first_name,a.last_name from book b inner join authors a on b.author_id =a.author_id;

select l.book_id,b.title,m.member_id,m.first_name,m.last_name,m.date_of_birth,m.contact_number,m.membership_date from loans l inner join members m on l.member_id=m.member_id inner join book b on b.book_id=l.book_id ;

select b.title from loans l inner join book b on b.book_id =l.book_id where l.member_id=2;

        select genre, count(book_id) as number_of_books ,sum(available_copies) as total_number_of_copies from book group by genre;

        select staff_id,first_name,last_name,hire_date from staff where job_title='librarian';



