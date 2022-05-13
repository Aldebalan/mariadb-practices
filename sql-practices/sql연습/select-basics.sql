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
    
-- where 절 #3 : in연산자    
-- 예제: dept_emp 테이블에서 부서번호 d005이거나 d009에 속한 사원의 사번, 부서번호를 출력
select emp_no, dept_no
	from dept_emp
    where dept_no = 'd005'
       or dept_no = 'd009';
       
select emp_no, dept_no
	from dept_emp
    where dept_no in ('d005','d009');
    
-- where 절 #4 : Like 검색    
-- 예제: 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where hire_date <= '1989-12-31'
	  and '1989-01-01' <= hire_date;
      
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where hire_date like '1989%';
    
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where hire_date between '1989-01-01' and '1989-12-31';
    
-- order by 절 (정렬 / Query문 가장 마지막에 씀) top-k 검색
-- 예제1 : 남자 직원의 이름, 성별, 입사일을 입사일순(선임순)으로 출력
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where gender = 'm'
    order by hire_date asc;
    
-- 예제2 : 직원들의 사번, 월급을 사번과 월급순으로
select emp_no, salary, from_date, to_date
	from salaries
    order by emp_no asc, salary desc;