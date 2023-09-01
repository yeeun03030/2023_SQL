-- book 테이블에서 파이썬이라는 문자열을 포함하고 도서가격이 20000원 이상인 데이터 행을 검색하시오
select *
from book
where bookname like '%파이썬%' and price >= 20000;

-- book테이블에서 출판사가 한빛미디어 또는 한빛아카데미인 도서를 검색하시오
select *
from book
where publisher = '한빛미디어' or publisher = '한빛아카데미';

select *
from book
where publisher in ('한빛미디어', '한빛아카데미');

-- book 테이블에서 도서명순으로 검색하시오
select *
from book
order by bookname;

-- book 테이블에서 도서번호순으로 검색하시오
select *
from book
order by bookid;

-- book 테이블에서 가격순으로 검색을 하고 같은 가격이면 이름순으로 검색하시오
select *
from book 
order by price, bookname;

-- book 테이블에서 가격을 내림차순으로 검색 하고 같은 가격이면 출판사순으로 검색하시오
select *
from book
order by price desc, publisher;

-- book 테이블에서 가격을 내림차순으로 검색 하고 같은 출판사는 오름차순으로 검색하시오
select *
from book
order by price desc, publisher asc;

select * from orders;
-- orders 테이블에서 고객이 주문한 도서의 총 판매액을 구하시오
-- 집계함수 사용(합계 : sum)
select sum (saleprice) as 총판매금액 
from  orders;

-- orders 테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오
select sum(saleprice) as 총판매액
from orders
where custid = 1;

-- orders 테이블에서 판매액의 합계, 평균, 최소값, 최대값을 구하시오
select sum(saleprice) as 총판매금액,
avg(saleprice) as 판매액평균,
min(saleprice) as 최저가격,
max(saleprice) as 최대가격
from orders;

-- orders 테이블에서 판매한 도서의 개수를 구하시오
select count(*) as "판매한 도서 수"
from orders;

-- orders 테이블에서 도서가격이 17000원 이상인 도서의 개수를 구하시오
select count(*) as "도서 개수"
from orders
where saleprice >= 17000;

-- orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오
select count(*) as "주문 개수"
from orders
where custid in (1, 3);

-- orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오
-- 그룹화 (부분합) : group by
select custid, count(*) as 주문수량, sum(saleprice) 주문총액
from orders
group by custid
order by custid desc;

-- orders 테이블에서 판매가격이 8000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량을 구하시오
select custid as "고객 아이디", count(*) as "도서 수량"
from orders
where saleprice >= 8000
group by custid
having count(*) >= 3
order by custid desc;

-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL문을 작성하시오
--(1) 도서번호가 1인 도서의 이름
select bookname
from book
where bookid = 1;

--(2) 가격이 20,000원 이상인 도서의 이름
select bookname
from book
where price >= 20000;

-- (3) 나예은의 총 구매액 (나예은의 고객번호는 1번으로 놓고 작성)
select sum(saleprice)
from orders
where custid = 1;

-- (4) 나예은이 구매한 도서의 수 (나예은의 고객번호는 1번으로 놓고 작성)
select count(*)
from orders
where custid = 1;

-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL문을 작성하시오
-- (1) 마당서점의 도서의 총 개수
select count(*)
from book;

-- (2) 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) as "출판사 개수"
from book;

-- (3) 모든 고객의 이름, 주소
select name, address
from customer;

-- (4) 2023년 3월 4일 ~ 3월 21일 사이에 주문 받은 도서의 주문번호
select orderid
from orders
where orderdate >= '2023-03-04' and orderdate <= '2023-03-21';

-- (5) 2023년 3월 4일 ~ 3월 21일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid
from orders
where orderdate <= '2023-03-04' or orderdate >= '2023-03-21';

-- (6) 성이 '김'씨인 고객의 이름과 주소
select name, address
from customer
where name like '김%';

-- (7) 성이 '나'씨이고 이름이 '기'로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '나%기';