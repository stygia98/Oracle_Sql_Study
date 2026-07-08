
select * from TAB;
select * from user_tables;

drop table emp2;

select * from emp2;

create table emp02 as select * from employees;
desc emp02;


alter table emp02 add CONSTRAINT pk_employee_id primary key(employee_id);
alter table emp02 add CONSTRAINT uk_PHONE_NUMBER UNIQUE(PHONE_NUMBER);

alter table emp02 modify employee_id CONSTRAINT pk_employee_id primary key;
alter table emp02 modify PHONE_NUMBER CONSTRAINT uk_PHONE_NUMBER UNIQUE;
alter table emp02 modify PHONE_NUMBER CONSTRAINT nn_emp02_phone not null;

alter table emp02 drop constraint nn_emp02_phone;
alter table emp02 drop constraint uk_PHONE_NUMBER;
alter table emp02 drop constraint pk_employee_id;

select * from user_constraints where table_name = 'EMP02';
select * from user_cons_columns where table_name = 'EMP02';
select * from user_tables;



create table emp03 (
    empno number(4),
    empname varchar2(20) not null,
    job varchar2(20),
    constraint uk_emp03_no UNIQUE(empno)
);

INSERT INTO emp03 VALUES (null, 'aaa1', 'programmer');
INSERT INTO emp03 VALUES (1234, 'aaa2', 'programmer');
INSERT INTO emp03 VALUES (null, 'aaa3', 'db developer');
delete from emp03 where job='db developer';

update emp03 set empno = 0 where empno is null;

alter table emp03 modify empno not null;


drop table dept;




--1.NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다.
--2.CASCADE : 참조 테이블의 튜플이 삭제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 변경되면 관련 튜플의 속성 값도 모두 변경된다.
--3.SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의관련 튜플의 속성 값을 NULL로 변경한다.
--4.SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 변경한다.
--5.RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가

create table dept (
    deptno number(4),
    deptname varchar2(30),
    deptloc varchar2(30) constraint nn_dept_loc not null,
    constraint pk_dept_no primary key(deptno),
    constraint uk_dept_name UNIQUE(deptname)
);

INSERT INTO dept VALUES (10, '관리과1', '서울1');
INSERT INTO dept VALUES (20, '관리과2', '서울2');
INSERT INTO dept VALUES (30, '관리과3', '서울3');
INSERT INTO dept VALUES (40, '관리과4', '서울4');
delete from dept where deptno=10;
delete from dept where deptno=40;
select * from dept;

create table emp (
    empid number(4),
    empname varchar2(12) not null,
    job varchar2(20),
    salary number(10),
    deptno number(4),
    CONSTRAINT pk_emp_id primary key(empid),
    CONSTRAINT fk_emp_dept_no FOREIGN key(deptno) REFERENCES dept(deptno)
    --on DELETE CASCADE
);

alter table emp modify empid CONSTRAINT pk_emp_id primary key;
alter table emp modify empname varchar2(12);

alter table emp add gender char(1) default 'M';
alter table emp add constraint ck_emp_gender check(gender in ('M', 'F', 'O'));

alter table emp add score number(4)
alter table emp add constraint ck_emp_score check(score BETWEEN 0 and 100);
alter table emp drop constraint ck_emp_score;

alter table emp add CONSTRAINT fk_emp_dept_no FOREIGN KEY(deptno) REFERENCES dept(deptno);
alter table emp drop CONSTRAINT fk_emp_dept_no;

INSERT INTO emp VALUES (1, '홍길동1', '부장', 10000000, null);
INSERT INTO emp VALUES (3, '홍길동2', '부장2', 10000000, null, 'M');
INSERT INTO emp VALUES (4, '홍길동4', '부장4', 10000000, null, 'F', 100);
INSERT INTO emp VALUES (5, '홍길동5', '부장5', 10000000, 40, 'F', 100);
UPDATE emp set deptno = 10 where empid=1;
delete from emp where empid=1;



select * from dept;
select * from emp;
select * from user_tables;
select * from user_constraints where table_name = 'EMP';
select * from user_cons_columns where table_name = 'EMP';
