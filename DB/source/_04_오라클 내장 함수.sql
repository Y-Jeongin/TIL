-- �Լ�(Function) : �ݺ������� �����ϴ� ����̳� ��ɾ �ϳ��� �̸����� ��� �����ϴ� �ڷ� ����
-- �Լ��� �ݺ������� ���Ǵ� ����̳� ��ɾ �ϳ��� �̸����� ��� ����ϵ��� ������� ��ɾ� ����
-- SQL �Լ� : ���� �Լ�, ���� �Լ�, ��¥ �Լ�, ����ȯ �Լ�, NVL, ����.

-- 1. DUAL ���̺� : �� ���� ������� �����ϱ� ���� ���̺�, Oracle���� �������� ������ ���̺�
-- 2. ���� �Լ� : ���� �����͸� ó���ϱ� ���� �Լ�
-- ABS(���� ������) : ������ ���ϴ� �Լ�
-- Question 1. -7�� ���� ������ �����Ͻÿ�.
    select -7, ABS(-7) from dual;
    
-- as : ��Ī 
    select -7 as "������", ABS(-7) as "����" from dual;
    
-- FLOOR(���� ������) : �Ҽ��� �Ʒ��� ������ �Լ�
-- Question 2. 42.69547 �������� �Ҽ��� �Ʒ��� ����� �����Ͻÿ�.
    select 42.69547, floor(42.69547) from dual;

-- ROUND(���� ������, �ڸ���)    
-- �ڸ����� �����ϸ� 0���� �����Ѵ�.
-- �ڸ����� ������ ��� �ϴ��� �� �ʴ��� �� ����� ������ �ݿø��ȴ�.
    select 42.69547, round(42.69547) from dual;

-- Question 3. 34.56789 ���ڸ� -1�� �ڸ����� �ݿø� ó���Ͽ� �����Ͻÿ�.
    select 34.56789, round(34.56789, -1) from dual;

-- MOD(���� ������, ������) : �������� �����ϴ� �Լ�
    select 27, mod(27,2), mod(27,5), mod(27,7) from dual;

-- 3. ���� �Լ� : ���� �����͸� ó���ϴ� �Լ�
-- UPPER(���� ������) : �빮�ڷ� ��ȯ�ϴ� �Լ�
    select 'Welcome to Oracle' "���� ������", upper('Welcome to Oracle') "upper ���� ��" from dual;
    
-- LOWER(���� ������) :  �ҹ��ڷ� ��ȯ�ϴ� �Լ�
    select 'Welcome to Oracle' "���� ������", lower('Welcome to Oracle') "lower ���� ��" from dual;
    
 -- INITCAP(���� ������) : �̴ϼȸ� �빮�ڷ� ��ȯ�ϴ� �Լ�, ù���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�
    select 'welcome to oracle', initcap('welcome to oracle') from dual;
    
-- LENGTH(���� ������) : ���� ���̸� �����ϴ� �Լ�, ���� ��
-- ���� : ����, ������, Ư������(1byte) / �ѱ�, ����(���� 2-3byte)
    select length('oracle'), length('����Ŭ') from dual;

-- LENGHB(���� ������) : ������ ����Ʈ�� �����ϴ� �Լ�
    select lengthb('oracle'), lengthb('����Ŭ') from dual;  -- �ѱ�(unicode - �� ���� �� 3byte)

-- INSTR(���� ������, ����) : Ư�� ������ ��ġ�� �����ϴ� �Լ�
-- 'Welcome to Oracle'���� 'O'�� ����� ��ġ ���� �����ϴ� �������� �ۼ��Ͻÿ�. 
    select instr('Welcome to Oracle', 'O') from dual;
    
-- SUBSTR / SUBSTRB
-- SUBSTR(���� ������, ���� ��ġ, ���� ��) : ���ڿ����� ���� ��ġ���� ���� ����ŭ �����ϴ� �Լ�
-- �ε���(��ġ��) 4���� �����ؼ� ���� 3���� �����ϴ� �������� �ۼ��Ͻÿ�.
-- ����Ŭ / R���� �ε����� ���� ���� 1���� �����Ѵ�. �������� 0���� ����
    select substr('Welcome to Oracle',4,3) from dual;
    
-- Question 4. ��� ������ ������ �ִ� ���̺� employee���� ������ �Ի翬���� �Ի��� �޸� �����ϴ� �������� �ۼ��Ͻÿ�.
-- ���� �̸��� �Ի翬��, �Ի���� �����ϵ��� �����Ͻÿ�. (�� : 1980 12)
    select ename, 19 || substr(hiredate,1,2) "�⵵", substr(hiredate,4,2) "��"
    from employee;
    
-- Question 5. �� �ڵ带 Ȱ���Ͽ� 9���� �Ի��� ������ �����ϴ� �������� ����Ͻÿ�.
    select ename, 19 || substr(hiredate,1,2) "�⵵", substr(hiredate,4,2) "��"
    from employee
    where substr(hiredate, 4, 2) = '09';
    
-- 4. ��¥ �Լ� :  date���� ����ϴ� �Լ�
-- ��������� ��¥ �Ǵ� �Ⱓ�� ��´�. �̶� �Ⱓ�� �ַ� �ϴ��� ���ȴ�.
-- ��¥ + ����, ��¥ - ����, ��¥ - ��¥

-- SYSDATE : ���� �ý��ۿ� ��ϵ� ��¥�� ��ȯ�ϴ� �Լ�
    select sysdate from dual;
    
-- Question 6. sysdate�� Ȱ���Ͽ� ���� ��¥, ���� ��¥, ���� ��¥�� �����ϴ� �������� �����Ͻÿ�.
    select sysdate-1 ����, sysdate ����, sysdate+1 ���� from dual;

-- MONTHS_BETWEEN(��¥1, ��¥2) : �� ��¥ ����(��¥1-��¥2)�� ���� ���� ���ϴ� �Լ�
-- Question 7. �������� �ٹ� ���� ���� �����ϴ� �������� ����Ͻÿ�.
    select ename, sysdate, hiredate, months_between(sysdate,hiredate) �ٹ������� 
    from employee;

    select ename, sysdate, hiredate, floor(months_between(sysdate,hiredate)) �ٹ������� 
    from employee;

-- ADD_MONTHS : Ư�� ���� ���� ���� ��¥�� �����ϴ� �Լ�
-- Question 8. �������� �Ի� 4���� ���� ��¥�� �����Ͻÿ�.
    select ename, hiredate, add_months(hiredate, 4)
    from employee;
    
-- 5. ����ȯ �Լ�(������, ������, ��¥��)
-- Number �� Character(varchar2, char) / Character �� Date
-- TO_NUMBER(), TO_CHAR(), TO_DATE()
-- �Ϲ������� ��¥�� ���� ������ ���·� ��ȯ�Ͽ� ǥ���ϴ� ��찡 ����.
-- YYYY/YY, MM, MON(��-���� ǥ��), DAY

-- to_char() : ��¥ �Ǵ� ���ڸ� ���������� ��ȯ�ϴ� �Լ�
    select sysdate from dual;
    
    select sysdate, to_char(sysdate, 'YYYY-MM-DD') from dual;

-- Question 9. �������� �Ի����� �⵵-��-�Ϸ� ǥ���ϵ�, �ڿ� ���ϵ� ����ǵ��� �����Ͻÿ�.
    select ename, hiredate, to_char(hiredate, 'YYYY-MM-DD DAY')
    from employee;
   
    
-- select Ȯ���� : �׷� �Լ�(Group by)�� �׷캰 ����(having)
-- �׷� �Լ� : �ϳ� �̻��� ���� �׷����� ��� ������ �����ϰ�, �ϳ��� ����� �����ϴ� �Լ�
-- ������ �Լ� : �ϳ��� ����� �����ϴ� �Լ�
-- ������ �Լ� : ���� ���� ����� �����ϴ� �Լ�, ������ �Լ��� ����Ͽ� ó���Ѵ�.

-- SUM(�÷���) : �ش� �÷��� ������ ������ �����ϴ� �Լ�
-- Question 10. �������� �޿��� ������ �����ϵ�, õ���� ���ϸ� �ݿø��Ͽ� �����ϵ��� �����Ͻÿ�.
    select ename, salary, round(salary, -3) "OVER" from employee;
    
    select sum(salary) from employee;
    
    select round(sum(salary), -3) from employee;

-- Question 11. commission�� ������ �����Ͻÿ�.
    select sum(commission) from employee;  -- �׷� �Լ����� null���� ���ܵ�

-- AVG(�÷���) : �ش� �÷��� ������ ����� �����ϴ� �Լ�
-- Question 12. ���� �޿��� ������� �����Ͻÿ�.
    select round(avg(salary),2) from employee;
    
-- MAX(�÷���) / MIN(�÷���) : �ش� �÷��� �ִ񰪰� �ּڰ��� ���ϴ� �Լ�
-- Question 13.  �������� �޿� �� ���� ���� �޿��� ���� ���� �޿��� �����Ͻÿ�.
    select max(salary), min(salary) from employee;
    
-- Question 14. ���� ���� �޿��� �޴� ������ �̸��� �޿��� �����Ͻÿ�.
    select ename, salary
    from employee
    where salary = max(salary);  -- �׷� �Լ� ��� �Ұ�
    
    select ename, salary
    from employee
    where salary = (select max(salary) from employee);  -- ���� ����
    
 -- COUNT(�÷���) : �ش� �÷��� ������ ��ȯ�ϴ� �Լ�, null���� ������� �ʴ´�.
 -- Question 15. ������ ���� �����Ͻÿ�.
    select count(*) from employee;
    
    select count(commission) from employee;  -- null �� ����
    
-- Question 16. ��� ����(job)�� ������ �����Ͻÿ�.
    select count(distinct job) from employee;

-- Question 17. �μ��� ������ �����Ͻÿ�.
    select count(distinct dno) from employee;
    
-- GROUP BY�� : Ư�� �÷��� �������� �׷�ȭ�Ͽ� ����� �����Ѵ�.
-- �׷� �Լ��� �Բ� ����Ѵ�.
-- Question 18. �μ��� ������ �޿��� ������ �����Ͻÿ�.
    select dno, sum(salary) 
    from employee
    group by dno;
    
-- Question 19. ���޺� �޿��� ���հ� ����� �����ϵ�, �ش� ���޵� ǥ���Ͻÿ�.
    select job, sum(salary), round(avg(salary), 1)
    from employee
    group by job;

-- Question 20. �� �μ��� �ο����� ���ʽ��� �޴� ������ ���� �����Ͻÿ�.
    select dno, count(*), count(commission)
    from employee
    group by dno;
    
-- HAVIGN�� : GROUP BY�� ���� ������ ����� ������ ���� �� ����Ѵ�.
-- Question 21. �μ� ��ȣ�� 30���� �ش��ϴ� �������� ���޺� �޿��� ���� �����Ͻÿ�.
    select job, sum(salary)
    from employee
    where dno = 30
    group by job; 

-- Question 22. �μ��� ��� �޿��� 2000 �̻��� �μ��� ��ȣ�� ��� �޿��� �����Ͻÿ�.
    select dno, round(avg(salary), 1)
    from employee
    group by dno
    having avg(salary) >= 2000;

-- Question 23. �μ��� �ִ� �޿��� �ּ� �޿��� �����ϵ�, �ִ� �޿��� 2900�̻��� �μ��� �����Ͻÿ�.
-- �μ���ȣ�� �ִ� �޿�, �ּ� �޿��� �����Ͻÿ�.
    select dno, max(salary), min(salary)
    from employee
    group by dno
    having max(salary) >= 2900;
    
-- ����(JOIN) : �ϳ� �̻��� ���̺��� ���� ��ġ �ϳ��� ���̺��� �� ó�� ����ϴ� ���
-- �����ͺ��̽��� �ϳ��� ���̺� ��� �����͸� ���� �ʰ� ���� ���̺�� ������ �л�ó���Ѵ�. �̶� �� ���̺��� Ư�� ��Ģ�̳� ���谡 �ֵ��� ����ȴ�.
-- ���� ���̺� ����� �ִ� �����͸� ����ڰ� ���ϴ� �����͸� ��� ã�� �����ϱ� ���� ���� ���̺��� ��ȸ�ؾ� �Ѵ�. �׷��� ������ ����� JOIN�̴�.

-- Question 24. SCOTT�� �μ����� �����Ͻÿ�.
-- step 1. scott�� �μ� ��ȣ Ȯ��
    select dno
    from employee
    where ename = 'SCOTT';
    
-- step 2. 20���� �ش��ϴ� �μ����� ����
    select dname 
    from department
    where dno = 20;

-- ������ ���� : CARTESIAN PRODUCT(ī��� ��), EQUI JOIN, NON-EQUI JOIN, SELF JOIN, OUTER JOIN
-- CARTESIAN PRODUCT(ī��� ��) : ���� �ٸ� �ΰ��� ���̺��� ������ �� Ư�� �÷��� ���� ���ε��� �ʰ� ��� �����͸� ����� ��Ÿ���� ���
-- ��� : �÷� ���� ��������, ���� ���� ������ ����� �����Ѵ�.
    select * from employee;  -- ���� ����(���� �� 14, �÷� �� 8)
    
    select * from department;  -- �μ� ����(���� �� 4, �÷� �� 3)
    
    select *
    from employee, department;  -- join, �Ű�ü ���� ����
    
-- EQUI JOIN : ������ �� �����Ϳ� ���������� �����ϴ� �÷��� ���� ��ġ�ϴ� �ุ �����Ͽ� ����� �����ϴ� ���� = INNER JOIN
-- �� ������ : =, <>, !=, ^=, >, >=, <, <=  -- =�� �� ������ NON-EQUI JOIN
-- Question 25. ���� ������ �����ϵ� �� ����� �ҼӺμ��� ���� ������ �Բ� ����ǵ��� �����Ͻÿ�.
    select *
    from employee e, department d
    where e.dno = d.dno;

-- Question 26. SCOTT�� �μ����� �����Ͻÿ�.
    select e.dno, ename, dname  -- �ΰ��� ���̺��� �������� ������ �ִ� �÷����� ���, ��� ���̺��� �÷������� ������־�� �Ѵ�.
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';

-- NON-EQUI JOIN : ������ �÷��� ���� �ٸ� ������ ����Ͽ� ������ �� ���δ�.
    select * from salgrade;
    
-- Question 27. �� ������ �޿��� �� ��޿� �ش��ϴ����� �����Ͻÿ�.
-- ��, ���� �̸�, �޿�, ����� ǥ�õǵ��� ������ ��.
    select ename, salary, grade
    from employee e, salgrade s
    where salary <= hisal and salary >= losal; 

    select ename, salary, grade
    from employee e, salgrade s
    where salary between losal and hisal;
    
-- Question 28. ������ �̸�, �Ҽ� �μ���, �޿� ����� �����Ͻÿ�.
    select e.ename, d.dname, s.grade
    from employee e, department d, salgrade s
    where e.dno = d.dno 
    and e.salary between s.losal and s.hisal;
    
-- SELF JOIN : �ڱ� �ڽŰ��� ������ �����ϴ� ���
     select * from employee;
     
-- Question 29. ALLEN�� ���ӻ���� �̸��� �����Ͻÿ�.
-- step 1. ALLEN�� manager ���� ���´�.
    select ename, manager
    from employee
    where ename = 'ALLEN';

-- step 2. manager�� ���� ��ġ�ϴ� eno�� ������ �ִ� ����� �̸��� �����Ѵ�.
    select ename
    from employee
    where eno = 7698;
    
    select mag.ename
    from employee emp, employee mag
    where emp.ename = 'ALLEN' 
    and emp.manager = mag.eno;
     
--  Quesstion 30. ������ �̸��� ���� ����� �̸��� �����ϴ� ���α׷��� �����Ͻÿ�.
    select emp.ename ������, mag.ename ���ӻ����
    from employee emp, employee mag
    where emp.manager = mag.eno;
    
-- OUTER JOIN : ���� ���ǿ� �������� �ʴ� ���� �����ϴ� ���
    select emp.ename ������, mag.ename ���ӻ����
    from employee emp, employee mag
    where emp.manager = mag.eno(+);
    
-- ���� ����(SUB QUERY) : ���� �ȿ� �� �ٸ� ������ ��Ƽ� ǥ���ϴ� ���
-- �ϳ��� select ���� ���� ���Ե� �� �ٸ� select ������ ���Ѵ�.
-- �� �������� �����ʿ� ����ؾ��ϰ�, �ݵ�� ��ȣ�� ������� �Ѵ�.
-- ���� ������ ����Ǳ� ���� ���� �ѹ��� ����ȴ�.
-- ���� : ������ ���� ����, ������ ���� ����

-- ������ ���� ���� : ���� ������ ���� ����� ���� �ϳ��� �ุ ��ȯ�ȴ�.
-- �� ������ : =, <>, !=, ^=, >, >=, <, <=

-- Question 31. SCOTT�� �μ����� �����Ͻÿ�.
-- equi join ���� ����
    select dept.dname
    from employee emp, department dept
    where emp.ename = 'SCOTT' and emp.dno = dept.dno;
    
-- step 1. SCOTT�� �μ� ��ȣ ����
    select dno
    from employee
    where ename = 'SCOTT';  -- 20

-- step 2. 20���� �ش��ϴ� �μ��� ����
    select dname
    from department
    where dno = 20;
    
-- ���� ����
    select dname
    from department
    where dno = (select dno
                          from employee 
                          where ename = 'SCOTT');
    
 -- Question 32. �������� ��� �޿����� �� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
 -- step 1. �������� ��� �޿� ����
    select round(avg(salary), 1) from employee;  -- 2073.2
    
-- step 2. ��� �޿����� ���� ��� ���� ����
    select ename, salary
    from employee
    where salary < 2073.2;
 
    select ename, salary
    from employee
    where salary < (select round(avg(salary), 1)
                              from employee);
                               
-- Question 33. SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
-- step 1. SCOTT�� �޿� ����
    select salary
    from employee
    where ename = 'SCOTT';

-- step 2. �޿��� 3000�� ���ų� �� ���� ����� ������ ����
    select ename, salary
    from employee
    where salary >= 3000;

-- ���� ����
    select ename, salary
    from employee
    where salary >= (select salary
                               from employee
                               where ename = 'SCOTT');
    
-- Question 34. �μ� ��ȣ�� 20���� �ش��ϴ� ��� �߿� ��ü ��� �޿��� ��պ��� ���� �޿��� �޴� ����� �̸��� �޿�, �μ����� �����Ͻÿ�.
    select e.ename, e.salary, d.dname
    from employee e, department d
    where e.dno = d.dno and e.dno = 20 and e.salary >= (select avg(salary) from employee) ;
    
-- ������ ���� ���� : ���� ������ ������� �ϳ� �̻� �ش��ϴ� ����
-- �ݵ�� ������ �����ڿ� �Բ� ����ؾ� �Ѵ�.
-- IN : ���� ������ �� ������ ���� ������ ��� �� ����� �ϳ��� ��ġ�ϸ� ���� �Ǵ� ������
-- Question 35. �޿��� 3000 �̻��� ������ ������ �μ����� �ٹ��ϴ� ������� �̸�, �޿�, �μ� ��ȣ�� �����Ͻÿ�.
-- step 1. �޿��� 3000 �̻��� ������ �μ� ��ȣ�� �����Ѵ�.
    select dno
    from employee
    where salary >= 3000;
    
-- step 2. �μ� ��ȣ�� 10�̰ų� 20�� �ش��ϴ� ���� �� �޿��� 3000 �̻��� ������ ���� ����
    select ename, salary, dno
    from employee
    where dno = 10 or dno = 20;
    
    select ename, salary, dno
    from employee
    where dno in (select dno
                           from employee
                           where salary >= 3000);
                          
-- �μ� ��ȣ�� 10�̰ų� 20�� �ش��ϴ� ����� ������ �����Ͻÿ�.
    select *
    from employee
    where dno = 10 or dno = 20;
    
    select *
    from employee
    where dno in(10, 20);

-- ANY, SOME : ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻��� ��ġ�ϸ� ���� �Ǵ� ������
-- < ANY : ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �Ǵ� ������, �ּڰ��� ��ȯ�ϴ� �Ͱ� ���� �ǹ�
-- > ANY : ã���� ���� ���ؼ� �ϳ��� ������ ���� �Ǵ� ������, �ִ��� ��ȯ�ϴ� �Ͱ� ���� �ǹ�

-- Question 36. �μ� ��ȣ�� 30�� ��� �� �޿��� ���� ���� ������� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
-- step 1. �μ� ��ȣ�� 30�� �ش��ϴ� ����� �޿� ����
    select salary
    from employee
    where dno =  30;  -- 950(�ּ� �޿�)
    
 -- step 2. �޿��� 950���� ���� ����� �̸��� �޿� ����
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
    
-- Question 37. �μ� ��ȣ�� 30�� ����� �߿� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
-- step 1. �μ� ��ȣ�� 30�� ����� �޿� ���� ����
    select salary
    from employee
    where dno = 30;  -- 2850(�ִ� �޿�)
    
-- step 2. �޿��� 2850���� ū ������ ���� ����
    select ename, salary
    from employee
    where salary > 2850;

    select ename, salary
    from employee
    where salary  > all (select salary 
                                    from employee
                                    where dno = 30);

-- ������ ���� ����    
    select ename, salary
    from employee
    where salary  > (select min(salary) 
                               from employee
                               where dno = 30); 