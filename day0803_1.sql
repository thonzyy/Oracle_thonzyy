--조건함수

SELECT decode ( 'A', 'A' , '소심하다', 'B', '터프하다' , 'AB' , '싸이코' ,
  'O','우유부단', '사람의 혈액형이 아닙니다.')

FROM DUAL;

--사원 테이블에서 사원번호, 사원명, 부서번호, 부서명을 조회
-- 단, 부서명은 부서번호가 10번인 경우 개발부 , 20 유지보수 , 30- 영업 축구부
SELECT EMPNO, ENAME , DEPTNO , DECODE ( DEPTNO, 10, '개발부', 20, '유지보수', 30 ,'영업' , '축구부') DEPT_NAME
FROM EMP;

SELECT EMPNO, ENAME, DEPTNO,
			CASE DEPTNO WHEN 10 THEN '개발부'
									WHEN 20 THEN '유지보수'
									WHEN 30 THEN '영업부'
									ELSE '축구부'
									END    DEPT_NAME

FROM EMP;

--사원 테이블에서 사원번호, 사원명, 부서번호, 연봉, 특별보너스를 조회
-- 단, 특별보너스는 부서별로 차등지급
-- 10번 부서는 연봉의 10%,
--20번은 연봉과 보너스를 합산한 금액 35% ,
--30번 부서는 연봉의 50% 그 외는 연봉의 100%
SELECT EMPNO, ENAME, DEPTNO, SAL ,
				CASE DEPTNO WHEN 10 THEN SAL*0.1
										WHEN 20 THEN (SAL+NVL2(COMM, COMM, 0))*0.35
										WHEN 30 THEN SAL*0.5
										ELSE SAL
										END     SPECIAL_INCEN
FROM EMP;


--변환 함수
--날짜 변환

SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy-mm-dd d dy day am hh(hh12, hh24):mi :ss')
FROM DUAL;
SELECT * FROM EMP;


SELECT TO_CHAR(SYSDATE,'yyyy  " 년 " mm " 월 " dd " 일 " hh " 시 " mm " 분 " ss " 초 "  ') TODAY
FROM DUAL;

-- 사원테이블에서 사원번호 사원명 입사일 조회
-- 단 입사일은 월 일 년 요일 의 형식으로 출력
SELECT EMPNO, ENAME, TO_CHAR (HIREDATE, 'mm--dd--yy--day')
FROM  EMP;


--사원 테이블에서 입사년도가 1981년인 사원의 사원번호, 사원명 ,입사일,
--연봉을 조회
SELECT  EMPNO, ENAME, HIREDATE, SAL
FROM EMP
WHERE TO_CHAR(HIREDATE, 'yyyy') = 1981;

SELECT * FROM EMP;

SELECT '['||TO_CHAR(2023, '0,000,000')||']' ,     '['||TO_CHAR(2023, '9,999,999')||']'
				,TO_CHAR(202308,'0,000')
FROM DUAL;

--사원테이블에서 사원번호, 연봉, 부서번호를 조회
--단 , 연봉은 데이터가 있는 것까지만 3자리마다 ,넣어 출력
SELECT EMPNO, TO_CHAR(SAL, '0,000') SAL, DEPTNO
FROM EMP;


SELECT * FROM TEST_DATE;
-- DATE 컬럼에 SYSDATE로 추가하는 경우에 시간 정보가 들어간다.
-- DATE 컬럼에 다른 날짜 정보를 추가할 떄에는 날짜형식의 문자열을 사용하거나
--TO_DATE 함수를 사용.

INSERT INTO TEST_DATE VALUES('2023-08-04');
--년월일 형식이 아니어서 ERROR
INSERT INTO TEST_DATE VALUES('08-04-2023');

--TO_DATE 함수를 사용해서 날짜 정보를 추가.
INSERT INTO TEST_DATE VALUES(TO_DATE('2023-08-04','yyyy-mm-dd'));

INSERT INTO TEST_DATE VALUES(TO_DATE('08-05-2023', 'mm-dd-yyyy'));

--to_date 사용하지 않았을 떄 error : 함수호출하는 경우에만
--to_char함수의 첫번째 매개변수는 date로 선언되어있다.
SELECT TO_CHAR ( '2023-08-24', 'mm-dd-yyyy')
FROM DUAL;

--문자열을 날짜형으로 변경해야한다. to_date사용.
SELECT TO_CHAR ( TO_DATE('2023-08-05','yyyy-mm-dd'), 'dd-mm-yyyy' )
FROM DUAL;


--숫자변환
SELECT '8'+'3' , TO_NUMBER('8') + TO_NUMBER('3')
FROM DUAL;


