/* UC2 */
create table AddressBook(
FirstName varchar(50),
LastName varchar(50),
Address varchar(50),
City varchar(50),
State varchar(50),
Zip int,
PhoneNumber varchar(50),
Email varchar(50)
);

/* UC3 */
/* Insert Contacts */
insert into AddressBook values
('Akash','Mane','Mumbai','Mulund','Maharashtra',400080,'1234567890','akash@gmail.com'),
('Tanmay','Maity','Kolkatta','Howrah','Bengal',600080,'0123456789','tanmay@gmail.com'),
('Parth','Trivedi','Rajkot','Jaamnagar','Gujarat',800080,'1023456789','parth@gmail.com'),
('Yash','Mane','Mumbai','Mulund','Maharashtra',400080,'1203456789','yash@gmail.com'),
('Virat','Kohli','Delhi','Gurugram','Delhi',459080,'9123456789','virat@gmail.com'),
('Chinmay','Pimple','Mumbai','Borivali','Maharashtra',800080,'1234506789','chinmay@gmail.com');

/* UC4 */
/* Edit Contacts */
update AddressBook set City='Thane', Zip=400604 where FirstName='Yash' and LastName='Mane';

/* UC5  */
/* Delete a person's contact*/
delete from AddressBook where FirstName='Virat' and LastName='Kohli';


/* UC6 */
/*  Retrive info from city or state */
select * from AddressBook where city='Mulund' or state='Bengal';

/* UC7 */
/*Size of the Address Book*/
select count(city) as TotalContacts from AddressBook;

/* UC8 */
select * from AddressBook where Address='Mumbai' order by FirstName;

/* UC9 */
/* Alter Table to Add BookName and it's Type  */
alter table AddressBook
add BookName varchar(50), BookType varchar(50);

update AddressBook set BookName='Book1', BookType='Family' where LastName='Mane'; 
update AddressBook set BookName='Book2', BookType='Friends' where FirstName='Tanmay' or FirstName='Parth';

/* UC10  */
/* Count person by type */
select BookType, count(BookType) as CountType from AddressBook group by BookType;

/* UC11 */
/* Add a person to both family and friend type */
insert into AddressBook values
('Akhil','Shah','Mumbai','Thane','Maharashtra',400604,'2013456789','akhil@gmail.com','Book1','Family'),
('Akhil','Shah','Mumbai','Thane','Maharashtra',400604,'2013456789','akhil@gmail.com','Book2','Friends');

select * from AddressBook;


/* UC12 */
/* ER diagram */

/* create table BookNameType */
 create table BookNameType(
 B_ID varchar(50) not null primary key,
 B_Name varchar(50) not null,
 B_Type varchar(50) not null,
 );


 /* insert data */
 insert into BookNameType values
 ('BK1','Book1','Family'),
 ('BK2','Book2','Friends'),
 ('BK3','Book3','Profession');

select * from BookNameType;



/*create table Contacts*/
create table Contacts(
FirstName varchar(50) not null,
LastName varchar(50) not null,
Address varchar(50) not null,
City varchar(50) not null,
State varchar(50) not null,
Zip int not null,
PhoneNumber varchar(50) not null,
Email varchar(50) not null,
B_ID varchar(50) not null,
foreign key(B_ID) references BookNameType(B_ID)
);


/* Insert data */
insert into Contacts values
('Akash','Mane','Mumbai','Mulund','Maharashtra',400080,'1234567890','akash@gmail.com','BK1'),
('Tanmay','Maity','Kolkatta','Howrah','Bengal',600080,'0123456789','tanmay@gmail.com','BK2'),
('Parth','Trivedi','Rajkot','Jaamnagar','Gujarat',800080,'1023456789','parth@gmail.com','BK2'),
('Yash','Mane','Mumbai','Mulund','Maharashtra',400080,'1203456789','yash@gmail.com','BK1'),
('Chinmay','Pimple','Mumbai','Borivali','Maharashtra',800080,'1234506789','chinmay@gmail.com','BK3'),
('Akhil','Shah','Mumbai','Thane','Maharashtra',400604,'2013456789','akhil@gmail.com','BK1'),
('Akhil','Shah','Mumbai','Thane','Maharashtra',400604,'2013456789','akhil@gmail.com','BK2');


select * from Contacts;


/* UC13 */
/*  Retrive data from table */
select CONCAT(C.FirstName,' ', C.LastName) as PersonName, C.City, C.State from Contacts C inner join BookNameType B
on C.B_ID=B.B_ID 
where C.City='Mulund' or C.State='Bengal';


select CONCAT(C.FirstName,' ', C.LastName) as PersonName, C.City, count(C.FirstName) as TotalContactsInCity from Contacts C inner join BookNameType B
on C.B_ID=B.B_ID 
group by(C.City),(CONCAT(C.FirstName,' ', C.LastName))
order by PersonName;


select CONCAT(C.FirstName,' ', C.LastName) as PersonName, C.State, count(C.FirstName) as TotalContactsInCity from Contacts C inner join BookNameType B
on C.B_ID=B.B_ID 
group by(C.State), CONCAT(C.FirstName,' ', C.LastName)
order by PersonName;


select B.B_Type as Types, COUNT(B.B_Type) as Total from Contacts C inner join BookNameType B
on C.B_ID=B.B_ID 
group by(B.B_Type);

