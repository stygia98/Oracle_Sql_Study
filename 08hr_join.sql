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









