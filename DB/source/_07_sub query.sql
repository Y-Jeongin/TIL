-- ���� ����(sub query) : join�� Ȯ���� ����
-- select�� �ȿ� �� �ٸ� select���� ���� �� �̰��� ���� ������� �θ���.
-- ���� ������ �ش� ������ ������� ������ ���� ������ ���� ����, ������ ���� ������ ������.
-- ������ ���� ������ �ݵ�� ������ �����ڿ� �Բ� ����ؾ� �Ѵ�. (in, any=some, all)
-- �ݵ�� ���� ������ ��ȣ �ȿ� ��� ����Ѵ�.
-- ���� ������ ��ȣ(=) ������ ����Ѵ�.
-- ���� ������ ���� ������ ����Ǳ� ���� ���� �� �� �����Ѵ�.

-- Question 1. SCOTT ������� �޿��� ���� �޴� ����� �����Ͻÿ�.
    select * from employee;

-- step 1. SCOTT�� �޿��� ���� �����Ѵ�.
    select salary
    from employee
    where ename = 'SCOTT';  -- 3000
    
-- step 2. ����� SCOTT�� �޿��� �������� �ٸ� ����� �޿��� ���Ͽ� ����� �����Ѵ�.
    select *
    from employee
    where salary > 3000;
    
    select *
    from employee
    where salary > (select salary
                    from employee
                    where ename = 'SCOTT');  -- ������ ���� ����
                    
-- Question 2. SCOTT�� ������ �μ����� �ٹ��ϴ� ����� ������ �����Ͻÿ�.
-- step 1. SCOTT�� �μ� ��ȣ�� ����
    select dno
    from employee
    where ename = 'SCOTT';  -- 20

-- step 2. ����� �μ� ��ȣ�� ��ġ�ϴ� ����� ������ ����
    select *
    from employee
    where dno = '20';
    
    select *
    from employee
    where dno = (select dno
                 from employee
                 where ename = 'SCOTT');
                 
-- Question 3. �ּұ޿��� �޴� ����� �̸�, ����, �޿��� �����Ͻÿ�.
    select ename, job, salary
    from employee
    where salary = (select min(salary) from employee);
    
-- Question 4. 30�� �μ��� ���� ���� �� �ּұ޿��� �޴� ����� �޿����� �� ū �޿��� �޴� �μ��� ��ȣ�� �ּұ޿��� �����Ͻÿ�.
-- step 1. �μ� ��ȣ�� 30���� �������� �޿� �� �ּ� �޿� ����
    select min(salary)
    from employee
    where dno = 30;  -- 950

-- step 2. �μ��� �ּ� �޿��� ���� ���� 950���� ū �μ��� ��ȣ�� �ּ� �޿��� �����Ѵ�.
    select dno, min(salary)
    from employee
    group by dno
    having min(salary) > (select min(salary) from employee where dno = 30);

-- ������ : where���� having��(�׷캰�� ������� ����� �������� ������ ��´�)

    select dno, salary
    from employee
    where salary > (select min(salary) from employee where dno = 30);
    
-- Question 5. �μ��� �ּ� �޿��� �޴� ����� ��� ��ȣ�� �̸��� �����Ͻÿ�.
-- step 1. �μ���ȣ�� �μ��� �ּ� �޿��� �����Ѵ�.
    select dno, min(salary)
    from employee
    group by dno;  -- ������ ��� ��
    
-- step 2. ������ ���� ���� ���
    select eno, ename
    from employee
    where salary in (select min(salary)
                     from employee
                     group by dno);  -- �ݵ�� ������ �����ڿ� �Բ� ����Ѵ�.
                     
-- ������ SALESMAN�� �ƴϸ鼭 �޿��� ������ SALESMAN���� ���� ����� ������ �����Ͻÿ�.
-- step 1. ������ SALESMAN�� ������� �޿��� �����Ѵ�.
    select salary from employee where job = 'SALESMAN';
    
-- step 2. ������ SALESMAN�� �ƴ� �������� �޿��� ���� ���� ������� ���Ͽ� ����� �����Ѵ�.
    select *
    from employee
    where salary < any (select salary from employee where job = 'SALESMAN')  -- 1600����
    and job <> 'SALESMAN';
    
    select *
    from employee
    where salary < all (select salary from employee where job = 'SALESMAN')  -- 1250����
    and job <> 'SALESMAN';