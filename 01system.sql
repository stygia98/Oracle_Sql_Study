-- 1. 테이블 스페이스 생성하기
create TABLESPACE firstData
DATAFILE 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;

-- 수정 (추가)
alter TABLESPACE firstData
add DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' size 10M;

-- 수정 (사이즈)
alter DATABASE
DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' resize 20M;

-- 삭제
drop TABLESPACE firstData including contents and datafiles;

-- 저장공간 자동설정 (자동+1 / max20)
alter DATABASE
DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf'
AUTOEXTEND on
NEXT 1M
MAXSIZE 20M;

-- 사용자 설정 (id javauser / pw javauser / tablespace firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user javauser IDENTIFIED by javauser
default TABLESPACE firstData
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser 접속권한)
grant CONNECT, RESOURCE TO javauser;

-- 접속요청 진행



