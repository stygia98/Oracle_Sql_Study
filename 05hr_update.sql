--UPDATE table_name
--SET column_name1 = value1, column_name2 = value2, …
--WHERE conditions;


CREATE TABLE EMP AS SELECT * FROM EMPLOYEES;
alter table emp add CONSTRAINT pk_emp_id primary key(employee_id);
alter table emp drop CONSTRAINT pk_emp_id;

SELECT * FROM user_constraints where table_name = 'EMP';

ALTER TABLE emp MODIFY (phone_number CONSTRAINT nn_emp_phone NOT NULL);
alter table emp drop constraint nn_emp_phone;

--모든 사원의 부서번호를 30번으로 수정.
update emp set department_id=30;
select department_id from emp;
--dml
commit;
rollback;

UPDATE EMP SET SALARY = SALARY * 1.1;

alter table emp add salary_copy number(8,2);
update emp set salary_copy = salary;
update emp set salary_copy = salary * 1.1;

-- Sysdate
update emp set hire_date = sysdate;

-- emp2 // CREATE TABLE EMP AS SELECT * FROM EMPLOYEES;
update emp2 set department_id = 30 where department_id = 10;

update emp2 set salary = salary * 1.1 where salary >= 3000;

select hire_date from emp2 where substr(hire_date, 1, 2) = '07';
update emp2 set hire_date = sysdate where substr(hire_date, 1, 2) = '07';
select hire_date from emp2 where substr(hire_date, 1, 2) = '26';

--LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
select * from emp2 where last_name = 'Russell';
update emp2 set commission_pct = 0.45, salary = 17000 where last_name = 'Russell';


desc emp;
select * from emp2;
