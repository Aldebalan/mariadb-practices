-- 서브쿼리(SUBQUERY) SQL 문제입니다.
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(emp_no)
  from salaries
 where to_date = '9999-01-01'
   and salary < (select avg(salary)
                         from  salaries
                        where to_date = '9999-01-01');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select c.emp_no as '사번', b.first_name as '이름', d.dept_name as '부서', c.salary as '연봉'
  from dept_emp a, employees b, salaries c, departments d
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and d.dept_no = a.dept_no
   and a.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and (a.dept_no, c.salary)  in ( select a.dept_no, max(salary)
                                     from dept_emp a, salaries b
                                    where a.emp_no = b.emp_no
                                      and a.to_date = '9999-01-01'
                                      and b.to_date = '9999-01-01'
							     group by a.dept_no)
	order by c.salary desc;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select a.emp_no as '사번', a.first_name as '이름', c.salary as '연봉'
  from employees a, dept_emp b, salaries c,(select a.dept_no, avg(salary) as avg_salary
                                              from dept_emp a, salaries b
                                             where a.emp_no = b.emp_no
                                               and a.to_date = '9999-01-01'
                                               and b.to_date = '9999-01-01'
                                          group by a.dept_no) d
 where a.emp_no = b.emp_no
   and b.emp_no = c.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and c.salary > d.avg_salary
group by a.first_name
order by c.salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no as '사번', a.first_name as '이름', e.m_name as '매니저이름', c.dept_name as '부서이름'
  from employees a, dept_manager b, departments c, dept_emp d, (select a.first_name as 'm_name', b.emp_no
  from employees a, dept_manager b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   group by a.first_name) e
 where a.emp_no = d.emp_no
   and d.dept_no = c.dept_no
   and c.dept_no = d.dept_no
   and b.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'; 

-- 매니저만!
select a.first_name, b.emp_no
  from employees a, dept_manager b, departments c, employees d
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and a.emp_no = d.emp_no
   and b.to_date = '9999-01-01'
   group by a.first_name;

-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no as '사번', a.first_name as '이름', d.first_name as '매니저이름', b.dept_no as '부서'
  from employees a, dept_emp b, dept_manager c, employees d
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and c.emp_no = d.emp_no
group by a.first_name;
   
-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select *
  from employees a, salaries b, titles c

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 


-- 문제7.
-- 평균 연봉이 가장 높은 직책?


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

