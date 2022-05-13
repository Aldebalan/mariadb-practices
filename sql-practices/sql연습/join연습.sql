-- inner join

-- 예제1: 현재 근무하고 있는 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
	from employees a, titles b
    where a.emp_no = b.emp_no		-- join 조건(n-1)
    and b.to_date = '9999-01-01';	-- row 선택 조건
    
-- 예제2: 현재 직원의 이름과 직책을 출력하되 여성 엔지니어(engineer)만 출력하세요
select a.emp_no, a.first_name, a.gender, b.title
	from employees a, titles b
    where a.emp_no = b.emp_no		-- join 조건(n-1)
    and gender = 'f'
    and title = 'engineer';			-- row 선택 조건

--
-- ANSI/ISO SQL 1999 JOIN 표준문법
-- 

-- 1) natural join

-- 2) join ~ using

-- 3) join ~ on
