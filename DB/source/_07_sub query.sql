-- 서브 쿼리(sub query) : join을 확장한 개념
-- select문 안에 또 다른 select문을 담을 때 이것을 서브 쿼리라고 부른다.
-- 서브 쿼리는 해당 쿼리의 결과값의 개수에 따라 단일행 서브 쿼리, 다중행 서브 쿼리로 나눈다.
-- 다중행 서브 쿼리는 반드시 다중행 연산자와 함께 사용해야 한다. (in, any=some, all)
-- 반드시 서브 쿼리를 괄호 안에 묶어서 기술한다.
-- 서브 쿼리는 등호(=) 우측에 기술한다.
-- 서브 쿼리는 메인 쿼리가 실행되기 전에 먼저 한 번 수행한다.

-- Question 1. SCOTT 사원보다 급여를 많이 받는 사원을 추출하시오.
    select * from employee;

-- step 1. SCOTT의 급여를 먼저 추출한다.
    select salary
    from employee
    where ename = 'SCOTT';  -- 3000
    
-- step 2. 추출된 SCOTT의 급여를 기준으로 다른 사원의 급여와 비교하여 결과를 추출한다.
    select *
    from employee
    where salary > 3000;
    
    select *
    from employee
    where salary > (select salary
                    from employee
                    where ename = 'SCOTT');  -- 단일행 서브 쿼리
                    
-- Question 2. SCOTT과 동일한 부서에서 근무하는 사원의 정보를 추출하시오.
-- step 1. SCOTT의 부서 번호를 추출
    select dno
    from employee
    where ename = 'SCOTT';  -- 20

-- step 2. 추출된 부서 번호와 일치하는 사원의 정보를 추출
    select *
    from employee
    where dno = '20';
    
    select *
    from employee
    where dno = (select dno
                 from employee
                 where ename = 'SCOTT');
                 
-- Question 3. 최소급여를 받는 사원의 이름, 직급, 급여를 추출하시오.
    select ename, job, salary
    from employee
    where salary = (select min(salary) from employee);
    
-- Question 4. 30번 부서에 속한 직원 중 최소급여를 받는 사원의 급여보다 더 큰 급여를 받는 부서의 번호와 최소급여를 추출하시오.
-- step 1. 부서 번호가 30번인 직원들의 급여 중 최소 급여 추출
    select min(salary)
    from employee
    where dno = 30;  -- 950

-- step 2. 부서별 최소 급여를 구한 다음 950보다 큰 부서의 번호와 최소 급여를 추출한다.
    select dno, min(salary)
    from employee
    group by dno
    having min(salary) > (select min(salary) from employee where dno = 30);

-- 조건절 : where절과 having절(그룹별로 묶어놓은 결과를 기준으로 조건을 담는다)

    select dno, salary
    from employee
    where salary > (select min(salary) from employee where dno = 30);
    
-- Question 5. 부서별 최소 급여를 받는 사원의 사원 번호와 이름을 추출하시오.
-- step 1. 부서번호와 부서별 최소 급여를 추출한다.
    select dno, min(salary)
    from employee
    group by dno;  -- 다중행 결과 값
    
-- step 2. 다중행 서브 쿼리 기술
    select eno, ename
    from employee
    where salary in (select min(salary)
                     from employee
                     group by dno);  -- 반드시 다중행 연산자와 함께 사용한다.
                     
-- 직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN보다 낮은 사원의 정보를 추출하시오.
-- step 1. 직급이 SALESMAN인 사원들의 급여를 추출한다.
    select salary from employee where job = 'SALESMAN';
    
-- step 2. 직급이 SALESMAN이 아닌 직원들의 급여를 위에 구한 결과값과 비교하여 결과를 추출한다.
    select *
    from employee
    where salary < any (select salary from employee where job = 'SALESMAN')  -- 1600보다
    and job <> 'SALESMAN';
    
    select *
    from employee
    where salary < all (select salary from employee where job = 'SALESMAN')  -- 1250보다
    and job <> 'SALESMAN';