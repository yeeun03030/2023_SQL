insert into orders values (1, 1, 1, 20000, to_date('2023-01-10', 'yyyy-mm-dd'));
insert into orders values (2, 3, 3, 23000, to_date('2023-03-15', 'yyyy-mm-dd'));
insert into orders values (3, 5, 4, 20000, to_date('2023-03-20', 'yyyy-mm-dd'));
insert into orders values (4, 5, 7, 21000, to_date('2023-04-01', 'yyyy-mm-dd'));
insert into orders values (5, 1, 9, 12000, to_date('2023-04-26', 'yyyy-mm-dd'));
insert into orders values (6, 3, 2, 13000, to_date('2023-06-15', 'yyyy-mm-dd'));
insert into orders values (7, 4, 5, 19000, to_date('2023-06-30', 'yyyy-mm-dd'));
insert into orders values (8, 4, 5, 20000, to_date('2023-07-11', 'yyyy-mm-dd'));
insert into orders values (9, 1, 3, 18000, to_date('2023-08-09', 'yyyy-mm-dd'));


insert into imported_book values(21, 'Zen Golf', 'Person', 12000);
insert into imported_book values(22, 'Soccer Skills', 'Human Kinetics', 15000);


select publisher, price 
from book
where bookname like '�˰��� ����';

select name, phone
from customer
where name='������';

select *
from customer
where name='������';

-- book ���̺��� ������� ������ �˻��Ͻÿ�
select bookname, price
from book;
-- book ���̺��� ���ݰ� �������� �˻��Ͻÿ�
select price, bookname
from book;
-- book ���̺��� ������ȣ, ������, ���ǻ�, ������ �˻��Ͻÿ�
select *
from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�
select publisher 
from book;
-- book ���̺��� ��� ���ǻ縦 �˻��Ͻÿ�. �� �ߺ��Ǵ� ���ǻ�� �����Ͻÿ�
select distinct publisher
from book;
-- book ���̺��� ������ 20000�� �̸��� ������ �˻��Ͻÿ�
select * 
from book
where price < 20000;
-- book ���̺��� ������ 10000������ 20000�� ������ ������ �˻��Ͻÿ�
select *
from book
where price between 10000 and 20000;

-- book ���̺��� ������ 10000�� �̻� 16000�� ������ ������ �˻��Ͻÿ�
-- ��, betwwn and�� ������� ���ÿ�
select *
from book
where price >= 10000 and price <= 16000;

-- book ���̺��� ���ǻ簡 ������Ͽ콺, �Ѻ��̵���� ������ �˻��Ͻÿ�
-- �� in �����ڸ� ����Ͻÿ�
select *
from book
where publisher in ('������Ͽ콺', '�Ѻ��̵��');

-- book ���̺��� ���ǻ簡 ������Ͽ콺, �Ѻ��̵���� ������ �˻��Ͻÿ�
-- �� in �����ڸ� ����������ÿ�. (�񱳿����ڿ� or �����ڸ� ���)
select *
from book
where publisher = '�Ѻ��̵��' or publisher = '������Ͽ콺';

-- book ���̺��� ���ǻ簡 ������Ͽ콺, �Ѻ��̵� �ƴ� ������ �˻��Ͻÿ�
select *
from book
where publisher not in ('�Ѻ��̵��', '������Ͽ콺');

select *
from book
where publisher <> '�Ѻ��̵��' and publisher <> '������Ͽ콺';


-- Ŀ�� ��


-- book ���̺��� �������� ������ �Ϻ����� ���� �˻��Ͻÿ�
select * 
from book
where bookname = '������ �Ϻ���';

select *
from book
where bookname like '������ �Ϻ���';

-- book ���̺��� �Ϻ��̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
select *
from book
where bookname like '%�Ϻ�%';

-- book ���̺��� �������� ���ζ�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
select *
from book
where bookname like '%����%';

-- book ���̺��� �������� ȥ�ڶ�� �����ϴ� ���� �˻��Ͻÿ�
select *
from book
where bookname like 'ȥ��%';

-- book ���̺��� ������ '��'�� �տ� 3���ڰ� ���Ե� ���ڿ��� ���� ���� �˻��Ͻÿ�
select *
from book
where bookname like '__��%';