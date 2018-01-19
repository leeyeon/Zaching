
SELECT seq_product_prod_no.currval FROM DUAL;

CREATE SEQUENCE seq_user_user_id		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_bob_bob_id		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_participant_participant_id	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_fee_fee_id  INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_comment_comment_id  INCREMENT BY 1 START WITH 1;

CREATE SEQUENCE seq_report_id	 INCREMENT BY 1 START WITH 1;

CREATE TABLE USERS ( 
	user_id      		number	 NOT NULL,
	email  	 VARCHAR2(50)	 NOT NULL,
	password  		 VARCHAR2(16)	  NOT NULL,
	role  				 CHAR(2) 		DEFAULT 0  NOT NULL   ,
	name  				 	 VARCHAR2(10)  	   NOT NULL,
	address  		 	VARCHAR2(50),
	longtitude  		 		number,
	latitude  		 		number,
	gender  		  char(2),
	phone 		  varchar2(12),
	birth 		  DATE,
	profile_image varchar2(100),
	real_name varchar2(8),
	bank_code number,
	account_number varchar2(20),
	account_ci number,
	account_seq_no number,
	total_point number  DEFAULT 0 NOT NULL,
	total_mileage number DEFAULT 0 NOT NULL,
	total_recommend number NOT NULL,
	latest_date DATE NOT NULL,
	created_date DATE NOT NULL,
	setting_rent_charge char(2) NOT NULL,
	setting_news char(2) NOT NULL,
	setting_newsfeed char(2) NOT NULL,
	setting_broadcast char(2) NOT NULL,
	setting_friend char(2) NOT NULL,
	setting_bob char(2) NOT NULL,
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
	category_coe char(4) not null,
	title varchar2(50) not null,
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
	participant_date date not null,
	status char(2) not null,
	bob_id numeric not null,
	user_id numeric not null,
	PRIMARY KEY(participant_id),
	FOREIGN KEY(user_id) REFERENCES USERS(user_id),
	FOREIGN KEY(bob_id) REFERENCES BOB(bob_ID)
);

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
	category_code varchar2(4) not null,
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


commit;

