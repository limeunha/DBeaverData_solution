------------- 초기화 ----------------
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE CLASS_STUDENT;
DROP TABLE CLASS;
DROP TABLE STUDENT;
------------- 초기화 끝 --------------

-- 예제1. 부서테이블 만들기
CREATE TABLE DEPT (
    DEPT_NO      NUMBER PRIMARY KEY,
    DEPT_NAME    VARCHAR2(20) NOT NULL
);
-- 예제2. 사원테이블 만들기
CREATE TABLE EMP (
    EMP_NO      NUMBER PRIMARY KEY,
    EMP_NAME    VARCHAR2(20) NOT NULL,
    DEPT_NO NUMBER NOT NULL,
    CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT (DEPT_NO)  --외래키 지정
);
-- 예제3. 부서테이블 데이터 넣기
INSERT INTO DEPT VALUES (1, '인사부');
INSERT INTO DEPT VALUES (2, '연구부');
INSERT INTO DEPT VALUES (3, '홍보부');
-- 예제4. 사원테이블 데이터 넣기
INSERT INTO EMP VALUES (1001, '정소화', 3);
INSERT INTO EMP VALUES (1002, '김용욱', 1);
INSERT INTO EMP VALUES (1003, '고명석', 2);
INSERT INTO EMP VALUES (1004, '김연아', 4); --에러

UPDATE EMP SET DEPT_NO=10 WHERE EMP_NAME='정소화'; --에러
UPDATE EMP SET DEPT_NO=1 WHERE EMP_NAME='정소화';

SELECT * FROM EMP WHERE DEPT_NO = 1;
DELETE FROM DEPT WHERE DEPT_NO = 1; --에러

-- 예제5. 잘못된 순서로 부서테이블과 직원 테이블 삭제하기
DROP TABLE DEPT;
-- 예제6. 올바른 순서로 부서테이블과 직원 테이블 삭제하기
DROP TABLE EMP;
DROP TABLE DEPT;
-- 예제7. 순서에 상관없이 부서테이블과 직원 테이블 삭제하기
DROP TABLE DEPT CASCADE CONSTRAINTS; 
DROP TABLE EMP;

-------------- 퀴즈 1번 --------------
-- 수업 테이블
CREATE TABLE CLASS (
    CLASS_NO      NUMBER PRIMARY KEY,
    CLASS_NAME    VARCHAR2(20) NOT NULL
);
-- 수업 DATA
INSERT INTO CLASS VALUES (1001, '수학');
INSERT INTO CLASS VALUES (1002, '국어');
-------------- 퀴즈 2번 --------------
-- 학생 테이블
CREATE TABLE STUDENT (
    STUDENT_NO      NUMBER PRIMARY KEY,
    STUDENT_NAME    VARCHAR2(20) NOT NULL
);
-- 학생 DATA
INSERT INTO STUDENT VALUES (2001, '정소화');
INSERT INTO STUDENT VALUES (2002, '김용욱');
INSERT INTO STUDENT VALUES (2003, '고명석');
-------------- 퀴즈 3번 --------------
-- 수업수강 테이블
CREATE TABLE CLASS_STUDENT (
    CS_NO      NUMBER PRIMARY KEY,
    CLASS_NO NUMBER NOT NULL,
    STUDENT_NO NUMBER NOT NULL,
    CONSTRAINT FK_CLASS_NO FOREIGN KEY(CLASS_NO) REFERENCES CLASS (CLASS_NO),
    CONSTRAINT FK_STUDENT_NO FOREIGN KEY(STUDENT_NO) REFERENCES STUDENT (STUDENT_NO)
);
-- 수강 DATA
INSERT INTO CLASS_STUDENT VALUES (1, 1001, 2001);
INSERT INTO CLASS_STUDENT VALUES (2, 1002, 2001);
INSERT INTO CLASS_STUDENT VALUES (3, 1001, 2002);
INSERT INTO CLASS_STUDENT VALUES (4, 1002, 2002);
INSERT INTO CLASS_STUDENT VALUES (5, 1002, 2003);



