-- 도서정보 Book table
create table Book (
    bookID number(2) primary key,
    bookName varchar2(40),
    publisher varchar2(40),
    price number(8)
);

-- 해외도서
create table Imported_Book (
    bookID number(2),
    bookName varchar2(40),
    publisher varchar2(40),
    price number(8)
);

-- 고객정보 Customer table
create table Customer (
    custID number(2) primary key,
    name varchar2(40),
    address varchar2(50),
    phone varchar2(20)
);

-- 주문정보 Orders table
create table Orders (
    orderID number(2) primary key,
    custID number(2) references Customer(custID),
    bookID number(2) references Book(bookID),
    saleprice number(8),
    orderdate date
);

-- book 테이블에 10권의 도서 정보를 추가하세요.
insert into Book values(1, '혼자 공부하는 파이썬', '한빛미디어', 22000);
insert into Book values(2, '혼자 공부하는 SQL', '한빛미디어', 24000);
insert into Book values(3, '혼자 공부하는 C언어', '한빛미디어', 26000);
insert into Book values(4, '혼자 공부하는 자바', '한빛미디어', 24000);
insert into Book values(5, '오백년째 열다섯', '위즈덤하우스', 12500);
insert into Book values(6, '위험한 일본론', '어크로스',18000);
insert into Book values(7, '하버드 스탠퍼스 생각수업', '삼호미디어', 15000);
insert into Book values(8, '하버드 전통 자기관리 수업', '리드리드출판', 18800);
insert into Book values(9, 'C# 프로그래밍', '한빛아카데미', 26000);
insert into Book values(10, '알고리즘 도감', '제이펍', 20000);

-- customer 테이블에 고객정보 5명 추가
insert into customer values(1, '나예은', '서울 용산구 보광동', '010-1234-8099');
insert into customer values(2, '김현경', '강원도 춘천시', '010-0000-5678');
insert into customer values(3, '나필수', '서울 송파구 송파2동', '010-3214-1309');
insert into customer values(4, '나진호', '강원도 강릉시', '010-2478-9202');
insert into customer values(5, '나종기', '전라북도 완주군', '010-7586-5807');