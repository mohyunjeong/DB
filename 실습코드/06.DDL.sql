-- CHAPTER 06. DDL --

-- DDL이란?
-- > 테이블 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

-- [ DDL 명렁어 종류 ]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체를 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP : 테이블 같은 객체를 삭제하는 명령어

-- [ 테이블 생성 시 자주 사용하는 자료형 ]
-- VARCHAR2(N) : 가변형 문자형, N 크기만큼 입력 받음
-- NUMBER(P, S) : 숫자형 자료형, 숫자형 값을 P자리 만큼 입력 받고, S자리 만큼 소수를 입력 받음
-- > SQL에서는 시룻와 정수 모두 표현이 가능.
-- > ()를 생략하게 되면 최대 값인 38 크기가 들어간다.
-- DATE : 현재 날짜 값을 입력 받음

-- 수강생정보 테이블을 확인해서 TEST_수강생정보 테이블을 만들어보자
-- 테이블명 선택 후 SHIFT + F4 누르면 테이블의 대한 정보를 확인 가능

CREATE TABLE TEST_수강생정보 (
    학생ID VARCHAR2(9) PRIMARY KEY,
    학생이름 VARCHAR2(50) NOT NULL,
    소속반 VARCHAR2(5)
);

SELECT * FROM TEST_수강생정보;

-- 성적표 테이블을 확인해서 TEST_성적표 테이블을 생성해보자
-- 제약조건은 쓰지마세요! 컬럼명 + 자료형 입력을 해주세요

CREATE TABLE TEST_성적표 (
    학생ID VARCHAR2(9),
    과목 VARCHAR2(30),
    성적 NUMBER
);

SELECT * FROM TEST_성적표;

CREATE TABLE SMHRD_LOGIN (
    ID VARCHAR2(20),
    PW VARCHAR2(20),
    EMAIL VARCHAR2(20),
    NAME VARCHAR2(20)
);

SELECT * FROM SMHRD_LOGIN;

