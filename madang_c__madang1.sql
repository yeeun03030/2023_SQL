insert into orders values (1, 1, 1, 20000, to_date('2023-01-10', 'yyyy-mm-dd'));
insert into orders values (2, 3, 3, 23000, to_date('2023-03-15', 'yyyy-mm-dd'));
insert into orders values (3, 5, 4, 20000, to_date('2023-03-20', 'yyyy-mm-dd'));
insert into orders values (4, 5, 7, 21000, to_date('2023-04-01', 'yyyy-mm-dd'));
insert into orders values (5, 1, 9, 12000, to_date('2023-04-26', 'yyyy-mm-dd'));
insert into orders values (6, 3, 2, 13000, to_date('2023-06-15', 'yyyy-mm-dd'));
insert into orders values (7, 4, 5, 19000, to_date('2023-06-30', 'yyyy-mm-dd'));
insert into orders values (8, 4, 5, 20000, to_date('2023-07-11', 'yyyy-mm-dd'));
insert into orders values (9, 1, 3, 18000, to_date('2023-08-09', 'yyyy-mm-dd'));


insert into imported_book values(21, 'Zen Golf', 'Person', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);


select publisher, price 
from book
where bookname like '알고리즘 도감';

select name, phone
from customer
where name='나예은';

select *
from customer
where name='나예은';

-- book 테이블에서 도서명과 가격을 검색하시오
select bookname, price
from book;
-- book 테이블에서 가격과 도서명을 검색하시오
select price, bookname
from book;
-- book 테이블에서 도서번호, 도서명, 출판사, 가격을 검색하시오
select *
from book;
-- book 테이블에서 모든 출판사를 검색하시오
select publisher 
from book;
-- book 테이블에서 모든 출판사를 검색하시오. 단 중복되는 출판사는 제거하시오
select distinct publisher
from book;
-- book 테이블에서 가격이 20000원 미만인 도서를 검색하시오
select * 
from book
where price < 20000;
-- book 테이블에서 가격이 10000원에서 20000원 사이인 도서를 검색하시오
select *
from book
where price between 10000 and 20000;

-- book 테이블에서 가격이 10000원 이상 16000원 이하인 도서를 검색하시오
-- 단, betwwn and를 사용하지 마시오
select *
from book
where price >= 10000 and price <= 16000;

-- book 테이블에서 출판사가 위즈덤하우스, 한빛미디어인 도서를 검색하시오
-- 단 in 연산자를 사용하시오
select *
from book
where publisher in ('위즈덤하우스', '한빛미디어');

-- book 테이블에서 출판사가 위즈덤하우스, 한빛미디어인 도서를 검색하시오
-- 단 in 연산자를 사용하지마시오. (비교연산자와 or 연산자를 사용)
select *
from book
where publisher = '한빛미디어' or publisher = '위즈덤하우스';

-- book 테이블에서 출판사가 위즈덤하우스, 한빛미디어가 아닌 도서를 검색하시오
select *
from book
where publisher not in ('한빛미디어', '위즈덤하우스');

select *
from book
where publisher <> '한빛미디어' and publisher <> '위즈덤하우스';


-- 커밋 완


-- book 테이블에서 도서명이 위험한 일본론인 행을 검색하시오
select * 
from book
where bookname = '위험한 일본론';

select *
from book
where bookname like '위험한 일본론';

-- book 테이블에서 일본이라는 문자열이 포함된 행을 검색하시오
select *
from book
where bookname like '%일본%';

-- book 테이블에서 도서명이 공부라는 문자열이 포함된 행을 검색하시오
select *
from book
where bookname like '%공부%';

-- book 테이블에서 도서명이 혼자라고 시작하는 행을 검색하시오
select *
from book
where bookname like '혼자%';

-- book 테이블에서 도서명에 '는'자 앞에 3글자가 포함된 문자열을 갖는 행을 검색하시오
select *
from book
where bookname like '__한%';