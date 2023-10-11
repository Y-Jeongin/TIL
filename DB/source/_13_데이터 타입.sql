-- 1. 데이터 타입 : 오라클에서 지원하는 자료형
-- char(size) : size 크기의 고징길이 문자 데이터, 입력된 자료의 길이와 상관없이 정해진 길이만큼 저장 영역을 차지한다.
-- varchar2(size) : 가변길이 문자 데이터
-- number(p, s) : 정수(p), 소숫점이하(실수, s)
-- date : 날짜 형식의 데이터, timestamp(date의 확장된 개념)

-- 2. 오라클 데이터베이스 접속
-- SQL*PLUS와 SQL 명령어(DDL, DML, DCL)
-- 사용자 계정 : 관리자(sys, system), 일반 사용자 계정(scott)
-- 오라클 접속 : sqlplus 계정id/계정password
-- 현재 계정 확인 : show user
    show user
-- 계정 접속 명령 : connect(=conn)
    conn system/1234

-- 테이블 구조 : desc 테이블명
    desc employee
    
-- 데이터 조회/검색 : select
-- select [distinct]컬럼명 [*=all] [as = alias] 
-- from 테이블명
-- [where 조건식]
-- [order by 컬럼명 [asc/desc]]
-- [group by 컬럼명]
-- [having 그룹조건식]

-- 수식 : 산술식, 계산식(비교/판단), 논리식
-- 산술식(+, -, *, /) : 숫자 또는 날짜 데이터만 사용 가능
-- Question 1. 직원테이블(employee) 컬럼명 salary는 급여를 뜻한다. 각 직원의 연봉을 계산하여 사원번호, 이름, 급여, 연봉이 추출되도록 쿼리문을 작성하시오.
    select eno, ename, salary, salary * 12 "연봉" from employee;
    
-- 연봉은 급여와 보너스(commission)를 이용하여 계산할 것.
    select eno, ename, salary, salary * 12 + commission "연봉" from employee;  -- 산술식은 null이 계산되지 않는다.

-- NVL(commission, 0)
    select eno, ename, salary, salary * 12 + nvl(commission, 0) "연봉" from employee;
    select eno, ename, salary, salary * 12 + nvl(commission, 0) "연 봉" from employee;
    
-- 비교연산자(관계연산자) : =(같다), !=, <>, ^=(같지않다), >, >=, <, <=
-- Q1. 급여가 1500이상인 사원의 정보 추출
    select * from employee
    where salary >= 1500;

-- Q2. 부서번호가 10인 사원의 정보 추출
    select * from employee
    where dno = 10;

-- Q3. SCOTT 사원의 정보 추출
    select * from employee
    where ename = 'SCOTT';

-- Q4. 1981년 전에 입사한 직원의 정보 추출
    select * from employee
    where hiredate < '81/01/01';

-- 논리연산자 : 하나 이상의 수식을 연결하여 계산할 때
-- AND : 모든 조건이 다 참이어야 참이된다. 모두, ~이고
-- OR : 조건 중 하나라도 참이면 결과가 참이된다. 이거나, 또는, 어느 것 하나라도
-- NOT : 단항연산자
-- Q1. 부서번호가 10이고 직급이 'MANAGER'인 사원의 정보 추출
    select * from employee
    where dno = 10 and job = 'MANAGER';
    
-- Q2. 부서번호가 10이거나 직급이 'MANAGER'인 사원의 정보 추출
    select * from employee
    where dno = 10 or job = 'MANAGER';

-- Q3. 부서번호가 10이 아닌 사원의 정보 추출
    select * from employee
    where dno <> 10;

-- Q4. 급여가 1000에서 1500사이의 직원 정보 추출
    select * from employee
    where salary between 1000 and 1500;

-- Q5. 급여가 1000 미만이거나, 1500 초과인 직원의 정보 추출
    select * from employee
    where salary not between 1000 and 1500;

-- Q6. 커미션이 300이거나 500이거나 1400인 사원의 정보 추출
    select * from employee
    where commission in (300, 500, 1400);

-- LIKE 연산자 : 와일드카드 문자(대체문자, 만능문자), _, %
-- Q1. 사원의 이름이 'F'로 시작하는 사원의 정보 추출
    select * from employee
    where ename like 'F%';
    
    select * from employee
    where substr(ename, 1, 1) = 'F';

-- Q2. 이름에 'M'이 포함된 사원의 정보 추출
    select * from employee
    where ename like '%M%';
    
    select * from employee
    where instr(ename, 'M') != 0;

-- Q3. 이름이 'N'으로 끝나는 사원의 정보 추출
    select * from employee
    where ename like '%N';
    
    select * from employee
    where substr(ename, -1, 1) = 'N';

-- Q4. 이름의 두번째 글자가 'A'인 사원의 정보 추출
    select * from employee
    where ename like '_A%';
    
    select * from employee
    where substr(ename, 2, 1) = 'A';

-- Q5. 이름의 세번째 글자가 'A'인 사원의 정보 추출
    select * from employee
    where ename like '__A%';
    
    select * from employee
    where substr(ename, 3, 1) = 'A';

-- Q6. 이름에 'A'를 포함하지 않는 직원의 정보 추출
    select * from employee
    where ename not like '%A%';
    
-- is null / is not null
    select ename, commission from employee;
    
-- 보너스를 받는 직원의 정보만 추출
    select ename, commission from employee where commission is not null;
    select ename, commission from employee where commission is null;
    
-- order by : 주어진 컬럼을 기준으로 오름차순(asc)/내림차순(desc) 정렬하여 추출할 때 사용
-- Q1. 직원의 급여를 기준으로 오름차순 정렬하여 추출하시오.
    select * from employee
    order by salary;

-- Q2. 직원의 부서번호를 기준으로 오름차순, 정렬 결과에서 급여를 기준으로 내림차순 정렬하여 추출
    select * from employee
    order by dno asc, salary desc;

-- Q3. 가장 최근에 입사한 직원순으로 추출
    select * from employee
    order by hiredate desc;

-- 문자 함수 : 문자(한글화), 문자열(단어)
-- upper(문자데이터), lower(문자데이터), initcap(문자데이터)
-- length(문자데이터), lengthb(문자데이터)
-- concat = ||
-- substr(문자데이터, 시작위치, 글자수), substrb
-- instr(문자데이터, 글자) → 0(거짓)과 1(참), 문자열에서 문자가 있는 위치 값을 반환하는 함수
-- lpad(left padding) : 왼쪽에 생긴 공백의 크기만큼 특정 문자로 채우는 함수
-- rpad(right padding)

    select * from employee;
    select lpad(salary, 10, '*') from employee;
    select rpad(salary, 10, '*') from employee;
    
    select ltrim(lpad(salary, 10, ' ')) from employee;
    
-- trim : 공백을 제거하는 함수
-- LTRIM(문자데이터) : 왼쪽 공백 제거
-- RTRIM(문자데이터)
    select '   Oracle' from dual;
    select ltrim('   Oracle') from dual;
    
-- 그룹함수 : 하나 이상의 행을 묶어서 연산을 수행하는 함수, 하나의 결과를 추출한다.    
-- sum(컬럼명) : 해당 컬럼 값들의 총합을 구하는 함수
-- avg(컬럼명)
-- max(컬럼명)/min(컬럼명)
-- count(컬럼명) : 해당 컬럼의 null값이 아닌 행의 수를 반환, count(*) : 해당 테이블의 레코드 수를 반환
    select count(ename) from employee;
    select count(*) from employee;
    select count(commission) from employee;
    
-- group by 절 : 특정 컬럼을 기준으로 그룹화하는 것

-- 사원테이블의 직원 급여의 총합을 추출하시오.
    select sum(salary) from employee;
    
-- 부서별 급여의 총합을 추출하되, 부서번호와 급여의 총합이 표시되도록 하시오.
    select dno, sum(salary) from employee
    group by dno;
    
-- 소속부서별 평균 급여를 추출하시오
    select dno, round(avg(salary),2) from employee
    group by dno;

-- 부서별 사원수와 커미션을 받는 사원의 수가 추출되도록 쿼리문을 기술하시오.
-- 부서번호 / 부서별 사원 수/ 커미션 받는 사원 수
    select dno 부서, count(eno) 사원수, count(commission) 커미션
    from employee
    group by dno;

-- 직군(job)의 종류의 개수를 추출하시오.
    select job, count(job) from employee
    group by job;
    
    select count(distinct job) from employee;
    select distinct job from employee;
    
-- Having 절 : group by 절에 의해 생성된 결과값을 대상으로 원하는 조건에 만족하는 자료만 추출할 때
-- Q1. 부서별 평균 급여가 2000이상인 부서의 번호와 부서별 평균 급여를 추출하시오.
    select dno, round(avg(salary), 2)
    from employee
    group by dno
    having avg(salary) >= 2000;

-- Q2. 부서별 최대급여와 최소급여를 추출하되, 최대급여가 2900이상인 부서만 추출하시오.
    select dno, max(salary), min(salary)
    from employee
    group by dno
    having max(salary) >= 2900;
    
-- 다중 그룹 - 소계
    select dno, job, count(*), sum(salary)
    from employee
    group by dno, job
    order by dno, job;
    
-- 조인(JOIN) : 여러 테이블을 연결하여 사용자가 원하는 정보를 추출하도록 도와주는 기능
-- 카디션 곱, equi(등가 조인), non-equi(비등가조인), self, outer 
-- 실무에서는 내부조인(equi join)과 외부조인(outer join)
-- INNER join : 내부 조인, 특정 컬럼을 기준으로 정확하게 일치하는 행들만 추출하는 join(교집합) = equi join
    select * 
    from employee e inner join department d -- join으로도 작성 가능
    on e.dno = d.dno;
    
-- OUTER join : 외부 조인, 일치하지 않는 값도 추출
-- left outer join
-- left outer join-(left only)
-- right outer join
-- right outer join-(right only)

    create table food_a(id number(1) primary key,
                        fname varchar2(20) not null);
    create table food_b(id number(1) primary key,
                        fname varchar2(20) not null);
    
    insert into food_a values(1, '돈까스');
    insert into food_a values(2, '삼겹살');
    insert into food_a values(3, '초밥');
    insert into food_a values(4, '곱창전골');
     
    insert into food_b values(1, '초밥');
    insert into food_b values(2, '돈까스');
    insert into food_b values(3, '칼국수');
    insert into food_b values(4, '햄버거');
    
    select * from food_a;
    select * from food_b;
    
-- inner join : join하는 두 테이블에 정확하게 일치하는 값만 추출
    select *
    from food_a a, food_b b
    where a.fname = b.fname;

    select *
    from food_a a inner join food_b b
    on a.fname = b.fname;
    
-- outer join : left outer join, A left outer join B, A는 모두 다 추출되고 B는 A에 존재하는(매핑되는) 행만 추출
    select *
    from food_a a left outer join food_b b
    on a.fname = b.fname;
    
-- left oiuter join - : left only, A left outer join B - where B.id is null
-- A 전체를 추출하되, 만일 B와 일치하는 값이 있다면 그것을 제외하고 추출
    select *
    from food_a a left outer join food_b b
    on a.fname = b.fname
    where b.id is null;
    
-- right outer join
    select *
    from food_a a right outer join food_b b
    on a.fname = b.fname;
    
-- right outer join - : right only
    select *
    from food_a a right outer join food_b b
    on a.fname = b.fname
    where a.id is null;
    
-- Q1. equi join을 이용하여 scott 사원의 부서번호와 부서명을 추출하시오.
    select d.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';

-- Q2. inner join과 on 연산자를 사용하여 사원이름과 해당 사원이 소속된 부서명 그리고 부서의 지역명을 추출하시오.
    select e.ename, d.dname, d.loc
    from employee e inner join department d
    on e.dno = d.dno;
    
    select e.ename, d.dname, d.loc
    from employee e inner join department d
    using(dno);

-- Q3. inner join과 using 연산자를 사용하여 부서번호가 10번에 해당하는 사원의 담당업무와 부서의 지역명을 추출하시오.
   select dno, job, loc
   from employee inner join department
   using(dno)
   where dno = 10;
   
   select e.dno, job, loc
   from employee e, department d
   where e.dno = d.dno and e.dno=10;

-- Q4.  natural join을 사용하여 commission을 받는 사원의 이름과 부서이름, 지역명을 추출하시오.
    select ename, dname, loc
    from employee natural join department
    where commission > 0;
    
    select ename, dname, loc
    from employee e, department d
    where e.dno = d.dno and commission > 0;