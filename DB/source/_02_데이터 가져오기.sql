-- 특정 레코드 추출 및 SQL 함수 활용
-- SQL*PLUS : tab(=table), 특정 사용자 계정에 존재하는 테이블의 목록을 보여주는 명령어
-- 사용자 계정 확인
SHOW USER

-- SCOTT 계정이 가지고 있는 테이블 목록
-- 추출 및 검색
SELECT * FROM TAB;

-- DESC : 테이블 구조를 확인하는 명령어(뒤에 있을때는 정렬의 의미), SQL PLUS문
DESC DEPARTMENT

-- SQL QUERY : SQL 명령어(질의어)
-- 1. SELECT : 레코드 단위로 특정 레코드를 추출하는 명령어, DML의 한 종류
-- 기본 형식 : SELECT 컬럼명(속성명) FROM 테이블명; 
-- 부서 정보를 가지고 있는 DEPARTMENT 테이블의 모든 레코드를 추출하는 명령
SELECT * FROM DEPARTMENT;

-- DEPARTMENT 테이블의 LOC 컬럼만 추출하는 명령
SELECT LOC FROM DEPARTMENT;

-- DEPARTMENT 테이블에서 DNAME, LOC 컬럼만 추출하는 명령
SELECT DNAME, LOC FROM DEPARTMENT;

-- 확장형식 : SELECT 컬럼명 FROM 테이블명 WHERE 조건식;
