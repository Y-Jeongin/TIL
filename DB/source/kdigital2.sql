-- 회원정보를 저장할 테이블 생성
drop table member;
drop table member cascade constraints;

-- 테이블 생성
create table member(
    userid varchar2(10) primary key,
    userpass varchar2(20) not null,
    username varchar2(20) not null
);

-- DDL은 자동 commit이 수행된다.

-- 레코드 삽입
insert into member values('admin', 'admin', '관리자');

commit;


select * from member;

update member set userpass = '1234' where userid = 'admin';

commit;

delete from member where userid = 'aaa';

insert into member values('aaa', '1234', '홍길동');

select