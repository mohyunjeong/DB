-- CHAPTER 08. ��������  --

-- ����������?
-- > SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
--    SQL ���ο��� ����ϴ� SELECT ���� �ǹ�
--   ���������� ���� ���� �ȿ� ���Ե� �������� ����

-- �������� : ���� ������ ��� ���� ����Ͽ� ����� �����ϴ� ����
-- �������� : ���� ������ ���ǽĿ� ���� ���� �ǹ�

-- ���� ���̺��� Jack�� �޿����� ���� ������ �̸��� �޿��� ���

-- 1. ���̺��� ������ Ȯ��
SELECT * FROM EMPLOYEES;

-- 2. ������ ������ �Ǵ� Jack�� �޿��� ������ Ȯ��
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'Jack';

-- 3. 2��°�� ��� ���� ������ �������� ���� ��� �� ���
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 8400;

-- ���������� ����ؼ� Ǯ��
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (
SELECT SALARY -- 8400(���� �޿� ����)
FROM EMPLOYEES
WHERE FIRST_NAME = 'Jack'
);

-- ���� ���̺��� James�� �޿����� ���� ������ �̸��� �޿� ������ ��ȸ
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'James'
);

-- James�� �޿� ������ Ȯ��
SELECT SALARY
FROM EMPLOYEES
WHERE FIRST_NAME = 'James';

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < (2400, 2500); -- error!

-- ���� ������ Ư¡
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ()�� ��� ����մϴ�.
-- 2. ���������� SELECT ���� ����� �÷��� ���������� �� ���� ���� �ڷ����� ������ �����ؾ� �Ѵ�.
-- 3. ���������� �ִ� SELECT���� ��� ����� �Բ� ����ϴ� ���������� ������ ������ ȣȯ �����ؾ� �Ѵ�.
-- ��, �� �ϳ��� �����ͷθ� ���� ������ �����ڶ�� ���������� ��� �� ���� �ϳ����� �Ѵ�.
-- �����ڿ� �Բ� ��ȣ�ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.

-- ������ ����������?
-- > ���� ����� �� �ϳ��� ������ ������ ���������� ���Ѵ�.
-- > =, >, >=, <, <=, !=, <>, ^= (������ ������)

-- ���� ���̺��� Nancy���� ���� �Ի��� ������ �̸��� �Ի��� ��ȸ

-- 1. Namcy�� �Ի� ��¥ ������ Ȯ�� (��������)
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nancy'; -- 2002/08/17

-- 2. 1��° ����� ������ ���������� ��
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < (
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nancy'); -- 2002/08/17

-- ���� ���̺��� ��� �޿����� ���� �޿��� �޴� ������ �̸��� �޿� ������ ��ȸ
-- 1. �������� ��� �޿��� ����(���������� �����)
SELECT AVG(SALARY)
FROM EMPLOYEES; -- 6461.831775700934579439252336448598130841

-- 2. 1���� ������� ������ ���������� �̿��ؼ� ������ Ǯ�����!
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY > (
SELECT AVG(SALARY)
FROM EMPLOYEES);


-- ������ ����������?
-- ���� ��� ���� �������� ������ ���������� ���մϴ�.
-- ������ �����ڴ� ����� �� ���� ������ �����ڸ� ����ؾ� �Ѵ�.

-- ������ �������� ����
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�ϴ� �����Ͱ� ������ TRUE ���� ��ȯ
-- > IN (��������)

-- ANY, SOME : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE ���� ��ȯ
-- > �񱳿����� ANY (��������)

-- ALL : ���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE �� ��ȯ
-- > �񱳿����� ALL (��������)

-- EXISTS : �������� ��� ���� '����'�ϴ��� ���θ� Ȯ�� (��, ���� �ϳ� �̻��̸� TRUE)
-- > EXISTS (��������)

-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� �������� ������ ���(�μ�ID, FIRST_NAME, SALARY)
-- 1. �μ��� �ְ� �޿��� ����(��������)
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 2. ���������� �̿��ؼ� ����� ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY IN (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);

-- �μ��� �ְ� �޿��� ���� �޿��� ������ ��� �������� ������ ���

-- ANY ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = ANY (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
-- IN �����ڿ� ���� ������� ����, ���������� IN �����ڸ� ���� ����Ѵ�.
-- ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ�Ѵ�.

-- �μ��� �ְ� �޿��� ���� �޿��� �޴� �������� ������ ���
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= ANY (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
                      
-- �μ��� �ְ� �޿��� �ϳ��� ���̸� ���� ��� ���� ��ȯ
-- ���� �� � �ϳ��� ������ ���� ������ ���� ū ���� ������ ��� ���� ����� �ȴ�.
-- �� �μ��� �ּ� �޿����� ���� ������ ����� �ȴ�!!


-- ALL
-- ���������� ���ǽ��� ���������� ��� ��ΰ� �����ؾ߸� TRUE ���� ��ȯ
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= ALL (
SELECT MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);
-- ���������� ���������� ��� ��� ���� �����ؾ� ��
-- ���������� ��� �� �� ���� ū ���� �񱳸� �ؼ� ũ�ų� ���� ���� ���� �����͸� ���
-- �ִ� ������ ū ���� ���ϰڴ�


-- EXISTS �����ڴ� ���� ���θ� Ȯ���� �Ѵ�.

-- �μ�ID�� ���� ���� Ȯ��
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- ���������� ��� ���� �����ϴ� ���
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXISTS (
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 110);

-- ���������� ��� ���� �������� �ʴ� ���
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXISTS (
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 120);


-- ���� �÷� ��������
-- > ���������� ����� ���� �÷��� ��ȯ�� ���������� ���ǰ� ���ÿ� �񱳵Ǵ� ���� �ǹ�
-- > �ַ� IN �����ڿ� �Բ� ���

-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ������ ����(�μ�ID, FIRST_NAME, SALARY)
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID);

-- 2���� �÷��� �񱳸� �ؼ� �ش� �μ����� �ְ� �޿��� �޴� ������ ����� ���ѵǼ� ��ȸ!

-- �ζ��κ�(Inline View)
-- > FROM������ ���� ���̺�ó�� ����ϴ� ��������
-- �ζ��� �並 ����ϸ� ���������� ����� ��ġ ���̺�ó�� ����� �� �ִ�.
-- �����ͺ��̽� SELECT���� ��ü�ν� ������ ���̺�ó�� ����ϴ� VIEW�� �޸� �ζ��κ�� ���� ������ ��� ó��

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- �ζ��� �並 ����ؼ� �μ����� �ְ� �޿��� �޴� ���� �̸�, �μ�ID, �μ��� �ְ� �޿�
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, B."�μ��� �ְ� �޿�"
FROM EMPLOYEES E, (
SELECT DEPARTMENT_ID, MAX(SALARY) AS "�μ��� �ְ� �޿�"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID) B -- �ζ��� ��� ���� ���� ���̺�
WHERE E.DEPARTMENT_ID = B.DEPARTMENT_ID
AND E.SALARY = B."�μ��� �ְ� �޿�"; -- �μ�ID�� �����鼭 �ְ� �޿��� ���� ��

-- ���� �÷��� �������� �� ����!!
-- ��Ī�� ��߸� �÷��� �����ؼ� �� �� �ִٴ� Ư¡�� ������ �ִ�.

-- ��Į�� ���� ����(Scalar Subquery)
-- SELECT���� ���Ǵ� ����!!
-- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�Ǵ� Ư¡�� ������ �־��
-- JOIN ���� JOINó�� ����ϰ��� �� �� ���

-- �����̸��� �޿��� �μ����̵�, �μ��̸� ���
SELECT E.FIRST_NAME, E.SALARY, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- ��Į�� �������� ���
SELECT FIRST_NAME, SALARY, DEPARTMENT_ID, (
SELECT DEPARTMENT_NAME
FROM DEPARTMENTS
WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) 
FROM EMPLOYEES E; 

-- ��Į�� ���������� �̿��ϸ� NULL�� �����͵� ��µȴ�.