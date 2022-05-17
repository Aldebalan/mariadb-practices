-- 서브쿼리(SUBQUERY) SQL 문제입니다.
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
SELECT 
    COUNT(emp_no)
FROM
    salaries
WHERE
    to_date = '9999-01-01'
        AND salary > (SELECT 
            AVG(salary)
        FROM
            salaries
        WHERE
            to_date = '9999-01-01') 내림차순으로 정렬되어 나타나야 합니다. 
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
order by c.salary desc;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
-- select a.emp_no as '사번', a.first_name as '이름', e.m_name as '매니저이름', c.dept_name as '부서이름'
--   from employees a, dept_manager b, departments c, dept_emp d, (select a.first_name as 'm_name', b.emp_no
--   from employees a, dept_manager b
--  where a.emp_no = b.emp_no
--    and b.to_date = '9999-01-01'
--    group by a.first_name) e
--  where a.emp_no = d.emp_no
--    and d.dept_no = c.dept_no
--    and c.dept_no = d.dept_no
--    and b.to_date = '9999-01-01'
--    and d.to_date = '9999-01-01'; 

-- -- 매니저만!
-- select a.first_name, b.emp_no
--   from employees a, dept_manager b, departments c, employees d
--  where a.emp_no = b.emp_no
--    and b.dept_no = c.dept_no
--    and a.emp_no = d.emp_no
--    and b.to_date = '9999-01-01'
--    group by a.first_name;

-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select a.emp_no as '사번', a.first_name as '이름', d.first_name as '매니저이름', b.dept_no as '부서'
  from employees a, dept_emp b, dept_manager c, employees d
 where a.emp_no = b.emp_no
   and b.dept_no = c.dept_no
   and c.emp_no = d.emp_no
group by a.first_name;
   
-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.

SELECT 
    a.emp_no,
    CONCAT(a.first_name, a.last_name) name,
    c.title,
    d.salary
FROM
    employees a,
    dept_emp b,
    titles c,
    salaries d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND a.emp_no = d.emp_no
        AND b.dept_no = (SELECT 
            s.dept_no
        FROM
            (SELECT 
                AVG(a.salary) AS salary, b.dept_no
            FROM
                salaries a, dept_emp b
            WHERE
                a.emp_no = b.emp_no
            GROUP BY b.dept_no) s
        ORDER BY s.salary DESC
        LIMIT 1)
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
ORDER BY salary;

 
-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select c.title as '직책', max(c.avg_salary) as '평균연봉'
 from( select a.title, avg(salary) as avg_salary
         from titles a, salaries b
        where a.emp_no = b.emp_no
          and a.to_date = '9999-01-01'
          and b.to_date = '9999-01-01'
     group by a.title) c;

select d.dept_name as '부서', avg(salary) as '평균연봉'
  from departments a, dept_emp b, salaries c, title d
 where a.dept_no = b.dept_no
   and b.emp_no = c.emp_no
   and c.emp_no = d.emp_no
   and b.to_date = '9999-01-01'
   and c.to_date = '9999-01-01'
   and d.to_date = '9999-01-01'
group by a.dept_name;





-- 문제7.
-- 평균 연봉이 가장 높은 직책?
select c.title as '직책', max(c.avg_salary) as '평균연봉'
 from( select a.title, avg(salary) as avg_salary
         from titles a, salaries b
        where a.emp_no = b.emp_no
          and a.to_date = '9999-01-01'
          and b.to_date = '9999-01-01'
     group by a.title) c;

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

SELECT 
    c.dept_name,
    CONCAT(a.first_name, a.last_name) AS name,
    MAX(ae.salary) AS employee_salary,
    s.name AS manager,
    s.salary AS manager_salary
FROM
    employees a,
    salaries ae,
    dept_emp b,
    departments c,
    (SELECT 
        CONCAT(e.first_name, e.last_name) name, s.salary, d.dept_no
    FROM
        dept_manager d, employees e, salaries s
    WHERE
        d.emp_no = e.emp_no
            AND d.emp_no = s.emp_no
            AND d.to_date = '9999-01-01'
            AND s.to_date = '9999-01-01') s
WHERE
    a.emp_no = ae.emp_no
        AND a.emp_no = b.emp_no
        AND b.dept_no = c.dept_no
        AND s.dept_no = c.dept_no
        AND ae.to_date = '9999-01-01'
        AND b.to_date = '9999-01-01'
GROUP BY c.dept_name , a.first_name , a.last_name , s.name , s.salary;