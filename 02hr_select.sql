-- select

SELECT * FROM departments;
SELECT department_id, department_name FROM departments;

-- <문제> EMPLOYEES 테이블의 모든 내용 출력
SELECT * FROM employees;

-- <문제> 사원의 이름과 급여와 입사일자 만을 출력하는 SQL 문을 작성해보자.
-- 힌트 : 사원 정보가 저장된 테이블은 EMPLOYEES이고, 사원이름 칼럼은 FIRST_NAME, LAST_NAME과,
-- 급여 칼럼은 SALARY, 입사일자 칼럼은 HIRE_DATE이다.

SELECT first_name, last_name, salary, hire_date FROM employees;
SELECT first_name as 성, last_name as 이름, salary as 급여, hire_date FROM employees;

-- 연결연산
SELECT * FROM employees;
SELECT '사원번호는 ' || employee_id || '이고 사원의 이름은 ' || first_name || last_name || '입니다' as info FROM employees;

-- 중복데이터 제외 출력
SELECT DISTINCT job_id FROM employees;

--<문제>직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고
--한번씩 출력하는 쿼리문을 작성하자.
SELECT DISTINCT department_id FROM employees;
 
-- 조건문
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary >= 3000;
SELECT * FROM employees WHERE salary >= 3000;

--<문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
--<문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력하라.
SELECT * FROM employees WHERE department_id = 110;
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary < 5000;

--<예> 이름(FIRST_NAME)이 'Lex'인 직원
SELECT employee_id, first_name, last_name, salary FROM employees WHERE first_name = 'Lex';

--<문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라.
SELECT employee_id, first_name, last_name, job_id FROM employees WHERE first_name = 'John';

--<예> 2008년 이후에 입사한 직원
SELECT first_name, hire_date FROM employees WHERE hire_date >= '2008/01/01';

--<예> 부서번호가 100번이고 직급이 FI_MGR인 직원
SELECT * FROM employees WHERE department_id = 100 AND job_id = 'FI_MGR';

--<문제>급여가 5000에서 10000이하 직원 정보 출력
SELECT * FROM employees WHERE salary >= 5000 AND salary <= 10000;
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 10000;

--<예> 부서번호가 100번이거나 직급이 FI_MGR인 직원
SELECT * FROM employees WHERE department_id = 100 OR job_id = 'FI_MGR';

--<문제> 직원번호가 134이거나 201이거나 107인 직원 정보 출력
SELECT * FROM employees WHERE employee_id = 134 OR employee_id = 201 OR employee_id = 107;

--<예> 부서번호가 100번이 아닌 직원
SELECT * FROM employees WHERE NOT department_id = 100;

--<문제> 직급이 FI_MGR가 아닌 직원
SELECT * FROM employees WHERE job_id != 'FI_MGR';

--<예> 급여가 2000에서부터 3000까지의 범위에 속한 사원
SELECT * FROM employees WHERE salary BETWEEN 2000 AND 3000;

--<문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라.
--(AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것)
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 4500;
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary >= 2500 AND salary <= 4500;

--<예>직원번호가 67이거나 101이거나 184인 사원
SELECT * FROM employees WHERE employee_id = 177 OR employee_id = 101 OR employee_id = 184;
SELECT * FROM employees WHERE employee_id IN(177, 101, 184);

--<문제> 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 
--직원번호, 이름, 급여, 커미션 비율을 출력하라. (OR 연산자와 IN 연산자 사용 모두 사용해볼것)
SELECT employee_id, first_name, last_name, salary, commission_pct FROM employees
    WHERE commission_pct = 0.3 OR commission_pct = 0.05 OR commission_pct = 0.1;
SELECT employee_id, first_name, last_name, salary, commission_pct FROM employees WHERE commission_pct IN(0.3, 0.05, 0.1);

--<예> K로 시작하는 사원
SELECT employee_id, first_name FROM employees WHERE first_name LIKE 'K%';
--<예> 이름 중에 k를 포함하는 사원
SELECT employee_id, first_name FROM employees WHERE first_name LIKE '%K%';
--<예> 이름이 k로 끝나는 사원
SELECT employee_id, first_name FROM employees WHERE first_name LIKE '%k';
--<예> 이름의 두 번째 글자가 d인 사원
SELECT * FROM employees WHERE first_name LIKE '_d%';

--<문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라.
SELECT * FROM employees WHERE first_name NOT LIKE '%a%' AND first_name NOT LIKE '%A%' AND last_name NOT LIKE '%a%' AND last_name NOT LIKE '%A%';
SELECT * FROM employees WHERE first_name NOT LIKE '%a%' AND last_name NOT LIKE '%a%';
SELECT * FROM employees WHERE UPPER(first_name) NOT LIKE '%A%' AND UPPER(last_name) NOT LIKE '%A%';

--<예> 커미션을 받지 않는 사원에 대한 검색
SELECT * FROM employees WHERE commission_pct IS NULL;
--<예> 커미션을 받는 사원
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

--<문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라
SELECT first_name, last_name, job_id, employee_id FROM employees WHERE manager_id IS NULL;

--<예>사번을 기준으로 오름차순으로 정렬
SELECT * FROM employees ORDER BY employee_id ASC;
--<예>사번을 기준으로 오름차순으로 정렬 / 부서가 100번이 아닌곳
SELECT * FROM employees WHERE department_id != 100 ORDER BY employee_id ASC;
--<예> 사원번호를 기준으로 내림차순으로 정렬
SELECT * FROM employees ORDER BY employee_id DESC;

--<문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라.
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC;

--<문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
SELECT employee_id, first_name, last_name, hire_date FROM employees ORDER BY hire_date DESC;


SELECT * FROM employees;
