--사용자정의 테이블
CREATE TABLE emp01 (
    empno NUMBER(4),
    empname varchar2(20),
    salary number(7,2)
);

SELECT * FROM emp01;

--테이블복사
CREATE TABLE employees2 AS SELECT * FROM employees;

--ALTER TABLE table_name ADD(column_name data_type expr, …);
ALTER TABLE employees2 add(job VARCHAR2(10));
ALTER TABLE employees2 add(credate DATE);

--<예> 직급을 최대 30자까지 입력할 수 있도록 크기 수정
ALTER TABLE employees2 MODIFY(job VARCHAR2(30));

--<예> employees2 / job에서 job_copy로 컬럼명을 변경.
ALTER TABLE employees2 RENAME COLUMN job TO job_copy;

--<예> employees2 / job_copy로 컬럼을 삭제.
ALTER TABLE employees2 DROP COLUMN job_copy;

--<예> employees2 테이블을 삭제.
DROP TABLE employees2;

--<예> employees2 테이블 이름을 employees3 으로 변경
RENAME employees2 TO employees3;
RENAME employees3 TO employees2;

-- DROP TABLE employees2; 테이블을 통으로 날림
-- TRUNCATE TABLE employees2; 자료들만 날림
TRUNCATE TABLE employees2;

--테이블명: TB_CUSTOMER. 기본키 설정방법: 컬럼명 자료형 PRIMARY KEY 
--필드명 영문 필드명 형식 크기 NULL허용 기본키 비고 
--고객코드 CUSTOMER_CD CHAR 7 NOT NULL PK PRIMARY KEY 설정 
--고객명 CUSTOMER_NM VARCHAR2 20 NOT NULL 
--성별 MW_FLG CHAR 1 NOT NULL M(남성) W(여성) 
--생일 BIRTH_DAY CHAR 8 NOT NULL 
--전화번호 PHONE_NUMBER VARCHAR2 16 
--이메일 EMAIL VARCHAR2 30 
--누적포인트 TOTAL_POINT NUMBER 10 
--등록일시 REG_DTTM CHAR 14

CREATE TABLE TB_CUSTOMER (
    CUSTOMER_CD     CHAR(7)         NOT NULL    PRIMARY KEY,
    CUSTOMER_NM     VARCHAR2(20)    NOT NULL,
    MW_FLG          CHAR(1)         NOT NULL,
    BIRTH_DAY       CHAR(8)         NOT NULL,
    PHONE_NUMBER    VARCHAR2(16),
    EMAIL           VARCHAR2(30),
    TOTAL_POINT     NUMBER(10),
    REG_DTTM        CHAR(14)
);

--학생 성적 테이블을 만들어 봅시다.
--1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
--2.이름은 문자데이터며 null값을 허용하지 않고
--국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
--단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.
--총점과 평균 컬럼은 기본값을 0을 갖습니다.

--학과코드는 학과 테이블에 학과 코드를 참조한다.(학과테이블 학과코드 PK -> FK)
--학번/이름/국어/영어/수학/총점/평균/학과코드 이게 컬럼명이다.
--학과테이블을 참조해서 (2 레코드) 입력한다.

CREATE TABLE tb_reportcard (
    std_no          NUMBER(10)  NOT NULL    PRIMARY KEY,
    std_name        CHAR(8)     NOT NULL,
    score_kor       number(4)   NOT NULL,
    score_math      number(4)   NOT NULL,
    score_eng       number(4)   NOT NULL,
    score_sum       number(4)   DEFAULT 0,
    score_avg       number(8)   DEFAULT 0,
    code_subject    VARCHAR2(10) -- FOREIGN KEY (no_subject)
);

CREATE TABLE tb_subject (
    no_subject number(2),
    name_subject VARCHAR(10),
    code_subject VARCHAR(10)
);



SELECT * FROM employees2;
DESC employees2;
SELECT * FROM TAB;
