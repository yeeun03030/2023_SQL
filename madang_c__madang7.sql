-- ABS(-15) -> 15 / 절대값
select ABS(-15) 
from dual;

-- CEIL(15.7) -> 16 / 무조건 올림
select CEIL(15.7)
from dual;

-- COS(3.14159) -> -9999... / 코싸인
select COS(3.14159)
from dual;

-- FLOOR(15.7) -> 15 / 무조건 내림
select FLOOR(15.7)
from dual;

-- LOG(10, 100) -> 2 / 로그
select LOG(10, 100)
from dual;

-- MOD(11, 4) -> 3 / 나누고 남은 나머지 값
select MOD(11, 4)
from dual;

-- POWER(3, 2) -> 9 / 제곱
select POWER(3, 2)
from dual;

-- ROUND(15.7) -> 16 / 반올림
select ROUND(15.7)
from dual;

-- SIGN(-15) -> -1 / 싸인
select SIGN(-15)
from dual;

-- TRUNC(15.7) -> 15 / 소숫점 이하 절삭
select TRUNC(15.7)
from dual;

-- CHR(67) -> C / 
select CHR(67)
from dual;

-- CONCAT('HAPPY', 'Birthday') -> HAPPY Birthday / 문자 합치기
select CONCAT('HAPPY ', 'Birthday')
from dual;

-- LOWER('Birthday') -> birthday / 모두 소문자
select LOWER('Birthday')
from dual;

-- LPAD('Page 1', 15, '*.') -> *.*.*.*.*Page 1 / 15자리를 만들되 글자를 오른쪽부터 채우고 빈자리는 3번째 문자로 채운다
select LPAD('Page 1', 15, '*.')
from dual;

-- LTRIM('Page 1', 'ae') -> Page 1
select LTRIM('Page 1', 'ae')
from dual;

-- REPLACE('JACK', 'J', 'BL') -> BLACK / 첫번째 글자에서 두번째 글자를 뽑아내 세번째 글자로 바꾼다.
select REPLACE('JACK', 'J', 'BL')
from dual;

-- RPAD('Page 1', 15, '*.') -> Page 1*.*.*.*.* / 15자리를 만들되 글자를 왼쪽부터 채우고 빈자리는 3번째 문자로 채운다
select RPAD('Page 1', 15, '*.')
from dual;

-- RTRIM('Page 1', 'ae') -> Page 1 / 
select RTRIM('Page 1', 'ae')
from dual;

-- 고객의 이름과 전화번호를 출력하시오. (단, 전화번호가 없는 고객은 연락처 없음으로 출력하시오.
select name 이름, phone 전화번호
from customer;

select name 이름, nvl(phone, '연락처없음') 전화번호 
from customer;

-- 고객목록에서 순번, 고객번호, 이름, 전화번호를 앞에 두명만 출력하시오.
select rownum 순번, custid, name, phone
from customer;

select rownum 순번, custid, name, phone
from customer
where rownum <= 2;

-- mybook 테이블 생성
create table mybook(
    bookid  number  not null    primary key,
    price   number  
);

-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

-- 연습문제 8개
-- (1) mybook 전체 출력하기
select *
from mybook;

-- (2) price에 null값이 있으면 0으로 바꿔서 출력
select bookid, NVL(price, 0)
from mybook;

-- (3) price가 null값인 것만 출력
select *
from mybook
where price is null;

-- (4) price가 공백인 것만 출력
select *
from mybook
where price='';

-- (5) price에 100원씩 더하되, 널은 포함안됨
select bookid, price + 100
from mybook;

-- (6) bookid가 4번 이상이 없기에 null null 0으로 나옴
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;

-- (7) 모든 행의 개수와 price를 기준으로 널을 뺀 개수 
select count(*), count(price)
from mybook;

-- (8) 모든 price를 더한것과 평균을 출력함
select sum(price), avg(price)
from mybook;

-- rownum에 관한 sql문에 답하시옷.
-- (1) book 테이블 전체 출력
select *
from book;

-- (2) 위에서부터 5개를 추리고 출력
select *
from book
where rownum <= 5;

-- (3) 위에서부터 5개를 추리고 price를 기준으로 오름차순 정렬
select *
from book
where rownum <= 5
order by price;

-- (4) price를 기준으로 오름차순 정렬 후 위에서부터 5개를 추림
select *
from (select * from book order by price) b -- sub query
where rownum <= 5;

-- (5) 3번과 동일
select *
from (select * from book where rownum <= 5) b
order by price;

-- (6) 3번과 동일
select *
from (select * from book where rownum <= 5 order by price) b;

-- 평균판매금액 이하의 주문에 대해 주문번호와 금액을 출력하시오.
select orderid 주문번호, saleprice 판매금액
from orders;

select orderid 주문번호, saleprice 판매금액
from orders
where saleprice <= (select avg(saleprice)
        from orders);
        
-- 각 고객의 평균판매금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금액을 출력하시오
select orderid, custid, saleprice
from orders mo
where saleprice > (select avg(saleprice)
        from orders so
        where mo.custid = so.custid);
        
-- 서울에 거주하는 고객에게 판매한 도서의 총 판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders;

-- 서울에 거주하는 사람의 고객번호
select custid 
from customer
where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in (select custid
        from customer
        where address like '%서울%');
        
-- 3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력하시오
-- 주문번호와 판매금액 출력
select orderid 주문번호, saleprice 판매금액
from orders;

select orderid 주문번호, saleprice 판매금액
from orders
where saleprice > all(select saleprice
        from orders
        where custid = 3);

select saleprice -- max 써도 상관 없음
from orders
where custid = 3;

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오. (단, exist 연산자 사용)
select sum(saleprice) 총판매금액 
from orders mo
where exists(select * from customer c
where address like '%서울%' and mo.custid = c.custid);

-- 고객별 판매금액의 합계를 출력하시오. (고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 
from orders
group by custid;

-- 고객별 판매금액의 합계를 출력하시오.(고객명, 판매합계)
select (select name from customer c
        where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 
from orders o
group by o.custid;

-- 주문목록에 책이름을 저장할 수 있는 컬럼을 추가하시오.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- 고객번호가 2이하인 고객번호와 이름을 출력하시오.
select custid 고객번호, name 이름 
from customer
where custid <= 2;

-- 고객번호가 2이하인 고객의 판매금액을 출력하시오. (고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매총액
from (select custid, name from customer
where custid <= 2) c, orders o
where ;

-- 5. 부속질의에 관한 다음 SQL문을 수행해보고 어떤 질의에 대한 답인지 설명하시오.
-- (1) 스칼라 서브쿼리 / 고객아이디, 주소, 고객별 총 가격을 출력함
select custid, (select address
        from customer cs
        where cs.custid = od.custid) "address",
                sum(saleprice) "total"
from orders od
group by od.custid;