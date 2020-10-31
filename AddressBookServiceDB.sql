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