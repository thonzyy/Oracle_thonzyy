--INNER JOIN : 양쪽 테이블에 같은 값이 있는 것만 조회
-- 조인 조건에 사용되는 컬럼의 어느 한쪽 레테이블만 값이 존재하면
--검색되지 않는다.

--사원번호, 사원명, 부서번호, 부서명, 위치 검색
--중복되는 컬럼명에는 테이블명을 기술하여 사용
SELECT EMPNO, ENAME, EMP.DEPTNO,DEPT.DEPTNO ,DNAME, LOC
FROM EMP
INNER JOIN DEPT
ON (EMP.DEPTNO=DEPT.DEPTNO);

--테이블명이 길면 작성하기 어렵다. -> 테이블명에 ALIAS를 붙여서 사용
--ALIAS는 INLINE VIEW에 반영되지 않는다.
SELECT E.EMPNO, E.ENAME, E.DEPTNO,D.DEPTNO ,D.DNAME, D.LOC
FROM EMP E 
INNER JOIN DEPT D
ON (E.DEPTNO=D.DEPTNO);


--ORACLE INNER JOIN 문법

SELECT EMPNO,ENAME, EMP.DEPTNO, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;


--ALIAS 테이블 명에 ALIAS가 부여되면 이전 테이블명은 사용할 수 없다.
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D 
WHERE E.DEPTNO=D.DEPTNO ;

--차량의 제조국 제조사 , 모델명을 검색 (존재하는 데이터만 출력)





SELECT *
FROM DEPT  ;

SELECT *
FROM CAR_MAKER ;

--보유중인 차량의 제조국 제조사 모델명 가격 연식을 조회
SELECT CC.COUNTRY ,CC.MAKER,CMA.MODEL, CMO.PRICE, CMO.CAR_YEAR 
FROM CAR_COUNTRY CC
INNER JOIN CAR_MAKER CMA 
ON CMA.MAKER = CC.MAKER 
INNER JOIN CAR_MODEL CMO 
ON CMO.MODEL=CMA.MODEL;


SELECT CC.COUNTRY , CC.MAKER , MA.MODEL , MO.PRICE ,MO.CAR_YEAR  
FROM CAR_MODEL MO,CAR_MAKER MA, CAR_COUNTRY CC
WHERE (MO.MODEL = MA.MODEL AND MA.MAKER =CC.MAKER);  

SELECT E.EMPNO ,E.ENAME ,D.DNAME ,D.DEPTNO 
FROM EMP E
RIGHT OUTER JOIN DEPT D 
ON D.DEPTNO = E.DEPTNO; 

SELECT D.DNAME, D.DEPTNO ,E.EMPNO ,E.ENAME 
FROM DEPT D 
LEFT OUTER JOIN EMP E
ON E.DEPTNO=D.DEPTNO ;

SELECT D.DNAME, D.DEPTNO ,E.EMPNO ,E.ENAME 
FROM DEPT D 
FULL OUTER JOIN EMP E
ON E.DEPTNO=D.DEPTNO ;

SELECT *
FROM EMP;
SELECT *
FROM DEPT;

--ORACLE OUTER JOIN 
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME
FROM DEPT D, EMP E
WHERE E.DEPTNO(+) = D.DEPTNO ;

--모든 차량 모델의 제조국, 제조사 , 모델명, 연식 ,가격 ,배기량 조회

SELECT CC.COUNTRY ,CC.MAKER,CMA.MODEL, CMO.CAR_YEAR ,CMO.PRICE, CMO.CC  
FROM CAR_COUNTRY CC
LEFT OUTER JOIN CAR_MAKER CMA 
ON CMA.MAKER = CC.MAKER 
LEFT OUTER JOIN CAR_MODEL CMO 
ON CMO.MODEL=CMA.MODEL;

SELECT CC.COUNTRY ,CC.MAKER,CMA.MODEL, CMO.CAR_YEAR ,CMO.PRICE, CMO.CC  
FROM CAR_COUNTRY CC, CAR_MAKER CMA, CAR_MODEL CMO
WHERE CC.MAKER(+)= CMA.MAKER AND CMO.MODEL(+)=CMA.MODEL ; 

SELECT *
FROM CAR_COUNTRY;

SELECT *
FROM CAR_MODEL ;

SELECT * 
FROM CAR_MAKER ;
