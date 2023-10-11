-- 테이블 목록 확인
select * from tab;

-- 테이블 삭제
drop table product;
drop table product cascade constraints;

-- 테이블 생성
create table product(
    product_id number primary key,  -- 상품 번호 숫자 기본키
    product_name varchar2(50),      -- 상품명
    price number default 0,         -- 상품 가격
    description clob,               -- 상품 설명, clob : 긴 문자열에 사용
    picture_url varchar2(500)
);

-- 레코드 삽입
insert into product values(1, '레몬', 1500, '맛있는 레몬', 'lemon.jpg');
insert into product values(2, '오렌지', 1500, '맛있는 오렌지', 'orange.jpg');
insert into product values(3, '키위', 1500, '맛있는 키위', 'kiwi.jpg');
insert into product values(4, '포도', 1500, '맛있는 포도', 'grape.jpg');
insert into product values(5, '딸기', 1500, '맛있는 딸기', 'strawberry.jpg');

-- db 반영
commit;


select * from product;

-- product 테이블의 레코드 개수 확인
select count(*) from product;