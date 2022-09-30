-- 테이블에서 데이터 검색
--(1) projectrion : 테이블에서 원하는 컬럼들을 선택.
--(2) selection : 테이블에서 조건을 만족하는 레코드(행, row)들을 검색.
-- select 컬럼, ... from 테이블 where 조건식 order by 정렬컬럼 asc/desc;
-- 비교 연산자 : =, !=, >, >=, <, <=, is null, is not null, ... 
-- 논리 연산자 : and, or, not

select * from emp;
-- 직원 테이블에서 10번 부서에 근무하는 직원들의 부서번호, 사번, 이름을 출력.
select deptno, empno, ename from emp where deptno=10;

-- 직원 테이블에서 수당(comm) 이 null 이 아닌 직원들의 사번, 이름, 수당을 검색.
-- 출력 순서는 이름의 오름차순 정렬
select empno, ename,comm from emp where comm is not null order by ename;

-- 직원 테이블에서 급여(sal)가 2000 이상인 직원들의 이름과 급여를 검색
-- 출력 순서는 급여의 내림차순으로 정렬해서
select ename, sal from emp where sal>=2000 order by sal desc;

-- 직원 테이블에서 급여가 2000 이상 3000 이하인 직원들의 사번, 이름, 직책, 급여를 검색.
-- 급여의 내림차순 출력
select empno, ename, job, sal from emp where sal between 2000 and 3000 order by sal desc;

-- 직원 테이블에서 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 검색.
-- 출력 순서는 (1) 부서 번호, (2) 이름 오름차순 정렬.
select deptno, ename, sal from emp where deptno=10 or deptno=20 order by deptno ,ename;

-- or을 간단하게 in을 사용가능.
select deptno, ename, sal from emp where deptno in(10,20) order by deptno ,ename; 

-- 직원 테이블에서 직무가 'CLERK'인 직원들의 직무, 이름, 급여를 출력.
-- 이름 오름차순 순서로 출력
select job, ename, sal 
from emp
where job='CLERK'
order by ename;

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
where not job in ('CLERK', 'ANALYST','MANAGER')
order by empno;


