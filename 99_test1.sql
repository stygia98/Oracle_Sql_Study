
--﻿① CUSTOMERS (고객 테이블)
--CUSTOMER_ID가 기본키(PK)입니다.
--CUSTOMER_ID (고객번호)	CUSTOMER_NAME (이름)	AGE (연령)	PHONE (연락처)
--101	김석우	65	010-1234-5678
--102	이순자	72	010-9876-5432
--103	박정호	61	010-5555-4444
--104	정명숙	68	010-2222-3333

select * from user_tables;

drop table CUSTOMERS;
select * from CUSTOMERS;

create TABLE CUSTOMERS (
    CUSTOMER_ID     number(3),      
    CUSTOMER_NAME   varchar2(20)    not null,
    AGE             number(3)       not null,
    PHONE           char(14)        not null,
    constraint pk_CUSTOMERS_ID primary key(CUSTOMER_ID),
    constraint ck_CUSTOMERS_AGE check (AGE>=1 and AGE<=130),
    constraint uk_CUSTOMERS_PHONE unique(PHONE)
);

insert into CUSTOMERS values (101,	'김석우',	65,	'010-1234-5678');
insert into CUSTOMERS values (102,	'이순자',	72,	'010-9876-5432');
insert into CUSTOMERS values (103,	'박정호',	61,	'010-5555-4444');
insert into CUSTOMERS values (104,	'정명숙',	68,	'010-2222-3333');

--﻿② ORDERS (주문 테이블)
--ORDER_ID가 기본키(PK)이며, CUSTOMER_ID는 고객 테이블을 참조하는 외래키(FK)입니다.
--ORDER_ID (주문번호)	CUSTOMER_ID (고객번호)	PRODUCT_NAME (상품명)	PRICE (가격)
--1	101	갤럭시 S24	1,150,000
--2	102	아이폰 15	1,250,000
--3	101	갤럭시 워치 6	350,000
--4	103	효도라디오	45,000
--5	105	스마트폰 케이스	25,000

drop table ORDERS;
select * from ORDERS;

create table ORDERS (
    ORDER_ID        number(3),
    CUSTOMER_ID     number(3)       not null,
    PRODUCT_NAME    varchar2(50),
    PRICE           number(30),
    constraint pk_ORDERS_ID primary key(ORDER_ID),
    constraint fk_ORDERS_CUSTOMERS_ID foreign key (CUSTOMER_ID) references CUSTOMERS(CUSTOMER_ID)
);

INSERT INTO ORDERS VALUES (1,	101, '갤럭시 S24',       1150000);
INSERT INTO ORDERS VALUES (2,	102, '아이폰 15',        1250000);
INSERT INTO ORDERS VALUES (3,	101, '갤럭시 워치 6',    350000);
INSERT INTO ORDERS VALUES (4,	103, '효도라디오',       45000);
INSERT INTO ORDERS VALUES (5,	105, '스마트폰 케이스',  25000);

--delete from ORDERS where ORDER_ID = 5;



--﻿Q. 주문을 완료한 고객들의 이름과 그들이 구매한 
--상품명, 가격을 조회하는 SQL 문을 작성하세요.
select c.CUSTOMER_ID, c.CUSTOMER_NAME, o.PRODUCT_NAME, o.PRICE
    from ORDERS o inner join CUSTOMERS c
    on o.CUSTOMER_ID = c.CUSTOMER_ID;
    
--﻿Q. 주문 내역 중 '가격(PRICE)이 100만 원 이상'인 고가 상품을 구매한
--고객의 이름, 상품명, 가격을 조회하는 SQL 문을 작성하세요.
select c.CUSTOMER_ID, c.CUSTOMER_NAME, o.PRODUCT_NAME, o.PRICE
    from ORDERS o inner join CUSTOMERS c
    on o.CUSTOMER_ID = c.CUSTOMER_ID
    where o.price>=1000000;
    
--﻿Q. 각 고객별로 구매한 '총 주문 금액'을 구하려고 합니다.
--고객의 이름(CUSTOMER_NAME)과 총 주문 금액(PRICE의 합계)을 조회하는 SQL 문을 작성하세요.
select c.CUSTOMER_NAME AS "고객명", SUM(o.PRICE) AS "총구매액"
    FROM CUSTOMERS c INNER JOIN ORDERS o
    ON c.CUSTOMER_ID = o.CUSTOMER_ID GROUP BY c.CUSTOMER_NAME ORDER BY "총구매액" DESC;
