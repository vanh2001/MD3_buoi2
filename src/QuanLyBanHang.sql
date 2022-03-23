create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
    cID int,
    name nvarchar(25),
    cAge tinyint,
    primary key (cID)
);

create table cOrder(
    oID int,
    cID int,
    oDate datetime,
    oTotalPrice int,
    primary key (oID),
    foreign key (cID) references Customer(cID)
);

create table Product(
    pID int,
    pName nvarchar(25),
    pPrice int,
    primary key (pID)
);

create table oderDetail(
    oID int,
    pID int,
    odQTY int,
    primary key (oID, pID),
    foreign key (oID) references cOrder(oID),
    foreign key (pID) references Product(pID)
);