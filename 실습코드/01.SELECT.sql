-- CHAPTER 01. SELECT --

-- 글짜 크기 키우기 : 도구 -> 환경설정 -> 코드편집기 -> 글꼴
-- 주석 색깔 바꾸기 : 도구 -> 환경설정 -> 코드편집기 -> PL/SQL 주석

-- 주석 기호 1 : -- -> 한줄 주석
-- 주석 형태 2 : /**/ -> 여러 줄을 한 번에 주석 처리할 때 사용함
/* 
1. SQL 문장은 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 반드시 세미클론(;)을 찍어줘야한다!!!
4. SQL 실행 단축키 : CTRL + Enter, F9
*/

DESC EMPLOYEES;
-- DESC(DESCRIBE) : SQL에서 테이블의 구조를 확인할 때 사용하는 명령어

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- [ SELECT 절 기본 사용 방법 ] 
-- # 앞의 숫자는 실행 순서
-- 2. SELECT  조회할 컬럼명 1, ....
-- 1.   FROM  조회할 테이블 명

-- 전체 데이터를 조회하는 방법
-- *( 아스타리스크 ) : 전체를 의미

-- 직원 테이블의 전체 정보를 출력
SELECT *
  FROM EMPLOYEES;
  
-- 실습 1 ) 부서 테이블의 전체 정보를 출력
SELECT *
  FROM DEPARTMENTS;
  
-- 실습 2 ) 직원 테이블의 직원ID, FIRST_NAME, EMAIL 정보를 출력
DESC EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
  FROM EMPLOYEES;
  
-- 실습 3 ) 부서 테이블에서 부서ID, 부서명, LOCATION_ID를 출력
DESC DEPARTMENTS;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS;
  
-- 실습 4 ) 직원 테이블에서 EMAIL, 직원ID, JOB_ID, LAST_NAME을 순서대로 출력
DESC EMPLOYEES;

SELECT EMAIL, EMPLOYEE_ID, JOB_ID, LAST_NAME
  FROM EMPLOYEES;
  
-- 실습 5 ) 직원 테이블에서 직원들의 부서ID를 출력
DESC EMPLOYEES;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
  
-- DISTINCT : 데이터 중복 제거

-- 중복 제거 사용 방법
-- SELECT DISTINCT 조회하고싶은 컬럼명1, ...
--   FROM  테이블

-- 직원들의 부서ID를 중복 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- 실습) 직원 테이블에서 JOB_ID와 부서ID를 중복을 제거하여 출력
DESC EMPLOYEES;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- DISTINCT 중복 제거는 뒤에 2개 이상이 있으면
-- 한 쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 '다르게' 취급한다.

-- 실습 1) 직원 테이블에서 입사일을 출력 후 행의 개수를 확인 * 주석으로 행의 갯수를 입력
DESC EMPLOYEES; 

SELECT HIRE_DATE -- 107개
  FROM EMPLOYEES; 

-- 실습 2) 직원 테이블에서 입사일을 출력 단 중복을 제거해서 출력 * 주석으로 행의 갯수를 입력
SELECT  DISTINCT HIRE_DATE -- 98개
  FROM EMPLOYEES; 
  
-- <<< TIP >>>
--> 컬럼에 숫자 연산이 가능하다 (+, -, *, /) !!

SELECT '안녕하세요'
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES;
  
-- 문제) 직원 테이블에서 직원의 이름과 급여, 연봉을 출력
DESC EMPLOYEES;

SELECT FIRST_NAME,
       SALARY,
       SALARY * 12
FROM EMPLOYEES;

  
-- 별칭 사용하기
-- Alias 라고 하며 한 눈에 보기 좋게 설정하는 것을 말함
-- AS 키워드를 사용해서 별칭을 지정합니다.

SELECT FIRST_NAME,
       SALARY,
       SALARY * 12 AS "연봉" -- 별칭 : "", 문자열 : ''
FROM EMPLOYEES;

-- 별칭 사용 방법
-- 1. SELECT 컬럼명 별칭
-- 2. SELECT 컬럼명 "별칭"
-- 3. SELECT 컬럼명 AS 별칭
-- 4. SELECT 컬럼명 AS "별칭"

-- 실습 ) 연산을 이용해서 직원 테이블에서 입사일, 입사일 다음 날을 출력
-- 단 입사일은 별칭을 입사일로, 입사일 다음 날은 "입사일다음날" 별칭을 사용해서 출력
-- (4가지 방법 모두 사용해보기)
DESC EMPLOYEES;

-- 1. SELECT 컬럼명 별칭
SELECT HIRE_DATE 입사일,
       HIRE_DATE + 1 입사일다음날
FROM EMPLOYEES;

-- 2. SELECT 컬럼명 "별칭"
SELECT HIRE_DATE "입사일",
       HIRE_DATE + 1 "입사일 다음 날" -- 쌍따옴표("") 없이 출력하면 띄어쓰기 적용 X
FROM EMPLOYEES;

-- 3. SELECT 컬럼명 AS 별칭
SELECT HIRE_DATE AS 입사일,
       HIRE_DATE + 1 AS 입사일다음날
FROM EMPLOYEES;

-- 4. SELECT 컬럼명 AS "별칭"
SELECT HIRE_DATE AS "입사일",
       HIRE_DATE + 1 AS "입사일 다음 날"
FROM EMPLOYEES;

          
-- OREDER BY 절이란?
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할 때 사용
-- SQL 실행 순서에서 가장 마지막에 실행
-- 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용

-- ASC(Ascending) : 오름차순 정렬 (1, 2, 3, 4, 5, ...)
-- DESC(decending) : 내림차순 정렬 (10, 9 , 8, 7 , 6 , 5, ...)

-- 직원 테이블에서 모든 직원의 정보를 출력
-- 급여를 오름차순으로 정렬

SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- 실습) 최근에 입사한 날짜를 기준으로 직원의 이름과 입사 날짜를 출력

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

-- 직원 테이블에서 직원ID, 부서ID, 이름, 급여 순으로 출력
-- 단 부서ID는 오름차순으로, 급여는 내림차순으로 정렬해서 출력
DESC EMPLOYEES;

SELECT EMPLOYEE_ID,
       DEPARTMENT_ID,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC,
         SALARY DESC;
         
-- 같은 부서에서 근무하고 있는 직원들끼리 급여가 높은 직원과 낮은 직원 순서대로 출력
-- 먼저 부서ID를 오름차순으로 정렬한 후에 급여를 내림차순으로 정렬한 것


-- NULL 값이란?
-- NULL 값이란 데이터의 값이 완전히 비어 있는 상태를 의미
-- 값이 존재하지 않거나 정해지지 않은 것을 의미
-- 숫자 0과 문자열 ' '은 NULL 값이 아님
-- *** NULL 과 연산을 하면 결과 값은 무조건 NULL 값 ***

-- 문제) 직원 테이블에서 직원ID, 보너스, 보너스 두배의 정보를 출력
-- 단 보너스 두배의 정보는 UP_BONUS로 별칭을 사용해서 출력
DESC EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS 보너스두배
  FROM EMPLOYEES;
  
-- 문제에서 UP_BONUS의 결과 값이 왜 이렇게 나왔는지 설명
-- NULL 값과 연산하면 무조건 NULL 값이기 때문!