CREATE TABLE MEMBER(
	MEMBER_ID 			VARCHAR2(20),
	MEMBER_PW 			VARCHAR2(15),
	MEMBER_NAME 		VARCHAR2(20),
	MEMBER_JUMIN1 		INT,
	MEMBER_JUMIN2 		INT,
	MEMBER_EMAIL 		VARCHAR2(25),
	MEMBER_EMAIL_GET 	VARCHAR2(7),
	MEMBER_MOBILE 		VARCHAR2(13),
	MEMBER_PHONE 		VARCHAR2(13),
	MEMBER_ZIPCODE 		VARCHAR2(13),
	MEMBER_ADDR1 		VARCHAR2(70),
	MEMBER_ADDR2 		VARCHAR2(70),
	MEMBER_ADMIN 		INT,
	MEMBER_JOIN_DATE 	DATE
);

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
--	BASKET_GOODS_SIZE 	VARCHAR2(20),
--	BASKET_GOODS_COLOR 	VARCHAR2(20),
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



select goods_num, 
           goods_category,
           goods_name, 
           goods_content,
           goods_price,
           goods_image,
           goods_best,
           goods_date,
           rownum rNum  from (
    select goods_num, 
           goods_category,
           goods_name, 
           goods_content,
           goods_price,
           goods_image,
           goods_best,
           goods_date,
           rownum rNum 
      from goods
     where goods_inuse=0
     order by goods_num desc) 
     where rNum >1 and rNum<7
     ;
     
 insert into goods    
 select * from goods_tmp;    
     
 select * from goods;

 create table goods_level(
 no number(2) primary key,
 level_no number(2) not null,
 level_desc varchar(100)
 );

 create sequence goods_level_seq
 increment by 1 start with 1 nocache;
 insert into goods_level values(0,0,'전체');
 
 insert into goods_level values(goods_level_seq.nextval,goods_level_seq.currval,concat('농도',to_char(goods_level_seq.currval)));
 
 select * from goods_level;
 
 
 select categoryname,categorydesc
      from category 
     order by no asc
     
     
      select level_no,level_desc
     from goods_level
     order by level_no asc
     
insert into CATEGORY values(0,'ALL','전체');
     

select * from GOODS where goods_inuse=0;
     
 select * from category;
 <%--이미지 파일 --%>
 

 select * from goods;
 
 select a.goods_num, a.goods_name, b.categoryname,b.categorydesc
   from goods a,
        category b
  where a.goods_category=b.categorydesc;

 update GOODS
    set goods_category = 'Veriation'
  where goods_category='베리에이션';
 
 create table goods_sale(
 sale_no number(10) primary key,
 goods_num int,
 member_id varchar2(20),
 goods_cnt number(3),
 goods_date date
 );
 
 create sequence goods_sale_no_seq
 increment by 1 start with 1 nocache; 
 
 select * from basket;
 
 select * from basket;
 
 
 update basket
    set basket_goods_image = (select goods_image
                                from goods
                               where goods_num=basket.basket_goods_num)
 where (basket_num,basket_goods_num) =
 (select basket_num, basket_goods_num,basket_goods_image from 
  (select a.basket_num basket_num,
        a.basket_member_id basket_member_id,
        a.basket_goods_num basket_goods_num,
        a.basket_goods_amount basket_goods_amount,
        to_char(b.goods_image) basket_goods_image,
        a.basket_date basket_date
   from basket a, goods b 
  where a.basket_member_id ='hongildong'
	and a.basket_goods_num = b.goods_num
      )		   
)		

update basket a
   set a.goods_image = (select b.goods_image from goods b where b.goods_num = a.basket_goods_num)
 ;
 
 insert into basket(basket_num,basket_member_id,basket_goods_num,basket_goods_amount,basket_date)
     select basket_num,basket_member_id,basket_goods_num,basket_goods_amount,basket_date from basket_tmp

 select * from basket;
      
 select * 
		  from
		 (select a.basket_num basket_num,
		         a.basket_member_id basket_member_id,
		         a.basket_goods_num basket_goods_num,
		         a.basket_goods_amount basket_goods_amount,
		         b.goods_image  goods_image,
		         a.basket_date basket_date
		    from basket a,
		         goods b  
		   where a.basket_member_id ='hongildong'
		     and a.basket_goods_num = b.goods_num
		  )
		  
/* 칼럼 명 select */	
select lower(column_name)||',' 
  from cols
 where table_name='GOODS_ORDER'
 order by column_id;
 
 /* 주문 번호(전표) 발번용 sequence */
 create sequence order_trade_no_seq
 increment by 1 start with 1000001 nocache 
 maxvalue 9999999 cycle;
 
 select sysdate||'-'||order_trade_no_seq.nextval from dual;
 
 select to_char(to_date(sysdate,'YYYY-MM-DD')||'-'||order_trade_no_seq.nextval) from dual;
 
 
 select lower(column_name)||',' from cols where table_name='GOODS_ORDER' order by column_id;
 
 select * from goods_order;
 
 select * from basket;