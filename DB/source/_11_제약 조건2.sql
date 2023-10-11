-- ������ ���Ἲ ���� ����
-- 1. Not Null : Null�� ������� �ʴ� ���� ����, ���� �Ұ�, �ʼ� �Է�
-- Question 1. department ���̺��� ������ ������ �����Ͽ� dept ���̺��� �����Ͻÿ�.
    drop table dept cascade constraints;
    
    create table dept
    as select * from department;  -- ������ ������ ��� where ���ǽĿ� �׻� ������ �Ǵ� ������ ����Ѵ�. 1=0 or 0=1
    
    select * from dept;
    desc dept

    insert into dept(dno, dname, loc) values(50, '���ߺ�', '�����');
    insert into dept(dno, dname, loc) values(50, '������', '������');
    insert into dept(dno, dname) values(50, 'DB');
    
    
    drop table dept;
    create table dept(dno number(2) not null,
                      dname varchar2(14) not null,
                      loc varchar2(13) not null);
                     
    insert into dept values(10, '���ߺ�', '����');
    insert into dept values(20, 'ȫ�κ�', '����');
    insert into dept(dno, dname) values(10, '���ߺ�');
    insert into dept values(10, '������', '�λ�');                   

-- 2. Unique : �ߺ����� ������� �ʴ� ���� ����, ���ϼ�
    drop table emp;
    create table emp(eno number(4) unique,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    select * from emp;
    desc emp
    
    insert into emp values(1111, '�庸��', '����', 1000);
    insert into emp(ename, job, salary) values('�̼���', '����', 800);
    insert into emp(ename, job, salary) values('�̼���', '����', 800);

-- 3. Primary key : Null�� ������� �ʰ�, �ߺ����� ������� �ʴ� ���� ����, Not Null + Unique, �⺻Ű
    drop table emp;
    create table emp(eno number(4) primary key,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    create table emp(eno number(4) constraint eno_pk primary key,
                     ename varchar2(14) not null,
                     job varchar2(14),
                     salary number(7));
                     
    select * from emp;
    desc emp
    
    insert into emp values(1111, '�庸��', '����', 1000);
    insert into emp values(2222, '�̼���', '����', 1000);
    insert into emp(ename, job, salary) values('�̼���', '����', 800);
    insert into emp(eno, ename) values(3333, 'ȫ�浿');

-- 4. Foreign key : �����Ǵ� ���̺��� �÷��� �����ϴ� ���� �Է��� ���ǵ��� �ϴ� ���� ����, ���� ���Ἲ, �ܷ�Ű
-- ���� ���Ἲ : ���̺� ������ ���迡�� �߻��ϴ� �������� �� ���̺��� �θ����̺�(��ü�� �Ǵ� ���̺�)�� �ڳ����̺�(������ �Ǵ� ���̺�)�� ���� ����
-- �μ����̺�(department) : dno(�⺻Ű) �� �θ����̺�, �θ����̺��� Ű�� �Ǳ� ���ؼ��� �÷��� �ݵ�� �⺻Ű(primary key) �Ǵ� ����Ű(unique)�� ����
-- ������̺�(employee) : eno(�⺻Ű), dno(�ܷ�Ű) �� �ڽ����̺�
    drop table dept;
    drop table emp;
    
    create table dept(dno number(2) primary key,
                      dname varchar2(14),
                      loc varchar2(13));
                      
    insert into dept values(10, '���ߺ�', '����');
    insert into dept values(20, 'ȫ�κ�', '����');
    insert into dept values(30, '������', '�뱸');
    insert into dept values(40, 'ȸ���', '�λ�');
    
    select * from dept;
    
    
    create table emp(eno number(4) primary key,
                     ename varchar2(14) not null,
                     job varchar2(20),
                     salary number,
                     dno number(2) constraint emp_dno_fk references dept(dno));
    
    select * from emp;
                     
    insert into emp values(1111, '�庸��', '����', 1000,10);
    insert into emp values(2222, '�庸��', '����', 800,30);  
    insert into emp values(3333, '�̼���', '�븮', 600,50);  

-- 5. Check : ��ȿ�� �˻� ��Ģ, �Է°��� ������ ������ �ο��ϴ� ���� ����
    drop table sample;
    create table sample(name varchar2(20),
                        age number constraint ch_age check(age > 0 and age < 150),
                        gender char(1) constraint ch_gender check(gender in('M', 'W')),
                        id number primary key);
    
    select * from sample;
                        
    insert into sample values('ȫ�浿', 30, 'M', 1);                    
    insert into sample values('�庸��', 25, 'M', 2);     
    insert into sample values('������', -100, 'W', 3);     
    insert into sample values('������', 20, 'F', 3);     
    