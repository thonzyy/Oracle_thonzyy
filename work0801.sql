
--1번
select empno, ename, hiredate, deptno, sal
from emp
where deptno<>10 or sal between 1000 and 3000;
--2번
select empno, ename, sal, comm, sal+comm total, sal/12 montly_income
from emp
where comm is not null;
--3
select empno||'번 '||ename||'사원님  연봉은'||sal||'$입니다.' output
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
--6번
insert into test_like2(num,name,addr,high_school)values(1,'기임줌인','서울시 동작구 상도동', '정기고' );
insert into test_like2(num,name,addr,high_school)values(2, '정대만','경기도 부천시 원미구','썸타고');
insert into test_like2(num,name,addr,high_school)values(3, '송태섭','서울시 동대문구 동대문2동','정기고');
insert into test_like2(num,name,addr,high_school)values(4,'박상준','서울시 동작구 상도동','오지고');
insert into test_like2(num,name,addr,high_school)values(5,'이동원','서울시 동작구 동대문4동','지리고' );
select * from test_like2;
commit;

select '번호: '||num||', 이름 '||name||', 주소 '||addr||', 학교 '||high_school "OutPut"
from test_like2
where addr like '서울시%' and name like '___';

--7번
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
