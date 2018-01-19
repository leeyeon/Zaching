
DROP TABLE transaction;
DROP TABLE product;
DROP TABLE users;
DROP TABLE inventory;

DROP SEQUENCE seq_user_user_id;
DROP SEQUENCE seq_product_prod_no;
DROP SEQUENCE seq_transaction_tran_no;
DROP SEQUENCE seq_inventory_inven_no;

SELECT seq_product_prod_no.currval FROM DUAL;

CREATE SEQUENCE seq_user_user_id		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_product_prod_no		 	INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_transaction_tran_no	 INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_inventory_inven_no  INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_cart_cart_no  INCREMENT BY 1 START WITH 10000;

CREATE TABLE users ( 
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

//alter table users add(sns_id VARCHAR2(50));
//alter table users add(sns_type VARCHAR2(20));
alter table users add(profile_image VARCHAR2(200));


CREATE TABLE product ( 
	prod_no 						NUMBER 				NOT NULL,
	prod_name 				VARCHAR2(100) 	NOT NULL,
	prod_detail 				VARCHAR2(200),
	manufacture_day		 VARCHAR2(8),
	price 							NUMBER(10),
	image_file 					VARCHAR2(100),
	reg_date 					DATE,
	amount					 NUMBER,
	status					 CHAR(3),
	PRIMARY KEY(prod_no)
);

alter table product add(amount NUMBER);
//ALTER TABLE product DROP COLUMN amount;

//alter table product add(beforeAmount NUMBER);
alter table product add(status NUMBER); // 판매 유무
alter table transaction add(amount NUMBER);
alter table transaction add(status NUMBER);

UPDATE PRODUCT
SET AMOUNT = (
SELECT DISTINCT NVL2(TRAN_STATUS_CODE, 1,0)
FROM TRANSACTION
WHERE  PRODUCT.PROD_NO = TRANSACTION.PROD_NO(+));

CREATE TABLE transaction ( 
	tran_no 					NUMBER 			NOT NULL,
	prod_no 					NUMBER(16)		NOT NULL REFERENCES product(prod_no),
	buyer_id 				VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	payment_option		 CHAR(3),
	receiver_name 		 VARCHAR2(20),
	receiver_phone		 VARCHAR2(14),
	dlvy_addr 			 VARCHAR2(100),
	dlvy_request 			VARCHAR2(100),
	dlvy_date 				DATE,
	tran_status_code	 CHAR(3),
	order_date 			 DATE,
	status				 CHAR(3),
	PRIMARY KEY(tran_no)
);

================================================================
재고관리 테이블
================================================================

CREATE TABLE inventory ( 
	inven_no		 NUMBER NOT NULL,
	tran_no  		 NUMBER 		NOT NULL REFERENCES transaction(tran_no),
	amount 		 	NUMBER 		NOT NULL,
	PRIMARY KEY (inven_no)
);

================================================================
장바구니 테이블
================================================================
CREATE TABLE cart (
	cart_no 		NUMBER NOT NULL,
	prod_no 		NUMBER NOT NULL REFERENCES product(prod_no),
	user_id 		VARCHAR2(20)	 NOT NULL REFERENCES users(user_id),
	cart_date 		DATE,
	status 			CHAR(3),
	PRIMARY KEY (cart_no)
);

//alter table cart add(status CHAR(3));
================================================================

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'admin', 'admin', '1234', 'admin', NULL, NULL, '서울시 서초구', 'admin@mvc.com',to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS')); 

INSERT 
INTO users ( user_id, user_name, password, role, ssn, cell_phone, addr, email, reg_date ) 
VALUES ( 'manager', 'manager', '1234', 'admin', NULL, NULL, NULL, 'manager@mvc.com', to_date('2012/01/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'));          

INSERT INTO users 
VALUES ( 'user01', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user02', 'SCOTT', '2222', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user03', 'SCOTT', '3333', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user04', 'SCOTT', '4444', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user05', 'SCOTT', '5555', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user06', 'SCOTT', '6666', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user07', 'SCOTT', '7777', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user08', 'SCOTT', '8888', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user09', 'SCOTT', '9999', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user10', 'SCOTT', '1010', 'user', NULL, NULL, NULL, NULL, sysdate); 

INSERT INTO users 
VALUES ( 'user11', 'SCOTT', '1111', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user12', 'SCOTT', '1212', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user13', 'SCOTT', '1313', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user14', 'SCOTT', '1414', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user15', 'SCOTT', '1515', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user16', 'SCOTT', '1616', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user17', 'SCOTT', '1717', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user18', 'SCOTT', '1818', 'user', NULL, NULL, NULL, NULL, sysdate);

INSERT INTO users 
VALUES ( 'user19', 'SCOTT', '1919', 'user', NULL, NULL, NULL, NULL, sysdate);
           
           
insert into product values (seq_product_prod_no.nextval,'vaio vgn FS70B','소니 바이오 노트북 신동품','20120514',2000000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/12/14 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),3,'0');
insert into product values (seq_product_prod_no.nextval,'자전거','자전거 좋아요~','20120514',10000, 'AHlbAAAAvetFNwAA.jpg',to_date('2012/11/14 10:48:43', 'YYYY/MM/DD HH24:MI:SS'),1,'0');
insert into product values (seq_product_prod_no.nextval,'보르도','최고 디자인 신품','20120201',1170000, 'AHlbAAAAvewfegAB.jpg',to_date('2012/10/14 10:49:39', 'YYYY/MM/DD HH24:MI:SS'),1,'0');
insert into product values (seq_product_prod_no.nextval,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217', 200000, 'AHlbAAAAve1WwgAC.jpg',to_date('2012/11/14 10:50:58', 'YYYY/MM/DD HH24:MI:SS'),1,'0');
insert into product values (seq_product_prod_no.nextval,'인라인','좋아욥','20120819', 20000, 'AHlbAAAAve37LwAD.jpg',to_date('2012/11/14 10:51:40', 'YYYY/MM/DD HH24:MI:SS'),1,'0');
insert into product values (seq_product_prod_no.nextval,'삼성센스 2G','sens 메모리 2Giga','20121121',800000, 'AHlbAAAAtBqyWAAA.jpg',to_date('2012/11/14 18:46:58', 'YYYY/MM/DD HH24:MI:SS'),2,'0');
insert into product values (seq_product_prod_no.nextval,'연꽃','정원을 가꿔보세요','20121022',232300, 'AHlbAAAAtDPSiQAA.jpg',to_date('2012/11/15 17:39:01', 'YYYY/MM/DD HH24:MI:SS'),2,'0');
insert into product values (seq_product_prod_no.nextval,'삼성센스','노트북','20120212',600000, 'AHlbAAAAug1vsgAA.jpg',to_date('2012/11/12 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),3,'0');


commit;



//== Page 처리을 위한 SQL 구성연습

SELECT user_id , user_name , email
FROM users
ORDER BY user_id

currentPage =2
pageSize = 3   
4 ~ 6

SELECT inner_table. * ,  ROWNUM AS row_seq
FROM (	SELECT user_id , user_name , email
				FROM users
				ORDER BY user_id ) inner_table
WHERE ROWNUM <=6;	
//==>           currentPage * paseSize


SELECT * 
FROM (	SELECT inner_table. * ,  ROWNUM AS row_seq
				FROM (	SELECT user_id , user_name , email
								FROM users
								ORDER BY user_id ) inner_table
				WHERE ROWNUM <=6 )
WHERE row_seq BETWEEN 4 AND 6;

//==> (currentPage-1) * paseSize+1           currentPage * paseSize