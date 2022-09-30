 -- Alt+F10 : 새 워크시트(새 SQL 스크립트 파일) 만들기.
 -- DQL(Data Query Language): 데이터베이스 테이블에서 레코드들을 검색하는 명령어.
 -- select 컬럼이름, ... fro, 테이블이름;
 
 -- dept 테이블에서 deptno, dname 컬럼을 검색.
 select deptno, dname from dept;
 
 -- dept 테이블에서 모든 컬럼을 검색.
 select deptno,dname,loc
 from dept;
 
 select * from dept;
 -- 테이블에서 컬럼들이 정의된 순서대로 출력.
 
 select deptno, loc, dname
 from dept;
 -- select 에서 작성한 컬럼 순서대로 출력.
 
 -- select 출력 결과 에서 컬럼 이름에 별명(alias) 주기:
 -- as 별명에서만!!!!! 큰따옴표("")를 사용.
 select deptno as "부서번호", dname as "부서이름" from dept;
 
 select deptno,dname as "부서이름"
 from dept;
 
 -- 연결 연산자(||) : 2개 이상의 컬럼을 합쳐서 하나의 컬럼으로 출력
 -- SQL에서 문자열은 작은따옴표 ('')를 사용함!
 select deptno || ' ' || dname as "부서 정보"
 from dept;
 
 -- 부서(dept) 테이블에서 부서 이름(dname)과 위치(loc)를 검색.
 -- 출력 양식 예 : ACCOUNTING 부서는 NEW YORK에 있습니다.
 select dname || ' 부서는 ' || loc || ' 에 있습니다.'  as "부서 위치"
 from dept;
 
 -- 정렬해서 출력:
 -- select 컬럼이름, ... from 테이블이름 order by 정렬할 컬럼[desc/asc];
 --     asc : 오름차순 정렬(ascending), 
 --     desc : 내림차순 정렬(descending)
 -- 정렬의 기본은 오름차순. asc는 생략 가능. 내림차순 정렬에서는 desc를 명시.
 
 -- 부서 테이블의 모든 레코드를 부서번호 오름차순 출력
 select * from dept;
 -- 부서 테이블의 모든 레코드를 부서번호 내림차순 출력
 select * from dept order by deptno desc;
 
 
 -- 직원 테이블에서 사번과 이름을 검색, 사번 오름차순 출력
 select empno, ename from emp order by empno;
 -- 직원 테이블에서 사번과 이름을 검색, 이름 오름차순 출력
  select empno, ename from emp order by ename;

-- 직원 테이블(emp)에서 이름(ename)과 직무(job)을 "SMITH는 CLERK입니다." 형식으로 출력, 별명 지을때만 ("") 사용.
select ename || ' 는 '|| job || '입니다.' as "직업 소개" from emp ;
-- 직원 테이블(emp) 에서 직무(job)을 검색
select job from emp;
-- 위 결과에서 중복되지 않는 job 값들만 출력
select distinct job from emp;
 
select distinct job, deptno from emp;

-- dinstint는 select 문장에서 한번만, 모든 컬럼 이름들보다 먼저 사용됨.

-- 직원 테이블에서 중복되지 않는 부서번호, 직무를 검색. 부서번호의 오름차순 출력.
select distinct deptno as "부서번호", job as "직무" from emp order by deptno;