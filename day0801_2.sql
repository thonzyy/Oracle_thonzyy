--alias 사용

--사원 테이블에서 사원번호, 사원명, 직무, 부서번호 검색
-- 단. 사원번호는 emp_no로 사원명은 emp_name, 부서번호는 dept_no
--로 출력

select empno as emp_no , ename emp_name , job  , deptno dept_no
--alisas를 사용하면 컬럼명을 바꿔줄 수있다.
from EMP;

---------------------------연산자-------------------------------
--문자열 붙임 : ||
--사원테이블에서 사원명, 연봉을 조회
--단, 출력 xxx님의 연봉은 xxx입니다.

select ename ||'님의 연봉은'|| sal ||'입니다.' "OutPut"
from emp;

select  empno||ename||sal||mgr
from emp;

--산술 : +, -, * , /

--사원 테이블에서 사원 번호, 사원명, 연봉을 조회하세요.
--단, 사원번호는 현재 번호에서 1증가한 값으로 조회할 것
select empno , empno+1 increment_num , ename , sal
from emp;

--사원테이블에서 사원번호, 사원명, 매니저번호, 연봉, 세금 조회
--단, 세금은 연봉의 3.3%로 연산한 값을 출력한다.

select  empno, ename, mgr, sal , sal*0.033 tax
from emp;

--null 은 연산하면 결과가 null이 나온다.
-- 사원테이블에서 사원명, 연봉, 보너스 , 총수력액을 조회
-- 단, 총수령액은 연봉과 보너스를 합산한 금액

select  ename, sal, comm , sal+comm total_income
from emp;

--사원테이블에서 사원번호, 매니저번호, 사원명, 연봉, 월급을 조회하세요
-- 단, 월급은 연봉을 12

select empno, mgr , ename, sal, sal/12 monthly_income
from emp;



--나눈 나머지는 mod함수를 사용하여 연산한다.

--사용법 ) mod ( 컬럼명, 나눌값)
--사원 테이블에서 사원번호, 사원번호를 2로 나눈 나머지를 조회하세요
select  empno , mod (empno, 2)
from emp;

--산술 연산자가 아닌 다른 연산자를 조회 컬럼에 사용하면 error
select sal > 2000
from emp;

--관계연산자
--사원테이블에서 사원번호가 7844인  사원의 사원번호, 사원명,
-- 직무, 연봉, 입사일 검색.

select empno, ename , job, sal, hiredate
from emp
where empno=7844;
--사원테이블에서 연봉이 1250을 초과하는  사원의 사원번호, 사원명,
-- 연봉, 입사일 부서번호 , 보너스 검색.

select empno, ename , sal, hiredate, deptno , comm
from emp
where sal >= 1250;

--사원테이블에서 연봉이 1250을 초과하는  사원의 사원번호, 사원명,
-- 연봉, 입사일 부서번호 , 보너스 검색

select empno, ename, sal, hiredate, comm
from emp
where sal < 3000;

--사원테이블에서 10번 부서가 아닌 모든 부서사원의
--부서번호, 사원번호, 사원명, 연봉을 조회
select deptno, empno, ename, sal
from emp
where deptno <>10;
--where deptno !=10;

--사원테이블에서 연봉 2450~3000 사이인 모든 사원의
--사원 번호 ,사원명, 연봉, 매니저번호, 입사일을 조회

select empno, ename, sal , mgr, hiredate
from emp
where sal between 2450 and 3000;

-- between은 작은 값이 먼저 나와야한다.
select empno, ename, sal , mgr, hiredate
from emp
where sal between 3000 and 2450;

select empno, ename, sal , mgr, hiredate
from emp
where sal <= 3000 and sal >= 2450;

--사원테이블에서 사원 번호가 7521, 7566, 7788인 사원들의
-- 사원번호, 사원명,직무, 연봉을 조회

select empno, ename, job, sal
from emp
where empno=7521 or empno=7566 or empno=7788;
--or대신 in을 사용할 수 있다.
select empno, ename, job, sal
from emp
where empno in (7521,7566,7788);

--사원테이블에서 사원명이 KING,ADAMS,FORD인 사원의 사원번호
--사원명, 입사일, 연봉을 조회하세요.
--단, 사원명 [xxxx] 입사 정보[날짜]  연봉[xxxx]형식으로 조회
select '사원명 ['||ename||'] 입사정보 ['||hiredate||'] 연봉 ['||sal||']'  coworker_info
from emp
where ename in ('KING','ADAMS','FORD');

--사원테이블에서 보너스를 수령하지 않는 사원의
--사원번호 , 연봉, 보너스 ,입사일 조회

select empno, sal, comm, hiredate
from emp
where comm is null;

--문자열 연산자
create table test_like (
name varchar2(30),
addr varchar2(300)
);

insert into test_like(name,addr)values('강다연','서울시 강남구 역삼동');
insert into test_like(name,addr)values('김다영','서울시 동대문구 동대문동');
insert into test_like(name,addr)values('홍찬영','경기도 수원시 영통구 영통동');
insert into test_like(name,addr)values('홍홍찬영','서울시 강남구 개포동');
insert into test_like(name,addr)values('송지하','경기도 수원시  수원동');
insert into test_like(name,addr)values('김선경','마계인천시 부평구 대포동');
commit;

--강남구에 살고 있는 사람을 검색
--like는 특수문자와 함께 사용되지 않으면 = 과 같은 검색을 한다.

select name, addr
from test_like
where name like '김선경'; -- = 과 같다. =을 쓰는 게 나음.
select * from test_like;


--test_like 테이블에서 서울시에 살고 있는 사람들의 이름과 주소를 검색하세요.
select name, addr
from test_like
where addr like '서울시%';
-- test_like 테이블에서 '대포동'에 살고 있는 사람들의 이름과 주소를 조회
select name,addr
from test_like
where addr like '%대포동';

select name,addr
from test_like
where addr like '%수원시%';

--사원 테이블에서 사원명에 'A'가 포함된 사원들의 사원번호, 사원명
--입사일 조회

select empno, ename, hiredate
from emp
where ename like '%A%';

--사원 테이블에서 사원명이 'L'이 두개 포함된 사원들의 번호, 사원명
--입사일 조회

select empno, ename, hiredate
from emp
where ename like '%L%L%';


--_의 사용
-- test_like 테이블에서 이름이 4글자인 사람을 검색

select name, addr
from test_like
where name like '____';

--이름이 3자이면서 '영'으로 끝나는 이름 검색
select name  ,addr
from test_like
where name like '__영';

--사원 테이블에서 사원명의 끝 문자의 전문자가 'E'인 사원들의
--사원명 검색
select ename
from emp
where ename like '%E_' ;

--한 번의 많은 양의 레코드를 INSERT


