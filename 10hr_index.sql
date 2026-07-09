--인덱스의 장점
--- 검색 속도가 빨라진다.
--- 시스템에 걸리는 부하를 줄여서 시스템 전체 성능을 향상시킨다.
--인덱스의 단점
--- 인덱스를 위한 추가적인 공간이 필요하다.
--- 인덱스를 생성하는데 시간이 걸린다.
--- 데이터의 변경 작업(INSERT/UPDATE/DELETE)이 자주 일어날 경우에는 오히려 성능이 저하된다.
--CREATE UNIQUE INDEX index_name
--ON table_name (column_name);

drop table emp01;
create table emp01 as select * from employees;

select * from user_indexes where table_name = 'EMP01';
select * from user_ind_columns where table_name = 'EMPLOYEES';

select * from emp01;

select * from emp01 where employee_id = 100;
alter table emp01 add constraint pk_emp01_id primary key (employee_id);

select * from emp01 where email like 'A%';
create unique index ix_emp01_email on emp01(email);
drop index ix_emp01_email;



select * from user_indexes;
select * from user_ind_columns;
