-- 사원 테이블에서 연봉이 1500~3000사이인 사원의
--사원번호, 사원명, 연봉, 입사일, 부서번호, 직무, 매니저번호를 조회한 레코드를 사용하여
--  emp_work테이블을 생성하고 추가합니다.
 ;
CREATE TABLE EMP_WORK AS (  SELECT EMPNO, ENAME , SAL , HIREDATE,DEPTNO, JOB ,MGR
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000 ) ;


SELECT * FROM EMP_WORK
ORDER BY EMPNO DESC;



--   emp테이블에서 10번 30번 부서의 사원 정보를 조회하여 emp_work테이블에
--  조회 결과를 추가합니다.
--   단, 사원번호는 조회된 사원번호에 1000을 더한 값으로 추가할 것.
--      원본 data 7788 -> insert 8788

 INSERT INTO EMP_WORK (
SELECT EMPNO+1000 EMPNO, ENAME , SAL ,HIREDATE,DEPTNO , JOB, MGR
FROM EMP
WHERE DEPTNO IN ( 10,30));
COMMIT;

-- emp_work 테이블에서 10번 부서에 근무하는 사원들의 연봉을  emp테이블의
--  사원번호가 7698번 사원 연봉과 7782번 사원의 연봉을 더한 금액으로 변경하세요.

UPDATE EMP_WORK
SET SAL = (SELECT SAL FROM EMP WHERE EMPNO = 7782) + (SELECT SAL FROM EMP WHERE EMPNO = 7698)
WHERE DEPTNO = 10;


--숙제4. emp_work 테이블에 아래와 같은 레코드를 추가하세요.
--사원번호 : emp_work의 가장 마지막 사원번호에서 1 증가한 번호, 사원명 : 김선경, 직무 : 개발자,
--  입사일 : 추가되는 시점의 다음날

INSERT INTO EMP_WORK (EMPNO, ENAME, JOB, HIREDATE ) VALUES ((SELECT EMPNO FROM EMP_WORK WHERE ENAME = 'MILLER')+1,'김선경','개발자',SYSDATE+1 );
COMMIT;


SELECT * FROM EMP;
  SELECT * FROM EMP_WORK;

CREATE TABLE SALES (
 NUM NUMBER(1),
 ITEM_NAME VARCHAR2(9),
 PRICE NUMBER(5),
 SELL_DATE DATE,
 QUANTITY NUMBER(1)
);
SELECT * FROM SALES;

--숙제5.아래와 같은 레코드를 저장할 수 있는  sales테이블을 생성하고 레코드를 추가하세요.
-- 번호 : 1, 상품명 : 키보드, 가격 : 20000, 판매일 : ‘2023-08-25’, 수량 : 1
-- 번호 : 2, 상품명 : 마우스, 가격 : 27000, 판매일 : ‘2023-08-25’, 수량 : 1
-- 번호 : 3, 상품명 : 모니터, 가격 : 350000, 판매일 : ‘2023-08-25’, 수량 : 1
-- 번호 : 4, 상품명 : 키보  드, 가격 : 23000, 판매일 : ‘2023-08-25’, 수량 : 1
-- 번호 : 5, 상품명 : 키보드, 가격 : 15000, 판매일 : ‘2023-08-25’, 수량 : 1
-- 번호 : 6, 상품명 : 키보드, 가격 : 20000, 판매일 : ‘2023-08-26’, 수량 : 1
-- 번호 : 7, 상품명 : 마우스, 가격 : 13000, 판매일 : ‘2023-08-26’, 수량 : 1
-- 번호 : 8, 상품명 : 키보드, 가격 : 22000, 판매일 : ‘2023-08-26’, 수량 : 1

INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 1, '키보드', 20000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 2, '마우스', 27000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 3, '모니터', 35000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 4, '키보드', 23000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 5, '키보드', 15000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 6, '키보드', 20000, '2023-08-26', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 7, '마우스', 13000, '2023-08-26', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 8, '키보드', 22000, '2023-08-26', 1);
COMMIT;



--숙제 6. 상품명, 총가격, 판매건수, 판매일, 입력일 을 저장할 수 있는  sales_adjustment 테이블을 생성하세요.

--숙제7. sales 테이블에서 ‘2023-08-25’ 에 판매된 상품의 상품명, 총가격, 판매건수 를  sales_adjustment
--    테이블에 추가하세요. -정산
--   추가   예)
--     키보드, 58000, 3, 2023-08-25, 오늘
 --    마우스 , 27000,1,  위와동일
 --    모니터, 350000,1, 위와동일

CREATE TABLE SALES_ADJUSTMENT (


 ITEM_NAME CHAR(9),
 TOTAL_PRICE NUMBER(8),
 SELL_NUM NUMBER(3),
 SELL_DATE DATE,
 INPUT_DATE DATE

);

;





INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM,SELL_DATE, INPUT_DATE)VALUES ((SELECT DISTINCT ITEM_NAME FROM SALES WHERE ITEM_NAME LIKE ('키보드')),
 (SELECT SUM(PRICE) FROM SALES WHERE ITEM_NAME LIKE ('키보드') AND TO_CHAR( SELL_DATE, 'YYYY-MM-DD')='2023-08-25' GROUP BY SELL_DATE)
 ,(SELECT SUM(QUANTITY) FROM SALES WHERE ITEM_NAME LIKE ('키보드') AND  TO_CHAR (SELL_DATE, 'YYYY-MM-DD') ='2023-08-25' GROUP BY ITEM_NAME)
, TO_DATE('2023-08-25', 'YYYY-MM-DD'), SYSDATE );
INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM,SELL_DATE, INPUT_DATE)VALUES ((SELECT DISTINCT ITEM_NAME FROM SALES WHERE ITEM_NAME LIKE ('키보드')),
 (SELECT SUM(PRICE) FROM SALES WHERE ITEM_NAME LIKE ('키보드') AND TO_CHAR( SELL_DATE, 'YYYY-MM-DD')='2023-08-25' GROUP BY SELL_DATE)
 ,(SELECT SUM(QUANTITY) FROM SALES WHERE ITEM_NAME LIKE ('키보드') AND  TO_CHAR (SELL_DATE, 'YYYY-MM-DD') ='2023-08-25' GROUP BY ITEM_NAME)
, TO_DATE('2023-08-25', 'YYYY-MM-DD'), SYSDATE );



INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM, SELL_DATE, INPUT_DATE)
(SELECT ITEM_NAME , PRICE , QUANTITY, SELL_DATE ,SYSDATE
FROM SALES
WHERE ITEM_NAME LIKE '마우스' AND TO_CHAR(SELL_DATE,'YYYY-MM-DD') = '2023-08-25') ;

INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM, SELL_DATE, INPUT_DATE )
(SELECT ITEM_NAME, PRICE, QUANTITY, SELL_DATE ,SYSDATE
FROM SALES
WHERE ITEM_NAME = '모니터'AND SELL_DATE = TO_DATE( '2023-08-25', 'YYYY-MM-DD'));
COMMIT;

SELECT * FROM SALES_ADJUSTMENT ;



SELECT * FROM SALES;
 SELECT  SUM(PRICE),SUM(NUM) ,SYSDATE  FROM SALES WHERE ITEM_NAME = '키보드'  GROUP BY ITEM_NAME;
