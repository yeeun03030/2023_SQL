-- book ���̺��� ���̽��̶�� ���ڿ��� �����ϰ� ���������� 20000�� �̻��� ������ ���� �˻��Ͻÿ�
select *
from book
where bookname like '%���̽�%' and price >= 20000;

-- book���̺��� ���ǻ簡 �Ѻ��̵�� �Ǵ� �Ѻ���ī������ ������ �˻��Ͻÿ�
select *
from book
where publisher = '�Ѻ��̵��' or publisher = '�Ѻ���ī����';

select *
from book
where publisher in ('�Ѻ��̵��', '�Ѻ���ī����');

-- book ���̺��� ����������� �˻��Ͻÿ�
select *
from book
order by bookname;

-- book ���̺��� ������ȣ������ �˻��Ͻÿ�
select *
from book
order by bookid;

-- book ���̺��� ���ݼ����� �˻��� �ϰ� ���� �����̸� �̸������� �˻��Ͻÿ�
select *
from book 
order by price, bookname;

-- book ���̺��� ������ ������������ �˻� �ϰ� ���� �����̸� ���ǻ������ �˻��Ͻÿ�
select *
from book
order by price desc, publisher;

-- book ���̺��� ������ ������������ �˻� �ϰ� ���� ���ǻ�� ������������ �˻��Ͻÿ�
select *
from book
order by price desc, publisher asc;

select * from orders;
-- orders ���̺��� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
-- �����Լ� ���(�հ� : sum)
select sum (saleprice) as ���Ǹűݾ� 
from  orders;

-- orders ���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�
select sum(saleprice) as ���Ǹž�
from orders
where custid = 1;

-- orders ���̺��� �Ǹž��� �հ�, ���, �ּҰ�, �ִ밪�� ���Ͻÿ�
select sum(saleprice) as ���Ǹűݾ�,
avg(saleprice) as �Ǹž����,
min(saleprice) as ��������,
max(saleprice) as �ִ밡��
from orders;

-- orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�
select count(*) as "�Ǹ��� ���� ��"
from orders;

-- orders ���̺��� ���������� 17000�� �̻��� ������ ������ ���Ͻÿ�
select count(*) as "���� ����"
from orders
where saleprice >= 17000;

-- orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ�
select count(*) as "�ֹ� ����"
from orders
where custid in (1, 3);

-- orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�
-- �׷�ȭ (�κ���) : group by
select custid, count(*) as �ֹ�����, sum(saleprice) �ֹ��Ѿ�
from orders
group by custid
order by custid desc;

-- orders ���̺��� �ǸŰ����� 8000�� �̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ������ ���Ͻÿ�
select custid as "�� ���̵�", count(*) as "���� ����"
from orders
where saleprice >= 8000
group by custid
having count(*) >= 3
order by custid desc;

-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�
--(1) ������ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid = 1;

--(2) ������ 20,000�� �̻��� ������ �̸�
select bookname
from book
where price >= 20000;

-- (3) �������� �� ���ž� (�������� ����ȣ�� 1������ ���� �ۼ�)
select sum(saleprice)
from orders
where custid = 1;

-- (4) �������� ������ ������ �� (�������� ����ȣ�� 1������ ���� �ۼ�)
select count(*)
from orders
where custid = 1;

-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�
-- (1) ���缭���� ������ �� ����
select count(*)
from book;

-- (2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) as "���ǻ� ����"
from book;

-- (3) ��� ���� �̸�, �ּ�
select name, address
from customer;

-- (4) 2023�� 3�� 4�� ~ 3�� 21�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid
from orders
where orderdate >= '2023-03-04' and orderdate <= '2023-03-21';

-- (5) 2023�� 3�� 4�� ~ 3�� 21�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid
from orders
where orderdate <= '2023-03-04' or orderdate >= '2023-03-21';

-- (6) ���� '��'���� ���� �̸��� �ּ�
select name, address
from customer
where name like '��%';

-- (7) ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name, address
from customer
where name like '��%��';