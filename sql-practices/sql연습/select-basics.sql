-- select 연습
select * 
	from departments
    order by dept_no
    limit 6, 3;

SELECT 
    dept_no, dept_name
FROM
    departments;

-- alias(as 생략가능)
-- 예제1: employees 테이블에서 직원의 이름, 성별, 입사일을 출력
select first_name as '이름', gender as '성별', hire_date '입사일'
	from employees;
-- java에서 찾을수있게 칼럼이름을 맞춰주는것

-- 예제2: employees 테이블에서 직원의 이름(성+이름), 성별, 입사일을 출력
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees;
-- 칼럼이름이 길거나 복잡해서 지저분할 경우 간단하게 표현하기 위함

-- distinct
-- 예제: titles 테이블에서 모든 직급의 이름을 출력
select distinct title
	from titles;
    
-- where 절 #1
-- 예제: 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
 select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where hire_date < '1991-01-01'
    order by hire_date desc;

-- where 절 #2 : 논리연산자    
-- 예제: 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력
 select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where hire_date < '1990-01-01'
	and gender = 'f'
    order by hire_date desc;
    
