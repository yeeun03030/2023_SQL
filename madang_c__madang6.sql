-- 1. ���缭������ ������ ��ȭ�� ������ ���� SQL���� �ۼ��Ͻÿ�.
-- (1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select distinct name
from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid and name not like '������' and publisher in (select publisher
        from customer cs, orders os, book bs
        where cs.custid = os.custid and os.bookid = bs.bookid and name like '������');


-- �������� ������ ������ ���ǻ� �̸��� ����Ͻÿ�
select publisher
from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid and name like '������';

select name
from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid and name not like '������' and publisher in ('');

-- (2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select name
from customer cm
where (select count(distinct publisher)
        from customer c, orders o, book b
        where c.custid = o.custid and o.bookid = b.bookid and name like cm.name)>=2;
                                    
-- (3) (����) ��ü ���� 30% �̻��� ������ ������ �̸�
select bookname
from book bm
where (select count(b.bookid) 
        from book b, orders o
        where b.bookid = o.bookid and b.bookid = bm.bookid)
        >= (select count(*)
                from customer) * 0.3;
                
-- 2. ���� ���ǿ� ���� DML ���� �ۼ��Ͻÿ�.
-- (1) ���ο� ����('������ ����', '���ѹ̵��', 10000��)�� ���缭���� �԰�Ǿ���. 
-- ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
insert into book values (11, '������ ����', '���ѹ̵��', 10000);

-- (2) '���ѹ̵��'���� ������ ������ �����ؾ� �Ѵ�.
delete from book
where publisher = '���ѹ̵��';

-- (3) '�Ѻ��̵��'���� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
delete from book
where publisher = '�ѹ׹̵��';

-- (4) ���ǻ� '���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲپ���.
update book
set publisher = '�������ǻ�'
where publisher = '���ѹ̵��';

-- abs: ���밪 ���ϴ� �Լ�
select abs(-33), abs(33)
from dual;

-- 5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ���� ���Ͻÿ�.
select round(5.657, 1) 
from dual;

-- ���� ��� �ֹ��ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�.
select custid "����ȣ", round(avg(saleprice), -2) "��ձݾ�"
from orders
group by custid;

-- ������ 'ȥ��'�� ���Ե� ������ '����'�� �����Ͽ� ���������� ����Ͻÿ�.
-- ���� book���̺��� ���������͸� �����ϸ� �ȵ˴ϴ�.
select bookid, replace(bookname, 'ȥ��', '����') bookname, publisher, price from book;
select * from book;

-- ���ǻ簡 '������'�� �������� ���ڼ��� ����Ʈ���� ����Ͻÿ�.
select bookname "������", length(bookname) "���ڼ�", lengthb(bookname) "����Ʈ��" from book
where publisher like '������';

-- ���߿��� ���� ������ ���� ����� ������� ������ �ο����� ����Ͻÿ�.
select substr(name, 1, 1) "����", count(*) "�ο���" from customer
group by substr(name, 1, 1);

-- ������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ, �ֹ���, �ֹ�Ȯ������ ����Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 �ֹ�Ȯ���� 
from orders 
order by orderid;

-- 2023�� 6�� 30�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy�� mm�� dd��"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, orderdate �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate = to_date('20230630', 'yyyymmdd');

-- 2023�� 8�� 28�� ??
select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate = to_date('20230828', 'yyyymmdd');

-- 2023�� 6�� 30�Ͽ� �ֹ� ���� �ֹ���ȣ, �ֹ���, ����, �������� ��� ����Ͻÿ�.
-- ��, �ֹ����� "yyyy-mm-dd"�� ���� format���� ǥ���Ͻÿ�.
select orderid �ֹ���ȣ, to_char(orderdate, 'yyyy-mm-dd') �ֹ���, custid ����ȣ, bookid ������ȣ
from orders o, customer c, book b
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date('20230630', 'yyyymmdd');

-- DB ������ ������ ��¥�� �ð� ������ ����Ͻÿ�.
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵ 4�ڸ�/�� 2�ڸ�/��¥ 2�ڸ�/������ ����, ��:��:��) ��¥�� �ð� 2������ ��� ����Ͻÿ�.
select sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd/dy hh24:mi:ss') �������ĳ�¥�׽ð�
from Dual;