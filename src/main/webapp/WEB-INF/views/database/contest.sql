
select * from contest;

select * from member;
select * from community;

-- ALTER TABLE contest RENAME COLUMN count TO cnt;

SELECT DATE_ADD(NOW(), INTERVAL 1 DAY);

update contest set useyn = 'Y' where useyn = 'W';
update member set useyn = 'Y' where userid = 'user1';

INSERT INTO contest (userid , subject, content, lastdate)
values ('user1', '누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 7 DAY));



INSERT INTO contest (userid , subject, content, lastdate)
values ('user5','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));


INSERT INTO contest (userid, subject, content, lastdate)
values ('user1','누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 7 DAY));
INSERT INTO contest (userid, subject, content, lastdate)
values ('user2' ,'아무거나 1등 하는 강아지 고양이 찾아보쟈!' , '강아지든 고양이든 누가 최고인지 한번 찾아봅시다!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));


INSERT INTO contest (userid, subject, content, lastdate)
values ('user1' ,'누가 더 이쁜 발바닥을 가지고 있는가!' , '세상에서 제일이쁜 우리 강아지의 발바닥을 자랑해보세요! 1등하신분껜 무한 칭찬을 !' ,
DATE_ADD(NOW(), INTERVAL 1 DAY));




select * from contest_pet;
select * from contest;
select * from contest_reply;
select * from contestpetiv_view;
select * from member;

insert into contest_reply (cseq, userid , content) 
values(3 , 'user1' , '저는 까미 응원합니다.... 너무 귀여워요!! 화이팅입니다!');
insert into contest_reply (cseq, userid , content) 
values(3 , 'user2' , '넘 귀여워요!. 저희 아이도 나중에 참가해볼게요!');
insert into contest_reply (cseq, userid , content) 
values(3 , 'user1' , '저는 까미 응원합니다.... 너무 귀여워요!! 화이팅입니다!');
insert into contest_reply (cseq, userid , content) 
values(3 , 'user2' , '넘 귀여워요!. 저희 아이도 나중에 참가해볼게요!');

--where lastdate > now()
select * from contestpet_view where lastdate > now() and createdate > DATE_SUB(NOW(), INTERVAL 3 DAY) and allpcnt >= 3 order by cnt desc limit 3;


CREATE OR REPLACE VIEW contestpetiv_view AS
SELECT a.cseq , b.cpseq , b.content , b.recommends , b.image , b.saveimage ,
m.petgender , m.petname , m.kind , m.userid  , m.nickname , m.pwd as password

FROM contest AS a, contest_pet AS b , member AS m
WHERE a.cseq = b.cseq and b.userid = m.userid ;

select * from contestpetiv_view;
select * from contestpet_view;

CREATE OR REPLACE VIEW contestpet_view AS
SELECT 
    a.cseq AS cseq,
    a.userid AS userid,
    a.subject AS subject,
    a.content AS content,
    a.createdate AS createdate,
    a.lastdate AS lastdate,
    a.cnt AS cnt,
    a.useyn AS useyn,
    a.pcnt AS pcnt,
    SUM(CASE WHEN b.cseq IS NULL THEN 0 ELSE 1 END) AS allpcnt,
    m.nickname AS nickname 
FROM 
    contest AS a
LEFT JOIN 
    contest_pet AS b ON a.cseq = b.cseq
JOIN 
    member AS m ON a.userid = m.userid
GROUP BY 
    a.cseq, a.userid, a.subject, a.content, a.createdate, a.lastdate, a.cnt, a.useyn, a.pcnt, m.nickname;

select * from contestpet_view  WHERE subject LIKE '%%'   order by cseq desc limit 5 offset 0;

select * from contest_pet;

select * from contestpet_view;

-- 1. user id 로 내가 참가한 이미 조회
select * from contestpetiv_view;

-- 2. cseq 
select * from contestpet_view;



select * from member;






select * from contest;
select * from contestpetiv_view;
update contest_pet set gender = 'M' where gender is null;
update member set petname = 'dongdong' where petname is null;
update member set petgender = 'M' where petgender is null;
update contest set useyn = 'Y' where cseq = 50;

select * from contest_reply;
-- contest_reply  댓글 불러오기


select * from member;

INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind) VALUES
('닉네임1', 'user1', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지'),
('닉네임2', 'user2', '0000', '김철수', '010-9876-5432', 'user2@example.com', '카미', 'F', '고양이'),
('닉네임3', 'user3', '0000', '이영희', '010-1111-2222', 'user3@example.com', '뽀삐', 'F', '강아지'),
('닉네임4', 'user4', '0000', '박미영', '010-3333-4444', 'user4@example.com', '맥스', 'M', '강아지');


update member set image = 'pet_image2.jpg' , saveimage = 'pet_image2.jpg'  where userid ='user1';


insert into contest_pet (userid  , cseq , content , image, saveimage ) values 
('user2', 39 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 39 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );

insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user2', 39 ,'저희 강아지좀 보세요 대박이에요.2' , 'pet_image2.jpg','pet_image2.jpg' );
insert into contest_pet (userid  , cseq , content , image, saveimage) values 
('user1', 6 ,'저희 강아지좀 보세요 대박이에요.' , 'pet_image1.jpg','pet_image1.jpg' );


INSERT INTO member (nickname, userid, pwd, name, phone, email) VALUES
('닉네임6', 'user6', '0000', '홍길동', '010-1234-5678', 'user1@example.com');

INSERT INTO member (nickname, userid, pwd, name, phone, email, petname, petgender, kind , image , saveimage) VALUES
('닉네임5', 'user5', '0000', '홍길동', '010-1234-5678', 'user1@example.com', 'ALEX', 'F' ,'강아지' , 'profileimage1.jpg' , 'profileimage1.jpg');

select * from member;
select * from contest;

update contest set useyn = 'Y' where useyn = 'W';


INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));
INSERT INTO contest (userid, useyn, subject, content, lastdate)
values ('user1','Y','누가 더 사랑스러운 반려동물을 가지고 있는가!' , '사랑스러운 반려동물들을 찾아보세요!! 지금 바로 여러분의 귀여운 동물 사진들을 올려주세요!' ,
DATE_ADD(NOW(), INTERVAL 3 DAY));

update contest set useyn = 'Y' where useyn = 'W';

select * from community;


select * from contestpet_view order by useyn desc  , cseq desc limit 5  ;



DELIMITER //



CREATE OR REPLACE VIEW reply_all_view AS
SELECT 
   a.userid as community_userid , a.gseq as community_gseq , a.grseq as community_grseq , a.content as community_content , a.createdate as community_createdate ,
   b.crseq as contest_crseq , b.cseq as contest_cseq , b.userid as contest_userid ,  b.createdate as contest_createdate ,  b.content as contest_content
FROM 
    community_reply AS a , contest_reply AS b 
where a.userid = 'user1' and b.userid ='user1';




select * from reply_all_view;
select * from community_reply;
select * from contest_reply;

    

INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('user1', 2, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');
INSERT INTO community_reply (userid, gseq, content, createdate) 
VALUES ('user1', 3, '이 게시글 정말 좋네요!', '2024-06-01 10:00:00');

DROP PROCEDURE get_user_comments;

DELIMITER //


CREATE PROCEDURE get_user_comments(IN input_userId VARCHAR(255))
BEGIN
    SELECT 
        'community' AS source,
        cr.userid AS user_id,
        cr.gseq AS post_id,
        cr.grseq AS reply_id,
        cr.content AS reply_content,
        cp.subject AS subject, 
        cr.createdate AS reply_date
    FROM 
        community_reply cr
    INNER JOIN community cp ON cr.gseq = cp.gseq 
    WHERE 
        cr.userid = input_userId

    UNION ALL

    SELECT 
        'contest' AS source,
        ct.userid AS user_id,
        ct.cseq AS post_id,
        ct.crseq AS reply_id,
        ct.content AS reply_content,
        cp.subject AS subject,
        ct.createdate AS reply_date
    FROM 
        contest_reply ct
    INNER JOIN contest cp ON ct.cseq = cp.cseq 
    WHERE 
        ct.userid = input_userId
    ORDER BY 
        reply_date DESC;
END;



CALL get_user_comments('user1');




select * from admins;

insert into admins (adminid , pwd , name , phone) values ('admin' , '0000' , '관리자' , '010-0000-0000' );



INSERT INTO qnareply (category, subject, content, reply, userid, createdate)
VALUES 
    (1,'샘플 제목 1', '샘플 내용 1', '샘플 답변 1', 'user1', NOW()),
    (2,'샘플 제목 2', '샘플 내용 2', '샘플 답변 2', 'user4', NOW()),
    (3,'샘플 제목 3', '샘플 내용 3', '샘플 답변 3', 'user3', NOW()),
    (1,'샘플 제목 4', '샘플 내용 4', '샘플 답변 4', 'user4', NOW()),
    (2,'샘플 제목 5', '샘플 내용 5', '샘플 답변 5', 'user2', NOW()),
    (3,'샘플 제목 6', '샘플 내용 6', '샘플 답변 6', 'user2', NOW()),
    (1,'샘플 제목 7', '샘플 내용 7', '샘플 답변 7', 'user5', NOW()),
    (2,'샘플 제목 8', '샘플 내용 8', '샘플 답변 8', 'user2', NOW()),
    (3,'샘플 제목 9', '샘플 내용 9', '샘플 답변 9', 'user1', NOW()),
    (1, '샘플 제목 10', '샘플 내용 10', '샘플 답변 10', 'user1', NOW()),
    (2, '샘플 제목 11', '샘플 내용 11', '샘플 답변 11', 'user1', NOW()),
    (3, '샘플 제목 12', '샘플 내용 12', '샘플 답변 12', 'user1', NOW()),
    (1, '샘플 제목 13', '샘플 내용 13', '샘플 답변 13', 'user1', NOW()),
    (1, '샘플 제목 14', '샘플 내용 14', '샘플 답변 14', 'user1', NOW()),
    (2, '샘플 제목 15', '샘플 내용 15', '샘플 답변 15', 'user1', NOW());
    
SELECT * FROM qnareply;


SELECT COUNT(*) AS cnt FROM community where kind = 2