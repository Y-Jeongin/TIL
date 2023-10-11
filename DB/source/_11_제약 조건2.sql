-- 데이터 무결성 제약 조건
-- 1. Not Null : Null을 허용하지 않는 제약 조건, 생략 불가, 필수 입력
-- Question 1. department 테이블의 구조와 내용을 복사하여 dept 테이블을 생성하시오.
    drop table dept cascade constraints;
    
    create table dept
    as select * from department;  -- 구조만 복사할 경우 where 조건식에 항상 거짓이 되는 조건을 명시한다. 1=0 or 0=1
    
    select * from dept;
    desc dept

    insert into dept(dno, dname, loc) values(50, '개발부', '서울시');
    insert into dept(dno, dname, loc) values(50, '영업부', '대전시');
    insert into dept(dno, dname) values(50, 'DB');
    
    
    drop table dept;
    create table dept(dno number(2) not null,
                      dname varchar2(14) not null,
                      loc varchar2(13) not null);
                     
    insert into dept values(10, '개발부', '서울');
    insert into dept values(20, '홍부부', '광주');
    insert into dept(dno, dname) values(10, '개발부');
    insert into dept values(10, '영업부', '부산');                   

-- 2. Unique : 중복값을 허용하지 않는 제약 조건, 유일성
    drop table emp;
    create table emp(eno number(4) unique,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    select * from emp;
    desc emp
    
    insert into emp values(1111, '장보고', '부장', 1000);
    insert into emp(ename, job, salary) values('이순신', '과장', 800);
    insert into emp(ename, job, salary) values('이순신', '과장', 800);

-- 3. Primary key : Null을 허용하지 않고, 중복값도 허용하지 않는 제약 조건, Not Null + Unique, 기본키
    drop table emp;
    create table emp(eno number(4) primary key,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    create table emp(eno number(4) constraint eno_pk primary key,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    select * from emp;
    desc emp
    
    insert into emp values(1111, '장보고', '부장', 1000);
    insert into emp values(2222, '이순신', '과장', 1000);
    insert into emp(ename, job, salary) values('이순신', '과장', 800);
    insert into emp(eno, ename) values(3333, '홍길동');

-- 4. Foreign key : 참조되는 테이블의 컬럼에 존재하는 값만 입력이 허용되도록 하는 제약 조건, 참조 무결성, 외래키
-- 참조 무결성 : 테이블 사이의 관계에서 발생하는 개념으로 두 테이블의 부모테이블(주체가 되는 테이블)과 자녀테이블(종속이 되는 테이블)에 의해 결정
-- 부서테이블(department) : dno(기본키) → 부모테이블, 부모테이블의 키가 되기 위해서는 컬럼을 반드시 기본키(primary key) 또는 유일키(unique)로 설정
-- 사원테이블(employee) : eno(기본키), dno(외래키) → 자식테이블
    drop table dept;
    drop table emp;
    
    create table dept(dno number(2) primary key,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    insert into dept values(10, '개발부', '서울');
    insert into dept values(20, '홍부부', '대전');
    insert into dept values(30, '영업부', '대구');
    insert into dept values(40, '회계부', '부산');
    
    select * from dept;
    
    
    create table emp(eno number(4) primary key,
                     ename varchar2(14) not null,
                     job varchar2(20),
                     salary number,
                     dno number(2) constraint emp_dno_fk references dept(dno));
    
    select * from emp;
                     
    insert into emp values(1111, '장보고', '부장', 1000,10);
    insert into emp values(2222, '장보고', '과장', 800,30);  
    insert into emp values(3333, '이순신', '대리', 600,50);  

-- 5. Check : 유효성 검사 규칙, 입력값에 범위나 조건을 부여하는 제약 조건
    drop table sample;
    create table sample(name varchar2(20),
                        age number constraint ch_age check(age > 0 and age < 150),
                        gender char(1) constraint ch_gender check(gender in('M', 'W')),
                        id number primary key);
    
    select * from sample;
                        
    insert into sample values('홍길동', 30, 'M', 1);                    
    insert into sample values('장보고', 25, 'M', 2);     
    insert into sample values('유관순', -100, 'W', 3);     
    insert into sample values('유관순', 20, 'F', 3);     
    