---------------------------------------------------------------------
-------------------------- for JDBC board ---------------------------
---------------------------------------------------------------------
create table board(
	boardNo     number,
	title       varchar2(200)   not null,
	content    varchar2(1000),
	writer      varchar2(100)   not null,
	regDate     Date            default sysdate     not null,
    
    CONSTRAINT pk_board_no primary key(boardNo)
);

create sequence board_seq
    start with 1
    increment by 1
    NOCYCLE
    CACHE 2;

insert into board(boardNo, title, content, writer) values(board_seq.nextval, 'title1', 'content1', 'zeus1');
update board set title='aaa', content='bbb', writer='ccc' where boardno = 4;
delete from board where boardno = 1;
select * from board where boardno > 0 order by regdate desc;
select * from board where boardno = 5;



---------------------------------------------------------------------
--------------------------- for JPA board ---------------------------
---------------------------------------------------------------------
create table jpaboard(
	board_No    number,
	title       varchar2(200)   not null,
	content    varchar2(1000),
	writer      varchar2(100)   not null,
	reg_Date    Date            default sysdate     not null,
    
    CONSTRAINT pk_jpaboard_no primary key(board_No)
);

create sequence jpaboard_seq
    start with 1
    increment by 1
    NOCYCLE
    CACHE 2;

---------------------------------------------------------------------
------------------------- for MyBatis board -------------------------
---------------------------------------------------------------------
CREATE TABLE mybatisboard (
    board_no NUMBER,
    title VARCHAR2(100)     NOT NULL,
    content VARCHAR2(500)  NULL,
    writer VARCHAR2(50)     NOT NULL,
    reg_date DATE           DEFAULT SYSDATE,
    constraint pk_mybatisboard_no PRIMARY KEY (board_no)
);

create sequence mybatisboard_seq
    start with 1
    increment by 1;

SELECT board_no, title,	content, writer, reg_date
    FROM mybatisboard WHERE board_no > 0
    AND title LIKE '%2%'
    ORDER BY board_no DESC, reg_date DESC;

select * from mybatisboard;

---------------------------------------------------------------------
------------------------- for MyBatis member ------------------------
---------------------------------------------------------------------
CREATE TABLE mybatismember (
    user_no     NUMBER,
    user_id     VARCHAR2(50)    NOT NULL,
    user_pw     VARCHAR2(50)    NOT NULL,
    user_name   VARCHAR2(100)   NOT NULL,
    coin        NUMBER(10)      DEFAULT 0,
    reg_date    DATE            DEFAULT SYSDATE,
    upd_date    DATE            DEFAULT SYSDATE,
    enabled     CHAR(1)         DEFAULT '1',
    constraint pk_mybatismember_no PRIMARY KEY (user_no)
);

CREATE TABLE mybatismember_auth (
    user_no     NUMBER          NOT NULL,
    auth        VARCHAR2(50)    NOT NULL
);

ALTER TABLE mybatismember_auth
ADD CONSTRAINT fk_mybatismember_auth_user_no FOREIGN KEY(user_no) REFERENCES mybatismember(user_no) on delete CASCADE;
ALTER TABLE mybatismember_auth
DROP CONSTRAINT fk_mybatismember_auth_user_no;

create sequence mybatismember_seq
    start with 1
    increment by 1;

select mybatismember_seq.NEXTVAL FROM DUAL;

--INSERT INTO mybatismember (user_no, user_id, user_pw, user_name)
--VALUES (#{userNo}, #{userId}, #{userPw}, #{userName});

--INSERT INTO mybatismember_auth (user_no, auth)
--VALUES (#{userNo}, #{auth})

SELECT user_no, user_id, user_pw, user_name, reg_date
		FROM mybatismember
		ORDER BY reg_date DESC;

UPDATE mybatismember
		SET user_name = 'tomcat'
		WHERE user_no = 4;

DELETE FROM mybatismember
		WHERE user_no = 4;

DELETE FROM mybatismember_auth
		WHERE user_no = 8;

INSERT INTO mybatismember_auth VALUES (6, 'ROLE_MEMBER');
INSERT INTO mybatismember_auth VALUES (8, 'ROLE_ADMIN');
INSERT INTO mybatismember_auth VALUES (7, 'ROLE_MEMBER');
INSERT INTO mybatismember_auth VALUES (7, 'ROLE_USER');

SELECT m.user_no, user_id, user_pw, user_name, reg_date, upd_date, a.auth
		FROM mybatismember m INNER JOIN mybatismember_auth a ON m.user_no = a.user_no
		WHERE m.user_no = 7;
commit;

---------------------------------------------------------------------
--------------------------- for MyBatis item ------------------------
---------------------------------------------------------------------
CREATE TABLE item (
    item_id         NUMBER(5),
    item_name       VARCHAR2(50),
    price           NUMBER(10),
    description    VARCHAR2(100),
    picture_url     VARCHAR2(200),
    constraint pk_item_id PRIMARY KEY (item_id)
);

CREATE TABLE item_attach ( 
    fullName        VARCHAR2(100), 
    item_id         NUMBER(5)       NOT NULL,
    regdate         DATE DEFAULT SYSDATE,
    constraint pk_item_attach_id PRIMARY KEY (fullName)
);

create sequence item_seq
start with 1
increment by 1;

SELECT item_seq.NEXTVAL FROM DUAL;

INSERT INTO item ( item_id, item_name, price, description, picture_url )
    VALUES ( item_seq.NEXTVAL, 123, 123, 'test1', 'test2' );

SELECT item_id, item_name, price, description, picture_url
    FROM item WHERE item_id = 3;

UPDATE item 
    SET item_name = 234, price = 234, description = 'test2', picture_url = 'test3'
    WHERE item_id = 3;

DELETE FROM item 
    WHERE item_id = 3;

SELECT item_id, item_name, price, description, picture_url
    FROM item WHERE item_id > 0 ORDER BY item_id DESC;

SELECT picture_url
	FROM item WHERE item_id = 4;
    



rollback;
commit;
desc mybatismember;

select * from item;
select * from mybatismember_auth;
select * from user_tables;
select * from user_sequences;
select * from user_constraints where table_name = upper('mybatismember_auth');
drop table mybatismember;
drop SEQUENCE mybatismember_seq;
