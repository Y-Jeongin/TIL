-- ���� ���̺� ��(View)
-- ��(Veiw) : �������� ���̺��� �ٰŷ� ������� ���� ���̺�, ���̺� �����ʹ� ������ ���� ���� ���̺��� �������� �ʰ� sql�� ����Ǿ� �ִ�.
-- �⺻���̺� : �並 �����ϱ� ���ؼ� ���������� �����͸� ������ �ִ� �������� ���̺��� ���Ѵ�.
-- �ǽ��� ���� dept ���̺�� emp ���̺� ���� : department ����, employee ����
    drop table dept cascade constraints;
    create table dept
    as select * from department;
    select * from dept;
    
    drop table emp;
    create table emp
    as select * from employee;
    select * from emp;
    
-- �並 �����ϴ� ��� : create view ���̸� [�ɼ�]
-- �並 ������ �� ����ϴ� �ɼ� : create or replace view, force, with check option, with read only

-- Question 1. �μ���ȣ�� 30���� �ش��ϴ� ������� ��ȣ, �̸�, �μ���ȣ�� �����Ͻÿ�.
    select eno, ename, dno from emp where dno = 30;
    
-- 30�� �μ��� �Ҽӵ� ������� ��ȣ, �̸�, �μ���ȣ�� ����ϱ� ���� select���� �ϳ��� ��� �����ϴ� ������
    create view emp_view30 as select eno, ename, dno from emp where dno = 30;
    select * from emp_view30;

-- �並 ����ϴ� ���� : �����ϰ� �� �������� ��� �����ϸ� �����̳� �۾��� ȿ������ ���� �� �ִ�. ���ȿ� ����
    drop view emp_view30;  -- �並 �����Ѵٰ� ������̺��� �����Ǵ� ���� �ƴϴ�.
    

-- ������(seqeunce) : �Ϸù�ȣ�� ������ ������ �ִ� ���
-- ����Ŭ������ ���� �����ϱ� ���ؼ� �Ϲ������� ���� ���� �⺻Ű�� ����ϴ� ��찡 �ִ�.
-- �⺻Űó�� ���� �Ұ�, �ߺ� �Ұ�, �ڵ� ��ȣ �߻���
-- �������� ���� : create sequence �������̸�, start with �� ���۹�ȣ, increment by �� ������, maxvalue �� �ִ밪
-- ������ ���� Ȯ���ϴ� ��ɾ� : .currval(�������� ���簪), .nextval(������)

-- ������ �����ϱ�
    create sequence sample_seq;  -- 1���� �����ؼ� 1�� �����Ǵ� ������ ����
    
    select sample_seq.nextval from dual;
    select sample_seq.currval from dual;

-- �����ȣ�� ������ �������� ������ ��ü�� �����Ͻÿ�.
-- ���۰��� 1, 1�� ����, �ִ밪 100000�� �Ǵ� emp_seq�� �����Ͻÿ�.
    create sequence emp_seq start with 1 increment by 1 maxvalue 100000;
    
    drop table emp01;
    create table emp01(eno number primary key,
                       ename varchar2(14),
                       salary number);

    insert into emp01 values(emp_seq.nextval, '�̼���', 1000);
    insert into emp01 values(emp_seq.nextval, '�̼���', 1000);

    select * from emp01;