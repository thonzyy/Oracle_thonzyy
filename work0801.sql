
--1��
select empno, ename, hiredate, deptno, sal
from emp
where deptno<>10 or sal between 1000 and 3000;
--2��
select empno, ename, sal, comm, sal+comm total, sal/12 montly_income
from emp
where comm is not null;
--3
select empno||'�� '||ename||'�����  ������'||sal||'$�Դϴ�.' output
from emp
where deptno in (10,30);
--4
select empno, ename, hiredate, sal, job, deptno
from emp
where sal < 3000;

--5
create table test_like2(
	num number(1),
	name varchar2(12),
	addr varchar2(60),
	high_school varchar2(9)

);
--6��
insert into test_like2(num,name,addr,high_school)values(1,'��������','����� ���۱� �󵵵�', '�����' );
insert into test_like2(num,name,addr,high_school)values(2, '���븸','��⵵ ��õ�� ���̱�','��Ÿ��');
insert into test_like2(num,name,addr,high_school)values(3, '���¼�','����� ���빮�� ���빮2��','�����');
insert into test_like2(num,name,addr,high_school)values(4,'�ڻ���','����� ���۱� �󵵵�','������');
insert into test_like2(num,name,addr,high_school)values(5,'�̵���','����� ���۱� ���빮4��','������' );
select * from test_like2;
commit;

select '��ȣ: '||num||', �̸� '||name||', �ּ� '||addr||', �б� '||high_school "OutPut"
from test_like2
where addr like '�����%' and name like '___';

--7��
select empno,ename,sal,hiredate
from emp
where ename like '____'and sal>=3000;

--8
select empno,ename,hiredate,sal, sal*1.07 next_year_sal
from emp;

--9
select ename, sal, job, mgr, hiredate
from emp
where ename like 'A%' and sal >= 1600;

select * from emp;
