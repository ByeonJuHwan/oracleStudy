-- 테이블에서 데이터 검색
--(1) projectrion : 테이블에서 원하는 컬럼들을 선택.
--(2) selection : 테이블에서 조건을 만족하는 레코드(행, row)들을 검색.
-- select 컬럼, ... from 테이블 where 조건식 order by 정렬컬럼 asc/desc;
-- 비교 연산자 : =, !=, >, >=, <, <=, is null, is not null, ... 
-- 논리 연산자 : and, or, not

select * from emp;
-- 직원 테이블에서 10번 부서에 근무하는 직원들의 부서번호, 사번, 이름을 출력.
select deptno, empno, ename 
from emp 
where deptno=10;

-- 직원 테이블에서 수당(comm) 이 null 이 아닌 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순 정렬
select empno, ename,comm 
from emp 
where comm is not null 
order by ename;

-- 직원 테이블에서 급여(sal)가 2000 이상인 직원들의 이름과 급여를 검색
-- 출력 순서는 급여의 내림차순으로 정렬해서
select ename, sal 
from emp 
where sal>=2000 
order by sal desc;

-- 직원 테이블에서 급여가 2000 이상 3000 이하인 직원들의 사번, 이름, 직책, 급여를 검색.
-- 급여의 내림차순 출력
select empno, ename, job, sal 
from emp 
where sal between 2000 and 3000 
order by sal desc;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 검색.
-- 출력 순서는 (1) 부서 번호, (2) 이름 오름차순 정렬.
select deptno, ename, sal 
from emp 
where deptno=10 or deptno=20 
order by deptno ,ename;

-- or을 간단하게 in을 사용가능.
select deptno, ename, sal 
from emp 
where deptno in(10,20) 
order by deptno ,ename; 

-- 직원 테이블에서 직무가 'CLERK'인 직원들의 직무, 이름, 급여를 출력.
-- 이름 오름차순 순서로 출력
select job, ename, sal 
from emp
where job='CLERK'
order by ename;
-- SQL에서는 문자열 비교에서도 =,!= 사용.
-- 테이블에 저장된 데이터는 대/소문자를 구분. 
-- 문자열은 작은따옴표('')를 사용.

-- 직원 테이블에서 직무가 CLERK 또는 MANAGER인 직원들의 직무, 이름, 급여를 검색.
-- 출력 순서 (1) 직무 (2) 급여 오름차순 정렬.
select job, ename, sal
from emp
where job in('CLERK', 'MANAGER')
order by job, sal;

-- 직원 테이블에서 20번 부서에서 근무하는 CLERK의 모든 정보를 검색
select * 
from emp 
where deptno = 20 and job='CLERK';

-- 직원 테이블에서 20번 부서에서 근무하거나 또는 직무가 CLERK인 직원들의 모든 정보를 검색
select *
from emp
where deptno = 20 or job='CLERK';

-- 직원 테이블에서 CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름, 직무, 급여를 검색
-- 사번 오름차순 정렬.
select empno, ename, job, sal
from emp
where job not in ('CLERK', 'ANALYST','MANAGER')
order by empno; 

select empno, ename, job, sal
from emp
where job != 'CLERK' and job !='ANALYST' and job != 'MANAGER'
order by empno;

select empno, ename, job, sal
from emp
where not (job ='CLERK' or job = 'ANALYST'or job ='MANAGER')
order by empno;

-- 숫자뿐만 아니라 문자열(varchar2), 날짜(date, timestamp) 타입들도 대소 비교가 가능.

-- 직원 테이블의 모든 레코드를 입사일의 오름차순으로 출력.
select * 
from emp 
order by hiredate;


-- '1987/01/01' 을 포함해서 그 이후에 입사한 사원들의 레코드(모든 컬럼)을 검새.
-- 입사일 오름차순으로 출력.
select * 
from emp 
where hiredate>= '1987/01/01' -- 문자열 타입과 날짜 타입을 같은 타입으로 변환 후에 대소 비교가 이루어짐.
order by hiredate;

-- 특정 문자열로 시작하거나, 특정 문자열이 포함된 값을 찾는 query.
-- 'A'로 시작하는 이름을 갖는 직원들의 이름을 오름차순으로 출력.
select ename
from emp
where ename like 'A%' -- A로 시작하고, 그 뒤에는 글자수 제한이 없음.
order by ename;

select ename
from emp
where ename like 'A_'; -- A로 시작하고, 그 뒤에 한 글자만 더 있는 문자열.

-- 30번 부서에서 근무하는 직무가 'SALES'로 시작하는 직원들의
-- 사번,이름 급여, 부서번호, 직무를 검색.
-- 사번 오름차순으로 정렬.
select empno,ename,sal,deptno,job
from emp
where deptno=30 and job like 'SALES%'
order by empno;

-- 20번, 30번 부서에서 근무하고 급여가 2000을 초과하는 직원들의
-- 사번, 부서번호, 이름, 급여를 검색
-- (1) 부서번호, (2) 사번 오름차순 정렬.
select empno, deptno, ename, sal
from emp
where deptno in(20,30) and sal>2000
order by deptno , empno;

-- 수당이 null이고, 매니저가 있고, 직무가 'MANAGER' 또는 'CLERK'인 직원들의
-- 모든 컬럼을 검색. 사번 오름차순 출력.
select *
from emp
where (comm is null) and (mgr is not null) and job in ('MANAGER' , 'CLERK')
order by empno;

