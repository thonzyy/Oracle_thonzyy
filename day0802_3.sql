-----문자열함수
--length
SELECT LENGTH('ABCD2023'), LENGTH('오늘은 수요일 입니다')
FROM DUAL;


--사원 테이블에서 사원명이 4자인 사원들의 사원명, 연봉, 입사일 조회

SELECT ENAME,LENGTH(ENAME) ENAME_LENGTH ,SAL, HIREDATE
FROM EMP
WHERE LENGTH(ENAME) >4;

--모두 대문자로 UPPER, 모두 소문자로 LOWER
SELECT UPPER('AbcdEf') , lower('ABCDE')

FROM DUAL;

--사원 테이블에서 사원명이 SCOTT인 사원의 사원번호, 사원명, 매니저번호 조회

SELECT DEPTNO, ENAME, MGR
FROM EMP
WHERE ENAME = UPPER('scott');


SELECT ENAME, LOWER(ENAME) LOWER_ENAME
FROM EMP;

--첫 글자를 대문자로
SELECT INITCAP('oracle') , INITCAP('ORACEL'),
INITCAP(' i am boy')
FROM  DUAL;

SELECT ENAME, INITCAP(ENAME)
FROM EMP;

--특정 문자열의 인덱스 얻기 (오라클은 시작인덱스가 1번부터)
--해당 문자열이 없으면 0이 나온다.
SELECT INSTR('ABCDE', 'D'), INSTR('ABCDEF','G'),
INSTR('ABCDE', 'CDE') , INSTR('ABCDEF','A',2)
FROM DUAL;

--사원 테이블에서 사원명에 두번째 글자에 A가 있는 사원의 사원명으 조히
SELECT ENAME
FROM EMP
WHERE INSTR( ENAME,'A') = 2;


--substr
SELECT SUBSTR('ABCDEF',3,4) , SUBSTR('ABCDEF',3)

FROM DUAL;

ALTER TABLE TEST_NULL ADD EMAIL VARCHAR2(50) DEFAULT 'test@test.com';

INSERT INTO TEST_NULL(EMAIL) VALUES('kim@daum.net');
INSERT INTO TEST_NULL(EMAIL) VALUES('sangjun@gmail.net');
INSERT INTO TEST_NULL(EMAIL) VALUES('hongchanyoung@nate.com');
INSERT INTO TEST_NULL(EMAIL) VALUES('chacha@charchar.co.kr');
commit;

select * from test_null;

--test_null 테이블의 이메일 컬럼을 사용하여 메일주소와 도메인 주소를
--분리하여 조회
SELECT SUBSTR(EMAIL,0,INSTR(EMAIL,'@')-1) MAIL_ADDR , SUBSTR(EMAIL,INSTR(EMAIL,'@')+1) DOMIN_ADDR
FROM TEST_NULL;

SELECT EMAIL
FROM TEST_NULL
WHERE INSTR(EMAIL,'gmail.net') =0;


--trim
SELECT '['||TRIM('   A BC    ')||']' OUTPUT ,
'['||LTRIM('   A BC    ')||']' OUTPUT2,
'['||RTRIM('   A BC    ')||']' OUTPUT3
FROM DUAL;

SELECT TRIM('a' from 'aaaaaaaaaaaaOracleaaaaaaaaaaaaa')  -- 특정 문자열 쳐내기
FROM DUAL ;

--특정문자 채우기
--LPAD( 값, 전체글자수, 채울문자)
SELECT LPAD('ABCDE',10,'$'), LPAD('가나다',10,'$')
	,LPAD('가나다',11,'카') -- 바이트가 남을 경우는 공백으로 처리된다.
FROM DUAL;

SELECT RPAD('ABCDE', 10, '#') , RPAD('ABCDE',8,'U')
FROM  DUAL;
