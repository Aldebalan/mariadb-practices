-- Basic Query
select VeRsIoN(), current_date, current_date();
-- 대소문 구분이 없다.
SELECT VERSION(), CURRENT_DATE;
select vErSion(), current_DATE;
-- 수학함수
select sin(pi()/4), (4+1)*5;

-- 테이블 삭제
drop table pet;

-- 테이블 생성
create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

-- schema 확인
desc pet;

-- 데이터 넣기(생성, Create)
insert into pet values('보리','조이','dog','f','2018-10-13', null);

-- 데이터 검색(읽기, Read)
select name, owner, species, gender, birth, death from pet;

-- 데이터 삭제(삭제, Delete)
delete from pet where name = '보리';

-- load data local infile
load data local infile 'd:\\pet.txt' into table pet;

-- 데이터 수정(수정, Update)
update pet set death=null where name != 'Bowser';

-- 조회(검색) 연습1: where

-- 1990년 이후에 태어난 아이들은?
select name, species, birth
	from pet
    where birth > '1990-12-31';
    
-- Gwen과 같이 사는 아이들은?
select name, species, birth
	from pet
    where owner = 'Gwen';

-- null 다루기 1: 살아 있는 애들은?
select name, species, death
	from pet
    where death is null;
    
-- null 다루기 2: 죽는 애들은?
select name, species, death
	from pet
    where death is not null;
    
-- like 검색1(패턴 매칭) : 이름이 b로 시작하는 아이들은?
select name, species
	from pet
    where name like 'b%';

-- like 검색2(패턴 매칭) : 이름이 b로 시작하는 아이들중에 이름이 6자인 아이는?
select name, species
	from pet
    where name like 'b_____';

-- 집계(통계) 함수
select count(*) from pet;

select count(death) from pet;
select count(*) from pet where death is not null;

-- 정렬: order by
-- 나이가 제일 많은 아이 순으로 이름, 출생, 종, 생일로 출력하세요
select name, species, birth
	from pet
order by bitrh desc, name asc;

