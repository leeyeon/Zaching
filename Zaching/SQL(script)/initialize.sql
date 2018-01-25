
SELECT seq_product_prod_no.currval FROM DUAL;

/* ÀüÃ¼ ½ÃÄö½º Á¶È¸ 
 * ½ÃÄö½º ·ê : seq_(tablename)_id;
 * */
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE seq_user_id		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_bob_id		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_participant_id	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_fee_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_payment_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_report_id	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_comment_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_newsfeed_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_voice_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_report_id	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_friend_id   INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_message_id   INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_notice_id	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_notice_target_id	 INCREMENT BY 1 START WITH 1;

CREATE TABLE USERS ( 
	user_id      		number	 NOT NULL,
	email  	 VARCHAR2(50)	 NOT NULL,
	password  		 VARCHAR2(16)	  NOT NULL,
	role  				 CHAR(2) 		DEFAULT 0  NOT NULL   ,
	name  				 	 VARCHAR2(10)  	   NOT NULL,
	address  		 	VARCHAR2(50),
	longitude  		 		number(15,10),
	latitude  		 		number(15,10),
	gender  		  char(2),
	phone 		  varchar2(12),
	birth 		  varchar2(8),
	profile_image varchar2(100),
	real_name varchar2(10),
	bank_code number,
	account_number varchar2(20),
	account_ci number,
	account_seq_no number,
	total_point number  DEFAULT 0 NOT NULL,
	total_mileage number DEFAULT 0 NOT NULL,
	total_recommend number DEFAULT 0 NOT NULL,
	latest_date DATE,
	created_date DATE NOT NULL,
	setting_rent_charge char(2) DEFAULT 'Y' NOT NULL,
	setting_news char(2) DEFAULT 'Y' NOT NULL,
	setting_newsfeed char(2) DEFAULT 'Y' NOT NULL,
	setting_broadcast char(2) DEFAULT 'Y' NOT NULL,
	setting_friend char(2) DEFAULT 'Y' NOT NULL,
	setting_bob char(2) DEFAULT 'Y' NOT NULL,
	sns_type char(10),
	PRIMARY KEY(user_id)
);


CREATE TABLE REPORT (
 report_id     NUMBER  NOT NULL,
 description           VARCHAR2(64) NOT NULL,
 report_date         date NOT NULL,
 status          char(2) NOT NULL,
 category_code     VARCHAR2(4) NOT NULL,
 room_id           NUMBER ,
 reporter_id            NUMBER ,
 reported_user_id          NUMBER,
	PRIMARY KEY (report_id)
);


CREATE TABLE BOB (
	bob_id numeric not null,
	category_code char(4) not null,
	title varchar2(100) not null,
	content varchar2(4000) not null,
	created_date date not null,
	background_image varchar2(100),
	location_name varchar2(30),
	latitude numeric,
	longtitude numeric,
	time date,
	limit_num numeric,
	fee numeric,
	fee_date date,
	status char(2) default 'Y' not null,
	writer_id numeric not null,
	PRIMARY KEY(bob_id),
	FOREIGN KEY(writer_id) REFERENCES USERS(user_ID)
);

CREATE TABLE PARTICIPANT (
	participant_id numeric not null,
	participated_date date not null,
	status char(2) not null,
	bob_id numeric not null,
	user_id numeric not null,
	setting_fee char(2) default 'N' not null,
	PRIMARY KEY(participant_id),
	FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	FOREIGN KEY(bob_id) REFERENCES BOB(bob_ID)
);
//ALTER TABLE PARTICIPANT ADD setting_fee char(2) default 'N' not null;

CREATE TABLE FEE (
	fee_id numeric not null,
	paid_date date not null,
	paid_fee numeric not null,
	participant_id numeric not null,
	PRIMARY KEY(fee_id),
	FOREIGN KEY(participant_id) REFERENCES PARTICIPANT(participant_id)
);

CREATE TABLE COMMENTS (
	comment_id numeric not null,
	content varchar2(1000) not null,
	created_date date not null,
	category_code char(4) not null,
	status char(2) default 'Y' not null,
	room_id numeric not null,
	user_id numeric not null,
	FOREIGN KEY(user_id) REFERENCES USERS(user_id)
);

CREATE TABLE Voice ( 
	voice_ID 		  NUMERIC			  NOT NULL,
	category_code 		  VARCHAR2(4)		  NOT NULL,
	title 			  VARCHAR2(50)		  NOT NULL,
	background_image	  VARCHAR2(100), 
	created_date 		  DATE			  NOT NULL,
	song	 		  VARCHAR2(100), 
	status 			  CHAR(2)			  DEFAULT'Y',  
	user_ID 		  NUMERIC			  NOT NULL  REFERENCES users(user_ID),  
	PRIMARY KEY(voice_ID)
);


CREATE TABLE Newsfeed ( 
	newsfeed_ID    NUMERIC      NOT NULL,
	category_code  VARCHAR2(4)  NOT NULL,
	content        VARCHAR2(1000)  NOT NULL,
	location_name  VARCHAR2(30), 
	longtitude     NUMERIC,
	latitude       NUMERIC,
	upload_file           VARCHAR2(100), 
	created_date   DATE           NOT NULL,  
	status         CHAR(2)       DEFAULT 'Y',
    privacy_bound  CHAR(2)       NOT NULL,
	total_like     NUMERIC       NOT NULL,
    user_ID        NUMERIC       NOT NULL  REFERENCES users(user_ID),
	PRIMARY KEY(newsfeed_ID)
);

CREATE TABLE MESSAGE(
	MESSAGE_ID NUMERIC PRIMARY KEY,
	USER_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID),
	FRIEND_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID),
	CREATED_DATE DATE NOT NULL,
	CONTENT VARCHAR2(100) NOT NULL
);

CREATE TABLE FRIEND(
	ID NUMERIC PRIMARY KEY,
	USER_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID),
	FRIEND_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID),
	STATUS CHAR(2)
);

CREATE TABLE NOTICE(
	NOTICE_ID NUMERIC NOT NULL PRIMARY KEY,
	CATEGORY_CODE CHAR(4) NOT NULL,
	CREATED_DATE DATE NOT NULL,
	BOB_ID NUMERIC,
	SENDER_ID NUMERIC NOT NULL
);

CREATE TABLE NOTICE_TARGET(
	NOTICE_TARGET_ID NUMERIC NOT NULL PRIMARY KEY,
	NOTICE_ID NUMERIC NOT NULL REFERENCES NOTICE(NOTICE_ID),
	RECEIVER_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID),
	SENDER_ID NUMERIC NOT NULL,
	STATUS CHAR(2) NOT NULL
);


CREATE TABLE PAYMENT(
	PAYMENT_ID NUMERIC NOT NULL PRIMARY KEY,
	TIME DATE NOT NULL,
	MONEY NUMERIC NOT NULL,
	PAYMENT_CODE NUMERIC NOT NULL,
	USER_ID NUMERIC NOT NULL REFERENCES USERS(USER_ID)
);


INSERT INTO users(user_id, email, password, name, role, created_date)
VALUES(seq_user_id.nextval, 'zaching@zaching.com', 'zaching', 'ÀÚÃñ',2, sysdate);
INSERT INTO users(user_id, email, password, name, role, created_date)
VALUES(seq_user_id.nextval, 'admin@admin.com', 'admin', '°ü¸®ÀÚ',3, sysdate);
INSERT INTO users(user_id, email, password, name, role, created_date)
VALUES(seq_user_id.nextval, 'test@test.com', 'test', 'ÀÚÃñ',2, sysdate);


commit;

