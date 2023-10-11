-- ������ ���Ǿ� : DDL
-- �����ͺ��̽��� ������ �����ϴ� ��ɾ� create
-- �����ͺ��̽��� ������ �����ϴ� ��ɾ� alter
-- �����ͺ��̽��� ������ �����ϴ� ��ɾ� drop / cascade - ��������(����) �� �����ϴ� ���̺��� �ִ� ��� ���
-- �����ͺ��̽��� ������ �̸��� �����ϴ� ��ɾ� rename

-- �����ͺ��̽� ���� : ���̺�(�⺻), ��, �ε���, ������, �ý���ī�޷α� ��
-- ���̺��� ������ �� create table ~
-- �����ͺ��̽� ����� create user ~

-- Question 1. ��ǰ(product) ���̺��� �����Ͻÿ�.
    create table product(num number(2),
                         name varchar2(5),
                         price number,
                         qty number);
                         
-- ���̺� ���� Ȯ��
desc product

-- Question 2. �μ�(dept) ���̺��� �����Ͻÿ�. ������ ���̺� �μ���ȣ(dno), �μ���(dname), �μ���ġ(loc)�� ������ �ڷ����� ����Ͽ� �����Ͻÿ�.
    create table dept(dno number(2),
                      dname varchar2(15),
                      loc varchar2(20));

    desc dept
    
-- Question 3. ������ �����ϴ� ���̺��� �̿��Ͽ� ���ο� ���̺� ���� : as��
-- ������ �����ϴ� ���̺��� ������ ���� �Ǵ� ������ �����Ͽ� ���ο� ���̺��� ������ �� �ִ�.
    create table dept_second
    as  -- as ���� ����
    select * from department;
    
    desc dept_second
    select * from dept_second;
    
-- Question 4. ��� ���̺� ������ SALESMAN�� �ش��ϴ� ����� ������ ���ο� ���̺� sales�� ������ ������ �����ϴ� ������ ����Ͻÿ�.
    create table sales
    as select * from employee where job = 'SALESMAN';
    
    select * from sales;

-- Question 5. ��� ���̺� �����ȣ, �����, �Ի�����, �޿� �÷��� �̿��Ͽ� emp_second��� ���̺��� �����Ͻÿ�.
    create table emp_second
    as select eno, ename, hiredate, salary from employee;
    
    select * from emp_second;

-- Question 6. �μ� ���̺��� ������ �����Ͽ� dept_third��� �̸��� ���̺��� �����Ͻÿ�.
    create table dept_third
    as select * from department where 1=0;
    
    select * from dept_third;
    
-- ALTER ~ : �����ͺ��̽��� ������ �����ϴ� ��ɾ�
-- alter table ~ add()
-- Question 6. ��� ���� ���̺� ��¥������ �����͸� ��� birth��� �̸��� �÷��� �߰��Ͻÿ�.
    alter table employee add (birth date);
    
    select * from employee;
    
-- alter table ~ modify()
-- �����Ϸ��� �÷��� ������ �ִ� ��� �� ũ��� ������ �ڷ������� Ŀ���Ѵ�.
-- �����Ϸ��� �÷��� ������ ���� ��� �� ũ��� �ڷ����� ������ �� �ִ�.
-- Question 7. ��� ���̺��� ����� �̸��� ũ�⸦ �����Ͻÿ�.
    create table emp
    as select * from employee;
    
    select * from emp;
    
    alter table emp modify ename varchar2(30);
    alter table emp modify ename varchar2(10);
    alter table emp modify ename varchar2(5);
    
    desc emp
    
-- alter table ~ drop column �÷��� : Ư�� �÷��� �����ϴ� ��ɾ�
    desc employee
    alter table employee drop column birth;
    
-- test��  sample�� �����Ͻÿ�.
    select * from tab;
    rename test to sample;
    
-- drop table ���̺��;
    drop table dept01;
    

-- DML : ������ ���۾�
-- ���� �����ͺ��̽��� ���̺��� �̿��Ͽ� ���ڵ� ������ �۾��� �����ϴ� ��ɾ�
-- CRUD : select, insert, update, delete
-- select ~ from, insert into ~ values, update ~ set, delete ~ from
-- 1. SELECT : �˻�, ����
-- �⺻�� : select �÷��� from ���̺��;
-- Ȯ���� : where ���ǽ�, order by(asc, desc), group by, having

-- 2. INSERT : �߰�
-- �⺻�� : insert into ���̺��(�÷���) values(��);
-- Question 8. ������ �μ����̺��� �����͸� �����ϰ� ������ �����ؼ� dept_copy ���̺��� �����Ͻÿ�.
    create table dept_copy
    as select * from department where 1=0;  -- �׻� ������ ������ ����ϸ� ������� ���̺��� ������ ����ȴ�.
    
    desc dept_copy
    select * from dept_copy;
    
-- ���ڵ� �����ϴ� ���1
    insert into dept_copy(dno, dname, loc) values(11,'���ߺ�','�����');
    
-- ���ڵ� �����ϴ� ��� 2 : �ش� ���̺� �����ϴ� ��� �÷��� ���� �߰��� ��� �÷����� ���������ϴ�.
    insert into dept_copy values(22, 'ȫ����', '�λ��');
    
-- ���ڵ带 �����ϴ� ��� 3 : Ư�� �÷����� ���� �߰��ϴ� ���
    insert into dept_copy(dno, loc) values(33, '������');

-- ���ڵ带 �����ϴ� ��� 4 : values ��ſ� ���� ������ ����Ͽ� �ٸ� ���̺� �ִ� ���ڵ带 ������ �� �ִ�.
-- dept_copy ���̺� ����
    drop table dept_copy;
    
-- department ���̺��� ������ �̿��Ͽ� dept_copy ���̺� ����    
    create table dept_copy
    as select * from department where 1=0;
    
    select * from dept_copy;
    
    insert into dept_copy
    select * from department; -- �÷���� �÷��� ���� ��ġ�ؾ��Ѵ�.
    
-- ���̺��� �÷��� ������ ������ �� ����ϴ� ��ɾ� : UPDATE
-- update ����� where �������� �����Ǹ� ��� ���ڵ��� ���� ����ȴ�.
-- Question 9. dept_copy ���̺��� �μ����� ��� HR�� �����Ͻÿ�.
    update dept_copy set dname = 'HR';
    
-- ���������� �̿��Ͽ� �ٸ� ���̺� ����� �����ͷ� �ش� �÷��� ���� ������ �� �ִ�.
-- �μ� ���̺��� ��� �μ��� �������� �μ���ȣ�� 20���� �ش��ϴ� �μ��� �������� �����Ͻÿ�.
    update dept_copy set loc = (select loc from department where dno = 20);
    
-- dept_copy ���̺��� �μ����� 'aaa'�� �����ϰ� �μ���ȣ�� 33���� �����Ͻÿ�.
    update dept_copy set dname = 'aaa', dno = 33;
    
-- delete ~ from : ���̺� ���ڵ带 �����ϴ� ��ɾ�
    delete from dept_copy;
    
-- department ���̺��� ���ڵ带 dept_copy ���̺� �߰��Ͻÿ�.
    insert into dept_copy
    select * from department;
    
    delete from dept_copy where dname = 'SALES';    
    
-- ���� ������ �̿��Ͽ� ���ڵ� �����ϱ�
-- ������� ���̺��� ������ ������ �����Ͽ� emp��� �̸��� ���̺��� �����Ѵ�.
    drop table emp;
    create table emp as select * from employee;
    
-- Question 11. �μ����� SALES�� �ش��ϴ� ����� ������ emp ���̺��� �����ϴ� �۾��� �����Ͻÿ�.
-- step 1. �μ� ������ ������ �ִ� ���̺��� SALES��� �μ��� �ش��ϴ� �μ���ȣ�� �����Ѵ�.
    select dno
    from department
    where dname = 'SALES';  -- 30
    
-- step 2. ������ ã�� �μ���ȣ�� 30���� �ش��ϴ� ����� ������ �����ϴ� �۾��� �����Ѵ�.
    delete from emp 
    where dno = (select dno
                 from department
                 where dname = 'SALES');
                 
    select * from emp;