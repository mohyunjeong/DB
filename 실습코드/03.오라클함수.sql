-- CHAPTER 03. ����Ŭ�Լ� --

-- �Լ���?
-- > �Է� ���� �־� Ư���� ����� ���� ��� ���� ���

-- ����� ���� �Լ� : ����ڰ� �ʿ信 ���� ���� ������ �Լ�

-- ���� �Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��� ������ ȣ���ؼ� ���
-- ������, ������, ��¥��, ��ȯ��, NULL �Լ�, �����Լ��� �ֽ��ϴ�.

-- �Լ��� ������ �� ����ϴ� �Է� �� : �Ű�����, ���ڰ�

-- [ ���� �� �Լ� ]

-- UPPER : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
-- LOWER : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���

SELECT UPPER('abcde123@@')
FROM DUAL; -- �׽�Ʈ�� ���̺�

-- DUAL ���̺��̶� ?
-- > ����Ŭ �ְ� ������(SYS) ������ ���̺�
-- > �ӽ� �����̳� �Լ��� ��� �� Ȯ�� �뵵�� ����ϴ� '�׽�Ʈ�� ���̺�'�̴�!!

-- �ǽ�) ���� ���̺��� ������ FIRST_NAME�� EMAIL ������ ���, �̸��� �빮�ڷ�, �̸��� ������ �ҹ��ڷ� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, UPPER(FIRST_NAME), EMAIL, LOWER(EMAIL)
FROM EMPLOYEES;


-- LENGTH : ��ȣ �� ���� �������� ���̸� ���ϴ� �Լ��̴�.
SELECT LENGTH('HELLO WORLD')
FROM DUAL;

-- ������ FIRST_NAME�� ���, FIRST_NAME�� ���̵� ���� ���
SELECT FIRST_NAME, LENGTH(FIRST_NAME)
FROM EMPLOYEES;

-- �ǽ�) ������ FIRST_NAME�� ���̰� 5�� �̻��� �������� ����ID, �̸� ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME 
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 5;


-- SUBSTR : ���ڿ��� �����ϴ� �Լ�
-- 1. SUBSTR (�Է� ��, ���� ��ġ, ���� ����)
-- > ���ڿ� �������� ���� ��ġ���� ���� ���̸�ŭ ���

-- 2. SUBSTR (�Է� ��, ���� ��ġ)
-- > ������� ���� �� ���ڿ� �������� ���� ��ġ���� ������ ���

SELECT '����Ʈ���簳�߿�',
    SUBSTR('����Ʈ���簳�߿�', 1, 3),
    SUBSTR('����Ʈ���簳�߿�', 4) AS ���簳�߿�
FROM DUAL;

-- ���� ���̺��� �Ի� ��¥(HIRE_DATE)���� ����, ��, �� ���� ���
-- �� �÷����� ����, ��, �� �̶�� ��Ī�� ����ؼ� ���!!
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME,
        HIRE_DATE,
        SUBSTR(HIRE_DATE, 1, 2) AS ����,
        SUBSTR(HIRE_DATE, 4, 2) AS ��,
        SUBSTR(HIRE_DATE, 7) AS ��
FROM EMPLOYEES;

-- ����) DUAL ���̺��� �̿��ؼ� 'https://smhrd.or.kr'�� ���ڿ��� �Է¹޾� smhrd ���ڿ��� �߶� ���
SELECT 'https://smhrd.or.kr',
        SUBSTR('https://smhrd.or.kr', 9, 5)
FROM DUAL;

-- RELACE : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
-- 1. REPLACE (���ڿ� ������ �� �÷�, �ٲٰ� ���� ����, �ٲ�� �� ����)
-- 2. REPLACE (���ڿ� ������ �� �÷�, �ٲٰ� ���� ����)
-- > �ٲ�� �� ���ڸ� ���� �� �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ǹ�����!!

SELECT '����Ʈ#���簳�߿�',
        REPLACE('����Ʈ#���簳�߿�', '#', '-'),
        REPLACE('����Ʈ#���簳�߿�', '#') AS ����
FROM DUAL;

-- �ǽ�) ���� ���̺��� �Ի� ��¥�� ���
-- '/'�� '-'���� �ٲ㼭 ����� �ϰ� ��Ī�� ���������� ����
-- '/'�� �����ؼ� ����� �ϰ� ��Ī�� ������ ����
SELECT * FROM EMPLOYEES;

SELECT HIRE_DATE,
        REPLACE(HIRE_DATE, '/', '-')  AS ������,
        REPLACE(HIRE_DATE, '/') AS ����
FROM EMPLOYEES;


-- CONCAT : �� ���ڿ� �����͸� ��ġ�� �Լ�
-- ���������� 2���� �� �� �ֽ��ϴ�. �׷��� 2���� ���ڿ��� ��ġ�� �Լ��̴�!
-- �ռ������� '||'�� �̿��ϸ� ���Ѵ�� ���ڿ� ������ �����ϴ�

SELECT CONCAT('����Ʈ', '���簳�߿�') || '�ְ��Դϴ�' || '!!!'
FROM DUAL;

-- ���� ���̺��� ������ �̸��� ����ϴµ�, ���� �̸� �տ� '�̸��� ' ���ĺ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, CONCAT('�̸��� ', FIRST_NAME) || '�Դϴ�'
FROM EMPLOYEES;


-- TRIM : �Է� ���� ������ �������� �� ���� ������ �����մϴ�.
SELECT TRIM('              �������� �ְ� �Դϴ�      '),
        REPLACE(TRIM('           ��  ��  �� �� ��         �� �Դϴ�             '), ' '),
        REPLACE('           ��  ��  �� �� ��         �� �Դϴ�             ', ' ')
FROM DUAL;


-- [ ������ �Լ� ]

-- ROUND : Ư�� ��ġ���� �ݿø��ϴ� �Լ�
-- 1. ROUND ( �ݿø� �� ����, �ݿø� ��ġ )
-- 2. ROUND ( �ݿø� �� ���� )
-- > �ݿø� ��ġ ���� �� �Ҽ��� ù ��° �ڸ����� ������ �ݿø� ����


-- TRUNC : Ư�� ��ġ���� ������ �Լ�
-- 1. TRUNC ( ���� �� ����, ���� ��ġ )
-- 2. TRUNC ( ���� �� ���� )
-- > ���� ��ġ ���� �� �Ҽ��� ù ��° �ڸ����� ������ ���� ����

SELECT ROUND(1234.56789, 1),
        ROUND(1234.56789, 2),
        ROUND(1234.56789, 3),
        ROUND(1234.56789, 4),
        ROUND(1234.56789) AS �����ݿø�
FROM DUAL;

SELECT TRUNC(1234.56789, 1),
        TRUNC(1234.56789, 2),
        TRUNC(1234.56789, 3),
        TRUNC(1234.56789, 4),
        TRUNC(1234.56789) AS ��������
FROM DUAL;


-- MOD : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
-- > Ȧ��, ¦���� �����Ҷ� �����ϰ� ����Ѵ�.

-- MOD ( ������ �� ����, ���� ���� )

SELECT MOD (10, 2), -- 0
        MOD (10, 3), -- 1
        MOD (15, 6) -- 3
FROM DUAL;


-- [ ��¥�� �Լ� ]

-- SYSDATE : ���� ��¥�� �ð��� ������ִ� �Լ�
-- > �Է� �� �ٷ� ��� �Ǹ�, ���� �ð��� �� �������� ��� ����
-- > ��¥�� �Լ��� ������ ����

SELECT SYSDATE
FROM DUAL;

-- ��¥ ���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE AS NOW,
        SYSDATE -1 AS YESTERDAY,
        SYSDATE +1 AS TOMORROW
--      SYSDATE + SYSDATE -> ��¥ �����ͳ����� ������ �Ұ���!!
FROM DUAL;

-- SYSDATE �Լ� Ȱ��
SELECT SYSDATE AS ����,
        SYSDATE + 1 AS "�Ϸ縦 ���� ��",
        SYSDATE + 1/24 AS "�� �ð� ���� ��",
        SYSDATE + 1/24/60 AS "�� ���� ���� ��",
        SYSDATE + 1/24/60/60 AS "�� �ʸ� ���� ��"
FROM DUAL;


-- ADD_MONTHS : �� ���� ���� ��¥�� ���ϴ� �Լ�
-- ADD_MONTH ( ��¥ ������, ���ϰų� �� ���� �� )
SELECT SYSDATE AS NOW,
        ADD_MONTHS(SYSDATE, +1) AS "1���� ��",
        ADD_MONTHS(SYSDATE, -3) AS "3���� ��"
FROM DUAL;


-- [ ��ȯ�� �Լ� ]
-- �Ͻ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��
-- ����� ����ȯ : ������ ��ȯ �� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� ���� ���ִ� ��

-- TO_CHAR : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ ���ִ� �Լ�
-- TO_CHAR ( ��ȯ �� ������, ��� ���� )

-- ���� �����ϱ�
SELECT * FROM EMPLOYEES;

SELECT SALARY,
        TO_CHAR(SALARY, 'L999,999')
FROM EMPLOYEES;

-- ��¥ �����ϱ�
SELECT TO_CHAR(SYSDATE, 'YY/MM/DD/DAY')
FROM DUAL;


-- TO_NUMBER : ���� �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ�
-- TO_NUMBER ( ���ڿ� ������, �ν� �� ���� ����)

SELECT TO_NUMBER('1,000', '999,999') + 500
FROM DUAL;


-- TO_DATE : ���� �����͸� ��¥ �����ͷ� ��ȯ���ִ� �Լ�
-- TO_DATE(���ڿ� ������, �ν� �� ��¥ ����)
-- ���ڿ� �Ǵ� �÷��� �����͸� ��¥ �������� ��ȯ�Ͽ� �ִ� ��
-- ��� �̸��̳� �ֹε�Ϲ�ȣ ���� ���� ��¥�� ������ �Ұ���

SELECT TO_DATE('2024-02-28', 'YYYY-MM-DD')
FROM DUAL;


-- �ش� ���̺��� �ּҰ� NULL���� ���� ������ ������ ����Ϸ��� �Ѵ�. �ùٸ� SQL����?
-- 1) SELECT * FROM �������� WHERE �ּ� = NULL; --> '='�� ��� �Ұ�
-- 2) SELECT * FROM �������� WHERE �ּ� IS NULL; --> �̰� ����!

-- NULL ó�� �Լ�
-- NVL / NVL2 : NULL���� ��ü �� �� �ִ� �Լ�
-- 1. NVL(NULL���� ���θ� �˻��� ������, NULL�� ��� ��ȯ�� ������)
-- 2. NVL2(NULL���� ���θ� �˻��� ������ <1>,
--         <1>�� NULL�� �ƴ� ��� ��ȯ�� ������ <2>
--         <1>�� NULL�� ��� ��ȯ�� ������ <3>)

-- ���� ���̺��� ����ID, FIRST_NAME, MANAGER_ID�� ���
-- * �Ŵ����� �ִ� ������ '����'���� ���
-- * �Ŵ����� ���� ������ '��ǥ'�� ���
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, NVL2(MANAGER_ID, '����', '��ǥ')
FROM EMPLOYEES;

-- ���� ���̺��� ���ʽ��� ���� �������� ���� 0���� ��ü�ؼ� ���
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME, COMMISSION_PCT, NVL(COMMISSION_PCT, 0)
FROM EMPLOYEES;


-- [ ���� �Լ� ]
-- DECODE : ��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ�
-- > �˻� ���� ���ؼ� ������ ���� ��ȯ

-- DECODE ( �˻� ����� �� �÷� �Ǵ� ������ <1>, �� <2>, ��ġ �� ��ȯ�� �� <3>
--          , ��ġ���� ���� �� ��ȯ �� <������> )

-- ���� ���̺��� �Ŵ����� �ִ� ������ '����'���� �Ŵ����� ���� ������ '��ǥ'�� ���(DECODE �Լ���)
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID,
        FIRST_NAME,
        MANAGER_ID,
        DECODE(MANAGER_ID, NULL, '��ǥ', '����')
FROM EMPLOYEES;
