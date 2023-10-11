-- 1. ������ Ÿ�� : ����Ŭ���� �����ϴ� �ڷ���
-- char(size) : size ũ���� ��¡���� ���� ������, �Էµ� �ڷ��� ���̿� ������� ������ ���̸�ŭ ���� ������ �����Ѵ�.
-- varchar2(size) : �������� ���� ������
-- number(p, s) : ����(p), �Ҽ�������(�Ǽ�, s)
-- date : ��¥ ������ ������, timestamp(date�� Ȯ��� ����)

-- 2. ����Ŭ �����ͺ��̽� ����
-- SQL*PLUS�� SQL ��ɾ�(DDL, DML, DCL)
-- ����� ���� : ������(sys, system), �Ϲ� ����� ����(scott)
-- ����Ŭ ���� : sqlplus ����id/����password
-- ���� ���� Ȯ�� : show user
    show user
-- ���� ���� ��� : connect(=conn)
    conn system/1234

-- ���̺� ���� : desc ���̺��
    desc employee
    
-- ������ ��ȸ/�˻� : select
-- select [distinct]�÷��� [*=all] [as = alias] 
-- from ���̺��
-- [where ���ǽ�]
-- [order by �÷��� [asc/desc]]
-- [group by �÷���]
-- [having �׷����ǽ�]

-- ���� : �����, ����(��/�Ǵ�), ����
-- �����(+, -, *, /) : ���� �Ǵ� ��¥ �����͸� ��� ����
-- Question 1. �������̺�(employee) �÷��� salary�� �޿��� ���Ѵ�. �� ������ ������ ����Ͽ� �����ȣ, �̸�, �޿�, ������ ����ǵ��� �������� �ۼ��Ͻÿ�.
    select eno, ename, salary, salary * 12 "����" from employee;
    
-- ������ �޿��� ���ʽ�(commission)�� �̿��Ͽ� ����� ��.
    select eno, ename, salary, salary * 12 + commission "����" from employee;  -- ������� null�� ������ �ʴ´�.

-- NVL(commission, 0)
    select eno, ename, salary, salary * 12 + nvl(commission, 0) "����" from employee;
    select eno, ename, salary, salary * 12 + nvl(commission, 0) "�� ��" from employee;
    
-- �񱳿�����(���迬����) : =(����), !=, <>, ^=(�����ʴ�), >, >=, <, <=
-- Q1. �޿��� 1500�̻��� ����� ���� ����
    select * from employee
    where salary >= 1500;

-- Q2. �μ���ȣ�� 10�� ����� ���� ����
    select * from employee
    where dno = 10;

-- Q3. SCOTT ����� ���� ����
    select * from employee
    where ename = 'SCOTT';

-- Q4. 1981�� ���� �Ի��� ������ ���� ����
    select * from employee
    where hiredate < '81/01/01';

-- �������� : �ϳ� �̻��� ������ �����Ͽ� ����� ��
-- AND : ��� ������ �� ���̾�� ���̵ȴ�. ���, ~�̰�
-- OR : ���� �� �ϳ��� ���̸� ����� ���̵ȴ�. �̰ų�, �Ǵ�, ��� �� �ϳ���
-- NOT : ���׿�����
-- Q1. �μ���ȣ�� 10�̰� ������ 'MANAGER'�� ����� ���� ����
    select * from employee
    where dno = 10 and job = 'MANAGER';
    
-- Q2. �μ���ȣ�� 10�̰ų� ������ 'MANAGER'�� ����� ���� ����
    select * from employee
    where dno = 10 or job = 'MANAGER';

-- Q3. �μ���ȣ�� 10�� �ƴ� ����� ���� ����
    select * from employee
    where dno <> 10;

-- Q4. �޿��� 1000���� 1500������ ���� ���� ����
    select * from employee
    where salary between 1000 and 1500;

-- Q5. �޿��� 1000 �̸��̰ų�, 1500 �ʰ��� ������ ���� ����
    select * from employee
    where salary not between 1000 and 1500;

-- Q6. Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ���� ����
    select * from employee
    where commission in (300, 500, 1400);

-- LIKE ������ : ���ϵ�ī�� ����(��ü����, ���ɹ���), _, %
-- Q1. ����� �̸��� 'F'�� �����ϴ� ����� ���� ����
    select * from employee
    where ename like 'F%';
    
    select * from employee
    where substr(ename, 1, 1) = 'F';

-- Q2. �̸��� 'M'�� ���Ե� ����� ���� ����
    select * from employee
    where ename like '%M%';
    
    select * from employee
    where instr(ename, 'M') != 0;

-- Q3. �̸��� 'N'���� ������ ����� ���� ����
    select * from employee
    where ename like '%N';
    
    select * from employee
    where substr(ename, -1, 1) = 'N';

-- Q4. �̸��� �ι�° ���ڰ� 'A'�� ����� ���� ����
    select * from employee
    where ename like '_A%';
    
    select * from employee
    where substr(ename, 2, 1) = 'A';

-- Q5. �̸��� ����° ���ڰ� 'A'�� ����� ���� ����
    select * from employee
    where ename like '__A%';
    
    select * from employee
    where substr(ename, 3, 1) = 'A';

-- Q6. �̸��� 'A'�� �������� �ʴ� ������ ���� ����
    select * from employee
    where ename not like '%A%';
    
-- is null / is not null
    select ename, commission from employee;
    
-- ���ʽ��� �޴� ������ ������ ����
    select ename, commission from employee where commission is not null;
    select ename, commission from employee where commission is null;
    
-- order by : �־��� �÷��� �������� ��������(asc)/��������(desc) �����Ͽ� ������ �� ���
-- Q1. ������ �޿��� �������� �������� �����Ͽ� �����Ͻÿ�.
    select * from employee
    order by salary;

-- Q2. ������ �μ���ȣ�� �������� ��������, ���� ������� �޿��� �������� �������� �����Ͽ� ����
    select * from employee
    order by dno asc, salary desc;

-- Q3. ���� �ֱٿ� �Ի��� ���������� ����
    select * from employee
    order by hiredate desc;

-- ���� �Լ� : ����(�ѱ�ȭ), ���ڿ�(�ܾ�)
-- upper(���ڵ�����), lower(���ڵ�����), initcap(���ڵ�����)
-- length(���ڵ�����), lengthb(���ڵ�����)
-- concat = ||
-- substr(���ڵ�����, ������ġ, ���ڼ�), substrb
-- instr(���ڵ�����, ����) �� 0(����)�� 1(��), ���ڿ����� ���ڰ� �ִ� ��ġ ���� ��ȯ�ϴ� �Լ�
-- lpad(left padding) : ���ʿ� ���� ������ ũ�⸸ŭ Ư�� ���ڷ� ä��� �Լ�
-- rpad(right padding)

    select * from employee;
    select lpad(salary, 10, '*') from employee;
    select rpad(salary, 10, '*') from employee;
    
    select ltrim(lpad(salary, 10, ' ')) from employee;
    
-- trim : ������ �����ϴ� �Լ�
-- LTRIM(���ڵ�����) : ���� ���� ����
-- RTRIM(���ڵ�����)
    select '   Oracle' from dual;
    select ltrim('   Oracle') from dual;
    
-- �׷��Լ� : �ϳ� �̻��� ���� ��� ������ �����ϴ� �Լ�, �ϳ��� ����� �����Ѵ�.    
-- sum(�÷���) : �ش� �÷� ������ ������ ���ϴ� �Լ�
-- avg(�÷���)
-- max(�÷���)/min(�÷���)
-- count(�÷���) : �ش� �÷��� null���� �ƴ� ���� ���� ��ȯ, count(*) : �ش� ���̺��� ���ڵ� ���� ��ȯ
    select count(ename) from employee;
    select count(*) from employee;
    select count(commission) from employee;
    
-- group by �� : Ư�� �÷��� �������� �׷�ȭ�ϴ� ��

-- ������̺��� ���� �޿��� ������ �����Ͻÿ�.
    select sum(salary) from employee;
    
-- �μ��� �޿��� ������ �����ϵ�, �μ���ȣ�� �޿��� ������ ǥ�õǵ��� �Ͻÿ�.
    select dno, sum(salary) from employee
    group by dno;
    
-- �ҼӺμ��� ��� �޿��� �����Ͻÿ�
    select dno, round(avg(salary),2) from employee
    group by dno;

-- �μ��� ������� Ŀ�̼��� �޴� ����� ���� ����ǵ��� �������� ����Ͻÿ�.
-- �μ���ȣ / �μ��� ��� ��/ Ŀ�̼� �޴� ��� ��
    select dno �μ�, count(eno) �����, count(commission) Ŀ�̼�
    from employee
    group by dno;

-- ����(job)�� ������ ������ �����Ͻÿ�.
    select job, count(job) from employee
    group by job;
    
    select count(distinct job) from employee;
    select distinct job from employee;
    
-- Having �� : group by ���� ���� ������ ������� ������� ���ϴ� ���ǿ� �����ϴ� �ڷḸ ������ ��
-- Q1. �μ��� ��� �޿��� 2000�̻��� �μ��� ��ȣ�� �μ��� ��� �޿��� �����Ͻÿ�.
    select dno, round(avg(salary), 2)
    from employee
    group by dno
    having avg(salary) >= 2000;

-- Q2. �μ��� �ִ�޿��� �ּұ޿��� �����ϵ�, �ִ�޿��� 2900�̻��� �μ��� �����Ͻÿ�.
    select dno, max(salary), min(salary)
    from employee
    group by dno
    having max(salary) >= 2900;
    
-- ���� �׷� - �Ұ�
    select dno, job, count(*), sum(salary)
    from employee
    group by dno, job
    order by dno, job;
    
-- ����(JOIN) : ���� ���̺��� �����Ͽ� ����ڰ� ���ϴ� ������ �����ϵ��� �����ִ� ���
-- ī��� ��, equi(� ����), non-equi(������), self, outer 
-- �ǹ������� ��������(equi join)�� �ܺ�����(outer join)
-- INNER join : ���� ����, Ư�� �÷��� �������� ��Ȯ�ϰ� ��ġ�ϴ� ��鸸 �����ϴ� join(������) = equi join
    select * 
    from employee e inner join department d -- join���ε� �ۼ� ����
    on e.dno = d.dno;
    
-- OUTER join : �ܺ� ����, ��ġ���� �ʴ� ���� ����
-- left outer join
-- left outer join-(left only)
-- right outer join
-- right outer join-(right only)

    create table food_a(id number(1) primary key,
                        fname varchar2(20) not null);
    create table food_b(id number(1) primary key,
                        fname varchar2(20) not null);
    
    insert into food_a values(1, '���');
    insert into food_a values(2, '����');
    insert into food_a values(3, '�ʹ�');
    insert into food_a values(4, '��â����');
     
    insert into food_b values(1, '�ʹ�');
    insert into food_b values(2, '���');
    insert into food_b values(3, 'Į����');
    insert into food_b values(4, '�ܹ���');
    
    select * from food_a;
    select * from food_b;
    
-- inner join : join�ϴ� �� ���̺� ��Ȯ�ϰ� ��ġ�ϴ� ���� ����
    select *
    from food_a a, food_b b
    where a.fname = b.fname;

    select *
    from food_a a inner join food_b b
    on a.fname = b.fname;
    
-- outer join : left outer join, A left outer join B, A�� ��� �� ����ǰ� B�� A�� �����ϴ�(���εǴ�) �ุ ����
    select *
    from food_a a left outer join food_b b
    on a.fname = b.fname;
    
-- left oiuter join - : left only, A left outer join B - where B.id is null
-- A ��ü�� �����ϵ�, ���� B�� ��ġ�ϴ� ���� �ִٸ� �װ��� �����ϰ� ����
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
    
-- Q1. equi join�� �̿��Ͽ� scott ����� �μ���ȣ�� �μ����� �����Ͻÿ�.
    select d.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';

-- Q2. inner join�� on �����ڸ� ����Ͽ� ����̸��� �ش� ����� �Ҽӵ� �μ��� �׸��� �μ��� �������� �����Ͻÿ�.
    select e.ename, d.dname, d.loc
    from employee e inner join department d
    on e.dno = d.dno;
    
    select e.ename, d.dname, d.loc
    from employee e inner join department d
    using(dno);

-- Q3. inner join�� using �����ڸ� ����Ͽ� �μ���ȣ�� 10���� �ش��ϴ� ����� �������� �μ��� �������� �����Ͻÿ�.
   select dno, job, loc
   from employee inner join department
   using(dno)
   where dno = 10;
   
   select e.dno, job, loc
   from employee e, department d
   where e.dno = d.dno and e.dno=10;

-- Q4.  natural join�� ����Ͽ� commission�� �޴� ����� �̸��� �μ��̸�, �������� �����Ͻÿ�.
    select ename, dname, loc
    from employee natural join department
    where commission > 0;
    
    select ename, dname, loc
    from employee e, department d
    where e.dno = d.dno and commission > 0;