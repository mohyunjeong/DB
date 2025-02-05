-- CHAPTER 04. GROUP BY / HAVING 절 --

-- 내장 함수의 종류
-- 단일 행 함수 : 입력된 하나의 행 당 결과가 하나씩 나오는 함수
-- 다중 행 함수 : 여러 행을 입력받아 하나의 결과 값으로 출력이 되는 함수
-- > 다중행 함수를 '집계 함수'라고 부릅니다.

-- 다중행 함수(집계 함수)의 특징
-- 1. 집계 함수는 NULL 값을 제외하는 특성을 가지고 있다.
-- 2. 집계 함수는 그룹화(GROUP BY)가 되어 있는 상태에서만 사용이 가능하다!!!

-- 집계 함수의 종류
-- COUNT : 지정한 데이터의 개수를 반환
--   SUM : 지정한 데이터의 합을 반환
--   MAX : 지정한 데이터 중 최대 값 반환
--   MIN : 지정한 데이터 중 최솟 값 반환
--   AVG : 지정한 데이터 중 평균 값 반환

-- COUNT(데이터)

-- 직원 테이블에서 직원ID의 행의 갯수를 조회 (총 직원 수)
SELECT * FROM EMPLOYEES;

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES;

/*
SELECT EMPOYEE_ID, -- 107개의 행
        COUNT(EMPLOYEE_ID) -- 1개의 행
FROM EMPLOYEES;
-- > 출력하고자 하는 행의 갯수가 맞지 않아서 에러가 난다.
*/

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY ();
-- 직원 테이블을 하나의 그룹으로 묶은 걸로 인식 -> 집계 함수가 실행!!

-- 부서 테이블의 부서ID 행의 갯수를 출력
SELECT * FROM DEPARTMENTS;

SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS;

-- 직원 테이블에서 부서ID 행의 갯수를 출력
SELECT * FROM EMPLOYEES;

SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;

-- DEPARTMENT_ID가 NULL인 직원 이름 출력
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS  NULL;

-- COUNT 함수는 *(아스타리스크)를 사용할 수 있습니다.
-- 다른 집계 함수는 사용을 못해요!!
SELECT * FROM EMPLOYEES;

SELECT COUNT(*)
FROM EMPLOYEES;
-- > 아스타리스크를 사용하면 NULL 값까지 포함해서 출력을 해 줍니다!!


-- 문제1) 직원 테이블에서 급여의 총 합계를 출력 (SUM 함수)
SELECT * FROM EMPLOYEES;

SELECT SUM(SALARY)
FROM EMPLOYEES;


-- 문제2) 직원테이블에서 직원들의 최대 급여와 최소 급여를 출력 (MAX/MIN 함수)
SELECT * FROM EMPLOYEES;

SELECT MAX(SALARY) AS MAX,
        MIN(SALARY) AS MIN
FROM EMPLOYEES;


-- 문제3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력 (AVG 함수)
--        * 결과값은 소수점 1의 자리까지 반올림
SELECT * FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;


-- 테이블 설정 확인
SELECT * FROM 수강생정보;
SELECT * FROM 성적표;


-- GROUP BY : 특정 컬럼을 기준으로 그룹화 (묶음)

-- GROUP BY 사용방법
-- 4. SELECT   조회할 컬럼명1, ...
-- 1. FROM     테이블 명
-- 2. WHERE    원하는 행을 선별하기 위한 조건식
-- 3. GROUP BY 특정 컬럼을 기준으로 그룹화

-- 수강생 정보 테이블에서 소속반 별(GROUP BY) 학생의 인원 수 조회
SELECT * FROM 수강생정보;

SELECT 소속반, COUNT(소속반) AS 소속반별인원수
FROM 수강생정보
GROUP BY 소속반;

-- 문제1) 성적표 테이블에서 과목별로 최고 성적과 최저 성적을 출력
SELECT * FROM 성적표;

SELECT 과목,
        MAX(성적) AS 최고성적,
        MIN(성적) AS 최저성적
FROM 성적표
GROUP BY 과목;

-- 문제2) 성적표 테이블에서 학생별로 평균 점수 출력(단, 소수점 1자리까지만 출력)
SELECT * FROM 성적표;

SELECT 학생ID,
        ROUND(AVG(성적), 1) AS 평균점수
FROM 성적표
GROUP BY 학생ID;

-- 문제3) 성적표 테이블에서 학생별로 JAVA와 DATABASE 과목의 성적의 합을 출력
SELECT * FROM 성적표;

SELECT 학생ID,
        SUM(성적) AS "JAVA와DATABASE성적합"
FROM 성적표
WHERE 과목 IN ('JAVA', 'DATABASE')
GROUP BY 학생ID;


-- SQL 실행 순서
-- FROM > WHERE > GROP BY > HAVING > SELECT > ORDER BY
-- 5. SELECT    출력하고 싶은 컬럼 작성
-- 1. FROM      데이터를 가져올 테이블
-- 2. WHERE     원하는 컬럼을 가지고 오도록 조건 지정
-- 3. GROUP BY  특정 컬럼을 기준으로 그룹화
-- 4. HAVING    그룹화 상태에서 데이터에 조건 지정
-- 6. ODER BY   특정 컬럼으로 정렬

-- HAVING 절 : GROUP BY 절이 존재할 때만 사용이 가능
-- > 집계가 완료된 대상을 조건을 통해 필터링하는 문법
-- > 조건이 참인 결과만 출력이 된다는 점에서 WHERER 절과 비슷하지만,
--   HAVING 절은 그룹화된 대상에서만 출력이 가능하다는 점에서 다름!!

-- 성적표 테이블에서 학생별 평균 성적을 구하되, 평균 성적이 75 이하인 학생들만 출력
SELECT * FROM 성적표;

SELECT 학생ID,
        ROUND(AVG(성적), 1)
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <= 75;

-- 문제1) 수강생 정보 테이블에서 반 별 인원 수가 3명 이상인 반만 출력
SELECT * FROM 수강생정보;

SELECT 소속반,
        COUNT(소속반) AS 인원수
FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >= 3;

-- 문제2) 직원 테이블에서 부서별 최고 연봉이 100,000 이상인 부서만 출력
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID,
        MAX(SALARY * 12) AS 최고연봉
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY * 12) >= 100000;

-- 문제3) 성적표 테이블에서 학생별 평균 성적을 출력하되, NULL이 아닌 값만 출력(단, 성적의 소수점 1의 자리까지만 출력)
SELECT * FROM 성적표;

SELECT 학생ID,
        ROUND(AVG(성적), 1) AS 평균성적
FROM 성적표
GROUP BY 학생ID
HAVING ROUND(AVG(성적)) IS NOT NULL;
