-- DCL (DATA CONTROL LANGUAGE)

-- DCL�̶�?
-- > �����ͺ��̽��� �����ϰų� ��ü�� ������ �ִ� ���� ������ �ϴ� ���

-- DCL ��ɾ� ����
-- GRANT : ������ �ο��ϴ� ��ɾ�
-- REVOKE : ������ ȸ���ϴ� ��ɾ�
-- ROLE : ������ ��� �ο��� �� ����ϴ� ��ɾ�

-- GRANT CREATE SESSION TO DCL_TEST;

-- ����� �������
-- CREATE USER      ����� �̸�
-- INDENTIFIED BY   �н�����

-- ���� �ο�
-- GRANT    �ý��� ����
-- TO       USER;

-- ��ȯ ȸ��
-- REVOKE   �ý��۱���
-- FROM     USER;

CREATE TABLE �׽�Ʈ (
    TEST NUMBER
);
-- ORA-01031: insufficient privileges -- ������ ������� �ʴ�!!


-- ��Ű����?
-- �����ͺ��̽��� ����Ǵ� ������ ������ �������� ���� ������ ����
-- ���̺�, ��, �ε���, ������ ���� hr������ ��� ��ü�� hr�� ��Ű��
-- ��Ű���� �� �������� �����ϸ�, �̸��� ������ ����.
-- ����Ŭ������ ��Ű���� ����ڸ� �������� �ʰ� ����Ѵ�.

-- ��Ű��.���̺�.���̺�
SELECT * FROM HR.EMPLOYEES;

-- GRANT SELECT, UPDATE ON HR.EMPLOYEES TO DCL_TEST;

UPDATE HR.EMPLOYEES
SET FIRST_NAME = '��', LAST_NAME ='����'
WHERE EMPLOYEE_ID = 100;

SELECT * FROM HR.EMPLOYEES;

COMMIT;