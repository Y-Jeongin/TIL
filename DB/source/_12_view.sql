-- 가상 테이블 뷰(View)
-- 뷰(Veiw) : 물리적인 테이블을 근거로 만들어진 가상 테이블, 테이블에 데이터는 있지만 실제 뷰라는 테이블이 존재하지 않고 sql만 저장되어 있다.
-- 기본테이블 : 뷰를 생성하기 위해서 실질적으로 데이터를 가지고 있는 물리적인 테이블을 뜻한다.
-- 실습을 위해 dept 테이블과 emp 테이블 생성 : department 복사, employee 복사
    drop table dept cascade constraints;
    create table dept
    as select * from department;
    select * from dept;
    
    drop table emp;
    create table emp
    as select * from employee;
    select * from emp;
    
-- 뷰를 생성하는 명령 : create view 뷰이름 [옵션]
-- 뷰를 생성할 때 사용하는 옵션 : create or replace view, force, with check option, with read only

-- Question 1. 부서번호가 30번에 해당하는 사원들의 번호, 이름, 부서번호만 추출하시오.
    select eno, ename, dno from emp where dno = 30;
    
-- 30번 부서에 소속된 사원들의 번호, 이름, 부서번호를 출력하기 위한 select문을 하나의 뷰로 정의하는 쿼리문
    create view emp_view30 as select eno, ename, dno from emp where dno = 30;
    select * from emp_view30;

-- 뷰를 사용하는 이유 : 복잡하고 긴 쿼리문을 뷰로 정의하면 접근이나 작업에 효율성을 높일 수 있다. 보안에 유리
    drop view emp_view30;  -- 뷰를 삭제한다고 기반테이블이 삭제되는 것은 아니다.
    

-- 시퀀스(seqeunce) : 일련번호의 성질을 가지고 있는 기능
-- 오라클에서는 행을 구분하기 위해서 일반적으로 행의 값을 기본키로 사용하는 경우가 있다.
-- 기본키처럼 생략 불가, 중복 불가, 자동 번호 발생기
-- 시퀀스를 생성 : create sequence 시퀀스이름, start with → 시작번호, increment by → 증감값, maxvalue → 최대값
-- 시퀀스 값을 확인하는 명령어 : .currval(시퀀스의 현재값), .nextval(다음값)

-- 시퀀스 생성하기
    create sequence sample_seq;  -- 1부터 시작해서 1씩 증가되는 시퀀스 생성
    
    select sample_seq.nextval from dual;
    select sample_seq.currval from dual;

-- 사원번호를 생성할 목적으로 시퀀스 객체를 생성하시오.
-- 시작값은 1, 1씩 증가, 최대값 100000이 되는 emp_seq를 생성하시오.
    create sequence emp_seq start with 1 increment by 1 maxvalue 100000;
    
    drop table emp01;
    create table emp01(eno number primary key,
                       ename varchar2(14),
                       salary number);

    insert into emp01 values(emp_seq.nextval, '이순신', 1000);
    insert into emp01 values(emp_seq.nextval, '이순신', 1000);

    select * from emp01;