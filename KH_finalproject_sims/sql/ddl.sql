@ -1,52 +1,6 @@
--통신사 테이블 생성
DROP TABLE BIZ;
CREATE TABLE BIZ (
	BIZ_NO	NUMBER	NOT NULL,
	BIZ_NAME	VARCHAR2(20)	NULL,
	BIZ_SSN	VARCHAR2(30)	NULL,
	BIZ_CRN	VARCHAR2(20)	NULL,
	BIZ_ID	VARCHAR2(30)	NULL,
	BIZ_PW	VARCHAR2(30)	NULL,
	BIZ_EMAIL	VARCHAR2(50)	NULL,
	BIZ_PHONE	VARCHAR2(20)	NULL,
	BIZ_FAX	VARCHAR2(20)	NULL,
	BIZ_OWNER_NAME	VARCHAR2(10)	NULL,
	BIZ_HP	VARCHAR2(100)	NULL,
	BIZ_LOCATION	VARCHAR2(200)	NULL,
	BIZ_CARD_PAY_DATE	VARCHAR2(20)	NULL,
	BIZ_ACC_PAY_DATE	VARCHAR2(20)	NULL,
	BIZ_CERTIFY	VARCHAR2(10)	NULL,
	BIZ_BEGIN_TIME	VARCHAR2(20)	NULL,
	BIZ_END_TIME	VARCHAR2(20)	NULL,
	BIZ_CLOSED_DAY	VARCHAR2(20)	NULL,
	SERVICE_SKT	VARCHAR2(20)	NULL,
	SERVICE_KT	VARCHAR2(20)	NULL,
	SERVICE_LGU	VARCHAR2(20)	NULL,
	PAYMENT_CARD	VARCHAR2(50)	NULL,
	PAYMENT_ACC	VARCHAR2(50)	NULL,
	BIZ_REVIEW_STAR	NUMBER	NULL,
	PHONE_OP_TIME	VARCHAR2(20)	NULL,
	PHONE_OP_TIME_USIM	VARCHAR2(20)	NULL,
	NETWORK	VARCHAR2(50)	NULL,
	WRITE_DATE	DATE	NOT NULL,
	UPDATE_DATE	DATE	NULL,
	LOGO_RENAME_FILENAME	VARCHAR2(100)	NULL
);

-- 통신사 테이블 BIZ_NAME 크기 수정
ALTER TABLE BIZ
MODIFY (BIZ_NAME VARCHAR2(30));

ALTER TABLE BIZ ADD CONSTRAINT PK_BIZ PRIMARY KEY (
	BIZ_NO
);

--BIZ 시퀀스 생성
DROP SEQUENCE BIZ_SEQ;
CREATE SEQUENCE BIZ_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;
-- BIZ_SEQ.NEXTVAL

-- 통신사통신망 테이블 BIZ_NETWORK 생성
CREATE TABLE BIZ_NETWORK (
	BIZ_NO	NUMBER		NOT NULL,
	NET_NO	NUMBER		NOT NULL,
	BIZ_NET_SERVICE	VARCHAR2(20)		NULL
);

ALTER TABLE BIZ_NETWORK ADD CONSTRAINT PK_BIZ_NETWORK PRIMARY KEY (BIZ_NO, NET_NO);

ALTER TABLE BIZ_NETWORK ADD CONSTRAINT FK_BIZ_TO_BIZ_NETWORK_1 FOREIGN KEY (BIZ_NO) REFERENCES "BIZ" (BIZ_NO);

ALTER TABLE BIZ_NETWORK ADD CONSTRAINT FK_NETWORK_TO_BIZ_NETWORK_1 FOREIGN KEY (NET_NO) REFERENCES NETWORK_TABLE (NET_NO);

desc biz;


--질문/답변 게시판 생성
DROP TABLE QNA;
CREATE TABLE QNA (
	AQ_NO	NUMBER	NOT NULL,
    USER_NO	NUMBER	NOT NULL,
	AQ_TITLE	VARCHAR2(50)	NOT NULL,
	AQ_CONTENT	VARCHAR2(4000)	NOT NULL,
	AQ_DATE	TIMESTAMP	NOT NULL,
	AQ_REDATE	TIMESTAMP	NULL,
	AQ_VIEWS	NUMBER	NOT NULL
);

ALTER TABLE QNA MODIFY AQ_DATE DEFAULT SYSTIMESTAMP;

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (AQ_NO);
ALTER TABLE QNA ADD CONSTRAINT FK_QNA_USER_NO FOREIGN KEY (USER_NO) REFERENCES USER_TABLE(USER_NO);

DROP SEQUENCE QNA_SEQ;
CREATE SEQUENCE QNA_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER; 


--질문/답변 게시판의 답변 테이블
DROP TABLE QNA_ANS;
CREATE TABLE QNA_ANS (
	AA_NO	NUMBER	NOT NULL,
	AA_CONTENT	VARCHAR2(4000)	NOT NULL,
	AQ_NO	NUMBER	NOT NULL,
	AA_DATE	TIMESTAMP	NOT NULL,
	AA_REDATE	TIMESTAMP	NULL,
	AA_WRITER	NUMBER	NULL
);
ALTER TABLE QNA_ANS MODIFY AA_DATE DEFAULT SYSTIMESTAMP;

ALTER TABLE QNA_ANS ADD CONSTRAINT PK_QNA_ANS PRIMARY KEY (AA_NO);
ALTER TABLE QNA_ANS ADD CONSTRAINT FK_QNA_ANS_AQ_NO FOREIGN KEY
 (AQ_NO) REFERENCES QNA(AQ_NO);

DROP SEQUENCE QNA_ANS_SEQ;
CREATE SEQUENCE QNA_ANS_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;	  

--질문/답변 게시판 답변의 댓글 테이블
DROP TABLE QNA_RPL;
CREATE TABLE QNA_RPL (
	RPL_NO	NUMBER	NOT NULL,
	AA_NO	NUMBER	NOT NULL,
	USER_NO	VARCHAR(255)	NOT NULL,
	RPL_DATE	TIMESTAMP	NOT NULL,
	RPL_REDATE	TIMESTAMP	NULL,
	RPL_CONTENT	VARCHAR2(4000)	NOT NULL
);
ALTER TABLE QNA_RPL MODIFY RPL_DATE DEFAULT SYSTIMESTAMP;

ALTER TABLE QNA_RPL ADD CONSTRAINT PK_QNA_RPL PRIMARY KEY (RPL_NO);
ALTER TABLE QNA_RPL ADD CONSTRAINT FK_QNA_RPL_AA_NO FOREIGN KEY
 (AA_NO) REFERENCES QNA_ANS(AA_NO);
 
DROP SEQUENCE QNA_RPL_SEQ;
CREATE SEQUENCE QNA_RPL_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;


-- 리뷰 게시판 생성
CREATE TABLE BIZ_REVIEW (
    REVIEW_NO NUMBER NOT NULL PRIMARY KEY,
    USER_NO NUMBER NOT NULL,
    BIZ_NO NUMBER NOT NULL,
    REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
    REVIEW_DATE TIMESTAMP NOT NULL,
    REVIEW_REDATE TIMESTAMP,
    REVIEW_STAR NUMBER NOT NULL
);

ALTER TABLE USER_TABLE ADD CONSTRAINT PK_USER_TABLE PRIMARY KEY (USER_NO);
ALTER TABLE BIZ_REVIEW ADD CONSTRAINT FK_USER_TABLE_TO_BIZ_REVIEW_1 FOREIGN KEY (USER_NO) REFERENCES USER_TABLE (USER_NO);
ALTER TABLE BIZ_REVIEW ADD CONSTRAINT FK_BIZ_TO_BIZ_REVIEW_1 FOREIGN KEY (BIZ_NO) REFERENCES BIZ (BIZ_NO);


-- 리뷰 신고 내역 생성
CREATE TABLE REVIEW_REPORT (
    REVIEW_NO NUMBER NOT NULL,
    REPORT_DATE DATE,
    REPORT_STATUS NUMBER
);
ALTER TABLE REVIEW_REPORT ADD CONSTRAINT PK_REVIEW_REPORT PRIMARY KEY (REVIEW_NO);
ALTER TABLE REVIEW_REPORT ADD CONSTRAINT FK_BIZ_REVIEW_TO_REVIEW_REPORT FOREIGN KEY (REVIEW_NO) REFERENCES BIZ_REVIEW (REVIEW_NO);


-- 찜 내역 생성
CREATE TABLE LIKE_TABLE (
    USER_NO NUMBER NOT NULL,
    PLAN_NO NUMBER NOT NULL,
    LIKE_DATE DATE,
    LIKE_YN CHAR(1) NOT NULL
);
ALTER TABLE LIKE_TABLE ADD CONSTRAINT PK_LIKE_TABLE PRIMARY KEY (USER_NO, PLAN_NO);
ALTER TABLE LIKE_TABLE ADD CONSTRAINT FK_USER_TO_LIKE FOREIGN KEY (USER_NO) REFERENCES USER_TABLE (USER_NO);
ALTER TABLE PLAN_TABLE ADD CONSTRAINT PK_PLAN_TABLE PRIMARY KEY(PLAN_NO);
ALTER TABLE LIKE_TABLE ADD CONSTRAINT FK_PLAN_TO_LIKE FOREIGN KEY (PLAN_NO) REFERENCES PLAN_TABLE (PLAN_NO);
