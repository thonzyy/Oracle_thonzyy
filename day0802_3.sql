-----���ڿ��Լ�
--length
SELECT LENGTH('ABCD2023'), LENGTH('������ ������ �Դϴ�')
FROM DUAL;


--��� ���̺��� ������� 4���� ������� �����, ����, �Ի��� ��ȸ

SELECT ENAME,LENGTH(ENAME) ENAME_LENGTH ,SAL, HIREDATE
FROM EMP
WHERE LENGTH(ENAME) >4;

--��� �빮�ڷ� UPPER, ��� �ҹ��ڷ� LOWER
SELECT UPPER('AbcdEf') , lower('ABCDE')

FROM DUAL;

--��� ���̺��� ������� SCOTT�� ����� �����ȣ, �����, �Ŵ�����ȣ ��ȸ

SELECT DEPTNO, ENAME, MGR
FROM EMP
WHERE ENAME = UPPER('scott');


SELECT ENAME, LOWER(ENAME) LOWER_ENAME
FROM EMP;

--ù ���ڸ� �빮�ڷ�
SELECT INITCAP('oracle') , INITCAP('ORACEL'),
INITCAP(' i am boy')
FROM  DUAL;

SELECT ENAME, INITCAP(ENAME)
FROM EMP;

--Ư�� ���ڿ��� �ε��� ��� (����Ŭ�� �����ε����� 1������)
--�ش� ���ڿ��� ������ 0�� ���´�.
SELECT INSTR('ABCDE', 'D'), INSTR('ABCDEF','G'),
INSTR('ABCDE', 'CDE') , INSTR('ABCDEF','A',2)
FROM DUAL;

--��� ���̺��� ����� �ι�° ���ڿ� A�� �ִ� ����� ������� ����
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

--test_null ���̺��� �̸��� �÷��� ����Ͽ� �����ּҿ� ������ �ּҸ�
--�и��Ͽ� ��ȸ
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

SELECT TRIM('a' from 'aaaaaaaaaaaaOracleaaaaaaaaaaaaa')  -- Ư�� ���ڿ� �ĳ���
FROM DUAL ;

--Ư������ ä���
--LPAD( ��, ��ü���ڼ�, ä�﹮��)
SELECT LPAD('ABCDE',10,'$'), LPAD('������',10,'$')
	,LPAD('������',11,'ī') -- ����Ʈ�� ���� ���� �������� ó���ȴ�.
FROM DUAL;

SELECT RPAD('ABCDE', 10, '#') , RPAD('ABCDE',8,'U')
FROM  DUAL;
