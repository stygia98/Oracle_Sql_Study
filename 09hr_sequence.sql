--시퀀스 생성

--CREATE SEQUENCE sequence_name      --이름
--[START WITH n] ①                  --시작 1
--[INCREMENT BY n] ②                --증가 +1
--[{MAXVALUE n | NOMAXVALUE}] ③     --최대 100
--[{MINVALUE n | NOMINVALUE}] ④     --최소 0
--[{CYCLE | NOCYCLE}] ⑤             --종료
--[{CACHE n | NOCACHE}] ⑥           --캐쉬메모리(속도향상)

--테이블
--시퀀스
--인덱스
--트리거 프로시저 함수

select * from tab;
select * from emp;

CREATE SEQUENCE EMP_SEQ
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE
CACHE 2;

CREATE SEQUENCE dep_SEQ
START WITH 10
INCREMENT BY 10
MINVALUE 0
MAXVALUE 30
NOCYCLE
CACHE 2;

rename emp01 to emp04;
create table emp01 as select employee_id, first_name, hire_date from employees where 1=0;

insert into emp01 values (emp_seq.nextval, 'kdj', sysdate);
insert into emp01 values (emp_seq.nextval, 'kdj', sysdate);
insert into emp01 values (emp_seq.nextval, 'kdj', sysdate);
insert into emp01 values (emp_seq.nextval, 'kdj', sysdate);

--emp_seq 현재값
select emp_seq.currval from dual;
desc dual;

create table dept01 as select department_id, department_name, location_id from departments where 1=0;

insert into dept01 values (dep_seq.nextval, '관리과', 1);
insert into dept01 values (dep_seq.nextval, '총무과', 2);
insert into dept01 values (dep_seq.nextval, '서무과', 3);
insert into dept01 values (dep_seq.nextval, '인사과', 4);

--ALTER SEQUENCE sequence_name
--[INCREMENT BY n]
--[{MAXVALUE n | NOMAXVALUE}]
--[{MINVALUE n | NOMINVALUE}]
--[{CYCLE | NOCYCLE}]
--[{CACHE n | NOCACHE}]

--maxvalue초과
alter sequence dep_seq
maxvalue 1000;




select * from emp01;
select * from user_tables;
select * from user_constraints;
select * from user_cons_columns;
select * from user_sequences;
