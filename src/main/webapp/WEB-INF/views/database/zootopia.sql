SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS community_reply;
DROP TABLE IF EXISTS community;
DROP TABLE IF EXISTS contest_pet;
DROP TABLE IF EXISTS contest_reply;
DROP TABLE IF EXISTS contest;
DROP TABLE IF EXISTS qnareply;
DROP TABLE IF EXISTS member;

DROP TABLE IF EXISTS qnadate ;



/* Create Tables */

CREATE TABLE admins
(
   adminid varchar(60) NOT NULL,
   pwd varchar(60) NOT NULL,
   name varchar(60) NOT NULL,
   phone varchar(60) NOT NULL,
   PRIMARY KEY (adminid)
);


CREATE TABLE community
(
   gseq int NOT NULL AUTO_INCREMENT,
   vcount int(4) DEFAULT 0 NOT NULL,
   userid varchar(30) NOT NULL,
   subject varchar(50) NOT NULL,
   content varchar(1000) NOT NULL,
   recommands int(4) DEFAULT 0 NOT NULL,
   kind int NOT NULL,
   createdate datetime DEFAULT now() NOT NULL,
   PRIMARY KEY (gseq)
);


CREATE TABLE community_reply
(
   userid varchar(30) NOT NULL,
   gseq int NOT NULL,
   grseq int NOT NULL AUTO_INCREMENT,
   content varchar(1000) NOT NULL,
   createdate datetime DEFAULT now() NOT NULL,
   PRIMARY KEY (grseq)
);


CREATE TABLE contest
(
   cseq int NOT NULL AUTO_INCREMENT,
   userid varchar(30) NOT NULL,
   subject varchar(60) NOT NULL,
   content varchar(1000) NOT NULL,
   lastdate datetime NOT NULL,
   createdate datetime DEFAULT now(),
   cnt int(5) DEFAULT 0 NOT NULL,
   useyn char(1) DEFAULT 'W' NOT NULL,
   pcnt int DEFAULT 6 NOT NULL,
   PRIMARY KEY (cseq)
);


CREATE TABLE contest_pet
(
   cpseq int NOT NULL AUTO_INCREMENT,
   userid varchar(30) NOT NULL,
   cseq int NOT NULL,
   content varchar(1000) NOT NULL,
   recommends int(4) DEFAULT 0 NOT NULL,
   image varchar(255) NOT NULL,
   saveimage varchar(255) NOT NULL,
   PRIMARY KEY (cpseq)
);


CREATE TABLE contest_reply
(
   crseq int NOT NULL AUTO_INCREMENT,
   cseq int NOT NULL,
   userid varchar(30) NOT NULL,
   createdate datetime DEFAULT now() NOT NULL,
   content varchar(1000) NOT NULL,
   PRIMARY KEY (crseq)
);


CREATE TABLE member
(
   userid varchar(30) NOT NULL,
   nickname varchar(30) NOT NULL,
   pwd varchar(60) NOT NULL,
   name varchar(60) NOT NULL,
   phone varchar(60) NOT NULL,
   email varchar(100) NOT NULL,
   createdate datetime DEFAULT now() NOT NULL,
   image varchar(255),
   saveimage varchar(255),
   kind varchar(10),
   useyn char(1) DEFAULT 'Y' NOT NULL,
   petname varchar(60),
   petgender char(1),
   PRIMARY KEY (userid)
);


CREATE TABLE qnareply
(
	qseq int NOT NULL AUTO_INCREMENT,
	category int NOT NULL,
	userid varchar(30) NOT NULL,
	subject varchar(100) NOT NULL,
	content varchar(1000) NOT NULL,
	reply varchar(1000),
	createdate datetime DEFAULT now() NOT NULL,
	PRIMARY KEY (qseq)
);




/* Create Foreign Keys */

ALTER TABLE community
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE community_reply
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE community_reply
	ADD FOREIGN KEY (gseq)
	REFERENCES community (gseq)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE contest_pet
	ADD FOREIGN KEY (cseq)
	REFERENCES contest (cseq)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE contest_reply
	ADD FOREIGN KEY (cseq)
	REFERENCES contest (cseq)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;




ALTER TABLE contest
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE contest_pet
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE contest_reply
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;


ALTER TABLE qnareply
	ADD FOREIGN KEY (userid)
	REFERENCES member (userid)
	ON UPDATE CASCADE
	ON DELETE CASCADE
;

select*from community; 

