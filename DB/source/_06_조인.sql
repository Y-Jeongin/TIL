-- JOIN(����)
-- �ϳ� �̻��� ���̺� ��� ���� �����Ͽ� �����ϴ� ī��� �� ����(�÷��� ��������, ���ڵ� ��������)
-- ������ �÷��� �̿��Ͽ� �־��� ���ǿ� �����ϴ� ���ڵ常 �����ϴ� � ����(Equi join) = Inner join(���� ����), �� ����(non-equi join)
-- ������ �̸��� ���̺��� ������ �����ϴ� self join
-- �Ϲ������� join ���ǿ� �����ϴ� �ڷḸ ���������� �׷��� ���� �ڷḦ ������ �� Outer join(�ܺ� ����)

-- Question 1. ��� ��ȣ�� 7788�� ����� �̸��� �Ҽ� �μ����� �����Ͻÿ�.
-- �ǽ��� ���̺� ��� Ȯ��
    select * from tab;
    
-- �ǽ��� ���̺��� ������ Ȯ��
    select * from department;  -- �μ� ����(�μ� ��ȣ, �μ���, �μ� ��ġ)
    select * from employee;  -- ��� ����(���, �̸�, ����, ���, �Ի���, �޿�, ���ʽ�, �μ� ��ȣ)
    select * from salgrade;  -- �޿��� ���(���, ���� �޿�, �ְ� �޿�)
    
-- step 1. ��� ��ȣ�� 7788�� �ش��ϴ� ����� ������ ����
    select * from employee where eno = 7788;
    select dno from employee where eno = 7788;
    
-- step 2. ������ �� �μ� ��ȣ�� �̿��Ͽ� �μ����� ����
    select dname from department where dno = 20;
    
-- join : �ϳ� �̻��� ���̺��� �����Ͽ� ���ϴ� ���ǿ� �����ϴ� ������ �����ϴ� ���
    select ename, dname
    from employee, department;  -- join ������ �������� �ʴ� join = ī��� �� ����

    select e.ename, d.dname
    from employee e, department d
    where e.dno = d.dno and e.eno = 7788;  -- join�ϴ� �� ���̺� ������ �̸��� �÷��� ������ ���� �� �ݵ�� ���̺���� ����ؾ� �Ѵ�.
    
-- join ���ǿ� �ش��ϴ� �÷��� ��� using �Լ�
    select e.ename, d.dname
    from employee e join department d
    using(dno)
    where e.eno = 7788;   
   
-- non-euqi join : �� ����, <>, !=, ^=, >, >=, <, <= �����ڸ� �̿��� join
-- Question 2. ������� �̸��� �޿� �׸��� �޿������ �����Ͻÿ�.
    select ename, salary, grade
    from employee, salgrade
    where salary >= losal and salary <= hisal;  -- non-equi join

    select ename, salary, grade
    from employee, salgrade
    where salary between losal and hisal;
    
-- Question 3. ����� �̸��� �Ҽӵ� �μ��� �̸� �׸��� �޿�, �޿� ����� �����Ͻÿ�.
    select ename, dname, salary, grade
    from employee e, department d, salgrade s
    where e.dno = d.dno and salary between losal and hisal;

-- slef join : �ڱ� �ڽŰ� ������ �����ϴ� join
-- ���� ��� ���̺��� �ڱ� �ڽ��̶�� �͸� �����ϸ� equi join�� �����ϴ�.
-- Question 4. ����� �̸��� ���� ����� �̸��� �����Ͻÿ�. ��� ���̺��� manager �÷��� Ȱ��
-- manager �÷��� �ش� ����� ���� ����� ��� ��ȣ�� ��Ÿ����.
    select e.ename ����̸�, m.ename ����̸�
    from employee e, employee m
    where e.manager = m.eno;

    select e.ename ����̸�, m.ename ����̸�
    from employee e, employee m
    where e.manager = m.eno(+);  -- right outer join
    
    
-- test 1. SCOTT ����� �μ���ȣ�� �μ����� �����Ͻÿ�.
    select e.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and ename = 'SCOTT';
    
-- test 2. ����� �̸��� �Ҽӵ� �μ��� �׸��� �μ��� ��ġ�� �����Ͻÿ�.
    select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno;
    
-- test 3. �μ���ȣ�� 10�� �ش��ϴ� ������� ������ �����Ͻÿ�.
    select e.job
    from employee e, department d
    where e.dno = d.dno and e.dno = 10;

-- test 4. Ŀ�̼��� �޴� ����� �̸��� �μ� �̸�, �μ� �������� �����Ͻÿ�.
    select e.ename, d.dname, d.loc
    from employee e, department d
    where e.dno = d.dno and commission is not null;

-- test 5. ����� 'A'�� ���Ե� ����� �̸��� �μ����� �����Ͻÿ�.
    select e.ename, d.dname
    from employee e, department d
    where e.dno = d.dno and e.ename like '%A%';

-- test 6. NEW YORK���� �ٹ��ϴ� ����� �̸��� ���� �׸��� �μ���ȣ�� �μ����� �����Ͻÿ�.
    select e.ename, e.job, e.dno, d.dname
    from employee e, department d
    where e.dno = d.dno and d.loc = 'NEW YORK';

-- test 7. ��� �̸�, ��� ��ȣ, ��� �̸�. ��� ��ȣ�� �����Ͻÿ�.
    select e1.ename ����̸�, e1.eno �����ȣ, e2.ename ����̸�, e2.eno �����ȣ
    from employee e1, employee e2
    where e1.manager = e2.eno;