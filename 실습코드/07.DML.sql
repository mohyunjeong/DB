-- CHAPTER 06. DML(DATA MAINPULATION LANGUAGE) --

-- DML이란?
-- 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제할 때 사용하는 질의어이다.
-- > 테이블에서 원하는 데이터를 입력, 수정, 삭제한다.

-- DML 유형 - 세인업데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- 사용방법

-- 1)
-- INSERT INTO 테이블명(컬럼1, ...)
-- VALUES (값1, ...)
-- > INSERT에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형이 맞아야 한다!!!!

-- 2)
-- INSERT INTO 테이블명
-- VALUES (값...)
-- > INSERT에 컬럼 리스트 생략 시 VALUES에 입력한 값은 테이블에 컬럼 수와 순서, 자료형이 맞아야 한다!!

-- 1. 나의 정보를 넣기
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD01', '12345', '모현정', SYSDATE, 22, '010-8255-7026', '201140@jnu.ac.kr');