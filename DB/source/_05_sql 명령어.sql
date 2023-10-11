-- 데이터 정의어(DDL, Data Definition Language) : 데이터베이스의 구조를 생성하고 변경하고 삭제하는 명령어
-- 1. create table/view/user : 새로운 테이블을 생성하는 명령어
-- 자료형(data type) : 컬럼들의 속성
-- char(size) : 고정길이 문자 데이터
-- varchar2(size) : 가변길이 문자 데이터
-- number : 숫자, number(size), number(size, 소수점 이하 자릿수) → number(7, 2) 7자리 중 소수점 이하 둘째자리까지 포함, 최대 40자
-- date / timestamp

-- Question 1. 임의의 테이블 emp01을 생성하고, 사원번호 eno, 사원이름 ename, 사원급여 sal을 컬럼으로 담아서 구현하시오.
-- 사용자 정의 규칙(명명법) : 테이블명, 컬럼명, 기타 프로그램 안에서 사용자가 임의로 정의해서 사용하는 이름들을 작성하는 규칙
-- 반드시 문자로 시작, 글자 수  1~30자까지, 영문자(A~Z, 대소문자 구별X), 숫자(0~9), 특수문자('_', '$', '#'')만 포함 가능, 중복 불가능, 공백을 허용하지 않는다.
    create table emp01 (eno number(4), 
                                     ename varchar2(20),
                                     sal number);
                                     
-- 테이블 구조 확인
    desc emp01
    
-- 기존에 존재하는 테이블을 활용하여 테이블을 생성 : as절
    create table emp02 as select * from emp01;  -- emp01 테이블의 구조와 내용을 그대로 복사하여 새로운 테이블을 생성한다는 의미
    desc emp02

    create table emp as select * from employee;

    select * from emp01;
    select * from emp02;
    select * from emp;
    
-- 기존에 만들어진 테이블의 구조만 이용하여 새로운 테이블 생성
    create table emp03 as select * from employee where 1 = 0;  -- 거짓 조건을 작성하면 테이블의 구조만 가져온다.
    desc emp03
    select * from emp03;
    
-- Question 2. 부서 번호가 30번에 해당하는 사원들의 정보를 가지고 있는 테이블 emp30을 생성하시오.
    create table emp30 as select * from employee where dno = 30;
    select * from emp30;
    
-- 현재 접속된 계정에 존재하는 테이블의 목록 추출
    select * from tab;

-- 2. alter table : 기존 테이블의 구조를 변경하는 명령어
-- 테이블의 구조 변경은 컬럼의 추가, 수정, 삭제시 사용한다.
-- 1) alter table ~ add : 기존의 테이블에 새로운 컬럼을 추가하는 명령어
    select * from emp01;
    desc emp01
    
    alter table emp01 add(job varchar2(9));

-- 2) alter modify : 기존의 테이블에 컬럼을 변경하는 명령어
-- 해당 컬럼에 자료가 없는 경우 : 데이터 타입과 컬럼의 크기 변경 가능
-- 해당 컬럼에 자료가 있는 경우 : 데이터의 타입은 변경 불가, 컬럼의 크기는 변경 가능 → 단, 기존 컬럼의 크기보다 반드시 더 커야한다.
    alter table emp01 modify(job varchar2(30));

-- 3) alter table ~ drop column : 테이블에 이미 존재하는 컬럼을 삭제하는 명령어
    alter table emp01 drop column job;

-- 3. drop table : 기존 테이블을 제거하는 명령어, delete는 복구 가능하나 drop은 복구 할 수 없다.
    select * from tab;
    
    drop table emp01;
    desc emp01
    
-- 4. rename : 기존에 사용하던 테이블의 이름을 변경하는 명령어
    rename emp to test;
    select * from emp; 
    select * from test;


-- 데이터 조작어(DML) : 테이블의 내용을 추가, 수정, 삭제, 추출하는 명령어
-- 1. select ~ from : 추출, 검색
-- 부서 정보를 관리하는 테이블 department 테이블의 모든 내용을 추출하시오.
    select * from department;

-- 부서 테이블의 구조만 이용하여 dept01 이라는 테이블을 생성하시오.
    create table dept01 as select * from department where 1=0;
    desc dept01
    select * from dept01;

-- 2. insert into ~ values : 추가
    insert into dept01(dno, dname, loc) values(11, '총무부', '금천구');
    insert into dept01 values(22, '전산실', '서구');  -- 테이블에 존재하는 모든 컬럼명의 값 추가시 컬럼명 생략 가능
    insert into dept01(dno, dname) values(33, '홍보부');
    insert into dept01(dno, loc) values(44, '서울시');

-- 3. update ~ set : 변경
-- 테이블에 저장된 레코드를 수정하기 위해 사용하는 명령어
-- 주의! where절을 사용하지 않을 경우 모든 레코드의 값이 수정된다.
-- 모든 사원의 부서 번호를 30으로 수정하시오.
    select * from test;
    update test set dno = 30;

-- 직원의 급여를 10% 인상하는 쿼리문을 기술하시오.
    update test set salary = salary * 1.1;
    
-- 모든 직원의 입사일을 오늘 날짜로 수정하시오.
    update test set hiredate = sysdate;
    
-- 직급이 SALESMAN인 직원의 부서 번호를 40으로 수정하시오.
    update test set dno = 40 where job = 'SALESMAN';

-- 직급이 MANAGER인 직원의 급여를 10% 인상하는 쿼리문을 구현하시오.
    update test set salary = salary * 1.1 where job = 'MANAGER';
    
-- SCOTT 사원의 부서 번호를 20으로, 직급을 MANAGER로, 급여는 50, 커미션은 4000으로 수정하는 쿼리문을 구현하시오.
    update test set dno = 20, job = 'MANAGER', salary = 50, commission = 4000 where ename = 'SCOTT';
    select * from test where ename = 'SCOTT';

-- Question 3. 20번 부서의 지역명을 40번 부서의 지역명으로 변경하는 쿼리를 작성하되 서브 쿼리를 이용하시오.
-- 단, department 테이블의 구조와 내용을 이용하여 dept02 테이블을 생성하여 작업할 것
    create table dept02 as select * from department;
    select * from dept02;
    
    update dept02 set loc = (select loc from dept02 where dno = 40) where dno = 20;

-- 4. delete ~ from : 삭제
-- 테이블에 저장된 레코드를 삭제하는 명령어
-- where 조건절이 없으면 모든 레코드가 삭제된다.
    delete from dept02;  -- * 생략 가능