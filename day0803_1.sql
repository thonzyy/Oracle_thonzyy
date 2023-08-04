--�����Լ�

SELECT decode ( 'A', 'A' , '�ҽ��ϴ�', 'B', '�����ϴ�' , 'AB' , '������' ,
  'O','�����δ�', '����� �������� �ƴմϴ�.')

FROM DUAL;

--��� ���̺��� �����ȣ, �����, �μ���ȣ, �μ����� ��ȸ
-- ��, �μ����� �μ���ȣ�� 10���� ��� ���ߺ� , 20 �������� , 30- ���� �౸��
SELECT EMPNO, ENAME , DEPTNO , DECODE ( DEPTNO, 10, '���ߺ�', 20, '��������', 30 ,'����' , '�౸��') DEPT_NAME
FROM EMP;

SELECT EMPNO, ENAME, DEPTNO,
			CASE DEPTNO WHEN 10 THEN '���ߺ�'
									WHEN 20 THEN '��������'
									WHEN 30 THEN '������'
									ELSE '�౸��'
									END    DEPT_NAME

FROM EMP;

--��� ���̺��� �����ȣ, �����, �μ���ȣ, ����, Ư�����ʽ��� ��ȸ
-- ��, Ư�����ʽ��� �μ����� ��������
-- 10�� �μ��� ������ 10%,
--20���� ������ ���ʽ��� �ջ��� �ݾ� 35% ,
--30�� �μ��� ������ 50% �� �ܴ� ������ 100%
SELECT EMPNO, ENAME, DEPTNO, SAL ,
				CASE DEPTNO WHEN 10 THEN SAL*0.1
										WHEN 20 THEN (SAL+NVL2(COMM, COMM, 0))*0.35
										WHEN 30 THEN SAL*0.5
										ELSE SAL
										END     SPECIAL_INCEN
FROM EMP;


--��ȯ �Լ�
--��¥ ��ȯ

SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy-mm-dd d dy day am hh(hh12, hh24):mi :ss')
FROM DUAL;
SELECT * FROM EMP;


SELECT TO_CHAR(SYSDATE,'yyyy  " �� " mm " �� " dd " �� " hh " �� " mm " �� " ss " �� "  ') TODAY
FROM DUAL;

-- ������̺��� �����ȣ ����� �Ի��� ��ȸ
-- �� �Ի����� �� �� �� ���� �� �������� ���
SELECT EMPNO, ENAME, TO_CHAR (HIREDATE, 'mm--dd--yy--day')
FROM  EMP;


--��� ���̺��� �Ի�⵵�� 1981���� ����� �����ȣ, ����� ,�Ի���,
--������ ��ȸ
SELECT  EMPNO, ENAME, HIREDATE, SAL
FROM EMP
WHERE TO_CHAR(HIREDATE, 'yyyy') = 1981;

SELECT * FROM EMP;

SELECT '['||TO_CHAR(2023, '0,000,000')||']' ,     '['||TO_CHAR(2023, '9,999,999')||']'
				,TO_CHAR(202308,'0,000')
FROM DUAL;

--������̺��� �����ȣ, ����, �μ���ȣ�� ��ȸ
--�� , ������ �����Ͱ� �ִ� �ͱ����� 3�ڸ����� ,�־� ���
SELECT EMPNO, TO_CHAR(SAL, '0,000') SAL, DEPTNO
FROM EMP;


SELECT * FROM TEST_DATE;
-- DATE �÷��� SYSDATE�� �߰��ϴ� ��쿡 �ð� ������ ����.
-- DATE �÷��� �ٸ� ��¥ ������ �߰��� ������ ��¥������ ���ڿ��� ����ϰų�
--TO_DATE �Լ��� ���.

INSERT INTO TEST_DATE VALUES('2023-08-04');
--����� ������ �ƴϾ ERROR
INSERT INTO TEST_DATE VALUES('08-04-2023');

--TO_DATE �Լ��� ����ؼ� ��¥ ������ �߰�.
INSERT INTO TEST_DATE VALUES(TO_DATE('2023-08-04','yyyy-mm-dd'));

INSERT INTO TEST_DATE VALUES(TO_DATE('08-05-2023', 'mm-dd-yyyy'));

--to_date ������� �ʾ��� �� error : �Լ�ȣ���ϴ� ��쿡��
--to_char�Լ��� ù��° �Ű������� date�� ����Ǿ��ִ�.
SELECT TO_CHAR ( '2023-08-24', 'mm-dd-yyyy')
FROM DUAL;

--���ڿ��� ��¥������ �����ؾ��Ѵ�. to_date���.
SELECT TO_CHAR ( TO_DATE('2023-08-05','yyyy-mm-dd'), 'dd-mm-yyyy' )
FROM DUAL;


--���ں�ȯ
SELECT '8'+'3' , TO_NUMBER('8') + TO_NUMBER('3')
FROM DUAL;


