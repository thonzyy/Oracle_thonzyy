
--1.��� ���̺��� �����ȣ,�����, �Ի���, ������ ��ȸ�ϼ���.
  --��, ������ ��ü 8�ڸ��� �Ͽ� $�� �ٿ� ����ϰ�, ������ ������������ �����Ͽ� ����ϼ���
    --  ��) $00001250

SELECT EMPNO, ENAME, HIREDATE, '$'||LPAD(SAL,8,0) SAL1

FROM EMP
ORDER BY SAL1 DESC;
--2.��� ���̺��� ������ MANAGER, SALESMAN, CLERK�� �����
   --�����ȣ, �����, ����, �Ի���, ����, ���ʽ�, �Ǽ��ɾ��� ��ȸ�ϼ���.
-- ��, ������� ù���ڸ� �빮�ڷ� ����� ��.
 --    �Ǽ��ɾ��� ������ ���ʽ��� �ջ��� �ݾ׿��� 3.3%�� �� �ݾ����� �����ϵ�
 --    �������� �ݿø��Ͽ� ����� ��.

 SELECT EMPNO EMP_NUM, INITCAP(ENAME) NAME, JOB, HIREDATE, SAL, NVL(COMM,0) COMM1, ROUND((SAL+NVL(COMM,0) - ((SAL+NVL(COMM,0))*0.033)),0) TOTAL_INCOME
FROM EMP
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');


--3. car_model ���̺��� ���� k5, �ƹ���, a8�̰ų� �ɼǿ� ��ABS���� �ִ� ��
--    ������ ����, ����, �ɼ�,�̹����� ��ȸ�ϼ���.
--   ��. �𵨸��� �ҹ��ڷ� ����� ��.
--       car_option�� �ι�° , ������ ����� ��
--       �̹����� ��� �ҹ��ڷ� ����� ��.
--       ������ ������������ �����ϵ� ������ ���ٸ�, �𵨸��� ������������ �����Ұ�

SELECT * FROM CAR_MODEL;

SELECT LOWER(MODEL) MODEL1, PRICE, CAR_YEAR, SUBSTR( CAR_OPTION, 1, INSTR(CAR_OPTION, ',' , 1, 2 )-1) CAR_OPTION,LOWER(CAR_IMG)
FROM CAR_MODEL
WHERE MODEL IN ('K5', '�ƹ���', 'A8' ) OR INSTR(CAR_OPTION, 'ABS')!=0
ORDER BY PRICE DESC, MODEL DESC;


