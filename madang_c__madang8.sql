-- (2) ���� �̸��� ���Ű����� ����� ����.
select cs.name, s
from (select custid, avg(saleprice) s
    from orders
    group by custid) od, customer cs
where cs.custid = od.custid;

-- (3) custid�� 3������ ���� �� �Ǹ� ������ �հ踦 ����
select sum(saleprice) "total"
from orders od
where exists (select *
            from customer cs
            where custid <= 3 and cs.custid = od.custid);
            
-- å�̸��� ȥ�ڶ�� �ܾ ���Ե� ������� ����Ͻÿ�.
select * 
from book
where bookname like '%ȥ��%';

create view v_book as select *
from book
where bookname like '%ȥ��%';

select *
from customer;
-- �ּҿ� �����̶�� �ܾ ���Ե� �並 �����Ͻÿ�.
select *
from customer
where address like '%����%';

create view vw_customer as select *
from customer
where address like '%����%';

select *
from vw_customer;

-- �ֹ����̺��� ���̸�, �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- �迬�� ���� ������ ������ �ֹ���ȣ, ������, �ֹ����� ����Ͻÿ�.

create view vw_orders(orderid, name, bookid, bookname, saleprice, orderdate)
as select o.orderid, c.name, o.bookid, b.bookname, o.saleprice, o.orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;

select * from vw_orders;

select orderid, bookname, saleprice
from vw_orders
where name='�迬��';

-- ������ �並 �����Ѵ�.
create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%�λ�%';

select *
from customer;

select * from vw_customer;

-- �� ����
drop ;

-- 8. ������ �ش��ϴ� �並 �ۼ��Ͻÿ�. �����ͺ��̽��� ���缭�� �����ͺ��̽��� �̿��Ѵ�.
-- (1) �ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
create view hightorders(������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ���)
as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and saleprice >= 20000;

select * from hightorders;

-- (2) ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�.
select �����̸�, ���̸�
from hightorders;

-- (3) highorders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �����ϴ� ����� �����Ͻÿ�.
-- ���� �� (2)�� SQL���� �ٽ� �����Ͻÿ�.
create or replace view hightorders(������ȣ, �����̸�, ���̸�, ���ǻ�)
as select o.bookid, b.bookname, c.name, b.publisher
from book b, orders o, customer c
where b.bookid = o.bookid and o.custid = c.custid and saleprice >= 20000;

select * from hightorders;