-- DDL(Data Defination Language) ������ ���Ǿ�

-- ������ (newCustomer table)
-- custid, name, address, phone

create table newCustomer (
    custid number primary key,
    name varchar2(40),
    adress varchar2(40),
    phone varchar2(30)
);
-- �׳� char�� �� ä���� �� ���� ���ڴ� �������� ä��
-- varchar�� ���������� ����ϰ���� ��ŭ ���


-- �ֹ����� (newOrders table)
-- orderid, custid(not null, newCustomer table - custid �����ؼ� �ܷ�Ű, ������� �����ϰ�)
-- bookid(not null, newBook1 bookid �����ؼ� �ܷ�Ű, ������� �����ϰ�)
-- saleprice
-- orderdate


create table newOrders (
    orderid number primary key,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    foreign key(custid) references newcustomer(custid) on delete cascade,
    foreign key(bookid) references newbook3(bookid) on delete cascade
);

-- Alter ��
-- �̹� ������ ���̺��� ������ ������ �� ���
-- add(�߰�), drop(����), modify(����)

-- ������ newbook1 ���̺��� �����ϰ� �� ���̺� �ۼ�
create table newbook1 (
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- isbn �÷� �߰�
alter table newbook1
add isbn varchar2(13);

-- isbn �÷��� �ڷ��� ����
alter table newbook1
modify isbn number;

-- isbn �÷� ����
alter table newbook1 
drop column isbn;

-- bookname �÷��� varchar2(30) not null �������� ����
alter table newbook1
modify bookname varchar2(30) not null;

-- bookid �÷��� �⺻Ű �߰�
alter table newbook1
add primary key(bookid);

-- table ����
drop table newbook1;

-- DML(select, insert(������ ����), update(������ ����), delete(������ ����))
-- insert 1��: �Ӽ�����Ʈ ����
insert into book
values(11, '����', '�س�', 12000);

-- insert 2��: �Ӽ�(�÷�)����Ʈ ���
insert into book(bookid, bookname, publisher, price)
values(12, '���ӿ���������', '����å', 8000);

-- insert 3��: �÷��� ������ ����
insert into book(bookid, price, publisher, bookname)
values(13, 28000, '���ڳ���', '���� ����');

-- insert 4��: Ư�� �÷��� ���� ����
insert into book(bookid, price, bookname)
values(14, 10000, '��ħ���');

-- ���̺����� ���� �ٸ� ���̺��� ������ ���� �����ϴ� ���
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

-- update: ������ ����
-- ����ȣ�� 5���� ���� �ּҸ� ���ѹα� �λ����� �����Ͻÿ�.
select *
from customer;

update customer
set address = '���ѹα� �λ�'
where custid = 5;

-- ������ ���� �ּҸ� ������ ���� �ּҿ� �����ϰ� �����Ͻÿ�.
update customer
set address = (select address
                from customer
                where name = '������')
where name = '������';

-- ������ ���� ��ȭ��ȣ�� ������ ���� ��ȭ��ȣ�� �����ϰ� �����Ͻÿ�.
update customer
set phone = (select phone
            from customer
            where name = '������')
where name = '������';

-- ��� ���� �����Ͻÿ�.
delete from customer;

select *
from orders;

-- ������ ���� �����Ͻÿ�.
delete from customer
where name = '������';

rollback;

-- 1. ���缭������ ������ ��ȭ�� ������ ���� SQL���� �ۼ��Ͻÿ�.
-- (1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select 
from order
where publisher in (select publisher
                    from order
                    where custid = (select custid
                                    from customer
                                    where name = '������'));