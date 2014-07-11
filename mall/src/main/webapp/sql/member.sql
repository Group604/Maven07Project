/* member.sql */

/* member테이블 수정본(2014.06.29)-다시 만듦 */
create table member(
member_id         	varchar2(20) primary key,
member_pwd        	varchar2(100) not null,
member_name      	varchar2(100) not null,
member_zip          varchar2(5) not null,
member_zip2       	varchar2(5) not null,
member_addr       	varchar2(100) not null,
member_addr2        varchar2(300) not null,
member_phone01      varchar2(5),
member_phone02      varchar2(5),
member_phone03      varchar2(5),
member_emailid    	varchar2(30),
member_emaildomain	varchar2(50),
                   	
member_date       	date default sysdate,/*가입날자 */               
member_state        number(1) default 1,/*가입회원 1, 탈퇴회원 2 */
member_delcont      varchar2(4000),/* 탈퇴 사유 */   
member_deldate      date, /*탈퇴 날짜 */             
member_admin         number(1) default 2,/*관리자 여부:관리자 1, 일반 2*/          
member_jumin1       varchar2(6),/* 주민번호 앞자리 */    
member_jumin2       varchar2(7) /*주민번호 뒷자리*/      
);

/* 전번 테이블*/
create table phone(
 no int primary key,
 phone_number varchar2(3),
 phone_compamy varchar2(100)
 );
 
 
 create sequence phone_no_seq
 increment by 1 start with 1 nocache;
 
 /* email 테이블 */
 create table email(
 no int primary key,
 email_domain varchar2(100),
 email_site varchar2(200)
 );
 
 create sequence email_no_seq
 increment by 1 start with 1 nocache;
 
 /* 전번 데이타 입력 */
 insert into phone values(phone_no_seq.nextval,'010','SK-TELECOM');
 insert into phone values(phone_no_seq.nextval,'010','KT');
 insert into phone values(phone_no_seq.nextval,'010','LG');
 insert into phone values(phone_no_seq.nextval,'011','SK-TELECOM');
 insert into phone values(phone_no_seq.nextval,'016','KT');
 insert into phone values(phone_no_seq.nextval,'018','LG');
 insert into phone values(phone_no_seq.nextval,'019','LG');
 insert into phone values(phone_no_seq.nextval,'010','ETC');
 
 /* email 데이타 입력 */
 insert into email values(email_no_seq.nextval,'naver.com','네이버');
 insert into email values(email_no_seq.nextval,'daum.net','다음');
 insert into email values(email_no_seq.nextval,'korea.com','코리아');
 insert into email values(email_no_seq.nextval,'nate.com','네이트');
 insert into email values(email_no_seq.nextval,'google.com','구글');
 insert into email values(email_no_seq.nextval,'hanmail.net','한메일');
 insert into email values(email_no_seq.nextval,'직접입력','직접입력');
 
 
 /* 우편 번호 */
CREATE TABLE ZIPCODE (
  ID 		INT,
  ZIPCODE   VARCHAR2(7),
  SIDO      VARCHAR2(10),
  GUGUN 	VARCHAR2(20),
  DONG 		VARCHAR2(30),
  RI 		VARCHAR2(70),
  BUNJI 	VARCHAR2(30),
  PRIMARY KEY (ID)
);

/* 상품 테이블 */
CREATE TABLE GOODS(
	GOODS_NUM 		INT,
	GOODS_CATEGORY  VARCHAR2(20),
	GOODS_NAME 		VARCHAR2(50),
	GOODS_CONTENT 	VARCHAR2(3000),
	GOODS_SIZE 		VARCHAR2(10),
	GOODS_COLOR 	VARCHAR2(20),
	GOODS_AMOUNT 	INT,
	GOODS_PRICE 	INT,
	GOODS_IMAGE 	VARCHAR2(300),
	GOODS_BEST 		INT,
	GOODS_DATE 		DATE,
	GOODS_INUSE     INT
	PRIMARY KEY(GOODS_NUM)
);


create sequence goods_no_seq 
increment by 1 start with 1 nocache;

/* 장바구니 */
CREATE TABLE BASKET(
	BASKET_NUM 			INT,
	BASKET_MEMBER_ID 	VARCHAR2(20),
	BASKET_GOODS_NUM 	INT,
	BASKET_GOODS_AMOUNT INT,
	BASKET_GOODS_SIZE 	VARCHAR2(20),
	BASKET_GOODS_COLOR 	VARCHAR2(20),
	BASKET_DATE 		DATE,
	PRIMARY KEY(BASKET_NUM)
);

create sequence basket_no_seq
increment by 1 start with 1 nocache;

/* 상품주문 테이블 */
CREATE TABLE GOODS_ORDER(
	ORDER_NUM 				INT,
	ORDER_TRADE_NUM 		VARCHAR2(50),
	ORDER_TRANS_NUM 		VARCHAR2(50),
	ORDER_GOODS_NUM			INT,
	ORDER_GOODS_NAME 		VARCHAR2(50),
	ORDER_GOODS_AMOUNT 		INT,
	ORDER_GOODS_SIZE 		VARCHAR2(20),
	ORDER_GOODS_COLOR 		VARCHAR2(20),
	ORDER_MEMBER_ID 		VARCHAR2(20),
	ORDER_RECEIVE_NAME 		VARCHAR2(20),
	ORDER_RECEIVE_ADDR1 	VARCHAR2(70),
	ORDER_RECEIVE_ADDR2 	VARCHAR2(70),
	ORDER_RECEIVE_PHONE 	VARCHAR2(13),
	ORDER_RECEIVE_MOBILE	 VARCHAR2(13),
	ORDER_MEMO 				VARCHAR2(3000),
	ORDER_SUM_MONEY 		INT,
	ORDER_TRADE_TYPE 		VARCHAR2(20),
	ORDER_TRADE_DATE 		DATE,
	ORDER_TRADE_PAYER 		VARCHAR2(20),
	ORDER_DATE 				DATE,
	ORDER_STATUS 			INT,
	PRIMARY KEY(ORDER_NUM)
);

create sequence goodsorder_no_seq
increment by 1 start with 1 nocache; 