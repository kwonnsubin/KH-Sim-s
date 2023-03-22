--통신사 테이블 생성
drop table BIZ cascade constraints;
CREATE TABLE BIZ (
    BIZ_ID	VARCHAR2(30) PRIMARY KEY ,
	BIZ_NAME	VARCHAR2(30)	NULL,
	BIZ_SSN	VARCHAR2(30)	NULL,
	BIZ_CRN	VARCHAR2(20)	NULL,
	BIZ_EMAIL	VARCHAR2(50)	NULL,
	BIZ_PHONE	VARCHAR2(20)	NULL,
	BIZ_FAX	VARCHAR2(20)	NULL,
	BIZ_OWNER_NAME	VARCHAR2(10)	NULL,
	BIZ_HP	VARCHAR2(100)	NULL,
	BIZ_LOCATION	VARCHAR2(200)	NULL,
	BIZ_CARD_PAY_DATE	VARCHAR2(20)	NULL,
	BIZ_ACC_PAY_DATE	VARCHAR2(20)	NULL,
	BIZ_BEGIN_TIME	VARCHAR2(20)	NULL,
	BIZ_END_TIME	VARCHAR2(20)	NULL,
	BIZ_CLOSED_DAY	VARCHAR2(20)	NULL,
	BIZ_REVIEW_STAR	NUMBER	NULL,
	PHONE_OP_TIME	VARCHAR2(20)	NULL,
	PHONE_OP_TIME_USIM	VARCHAR2(20)	NULL,
    NETWORK VARCHAR(20) NULL,
	WRITE_DATE	DATE	NOT NULL,
	UPDATE_DATE	DATE	NULL,
	LOGO_RENAME_FILENAME	VARCHAR2(100)	NULL,
    CONSTRAINT FK_BIZ_ID FOREIGN KEY (BIZ_ID) REFERENCES MEMBER(ID)
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
DROP TABLE QNA_ANS CASCADE CONSTRAINTS;
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

ALTER TABLE QNA_ANS DROP COLUMN AA_WRITER;
ALTER TABLE QNA_ANS ADD AA_WRITER_ADMIN VARCHAR2(30);
ALTER TABLE QNA_ANS ADD AA_WRITER_USER NUMBER;
ALTER TABLE QNA_ANS ADD CONSTRAINT FK_QNA_ANS_WRITER_1 FOREIGN KEY (AA_WRITER_ADMIN) REFERENCES ADMIN (ADMIN_ID);
ALTER TABLE QNA_ANS ADD CONSTRAINT FK_QNA_ANS_WRITER_2 FOREIGN KEY (AA_WRITER_USER) REFERENCES USER_TABLE (USER_NO);  

--질문/답변 게시판 답변의 댓글 테이블
DROP TABLE QNA_RPL CASCADE CONSTRAINTS;
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

ALTER TABLE QNA_RPL DROP COLUMN USER_NO;
ALTER TABLE QNA_RPL ADD RPL_WRITER_ADMIN VARCHAR2(30);
ALTER TABLE QNA_RPL ADD RPL_WRITER_USER NUMBER;
ALTER TABLE QNA_RPL ADD CONSTRAINT FK_QNA_RPL_WRITER_1 FOREIGN KEY (RPL_WRITER_ADMIN) REFERENCES ADMIN (ADMIN_ID);
ALTER TABLE QNA_RPL ADD CONSTRAINT FK_QNA_RPL_WRITER_2 FOREIGN KEY (RPL_WRITER_USER) REFERENCES USER_TABLE (USER_NO);
 
DROP SEQUENCE QNA_RPL_SEQ;
CREATE SEQUENCE QNA_RPL_SEQ
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       NOCYCLE
       NOCACHE
       ORDER;


-- 통신사 리뷰
DROP TABLE BIZ_REVIEW CASCADE CONSTRAINTS;
CREATE TABLE BIZ_REVIEW (
	REVIEW_NO	NUMBER	NOT NULL PRIMARY KEY,
	REVIEW_CONTENT	VARCHAR2(4000)	NOT NULL,
	REVIEW_DATE	TIMESTAMP	NOT NULL,
	REVIEW_REDATE	TIMESTAMP	NULL,
	REVIEW_STAR	NUMBER	NOT NULL,
	USER_ID	VARCHAR2(30) NOT NULL,
	BIZ_ID	VARCHAR2(30) NOT NULL,
    CONSTRAINT FK_USER_ID2 FOREIGN KEY (USER_ID) REFERENCES USER_TABLE(USER_ID),
    CONSTRAINT FK_BIZ_ID FOREIGN KEY (BIZ_ID) REFERENCES BIZ(BIZ_ID)
);
DROP SEQUENCE BIZ_REVIEW_SEQ;
CREATE SEQUENCE BIZ_REVIEW_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


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

-- 공지사항 테이블
create table NOTICE(
    NTC_NO NUMBER primary key,
    ADMIN_ID VARCHAR2(30) not null,
    NTC_TITLE VARCHAR2(300) not null,
    NTC_CONTENT CLOB not null,
    NTC_REWRITER VARCHAR2(30) NULL,
    NTC_DATE TIMESTAMP DEFAULT systimestamp,
    NTC_REDATE TIMESTAMP null,
    CONSTRAINT NOTICE_ADMIN_ID_FK FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID),
    CONSTRAINT NOTICE_NTC_REWRITER_FK FOREIGN KEY(NTC_REWRITER) REFERENCES ADMIN(ADMIN_ID)
);

-- 공지번호 시퀀스 생성
CREATE SEQUENCE NTC_NO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- 사용자
DROP TABLE USER_TABLE CASCADE CONSTRAINTS;
CREATE TABLE USER_TABLE(
      USER_ID VARCHAR2(30) 
	, USER_NAME VARCHAR2(10) NOT NULL
	, USER_SSN VARCHAR2(20) NOT NULL
	, USER_WR_DATE DATE NOT NULL
	, USER_UP_DATE DATE
	, USER_GENDER CHAR(1) NOT NULL CHECK (USER_GENDER IN ('M','F'))
	, USER_PHONE VARCHAR2(20)
	, USER_EMAIL VARCHAR2(30)
	, USER_ADDRESS VARCHAR2(100)
    , CONSTRAINT PK_USER_ID PRIMARY KEY (USER_ID)
    , CONSTRAINT FK_USER_ID FOREIGN KEY (USER_ID) REFERENCES MEMBER(ID)
);

--관리자
DROP TABLE ADMIN CASCADE CONSTRAINTS;
CREATE TABLE ADMIN (
	ADMIN_ID	VARCHAR2(30)	NOT NULL,
	ADMIN_TYPE	VARCHAR2(80)	NOT NULL
);

ALTER TABLE ADMIN ADD CONSTRAINT PK_ADMIN PRIMARY KEY (ADMIN_ID);
ALTER TABLE ADMIN ADD CONSTRAINT FK_MEMBER_TO_ADMIN_1 FOREIGN KEY (ADMIN_ID) REFERENCES MEMBER(ID);

-- 맞춤질문지 생성
DROP TABLE CUSTOM_Q;
CREATE TABLE CUSTOM_Q (
    USER_NO NUMBER NOT NULL,
    CQ_TELECOM NUMBER CHECK(CQ_TELECOM IN (1,2,3,4)),
    CQ_DATA NUMBER CHECK(CQ_DATA IN (1,2,3,4,5)),
    CQ_SPEED NUMBER CHECK(CQ_SPEED IN (1,2)),
    CQ_VOICE NUMBER CHECK(CQ_VOICE IN (1,2,3,4)),
    CONSTRAINT CUSTOM_Q_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES USER_TABLE (USER_NO)
);
ALTER TABLE CUSTOM_Q ADD CONSTRAINT PK_CUSTOM_Q PRIMARY KEY (USER_NO);

-- 요금제 조회 생성
DROP TABLE VIEW_TABLE;
CREATE TABLE VIEW_TABLE (
   USER_NO NUMBER NOT NULL ,
   PLAN_NO NUMBER NOT NULL ,
   VIEW_DATE DATE DEFAULT SYSDATE ,
   CONSTRAINT VIEW_TABLE_USER_NO_FK FOREIGN KEY (USER_NO) REFERENCES USER_TABLE (USER_NO),
   CONSTRAINT VIEW_TABLE_PLAN_NO_FK FOREIGN KEY (PLAN_NO) REFERENCES PLAN_TABLE (PLAN_NO) 
);

-- 요금제 가입정보 테이블 생성
DROP TABLE PLAN_ORDER;
	CREATE TABLE PLAN_ORDER(
    ORDER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(30) NOT NULL,
    PLAN_NO NUMBER NOT NULL,
    JOIN_CATEGORY NUMBER NOT NULL CHECK(JOIN_CATEGORY IN (1,2)),
    SIM_TYPE NUMBER NOT NULL CHECK(SIM_TYPE IN (1,2)),
    SIM_YN NUMBER NOT NULL,
    CURRENT_TELECOM NUMBER,
    PLAN_BILL NUMBER CHECK(PLAN_BILL IN (1,2)),
    PLAN_PAY NUMBER CHECK(PLAN_PAY IN (1,2)),
    CARD_NUMBER NUMBER,
    CARD_EXPIRATION NUMBER,
    BANK VARCHAR2(30),
    BANK_NUMBER VARCHAR2(50),
    ORDER_DATE NUMBER,
    ORDER_STATUS NUMBER CHECK(ORDER_STATUS IN (1,2,3)),
    NET_NO NUMBER,
    GEN_NO NUMBER,
    ORDER_PRICE NUMBER,
    ORDER_DATA NUMBER,
    ORDER_VOICE NUMBER,
    ORDER_MESSAGE NUMBER,
    CONSTRAINT PLAN_ORDER_ORDER_NO_PK PRIMARY KEY (ORDER_NO),
   	CONSTRAINT PLAN_ORDER_USER_NO_FK FOREIGN KEY (USER_ID) REFERENCES USER_TABLE (USER_ID),
   	CONSTRAINT PLAN_ORDER_PLAN_NO_FK FOREIGN KEY (PLAN_NO) REFERENCES PLAN_TABLE (PLAN_NO),
   	CONSTRAINT PLAN_ORDER_NET_NO_FK FOREIGN KEY (NET_NO) REFERENCES NETWORK_TABLE (NET_NO),
   	CONSTRAINT PLAN_ORDER_GEN_NO_FK FOREIGN KEY (GEN_NO) REFERENCES TEL_GEN_TABLE (GEN_NO)
);
DROP SEQUENCE PLAN_ORDER_SEQ;
CREATE SEQUENCE PLAN_ORDER_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
-- 자주묻는질문 테이블
CREATE TABLE FAQ (
	FAQ_NO	NUMBER PRIMARY KEY	NOT NULL,
	FAQ_TITLE	VARCHAR2(300)	NOT NULL,
	FAQ_CONTENT	CLOB	NULL,
	ADMIN_ID	VARCHAR2(30)	NOT NULL,
	FAQ_REWRITER	VARCHAR2(30)	NULL,
    CONSTRAINT FAQ_ADMIN_ID_FK FOREIGN KEY(ADMIN_ID) REFERENCES ADMIN(ADMIN_ID),
    CONSTRAINT FAQ_FAQ_REWRITER_FK FOREIGN KEY(FAQ_REWRITER) REFERENCES ADMIN(ADMIN_ID)
);
-- 질문번호 시퀀스 생성 
CREATE SEQUENCE FAQ_NO_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


-- 멤버테이블 생성(관리자, 사용자, 통신사 모두 포함)
DROP TABLE MEMBER;
CREATE TABLE MEMBER (
	ID	VARCHAR2(30) PRIMARY KEY,
	PW	VARCHAR2(80)	NOT NULL,
	ROLE	VARCHAR2(20)	NOT NULL,
	ENABLE	NUMBER	NOT NULL
);
 