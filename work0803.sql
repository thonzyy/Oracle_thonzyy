

--1. ������̺��� �����ȣ, �����,����, �Ŵ�����ȣ,����,
--   �Ի����� ��ȸ�ϼ���.
-- ��, �Ի����� ����-��-�� ���ϡ��� �������� ����ϼ���.
--    ������ 3�ڸ����� ,�� �־� ����ϼ���

SELECT EMPNO ,ENAME ,JOB ,MGR , SAL , TO_CHAR(HIREDATE,  'mm-dd-yyyy day')
FROM EMP;

--2. ������̺��� �μ���ȣ, �����ȣ, ����, ���ʽ�, �Ѽ��ɾ�, �Ǽ��ɾ�, ����
--�Ի����� ��ȸ�ϼ���.
--   ��. �� ���ɾ��� '����+���ʽ�'�� �ջ��� �ݾ����� ��ȸ�ϼ���.
--       �� ���ɾ��� ������+���ʽ��� �ջ��� �ݾ׿��� 3.3%�� ������ �ݾס����� ��ȸ,
--     ������ ������ 12�� ���� ���� ������ �����Ͽ� ��ȸ�ϼ���.

SELECT DEPTNO, EMPNO, SAL, TRUNC(SAL/12) MONTH_INCOME, NVL2(COMM,COMM,0) COMM, (SAL+NVL2(COMM,COMM,0)) TOTAL_INCOME ,
   (SAL+NVL2(COMM,COMM,0))-((SAL+NVL2(COMM,COMM,0))*0.033) REAL_INCOME
FROM EMP;

--3. �Ʒ��� �����͸� �����Ͽ� test1 ���̺��� �����ϰ�  ���ڵ带 �߰��� ��.
--   �÷��� : �̸�, ����, �¾��, �ֹι�ȣ
--     ���ٿ�,25,1995,��950101-2234567��
--     ��ٿ�,25,1995,��951126-1234567��
--     �輱��,26,1994,��940101-2234567��
--     ���ο�,26,1994,��940101-1234567��
--     ���ֹ�,27,1993,��930101-5234567��

CREATE TABLE TEST1(
	NAME CHAR(9),
	AGE NUMBER(2),
	BIRTH_YEAR NUMBER(4),
	IDENTIFIED_NUM CHAR(14)
);


INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('���ٿ�',25,1995,'950101-2234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('��ٿ�',25,1995,'951126-1234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('�輱��',26,1994,'940101-2234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('���ο�',26,1994,'940101-1234567');
INSERT INTO TEST1(NAME,AGE, BIRTH_YEAR, IDENTIFIED_NUM) VALUES('���ֹ�',27,1993,'930101-5234567');

COMMIT;

SELECT  SUBSTR( IDENTIFIED_NUM , 8 ,1)
FROM TEST1;


--4. test1 ���̺��� �̸� ,����, �¾ ��, �ֹι�ȣ,  ������ ��ȸ �ϼ���.
   --������ �ֹι�ȣ��  8��° �ڸ��� ���ϰ�,
   --8��° �ڸ��� 1,3�̸� '����', 2,4�� '����' 5,6,7,8�̸� '�ܱ���'�׷���
   --������ "����" �� ����Ѵ�

SELECT NAME, AGE, BIRTH_YEAR, IDENTIFIED_NUM,

                 --  	CASE SUBSTR( IDENTIFIED_NUM , 8 ,1)
----										      WHEN '1' THEN '����'
----			                    WHEN '3' THEN '����'
----			                    WHEN '2' THEN '����'
----			                    WHEN '4' THEN '����'
----			                    WHEN '5' THEN '�ܱ���'
----                          WHEN '6' THEN '�ܱ���'
----                          WHEN '7' THEN '�ܱ���'
----                          WHEN '8' THEN '�ܱ���'
----                          ELSE '����'
----                          END GENDER

CASE
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '1', '3') THEN '����'
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '2', '4') THEN '����'
WHEN SUBSTR( IDENTIFIED_NUM , 8 ,1) IN ( '5', '6','7','8') THEN '�ܱ���'
                    ELSE '����'
                    END GENDER
FROM TEST1;
--5.emp���̺��� ����Ͽ� �Ʒ��� ���� ��ȸ �ϼ���.
--  xxx�� Xxxx����� �Ի����� yyyy-mm-dd ���� �� �Դϴ�. ������ $xxx �Դϴ�.
-- ��. �Ի������ ��,ȭ,�� �Ի��� ����� ���ؼ��� ��ȸ�մϴ�.
--     ������� ù ���ڸ� �빮�ڷ� ��ȸ�ϰ�, �Ի����� �������� �����Ͽ� ����ϵ�
--     �Ի����� ���ٸ� ������ ������������ �����Ͽ� ����ϼ���.
--      ������ 3�ڸ����� ,�� �־ ����ϼ���.


SELECT EMPNO||'�� '||INITCAP(ENAME)||'����� �Ի����� '||TO_CHAR(HIREDATE, 'yyyy-mm-dd day')||' �� �Դϴ�. ������$'||TO_CHAR(SAL,'9,999') ||'�Դϴ�' INPUT
FROM EMP
WHERE TO_CHAR(HIREDATE, 'DY') IN ( '��','ȭ','��')
ORDER BY HIREDATE, SAL DESC;



SELECT DEPTNO,DNAME
FROM DEPT
WHERE LOC LIKE 'DALLAS';


