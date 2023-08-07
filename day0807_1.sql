-----primary key----

--컬럼에서 NULL을 허용하지 않으면서 값이 유일해야 할 때 사용.
--아이디, 이름, 주소를 저장하는 테이블 생성
-- 컬럼단위
-- 테이블의 컬럼은 기본속성으로 NULL을 허용하면서 중복값도 허용한다.

CREATE TABLE PRIMARY_COLUMN (
    ID VARCHAR2(20) CONSTRAINT PK_PRIMARY_COLUMN PRIMARY KEY,
    NAME VARCHAR2(30) NULL,
    ADDR VARCHAR2(300)
);
DROP TABLE PRIMARY_COLUMN ;
PURGE RECYCLEBIN;


SELECT * 
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE= 'P';

INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES(10,'개발부','서울');

INSERT INTO PRIMARY_COLUMN (ID,NAME,ADDR) VALUES('park','박상준','서울');

--최초 데이터 입력
INSERT INTO PRIMARY_COLUMN (ID, NAME, ADDR) VALUES('kim','김주민','서울시');
-- 중복되지 않는 데이터 입력
INSERT INTO PRIMARY_COLUMN (ID, NAME, ADDR) VALUES('kim1','김선경','인천시');
--다른 컬럼에는 pk컬럼과 같은 값이 들어있어도 괜찮다.
INSERT INTO PRIMARY_COLUMN (ID, NAME, ADDR) VALUES('park','kim1','인천시');
SELECT *
FROM PRIMARY_COLUMN ;
----ERROR 발생-----
--중복 데이터 입력
--중복데이터 입력 : park는 이미 존재하므로 error
--INSERT INTO PRIMARY_COLUMN (ID,NAME,ADDR)VALUES('park','홍찬영','경기도');


--NULL이 입력
--number, date => 컬럼명을 생략하면 null
--varchar2, char => 컬럼명을 생략하거나, insert 할 때 ''를 넣으면 null

-- 컬럼명을 생략하는 경우
INSERT INTO PRIMARY_COLUMN (ID,NAME,ADDR) VALUES('홍찬영','경기도');

 --''를 입력하는 경우
INSERT INTO PRIMARY_COLUMN (ID,NAME) VALUES ('','서울시');

CREATE TABLE PRIMARY_TABLE (
   ID VARCHAR2(20), 
    NAME VARCHAR2(30) ,
    ADDR VARCHAR2(300),
    CONSTRAINT PK_PRIMARY_TABLE PRIMARY KEY(ID)
);

SELECT * 
FROM USER_CONSTRAINTS;
WHERE table_name = 'PRIMARY_TABLE';

--제약사항이 설정된 컬럼 확인 DD : USER_CONS_COLUMNS;
SELECT *
FROM user_cons_columns;

--인덱스 확인 DD : USER_INDEXES;

SELECT *
FROM USER_INDEXES;

--테이블의 컬럼정보(컬럼명, 데이터형, 크기등 ) DD : USER_tab_cols

SELECT *
FROM user_tabs_cols
WHERE table_name='emp';

