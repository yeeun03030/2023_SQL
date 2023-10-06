create or replace procedure interest
as
    myInterest numeric;
    price numeric;
    cursor InterestCursor is select saleprice from orders;
begin
    myInterest := 0.0;
    open InterestCursor;
    loop
        fetch InterestCursor into price;
        exit when InterestCursor%NOTFOUND;
        if price >= 30000 then
            myInterest:= myInterest + price * 0.1;
        else myInterest := myInterest + price * 0.05;
        end if;
    end loop;
    close InterestCursor;
    DBMS_OUTPUT.PUT_LINE('��ü ���ͱݾ� = '||round(myInterest, 3));
end;

insert into book values(15, '���� ���ƿ�', '���й̵��', 25000);
select * from book where bookid = 15;
select * from book_log where bookid_1 = 15;