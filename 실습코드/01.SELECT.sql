-- CHAPTER 01. SELECT --

-- ��¥ ũ�� Ű��� : ���� -> ȯ�漳�� -> �ڵ������� -> �۲�
-- �ּ� ���� �ٲٱ� : ���� -> ȯ�漳�� -> �ڵ������� -> PL/SQL �ּ�

-- �ּ� ��ȣ 1 : -- -> ���� �ּ�
-- �ּ� ���� 2 : /**/ -> ���� ���� �� ���� �ּ� ó���� �� �����
/* 
1. SQL ������ ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �ݵ�� ����Ŭ��(;)�� �������Ѵ�!!!
4. SQL ���� ����Ű : CTRL + Enter, F9
*/

DESC EMPLOYEES;
-- DESC(DESCRIBE) : SQL���� ���̺��� ������ Ȯ���� �� ����ϴ� ��ɾ�

SELECT FIRST_NAME, LAST_NAME
  FROM EMPLOYEES;

-- [ SELECT �� �⺻ ��� ��� ] 
-- # ���� ���ڴ� ���� ����
-- 2. SELECT  ��ȸ�� �÷��� 1, ....
-- 1.   FROM  ��ȸ�� ���̺� ��

-- ��ü �����͸� ��ȸ�ϴ� ���
-- *( �ƽ�Ÿ����ũ ) : ��ü�� �ǹ�

-- ���� ���̺��� ��ü ������ ���
SELECT *
  FROM EMPLOYEES;
  
-- �ǽ� 1 ) �μ� ���̺��� ��ü ������ ���
SELECT *
  FROM DEPARTMENTS;
  
-- �ǽ� 2 ) ���� ���̺��� ����ID, FIRST_NAME, EMAIL ������ ���
DESC EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, EMAIL
  FROM EMPLOYEES;
  
-- �ǽ� 3 ) �μ� ���̺��� �μ�ID, �μ���, LOCATION_ID�� ���
DESC DEPARTMENTS;

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
  FROM DEPARTMENTS;
  
-- �ǽ� 4 ) ���� ���̺��� EMAIL, ����ID, JOB_ID, LAST_NAME�� ������� ���
DESC EMPLOYEES;

SELECT EMAIL, EMPLOYEE_ID, JOB_ID, LAST_NAME
  FROM EMPLOYEES;
  
-- �ǽ� 5 ) ���� ���̺��� �������� �μ�ID�� ���
DESC EMPLOYEES;

SELECT DEPARTMENT_ID
  FROM EMPLOYEES;
  
  
-- DISTINCT : ������ �ߺ� ����

-- �ߺ� ���� ��� ���
-- SELECT DISTINCT ��ȸ�ϰ���� �÷���1, ...
--   FROM  ���̺�

-- �������� �μ�ID�� �ߺ� �����Ͽ� ���
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- �ǽ�) ���� ���̺��� JOB_ID�� �μ�ID�� �ߺ��� �����Ͽ� ���
DESC EMPLOYEES;

SELECT DISTINCT JOB_ID, DEPARTMENT_ID
  FROM EMPLOYEES;
  
-- DISTINCT �ߺ� ���Ŵ� �ڿ� 2�� �̻��� ������
-- �� �� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� '�ٸ���' ����Ѵ�.

-- �ǽ� 1) ���� ���̺��� �Ի����� ��� �� ���� ������ Ȯ�� * �ּ����� ���� ������ �Է�
DESC EMPLOYEES; 

SELECT HIRE_DATE -- 107��
  FROM EMPLOYEES; 

-- �ǽ� 2) ���� ���̺��� �Ի����� ��� �� �ߺ��� �����ؼ� ��� * �ּ����� ���� ������ �Է�
SELECT  DISTINCT HIRE_DATE -- 98��
  FROM EMPLOYEES; 
  
-- <<< TIP >>>
--> �÷��� ���� ������ �����ϴ� (+, -, *, /) !!

SELECT '�ȳ��ϼ���'
  FROM EMPLOYEES;
  
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES;
  
-- ����) ���� ���̺��� ������ �̸��� �޿�, ������ ���
DESC EMPLOYEES;

SELECT FIRST_NAME,
       SALARY,
       SALARY * 12
FROM EMPLOYEES;

  
-- ��Ī ����ϱ�
-- Alias ��� �ϸ� �� ���� ���� ���� �����ϴ� ���� ����
-- AS Ű���带 ����ؼ� ��Ī�� �����մϴ�.

SELECT FIRST_NAME,
       SALARY,
       SALARY * 12 AS "����" -- ��Ī : "", ���ڿ� : ''
FROM EMPLOYEES;

-- ��Ī ��� ���
-- 1. SELECT �÷��� ��Ī
-- 2. SELECT �÷��� "��Ī"
-- 3. SELECT �÷��� AS ��Ī
-- 4. SELECT �÷��� AS "��Ī"

-- �ǽ� ) ������ �̿��ؼ� ���� ���̺��� �Ի���, �Ի��� ���� ���� ���
-- �� �Ի����� ��Ī�� �Ի��Ϸ�, �Ի��� ���� ���� "�Ի��ϴ�����" ��Ī�� ����ؼ� ���
-- (4���� ��� ��� ����غ���)
DESC EMPLOYEES;

-- 1. SELECT �÷��� ��Ī
SELECT HIRE_DATE �Ի���,
       HIRE_DATE + 1 �Ի��ϴ�����
FROM EMPLOYEES;

-- 2. SELECT �÷��� "��Ī"
SELECT HIRE_DATE "�Ի���",
       HIRE_DATE + 1 "�Ի��� ���� ��" -- �ֵ���ǥ("") ���� ����ϸ� ���� ���� X
FROM EMPLOYEES;

-- 3. SELECT �÷��� AS ��Ī
SELECT HIRE_DATE AS �Ի���,
       HIRE_DATE + 1 AS �Ի��ϴ�����
FROM EMPLOYEES;

-- 4. SELECT �÷��� AS "��Ī"
SELECT HIRE_DATE AS "�Ի���",
       HIRE_DATE + 1 AS "�Ի��� ���� ��"
FROM EMPLOYEES;

          
-- OREDER BY ���̶�?
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ���
-- SQL ���� �������� ���� �������� ����
-- ������ ���� ����� �������� ������ �⺻������ ���������� ����

-- ASC(Ascending) : �������� ���� (1, 2, 3, 4, 5, ...)
-- DESC(decending) : �������� ���� (10, 9 , 8, 7 , 6 , 5, ...)

-- ���� ���̺��� ��� ������ ������ ���
-- �޿��� ������������ ����

SELECT *
  FROM EMPLOYEES
ORDER BY SALARY ASC;

-- �ǽ�) �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի� ��¥�� ���

SELECT FIRST_NAME, HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE ASC;

-- ���� ���̺��� ����ID, �μ�ID, �̸�, �޿� ������ ���
-- �� �μ�ID�� ������������, �޿��� ������������ �����ؼ� ���
DESC EMPLOYEES;

SELECT EMPLOYEE_ID,
       DEPARTMENT_ID,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC,
         SALARY DESC;
         
-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢�� �޿��� ���� ������ ���� ���� ������� ���
-- ���� �μ�ID�� ������������ ������ �Ŀ� �޿��� ������������ ������ ��


-- NULL ���̶�?
-- NULL ���̶� �������� ���� ������ ��� �ִ� ���¸� �ǹ�
-- ���� �������� �ʰų� �������� ���� ���� �ǹ�
-- ���� 0�� ���ڿ� ' '�� NULL ���� �ƴ�
-- *** NULL �� ������ �ϸ� ��� ���� ������ NULL �� ***

-- ����) ���� ���̺��� ����ID, ���ʽ�, ���ʽ� �ι��� ������ ���
-- �� ���ʽ� �ι��� ������ UP_BONUS�� ��Ī�� ����ؼ� ���
DESC EMPLOYEES;

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID, COMMISSION_PCT, COMMISSION_PCT * 2 AS ���ʽ��ι�
  FROM EMPLOYEES;
  
-- �������� UP_BONUS�� ��� ���� �� �̷��� ���Դ��� ����
-- NULL ���� �����ϸ� ������ NULL ���̱� ����!