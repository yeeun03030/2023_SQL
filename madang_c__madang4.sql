-- ���տ����� : ������(UNION), ������(MINUS), ������(INTERSECT)
-- ������ ������ ���
-- ������ �ֹ����� ���� ���� �̸��� ���ÿ�.
SELECT name
FROM customer;

SELECT DISTINCT custid
FROM orders;

SELECT name
FROM customer
WHERE custid IN (
    SELECT DISTINCT custd
    FROM orders);

-- ������ ������ ����� ���
SELECT name
FROM customer
MINUS
SELECT name
FROM customer
WHERE custid IN (
    SELECT DISTINCT custid
    FROM orders);

-- ���� ������ ������� �ʴ� ���
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT DISTINCT custd
    FROM orders);

-- EXISTS: ���������� ����� �����ϴ� ��쿡 true
-- �ֹ��� �ִ� ���� �̸��� �ּҸ� ����Ͻÿ�
-- in ������ ����� ���
SELECT name, address
FROM customer
WHERE custid IN (
    SELECT DISTINCT custid
    FROM orders);

-- �������ΰ� �ߺ��� ����
SELECT DISTINCT name, address
FROM customer c, orders   o
WHERE c.custid = o.custid;

-- Exists ����� ���
SELECT name, address
FROM customer c
WHERE EXISTS (
    SELECT *
    FROM orders o
    WHERE c.custid = o.custid);
    
-- 1. ���缭���� ���� �䱸�ϴ� ���� ������ ���� SQL���� �ۼ��Ͻÿ�
--(5) �������� ������ ������ ���ǻ� ��
SELECT COUNT(DISTINCT publisher) AS "������ ������ ���ǻ� ��"
FROM book
WHERE bookid IN (
    SELECT bookid
    FROM orders
    WHERE custid = (
        SELECT custid
        FROM customer c
        WHERE name = '������'));

--(6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
SELECT bookname, price, ( price - saleprice ) AS "������ �ǸŰ����� ��"
FROM book b, orders o
WHERE b.bookid = o.bookid AND o.custid = (
    SELECT custid
    FROM customer
    WHERE name = '������');
    
--(7) �������� �������� ���� ������ �̸�
SELECT bookname
FROM book
WHERE bookid NOT IN (
    SELECT bookid
    FROM orders
    WHERE custid = (
        SELECT custid
        FROM customer
        WHERE name = '������'));
        
-- 2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�
-- (8) �ֹ����� ���� ���� �̸�(�μ����� ���)
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT custid
    FROM orders );
    
-- (9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
SELECT SUM(saleprice) AS �Ѿ�, AVG(saleprice) AS ��վ�
FROM orders;

-- (10) ���� �̸��� ���� ���ž�
SELECT name, SUM(saleprice)
FROM orders o, customer c
WHERE o.custid = c.custid
GROUP BY name;

-- (11) ���� �̸��� ���� ������ ���� ���
SELECT name, bookname
FROM orders o, book b, customer c
WHERE o.bookid = b.bookid AND o.custid = c.custid
ORDER BY name;

-- (12) ������ ����(book table)�� �ǸŰ���(orders table)�� ���̰� ���� ���� �ֹ�
select * 
from 
where exists(
    SELECT MAX(price - saleprice)
    FROM book b, orders o
    WHERE b.bookid = o.bookid
);

-- (13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name
FROM orders o,customer c
WHERE o.custid = c.custid
GROUP BY name
HAVING AVG(saleprice) > (
    SELECT AVG(saleprice) 
    FROM orders);
    
-- DDL(Data Defination Language) : ������ ���Ǿ�
-- create table/alter table/drop table
-- ���̺� ���� ����1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- ���̺� ���� ����2
-- primary key ���� ��� 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key (bookid)
);

-- primary key ���� ��� 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- bookname �÷�: null�� ���� �� ����
-- publisher �÷�: ������ ���� ���� �� ����
-- price �÷�: ������ �ԷµǾ� ���� ������ �⺻���� 10000���� �ϰ� �Էµ� ���� 1000�ʰ��� ��
-- bookname, publisher �÷��� ����Ű�� ����

create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price > 1000),
    primary key(bookname, publisher)
);