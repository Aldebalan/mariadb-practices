-- subquery

-- 1) select 절

-- 2) from 절의 서브 쿼리
select now() as n, sysdate() as b, 3+1 as c;
select s.a, s.b
  from (select now() as a, sysdate() as b, 3+1 as c) s;

-- 3) where 절의 서브 쿼리
-- 예제
-- 현재, Fai Bale이 근무하는 부서에서 근무하는 직원의 사번, 전체 이름을 출력해보세요.

select dept_no
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and concat(b.first_name, ' ', b.last_name) = 'Fai Bale';

select b.emp_no, b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and dept_no = 'd004';

-- )solution
select b.emp_no, b.first_name
  from dept_emp a, employees b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and dept_no = (select dept_no
					from dept_emp a, employees b
                   where a.emp_no = b.emp_no
                     and a.to_date = '9999-01-01'
					 and concat(b.first_name, ' ', b.last_name) = 'Fai Bale');
                     
-- 3-1) 단일행 연산자: =, >, <, <=, >=, <>, !=
-- 실습문제 1: 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요.
select first_name, salary 
  from employees a, salaries b
 where a.emp_no = b.emp_no
   and b.to_date = '9999-01-01'
   and b.salary < (select avg(salary)
                         from  salaries
                        where to_date = '9999-01-01')
					 group by first_name;

select avg(salary) from salaries where to_date = '9999-01-01';
select b.first_name, a.salary
  from salaries a, employees b
 where a.emp_no = b.emp_no
   and to_date = '9999-01-01'
   and a.salary < (select avg(salary) from salaries where to_date = '9999-01-01')
   group by b.first_name
   order by a.salary desc;
 
 -- 실습문제 2: 현재 가장 적은 평균급여의 직책과 그 직책의 평균급여
 -- 1) 현재 가장 적은 직책의 평균급여
 -- 1-1) 직책별 평균급여 구하기
 select a.title, avg(salary)
   from titles a, salaries b
  where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
group by a.title;
 
 -- 1-2) 가장 적은 평균 급여
 select min(c.avg_salary)
 from( select a.title, avg(salary) as avg_salary
         from titles a, salaries b
        where a.emp_no = b.emp_no
          and a.to_date = '9999-01-01'
          and b.to_date = '9999-01-01'
     group by a.title) c;
 
 -- 2-1) solution : subquery
 select a.title, avg(salary) as avg_salary
         from titles a, salaries b
        where a.emp_no = b.emp_no
          and a.to_date = '9999-01-01'
          and b.to_date = '9999-01-01'
     group by a.title
	   having avg_salary = (select min(c.avg_salary)
                              from( select a.title, avg(salary) as avg_salary
                              from titles a, salaries b
                             where a.emp_no = b.emp_no
                               and a.to_date = '9999-01-01'
                               and b.to_date = '9999-01-01'
					      group by a.title) c);
 
 -- 2-2) solution : top-k
 select a.title, avg(salary)
  from titles a, salaries b
 where a.emp_no = b.emp_no
   and a.to_date = '9999-01-01'
   and b.to_date = '9999-01-01'
group by a.title
order by avg(salary) asc
 limit 0, 1;