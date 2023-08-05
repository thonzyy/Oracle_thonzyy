-- ��� ���̺��� ������ 1500~3000������ �����
--�����ȣ, �����, ����, �Ի���, �μ���ȣ, ����, �Ŵ�����ȣ�� ��ȸ�� ���ڵ带 ����Ͽ�
--  emp_work���̺��� �����ϰ� �߰��մϴ�.
 ;
CREATE TABLE EMP_WORK AS (  SELECT EMPNO, ENAME , SAL , HIREDATE,DEPTNO, JOB ,MGR
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000 ) ;


SELECT * FROM EMP_WORK
ORDER BY EMPNO DESC;



--   emp���̺��� 10�� 30�� �μ��� ��� ������ ��ȸ�Ͽ� emp_work���̺�
--  ��ȸ ����� �߰��մϴ�.
--   ��, �����ȣ�� ��ȸ�� �����ȣ�� 1000�� ���� ������ �߰��� ��.
--      ���� data 7788 -> insert 8788

 INSERT INTO EMP_WORK (
SELECT EMPNO+1000 EMPNO, ENAME , SAL ,HIREDATE,DEPTNO , JOB, MGR
FROM EMP
WHERE DEPTNO IN ( 10,30));
COMMIT;

-- emp_work ���̺��� 10�� �μ��� �ٹ��ϴ� ������� ������  emp���̺���
--  �����ȣ�� 7698�� ��� ������ 7782�� ����� ������ ���� �ݾ����� �����ϼ���.

UPDATE EMP_WORK
SET SAL = (SELECT SAL FROM EMP WHERE EMPNO = 7782) + (SELECT SAL FROM EMP WHERE EMPNO = 7698)
WHERE DEPTNO = 10;


--����4. emp_work ���̺� �Ʒ��� ���� ���ڵ带 �߰��ϼ���.
--�����ȣ : emp_work�� ���� ������ �����ȣ���� 1 ������ ��ȣ, ����� : �輱��, ���� : ������,
--  �Ի��� : �߰��Ǵ� ������ ������

INSERT INTO EMP_WORK (EMPNO, ENAME, JOB, HIREDATE ) VALUES ((SELECT EMPNO FROM EMP_WORK WHERE ENAME = 'MILLER')+1,'�輱��','������',SYSDATE+1 );
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

--����5.�Ʒ��� ���� ���ڵ带 ������ �� �ִ�  sales���̺��� �����ϰ� ���ڵ带 �߰��ϼ���.
-- ��ȣ : 1, ��ǰ�� : Ű����, ���� : 20000, �Ǹ��� : ��2023-08-25��, ���� : 1
-- ��ȣ : 2, ��ǰ�� : ���콺, ���� : 27000, �Ǹ��� : ��2023-08-25��, ���� : 1
-- ��ȣ : 3, ��ǰ�� : �����, ���� : 350000, �Ǹ��� : ��2023-08-25��, ���� : 1
-- ��ȣ : 4, ��ǰ�� : Ű��  ��, ���� : 23000, �Ǹ��� : ��2023-08-25��, ���� : 1
-- ��ȣ : 5, ��ǰ�� : Ű����, ���� : 15000, �Ǹ��� : ��2023-08-25��, ���� : 1
-- ��ȣ : 6, ��ǰ�� : Ű����, ���� : 20000, �Ǹ��� : ��2023-08-26��, ���� : 1
-- ��ȣ : 7, ��ǰ�� : ���콺, ���� : 13000, �Ǹ��� : ��2023-08-26��, ���� : 1
-- ��ȣ : 8, ��ǰ�� : Ű����, ���� : 22000, �Ǹ��� : ��2023-08-26��, ���� : 1

INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 1, 'Ű����', 20000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 2, '���콺', 27000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 3, '�����', 35000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 4, 'Ű����', 23000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 5, 'Ű����', 15000, '2023-08-25', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 6, 'Ű����', 20000, '2023-08-26', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 7, '���콺', 13000, '2023-08-26', 1);
INSERT INTO SALES ( NUM, ITEM_NAME, PRICE, SELL_DATE, QUANTITY) VALUES ( 8, 'Ű����', 22000, '2023-08-26', 1);
COMMIT;



--���� 6. ��ǰ��, �Ѱ���, �ǸŰǼ�, �Ǹ���, �Է��� �� ������ �� �ִ�  sales_adjustment ���̺��� �����ϼ���.

--����7. sales ���̺��� ��2023-08-25�� �� �Ǹŵ� ��ǰ�� ��ǰ��, �Ѱ���, �ǸŰǼ� ��  sales_adjustment
--    ���̺� �߰��ϼ���. -����
--   �߰�   ��)
--     Ű����, 58000, 3, 2023-08-25, ����
 --    ���콺 , 27000,1,  ���͵���
 --    �����, 350000,1, ���͵���

CREATE TABLE SALES_ADJUSTMENT (


 ITEM_NAME CHAR(9),
 TOTAL_PRICE NUMBER(8),
 SELL_NUM NUMBER(3),
 SELL_DATE DATE,
 INPUT_DATE DATE

);

;





INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM,SELL_DATE, INPUT_DATE)VALUES ((SELECT DISTINCT ITEM_NAME FROM SALES WHERE ITEM_NAME LIKE ('Ű����')),
 (SELECT SUM(PRICE) FROM SALES WHERE ITEM_NAME LIKE ('Ű����') AND TO_CHAR( SELL_DATE, 'YYYY-MM-DD')='2023-08-25' GROUP BY SELL_DATE)
 ,(SELECT SUM(QUANTITY) FROM SALES WHERE ITEM_NAME LIKE ('Ű����') AND  TO_CHAR (SELL_DATE, 'YYYY-MM-DD') ='2023-08-25' GROUP BY ITEM_NAME)
, TO_DATE('2023-08-25', 'YYYY-MM-DD'), SYSDATE );
INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM,SELL_DATE, INPUT_DATE)VALUES ((SELECT DISTINCT ITEM_NAME FROM SALES WHERE ITEM_NAME LIKE ('Ű����')),
 (SELECT SUM(PRICE) FROM SALES WHERE ITEM_NAME LIKE ('Ű����') AND TO_CHAR( SELL_DATE, 'YYYY-MM-DD')='2023-08-25' GROUP BY SELL_DATE)
 ,(SELECT SUM(QUANTITY) FROM SALES WHERE ITEM_NAME LIKE ('Ű����') AND  TO_CHAR (SELL_DATE, 'YYYY-MM-DD') ='2023-08-25' GROUP BY ITEM_NAME)
, TO_DATE('2023-08-25', 'YYYY-MM-DD'), SYSDATE );



INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM, SELL_DATE, INPUT_DATE)
(SELECT ITEM_NAME , PRICE , QUANTITY, SELL_DATE ,SYSDATE
FROM SALES
WHERE ITEM_NAME LIKE '���콺' AND TO_CHAR(SELL_DATE,'YYYY-MM-DD') = '2023-08-25') ;

INSERT INTO SALES_ADJUSTMENT (ITEM_NAME, TOTAL_PRICE, SELL_NUM, SELL_DATE, INPUT_DATE )
(SELECT ITEM_NAME, PRICE, QUANTITY, SELL_DATE ,SYSDATE
FROM SALES
WHERE ITEM_NAME = '�����'AND SELL_DATE = TO_DATE( '2023-08-25', 'YYYY-MM-DD'));
COMMIT;

SELECT * FROM SALES_ADJUSTMENT ;



SELECT * FROM SALES;
 SELECT  SUM(PRICE),SUM(NUM) ,SYSDATE  FROM SALES WHERE ITEM_NAME = 'Ű����'  GROUP BY ITEM_NAME;
