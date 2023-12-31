--UNIQUE
--컬럼단위
CREATE TABLE UNIQUE_COLUMN(
	NAME VARCHAR2(30),
	EMAIL VARCHAR2(50) CONSTRAINT UK_UNIQUE_COLUMN_EMAIL UNIQUE
);


---------------------추가성공-----------------------
--최초입력
INSERT INTO UNIQUE_COLUMN (NAME, EMAIL) VALUES ('박상준','park@test.com');

SELECT * 
FROM UNIQUE_COLUMN ;
--다른값으로 추가

INSERT INTO UNIQUE_COLUMN (NAME, EMAIL)
VALUES('박상준','kim@test.com');
--NULL추가
INSERT INTO UNIQUE_COLUMN (NAME,EMAIL)
VALUES ('박상준','');

INSERT INTO UNIQUE_COLUMN (NAME)
VALUES ('송지상');

SELECT NAME, EMAIL 
FROM UNIQUE_COLUMN ;


--------추가 실패-----
--중복값이 입력되면 추가 실패
INSERT INTO UNIQUE_COLUMN (NAME,EMAIL)
VALUES ('홍찬영','kim@test.com');

--테이블 단위

CREATE TABLE UNIQUE_TABLE(
 NAME VARCHAR2(30),
 PHONE VARCHAR2(13),
 CONSTRAINT UK_UNIQUE_TABLE_PHONE UNIQUE(PHONE)
);


-----------unique로 fk설정---------
CREATE TABLE FOREIGN_UNIQUE (
 EMAIL VARCHAR2(50) CONSTRAINT FK_FOREIGN_UNIQUE_EMAIL REFERENCES UNIQUE_COLUMN(EMAIL)
);

--추가성공
--부모 테이블에 조재하는 값으로만 추가
INSERT INTO FOREIGN_UNIQUE (EMAIL) VALUES ('kim@test.com');
INSERT INTO FOREIGN_UNIQUE (EMAIL) VALUES ('park@test.com');
--null을 입력
INSERT INTO FOREIGN_UNIQUE (EMAIL) VALUES ('');
--추가실패
--부모테이블에 존재하지 않는 값으로 추가
INSERT INTO FOREIGN_UNIQUE (EMAIL) VALUES ('tuna@test.com');



------------CHECK, NOT NULL, DEFAULT-----
--나이 : 20~30대 까지만 입력 가능, 이름 : 반드시 입력해야 되고
--입력일 : 컬럼이 생략되면 현재 날짜로 입력
CREATE TABLE OTHER_CONSTRAINTS (
 AGE NUMBER(2) CHECK (AGE >=20 AND AGE< 40 ),
 NAME VARCHAR2(30) NOT NULL,
 INPUT_DATE DATE DEFAULT SYSDATE
); 

SELECT *
FROM FOREIGN_UNIQUE;
SELECT *
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'C';
SELECT *
FROM USER_TAB_COLS
WHERE TABLE_NAME = 'OTHER_CONSTRAINTS' ;

--추가 성공
-- 나이가 20~30대이고 , 이름이 있고 , 입력일이 있는 경우
INSERT INTO OTHER_CONSTRAINTS (AGE,NAME)
VALUES(25,'홍찬영');
--나이가 20~30대이고 이름이 있고, 입력일이 생략되는 경우
SELECT AGE, NAME, INPUT_DATE
FROM OTHER_CONSTRAINTS ;
--추가 실패

--나이가 20~30대가 아닌 경우
NSERT INTO OTHER_CONSTRAINTS (AGE,NAME)
VALUES(40,'홍찬영');
-- 이름이 NULL인 경우 
INSERT INTO OTHER_CONSTRAINTS (AGE,NAME)
VALUES(25,'');

