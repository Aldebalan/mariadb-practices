-- 집계쿼리: select에 그룹함수가 적용된 경우
-- avg, max, min, count, sum, ......

-- avg 평균값
select avg(salary)
	from salaries;

-- select 절에 그룹함수가 있는 경우, 어떤 컬럼도 select절에 올 수 없다.
-- emp_no는 아무런 의미가 없다.
-- Error!!!
select emp_no, avg(salary)
	from salaries;

-- query 순서
-- 1) from: 접근 테이블 확인
-- 2) where: 조건에 맞는 row을 선택
-- 3) 집게
-- 4) projection

select avg(salary)
	from salaries
	where emp_no = '10060';
    
-- group by에 참여하고 있는 컬럼은 projection이 가능하다(select 절에 올 수 있다.)
select emp_no, avg(salary), sum(salary)
	from salaries
	group by emp_no;

-- having
-- 집계결과(결과 임시 테이블)에서 row를 선택해야 하는 경우
-- 이미 where 절은 실행이 되었기 때문에 having 절에서 이 조건을 주어야 한다. (이중필터링)
-- where절에서 한번 걸러진 결과인 임시테이블에서 row 선택하는 경우
select emp_no, avg(salary), sum(salary)
	from salaries
	group by emp_no
    having avg(salary) > 60000;

-- order by
select emp_no, avg(salary)
	from salaries
	group by emp_no
    having avg(salary) > 60000
    order by avg(salary) asc;


