--alias ���

--��� ���̺��� �����ȣ, �����, ����, �μ���ȣ �˻�
-- ��. �����ȣ�� emp_no�� ������� emp_name, �μ���ȣ�� dept_no
--�� ���

select empno as emp_no , ename emp_name , job  , deptno dept_no
--alisas�� ����ϸ� �÷����� �ٲ��� ���ִ�.
from EMP;

---------------------------������-------------------------------
--���ڿ� ���� : ||
--������̺��� �����, ������ ��ȸ
--��, ��� xxx���� ������ xxx�Դϴ�.

select ename ||'���� ������'|| sal ||'�Դϴ�.' "OutPut"
from emp;

select  empno||ename||sal||mgr
from emp;

--��� : +, -, * , /

--��� ���̺��� ��� ��ȣ, �����, ������ ��ȸ�ϼ���.
--��, �����ȣ�� ���� ��ȣ���� 1������ ������ ��ȸ�� ��
select empno , empno+1 increment_num , ename , sal
from emp;

--������̺��� �����ȣ, �����, �Ŵ�����ȣ, ����, ���� ��ȸ
--��, ������ ������ 3.3%�� ������ ���� ����Ѵ�.

select  empno, ename, mgr, sal , sal*0.033 tax
from emp;

--null �� �����ϸ� ����� null�� ���´�.
-- ������̺��� �����, ����, ���ʽ� , �Ѽ��¾��� ��ȸ
-- ��, �Ѽ��ɾ��� ������ ���ʽ��� �ջ��� �ݾ�

select  ename, sal, comm , sal+comm total_income
from emp;

--������̺��� �����ȣ, �Ŵ�����ȣ, �����, ����, ������ ��ȸ�ϼ���
-- ��, ������ ������ 12

select empno, mgr , ename, sal, sal/12 monthly_income
from emp;



--���� �������� mod�Լ��� ����Ͽ� �����Ѵ�.

--���� ) mod ( �÷���, ������)
--��� ���̺��� �����ȣ, �����ȣ�� 2�� ���� �������� ��ȸ�ϼ���
select  empno , mod (empno, 2)
from emp;

--��� �����ڰ� �ƴ� �ٸ� �����ڸ� ��ȸ �÷��� ����ϸ� error
select sal > 2000
from emp;

--���迬����
--������̺��� �����ȣ�� 7844��  ����� �����ȣ, �����,
-- ����, ����, �Ի��� �˻�.

select empno, ename , job, sal, hiredate
from emp
where empno=7844;
--������̺��� ������ 1250�� �ʰ��ϴ�  ����� �����ȣ, �����,
-- ����, �Ի��� �μ���ȣ , ���ʽ� �˻�.

select empno, ename , sal, hiredate, deptno , comm
from emp
where sal >= 1250;

--������̺��� ������ 1250�� �ʰ��ϴ�  ����� �����ȣ, �����,
-- ����, �Ի��� �μ���ȣ , ���ʽ� �˻�

select empno, ename, sal, hiredate, comm
from emp
where sal < 3000;

--������̺��� 10�� �μ��� �ƴ� ��� �μ������
--�μ���ȣ, �����ȣ, �����, ������ ��ȸ
select deptno, empno, ename, sal
from emp
where deptno <>10;
--where deptno !=10;

--������̺��� ���� 2450~3000 ������ ��� �����
--��� ��ȣ ,�����, ����, �Ŵ�����ȣ, �Ի����� ��ȸ

select empno, ename, sal , mgr, hiredate
from emp
where sal between 2450 and 3000;

-- between�� ���� ���� ���� ���;��Ѵ�.
select empno, ename, sal , mgr, hiredate
from emp
where sal between 3000 and 2450;

select empno, ename, sal , mgr, hiredate
from emp
where sal <= 3000 and sal >= 2450;

--������̺��� ��� ��ȣ�� 7521, 7566, 7788�� �������
-- �����ȣ, �����,����, ������ ��ȸ

select empno, ename, job, sal
from emp
where empno=7521 or empno=7566 or empno=7788;
--or��� in�� ����� �� �ִ�.
select empno, ename, job, sal
from emp
where empno in (7521,7566,7788);

--������̺��� ������� KING,ADAMS,FORD�� ����� �����ȣ
--�����, �Ի���, ������ ��ȸ�ϼ���.
--��, ����� [xxxx] �Ի� ����[��¥]  ����[xxxx]�������� ��ȸ
select '����� ['||ename||'] �Ի����� ['||hiredate||'] ���� ['||sal||']'  coworker_info
from emp
where ename in ('KING','ADAMS','FORD');

--������̺��� ���ʽ��� �������� �ʴ� �����
--�����ȣ , ����, ���ʽ� ,�Ի��� ��ȸ

select empno, sal, comm, hiredate
from emp
where comm is null;

--���ڿ� ������
create table test_like (
name varchar2(30),
addr varchar2(300)
);

insert into test_like(name,addr)values('���ٿ�','����� ������ ���ﵿ');
insert into test_like(name,addr)values('��ٿ�','����� ���빮�� ���빮��');
insert into test_like(name,addr)values('ȫ����','��⵵ ������ ���뱸 ���뵿');
insert into test_like(name,addr)values('ȫȫ����','����� ������ ������');
insert into test_like(name,addr)values('������','��⵵ ������  ������');
insert into test_like(name,addr)values('�輱��','������õ�� ���� ������');
commit;

--�������� ��� �ִ� ����� �˻�
--like�� Ư�����ڿ� �Բ� ������ ������ = �� ���� �˻��� �Ѵ�.

select name, addr
from test_like
where name like '�輱��'; -- = �� ����. =�� ���� �� ����.
select * from test_like;


--test_like ���̺��� ����ÿ� ��� �ִ� ������� �̸��� �ּҸ� �˻��ϼ���.
select name, addr
from test_like
where addr like '�����%';
-- test_like ���̺��� '������'�� ��� �ִ� ������� �̸��� �ּҸ� ��ȸ
select name,addr
from test_like
where addr like '%������';

select name,addr
from test_like
where addr like '%������%';

--��� ���̺��� ����� 'A'�� ���Ե� ������� �����ȣ, �����
--�Ի��� ��ȸ

select empno, ename, hiredate
from emp
where ename like '%A%';

--��� ���̺��� ������� 'L'�� �ΰ� ���Ե� ������� ��ȣ, �����
--�Ի��� ��ȸ

select empno, ename, hiredate
from emp
where ename like '%L%L%';


--_�� ���
-- test_like ���̺��� �̸��� 4������ ����� �˻�

select name, addr
from test_like
where name like '____';

--�̸��� 3���̸鼭 '��'���� ������ �̸� �˻�
select name  ,addr
from test_like
where name like '__��';

--��� ���̺��� ������� �� ������ �����ڰ� 'E'�� �������
--����� �˻�
select ename
from emp
where ename like '%E_' ;

--�� ���� ���� ���� ���ڵ带 INSERT


