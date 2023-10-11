-- 데이터 정의어 : DDL
-- 데이터베이스의 구조를 생성하는 명령어 create
-- 데이터베이스의 구조를 변경하는 명령어 alter
-- 데이터베이스의 구조를 제거하는 명령어 drop / cascade - 제약조건(연쇄) → 참조하는 테이블이 있는 경우 사용
-- 데이터베이스의 구조의 이름을 변경하는 명령어 rename

-- 데이터베이스 구조 : 테이블(기본), 뷰, 인덱스, 시퀀스, 시스템카달로그 등
-- 테이블을 생성할 때 create table ~
-- 데이터베이스 사용자 create user ~

-- Question 1. 상품(product) 테이블을 생성하시오.
    create table product(num number(2),
                         name varchar2(5),
                         price number,
                         qty number);
                         
-- 테이블 구조 확인
desc product

-- Question 2. 부서(dept) 테이블을 생성하시오. 생성된 테이블에 부서번호(dno), 부서명(dname), 부서위치(loc)를 적당한 자료형을 사용하여 생성하시오.
    create table dept(dno number(2),
                      dname varchar2(15),
                      loc varchar2(20));

    desc dept
    
-- Question 3. 기존에 존재하는 테이블을 이용하여 새로운 테이블 생성 : as절
-- 기존에 존재하는 테이블의 구조와 내용 또는 구조만 복사하여 새로운 테이블을 생성할 수 있다.
    create table dept_second
    as  -- as 서브 쿼리
    select * from department;
    
    desc dept_second
    select * from dept_second;
    
-- Question 4. 사원 테이블에 직급이 SALESMAN에 해당하는 사원의 정보만 새로운 테이블 sales로 구조와 내용을 복사하는 쿼리를 기술하시오.
    create table sales
    as select * from employee where job = 'SALESMAN';
    
    select * from sales;

-- Question 5. 사원 테이블에 사원번호, 사원명, 입사일자, 급여 컬럼을 이용하여 emp_second라는 테이블을 생성하시오.
    create table emp_second
    as select eno, ename, hiredate, salary from employee;
    
    select * from emp_second;

-- Question 6. 부서 테이블의 구조만 복사하여 dept_third라는 이름의 테이블을 생성하시오.
    create table dept_third
    as select * from department where 1=0;
    
    select * from dept_third;
    
-- ALTER ~ : 데이터베이스의 구조를 변경하는 명령어
-- alter table ~ add()
-- Question 6. 사원 정보 테이블에 날짜형태의 데이터를 담는 birth라는 이름의 컬럼을 추가하시오.
    alter table employee add (birth date);
    
    select * from employee;
    
-- alter table ~ modify()
-- 수정하려는 컬럼에 내용이 있는 경우 → 크기는 기존의 자료형보다 커야한다.
-- 수정하려는 컬럼에 내용이 없는 경우 → 크기와 자료형을 변경할 수 있다.
-- Question 7. 사원 테이블의 사원의 이름의 크기를 변경하시오.
    create table emp
    as select * from employee;
    
    select * from emp;
    
    alter table emp modify ename varchar2(30);
    alter table emp modify ename varchar2(10);
    alter table emp modify ename varchar2(5);
    
    desc emp
    
-- alter table ~ drop column 컬럼명 : 특정 컬럼을 삭제하는 명령어
    desc employee
    alter table employee drop column birth;
    
-- test를  sample로 변경하시오.
    select * from tab;
    rename test to sample;
    
-- drop table 테이블명;
    drop table dept01;
    

-- DML : 데이터 조작어
-- 실제 데이터베이스의 테이블을 이용하여 레코드 단위로 작업을 수행하는 명령어
-- CRUD : select, insert, update, delete
-- select ~ from, insert into ~ values, update ~ set, delete ~ from
-- 1. SELECT : 검색, 추출
-- 기본형 : select 컬럼명 from 테이블명;
-- 확장형 : where 조건식, order by(asc, desc), group by, having

-- 2. INSERT : 추가
-- 기본형 : insert into 테이블명(컬럼명) values(값);
-- Question 8. 기존의 부서테이블에서 데이터를 제외하고 구조만 복사해서 dept_copy 테이블을 생성하시오.
    create table dept_copy
    as select * from department where 1=0;  -- 항상 거짓인 조건을 명시하면 내용없이 테이블의 구조만 복사된다.
    
    desc dept_copy
    select * from dept_copy;
    
-- 레코드 삽입하는 방법1
    insert into dept_copy(dno, dname, loc) values(11,'개발부','서울시');
    
-- 레코드 삽입하는 방법 2 : 해당 테이블에 존재하는 모든 컬럼에 값을 추가할 경우 컬럼명은 생략가능하다.
    insert into dept_copy values(22, '홍보부', '부산시');
    
-- 레코드를 삽입하는 방법 3 : 특정 컬럼에만 값을 추가하는 경우
    insert into dept_copy(dno, loc) values(33, '대전시');

-- 레코드를 삽입하는 방법 4 : values 대신에 서브 쿼리를 사용하여 다른 테이블에 있는 레코드를 복사할 수 있다.
-- dept_copy 테이블 삭제
    drop table dept_copy;
    
-- department 테이블의 구조만 이용하여 dept_copy 테이블 생성    
    create table dept_copy
    as select * from department where 1=0;
    
    select * from dept_copy;
    
    insert into dept_copy
    select * from department; -- 컬럼명과 컬럼의 수는 일치해야한다.
    
-- 테이블의 컬럼의 내용을 변경할 때 사용하는 명령어 : UPDATE
-- update 실행시 where 조건절이 생략되면 모든 레코드의 값이 변경된다.
-- Question 9. dept_copy 테이블의 부서명을 모두 HR로 변경하시오.
    update dept_copy set dname = 'HR';
    
-- 서브쿼리를 이용하여 다른 테이블에 저장된 데이터로 해당 컬럼의 값을 변경할 수 있다.
-- 부서 테이블의 모든 부서의 지역명을 부서번호가 20번에 해당하는 부서의 지역으로 변경하시오.
    update dept_copy set loc = (select loc from department where dno = 20);
    
-- dept_copy 테이블의 부서명을 'aaa'로 변경하고 부서번호를 33으로 변경하시오.
    update dept_copy set dname = 'aaa', dno = 33;
    
-- delete ~ from : 테이블에 레코드를 삭제하는 명령어
    delete from dept_copy;
    
-- department 테이블의 레코드를 dept_copy 테이블에 추가하시오.
    insert into dept_copy
    select * from department;
    
    delete from dept_copy where dname = 'SALES';    
    
-- 서브 쿼리를 이용하여 레코드 삭제하기
-- 사원정보 테이블의 구조와 내용을 복사하여 emp라는 이름의 테이블을 생성한다.
    drop table emp;
    create table emp as select * from employee;
    
-- Question 11. 부서명이 SALES에 해당하는 사원의 정보를 emp 테이블에서 삭제하는 작업을 수행하시오.
-- step 1. 부서 정보를 가지고 있는 테이블에서 SALES라는 부서명에 해당하는 부서번호를 추출한다.
    select dno
    from department
    where dname = 'SALES';  -- 30
    
-- step 2. 위에서 찾은 부서번호가 30번에 해당하는 사원의 정보를 삭제하는 작업을 수행한다.
    delete from emp 
    where dno = (select dno
                 from department
                 where dname = 'SALES');
                 
    select * from emp;