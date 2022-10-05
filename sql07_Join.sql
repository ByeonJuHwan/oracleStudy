/*
조인(join): 2개 이상의 테이블에서 검색하는 것.

join 문법:
1) ANSI 표준 문법 : 
    select 컬럼, ...
    from 테이블1 join종류 테이블2 on join조건
    
2) Oracle 문법 :
    select 컬럼, ...
    from 테이블1,테이블2,...
    where join조건;

join 종류 :
1) inner join
2) outer join
    (1) left outer join
    (2) right outer join
    (3) full outer join
join 종류를 말할 때 inner, outer는 생략 가능.

*/

-- 사번, 이름, 부서번호, 부서이름 검색 - inner join
-- 1) ANSI 표준
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp
    inner join dept on emp.deptno = dept.deptno;
    
-- 2) Oracle : 
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp, dept
where emp.deptno = dept.deptno;

-- inner join은 두 테이블(emp, dept) 에서 공통으로 등장하는 부서번호(10,20,30)을 검색.

-- left/right/full outer join의 차이점 :
insert into emp(empno, ename, deptno)
values (1004, '변주환',50);

commit; -- 테이블 변경 내용을 영구 저장.

-- 사번, 이름, 부서번호, 부서이름 -- left outer join
-- 왼쪽 테이블에서 등장하는 모든 부서번호 (10,20,30,50)가 검색.
-- 1) ANSI:
select e.empno,e.ename,d.dname
from emp e
    left outer join dept d on e.deptno = d.deptno;
    
-- 2) Oracle:
select e.empno,e.ename,d.dname
from emp e, dept d
where e.deptno = d.deptno(+);

-- 사번, 이름, 부서번호, 부서이름 -- right outer join
-- 1) ANSI : 
select e.empno,e.ename,d.dname
from emp e
    right join dept d on e.deptno = d.deptno;
    
-- 2) Oracle :
select e.empno,e.ename,d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;

-- 사번, 이름, 부서번호, 부서이름 -- full outer join
-- 1) ANSI : 
select e.empno,e.ename,d.dname
from emp e
    full join dept d on e.deptno = d.deptno;
    
-- 2) Oracle : full outer join의 문법을 제공하지 않음. 합집합 연산을 이용할 수 있음.
select e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e, dept d
where e.deptno = d.deptno(+) -- left join
union -- 합집합
select e.empno,e.ename,e.deptno,d.deptno,d.dname
from emp e, dept d
where e.deptno(+) = d.deptno; -- right join

select * from dept;
-- 사번, 부서이름, 이름, 급여를 검색. (inner join)
-- 급여가 2000 이상인 직원들을 검색. 출력 순서는 급여의 내림차순.
select e.empno, d.dname,e.ename,e.sal
from emp e 
     join dept d on e.deptno = d.deptno
where sal>=2000
order by e.sal desc;


select e.empno, d.dname,e.ename,e.sal
from emp e, dept d
where e.deptno = d.deptno and sal>=2000
order by e.sal desc;


-- self-join : 같은 테이블에서 join을 하는 것.
-- 사번, 이름, 매니저 사번, 매니저 이름을 검색
select e1.empno, e1.ename as "직원 이름", e1.mgr,e2.ename as "매니저이름"
from emp e1
    join emp e2 on e1.mgr = e2.empno;
    
select e1.empno, e1.ename as "직원 이름", e1.mgr,e2.ename as "매니저이름"
from emp e1, emp e2
where e1.mgr = e2.empno;

-- 위의 inner join 결과와 left/right/full outer join의 결과를 비교
-- left join:
select e1.empno, e1.ename as "직원 이름", e1.mgr,e2.ename as "매니저이름"
from emp e1
    left join emp e2 on e1.mgr = e2.empno;

-- right join:
select e1.empno, e1.ename as "직원 이름", e1.mgr,e2.ename as "매니저이름"
from emp e1
    right join emp e2 on e1.mgr = e2.empno;
    
-- full join:
select e1.empno, e1.ename as "직원 이름", e1.mgr,e2.ename as "매니저이름"
from emp e1
    full join emp e2 on e1.mgr = e2.empno;
    
    
-- Non--eqi join : join의 조건식이 부등식(>,>=,<,<=,...)이 되는 경우.
-- 사번, 이름, 급여, 급여등급을 검색.
select e.empno, e.ename, e.sal, s.grade
from emp e
     join salgrade s on e.sal between s.losal and s.hisal;


-- 부서 이름, 부서 위치, 부서의 직원수를 검색(inner join)
-- 1) ANSI :
select d.dname,d.loc, count(*)
from dept d
    join emp e on d.deptno = e.deptno
group by d.dname, d.loc;

-- 부서 번호, 부서 이름, 부서의 사원수, 부서의 급여 최솟값, 부서의 급여 최댓값을 검색
select e.deptno, d.dname, count(*) as "사원수" , min(sal), max(sal)
from emp e
    join dept d on e.deptno = d.deptno
group by e.deptno,d.dname;

-- 3개의 테이블을 join
-- 급여가 3000 이상인 직원 이름, 부서 위치, 급여, 급여 등급을 검색.
select e.ename, d.loc, e.sal,s.grade
from emp e
     join dept d on e.deptno = d.deptno
     join salgrade s on e.sal BETWEEN s.losal and s.hisal
where e.sal >= 3000;

select e.ename, d.loc, e.sal, s.grade
from emp e, dept d, salgrade s
where e.deptno = d.deptno
    and e.sal between s.losal and s.hisal
    and e.sal >= 3000;


-- 부서 번호, 부서 이름, 사번, 직원 이름 , 매니저 사번, 매니저 이름, 급여, 급여 등급을 검색. (dept,emp1,emp2,salgrade)
-- 출력 순서 : (1) 부서번호 오름차순, (2) 사번 오름차순
select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as "매니저 이름", e1.sal, s.grade
from dept d
    join emp e1 on d.deptno = e1.deptno
    join emp e2 on e1.mgr = e2.empno
    join salgrade s on e1.sal between s.losal and s.hisal
order by d.deptno, e1.empno;


select d.deptno, d.dname, e1.empno, e1.ename, e1.mgr, e2.ename as "매니저 이름", e1.sal, s.grade
from dept d, emp e1, emp e2, salgrade s
where d.deptno = e1.deptno
    and e1.mgr = e2.empno
    and e1.sal between s.losal and s.hisal
order by d.deptno, e1.empno;

