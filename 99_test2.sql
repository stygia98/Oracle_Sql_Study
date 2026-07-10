--﻿① VIDEOS (동영상 테이블)
--VIDEO_ID가 기본키(PK)입니다.
--﻿VIDEO_ID (영상번호)	TITLE (영상제목)	VIEWS (조회수)	UPLOAD_DATE (업로드일)
--1001	스마트폰 글자 크기 키우는 법	5,200	2026-01-10
--1002	보이스피싱 예방 필수 설정 3가지	12,000	2026-01-15
--1003	맛있는 돋보기 앱 추천 및 활용	850	    2026-01-20
--1004	단풍 구경하기 좋은 국내 여행지	3,100	2026-01-25

select * from VIDEOS;
drop table VIDEOS;

create table VIDEOS (
    VIDEO_ID        number,
    TITLE           varchar2(100),
    VIEWS           number,
    UPLOAD_DATE     date,
    constraint pk_VIDEOS_ID primary key (VIDEO_ID)
);

INSERT INTO VIDEOS VALUES (1001, '스마트폰 글자 크기 키우는 법',    5200,   Date '2026-01-10');
INSERT INTO VIDEOS VALUES (1002, '보이스피싱 예방 필수 설정 3가지', 12000,  Date '2026-01-10');
INSERT INTO VIDEOS VALUES (1003, '맛있는 돋보기 앱 추천 및 활용',   850,    Date '2026-01-10');
INSERT INTO VIDEOS VALUES (1004, '단풍 구경하기 좋은 국내 여행지',  3100,   Date '2026-01-10');

--﻿② COMMENTS (댓글 테이블)
--COMMENT_ID가 기본키(PK)이며, VIDEO_ID는 외래키(FK)입니다.
--COMMENT_ID (댓글번호)	VIDEO_ID (영상번호)	USER_NAME (작성자)	CONTENT (댓글내용)
--1	1001	박민석	덕분에 눈이 아주 시원해졌습니다!
--2	1001	이영희	친구들에게도 공유해 줬어요.
--3	1002	김정수	당장 설정했습니다. 감사합니다.
--4	1003	최순자	우리 나이에 꼭 필요한 앱이네요.
--5	1005	홍길동	이 영상은 다시 볼 수 없나요?

select * from COMMENTS;
drop table COMMENTS;

create table COMMENTS (
    COMMENT_ID      number,
    VIDEO_ID        number,
    USER_NAME       varchar2(20),
    CONTENT        varchar2(500),
    constraint pk_COMMENTS_ID primary key (COMMENT_ID),
    constraint fk_COMMENTS_VIDEOS_ID foreign key(VIDEO_ID) references VIDEOS(VIDEO_ID)
);

INSERT INTO COMMENTS VALUES (1, 1001, '박민석', '덕분에 눈이 아주 시원해졌습니다!');
INSERT INTO COMMENTS VALUES (2, 1001, '이영희', '친구들에게도 공유해 줬어요.');
INSERT INTO COMMENTS VALUES (3, 1002, '김정수', '당장 설정했습니다. 감사합니다.');
INSERT INTO COMMENTS VALUES (4, 1003, '최순자', '우리 나이에 꼭 필요한 앱이네요.');
INSERT INTO COMMENTS VALUES (5, 1003, '홍길동', '이 영상은 다시 볼 수 없나요?');



select * from VIDEOS;

--﻿Q. 댓글이 작성된 동영상의 '영상제목'과 해당 댓글을 쓴 '작성자', '댓글내용'을 조회하는 SQL 문을 작성하세요.
Select v.TITLE, c.USER_NAME, c.CONTENT
    from COMMENTS c inner join VIDEOS v
    on c.VIDEO_ID = v.VIDEO_ID;

--﻿Q. 댓글 중에서 '조회수(VIEWS)가 5,000회 이상'인 
--인기 영상에 달린 댓글의 '영상제목', '작성자', '조회수'를 조회하세요.
Select v.TITLE, c.USER_NAME, v.VIEWS
    from COMMENTS c inner join VIDEOS v
    on c.VIDEO_ID = v.VIDEO_ID
    where v.VIEWS >= 5000;
    
    
Select v.TITLE, c.USER_NAME, v.VIEWS
    from COMMENTS c inner join VIDEOS v
    on c.VIDEO_ID = v.VIDEO_ID
    where v.VIEWS >= 5000;
