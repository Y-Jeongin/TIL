-- ������ ���Ἲ �������� : ��ȿ�� �˻�
-- ���̺� �������� �������� �Է��� �����ϱ� ���� ���̺��� ������ �� ����ϴ� ���� ��Ģ��
-- 1. not null : ���� �Ұ��� �� null : ���� ����(�⺻��)
-- 2. unipue : �ߺ� �Ұ���, ���ϼ�, �ߺ����� ������� �ʴ´�.
-- 3. primary key : �⺻Ű(not null + unique)
-- 4. foreign key : �ܷ���(�ٸ� ���̺��� ������ �� ����ϴ� Ű) = ����Ű
-- 5. check : ��ȿ�� �˻� ��Ģ, �Է°��� ������ �ο��ϴ� ��

    drop table dept;
    create table dept(dno number(2), -- null(���� ����)
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '�����');
    insert into dept(dname, loc) values('bbb', '������');
    insert into dept(dno, loc) values(33, '�λ��');
    
-- Not Null �����Ģ
    drop table dept;
    create table dept(dno number(2) not null,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '�����');
    insert into dept(dname, loc) values('bbb', '������');  -- error, dno�� �����Ǿ� �����Ƿ�
    insert into dept(dno, loc) values(11, '�λ��');  -- ������ dno�� ������.
    
-- Unique : ���ϼ��� �����Ǿ�� �Ѵ�. �ߺ����� ������� �ʴ´�.
    drop table dept;
    create table dept(dno number(2) unique,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '�����');
    insert into dept(dname, loc) values('bbb', '������');
    insert into dept(dno, loc) values(11, '�λ��');  -- error, dno�� ���ϼ��� �����߱� ������
    
-- Not Null�� Unique ���������� ���ÿ� ��� : Primary key(�⺻Ű)
-- �⺻Ű�� ���ڵ带 �ĺ��� �뵵�� ����ϴ� Ű��, �ߺ��� ������� �ʰ� ������ �Ұ����ϴ�.
    drop table dept;
    create table dept(dno number(2),
                      dname varchar2(14),
                      loc varchar2(13));  
                      
    select * from dept;
    
    insert into dept values(11, 'aaa', '�����');
    insert into dept(dname, loc) values('bbb', '������');  -- error, dno ���Է�
    insert into dept(dno, loc) values(11, '�λ��');  -- error, dno ���ϼ� ����
    
-- Foreign key : �ܷ�Ű, �������Ἲ
-- ���̺� ������ ���踦 �߻���Ű�� ���� ����
-- �θ� ���̺�(dept)�� �����Ͽ� �ڽ� ���̺�(emp)�� �����Ѵ�.
-- step 1. �������̺��� �θ����̺��� dept�� ���̺� �⺻Ű ����(dno)
-- step 2. �θ����̺� ���ڵ带 �����Ѵ�.
-- step 3. �ڳ����̺�(emp)�� �ش� �÷��� �ܷ�Ű ����, �̶� ������ �̸��� �����ϸ� ������ �߻��Ѵ�.
-- step 4. �ڳ����̺� ���ο� ���ڵ带 ������ ��, �θ����̺� �����ϴ� �÷��� ���� ���� �����ϸ� ���Ἲ ���� ��Ģ�� ��߳���.

    drop table emp;
    desc employee
    
    create table emp(eno number(4) primary key,
                     ename varchar2(20) not null,
                     dno number(2) constraint dno_fk references dept(dno));  -- �ܷ�Ű ����
                     
    select * from emp;
    
    insert into emp values(1111, 'aaa', 10);
    insert into emp values(2222, 'bbb', 20);
    insert into emp values(3333, 'ccc', 10);
    insert into emp values(4444, 'ddd', 30);
    insert into emp values(5555, 'eee', 40);


-- �θ����̺�(dept) : �ڽ����̺��� ������ Ű�� �⺻Ű���� �ʼ�
    drop table dept;
    
    create table dept(
        dno number(2) primary key,
        dname varchar2(20),
        loc varchar2(20));
        
    select * from dept;
        
    insert into dept values(10, 'ȫ����', '�����');
    insert into dept values(20, '������', '�λ��');
    insert into dept values(30, '���ߺ�', '������');
    
    
    insert into emp values(6666, 'kkk', 40);
    
-- �μ���ȣ�� 40���� ���� ���� ����
    delete from emp where dno = 40;
    
-- ���̺��� ������ �� �ܷ�Ű �����ϱ�
    alter table emp 
    add constraint dno_fk references dept(dno);

-- �ܷ�Ű ��ȸ : user_constraints, user_cons_columns ��ųʸ��� �̿��ؼ� �ܷ�Ű ��ȸ
    select a.constraint_name, a.table_name, b.column_name, a.constraint_type, a.r_constraint_name
    from user_constraints a, user_cons_columns b
    where a.constraint_name = b.constraint_name;
    
-- �ܷ�Ű ����
    alter table employee drop constraint dno_fk;
    
-- check : ��ȿ�� �˻� ��Ģ, Ư�� �÷��� �ԷµǴ� ���� ������ �����ϴ� ���
    drop table emp01;
    
    create table emp01(
        eno number(4) primary key,
        ename varchar2(20),
        salary number(7, 2) constraint sal_c check(salary > 1000));
        
    insert into emp01 values(1111, 'aaa', 890);  -- check ���� ���ǿ� ����