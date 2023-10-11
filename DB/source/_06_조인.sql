-- JOIN(조인)
-- 하나 이상의 테이블에 모든 행을 연결하여 추출하는 카디션 곱 조인(컬럼을 더해지고, 레코드 곱해진다)
-- 공통의 컬럼을 이용하여 주어진 조건에 만족하는 레코드만 추출하는 등가 조인(Equi join) = Inner join(내부 조인), 비등가 조인(non-equi join)
-- 동일한 이름의 테이블을 여러번 참조하는 self join
-- 일반적으로 join 조건에 만족하는 자료만 추출하지만 그렇지 않은 자료를 추출할 때 Outer join(외부 조인)

-- Question 1. 사원 번호가 7788인 사원의 이름과 소속 부서명을 추출하시오.
-- 실습용 테이블 목록 확인
    select * from tab;
    
-- 실습용 테이블의 내용을 확인
    select * from department;  -- 부서 정보(부서 번호, 부서명, 부서 위치)
    select * from employee;  -- 사원 정보(사번, 이름, 직급, 상관, 입사일, 급여, 보너스, 부서 번호)
    select * from salgrade;  -- 급여의 등급(등급, 최저 급여, 최고 급여)
    
-- step 1. 사원 번호가 7788에 해당하는 사원의 정보를 추출
    select * from employee where eno = 7788;
    select dno from employee where eno = 7788;
    
-- step 2. 위에서 얻어낸 부서 번호를 이용하여 부서명을 추출
    select dname from department where dno = 20;
    
-- join : 하나 이상의 테이블을 연결하여 원하는 조건에 만족하는 정보를 추출하는 기능
    select ename, dname
    from employee, department;  -- join 조건이 존재하지 않는 join = 카디션 곱 조인

    select e.ename, d.dname
    from employee e, department d
    where e.dno = d.dno and e.eno = 7788;  -- join하는 두 테이블에 공통의 이름의 컬럼을 가지고 있을 때 반드시 테이블명을 명시해야 한다.
    
-- join 조건에 해당하는 컬럼을 담는 using 함수
    select e.ename, d.dname
    from employee e join department d
    using(dno)
    where e.eno = 7788;   
   
-- non-euqi join : 비등가 조인, <>, !=, ^=, >, >=, <, <= 연산자를 이용한 join
-- Question 2. 사원별로 이름과 급여 그리고 급여등급을 추출하시오.
    select ename, salary, grade
    from employee, salgrade
    where salary >= losal and salary <= hisal;  -- non-equi join

    select ename, salary, grade
    from employee, salgrade
    where salary between losal and hisal;
    
-- Question 3. 사원의 이름과 소속된 부서의 이름 그리고 급여, 급여 등급을 추출하시오.
    select ename, dname, salary, grade
    from employee e, department d, salgrade s
    where e.dno = d.dno and salary between losal and hisal;

-- slef join : 자기 자신과 조인을 수행하는 join
-- 조인 대상 테이블이 자기 자신이라는 것만 제외하면 equi join과 동일하다.
-- Question 4. 사원의 이름과 직속 상관의 이름을 추출하시오. 사원 테이블의 manager 컬럼을 활용
-- manager 컬럼은 해당 사원의 직속 상관의 사원 번호를 나타낸다.
    select e.ename 사원이름, m.ename 상관이름
    from employee e, employee m
    where e.manager = m.eno;

    select e.ename 사원이름, m.ename 상관이름
    from employee e, employee m
    where e.manager = m.eno(+);  -- right outer join
    
    
-- test 1. SCOTT 사원의 부서번호와 부서명을 추출하시오.
    select e.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';
    
-- test 2. 사원의 이름과 소속된 부서명 그리고 부서의 위치를 추출하시오.
    select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno;
    
-- test 3. 부서번호가 10에 해당하는 사원들의 직급을 추출하시오.
    select e.job
    from employee e, department d
    where e.dno = d.dno and e.dno = 10;

-- test 4. 커미션을 받는 사원의 이름과 부서 이름, 부서 지역명을 추출하시오.
    select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno and commission is not null;

-- test 5. 사원명에 'A'가 포함된 사원의 이름과 부서명을 추출하시오.
    select e.ename, d.dname
    from employee e, department d
    where e.dno = d.dno and e.ename like '%A%';

-- test 6. NEW YORK에서 근무하는 사원의 이름과 직급 그리고 부서번호와 부서명을 추출하시오.
    select e.ename, e.job, e.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and d.loc = 'NEW YORK';

-- test 7. 사원 이름, 사원 번호, 상관 이름. 상관 번호를 추출하시오.
    select e1.ename 사원이름, e1.eno 사원번호, e2.ename 상관이름, e2.eno 상관번호
    from employee e1, employee e2
    where e1.manager = e2.eno;