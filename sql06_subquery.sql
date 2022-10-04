-- Sub Query : query 문의 일부로 또다른 query문이 사용되는 것.

-- 전체 직원의 급여 평균보다 더 많은 급여를 받는 직원들의 레코드 (모든 정보) 를 검색.
-- (1) 전체 직원의 급여 평균을 검색 :
select avg(sal) from emp;
-- (2) (1)에서 찾은 급여 평균보다 더 많은 급여를 받는 직원을 검색.
select *
from emp
where sal > (1);

-- 위의 (1),(2)을 한 문장으로 --> Sub Query
select * from emp
where sal > (select avg(sal) from emp);


-- Ex. ALLEN보다 적은 급여를 받는 직원들의 사번, 이름, 급여를 검색
select empno, ename, sal
from emp
where sal<(select sal from emp where ename='ALLEN');

-- Ex. ALLEN과 같은 직책의 직원들의 사번, 이름, 부서번호, 직책, 급여를 검색
select empno,ename,deptno,job,sal
from emp
where job = (select job from emp where ename='ALLEN');


-- Ex. SALESMAN의 급여 최댓값보다 더 많은 급여를 받는 직원들의 사번, 이름, 급여, 직책을 검색
select empno,ename, sal, job
from emp
where sal>(select max(sal) from emp where job='SALESMAN');

-- Ex. 연봉 = sal * 12 + comm. 만약 comm이 null이면 0으로 계산.
-- WARD의 연봉보다 더 많은 연봉을 받는 직원들의 사번, 이름, 급여, 수당, 연봉을 검색.
-- 연봉 내림차순으로 출력.
select empno,ename,sal,nvl(comm,0) as "수당" ,sal * 12 + nvl(comm,0) as "연봉"
from emp
where sal * 12 + nvl(comm,0)>(select sal * 12 + nvl(comm,0) from emp where ename='WARD')
order by 연봉 desc;


