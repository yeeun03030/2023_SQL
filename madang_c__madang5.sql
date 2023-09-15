-- DDL(Data Defination Language) 데이터 정의어

-- 고객정보 (newCustomer table)
-- custid, name, address, phone

create table newCustomer (
    custid number primary key,
    name varchar2(40),
    adress varchar2(40),
    phone varchar2(30)
);
-- 그냥 char는 꽉 채워야 함 남는 문자는 공백으로 채움
-- varchar는 가변형으로 사용하고싶은 만큼 사용


-- 주문정보 (newOrders table)
-- orderid, custid(not null, newCustomer table - custid 참조해서 외래키, 연쇄삭제 가능하게)
-- bookid(not null, newBook1 bookid 참조해서 외래키, 연쇄삭제 가능하게)
-- saleprice
-- orderdate


create table newOrders (
    orderid number primary key,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    foreign key(custid) references newcustomer(custid) on delete cascade,
    foreign key(bookid) references newbook3(bookid) on delete cascade
);

-- Alter 문
-- 이미 생성된 테이블의 구조를 변경할 때 사용
-- add(추가), drop(삭제), modify(수정)

-- 기존의 newbook1 테이블을 삭제하고 새 테이블 작성
create table newbook1 (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- isbn 컬럼 추가
alter table newbook1
add isbn varchar2(13);

-- isbn 컬럼의 자료형 변경
alter table newbook1
modify isbn number;

-- isbn 컬럼 삭제
alter table newbook1 
drop column isbn;

-- bookname 컬럼의 varchar2(30) not null 제약조건 변경
alter table newbook1
modify bookname varchar2(30) not null;

-- bookid 컬럼의 기본키 추가
alter table newbook1
add primary key(bookid);

-- table 삭제
drop table newbook1;

-- DML(select, insert(데이터 삽입), update(데이터 수정), delete(데이터 삭제))
-- insert 1번: 속성리스트 생략
insert into book
values(11, '개미', '해냄', 12000);

-- insert 2번: 속성(컬럼)리스트 명시
insert into book(bookid, bookname, publisher, price)
values(12, '라임오렌지나무', '좋은책', 8000);

-- insert 3번: 컬럼의 순서를 변경
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '부자나라', '부의 습관');

-- insert 4번: 특정 컬럼의 값을 생략
insert into book(bookid, price, bookname)
values(14, 10000, '아침명상');

-- 테이블구조가 같은 다른 테이블의 데이터 행을 삽입하는 방법
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

-- update: 데이터 변경
-- 고객번호가 5번인 고객의 주소를 대한민국 부산으로 변경하시오.
select *
from customer;

update customer
set address = '대한민국 부산'
where custid = 5;

-- 나예은 고객의 주소를 나종기 고객의 주소와 동일하게 변경하시오.
update customer
set address = (select address
                from customer
                where name = '나종기')
where name = '나예은';

-- 나예은 고객의 전화번호를 나종기 고객의 전화번호와 동일하게 변경하시오.
update customer
set phone = (select phone
            from customer
            where name = '나종기')
where name = '나예은';

-- 모든 고객을 삭제하시오.
delete from customer;

select *
from orders;

-- 김현경 고객을 삭제하시오.
delete from customer
where name = '김현경';

rollback;

-- 1. 마당서점에서 다음의 심화된 질문에 대해 SQL문을 작성하시오.
-- (1) 나예은이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select 
from order
where publisher in (select publisher
                    from order
                    where custid = (select custid
                                    from customer
                                    where name = '나예은'));