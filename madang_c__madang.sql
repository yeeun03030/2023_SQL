-- �������� Book table
create table Book (
    bookID number(2) primary key,
    bookName varchar2(40),
    publisher varchar2(40),
    price number(8)
);

-- �ؿܵ���
create table Imported_Book (
    bookID number(2),
    bookName varchar2(40),
    publisher varchar2(40),
    price number(8)
);

-- ������ Customer table
create table Customer (
    custID number(2) primary key,
    name varchar2(40),
    address varchar2(50),
    phone varchar2(20)
);

-- �ֹ����� Orders table
create table Orders (
    orderID number(2) primary key,
    custID number(2) references Customer(custID),
    bookID number(2) references Book(bookID),
    saleprice number(8),
    orderdate date
);

-- book ���̺� 10���� ���� ������ �߰��ϼ���.
insert into Book values(1, 'ȥ�� �����ϴ� ���̽�', '�Ѻ��̵��', 22000);
insert into Book values(2, 'ȥ�� �����ϴ� SQL', '�Ѻ��̵��', 24000);
insert into Book values(3, 'ȥ�� �����ϴ� C���', '�Ѻ��̵��', 26000);
insert into Book values(4, 'ȥ�� �����ϴ� �ڹ�', '�Ѻ��̵��', 24000);
insert into Book values(5, '�����° ���ټ�', '������Ͽ콺', 12500);
insert into Book values(6, '������ �Ϻ���', '��ũ�ν�',18000);
insert into Book values(7, '�Ϲ��� �����۽� ��������', '��ȣ�̵��', 15000);
insert into Book values(8, '�Ϲ��� ���� �ڱ���� ����', '���帮������', 18800);
insert into Book values(9, 'C# ���α׷���', '�Ѻ���ī����', 26000);
insert into Book values(10, '�˰��� ����', '������', 20000);

-- customer ���̺� ������ 5�� �߰�
insert into customer values(1, '������', '���� ��걸 ������', '010-1234-8099');
insert into customer values(2, '������', '������ ��õ��', '010-0000-5678');
insert into customer values(3, '���ʼ�', '���� ���ı� ����2��', '010-3214-1309');
insert into customer values(4, '����ȣ', '������ ������', '010-2478-9202');
insert into customer values(5, '������', '����ϵ� ���ֱ�', '010-7586-5807');