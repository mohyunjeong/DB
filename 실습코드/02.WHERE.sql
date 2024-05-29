-- CHAPTER 02. WHERE --

-- [ WHERE�� �⺻ ��� ��� ]
-- 3. SELECT ��ȸ�� �÷���1, ...
-- 1. FROM ���̺� ��
-- 2. WHERE ��ȸ�� ���� �����ϱ� ���� ���ǽ�

-- �ǽ�1) ���� ���̺��� ����ID�� 105�� ������ FIRST_NAME�� LAST_NAME�� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 105;

-- �ǽ�2) �μ� ���̺��� �Ŵ��� ���̵� 100�� �μ� �̸��� �μ� ���̵� ���
SELECT * FROM DEPARTMENTS;

SELECT MANAGER_ID, DEPARTMENT_NAME, DEPARTMENT_ID
FROM DEPARTMENTS
WHERE MANAGER_ID = 100;

-- �ǽ�3) ���� ���̺��� �޿��� 9,000�� ������ ����ID, FIRST_NAME, �޿� ������ ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = 9000;


-- ��� ������ < +, -, *, / >
-- ������ �޿� ������ ����ϴµ� ��� ������ 4���� �̿��ؼ� ���

-- �� ������ [ >(�ʰ�), >=(�̻�), <(�̸�), <=(����) ]
-- ���� ���̺��� �޿��� 5,000 ������ ������ FIRST_NAME�� SALARY ���� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY <= 5000;

-- ���� ���̺��� ������ 50,000 ������ ������ �̸��� ������ ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY * 12 AS ����
FROM EMPLOYEES
WHERE SALARY * 12 < 50000;

-- � �� ������
-- = : ����
-- !=, <>, ^= : ���� �ʴ�
-- NOT A = B : ���� �ʴ�

-- �ǽ�1) ���� ���̺��� �۾�ID�� IT_PROG�� �ƴ� ������ �̸��� ����ID ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, EMPLOYEE_ID
FROM EMPLOYEES
WHERE JOB_ID != 'IT_PROG';

-- �ǽ�2) ���� ���̺��� EMAIL ������ SKING�� ������ ��� ���� ���
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE EMAIL = 'SKING';

-- �ǽ�3) ���� ���̺��� EMAIL ������ SKING�� �ƴ� ��� ���� ���
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE EMAIL != 'SKING';

-- �� ������
-- AND(�׸���) : ������ ��� �����ϴ� ��� TRUE ���� ��ȯ
-- OR(Ȥ��) : �ϳ��� �����̶� �����ϴ� ��� TRUE ���� ��ȯ

-- �ǽ�1) ���� ���̺��� �μ�ID�� 90�̰� �޿��� 5,000�̻��� ����ID�� ������ �̸�, �޿� ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
AND SALARY >= 5000;

-- �ǽ�2) ���� ���̺��� �μ�ID�� 100�̰ų� �Ի����� 06�� 06�� 02�� ���Ŀ� �Ի��� ������ �̸�, �μ�ID, �Ի��� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, DEPARTMENT_ID, HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100
OR HIRE_DATE > '06/06/02';

-- �ǽ�3) �μ�ID�� 100�̰ų� 90�� ���� �߿��� ���� ID�� 101�� ����ID, FIRST_NAME, ������ ���(��, ������ AnnSal�� ��Ī ����)
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY * 12 AS AnnSal
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 100
    OR DEPARTMENT_ID = 90)
   AND EMPLOYEE_ID = 101;
   
   
-- NULL ���� ������
-- IS NULL : ������ ���� NULL�� �� ��ȸ
-- IS NOT NULL : ������ ���� NULL�� �ƴ� �� ��ȸ

-- ���� ���̺��� ������ �̸��� ���ʽ��� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES;

-- ����1) ���� ���̺��� ���ʽ��� �ִ� ������ ���(FIRST_NAME, ���ʽ� ���� ���)
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- ����2) ���� ���̺��� �Ŵ��� ID�� ���� ������ ��� ���� ���
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID
IS NULL;


-- SQL ������
-- > SQL���� ����� �� �ִ� ������
-- > IN, NOT IN, BETWEEN, LIKE

-- IN : Ư�� �÷��� ���Ե� �����͸� ������ ��ȸ�� �� Ȱ��
-- =(�� ������) + OR(�� ������)
-- IN�� NULL���� �����ϴ� Ư¡�� ������ �ִ�.

-- ���� ���̺��� �μ�ID�� 30�̰ų� 50�̰ų� 90�� ������ ��� ���� ���
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID
IN (30, 50, 90);

-- �ǽ�) ���� ���̺��� �Ŵ���ID�� 100, 102, 103, NULL�� ���� �̸�, �Ŵ���ID ���(IN ������ �̿�)
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID IN (100, 102, 103, NULL);


-- NOT IN
-- IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- (!=) + (AND)
-- (���ǻ���) NOT IN�� NULL ���� ������ �ƿ� ���� �ȳ���!!

-- ���� ���̺��� �Ŵ���ID�� 100, 120, 101�� �ƴ� �������� �̸�, �ų���ID ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (100,120,101);

-- �ǽ�1) ���� ���̺��� �Ŵ���ID�� 145, 146, 147, 148, 149���ƴ� ���� �̸��� �ų���ID ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID NOT IN (145, 146, 147, 148, 149);

-- �ǽ�2) ���� ���̺��� ����ID�� AD_VP�̰ų� ST_MAN�� �����̸�, ����ID ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, JOB_ID
FROM EMPLOYEES
WHERE JOB_ID IN ('AD_VP', 'ST_MAN');


-- BETWEEN A AND B ������
-- > ���� ���� ���� �����͸� ��ȸ�� �� ���
-- SELECT ��ȸ�� �÷���1, ...
-- FROM ��ȸ�� ���̺��
-- WHERE �÷��� BETWEEN �ּڰ� AND �ִ밪;
-- > Ư�� �� ���� �ּ�, �ְ� ������ �����ؼ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- ���� ���̺��� �޿��� 10,000 �̻��̰� 20,000 �̸��� �������� ��� ���� ���
SELECT * FROM EMPLOYEES;

SELECT *
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000;

-- ���� ���̺��� 2005�⿡ �Ի��� ������ �̸��� �Ի��� ���
-- 05/01/01 ~ 05/12/31
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';


-- LIKE ������
-- > �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�� �� ���
-- > ���ϵ� ī�带 �̿��ؼ� ��Ī ������ ����

-- ���ϵ� ī�� ����
-- 1. % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- 2. _ : � ���̵� ��� ���� �� ���� ���� �����͸� �ǹ�

--����1) �������̺��� 650���� �����ϴ� �ڵ��� ��ȣ ã��
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%';

--����2) �������̺��� �̸��� S�� �����ϰ� n���� ������ ã��
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';

--����3) �������̺��� �̸��� it���� ������ �� 4������ ����ã��
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it';

--����4) �������̺��� �̸��� �ι�° ���ڰ� e�� ����ã��
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';

--����5) �������̺��� 01���� �Ի��� ����ã��
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '___01%';

