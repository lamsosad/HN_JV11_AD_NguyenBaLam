create database Test2;
use Test2;

create table STUDENTS(
studentId int primary key auto_increment,
studentName varchar(50),
age int,
email varchar(100)
);

create table SUBJECTS(
subjectId int primary key auto_increment,
subjectName varchar(50)
);

create table CLASSES(
classId int primary key auto_increment,
className varchar(50)
);

create table MARKS(
mark int,
subjectId int,
studentId int,
foreign key (subjectId) references SUBJECTS(subjectId),
foreign key (studentId) references STUDENTS(studentId)
);

create table CLASSSTUDENT(
studentId int,
classId int,
foreign key (studentId) references STUDENTS(studentId),
foreign key (classId) references CLASSES(classId)
);

insert into STUDENTS(studentName,age,email) values
("Nguyen Quang An",18,"an@yahoo.com"),
("Nguyen Cong Vinh",20,"vinh@gmail.com"),
("Nguyen Van Quyen",19,"quyen"),
("Pham Thanh Binh",25,"binh@com"),
("Nguyen Van Tai Em",30,"taiem@sport.vn");

insert into CLASSES(className) values
("C0706L"),
("C0708G");


insert into CLASSSTUDENT(studentId,classId) values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);

insert into SUBJECTS(subjectName) values
("SQL"),
("JAVA"),
("C"),
("Visual Basic");

insert into MARKS values
(8,1,1),
(4,2,1),
(9,1,1),
(7,1,3),
(3,1,4),
(5,2,5),
(8,3,3),
(1,3,5),
(3,2,4);

-- 1. Hien thi danh sach tat ca cac hoc vien
select * from STUDENTS;
-- 2. Hien thi danh sach tat ca cac mon hoc
select * from SUBJECTS;
-- 3. Tinh diem trung binh 
select avg(m.Mark) from MARKS m group by m.StudentID;
-- 4. Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select sj.subjectName from SUBJECTS sj join MARKS m on m.subjectId=sj.subjectId where m.Mark= (select max(MARKS.Mark) from MARKS);
-- 5. Danh so thu tu cua diem theo chieu giam
select  @stt:=@stt+1 as stt,m.Mark from (select @stt:=0) r, MARKS m  order by m.Mark desc;
-- 6. Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table SUBJECTS modify subjectName nvarchar(255);
-- 7. Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot 
-- SubjectName trong bang Subjects
select concat("Day la mon hoc ",subjectName) as "subjectName" from SUBJECTS;
-- 8. Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu 
-- cau Age >15 va Age < 50
alter table students add constraint Chk_Age check (age between 15 and 50);
-- 9. Loai bo tat ca quan he giua cac bang
alter table marks drop constraint marks_ibfk_1;
alter table marks drop constraint marks_ibfk_2;
alter table classstudent drop constraint classstudent_ibfk_1;
alter table classstudent drop constraint classstudent_ibfk_2;
-- 10.Xoa hoc vien co StudentID la 1
delete from students where students.studentId=1;
-- 11.Trong bang Student them mot column Status co kieu du lieu la Bit va co gia
-- tri Default la 1
alter table students add column status bit default 1;
-- 12.Cap nhap gia tri Status trong bang Student thanh 0
update students set status = 0;











