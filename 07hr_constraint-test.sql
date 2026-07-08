--<Entity : 고객 테이블명 : v_gogek> 
--NO 속성명 칼럼명 자료형 크기 유일키 NULL허용 키 
--1 고객번호 g_code number 5 Y N PK 
--2 고객명 g_name varchar2 20 N 
--3 나이 g_age number 3 
--4 주소 g_addr varchar2 50 
--5 전화번호 g_tel varchar2 20

create table v_gogek(
    g_code  number(5)       not null,
    g_name  varchar2(20)    not null,
    g_age   number(3),
    g_addr  varchar2(50),
    g_tel   varchar2(20),
    constraint pk_v_gogek_gcode primary key(g_code)
);

--<Entity : 비디오 테이블명 : video> 
--NO 속성명 칼럼명 자료형 크기 유일키 NULL허용 키 
--1 비디오번호 v_code number 5 Y N PK
--2 제목 v_title varchar2 50 N 
--3 장르 v_genre varchar2 30 
--4 대여료 v_pay number 7 N 
--5 대여구분 v_lend_state number 1 
--6 출시사 v_make_company varchar2 50 
--7 출시일 v_make_date date 
--8 관람등급 v_view_age number 1

create table video(
    v_code          number(5)       not null,
    v_title         varchar2(50)    not null,
    v_genre         varchar2(30),
    v_pay           number(7)       not null,
    v_lend_state    number(1),
    v_make_company  varchar2(50),
    v_make_date     date            default sysdate,
    v_view_age      number(1),
    CONSTRAINT pk_video_vcode primary key(v_code),
    CONSTRAINT ck_video_v_state check(v_lend_state in ('Y','N'))
);

--<Entity : 대여반납 테이블명 : lend_return>
--NO 속성명 칼럼명 자료형 크기 유일키 NULL허용 키
--1 대여번호 lr_code number 5 Y N PK
--2 고객번호 g_code number 5 Y N FK
--3 비디오번호 v_code number 5 Y N FK
--4 대여일자 l_date date
--5 반납예정일자 r_plan_date date
--6 대여총액 l_total_pay number 7

create table lend_return(
    lr_code     number(5)   not null,
    g_code      number(5)   not null,
    v_code      number(5)   not null,
    l_date      date        default sysdate,
    r_plan_date date        default sysdate,
    l_total_pay number(7),
    CONSTRAINT pk_lend_lr primary key(lr_code),
    CONSTRAINT fk_lend_gogek_gcode FOREIGN key(g_code) REFERENCES v_gogek(g_code) on DELETE SET NULL,
    CONSTRAINT fk_lend_video_vcode FOREIGN key(v_code) REFERENCES video(v_code) on DELETE SET NULL
);
