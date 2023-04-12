-- 회원 테이블 생성
DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member (
	email	VARCHAR2(40)		 PRIMARY KEY,
	pwd	 VARCHAR2(20)		NOT NULL,
	name	VARCHAR2(40)		NOT NULL,
	phone   VARCHAR2(20)		NOT NULL,
	joindate	DATE	DEFAULT SYSDATE	NOT NULL
);


-- 사업자 테이블 생성
DROP TABLE host CASCADE CONSTRAINTS;

CREATE TABLE host (
	hemail	VARCHAR2(40)		 PRIMARY KEY,
	pwd	VARCHAR2(20)		NOT NULL,
	phone	VARCHAR2(20)		NOT NULL,
	name	VARCHAR2(20)		NOT NULL,
    status  NUMBER(1)   DEFAULT 0 
);



-- 숙박업체 테이블 생성
DROP TABLE accommodation CASCADE CONSTRAINTS;

CREATE TABLE accommodation (
	aseq	NUMBER(38)		 PRIMARY KEY,
	hemail	VARCHAR2(40)		NOT NULL,
	aname	VARCHAR2(100)		NOT NULL,
	category	NUMBER(1)		NOT NULL, -- 0:호텔/리조트, 1:모텔, 2:펜션/풀빌라, 3:게스트하우스,호스텔
	address VARCHAR2(300)		NULL,
	tel	VARCHAR2(20)		NULL,
	bestyn	CHAR(1)	DEFAULT 'n'	NULL, --y: 베스트상품, n:베스트상품x
	aimage	VARCHAR2(50)	DEFAULT 'default.jpg'	NULL,
	FOREIGN KEY(hemail) REFERENCES host(hemail) ON DELETE CASCADE
);

DROP SEQUENCE accommodation_seq ;

CREATE SEQUENCE accommodation_seq START WITH 241 INCREMENT BY 1; 


-- 객실 테이블 생성
DROP TABLE room CASCADE CONSTRAINTS;

CREATE TABLE room (
	rseq	NUMBER(38)		 PRIMARY KEY,
	aseq	NUMBER(38)		NOT NULL,
	rname	VARCHAR2(300)		NOT NULL,
	price	NUMBER(10)	DEFAULT 0	NOT NULL,
	maxcap	INT	DEFAULT 1	NOT NULL,
	ckintime	VARCHAR2(10)	DEFAULT '15:00'	NOT NULL,
	ckouttime	VARCHAR2(10)	DEFAULT '11:00'	NOT NULL,
	rooms	NUMBER(5)	DEFAULT 0	NOT NULL,
	bathroom	NUMBER(5)	DEFAULT 1	NOT NULL,
	bed VARCHAR2(100)		NOT NULL,
	wifi	NUMBER(1)	DEFAULT 1	NOT NULL, -- 0:없음, 1:있음 
	kitchen	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	pool	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	ac	NUMBER(1)	DEFAULT 1	NOT NULL, -- 0:없음, 1:있음
	tv	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	coffeemachine	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	fridge	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	bathtub	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	parking	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	heater	NUMBER(1)	DEFAULT 1	NOT NULL, -- 0:없음, 1:있음
	microwave	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	kettle	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	washer	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	bbq	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	hairdrier	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	amenity	NUMBER(1)	DEFAULT 1	NOT NULL, -- 0:없음, 1:있음
	towel	NUMBER(1)	DEFAULT 1	NOT NULL, -- 0:없음, 1:있음
	elevator	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	breakfast	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	smoking	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:금연, 1:흡연
	gym	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	roomservice	NUMBER(1)	DEFAULT 0	NOT NULL, -- 0:없음, 1:있음
	rimage	VARCHAR2(50)	DEFAULT 'default.jpg'	NULL,
	FOREIGN KEY(aseq) REFERENCES accommodation(aseq) ON DELETE CASCADE
);
DROP SEQUENCE room_seq ;

CREATE SEQUENCE room_seq START WITH 511 INCREMENT BY 1; 

-- 예약 테이블 생성
DROP TABLE booking CASCADE CONSTRAINTS;

CREATE TABLE booking (
	bseq	NUMBER(38)		 PRIMARY KEY,
	rseq	NUMBER(38)	    NOT NULL,
	email	VARCHAR2(40)		NOT NULL,
	checkin	VARCHAR2(20)		NOT NULL,
	checkout	VARCHAR2(20)		NOT NULL,
	bprice	NUMBER(10)		NULL,
	payment	NUMBER(1)		NOT NULL, 
	status	NUMBER(1)	DEFAULT 0	NOT NULL, -- 1:예약완료, 2:입실완료, 3:이용완료
	bookdate	DATE	DEFAULT SYSDATE  NOT NULL,
	FOREIGN KEY(rseq) REFERENCES room(rseq) ON DELETE CASCADE,
    FOREIGN KEY(email) REFERENCES member(email) ON DELETE CASCADE
);

DROP SEQUENCE book_seq ;

CREATE SEQUENCE book_seq START WITH 71341 INCREMENT BY 1; 


-- 관리자 테이블 생성
DROP TABLE admin CASCADE CONSTRAINTS;

CREATE TABLE admin (
	email	VARCHAR2(40)		 PRIMARY KEY,
	pwd	VARCHAR2(20)		NOT NULL,
	name	VARCHAR2(20)		NOT NULL,
	phone	VARCHAR2(20)		NOT NULL
);


-- QnA 테이블 생성
DROP TABLE qna CASCADE CONSTRAINTS;

CREATE TABLE qna (
	qseq	NUMBER(38)		 PRIMARY KEY,
	email	VARCHAR2(40)		NOT NULL,
	subject	VARCHAR2(50)		NULL,
	content	VARCHAR2(1000)		NULL,
	reply	VARCHAR2(1000)		NULL,
	indate	DATE	DEFAULT SYSDATE	NULL,
	rep	NUMBER(1)	DEFAULT 0	NULL, -- 0:답변x, 1:답변o
	FOREIGN KEY(email) REFERENCES member(email) ON DELETE CASCADE
);

DROP SEQUENCE qna_seq ;

CREATE SEQUENCE qna_seq START WITH 51 INCREMENT BY 1; 



-- 리뷰 테이블 생성
DROP TABLE review CASCADE CONSTRAINTS;

CREATE TABLE review (
	reseq	NUMBER(38)		 PRIMARY KEY,
    rseq  NUMBER(38) NULL,
	bseq	NUMBER(38)		NULL,
    email	VARCHAR2(40) NULL,
	content	VARCHAR2(1000)		NULL,
	score	NUMBER(5) DEFAULT 0 NULL,
	indate	DATE	DEFAULT SYSDATE	NULL,
	reply	VARCHAR2(1000)		NULL,
    FOREIGN KEY(email) REFERENCES member(email),
	FOREIGN KEY(bseq) REFERENCES booking(bseq) ON DELETE CASCADE,
    FOREIGN KEY(rseq) REFERENCES room(rseq) ON DELETE CASCADE
);

DROP SEQUENCE review_seq ;

CREATE SEQUENCE review_seq START WITH 550 INCREMENT BY 1; 





-- 뷰 생성

DROP VIEW acc_room_view CASCADE CONSTRAINTS;

CREATE OR REPlACE VIEW acc_room_view AS
 SELECT r.aseq aseq, rseq,aname,rname,hemail, category, address, tel, price, maxcap, ckintime, ckouttime
 FROM accommodation a, room r
 WHERE a.aseq = r.aseq;


DROP VIEW booking_view CASCADE CONSTRAINTS;

CREATE OR REPLACE VIEW booking_view AS
SELECT aseq, b.bseq bseq, b.rseq rseq, hemail, b.email bemail,m.email memail, bookdate, aname, rname, m.name mname, 
        m.phone phone, r.tel tel, checkin, checkout, r.price rprice, bprice, payment, status
  FROM member m, booking b, acc_room_view r
 WHERE m.email=b.email 
 AND r.rseq=b.rseq
 ORDER BY bseq;



DROP VIEW list_room_view CASCADE CONSTRAINTS;

CREATE OR REPlACE VIEW list_room_view AS
 SELECT r.aseq aseq, rseq, hemail, aname, rname, category, address, tel, price, maxcap, ckintime, ckouttime,
        rooms, bathroom, bed, wifi, kitchen, pool, ac, tv, coffeemachine, fridge,bathtub,parking,heater,microwave,kettle,washer,
        bbq,hairdrier,amenity,elevator,breakfast,smoking,gym,roomservice, rimage,  aimage
 FROM accommodation a, room r
 WHERE a.aseq = r.aseq;

 
commit;


-- 기초데이터 입력
-- admin
insert into admin values('kozynest0330@gmail.com','0330','김신범','010-5421-7895');
insert into admin values('kozynest1104@gmail.com','1104','지원찬','010-4513-9875');
insert into admin values('kozynest0116@gmail.com','0116','조예리','010-1378-3254');
insert into admin values('kozynest0331@gmail.com','0331','김서연','010-9312-3311');
insert into admin values('kozynest862@gmail.com','dlwps112','김지연','010-9311-4012');

commit;

	