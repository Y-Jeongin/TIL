-- 함수(Function) : 반복적으로 수행하는 기능이나 명령어를 하나의 이름으로 묶어서 관리하는 자료 구조
-- 함수는 반복적으로 사용되는 기능이나 명령어를 하나의 이름으로 묶어서 사용하도록 만들어진 명령어 집단
-- SQL 함수 : 숫자 함수, 문자 함수, 날짜 함수, 형변환 함수, NVL, …….

-- 1. DUAL 테이블 : 한 행의 결과값을 추출하기 위한 테이블, Oracle에서 만들어놓은 가상의 테이블
-- 2. 숫자 함수 : 숫자 데이터를 처리하기 위한 함수
-- ABS(숫자 데이터) : 절댓값을 구하는 함수
-- Question 1. -7에 대한 절댓값을 추출하시오.
    select -7, ABS(-7) from dual;
    
-- as : 별칭 
    select -7 as "데이터", ABS(-7) as "절댓값" from dual;
    
-- FLOOR(숫자 데이터) : 소숫점 아래를 버리는 함수
-- Question 2. 42.69547 데이터의 소숫점 아래를 지우고 추출하시오.
    select 42.69547, floor(42.69547) from dual;

-- ROUND(숫자 데이터, 자릿수)    
-- 자릿수를 생략하면 0으로 간주한다.
-- 자릿수가 음수일 경우 일단위 → 십단위 → 백단위 순으로 반올림된다.
    select 42.69547, round(42.69547) from dual;

-- Question 3. 34.56789 숫자를 -1의 자리에서 반올림 처리하여 추출하시오.
    select 34.56789, round(34.56789, -1) from dual;

-- MOD(숫자 데이터, 나눌수) : 나머지를 추출하는 함수
    select 27, mod(27,2), mod(27,5), mod(27,7) from dual;

-- 3. 문자 함수 : 문자 데이터를 처리하는 함수
-- UPPER(문자 데이터) : 대문자로 변환하는 함수
    select 'Welcome to Oracle' "원본 데이터", upper('Welcome to Oracle') "upper 적용 후" from dual;
    
-- LOWER(문자 데이터) :  소문자로 변환하는 함수
    select 'Welcome to Oracle' "원본 데이터", lower('Welcome to Oracle') "lower 적용 후" from dual;
    
 -- INITCAP(문자 데이터) : 이니셜만 대문자로 변환하는 함수, 첫글자만 대문자로 변환하는 함수
    select 'welcome to oracle', initcap('welcome to oracle') from dual;
    
-- LENGTH(문자 데이터) : 문자 길이를 추출하는 함수, 글자 수
-- 문자 : 숫자, 영문자, 특수문자(1byte) / 한글, 한자(보통 2-3byte)
    select length('oracle'), length('오라클') from dual;

-- LENGHB(문자 데이터) : 문자의 바이트를 추출하는 함수
    select lengthb('oracle'), lengthb('오라클') from dual;  -- 한글(unicode - 한 글자 당 3byte)

-- INSTR(문자 데이터, 문자) : 특정 문자의 위치를 추출하는 함수
-- 'Welcome to Oracle'에서 'O'가 저장된 위치 값을 추출하는 쿼리문을 작성하시오. 
    select instr('Welcome to Oracle', 'O') from dual;
    
-- SUBSTR / SUBSTRB
-- SUBSTR(문자 데이터, 시작 위치, 글자 수) : 문자열에서 시작 위치에서 글자 수만큼 추출하는 함수
-- 인덱스(위치값) 4부터 시작해서 문자 3개를 추출하는 쿼리문을 작성하시오.
-- 오라클 / R에서 인덱스의 시작 값은 1부터 시작한다. 나머지는 0부터 시작
    select substr('Welcome to Oracle',4,3) from dual;
    
-- Question 4. 사원 정보를 가지고 있는 테이블 employee에서 직원의 입사연도와 입사한 달만 추출하는 쿼리문을 작성하시오.
-- 직원 이름과 입사연도, 입사월만 추출하도록 구현하시오. (예 : 1980 12)
    select ename, 19 || substr(hiredate,1,2) "년도", substr(hiredate,4,2) "달"
    from employee;
    
-- Question 5. 위 코드를 활용하여 9월에 입사한 직원만 추출하는 쿼리문을 기술하시오.
    select ename, 19 || substr(hiredate,1,2) "년도", substr(hiredate,4,2) "달"
    from employee
    where substr(hiredate, 4, 2) = '09';
    
-- 4. 날짜 함수 :  date형에 사용하는 함수
-- 결과값으로 날짜 또는 기간을 얻는다. 이때 기간은 주로 일단위 계산된다.
-- 날짜 + 숫자, 날짜 - 숫자, 날짜 - 날짜

-- SYSDATE : 현재 시스템에 등록된 날짜를 반환하는 함수
    select sysdate from dual;
    
-- Question 6. sysdate를 활용하여 어제 날짜, 오늘 날짜, 내일 날짜를 추출하는 쿼리문을 구현하시오.
    select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;

-- MONTHS_BETWEEN(날짜1, 날짜2) : 두 날짜 사이(날짜1-날짜2)의 개월 수를 구하는 함수
-- Question 7. 직원들의 근무 개월 수를 추출하는 쿼리문을 기술하시오.
    select ename, sysdate, hiredate, months_between(sysdate,hiredate) 근무개월수 
    from employee;

    select ename, sysdate, hiredate, floor(months_between(sysdate,hiredate)) 근무개월수 
    from employee;

-- ADD_MONTHS : 특정 개월 수를 더한 날짜를 추출하는 함수
-- Question 8. 직원들의 입사 4개월 후의 날짜를 추출하시오.
    select ename, hiredate, add_months(hiredate, 4)
    from employee;
    
-- 5. 형변환 함수(숫자형, 문자형, 날짜형)
-- Number ↔ Character(varchar2, char) / Character ↔ Date
-- TO_NUMBER(), TO_CHAR(), TO_DATE()
-- 일반적으로 날짜를 문자 데이터 형태로 변환하여 표시하는 경우가 많다.
-- YYYY/YY, MM, MON(월-영어 표시), DAY

-- to_char() : 날짜 또는 숫자를 문자형으로 변환하는 함수
    select sysdate from dual;
    
    select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;

-- Question 9. 직원들의 입사일을 년도-월-일로 표시하되, 뒤에 요일도 추출되도록 구현하시오.
    select ename, hiredate, to_char(hiredate, 'YYYY-MM-DD DAY')
    from employee;
   
    
-- select 확장형 : 그룹 함수(Group by)와 그룹별 정렬(having)
-- 그룹 함수 : 하나 이상의 행을 그룹으로 묶어서 연산을 수행하고, 하나의 결과를 추출하는 함수
-- 단일행 함수 : 하나의 결과만 추출하는 함수
-- 다중행 함수 : 여러 개의 결과를 추출하는 함수, 별도의 함수를 사용하여 처리한다.

-- SUM(컬럼명) : 해당 컬럼의 값들의 총합을 추출하는 함수
-- Question 10. 직원들의 급여의 총합을 추출하되, 천단위 이하를 반올림하여 추출하도록 구현하시오.
    select ename, salary, round(salary, -3) "OVER" from employee;
    
    select sum(salary) from employee;
    
    select round(sum(salary), -3) from employee;

-- Question 11. commission의 총합을 추출하시오.
    select sum(commission) from employee;  -- 그룹 함수에서 null값은 제외됨

-- AVG(컬럼명) : 해당 컬럼의 값들의 평균을 추출하는 함수
-- Question 12. 직원 급여의 총평균을 추출하시오.
    select round(avg(salary),2) from employee;
    
-- MAX(컬럼명) / MIN(컬럼명) : 해당 컬럼의 최댓값과 최솟값을 구하는 함수
-- Question 13.  직원들의 급여 중 가장 높은 급여와 가장 낮은 급여를 추출하시오.
    select max(salary), min(salary) from employee;
    
-- Question 14. 가장 높은 급여를 받는 직원의 이름과 급여를 추출하시오.
    select ename, salary
    from employee
    where salary = max(salary);  -- 그룹 함수 사용 불가
    
    select ename, salary
    from employee
    where salary = (select max(salary) from employee);  -- 서브 쿼리
    
 -- COUNT(컬럼명) : 해당 컬럼에 개수를 반환하는 함수, null값은 계산하지 않는다.
 -- Question 15. 직원의 수를 추출하시오.
    select count(*) from employee;
    
    select count(commission) from employee;  -- null 값 제외
    
-- Question 16. 담당 직급(job)의 개수를 추출하시오.
    select count(distinct job) from employee;

-- Question 17. 부서의 개수를 추출하시오.
    select count(distinct dno) from employee;
    
-- GROUP BY절 : 특정 컬럼을 기준으로 그룹화하여 계산을 수행한다.
-- 그룹 함수와 함께 사용한다.
-- Question 18. 부서별 직원의 급여의 총합을 추출하시오.
    select dno, sum(salary) 
    from employee
    group by dno;
    
-- Question 19. 직급별 급여의 총합과 평균을 추출하되, 해당 직급도 표시하시오.
    select job, sum(salary), round(avg(salary), 1)
    from employee
    group by job;

-- Question 20. 각 부서별 인원수와 보너스를 받는 직원의 수를 추출하시오.
    select dno, count(*), count(commission)
    from employee
    group by dno;
    
-- HAVIGN절 : GROUP BY에 의해 생성된 결과에 조건을 담을 때 사용한다.
-- Question 21. 부서 번호가 30번에 해당하는 직원들의 직급별 급여의 합을 추출하시오.
    select job, sum(salary)
    from employee
    where dno = 30
    group by job; 

-- Question 22. 부서별 평균 급여가 2000 이상인 부서의 번호와 평균 급여를 추출하시오.
    select dno, round(avg(salary), 1)
    from employee
    group by dno
    having avg(salary) >= 2000;

-- Question 23. 부서의 최대 급여와 최소 급여를 추출하되, 최대 급여가 2900이상인 부서만 추출하시오.
-- 부서번호와 최대 급여, 최소 급여를 추출하시오.
    select dno, max(salary), min(salary)
    from employee
    group by dno
    having max(salary) >= 2900;
    
-- 조인(JOIN) : 하나 이상의 테이블을 묶어 마치 하나의 테이블인 것 처럼 사용하는 기능
-- 데이터베이스는 하나의 테이블에 모든 데이터를 담지 않고 여러 테이블로 나누어 분산처리한다. 이때 각 테이블끼리 특정 규칙이나 관계가 있도록 설계된다.
-- 여러 테이블에 흩어져 있는 데이터를 사용자가 원하는 데이터를 모두 찾아 추출하기 위해 여러 테이블을 조회해아 한다. 그래서 등장한 기능이 JOIN이다.

-- Question 24. SCOTT의 부서명을 추출하시오.
-- step 1. scott의 부서 번호 확인
    select dno
    from employee
    where ename = 'SCOTT';
    
-- step 2. 20번에 해당하는 부서명을 추출
    select dname 
    from department
    where dno = 20;

-- 조인의 종류 : CARTESIAN PRODUCT(카디션 곱), EQUI JOIN, NON-EQUI JOIN, SELF JOIN, OUTER JOIN
-- CARTESIAN PRODUCT(카디션 곱) : 서로 다른 두개의 테이블을 연결할 때 특정 컬럼에 의해 조인되지 않고 모든 데이터를 결과로 나타내는 경우
-- 결과 : 컬럼 수는 더해지고, 행의 수는 곱해진 결과를 추출한다.
    select * from employee;  -- 직원 정보(행의 수 14, 컬럼 수 8)
    
    select * from department;  -- 부서 정보(행의 수 4, 컬럼 수 3)
    
    select *
    from employee, department;  -- join, 매개체 없이 조인
    
-- EQUI JOIN : 연결할 두 데이터에 공통적으로 존재하는 컬럼의 값이 일치하는 행만 연결하여 결과를 생성하는 조인 = INNER JOIN
-- 비교 연산자 : =, <>, !=, ^=, >, >=, <, <=  -- =을 뺀 머지는 NON-EQUI JOIN
-- Question 25. 직원 정보를 추출하되 각 사원의 소속부서에 대한 정보를 함께 추출되도록 구현하시오.
    select *
    from employee e, department d
    where e.dno = d.dno;

-- Question 26. SCOTT의 부서명을 추출하시오.
    select e.dno, ename, dname  -- 두개의 테이블이 공통으로 가지고 있는 컬럼명의 경우, 어떠한 테이블의 컬럼명인지 명시해주어야 한다.
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';

-- NON-EQUI JOIN : 동일한 컬럼이 없이 다른 조건을 사용하여 조인할 때 쓰인다.
    select * from salgrade;
    
-- Question 27. 각 직원의 급여가 몇 등급에 해당하는지를 추출하시오.
-- 단, 직원 이름, 급여, 등급이 표시되도록 구현할 것.
    select ename, salary, grade
    from employee e, salgrade s
    where salary <= hisal and salary >= losal; 

    select ename, salary, grade
    from employee e, salgrade s
    where salary between losal and hisal;
    
-- Question 28. 직원의 이름, 소속 부서명, 급여 등급을 추출하시오.
    select e.ename, d.dname, s.grade
    from employee e, department d, salgrade s
    where e.dno = d.dno 
    and e.salary between s.losal and s.hisal;
    
-- SELF JOIN : 자기 자신과의 조인을 수행하는 기법
     select * from employee;
     
-- Question 29. ALLEN의 직속상관의 이름을 추출하시오.
-- step 1. ALLEN의 manager 값을 얻어온다.
    select ename, manager
    from employee
    where ename = 'ALLEN';

-- step 2. manager의 값과 일치하는 eno를 가지고 있는 사원의 이름을 추출한다.
    select ename
    from employee
    where eno = 7698;
    
    select mag.ename
    from employee emp, employee mag
    where emp.ename = 'ALLEN' 
    and emp.manager = mag.eno;
     
--  Quesstion 30. 직원의 이름과 직속 상관의 이름을 추출하는 프로그램을 구현하시오.
    select emp.ename 직원명, mag.ename 직속상관명
    from employee emp, employee mag
    where emp.manager = mag.eno;
    
-- OUTER JOIN : 조인 조건에 만족하지 않는 값도 추출하는 기법
    select emp.ename 직원명, mag.ename 직속상관명
    from employee emp, employee mag
    where emp.manager = mag.eno(+);
    
-- 서브 쿼리(SUB QUERY) : 쿼리 안에 또 다른 쿼리를 담아서 표현하는 기법
-- 하나의 select 구문 내에 포함된 또 다른 select 문장을 뜻한다.
-- 비교 연산자의 오른쪽에 기술해야하고, 반드시 괄호로 묶어줘야 한다.
-- 메인 쿼리가 실행되기 전에 먼저 한번만 실행된다.
-- 종류 : 단일행 서브 쿼리, 다중행 서브 쿼리

-- 단일행 서브 쿼리 : 서브 쿼리의 실행 결과가 오직 하나의 행만 반환된다.
-- 비교 연산자 : =, <>, !=, ^=, >, >=, <, <=

-- Question 31. SCOTT의 부서명을 추출하시오.
-- equi join 실행 예시
    select dept.dname
    from employee emp, department dept
    where emp.ename = 'SCOTT' and emp.dno = dept.dno;
    
-- step 1. SCOTT의 부서 번호 추출
    select dno
    from employee
    where ename = 'SCOTT';  -- 20

-- step 2. 20번에 해당하는 부서명 추출
    select dname
    from department
    where dno = 20;
    
-- 서브 쿼리
    select dname
    from department
    where dno = (select dno
                          from employee 
                          where ename = 'SCOTT');
    
 -- Question 32. 직원들의 평균 급여보다 더 적은 급여를 받는 사원의 이름과 급여를 추출하시오.
 -- step 1. 직원들의 평균 급여 추출
    select round(avg(salary), 1) from employee;  -- 2073.2
    
-- step 2. 평균 급여보다 적은 사원 정보 추출
    select ename, salary
    from employee
    where salary < 2073.2;
 
    select ename, salary
    from employee
    where salary < (select round(avg(salary), 1)
                              from employee);
                               
-- Question 33. SCOTT과 급여가 동일하거나 더 많이 받는 사원의 이름과 급여를 추출하시오.
-- step 1. SCOTT의 급여 추출
    select salary
    from employee
    where ename = 'SCOTT';

-- step 2. 급여가 3000과 같거나 더 많은 사원의 정보를 추출
    select ename, salary
    from employee
    where salary >= 3000;

-- 서브 쿼리
    select ename, salary
    from employee
    where salary >= (select salary
                               from employee
                               where ename = 'SCOTT');
    
-- Question 34. 부서 번호가 20번에 해당하는 사원 중에 전체 사원 급여의 평균보다 높은 급여를 받는 사원의 이름과 급여, 부서명을 추출하시오.
    select e.ename, e.salary, d.dname
    from employee e, department d
    where e.dno = d.dno and e.dno = 20 and e.salary >= (select avg(salary) from employee) ;
    
-- 다중행 서브 쿼리 : 서브 쿼리의 결과값이 하나 이상에 해당하는 쿼리
-- 반드시 다중행 연산자와 함께 사용해야 한다.
-- IN : 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중 어느것 하나라도 일치하면 참이 되는 연산자
-- Question 35. 급여가 3000 이상인 직원과 동일한 부서에서 근무하는 사원들의 이름, 급여, 부서 번호를 추출하시오.
-- step 1. 급여가 3000 이상인 직원의 부서 번호를 추출한다.
    select dno
    from employee
    where salary >= 3000;
    
-- step 2. 부서 번호가 10이거나 20에 해당하는 직원 중 급여가 3000 이상인 직원의 정보 추출
    select ename, salary, dno
    from employee
    where dno = 10 or dno = 20;
    
    select ename, salary, dno
    from employee
    where dno in (select dno
                           from employee
                           where salary >= 3000);
                          
-- 부서 번호가 10이거나 20에 해당하는 사원의 정보를 추출하시오.
    select *
    from employee
    where dno = 10 or dno = 20;
    
    select *
    from employee
    where dno in(10, 20);

-- ANY, SOME : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면 참이 되는 연산자
-- < ANY : 찾아진 값에 대해서 하나라도 크면 참이 되는 연산자, 최솟값을 반환하는 것과 같은 의미
-- > ANY : 찾아진 값에 대해서 하나라도 작으면 참이 되는 연산자, 최댓값을 반환하는 것과 같은 의미

-- Question 36. 부서 번호가 30인 사원 중 급여가 가장 작은 사원보다 높은 급여를 받는 사원의 이름과 급여를 추출하시오.
-- step 1. 부서 번호가 30에 해당하는 사원의 급여 추출
    select salary
    from employee
    where dno =  30;  -- 950(최소 급여)
    
 -- step 2. 급여가 950보다 높은 사원의 이름과 급여 추출
    select ename, salary
    from employee
    where salary > 950;
       
    select ename, salary
    from employee
    where salary > any (select salary
                                     from employee
                                     where dno = 30);
    
    select ename, salary
    from employee
    where salary < any (select salary
                                     from employee
                                     where dno = 30);    
    
-- Question 37. 부서 번호가 30인 사원들 중에 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 추출하시오.
-- step 1. 부서 번호가 30인 사원의 급여 정보 추출
    select salary
    from employee
    where dno = 30;  -- 2850(최대 급여)
    
-- step 2. 급여가 2850보다 큰 직원의 정보 추출
    select ename, salary
    from employee
    where salary > 2850;

    select ename, salary
    from employee
    where salary  > all (select salary 
                                    from employee
                                    where dno = 30);

-- 단일행 서브 쿼리    
    select ename, salary
    from employee
    where salary  > (select min(salary) 
                               from employee
                               where dno = 30); 