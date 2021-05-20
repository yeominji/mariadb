-- 함수 ; 날짜함수

-- curdate(), current_date
select curdate(), current_date;

-- curtime(), cirrent_time
select curtime(), cirrent_time;

-- now() vs sysdate()

select now() ,sysdate();
select now(), sleep(2)  ,now();
select sysdate() ,sleep(2), sysdate();

-- date _format(date format)
select date_format (now()   ,'Y년 %m월 %d일 %h시 %i분 %s초');
select date_format (now()   ,'Y년 %c월 %d일 %h시 %i분 %s초');


-- period_diff
-- YYMM,YYYYMM
-- 예) 근무 개월 수를 출력
select frist_name,
period_diff(data_format(curdate(),'%Y%M'), data_format(hire_data,'%Y%M'))
from  employees;
-- date_add(adddate ), date_sub(subdate),
-- 날짜 date에 type(day,month,year)형식으로 expr 가뵤을 더하거나 뺀다
-- 예)각 사원들의 근무 년 수가 5년이 되는 날은 언제인가요?
select first_name, 
hire_date,
date_add(hire_date, interval 5 year)
from empioyess;
-- cast
select cast('2021-05-07' as date );
select cast('12345' as int )+10;
select now(), cast (now() as date);
select cast(1-2 as unsigned);
select cast (cast(1-2 as unsigned) as signed );
-- mysql type

--  VARCHAR ,CHAR ,text
--  signed (unsigned)int (integer), medium int,big int,int(11)
-- float dlouble
-- time, date datetime
-- LOB(LARGE OBJECT): CLOB ,BLOB

	select now() cast (now() as date);



