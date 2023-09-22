-- ABS(-15) -> 15 / ���밪
select ABS(-15) 
from dual;

-- CEIL(15.7) -> 16 / ������ �ø�
select CEIL(15.7)
from dual;

-- COS(3.14159) -> -9999... / �ڽ���
select COS(3.14159)
from dual;

-- FLOOR(15.7) -> 15 / ������ ����
select FLOOR(15.7)
from dual;

-- LOG(10, 100) -> 2 / �α�
select LOG(10, 100)
from dual;

-- MOD(11, 4) -> 3 / ������ ���� ������ ��
select MOD(11, 4)
from dual;

-- POWER(3, 2) -> 9 / ����
select POWER(3, 2)
from dual;

-- ROUND(15.7) -> 16 / �ݿø�
select ROUND(15.7)
from dual;

-- SIGN(-15) -> -1 / ����
select SIGN(-15)
from dual;

-- TRUNC(15.7) -> 15 / �Ҽ��� ���� ����
select TRUNC(15.7)
from dual;

-- CHR(67) -> C / 
select CHR(67)
from dual;

-- CONCAT('HAPPY', 'Birthday') -> HAPPY Birthday / ���� ��ġ��
select CONCAT('HAPPY ', 'Birthday')
from dual;

-- LOWER('Birthday') -> birthday / ��� �ҹ���
select LOWER('Birthday')
from dual;

-- LPAD('Page 1', 15, '*.') -> *.*.*.*.*Page 1 / 15�ڸ��� ����� ���ڸ� �����ʺ��� ä��� ���ڸ��� 3��° ���ڷ� ä���
select LPAD('Page 1', 15, '*.')
from dual;

-- LTRIM('Page 1', 'ae') -> Page 1
select LTRIM('Page 1', 'ae')
from dual;

-- REPLACE('JACK', 'J', 'BL') -> BLACK / ù��° ���ڿ��� �ι�° ���ڸ� �̾Ƴ� ����° ���ڷ� �ٲ۴�.
select REPLACE('JACK', 'J', 'BL')
from dual;

-- RPAD('Page 1', 15, '*.') -> Page 1*.*.*.*.* / 15�ڸ��� ����� ���ڸ� ���ʺ��� ä��� ���ڸ��� 3��° ���ڷ� ä���
select RPAD('Page 1', 15, '*.')
from dual;

-- RTRIM('Page 1', 'ae') -> Page 1 / 
select RTRIM('Page 1', 'ae')
from dual;

-- ���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�. (��, ��ȭ��ȣ�� ���� ���� ����ó �������� ����Ͻÿ�.
select name �̸�, phone ��ȭ��ȣ
from customer;

select name �̸�, nvl(phone, '����ó����') ��ȭ��ȣ 
from customer;

-- ����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� �տ� �θ� ����Ͻÿ�.
select rownum ����, custid, name, phone
from customer;

select rownum ����, custid, name, phone
from customer
where rownum <= 2;

-- mybook ���̺� ����
create table mybook(
    bookid  number  not null    primary key,
    price   number  
);

-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

-- �������� 8��
-- (1) mybook ��ü ����ϱ�
select *
from mybook;

-- (2) price�� null���� ������ 0���� �ٲ㼭 ���
select bookid, NVL(price, 0)
from mybook;

-- (3) price�� null���� �͸� ���
select *
from mybook
where price is null;

-- (4) price�� ������ �͸� ���
select *
from mybook
where price='';

-- (5) price�� 100���� ���ϵ�, ���� ���Ծȵ�
select bookid, price + 100
from mybook;

-- (6) bookid�� 4�� �̻��� ���⿡ null null 0���� ����
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;

-- (7) ��� ���� ������ price�� �������� ���� �� ���� 
select count(*), count(price)
from mybook;

-- (8) ��� price�� ���ѰͰ� ����� �����
select sum(price), avg(price)
from mybook;

-- rownum�� ���� sql���� ���Ͻÿ�.
-- (1) book ���̺� ��ü ���
select *
from book;

-- (2) ���������� 5���� �߸��� ���
select *
from book
where rownum <= 5;

-- (3) ���������� 5���� �߸��� price�� �������� �������� ����
select *
from book
where rownum <= 5
order by price;

-- (4) price�� �������� �������� ���� �� ���������� 5���� �߸�
select *
from (select * from book order by price) b -- sub query
where rownum <= 5;

-- (5) 3���� ����
select *
from (select * from book where rownum <= 5) b
order by price;

-- (6) 3���� ����
select *
from (select * from book where rownum <= 5 order by price) b;

-- ����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�.
select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders
where saleprice <= (select avg(saleprice)
        from orders);
        
-- �� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ����Ͻÿ�
select orderid, custid, saleprice
from orders mo
where saleprice > (select avg(saleprice)
        from orders so
        where mo.custid = so.custid);
        
-- ���￡ �����ϴ� ������ �Ǹ��� ������ �� �Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders;

-- ���￡ �����ϴ� ����� ����ȣ
select custid 
from customer
where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in (select custid
        from customer
        where address like '%����%');
        
-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ����Ͻÿ�
-- �ֹ���ȣ�� �Ǹűݾ� ���
select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ�
from orders
where saleprice > all(select saleprice
        from orders
        where custid = 3);

select saleprice -- max �ᵵ ��� ����
from orders
where custid = 3;

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�. (��, exist ������ ���)
select sum(saleprice) ���Ǹűݾ� 
from orders mo
where exists(select * from customer c
where address like '%����%' and mo.custid = c.custid);

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�. (����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� 
from orders
group by custid;

-- ���� �Ǹűݾ��� �հ踦 ����Ͻÿ�.(����, �Ǹ��հ�)
select (select name from customer c
        where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� 
from orders o
group by o.custid;

-- �ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷��� �߰��Ͻÿ�.
alter table orders add bookname varchar2(40);

update orders o set bookname = (select bookname from book b where b.bookid = o.bookid);

-- ����ȣ�� 2������ ����ȣ�� �̸��� ����Ͻÿ�.
select custid ����ȣ, name �̸� 
from customer
where custid <= 2;

-- ����ȣ�� 2������ ���� �Ǹűݾ��� ����Ͻÿ�. (���̸��� ���� �Ǹž� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from (select custid, name from customer
where custid <= 2) c, orders o
where ;

-- 5. �μ����ǿ� ���� ���� SQL���� �����غ��� � ���ǿ� ���� ������ �����Ͻÿ�.
-- (1) ��Į�� �������� / �����̵�, �ּ�, ���� �� ������ �����
select custid, (select address
        from customer cs
        where cs.custid = od.custid) "address",
                sum(saleprice) "total"
from orders od
group by od.custid;