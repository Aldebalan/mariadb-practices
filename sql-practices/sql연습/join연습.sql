-- inner join

-- 예제1: 현재 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
	from employees a, titles b
    where a.emp_no = b.emp_no		-- join 조건(n-1)
    and b.to_date = '9999-01-01';	-- row 선택 조건
    
-- 예제2: 현재 직원의 이름과 직책을 출력하되 여성 엔지니어(engineer)만 출력하세요
select a.emp_no, a.first_name, a.gender, b.title
	from employees a, titles b
    where a.emp_no = b.emp_no			-- join 조건(n-1)
    and a.gender = 'f'					-- row 선택 조건 1
    and b.title = 'engineer';			-- row 선택 조건 2

--
-- ANSI/ISO SQL 1999 JOIN 표준문법
-- 

-- 1) natural join
-- 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 명시하지 않아도 암묵적으로 조인이 됨
select a.emp_no, a.first_name, b.title
	from employees a natural join titles b -- on a.emp_no = b.emp_no -> natural join으로 생략가능
    where b.to_date = '9999-01-01';

-- 2) join ~ using
-- natural join 문제점
select count(*)
	from salaries a natural join titles b
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01';
    
select count(*)
	from salaries a join titles b using (emp_no)
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01';

-- 3) join ~ on
select b.title, avg(salary)
	from salaries a join titles b on a.emp_no = b.emp_no
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title
    order by avg(a.salary) desc;

