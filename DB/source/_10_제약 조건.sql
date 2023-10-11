-- 데이터 무결성 제약조건 : 유효성 검사
-- 테이블에 부적절한 데이터의 입력을 방지하기 위해 테이블을 생성할 때 기술하는 여러 규칙들
-- 1. not null : 생략 불가능 ↔ null : 생략 가능(기본형)
-- 2. unipue : 중복 불가능, 유일성, 중복값을 허용하지 않는다.
-- 3. primary key : 기본키(not null + unique)
-- 4. foreign key : 외래기(다른 테이블을 참조할 때 사용하는 키) = 참조키
-- 5. check : 유효성 검사 규칙, 입력값에 범위를 부여하는 것

    drop table dept;
    create table dept(dno number(2), -- null(생략 가능)
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '서울시');
    insert into dept(dname, loc) values('bbb', '대전시');
    insert into dept(dno, loc) values(33, '부산시');
    
-- Not Null 제약규칙
    drop table dept;
    create table dept(dno number(2) not null,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '서울시');
    insert into dept(dname, loc) values('bbb', '대전시');  -- error, dno가 생략되어 있으므로
    insert into dept(dno, loc) values(11, '부산시');  -- 동일한 dno를 가진다.
    
-- Unique : 유일성이 만족되어야 한다. 중복값을 허용하지 않는다.
    drop table dept;
    create table dept(dno number(2) unique,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '서울시');
    insert into dept(dname, loc) values('bbb', '대전시');
    insert into dept(dno, loc) values(11, '부산시');  -- error, dno가 유일성을 위반했기 때문에
    
-- Not Null과 Unique 제약조건을 동시에 담기 : Primary key(기본키)
-- 기본키는 레코드를 식별할 용도로 사용하는 키로, 중복을 허용하지 않고 생략이 불가능하다.
    drop table dept;
    create table dept(dno number(2),
                      dname varchar2(14),
                      loc varchar2(13));  
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '서울시');
    insert into dept(dname, loc) values('bbb', '대전시');  -- error, dno 미입력
    insert into dept(dno, loc) values(11, '부산시');  -- error, dno 유일성 위반
    
-- Foreign key : 외래키, 참조무결성
-- 테이블 사이의 관계를 발생시키는 제약 조건
-- 부모 테이블(dept)을 참조하여 자식 테이블(emp)을 구현한다.
-- step 1. 참조테이블은 부모테이블이 dept에 테이블에 기본키 설정(dno)
-- step 2. 부모테이블에 레코드를 삽입한다.
-- step 3. 자녀테이블(emp)에 해당 컬럼에 외래키 설정, 이때 동일한 이름이 존재하면 에러가 발생한다.
-- step 4. 자녀테이블에 새로운 레코드를 삽입할 때, 부모테이블에 참조하는 컬럼에 없는 값을 삽입하면 무결성 제약 규칙에 어긋난다.

    drop table emp;
    desc employee
    
    create table emp(eno number(4) primary key,
                     ename varchar2(20) not null,
                     dno number(2) constraint dno_fk references dept(dno));  -- 외래키 설정
                     
    select * from emp;
    
    insert into emp values(1111, 'aaa', 10);
    insert into emp values(2222, 'bbb', 20);
    insert into emp values(3333, 'ccc', 10);
    insert into emp values(4444, 'ddd', 30);
    insert into emp values(5555, 'eee', 40);


-- 부모테이블(dept) : 자식테이블이 참조할 키에 기본키설정 필수
    drop table dept;
    
    create table dept(
        dno number(2) primary key,
        dname varchar2(20),
        loc varchar2(20));
        
    select * from dept;
        
    insert into dept values(10, '홍보부', '서울시');
    insert into dept values(20, '영업부', '부산시');
    insert into dept values(30, '개발부', '대전시');
    
    
    insert into emp values(6666, 'kkk', 40);
    
-- 부서번호가 40번인 직원 정보 삭제
    delete from emp where dno = 40;
    
-- 테이블을 생성한 후 외래키 설정하기
    alter table emp 
    add constraint dno_fk references dept(dno);

-- 외래키 조회 : user_constraints, user_cons_columns 딕셔너리를 이용해서 외래키 조회
    select a.constraint_name, a.table_name, b.column_name, a.constraint_type, a.r_constraint_name
    from user_constraints a, user_cons_columns b
    where a.constraint_name = b.constraint_name;
    
-- 외래키 삭제
    alter table employee drop constraint dno_fk;
    
-- check : 유효성 검사 규칙, 특정 컬럼에 입력되는 값에 범위를 설정하는 기능
    drop table emp01;
    
    create table emp01(
        eno number(4) primary key,
        ename varchar2(20),
        salary number(7, 2) constraint sal_c check(salary > 1000));
        
    insert into emp01 values(1111, 'aaa', 890);  -- check 제약 조건에 위배