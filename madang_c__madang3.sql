
-- ���� ����� �ֹ��� ���� �����͸� ��� ����Ͻÿ� / eq join
select * 
from customer, orders
where customer.custid = orders.custid;

--  ���� ���� �ֹ��� �� �����͸� ��� ����ȣ ������������ ����Ͻÿ�
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid desc;

-- ���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�
select name, saleprice
from customer c,  orders o
where c.custid = o.custid;

-- ������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ� ���̸������� �����Ͻÿ�
select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid
group by name
order by name;

-- ���� �̸��� �ֹ��� ������ �̸��� ���Ͻÿ�
-- 3���� ���̺� ���� �������� eq join
select name, bookname
from customer c, book b, orders o 
where c.custid = o.custid and o.bookid = b.bookid;

-- ���� ������ 25000�� �̻��� ������ �ֹ��� ���� �̸��� ���Ͻÿ�
select bookname, name, price
from book b, customer c, orders o
where b.bookid = o.bookid and c.custid = o.custid and price >= 25000;

-- �ܺ�����, outer join
-- ���������� �ϰԵǸ� ���� �������� �ʤ��� ���� ���õ�����
-- �ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� ���� �������� ���� ������ �൵ �����ؼ� ������ش�.

-- ������ �������� ���� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�
select name, saleprice
from customer c left outer join orders o
            on c.custid = o.custid;
            
-- �μ� ����, Sub Query 
-- Main Query ���� �ִ� Query

-- ���� ������ ���� ��� �����̸��� ����Ͻÿ�

-- ���� ������ ���� ��� ���� ���
select max(price)
from book;

-- ������ �̸��� ���
select bookname
from book
where price=(select max(price)
            from book);
            
-- ���������� ���� �� ������ �̸��� ������ ����Ͻÿ�
select bookname, price
from book
where price = (select min(price)
                from book);
                
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select name
from customer
where custid in (
        select distinct custid
        from orders);
        
-- ��ȣ�̵��� ������ ������ ������ ���� �̸��� ����Ͻÿ�
select name
from customer
where custid = (
    select custid
    from orders
    where bookid in (
        select distinct bookid
        from book
        where publisher = '��ȣ�̵��'
    )
);

-- ������ ������ ����� ����ȣ
select distinct custid 
from orders;

select distinct name
from customer c, orders o, book b
where o.bookid = b.bookid and c.custid = o.custid and b.publisher = '�Ѻ��̵��';
