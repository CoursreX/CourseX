CREATE TABLE STUDENT (
                         STUDENT_ID VARCHAR2(20),
                         MAJOR_ID VARCHAR2(20),
                         STUDENT_PW VARCHAR2(30),
                         STUDENT_NAME VARCHAR2(20),
                         STUDENT_EMAIL VARCHAR2(30),
                         STUDENT_SEM NUMBER(1),
                         CREDIT_LIMIT NUMBER(2),
                         EMAIL_VERIFY_CODE VARCHAR2(10),
                         EMAIL_VERIFY_DATE DATE,
                         CONSTRAINT PK_STUDENT PRIMARY KEY (STUDENT_ID),
                         CONSTRAINT FK_STUDENT_MAJOR FOREIGN KEY (MAJOR_ID) REFERENCES MAJOR(MAJOR_ID)
);

INSERT INTO STUDENT (STUDENT_ID, MAJOR_ID, STUDENT_PW, STUDENT_NAME, STUDENT_EMAIL, STUDENT_SEM, CREDIT_LIMIT, EMAIL_VERIFY_CODE, EMAIL_VERIFY_DATE) VALUES ('S001', 'M001', '0000', '눈송이', 'snow@sm.ac.kr', 7, 19, null, null);