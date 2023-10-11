-- ������ ���Ǿ�(DDL, Data Definition Language) : �����ͺ��̽��� ������ �����ϰ� �����ϰ� �����ϴ� ��ɾ�
-- 1. create table/view/user : ���ο� ���̺��� �����ϴ� ��ɾ�
-- �ڷ���(data type) : �÷����� �Ӽ�
-- char(size) : �������� ���� ������
-- varchar2(size) : �������� ���� ������
-- number : ����, number(size), number(size, �Ҽ��� ���� �ڸ���) �� number(7, 2) 7�ڸ� �� �Ҽ��� ���� ��°�ڸ����� ����, �ִ� 40��
-- date / timestamp

-- Question 1. ������ ���̺� emp01�� �����ϰ�, �����ȣ eno, ����̸� ename, ����޿� sal�� �÷����� ��Ƽ� �����Ͻÿ�.
-- ����� ���� ��Ģ(����) : ���̺��, �÷���, ��Ÿ ���α׷� �ȿ��� ����ڰ� ���Ƿ� �����ؼ� ����ϴ� �̸����� �ۼ��ϴ� ��Ģ
-- �ݵ�� ���ڷ� ����, ���� ��  1~30�ڱ���, ������(A~Z, ��ҹ��� ����X), ����(0~9), Ư������('_', '$', '#'')�� ���� ����, �ߺ� �Ұ���, ������ ������� �ʴ´�.
    create table emp01 (eno number(4), 
                                     ename varchar2(20),
                                     sal number);
                                     
-- ���̺� ���� Ȯ��
    desc emp01
    
-- ������ �����ϴ� ���̺��� Ȱ���Ͽ� ���̺��� ���� : as��
    create table emp02 as select * from emp01;  -- emp01 ���̺��� ������ ������ �״�� �����Ͽ� ���ο� ���̺��� �����Ѵٴ� �ǹ�
    desc emp02

    create table emp as select * from employee;

    select * from emp01;
    select * from emp02;
    select * from emp;
    
-- ������ ������� ���̺��� ������ �̿��Ͽ� ���ο� ���̺� ����
    create table emp03 as select * from employee where 1 = 0;  -- ���� ������ �ۼ��ϸ� ���̺��� ������ �����´�.
    desc emp03
    select * from emp03;
    
-- Question 2. �μ� ��ȣ�� 30���� �ش��ϴ� ������� ������ ������ �ִ� ���̺� emp30�� �����Ͻÿ�.
    create table emp30 as select * from employee where dno = 30;
    select * from emp30;
    
-- ���� ���ӵ� ������ �����ϴ� ���̺��� ��� ����
    select * from tab;

-- 2. alter table : ���� ���̺��� ������ �����ϴ� ��ɾ�
-- ���̺��� ���� ������ �÷��� �߰�, ����, ������ ����Ѵ�.
-- 1) alter table ~ add : ������ ���̺� ���ο� �÷��� �߰��ϴ� ��ɾ�
    select * from emp01;
    desc emp01
    
    alter table emp01 add(job varchar2(9));

-- 2) alter modify : ������ ���̺� �÷��� �����ϴ� ��ɾ�
-- �ش� �÷��� �ڷᰡ ���� ��� : ������ Ÿ�԰� �÷��� ũ�� ���� ����
-- �ش� �÷��� �ڷᰡ �ִ� ��� : �������� Ÿ���� ���� �Ұ�, �÷��� ũ��� ���� ���� �� ��, ���� �÷��� ũ�⺸�� �ݵ�� �� Ŀ���Ѵ�.
    alter table emp01 modify(job varchar2(30));

-- 3) alter table ~ drop column : ���̺� �̹� �����ϴ� �÷��� �����ϴ� ��ɾ�
    alter table emp01 drop column job;

-- 3. drop table : ���� ���̺��� �����ϴ� ��ɾ�, delete�� ���� �����ϳ� drop�� ���� �� �� ����.
    select * from tab;
    
    drop table emp01;
    desc emp01
    
-- 4. rename : ������ ����ϴ� ���̺��� �̸��� �����ϴ� ��ɾ�
    rename emp to test;
    select * from emp; 
    select * from test;


-- ������ ���۾�(DML) : ���̺��� ������ �߰�, ����, ����, �����ϴ� ��ɾ�
-- 1. select ~ from : ����, �˻�
-- �μ� ������ �����ϴ� ���̺� department ���̺��� ��� ������ �����Ͻÿ�.
    select * from department;

-- �μ� ���̺��� ������ �̿��Ͽ� dept01 �̶�� ���̺��� �����Ͻÿ�.
    create table dept01 as select * from department where 1=0;
    desc dept01
    select * from dept01;

-- 2. insert into ~ values : �߰�
    insert into dept01(dno, dname, loc) values(11, '�ѹ���', '��õ��');
    insert into dept01 values(22, '�����', '����');  -- ���̺� �����ϴ� ��� �÷����� �� �߰��� �÷��� ���� ����
    insert into dept01(dno, dname) values(33, 'ȫ����');
    insert into dept01(dno, loc) values(44, '�����');

-- 3. update ~ set : ����
-- ���̺� ����� ���ڵ带 �����ϱ� ���� ����ϴ� ��ɾ�
-- ����! where���� ������� ���� ��� ��� ���ڵ��� ���� �����ȴ�.
-- ��� ����� �μ� ��ȣ�� 30���� �����Ͻÿ�.
    select * from test;
    update test set dno = 30;

-- ������ �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�.
    update test set salary = salary * 1.1;
    
-- ��� ������ �Ի����� ���� ��¥�� �����Ͻÿ�.
    update test set hiredate = sysdate;
    
-- ������ SALESMAN�� ������ �μ� ��ȣ�� 40���� �����Ͻÿ�.
    update test set dno = 40 where job = 'SALESMAN';

-- ������ MANAGER�� ������ �޿��� 10% �λ��ϴ� �������� �����Ͻÿ�.
    update test set salary = salary * 1.1 where job = 'MANAGER';
    
-- SCOTT ����� �μ� ��ȣ�� 20����, ������ MANAGER��, �޿��� 50, Ŀ�̼��� 4000���� �����ϴ� �������� �����Ͻÿ�.
    update test set dno = 20, job = 'MANAGER', salary = 50, commission = 4000 where ename = 'SCOTT';
    select * from test where ename = 'SCOTT';

-- Question 3. 20�� �μ��� �������� 40�� �μ��� ���������� �����ϴ� ������ �ۼ��ϵ� ���� ������ �̿��Ͻÿ�.
-- ��, department ���̺��� ������ ������ �̿��Ͽ� dept02 ���̺��� �����Ͽ� �۾��� ��
    create table dept02 as select * from department;
    select * from dept02;
    
    update dept02 set loc = (select loc from dept02 where dno = 40) where dno = 20;

-- 4. delete ~ from : ����
-- ���̺� ����� ���ڵ带 �����ϴ� ��ɾ�
-- where �������� ������ ��� ���ڵ尡 �����ȴ�.
    delete from dept02;  -- * ���� ����