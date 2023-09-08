-- 집합연산자 : 합집합(UNION), 차집합(MINUS), 교집합(INTERSECT)
-- 차집합 연산자 사용
-- 도서를 주문하지 않은 고객의 이름을 쓰시오.
SELECT name
FROM customer;

SELECT DISTINCT custid
FROM orders;

SELECT name
FROM customer
WHERE custid IN (
    SELECT DISTINCT custd
    FROM orders);

-- 차집합 연산자 사용한 경우
SELECT name
FROM customer
MINUS
SELECT name
FROM customer
WHERE custid IN (
    SELECT DISTINCT custid
    FROM orders);

-- 집합 연산자 사용하지 않는 경우
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT DISTINCT custd
    FROM orders);

-- EXISTS: 서브쿼리의 결과가 존재하는 경우에 true
-- 주문이 있는 고객의 이름과 주소를 출력하시오
-- in 연산자 사용한 경우
SELECT name, address
FROM customer
WHERE custid IN (
    SELECT DISTINCT custid
    FROM orders);

-- 동등조인과 중복행 제거
SELECT DISTINCT name, address
FROM customer c, orders   o
WHERE c.custid = o.custid;

-- Exists 사용한 경우
SELECT name, address
FROM customer c
WHERE EXISTS (
    SELECT *
    FROM orders o
    WHERE c.custid = o.custid);
    
-- 1. 마당서점의 고개깅 요구하느 다음 질문에 대해 SQL문을 작성하시오
--(5) 나예은이 구매한 도서의 출판사 수
SELECT COUNT(DISTINCT publisher) AS "구매한 도서의 출판사 수"
FROM book
WHERE bookid IN (
    SELECT bookid
    FROM orders
    WHERE custid = (
        SELECT custid
        FROM customer c
        WHERE name = '나예은'));

--(6) 나예은이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
SELECT bookname, price, ( price - saleprice ) AS "정가와 판매가격의 차"
FROM book b, orders o
WHERE b.bookid = o.bookid AND o.custid = (
    SELECT custid
    FROM customer
    WHERE name = '나예은');
    
--(7) 나예은이 구매하지 않은 도서의 이름
SELECT bookname
FROM book
WHERE bookid NOT IN (
    SELECT bookid
    FROM orders
    WHERE custid = (
        SELECT custid
        FROM customer
        WHERE name = '나예은'));
        
-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오
-- (8) 주문하지 않은 고객의 이름(부속질의 사용)
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT custid
    FROM orders );
    
-- (9) 주문 금액의 총액과 주문의 평균 금액
SELECT SUM(saleprice) AS 총액, AVG(saleprice) AS 평균액
FROM orders;

-- (10) 고객의 이름과 고객별 구매액
SELECT name, SUM(saleprice)
FROM orders o, customer c
WHERE o.custid = c.custid
GROUP BY name;

-- (11) 고객의 이름과 고객이 구매한 도서 목록
SELECT name, bookname
FROM orders o, book b, customer c
WHERE o.bookid = b.bookid AND o.custid = c.custid
ORDER BY name;

-- (12) 도서의 가격(book table)과 판매가격(orders table)의 차이가 가장 많은 주문
select * 
from 
where exists(
    SELECT MAX(price - saleprice)
    FROM book b, orders o
    WHERE b.bookid = o.bookid
);

-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name
FROM orders o,customer c
WHERE o.custid = c.custid
GROUP BY name
HAVING AVG(saleprice) > (
    SELECT AVG(saleprice) 
    FROM orders);
    
-- DDL(Data Defination Language) : 데이터 정의어
-- create table/alter table/drop table
-- 테이블 생성 연습1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- 테이블 생성 연습2
-- primary key 설정 방법 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);

-- primary key 설정 방법 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname 컬럼: null값 가질 수 없음
-- publisher 컬럼: 동일한 값을 가질 수 없음
-- price 컬럼: 가격이 입력되어 있지 않으면 기본값을 10000으로 하고 입력될 때는 1000초과로 함
-- bookname, publisher 컬럼을 복합키로 설정

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);