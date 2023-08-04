

--1. 사원테이블에서 사원번호, 사원명,직무, 매니저번호,연봉,
--   입사일을 조회하세요.
-- 단, 입사일은 ‘월-일-년 요일’의 형식으로 출력하세요.
--    연봉은 3자리마다 ,를 넣어 출력하세요

SELECT EMPNO ,ENAME ,JOB ,MGR , SAL , TO_CHAR(HIREDATE,  'mm-dd-yyyy day')
FROM EMP;

--2. 사원테이블에서 부서번호, 사원번호, 연봉, 보너스, 총수령액, 실수령액, 월급
--입사일을 조회하세요.
--   단. 총 수령액은 '연봉+보너스'를 합산한 금액으로 조회하세요.
--       실 수령액은 ‘연봉+보너스를 합산한 금액에서 3.3%를 제외한 금액’으로 조회,
--     월급은 연봉을 12로 나눈 값을 원단위 절사하여 조회하세요.

SELECT DEPTNO, EMPNO, SAL, TRUNC(SAL/12) MONTH_INCOME, NVL2(COMM,COMM,0) COMM, (SAL+NVL2(COMM,COMM,0)) TOTAL_INCOME ,
   (SAL+NVL2(COMM,COMM,0))-((SAL+NVL2(COMM,COMM,0))*0.033) REAL_INCOME
FROM EMP;

--3. 아래의 데이터를 참조하여 test1 테이블을 생성하고  레코드를 추가할 것.
--   컬럼명 : 이름, 나이, 태어난해, 주민번호
--     강다연,25,1995,’950101-2234567‘
--     김다영,25,1995,’951126-1234567‘
--     김선경,26,1994,’940101-2234567‘
--     김인영,26,1994,’940101-1234567‘
--     김주민,27,1993,’930101-5234567‘

CREATE TABLE TEST1(
	NAME CHAR(9),
	AGE NUMBER(2),
	BIRTH_YEAR NUMBER(4),
	IDENTIFIED_NUM CHAR(14)
);


INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('강다연',25,1995,'950101-2234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('김다영',25,1995,'951126-1234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('김선경',26,1994,'940101-2234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('김인영',26,1994,'940101-1234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('김주민',27,1993,'930101-5234567');

COMMIT;

SELECT  SUBSTR( IDENTIFIED_NUM , 8 ,1)
FROM TEST1;


--4. test1 테이블에서 이름 ,나이, 태어난 해, 주민번호,  성별을 조회 하세요.
   --성별은 주민번호의  8번째 자리로 구하고,
   --8번째 자리가 1,3이면 '남자', 2,4면 '여자' 5,6,7,8이면 '외국인'그렇지
   --않으면 "오류" 로 출력한다

SELECT NAME, AGE, BIRTH_YEAR, IDENTIFIED_NUM,

                 --  	CASE SUBSTR( IDENTIFIED_NUM , 8 ,1)
----										      WHEN '1' THEN '남자'
----			                    WHEN '3' THEN '남자'
----			                    WHEN '2' THEN '여자'
----			                    WHEN '4' THEN '여자'
----			                    WHEN '5' THEN '외국인'
----                          WHEN '6' THEN '외국인'
----                          WHEN '7' THEN '외국인'
----                          WHEN '8' THEN '외국인'
----                          ELSE '오류'
----                          END GENDER

CASE
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '1', '3') THEN '남자'
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '2', '4') THEN '여자'
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '5', '6','7','8') THEN '외국인'
                    ELSE '오류'
                    END GENDER
FROM TEST1;
--5.emp테이블을 사용하여 아래와 같이 조회 하세요.
--  xxx번 Xxxx사원의 입사일은 yyyy-mm-dd 요일 일 입니다. 연봉은 $xxx 입니다.
-- 단. 입사요일이 월,화,목에 입사한 사원에 대해서만 조회합니다.
--     사원명은 첫 글자만 대문자로 조회하고, 입사일의 오름차순 정렬하여 출력하되
--     입사일이 같다면 연봉의 내림차순으로 정렬하여 출력하세요.
--      연봉은 3자리마다 ,를 넣어서 출력하세요.


SELECT EMPNO||'번 '||INITCAP(ENAME)||'사원의 입사일은 '||TO_CHAR(HIREDATE, 'yyyy-mm-dd day')||' 일 입니다. 연봉은$'||TO_CHAR(SAL,'9,999') ||'입니다' INPUT
FROM EMP
WHERE TO_CHAR(HIREDATE, 'DY') IN ( '월','화','목')
ORDER BY HIREDATE, SAL DESC;



SELECT DEPTNO,DNAME
FROM DEPT
WHERE LOC LIKE 'DALLAS';


