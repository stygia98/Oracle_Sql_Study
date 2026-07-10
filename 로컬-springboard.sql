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

select * from board where boardno > 0 order by regdate desc;

select * from board where boardno = 5;

delete from board where boardno = 1;

update board set title='aaa', content='bbb', writer='ccc' where boardno = 4;
rollback;



create table jpaboard(
	boardNo     number,
	title       varchar2(200)   not null,
	content    varchar2(1000),
	writer      varchar2(100)   not null,
	regDate     Date            default sysdate     not null,
    
    CONSTRAINT pk_jpaboard_no primary key(boardNo)
);
create sequence jpaboard_seq
start with 1
increment by 1
NOCYCLE
CACHE 2;




desc jpaboard;
select * from jpaboard;
select * from user_tables;
select * from user_sequences;
select * from user_constraints;
