-- (2) 고객의 이름과 구매가격의 평균을 구함.
select cs.name, s
from (select custid, avg(saleprice) s
    from orders
    group by custid) od, customer cs
where cs.custid = od.custid;

-- (3) custid가 3이하인 고객의 총 판매 가격의 합계를 구함
select sum(saleprice) "total"
from orders od
where exists (select *
            from customer cs
            where custid <= 3 and cs.custid = od.custid);
            
-- 책이름에 혼자라는 단어가 포함된 결과행을 출력하시오.
select * 
from book
where bookname like '%혼자%';

create view v_book as select *
from book
where bookname like '%혼자%';

select *
from customer;
-- 주소에 서울이라는 단어가 포함된 뷰를 생성하시오.
select *
from customer
where address like '%서울%';

create view vw_customer as select *
from customer
where address like '%서울%';

select *
from vw_customer;

-- 주문테이블에서 고객이름, 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- 김연아 고객이 구입한 도서의 주문번호, 도서명, 주문액을 출력하시오.

create view vw_orders(orderid, name, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;

select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='김연아';

-- 기존의 뷰를 수정한다.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%부산%';

select *
from customer;

select * from vw_customer;

-- 뷰 삭제
drop ;

-- 8. 다음에 해당하는 뷰를 작성하시오. 데이터베이스는 마당서점 데이터베이스를 이용한다.
-- (1) 판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
create view hightorders(도서번호, 도서이름, 고객이름, 출판사, 판매가격)
as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and saleprice >= 20000;

select * from hightorders;

-- (2) 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문을 작성하시오.
select 도서이름, 고객이름
from hightorders;

-- (3) highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오.
-- 삭제 후 (2)번 SQL문을 다시 수행하시오.
create or replace view hightorders(도서번호, 도서이름, 고객이름, 출판사)
as select o.bookid, b.bookname, c.name, b.publisher
from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and saleprice >= 20000;

select * from hightorders;