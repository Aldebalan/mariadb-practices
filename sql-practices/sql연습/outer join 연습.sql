-- Outer Join

insert into department values(null, '총무');
insert into department values(null, '영업');
insert into department values(null, '개발');
insert into department values(null, '기획');

select * from department;

insert into employee values(null, '둘리', 1);
insert into employee values(null, '마이콜', 2);
insert into employee values(null, '또치', 3);
insert into employee values(null, '길동이', null);

select * from employee;

-- left join
select a.name as '이름', isnull(b.name, '없음') as '부서'
  from employee a left join department on a.department_no = b.no;
  
-- right join
select a.name as '이름',b.name as '부서'
  from employee a right join department on a.department_no = b.no;