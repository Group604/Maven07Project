CREATE TABLE zipcode_street (
  DONGCODE VARCHAR2(10),
  SIDO VARCHAR2(30),
  SIGUNGU VARCHAR2(30),
  DONG VARCHAR2(30),
  RI VARCHAR2(30),
  ISMOUNTAIN VARCHAR2(1)  DEFAULT '0',
  JIBUN1 NUMBER(4) NOT NULL,
  JIBUN2 NUMBER(4) NOT NULL,
  STREETCODE VARCHAR2(12),
  STREET VARCHAR2(90),
  ISUNDER CHAR(1),
  BUILDINGNUM1 VARCHAR2(5),
  BUILDINGNUM2 VARCHAR2(5),
  BUILDING VARCHAR2(50),
  BUILDINGDETAIL VARCHAR2(110),
  BUILDINGCODE VARCHAR2(25) DEFAULT '' NOT NULL ,
  DONGSEQ VARCHAR2(2),
  HAENGDONGCODE VARCHAR2(10),
  HAENGDONG VARCHAR2(30),
  ZIPCODE VARCHAR2(6),
  ZIPSEQ VARCHAR2(10),
  MASSDESTINATION VARCHAR2(60),
  PRIMARY KEY  (BUILDINGCODE,ISMOUNTAIN,JIBUN1,JIBUN2)
)



CREATE TABLE zipcode_streetname (
  SIGUNGUNUMBER VARCHAR(5),
  STREETNUMBER VARCHAR(7),
  STREET VARCHAR(160),
  STREETENG VARCHAR(160),
  DONGSEQ VARCHAR(2),
  SIDO VARCHAR(40),
  SIGUNGU VARCHAR(40),
  DONGTYPE VARCHAR(1),
  DONGCODE VARCHAR(3),
  DONG VARCHAR(40),
  PARENTSTREETNUMBER VARCHAR(7),
  PARENTSTREET VARCHAR(160),
  ISUSE VARCHAR(1),
  CHANGEREASON VARCHAR(1),
  CHAGEINFO VARCHAR(28)
  )
  
CREATE INDEX IDX_STREET ON ZIPCODE_STREETNAME(STREET);  
  

select * from goods

select * from category;

insert into category values(category_no_seq.nextval, 'Ristretto','리스트레토');
insert into category values(category_no_seq.nextval, 'Espresso','에스프레소');
insert into category values(category_no_seq.nextval, 'Lungo','룽고');
insert into category values(category_no_seq.nextval, 'Intenso','인텐소');
insert into category values(category_no_seq.nextval, 'pureOrigin','퓨어오리진');
insert into category values(category_no_seq.nextval, 'Decaffein','디카페인');
insert into category values(category_no_seq.nextval, 'Veriation','베리에이션');

select * from goods;
