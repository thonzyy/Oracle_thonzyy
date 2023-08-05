--UPDATE SUBQUERY----------
--다른 컬럼의 값을 참조하여 변경할 때 사용.

--CP_EMP1 테이블의 사원번호가 1111번인 사원의 부서번호를 
--CP_EMP1 테이블의 사원 번호가 7844인 사원의 부서번호로 변경.

UPDATE CP_EMP1
SET DEPTNO=(SELECT DEPTNO FROM CP_EMP1 WHERE EMPNO=7844)
WHERE EMPNO=1111;
COMMIT;

UPDATE CP_EMP1
SET DEPTNO=(SELECT DEPTNO FROM CP_EMP1 )
WHERE EMPNO=1111;
COMMIT;

--cp_emp1 테이블의 사원번호가 emp테이블에 사원명이 king인 사원과 동일한 사원을 찾아
-- 연봉을 김선경 사원과 동일한 연봉으로 , 입사일을 장용석 사원과 동일한 입사일로 변경

UPDATE CP_EMP1 
SET SAL = (SELECT SAL FROM CP_EMP1  WHERE EMPNO=1111),
    HIREDATE = (SELECT HIREDATE  FROM CP_EMP1 WHERE EMPNO=1122)
WHERE EMPNO=7839;


--WHERE 절에 IN을 사용하면 복수행 서브쿼리도 가능
--CP_EMP1 테이블에서 10번 부서에 해당하는 모든 사원들을 조회하여
--CP_EMP1 테이블에 해당하는 사원들의 연봉을 5000으로 변경
UPDATE CP_EMP1 
SET SAL = 5000
WHERE EMPNO IN (SELECT EMPNO FROM EMP WHERE DEPTNO=10);


--DELETE subquery--

--emp 테이블에서 사원명이 스콧인 사원 사원번호를 조회하여 7788
-- cp_emp1 테이블에서 같은 사원 번호를 사용하는 레코드를 삭제

DELETE FROM CP_EMP1 
WHERE empno = (SELECT empno FROM emp WHERE ename = 'SCOTT');

--emp 테이블에서 10번 부서에 해당하는 모든 사원들을 조회하여
-- cp_emp1 테이블에서 해당하는 사원들을 삭제

DELETE FROM CP_EMP1 
WHERE EMPNO IN  ( SELECT EMPNO  FROM EMP WHERE DEPTNO=10);
COMMIT;

--EMP 테이블에서 사원번호가 7654인 사원이 입사한 년도를 조회하여
-- CP_EMP1 테이블에서 같은 년도에 입사한 모든 사원 정보르 삭제
DELETE  FROM CP_EMP1 
WHERE TO_CHAR(HIREDATE, 'YYYY') = (SELECT  TO_CHAR(HIREDATE, 'YYYY') 
FROM EMP 
WHERE EMPNO= 7654);

--EMP 테이블에서 부서번호가 20,30인 부서에 근무하는 사원정보를 CP_EMP1 추가
-- 추가 컬럼: 사원번호, 사원명, 부서번호, 입사일, 연봉
INSERT INTO CP_EMP1 
(SELECT EMPNO, ENAME , DEPTNO, HIREDATE, SAL 
FROM EMP 
WHERE DEPTNO IN (10,20));

---------------SELECT 단수행서브쿼리-----------
--EMP 테이블에서 사원번호가 7698인 사원의 부서번호를 조회하여
--CP_EMP1 테이블에서 같은 부서에서 근무하는 사원을 조회
--조회 컬럼 : 사원번호, 사원명, 부서번호, 연봉
SELECT EMPNO, ENAME , DEPTNO , SAL
FROM CP_EMP1 
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE EMPNO = 7698);

--SCALAR SUBQUERY 
--사원번호 사원명 부서번호 부서명을 조회
-- 단 부서명은 DEPT 테이블에 존재하는 이름으로 출력
SELECT EMPNO, ENAME, DEPTNO,(SELECT DNAME FROM DEPT WHERE DEPT.DEPTNO=EMP.DEPTNO) DNAME
FROM EMP;

--사원테이블에서 평균연봉 이상인 사원의 사원번호, 사원명 ,연봉을 조회
SELECT EMPNO ,ENAME , SAL 
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

--사원테이블에서 가장 많은 연봉을 갖는 사원명 조회
SELECT ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP); -- > 집계함수는 웨어절에서 쓸 수 없다.

--사원테이블에서 최고 연봉과 최고 연봉을 받는 사원을 조회

SELECT SAL , ENAME
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);



SELECT EMPNO, ENAME, DEPTNO, HIREDATE, SAL
FROM CP_EMP1;

SELECT * FROM EMP;
