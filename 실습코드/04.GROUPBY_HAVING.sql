-- CHAPTER 04. GROUP BY / HAVING �� --

-- ���� �Լ��� ����
-- ���� �� �Լ� : �Էµ� �ϳ��� �� �� ����� �ϳ��� ������ �Լ�
-- ���� �� �Լ� : ���� ���� �Է¹޾� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
-- > ������ �Լ��� '���� �Լ�'��� �θ��ϴ�.

-- ������ �Լ�(���� �Լ�)�� Ư¡
-- 1. ���� �Լ��� NULL ���� �����ϴ� Ư���� ������ �ִ�.
-- 2. ���� �Լ��� �׷�ȭ(GROUP BY)�� �Ǿ� �ִ� ���¿����� ����� �����ϴ�!!!

-- ���� �Լ��� ����
-- COUNT : ������ �������� ������ ��ȯ
--   SUM : ������ �������� ���� ��ȯ
--   MAX : ������ ������ �� �ִ� �� ��ȯ
--   MIN : ������ ������ �� �ּ� �� ��ȯ
--   AVG : ������ ������ �� ��� �� ��ȯ

-- COUNT(������)

-- ���� ���̺��� ����ID�� ���� ������ ��ȸ (�� ���� ��)
SELECT * FROM EMPLOYEES;

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES;

/*
SELECT EMPOYEE_ID, -- 107���� ��
        COUNT(EMPLOYEE_ID) -- 1���� ��
FROM EMPLOYEES;
-- > ����ϰ��� �ϴ� ���� ������ ���� �ʾƼ� ������ ����.
*/

SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY ();
-- ���� ���̺��� �ϳ��� �׷����� ���� �ɷ� �ν� -> ���� �Լ��� ����!!

-- �μ� ���̺��� �μ�ID ���� ������ ���
SELECT * FROM DEPARTMENTS;

SELECT COUNT(DEPARTMENT_ID)
FROM DEPARTMENTS;

-- ���� ���̺��� �μ�ID ���� ������ ���
SELECT * FROM EMPLOYEES;

SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;

-- DEPARTMENT_ID�� NULL�� ���� �̸� ���
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS  NULL;

-- COUNT �Լ��� *(�ƽ�Ÿ����ũ)�� ����� �� �ֽ��ϴ�.
-- �ٸ� ���� �Լ��� ����� ���ؿ�!!
SELECT * FROM EMPLOYEES;

SELECT COUNT(*)
FROM EMPLOYEES;
-- > �ƽ�Ÿ����ũ�� ����ϸ� NULL ������ �����ؼ� ����� �� �ݴϴ�!!


-- ����1) ���� ���̺��� �޿��� �� �հ踦 ��� (SUM �Լ�)
SELECT * FROM EMPLOYEES;

SELECT SUM(SALARY)
FROM EMPLOYEES;


-- ����2) �������̺��� �������� �ִ� �޿��� �ּ� �޿��� ��� (MAX/MIN �Լ�)
SELECT * FROM EMPLOYEES;

SELECT MAX(SALARY) AS MAX,
        MIN(SALARY) AS MIN
FROM EMPLOYEES;


-- ����3) �������̺��� �μ�ID�� 100�� ������ ��� �޿��� ��� (AVG �Լ�)
--        * ������� �Ҽ��� 1�� �ڸ����� �ݿø�
SELECT * FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY), 1)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;


-- ���̺� ���� Ȯ��
SELECT * FROM ����������;
SELECT * FROM ����ǥ;


-- GROUP BY : Ư�� �÷��� �������� �׷�ȭ (����)

-- GROUP BY �����
-- 4. SELECT   ��ȸ�� �÷���1, ...
-- 1. FROM     ���̺� ��
-- 2. WHERE    ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. GROUP BY Ư�� �÷��� �������� �׷�ȭ

-- ������ ���� ���̺��� �Ҽӹ� ��(GROUP BY) �л��� �ο� �� ��ȸ
SELECT * FROM ����������;

SELECT �Ҽӹ�, COUNT(�Ҽӹ�) AS �Ҽӹݺ��ο���
FROM ����������
GROUP BY �Ҽӹ�;

-- ����1) ����ǥ ���̺��� ���񺰷� �ְ� ������ ���� ������ ���
SELECT * FROM ����ǥ;

SELECT ����,
        MAX(����) AS �ְ���,
        MIN(����) AS ��������
FROM ����ǥ
GROUP BY ����;

-- ����2) ����ǥ ���̺��� �л����� ��� ���� ���(��, �Ҽ��� 1�ڸ������� ���)
SELECT * FROM ����ǥ;

SELECT �л�ID,
        ROUND(AVG(����), 1) AS �������
FROM ����ǥ
GROUP BY �л�ID;

-- ����3) ����ǥ ���̺��� �л����� JAVA�� DATABASE ������ ������ ���� ���
SELECT * FROM ����ǥ;

SELECT �л�ID,
        SUM(����) AS "JAVA��DATABASE������"
FROM ����ǥ
WHERE ���� IN ('JAVA', 'DATABASE')
GROUP BY �л�ID;


-- SQL ���� ����
-- FROM > WHERE > GROP BY > HAVING > SELECT > ORDER BY
-- 5. SELECT    ����ϰ� ���� �÷� �ۼ�
-- 1. FROM      �����͸� ������ ���̺�
-- 2. WHERE     ���ϴ� �÷��� ������ ������ ���� ����
-- 3. GROUP BY  Ư�� �÷��� �������� �׷�ȭ
-- 4. HAVING    �׷�ȭ ���¿��� �����Ϳ� ���� ����
-- 6. ODER BY   Ư�� �÷����� ����

-- HAVING �� : GROUP BY ���� ������ ���� ����� ����
-- > ���谡 �Ϸ�� ����� ������ ���� ���͸��ϴ� ����
-- > ������ ���� ����� ����� �ȴٴ� ������ WHERER ���� ���������,
--   HAVING ���� �׷�ȭ�� ��󿡼��� ����� �����ϴٴ� ������ �ٸ�!!

-- ����ǥ ���̺��� �л��� ��� ������ ���ϵ�, ��� ������ 75 ������ �л��鸸 ���
SELECT * FROM ����ǥ;

SELECT �л�ID,
        ROUND(AVG(����), 1)
FROM ����ǥ
GROUP BY �л�ID
HAVING AVG(����) <= 75;

-- ����1) ������ ���� ���̺��� �� �� �ο� ���� 3�� �̻��� �ݸ� ���
SELECT * FROM ����������;

SELECT �Ҽӹ�,
        COUNT(�Ҽӹ�) AS �ο���
FROM ����������
GROUP BY �Ҽӹ�
HAVING COUNT(�Ҽӹ�) >= 3;

-- ����2) ���� ���̺��� �μ��� �ְ� ������ 100,000 �̻��� �μ��� ���
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID,
        MAX(SALARY * 12) AS �ְ���
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY * 12) >= 100000;

-- ����3) ����ǥ ���̺��� �л��� ��� ������ ����ϵ�, NULL�� �ƴ� ���� ���(��, ������ �Ҽ��� 1�� �ڸ������� ���)
SELECT * FROM ����ǥ;

SELECT �л�ID,
        ROUND(AVG(����), 1) AS ��ռ���
FROM ����ǥ
GROUP BY �л�ID
HAVING ROUND(AVG(����)) IS NOT NULL;
