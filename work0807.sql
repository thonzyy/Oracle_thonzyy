--1
CREATE TABLE CP_ZIPCODE AS (SELECT * FROM ZIPCODE);
ALTER TABLE CP_ZIPCODE ADD CONSTRAINT PK_CP_ZIPCODE PRIMARY KEY(SEQ);
SELECT * 
FROM ZIPCODE ;
--2
CREATE TABLE WORK_INFO (
NUM NUMBER(1), 
ID VARCHAR2(20) CONSTRAINT PK_WORK_INFO PRIMARY KEY,
NAME CHAR(12) NOT NULL,
ADDR_SEQ NUMBER(5,0) CONSTRAINT FK_WORK_INFO REFERENCES CP_ZIPCODE(SEQ),
TEL CHAR(13) CONSTRAINT UK_WORK_INFO_TEL UNIQUE,
AGE NUMBER(3) DEFAULT 0,
GENDER CHAR(1) CHECK (GENDER IN ('M','F')),
INPUT_DATE DATE DEFAULT SYSDATE
);

--성공하는 경우
--PK 최초 입력 데이터는 NULL값이 아니면 입력 성공
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (1,'LEEE','이동원','359','010-5020-2631',25,'M','2023-07-07');
--NAME NULL값이 아니면 입력 성공
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (2,'KANG','강동원','360','010-5020-2632',25,'M','2023-07-02');
--ADDR_SEQ는 외부키이므로 프라이머리 키에 저장된 값 또는 NULL을 입력하면 입력 성공
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (3,'DONG','동동원','361','010-5020-2633',25,'M','2023-07-01');
--UNIQUE는 최초입력 데이터, 널값이거나, 비어있는 경우 입력 성공
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (4,'LEEM2','임동원2','364','',25,'M','2023-07-09');
  INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,AGE,GENDER,INPUT_DATE)
 VALUES (7,'LEEM12','임동원2','363',25,'M','2023-07-08');
--DEFALUT 값은 값을 입력 또는 NULL인 경우 기본값 입력
      INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (11,'CHA','차동원','365','010-5020-2635',29,'M','2023-07-11');
  INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER)
 VALUES (2,'YANG','양동원','565','010-1111-2635',31,'M');
--CHECK 는 M F만 입력 가능
      INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (20,'CHOI','최동원','412','010-7020-1135',31,'M','2023-07-10');
--실패하는 경우 
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
 VALUES (19,'LEEE','','0','010-5020-2631',25,'G','2023-07-07');
--ID PK이므로 유일한 값이여야 되고 NULL이면 안 됨.
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
VALUES (2,'LEEE','이동원2','359','010-5020-2631',25,'M','2023-07-07');
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
VALUES (3,'','이동원3','356','010-5020-2631',26,'M','2023-07-07');
--NAME NOT NULL 데이터형이 CHAR이므로 조건이므로 ''이면 안 된다.
 INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
VALUES (4,'LEEp','','359','010-5127-2631',27,'M','2023-07-07');
--ADDR_SEQ CP_ZIPCODE SEQ를 참조한 외래키이므로 PK에 없는 값이 들어오면 안 된다.
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
VALUES (5,'LEEM','임희주','0','010-5127-2631',27,'M','2023-07-07');
--GENDER는 CHECK 조건으로 M OR F만 입력가능.
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,AGE,GENDER,INPUT_DATE)
VALUES (6,'ALLT','올티','0','010-5128-2631',30,'T','2023-08-07');


INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,GENDER)
 VALUES (1,'kim','김주민','168','010-1234-7890','M');
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,GENDER)
 VALUES (2,'kim1','김선경','52144','010-2234-8811','M');
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,GENDER)
 VALUES (3,'lee','동원','3298','010-8471-1345','M');
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,GENDER)
 VALUES (4,'kim2','김인영','1','010-1111-2222','F');
INSERT INTO WORK_INFO (NUM, ID, NAME ,ADDR_SEQ,TEL,GENDER)
 VALUES (5,'hong','홍지성','35000','010-4511-3134','M');
COMMIT;
SELECT *
FROM WORK_INFO ;

SELECT ID, NAME, TEL,(SELECT ZIPCODE FROM CP_ZIPCODE WHERE  SEQ=ADDR_SEQ) ZIPCODE   ,(SELECT SIDO||' '||GUGUN||' '||DONG  FROM CP_ZIPCODE WHERE SEQ=ADDR_SEQ) ADDR 
FROM WORK_INFO;