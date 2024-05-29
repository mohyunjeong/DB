-- DCL (DATA CONTROL LANGUAGE)

-- DCL이란?
-- > 데이터베이스에 접근하거나 객체에 권한을 주는 등의 역할을 하는 언어

-- DCL 명령어 종류
-- GRANT : 권한을 부여하는 명령어
-- REVOKE : 권한을 회수하는 명령어
-- ROLE : 권한을 묶어서 부여할 때 사용하는 명령어

-- GRANT CREATE SESSION TO DCL_TEST;

-- 사용자 생성방법
-- CREATE USER      사용자 이름
-- INDENTIFIED BY   패스워드

-- 권한 부여
-- GRANT    시스템 권한
-- TO       USER;

-- 권환 회수
-- REVOKE   시스템권한
-- FROM     USER;

CREATE TABLE 테스트 (
    TEST NUMBER
);
-- ORA-01031: insufficient privileges -- 권한이 충분하지 않다!!


-- 스키마란?
-- 데이터베이스에 저장되는 데이터 구조와 제약조건 등을 정의한 구조
-- 테이블, 뷰, 인덱스, 시퀀스 등의 hr계정의 모든 객체는 hr의 스키마
-- 스키마는 각 계정마다 존재하며, 이름이 계정과 같다.
-- 오라클에서는 스키마와 사용자를 구분하지 않고 사용한다.

-- 스키마.테이블.테이블
SELECT * FROM HR.EMPLOYEES;

-- GRANT SELECT, UPDATE ON HR.EMPLOYEES TO DCL_TEST;

UPDATE HR.EMPLOYEES
SET FIRST_NAME = '모', LAST_NAME ='현정'
WHERE EMPLOYEE_ID = 100;

SELECT * FROM HR.EMPLOYEES;

COMMIT;