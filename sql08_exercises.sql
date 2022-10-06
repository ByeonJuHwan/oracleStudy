-- HR 계정의 테이블을 사용한 GROUP BY, JOIN, SUB QUERY 연습

-- 1. 직원의 last_name과 부서 이름을 검색.
select e.last_name, d.department_name
from employees e
    join departments d on e.department_id = d.department_id;
    
-- 2. 직원의 last_name과 부서 이름을 검색. 부서 번호가 없는 직원도 출력.
select e.last_name, d.department_name
from employees e
    left join departments d on e.department_id = d.department_id;
-- 3. 직원의 last_name과 직무(job title)을 검색.
select e.last_name, j.job_title
from employees e
    join jobs j on e.job_id = j.job_id;

-- 4. 직원의 last_name과 직원이 근무하는 도시 이름(city)를 검색.
select e.last_name, l.city
from employees e
    join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id;

-- 5. 직원의 last_name과 직원이 근무하는 도시 이름(city)를 검색. 근무 도시를 알 수 없는 직원도 출력.
select e.last_name, l.city
from employees e
    left join departments d on e.department_id = d.department_id
    left join locations l on d.location_id = l.location_id;

-- 6. 2008년에 입사한 직원들의 last_name을 검색.
select last_name 
from employees
where to_char(hire_date,'YYYY')='2008';

-- to_char(날짜, 포맷): date 타입을 포맷 형식의 문자열로 변환해서 리턴

-- 2008년 = 2008/01/01 ~ 2008/12/31
select last_name , hire_date
from employees
where hire_date between to_date('2008/01/01', 'YYYY/MM/DD')
                and to_date('2008/12/31', 'YYYY/MM/DD');
                
-- to_date(문자열, 포맷) : 문자열을 date 타입으로 변환해서 리턴


-- 7. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 검색.
select d.department_name, count(*) as "사원수"
from employees e
    join departments d on e.department_id = d.department_id 
where to_char(hire_date,'YYYY')='2008'
group by d.department_name;


-- 8. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 검색. 
--    단, 부서별 인원수가 5명 이상인 경우만 출력.
select d.department_name, count(*) as "사원수"
from employees e
    join departments d on e.department_id = d.department_id 
where to_char(hire_date,'YYYY')='2008' 
group by d.department_name
having count(*)>=5;


-- 9. 부서번호, 부서별 급여 평균을 검색. 소숫점 한자리까지 반올림 출력.
select department_id, round(avg(salary),1) as "급여평균"
from employees 
group by department_id;
    
-- 10. 부서별 급여 평균이 최대인 부서의 부서번호, 급여 평균을 검색.
select department_id, round(avg(salary),1) as "급여평균"
from employees 
group by department_id
having avg(salary) = (select max(avg(salary)) from employees group by department_id);

select max(t.AVG_SAL)
from ( select department_id, avg(salary) as AVG_SAL
        from employees
        group by department_id) t;
        
-- with-as-select 구문
with t as(
       select department_id, avg(salary) as AVG_SAL
        from employees
        group by department_id
) 
select department_id, round(AVG_SAL,1)
from t
where AVG_SAL = (
    select max(AVG_SAL) from t    
);


-- 11. 사번, 직원이름, 국가이름, 급여 검색.
select e.employee_id,e.first_name || ' ' || e.last_name as "직원이름",c.country_name,e.salary 
from employees e
    join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
    join countries c on c .country_id = l.country_id; 
    
-- 12. 국가이름, 국가별 급여 합계 검색
select c.country_name, sum(salary)
from employees e
    join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id
    join countries c on c .country_id = l.country_id
group by c.country_name;

-- 13. 사번, 직원이름, 직책이름, 급여를 검색.
select e.employee_id, e.first_name || ' ' || e.last_name as "직원이름", j.job_title,e.salary
from employees e
    join jobs j on e.job_id = j.job_id;

-- 14. 직책이름, 직책별 급여 평균, 최솟값, 최댓값 검색.
select j.job_title, avg(salary),j.min_salary,j.max_salary
from employees e
    join jobs j on e.job_id = j.job_id
group by j.job_title,j.min_salary,j.max_salary;

-- 15. 국가이름, 직책이름, 국가별 직책별 급여 평균 검색.
select c.country_name, j.job_title,round(avg(salary),1)
from employees e
    join departments d on e.department_id = d.department_id
    join jobs j on e.job_id = j.job_id
    join locations l on d.location_id = l.location_id
    join countries c on c .country_id = l.country_id
group by c.country_name, j.job_title;

-- 16. 국가이름, 직책이름, 국가별 직책별 급여 합계을 출력.
--     미국에서, 국가별 직책별 급여 합계가 50,000 이상인 레코드만 출력.
select c.country_name, j.job_title,sum(salary) as "급여 합계"
from employees e
    join departments d on e.department_id = d.department_id
    join jobs j on e.job_id = j.job_id
    join locations l on d.location_id = l.location_id
    join countries c on c .country_id = l.country_id
group by c.country_name, j.job_title
having c.country_name = 'United States of America' and sum(salary)>=50000;







