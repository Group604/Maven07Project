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
	PRIMARY KEY(GOODS_NUM)
);


create sequence goods_no_seq 
increment by 1 start with 1 nocache;

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


 create table category(
 no int primary key,
 categoryname  varchar2(100),
 categorydesc  varchar2(300)
 );
 
 create sequence category_no_seq
 increment by 1 start with 1 nocache;
 

 insert into category values(category_no_seq.nextval,'fulldress','정상/신사복');
 insert into category values(category_no_seq.nextval,'Tshirts','티셔츠');
 insert into category values(category_no_seq.nextval,'shirts','와이셔츠');
 insert into category values(category_no_seq.nextval,'pants','팬츠');
 insert into category values(category_no_seq.nextval,'shoes','슈즈');
 
 
 select categoryname,categorydesc
   from category 
  order by no asc
    
  
  
  insert into goods(GOODS_NUM, 
                    GOODS_CATEGORY, 
                    GOODS_NAME, 
                    GOODS_CONTENT, 
                    GOODS_SIZE,
					GOODS_COLOR, 
					GOODS_AMOUNT, 
					GOODS_PRICE, 
					GOODS_IMAGE, 
					GOODS_BEST,
					GOODS_DATE)
	     values(goods_no_seq.nextval,
	              #{GOODS_CATEGORY},
	              #{ODS_NAME}, 
	              #{GOODS_CONTENT}, 
	              #{GOODS_SIZE},
				  #{GOODS_COLOR}, 
				  #{GOODS_AMOUNT}, 
				  #{GOODS_PRICE}, 
				  #{GOODS_IMAGE}, 
				  #{GOODS_BEST},
				  sysdate )
		
				  
				  
select * from goods;