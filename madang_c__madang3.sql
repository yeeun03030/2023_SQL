
-- 고객과 고객어ㅣ 주문에 관한 데이터를 모두 출력하시오 / eq join
select * 
from customer, orders
where customer.custid = orders.custid;

--  고객과 고객의 주무넹 괂ㄴ 데이터를 모두 고객번호 내림차순으로 출력하시오
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- 고객의 이름, 주문한 도서 판매가격을 검색하시오
select name, saleprice
from customer c,  orders o
where c.custid = o.custid;

-- 고객별로 주문한 모든 도서의 총판매액을 구하고 고객이름순으로 정렬하시오
select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid
group by name
order by name;

-- 고객의 이름과 주문한 도서이 이름을 구하시오
-- 3개의 테이블에 대한 동등조인 eq join
select name, bookname
from customer c, book b, orders o 
where c.custid = o.custid and o.bookid = b.bookid;

-- 도서 가격이 25000원 이상인 도서를 주문한 고객의 이름을 구하시오
select bookname, name, price
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid and price >= 25000;

-- 외부조인, outer join
-- 동등조인을 하게되면 값이 동등하지 않ㄴ은 행은 무시되지만
-- 외부조인을 하게되면 기준이 되는 테이블의 값이 동등하지 않은 데이터 행도 포함해서 출력해준다.

-- 도서를 구매하지 않은 고객도 포함하여 고객이름과 주문한 도서의 판매가격을 출력하시오
select name, saleprice
from customer c left outer join orders o
            on c.custid = o.custid;
            
-- 부속 질의, Sub Query 
-- Main Query 내에 있는 Query

-- 도서 가격이 가장 비싼 도서이름을 출력하시오

-- 도서 가격이 가장 비싼 가격 출력
select max(price)
from book;

-- 도서의 이름을 출력
select bookname
from book
where price=(select max(price)
            from book);
            
-- 도서가격이 가장 싼 도서의 이름과 가격을 출력하시오
select bookname, price
from book
where price = (select min(price)
                from book);
                
-- 도서를 구매한 적이 있는 고객의 이름을 검색하시오
select name
from customer
where custid in (
        select distinct custid
        from orders);
        
-- 삼호미디어에서 출판한 도서를 구매한 고객의 이름을 출력하시오
select name
from customer
where custid = (
    select custid
    from orders
    where bookid in (
        select distinct bookid
        from book
        where publisher = '삼호미디어'
    )
);

-- 도서를 구매한 사람의 고객번호
select distinct custid 
from orders;

select distinct name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '한빛미디어';
