-- Ư�� ���ڵ� ���� �� SQL �Լ� Ȱ��
-- SQL*PLUS : tab(=table), Ư�� ����� ������ �����ϴ� ���̺��� ����� �����ִ� ��ɾ�
-- ����� ���� Ȯ��
SHOW USER

-- SCOTT ������ ������ �ִ� ���̺� ���
-- ���� �� �˻�
SELECT * FROM TAB;

-- DESC : ���̺� ������ Ȯ���ϴ� ��ɾ�(�ڿ� �������� ������ �ǹ�), SQL PLUS��
DESC DEPARTMENT

-- SQL QUERY : SQL ��ɾ�(���Ǿ�)
-- 1. SELECT : ���ڵ� ������ Ư�� ���ڵ带 �����ϴ� ��ɾ�, DML�� �� ����
-- �⺻ ���� : SELECT �÷���(�Ӽ���) FROM ���̺��; 
-- �μ� ������ ������ �ִ� DEPARTMENT ���̺��� ��� ���ڵ带 �����ϴ� ���
SELECT * FROM DEPARTMENT;

-- DEPARTMENT ���̺��� LOC �÷��� �����ϴ� ���
SELECT LOC FROM DEPARTMENT;

-- DEPARTMENT ���̺��� DNAME, LOC �÷��� �����ϴ� ���
SELECT DNAME, LOC FROM DEPARTMENT;

-- Ȯ������ : SELECT �÷��� FROM ���̺�� WHERE ���ǽ�;
