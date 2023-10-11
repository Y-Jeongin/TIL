-- �ּ�(comment) : ���α׷� ����� ������� �ڵ��� ������ ��� ���� ����ϴ� ����(��ȣ --, #, /* ~ */, //)
-- sql query : DB ǥ���� ��ɾ�, �������� ��ɾ �Է��� �� �ֱ� ������ ��ɾ��� ����(������) �����ݷ�(;)�� ���δ�.
-- sql*plus ��ɾ� : Oracle ������ ��� ������ ��ɾ�, �� �� ���

-- ���� ������ ����� ������ Ȯ���ϴ� ���
show user

-- scott ������ ������ �ִ� ���̺��� ���(tab : table)�� �����ϴ� ���
select * from tab;

-- CRUD ��ɾ� : DML ���� ��ɾ ���Ѵ�.
-- DDL : ���Ǿ�(create- ����, alter-����, drop-����)
-- DML : ���۾�(select-����/�˻�, insert-�߰�, update-����, delete-����)
-- DCL : �����(commit-��������/�ݿ�, rollback-����, grant-���� �ο�, revoke-���� ����)
-- Ʈ�����(transaction) : �����ͺ��̽��� ���� ����Ǵ� ��ɾ��� ���� ����, �ϳ��� ����� ����Ǵ� ����

-- select ��ɾ� : ���̺� ����� ���ڵ� ������ �۾��� �����ϴ� ��ɾ�, ����(�˻�)
-- 1. �⺻�� : select �ʵ�� from ���̺��;
-- Question 1. ���� ������ ��� �ִ� employee ���̺� ��ϵ� ��� ����� ������ �����Ͻÿ�. ( * =  all )
-- ���̺��� ������ Ȯ���ϴ� ���
desc employee  -- sql*plus ��ɾ�

select eno, ename, job, manager, hiredate, salary, commission, dno  -- �ʵ�� ,�� ����Ͽ� ����
from employee;

select *
from employee;

-- Question 2. ���� ����( employee) ���̺��� ������ ��ȣ, �̸�, ������ �����Ͻÿ�.
select eno, ename, job
from employee;

-- Question 3. ����(job)�� ���(clerk)�� �ش��ϴ� ����� ������ �����Ͻÿ�.
select *
from employee
where job = 'CLERK';  -- ������

-- 2. Ȯ���� : where�� - �־��� ������ ���� �͸� ������ �� ����ϴ� ��
-- ���ǽ�(or ������ or ��/�Ǵܹ�) : �ݵ�� �� ����� �� �Ǵ� �������� ������ �Ǵ� ����
-- ������(operation) : �ǿ����� ���̿� ������ �����ϱ� ���� ����ϴ� ��ȣ��
-- ��������� : ��Ģ������ �����ϴ� �����ȣ(+, -, *, /)
-- Question 4. ������ ������ ����ִ� ���̺� employee�� �̿��Ͽ� ���� ������ �̸��� �޿� �׸��� 10�� �λ�� �޿��� �����Ͻÿ�.
select ename, salary, salary+10
from employee;

--- ��Ī(nickname) : as��
select ename, salary, salary + 10 as "�λ�� �޿�"
from employee;

-- Question 5. ���� ������ ����ִ� ���̺� ������ "analyst" �ش��ϴ� ������ �޿��� 500�� �λ��Ͽ� �����Ͻÿ�.
select ename, job, salary, salary + 500 as "�λ�� �޿�"
from employee
where job = 'ANALYST';

-- Question 6. ���� ���̺��� ������ ���ʽ��� ��ģ �ݾ��� �����ϵ�, �ش� �÷����� �ѱ޿��� ǥ���Ͻÿ�.
select salary, commission, salary + commission "�ѱ޿�"  -- as ���� ����
from employee;
-- null : ����ִٴ� �ǹ̷� 0�� �ƴϴ�.
-- null�� �ٸ� ������ ��ȯ�ϴ� �Լ� : NVL �Լ�, NVL(������, ��ü��)
select salary, commission, salary + nvl(commission, 0) "�ѱ޿�"
from employee;

-- ���迬���� or �񱳿�����
-- �� ���� ��Ұ��踦 ���ϴ� ������ : =(����), !=, <>, ^=(�����ʴ�), >, >=, <, <=
-- �־��� ������ ���� �͸� �����϶�� �ǹ̸� ������.
-- Question 7. �μ���ȣ(dno)�� 20�� ����� ������ �����Ͻÿ�.
select *
from employee
where dno = 20;

-- Question 8. �μ���ȣ�� 20�� �ƴ� ������ ������ �����Ͻÿ�.
select *
from employee
where dno != 20;

select *
from employee
where dno <> 20;

select *
from employee
where dno ^= 20;

-- Question 9. ����� �̸��� FORD�� ����� ���, �̸�, �޿��� �����Ͻÿ�.
select eno, ename, salary
from employee
where ename = 'FORD';

-- Question 10. �Ի����� 1982�� 1�� 1�� ���Ŀ� �ش��ϴ� ����� ������ �����Ͻÿ�.
-- ����, ��¥�� �ݵ�� Ȭ����ǥ �ȿ� ǥ���ؾ� �Ѵ�.
select *
from employee
where hiredate >= '82/01/01';

-- �������� : ����(��, ����)�� �̿��Ͽ� ������ �����ϴ� ������
-- �������� �� �����ڸ� �����Ͽ� ����� �� �� ����ϴ� ������
-- and : ���, ~��, ��� ���ǿ� �����ϴ� �͸� ����
-- Question 11. �μ���ȣ�� 10�̰�, ������ MANAGER�� �ش��ϴ� ������ ������ �����Ͻÿ�.
select *
from employee
where dno = 10;

select *
from employee
where job = 'MANAGER';

select *
from employee
where dno = 10 and job = 'MANAGER';

-- or : �Ǵ�, Ȥ��, ��� �� �ϳ���, �������� ���� �� �ϳ��� ���̾ ����
-- Question 12. �μ���ȣ�� 10�̰ų� ������ MANAGER�� �ش��ϴ� ������ ������ �����Ͻÿ�.
select *
from employee
where dno = 10 or job = 'MANAGER';

-- not : ������ ����, ���׿���
-- Question 13. �μ���ȣ�� 10�� �ƴ� ����� ������ �����Ͻÿ�. (3���� ������ ����Ͻÿ�.)
select *
from employee
where dno != 10;

select *
from employee
where dno <> 10;

select *
from employee
where dno ^= 10;

select *
from employee
where dno = 20 or dno = 30;

select *
from employee
where not dno = 10;

-- �������� ǥ������ �̿��� ��������
-- between ~ and : �ϳ��� �÷��� �������� ������ �ο��� �� ����ϴ� �����ڷ�, ����, ����, ��¥���� ��밡���ϴ�.
-- Question 14. �޿��� 2000�̻� 3000���Ͽ� �ش��ϴ� ����� ������ �����Ͻÿ�.
select *
from employee
where salary >= 2000 and salary <= 3000;

select *
from employee
where salary between 2000 and 3000;

-- in : ���Կ��θ� �Ǵ��ϴ� ������ ǥ��
-- Question 15. �޿��� 2000 �̸��̰ų� 3000 �ʰ��� �ش��ϴ� ����� ������ �����Ͻÿ�.
select *
from employee
where salary < 2000 or salary > 3000;

select *
from employee
where salary not between 2000 and 3000;

-- Question 16. 1987�⿡ �Ի��� ����� ������ �����Ͻÿ�.
-- ����, ��¥�� �ݵ�� Ȭ����ǥ �ȿ� ǥ���ؾ� �Ѵ�.
select *
from employee
where hiredate >= '87/01/01' and hiredate <= '87/12/31';

select *
from employee
where hiredate between '87/01/01' and '87/12/31';

-- Question 17. �μ���ȣ�� 10�̰ų� 30, 40�� �ش��ϴ� ����� ������ �����Ͻÿ�.
select *
from employee
where dno = 10 or dno = 30 or dno = 40;

select *
from employee
where dno in(10, 30, 40);

select *
from employee
where dno != 20;

-- !�� �ǹ̴� not�� ���Ѵ�.
select *
from employee
where not dno = 20;

-- ���ɹ���, ���ϵ�ī�� ����(wild character) : %, _ �� ���α׷��� ������ *�� ?�� ����Ѵ�.
-- ��ü����
-- "="�� ���ϴ� ��ȣ��� �ݵ�� like�� ����Ѵ�.
-- % : ���� ���� ������� ��� ���ڸ� ����ϴ� ��ȣ
-- Question 18. ����� �̸��� ù���ڰ� 'M'�� �����ϴ� ���� ������ �����Ͻÿ�.
select *
from employee
where ename like 'M%';

-- Question 19. ������ �̸��� ������ ���ڰ� 'N'�� �ش��ϴ� ������ ������ �����Ͻÿ�.
select *
from employee
where ename like '%N';

-- Question 20. ������ �̸��� 'R'�� ���Ե� ������ ������ �����Ͻÿ�.
select *
from employee
where ename like '%R%';

-- "_"�� ���� �ѱ��ڸ� ��ü�ϴ� ���ɹ���
-- Question 21. ���� �̸��� �ι�° ���ڰ� 'A'�� ������ ������ �����Ͻÿ�.
select *
from employee
where ename like '_A%';

-- Question 22. ù���ڰ� 'M'�� �ƴ� ������ ������ �����Ͻÿ�.
select *
from employee
where ename not like 'M%';

-- is NULL / is NOT NULL
select commission from employee where commission is null;
select * from employee where commission is null;

select * from employee where commission is not null;

-- 3. Ȯ���� : ������ ���� order by ��
-- ����(sort) : �־��� Ű ���� ���� ������� �����ϴ� ��
-- ���� ��� : ��������(asc = ascending, ��������), ��������(desc = descending)
-- ����
-- ���� : ���������� ����(��������), ���� �ݴ��(��������)
--  Question 23. ����� �޿��� �������� �������� �����Ͽ� �����Ͻÿ�.
select *
from employee
order by salary;  -- ���� ����� �����Ǹ� ������������ �����Ѵ�.

select *
from employee
order by salary desc;

-- Question 24. �μ���ȣ�� �������� �������� �����Ͽ� �����Ͻÿ�.
-- �̶�, ������ �μ���ȣ�� ������ �ִ� ������ �޿��� �������� �������� �����Ͻÿ�.
select *
from employee
order by dno asc;

select *
from employee
order by dno, salary desc;

-- Question 25. ���� �ֱٿ� �Ի��� ���������� �����Ͻÿ�.
select *
from employee
order by hiredate desc;

-- distinct : ������ ������ �ߺ��Ǿ� ������� �ʵ��� �ϴ� �ɼ�
select distinct dno from employee;

-- ���Ῥ���� : select�� ���ο� ���ڸ� ������ �� ����ϴ� ������, ||
select ename || ' �� ������ ' || job || ' �Դϴ�.'
from employee;

-- �Լ�(Function) : �ݺ����̷� �����ϴ� ����̳� ����� �ϳ��� ������� ��� �����ϴ� ��ɾ�
-- SQL ������ �Լ� : �Լ��� ����� �ϳ��� ������ ����ȴ�.
-- ���� : ���� �Լ�, ���� �Լ�, ��¥ �Լ�, ����ȯ, �Ϲ� �Լ�

-- SQL ������ �Լ� = �׷� �Լ�

-- dual ���̺� : �ӽ� ���̺�, ������ �Լ��� ����� �����ϱ� ���� ���Ǵ� ������ ���̺� �̸�
select 10 * 5
from dual;

desc dual  -- �ϳ��� ��� ���� ��Ÿ�� �뵵�� ���

select * from dual;  -- ������ ��, ���� �������� ����

-- ���� �ý����� ��¥�� �����ϴ� �Լ�
select sysdate from dual;  -- sysdate ���� ��¥�� ��Ÿ���� �Լ�

-- ���� �Լ� : ���� �����͸� ó���ϴ� �Լ�
-- ABS(����) : ���밪�� �����ϴ� �Լ�
select abs(-10) from dual;
select -10, abs(-10) from dual;

-- ROUND(����, �ڸ���) : Ư�� �ڸ������� �ݿø��ϴ� �Լ�
-- FLOOR(����) : �Ҽ��� �Ʒ��� ������ �Լ�
select 34.5432, floor(34.5432), round(34.5432, 0) from dual;

select 34.5678, round(34.5678), round(34.5678, 2), round(34.5678, -1) from dual;  -- round �Լ� �ڸ��� ������ ��� 0�� �ڸ����� �ݿø�

-- MOD(����, ������) : ���ڸ� �ش� �������� ������ ����� �������� �����ϴ� �Լ�
select mod(27,5), mod(27,7), mod(27,2) from dual;

-- �ڿ��� ó��, NLP
-- UPPER, LOWER, LENGTH, LENGTHB, INSTR, SUBSTR, ����.