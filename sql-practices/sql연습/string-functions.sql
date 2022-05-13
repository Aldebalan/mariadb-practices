-- 함수: 문자열

-- upper
select upper('buSan'), upper('busan'), upper('Douzone');
select upper(first_name) from employees;

-- lower
select lower('buSan'), upper('busan'), upper('Douzone');
select lower(first_name) from employees;

-- substring(문자열, index, length)
select substring('Hello World', 3, 2);

-- 예제: 1989년 이전에 입사한 여직원의 이름, 성별, 입사일을 출력
select concat(first_name, last_name) as '이름', gender as '성별', hire_date '입사일'
	from employees
    where substring(hire_date, 1, 4) = '1989';
    
-- lpad(오른쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234', 10, '-');
select rpad('1234', 10, '-');

-- 예제: 직원들의 월급을 오른쪽 정렬(빈공간은 *)
select emp_no, lpad(salary, 10, '*') from salaries;
select lpad(salary, 10, '*'), emp_no from salaries;

-- trim, ltrim, rtrim (공백 없애기)
select concat('---', ltrim('     hello    '), '---'),
	   concat('---', rtrim('     hello    '), '---'),
	   concat('---', trim('     hello    '), '---'),
	   concat('---', trim(both 'x' from 'xxxxhelloxxxxx'), '---');

