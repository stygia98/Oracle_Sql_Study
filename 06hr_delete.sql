--DELETE FROM table_name WHERE conditions;

select * from user_tables;
select * from dept;

create table dept1 as select * from departments;

delete from dept1;
TRUNCATE table dept1;
drop table dept1;
ROLLBACK;

select * from dept1 where department_id = 30;
delete from dept1 where department_id = 30;

----------------------------------------------------------------
create table emp01(
    EMPNO       NUMBER(4),
    ENAME       VARCHAR2(10)    not null,
    JOB         VARCHAR2(9),
    MGR         NUMBER(4),
    HIREDATE    DATE            not null,
    SAL         NUMBER(7,2)     not null,
    COMM        NUMBER(7,2),
    DEPTNO      NUMBER(2)       not null,
    constraint pk_emp01_no primary key(EMPNO)
);

insert into emp01 values(7369, 'SMITH', 'CLEAK', 7836, Date '80-12-17', 800, null, 20);
insert into emp01 values(7499, 'ALLEN', 'SALESMAN', 7369, Date '87-12-20', 1600, 300, 30);
insert into emp01 values(7839, 'KING', 'PRESIDENT', null, Date '81-02-08', 5000, null, 10);

select * from emp01;

--[문제] 회원 정보를 저장하는 테이블을 MEMBERS란 이름으로 생성한다.
--MEMBERS 테이블은 다음과 같 은 칼럼으로 구성된다. (pk는 primary key를 의미한다.)
--NO 칼럼명 자료형 크기 NULL허용 키 비고 
--1 ID VARCHAR2 20 N PK 회원ID 
--2 NAME VARCHAR2 20 N 이름 
--3 REGNO VARCHAR2 13 N 주민등록번호 
--4 HP VARCHAR2 13 N 핸드폰번호 
--5 ADDRESS VARCHAR2 100 N 주소

create table MEMBERS (
    ID          VARCHAR2(20)    primary key,
    NAME        VARCHAR2(20)    not null,
    REGNO       VARCHAR2(13)    not null,
    HP          VARCHAR2(13)    not null,
    ADDRESS     VARCHAR2(100)   not null
);

insert into MEMBERS values(0001, 'SMITH', 000812, '010-1234-4567', 'address1');
insert into MEMBERS values(0002, 'ALLEN', 961205, '010-7852-1258', 'address2');
insert into MEMBERS values(0003, 'KING', 030156, '010-9137-5269', 'address3');

select * from MEMBERS;

--[문제] 도서 정보를 저장하는 테이블을 BOOKS이란 이름으로 생성한다. 
--테이블은 다음과 같은 칼럼으로 구성된다. (pk는 primary key를 의미한다.) 
--NO 칼럼명 자료형 크기 NULL허용 키 비고 
--1 CODE NUMBER 4 N PK 제품코드 
--2 TITLE VARCHAR2 50 N 도서명 21 
--3 COUNT NUMBER 6 N 수량 
--4 PRICE NUMBER 10 N 정가 
--PUBLISH VARCHAR2 50 N 출판사

create table BOOKS (
    CODE        NUMBER(4)       not null    primary key,
    TITLE       VARCHAR2(50)    not null,
    COUNT       NUMBER(6)       not null,
    PRICE       NUMBER(10)      not null,
    PUBLISH     VARCHAR2(50)    not null
);

insert into BOOKS values(0001, 'Harry porter', 10, 30, 'publisher1');
insert into BOOKS values(0002, 'Little prince', 20, 40, 'publisher2');
insert into BOOKS values(0003, 'alchemist', 30, 50, 'publisher3');


select * from BOOKS;
