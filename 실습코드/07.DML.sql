-- CHAPTER 06. DML(DATA MAINPULATION LANGUAGE) --

-- DML�̶�?
-- ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ������ �� ����ϴ� ���Ǿ��̴�.
-- > ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�.

-- DML ���� - ���ξ���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- �����

-- 1)
-- INSERT INTO ���̺��(�÷�1, ...)
-- VALUES (��1, ...)
-- > INSERT�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �¾ƾ� �Ѵ�!!!!

-- 2)
-- INSERT INTO ���̺��
-- VALUES (��...)
-- > INSERT�� �÷� ����Ʈ ���� �� VALUES�� �Է��� ���� ���̺� �÷� ���� ����, �ڷ����� �¾ƾ� �Ѵ�!!

-- 1. ���� ������ �ֱ�
INSERT INTO SMHRD_JOIN (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
VALUES ('SMHRD01', '12345', '������', SYSDATE, 22, '010-8255-7026', '201140@jnu.ac.kr');