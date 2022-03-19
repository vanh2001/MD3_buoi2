create database QuanLySinhVien;

use QuanLySinhVien;

create table Class(
    ClassID int auto_increment not null,
    ClassName nvarchar(60) not null ,
    StartDate datetime not null ,
    Status bit,
    primary key (ClassID)
);

create table Student(
    StudentID int not null auto_increment,
    StudentName nvarchar(30) not null ,
    Address nvarchar(50),
    Phone nvarchar(20),
    Status bit,
    ClassID int not null ,
    primary key (StudentID),
    foreign key (ClassID) references Class(ClassID)
);

create table Subject(
    SubID int not null auto_increment,
    SubName nvarchar(30) not null,
    Credit tinyint not null default 1 check ( Credit >= 1 ),
    Status bit default 1,
    primary key (SubID)
);

create table Mark(
    MarkID int not null auto_increment,
    SubID int not null,
    StudentID int not null,
    Mark FLOAT default 0 check ( Mark between 0 and 100),
    ExamTimes tinyint default 1,
    primary key (MarkID),
    unique (SubID, StudentID),
    foreign key (SubID) references Subject(SubID),
    foreign key (StudentID) references Student(StudentID)
);