-- CHAPTER 08. 서브쿼리  --

-- 서브쿼리란?
-- > SQL문을 실행하는데 필요한 데이터를 추가로 조회하기 위해서
--    SQL 내부에서 사용하는 SELECT 문을 의미
--   서브쿼리는 메인 쿼리 안에 포함된 종속적인 관계

-- 메인쿼리 : 서브 쿼리의 결과 값을 사용하여 기능을 수행하는 영역
-- 서브쿼리 : 메인 쿼리의 조건식에 들어가는 값을 의미

-- 직원 테이블에서 Jack의 급여보다 낮은 직원의 이름과 급여를 출력

-- 1. 테이블의 정보를 확인
SELECT * FROM EMPLOYEES;

-- 2. 조건의 기준이 되는 Jack의 급여의 정보를 확인
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Jack';

-- 3. 2번째의 결과 값을 가지고 조건절을 통해 결과 값 출력
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 8400;

-- 서브쿼리를 사용해서 풀이
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (
SELECT SALARY -- 8400(잭의 급여 정보)
FROM EMPLOYEES
WHERE FIRST_NAME = 'Jack'
);

-- 직원 테이블에서 James의 급여보다 낮은 직원의 이름과 급여 정보를 조회
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'James'
);

-- James의 급여 정보를 확인
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'James';

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (2400, 2500); -- error!

-- 서브 쿼리의 특징
-- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 ()로 묶어서 사용합니다.
-- 2. 서브쿼리의 SELECT 절에 명시한 컬럼은 메인쿼리의 비교 대상과 같은 자료형과 개수를 지정해야 한다.
-- 3. 서브쿼리의 있는 SELECT문의 결과 행수는 함께 사용하는 메인쿼리의 연산자 종류와 호환 가능해야 한다.
-- 즉, 단 하나의 데이터로만 연산 가능한 연산자라면 서브쿼리의 결과 행 수도 하나여야 한다.
-- 연산자와 함께 상호작용하는 방식에 따라서 단일행 서브쿼리와 다중행 서브쿼리로 나뉜다.

-- 단일행 서브쿼리란?
-- > 실행 결과가 단 하나의 행으로 나오는 서브쿼리를 말한다.
-- > =, >, >=, <, <=, !=, <>, ^= (단일행 연산자)

-- 직원 테이블에서 Nancy보다 빨리 입사한 직원의 이름과 입사일 조회

-- 1. Namcy의 입사 날짜 정보를 확인 (서브쿼리)
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nancy'; -- 2002/08/17

-- 2. 1번째 결과를 가지고 메인쿼리의 비교
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < (
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nancy'); -- 2002/08/17

-- 직원 테이블에서 평균 급여보다 높은 급여를 받는 직원의 이름과 급여 정보를 조회
-- 1. 직원들의 평균 급여의 정보(서브쿼리의 결과값)
SELECT AVG(SALARY)
FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841

-- 2. 1번의 결과값을 가지고 서브쿼리를 이용해서 문제를 풀어보세요!
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (
SELECT AVG(SALARY)
FROM EMPLOYEES);


-- 다중행 서브쿼리란?
-- 실행 결과 행이 여러개로 나오는 서브쿼리를 말합니다.
-- 단일행 연산자는 사용할 수 없고 다중행 연산자를 사용해야 한다.

-- 다중행 연산자의 종류
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하는 데이터가 있으면 TRUE 값을 반환
-- > IN (서브쿼리)

-- ANY, SOME : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE 값을 반환
-- > 비교연산자 ANY (서브쿼리)

-- ALL : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE 값 반환
-- > 비교연산자 ALL (서브쿼리)

-- EXISTS : 서브쿼리 결과 값이 '존재'하는지 여부만 확인 (즉, 행이 하나 이상이면 TRUE)
-- > EXISTS (서브쿼리)

-- 각 부서별 최고 급여와 동일한 급여를 받는 직원들의 정보를 출력(부서ID, FIRST_NAME, SALARY)
-- 1. 부서별 최고 급여의 정보(서브쿼리)
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 2. 서브쿼리를 이용해서 결과값 출력
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY IN (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);

-- 부서별 최고 급여와 같은 급여를 가지는 모든 직원들의 정보가 출력

-- ANY 연산자 사용
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = ANY (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
-- IN 연산자와 같은 결과값이 나옴, 현업에서는 IN 연산자를 많이 사용한다.
-- 조건에 만족하는 결과가 하나도 참이면 참을 반환한다.

-- 부서별 최고 급여와 높은 급여를 받는 직원들의 정보가 출력
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= ANY (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
                      
-- 부서별 최고 급여가 하나라도 참이면 참인 결과 값이 반환
-- 값들 중 어떤 하나의 값보다 메인 쿼리의 값이 큰 값을 가지면 모든 값이 출력이 된다.
-- 즉 부서별 최소 급여보다 높은 값들은 출력이 된다!!


-- ALL
-- 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족해야만 TRUE 값이 반환
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= ALL (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
-- 메인쿼리는 서브쿼리의 모든 결과 값을 만족해야 함
-- 서브쿼리의 결과 값 중 가장 큰 값과 비교를 해서 크거나 같은 값을 가진 데이터만 출력
-- 최대 값보다 큰 값만 구하겠다


-- EXISTS 연산자는 존재 여부만 확인을 한다.

-- 부서ID별 직원 수를 확인
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 서브쿼리의 결과 값이 존재하는 경우
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXISTS (
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110);

-- 서브쿼리의 결과 값이 존재하지 않는 경우
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXISTS (
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 120);


-- 다중 컬럼 서브쿼리
-- > 서브쿼리의 결과로 여러 컬럼이 반환돼 메인쿼리의 조건과 동시에 비교되는 것을 의미
-- > 주로 IN 연산자와 함께 사용

-- 각 부서별 최고 급여와 동일한 급여를 받는 직원의 정보(부서ID, FIRST_NAME, SALARY)
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);

-- 2개의 컬럼을 비교를 해서 해당 부서별로 최고 급여를 받는 지원만 출력이 제한되서 조회!

-- 인라인뷰(Inline View)
-- > FROM절에서 가상 테이블처럼 사용하는 서브쿼리
-- 인라인 뷰를 사용하면 서브쿼리의 결과를 마치 테이블처럼 사용할 수 있다.
-- 데이터베이스 SELECT문을 객체로써 저장해 테이블처럼 사용하는 VIEW와 달리 인라인뷰는 쿼리 내에서 즉시 처리

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 인라인 뷰를 사용해서 부서별로 최고 급여를 받는 직원 이름, 부서ID, 부서별 최고 급여
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, B."부서별 최고 급여"
FROM EMPLOYEES E, (
SELECT DEPARTMENT_ID, MAX(SALARY) AS "부서별 최고 급여"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID) B -- 인라인 뷰로 만든 가상 테이블
WHERE E.DEPARTMENT_ID = B.DEPARTMENT_ID
AND E.SALARY = B."부서별 최고 급여"; -- 부서ID가 같으면서 최고 급여와 같은 값

-- 내부 컬럼을 지정해줄 수 없음!!
-- 별칭을 줘야만 컬럼을 지정해서 쓸 수 있다는 특징을 가지고 있다.

-- 스칼라 서브 쿼리(Scalar Subquery)
-- SELECT에서 사용되는 쿼리!!
-- 하나의 컬럼에 대한 하나의 행만 반환되는 특징을 가지고 있어요
-- JOIN 없이 JOIN처럼 기능하고자 할 때 사용

-- 직원이름과 급여와 부서아이디, 부서이름 출력
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- 스칼라 서브쿼리 사용
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) 
FROM EMPLOYEES E; 

-- 스칼라 서브쿼리를 이용하면 NULL값 데이터도 출력된다.