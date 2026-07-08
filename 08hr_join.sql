-- join
--1.cross join(두 개의 테이블을 크로스한다.)
SELECT count(*) FROM employees; --107
SELECT count(*) FROM departments; --27
SELECT count(*) FROM employees, departments where first_name like '%a%';

SELECT * FROM employees e, departments d;
SELECT * FROM employees e cross join departments d;

--2.inner join(employees 테이블과 ,departments 테이블을 조인해서 보여주시오)
-- pk :departement.departement_id , fk : employees.department.id
-- first_name, email,job,연봉,부서명,부서위치를 출력하는 조인문을 작성하시오
-- 판매처만 보여주는 조건문 작성 shipping dusqhddl 5000이상
SELECT * FROM employees e inner join departments d
    on e.department_id = d.department_id;
    
SELECT e.first_name,e.email,e.job_id,e.salary,d.department_name,d.location_id 
    FROM employees e, departments d
    where e.department_id = d.department_id and d.department_name = 'Shipping' and e.salary >=5000 ;

SELECT e.first_name,e.email,e.job_id,e.salary,d.department_name,d.location_id
    FROM employees e inner join departments d
    on e.department_id = d.department_id 
    where d.department_name ='Shipping'and e.salary >=5000 ;

--right outer join (+) left outer join
SELECT e.first_name,d.department_id,d.department_name
    FROM employees e right outer join departments d
    on e.department_id = d.department_id order by d.department_id asc;


SELECT e.first_name,d.department_id,d.department_name
    FROM employees e, departments d
    where e.department_id(+) = d.department_id order by d.department_id asc;

SELECT * FROM departments ORDER by department_id asc;

-- self join
select * from employees;
select e1.first_name 사원, e1.salary, e2.first_name 사수, e2.salary from employees e1, employees e2
    where e1.manager_id = e2.employee_id;

create table gradetbl(
    grade number not null,
    minsalary number not null,
    maxsalary number not null,
    constraint pk_gradetbl_grade primary key(grade)
);

insert into gradetbl values (1, 2000, 5000);
insert into gradetbl values (2, 5001, 10000);
insert into gradetbl values (3, 10001, 20000);
insert into gradetbl values (4, 20001, 30000);
insert into gradetbl values (5, 30001, 50000);

select * from gradetbl;
select e.first_name, e.salary, g.grade --, minsalary, maxsalary
    from employees e, gradetbl g
    where e.salary >= g.minsalary and e.salary <= g.maxsalary;

select e.first_name, e.salary, g.grade
    from employees e, gradetbl g
    where e.salary between g.minsalary and g.maxsalary;
