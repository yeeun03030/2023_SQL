exec interest;

create table book_log(
    bookid_1 number,
    bookname_1 varchar2(40),
    publisher_1 varchar2(40),
    price_1 number
);

exec insertcustomer(6, '����', '��ȣ�� ����', null);
select * from customer;