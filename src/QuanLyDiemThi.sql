CREATE DATABASE quanLyDiemThi;

use quanLyDiemThi;
# Bảng Học Sinh
create table HocSinh(
    MaHS nvarchar(50),
    TenHS nvarchar(50),
    NgaySinh datetime,
    Lop nvarchar(20),
    GT nvarchar(20),
    primary key (MaHS)
);
# Bảng môn học
create table MonHoc(
    MaMH nvarchar(50),
    TenMH nvarchar(50),
    MaGV nvarchar(50),
    PRIMARY KEY (MaMH),
    foreign key (MaGV) references GiaoVien(MaGV)
);
# Bảng bảng điểm
create table BangDiem(
    MaHS nvarchar(50),
    MaMH nvarchar(50),
    DiemThi int,
    NgayKT datetime,
    primary key (MaHS,MaMH),
    foreign key (MaHS) references HocSinh(MaHS),
    foreign key (MaMH) references MonHoc(MaMH)
);
# Bảng giáo viên
create table GiaoVien(
    MaGV nvarchar(50),
    TenGV nvarchar(50),
    SDT varchar(10),
    primary key (MaGV)
);

# Nếu trong TH code thiếu thì có thể thêm dòng để bổ sung:
ALTER TABLE MonHoc ADD MaGV VARCHAR(20);
ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);



