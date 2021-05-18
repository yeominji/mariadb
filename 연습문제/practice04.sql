-- 문제1. 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select avg(b.salary) as avg_salary from titles a, salaries b where a.emp_no =b.emp_no and avg_salary < a.title;
 

-- 문제2.현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요.
 -- 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.
 
 select e.first_name, e.emp_no, a.dept_name, max(b.salary) as avg_salary from departments a , salaries b, dept_emp c ,employees e where e.emp_no =b.emp_no and c.emp_no =e.emp_no and a.dept_no=c.dept_no group by a.dept_name order by avg_salary  desc; 

-- 문제3. 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요
select avg(c.salary) as avg_salary  from employees a ,dept_emp b, salaries c where  a.emp_no=b.emp_no and   a.emp_no=c.emp_no  group by b.emp_no having  (avg_salary) <c.salary;
-- 문제4. 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no as 사번,a.first_name as 이름 , d.title as 메니저 , c.dept_name as 부서이름 from employees a , dept_emp b, departments c,titles d, dept_manager e where a.emp_no=b.emp_no and b.dept_no=c.dept_no  and a.emp_no=e.emp_no and d.title='manager';

-- 문제5. 평균 연봉이 가장 높은 부서는?(이름 , 평균 연봉)
select  concat(d.first_name, ' ', d.last_name) as name ,a.dept_name  ,avg(c.salary)  from  departments a ,dept_emp b ,salaries c , employees d  where  d.emp_no =c.emp_no and a.dept_no = b.dept_no and d.emp_no= b.emp_no;

-- 문제6.현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.




-- 문제7. 평균 연봉이 가장 높은 직책?
select a.title , avg(b.salary) as avg_salary  from titles a ,salaries b where a.emp_no=b.emp_no group by a.title having max(avg_salary)=a.title; 

-- 문제8.현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- (부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.)