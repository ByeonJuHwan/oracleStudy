-- 오라클 함수(function)
--(1) 단일 행 함수 : 
--     행이(row)이 하나씩 함수의 argument로 전달되고, 행 마다 하나씩 결과가 리턴되는 함수
--(2) 다중 행 함수 (그룹 함수) : 
--     여러 개의 행(row)이 한꺼번에 함수의 argument로 전달되서, 하나의 결과가 리턴되는 함수.
--     (예) 통계 관련 함수들 : count, sum, avg, max, min, variance(분산), stddev(표준편차)
-- 단일 행 함수와 그룹 함수는 동시에 select 할 수 없다.!!

-- 단일 행 함수의 예:

-- 문자열을 소문자로 바꾸기
select lower(ename) from emp;

-- 날짜 타입 데이터를 원하는 문자열 포맷으로 출력하기
select hiredate, to_char(hiredate,'YYYY-MM-DD')
from emp;

-- nvl(컬럼, 값) : 컬럼의 값이 null이면 value를 리턴하고, null이 아니면 원래 값을 리턴.
-- nvl2(컬럼, value1, value2) : 컬럼이 null이 아니면 value1을 리턴하고, null이면 value2를 리턴.
select comm, nvl(comm,-1), nvl2(comm, comm,-1)
from emp;

-- 다중행 함수 (그룹 함수)
-- count(컬럼): null이 아닌 행의 개수를 리턴.
select count(empno), count(mgr), count(comm) 
from emp;

select count(*) from emp; -- 테이블의 행 개수

-- 통계 함수 : 합계, 평균, 최댓값, 최솟값, 분산, 표준편차
select sum(sal), avg(sal), max(sal),min(sal), VARIANCE(sal), stddev(sal)
from emp;

select * 
from emp
order by deptno;

-- 그룹별 통계
-- 부서(번호)별 급여의 최댓값.
select max(sal) from emp where deptno = 10;
select max(sal) from emp where deptno = 20;
select max(sal) from emp where deptno = 30;

select deptno,max(sal)
from emp
GROUP by deptno
order by deptno;

-- 부서별 급여 평균
select deptno, round(avg(sal),2)
from emp
group by deptno
order by deptno;

-- 아래의 모든 문제에서 소수점은 반올림해서 2자리까지 표시.
select * from emp;
-- Ex. 부서별 급여의 평균, 표준편차를 출력. 부서번호 오름차순 정렬.
select round(avg(sal),2),round(stddev(sal),2)
from emp
group by deptno
order by deptno;


-- Ex. 직무별 직원수, 급여의 최댓값, 최솟값, 평균 검색.
-- 직무 오름차순 정렬
select count(job),max(sal), min(sal), round(avg(sal),2)
from emp
order by job;

-- Ex. 부서별, 직무별 부서번호, 직무, 직원수, 급여 평균 검색
-- 정렬 순서는 (1) 부서 번호 (2) 직책 오름차순
select 

-- Ex. 입사연도별 사원수 검색. (힌트) to_char(날짜, 포맷) 이용.
