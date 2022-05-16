drop table member;

create table member(
	no int(11) not null auto_increment,
    email varchar(200) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);

desc member;

alter table member add juminbunho char(13) not null;
desc member;
alter table member drop juminbunho;
desc member;
alter table member add juminbunho char(13) not null after email;
desc member;
alter table member change department department char(13) not null;
desc member;
alter table member add self_intro text;
desc member;
alter table member drop juminbunho;
desc member;

-- 테이블 확인
select * from member;

-- insert
insert
  into member
values (null, 'tjdgus4093@naver.com', password('1234'), 'hyun', '개발팀', null);

insert
  into member(no, email, name, password, department)
  values (null, 'tjdgus@gmail.com', 'sung', '1234', '개발팀');

-- update / where 무조건 적어주기!! 까먹으면 대참사....
update member
   set email='hyun3', password=password('1234')
 where no = 2;
 
 -- delete
 delete
   from member
where no = 2;

-- transaction
select @@AUTOCOMMIT; 	-- 이걸로 트랜잭션 관리함
set autocommit = 0; 	-- 켜짐:1 꺼짐:2 / 꺼져있으면 commit 해줘야 실제 DB에 올라감

insert
  into member(no, email, name, password, department)
  values (null, 'tjdgus@gmail.com', 'sung3', '1234', '개발팀');
commit;

select * from member;