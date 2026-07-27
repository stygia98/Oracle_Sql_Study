Drop user springuser CASCADE;



-- 사용자 설정 (id javauser / pw javauser / tablespace firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user javauser IDENTIFIED by javauser
default TABLESPACE firstData
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser 접속권한)
grant CONNECT, RESOURCE TO javauser;

-- 접속요청 진행



-- 사용자 설정 (id javauser / pw javauser / tablespace firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user springuser IDENTIFIED by springuser
default TABLESPACE users
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser 접속권한)
grant CONNECT, RESOURCE, dba TO springuser;

-- 접속요청 진행



-- 사용자 설정 (id javauser / pw javauser / tablespace firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user springboard IDENTIFIED by springboard
default TABLESPACE users
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (javauser 접속권한)
grant CONNECT, RESOURCE, dba TO springboard;

-- 접속요청 진행
