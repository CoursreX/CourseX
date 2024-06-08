CREATE TABLE COURSE (
    COURSE_ID VARCHAR2(20),
    COURSE_NO NUMBER(1),
    FACULTY_ID VARCHAR2(20),
    COURSE_NAME VARCHAR2(100),
    COURSE_CREDIT NUMBER(1),
    COURSE_CAP NUMBER(3),
    COURSE_DAY VARCHAR2(10),
    COURSE_TIME VARCHAR2(20),
    COURSE_ROOM VARCHAR2(30),
    COURSE_CATEGORY VARCHAR2(20),
    COURSE_ENROLLED NUMBER(3),
    IS_EXPANDED VARCHAR2(20),
    IS_OPENED NUMBER(1),
    CONSTRAINT PK_COURSE PRIMARY KEY (COURSE_ID, COURSE_NO),
    CONSTRAINT FK_COURSE_FACULTY FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY(FACULTY_ID),
    CONSTRAINT UQ_IS_EXPANDED UNIQUE (IS_EXPANDED)
);

INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C001', 1, 'F001', '데이터베이스프로그래밍', 3, 50, '월,수', '10:30-11:45', '명신관305', '전공', 0, 'CA001', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C002', 1, 'F005', '데이터사이언스개론', 3, 130, '월,수', '15:00-16:15', '명신관520', '전공', 0, 'CA002', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C002', 2, 'F005', '데이터사이언스개론', 3, 100, '화,목', '10:30-11:45', '명신관702', '전공', 0, 'CA003', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C002', 3, 'F005', '데이터사이언스개론', 3, 110, '화,목', '15:00-16:15', '명신관423', '전공', 0, 'CA004', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C003', 1, 'F011', '소프트웨어의이해', 3, 50, '화,목', '09:00-10:15', '명신관309', '전공', 0, 'CA005', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C003', 2, 'F014', '소프트웨어의이해', 3, 50, '화,목', '15:00-16:15', '명신관305', '전공', 0, 'CA006', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C003', 3, 'F013', '소프트웨어의이해', 3, 50, '월,수', '15:00-16:15', '명신관207', '전공', 0, 'CA007', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C004', 3, 'F010', '시스템종합설계(캡스톤디자인)', 3, 40, '금', '13:00-16:50', '프라임관304', '전공', 0, 'CA008', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C005', 1, 'F016', '시스템프로그래밍', 3, 100, '화,목', '12:00-13:15', '명신관702', '전공', 0, 'CA009', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C006', 1, 'F002', '운영체제', 3, 50, '화,목', '15:00-16:15', '명신관413', '전공', 0, 'CA010', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C006', 2, 'F002', '운영체제', 3, 50, '화,목', '16:30-17:45', '명신관413', '전공', 0, 'CA011', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C006', 3, 'F002', '운영체제', 3, 50, '화,목', '13:30-14:45', '명신관413', '전공', 0, 'CA012', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C007', 1, 'F015', '웹시스템설계', 3, 50, '화,목', '10:30-11:45', '명신관413', '전공', 0, 'CA013', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C008', 1, 'F011', '인공지능', 3, 50, '월,수', '09:00-10:15', '명신관309', '전공', 0, 'CA014', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C009', 1, 'F009', '임베디드시스템', 3, 50, '금', '12:00-15:50', '명신관519', '전공', 0, 'CA015', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C010', 1, 'F007', '자료구조', 3, 50, '월,수', '10:30-11:45', '명신관309', '전공', 0, 'CA016', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C010', 2, 'F007', '자료구조', 3, 100, '월,수', '13:30-14:45', '명신관605', '전공', 0, 'CA017', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C010', 3, 'F016', '자료구조', 3, 70, '화,목', '09:00-10:15', '명신관423', '전공', 0, 'CA018', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C011', 1, 'F010', '컴파일러', 3, 50, '월,수', '15:00-16:15', '프라임관204', '전공', 0, 'CA019', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C012', 1, 'F015', '컴퓨터구조', 3, 120, '화,목', '09:00-10:15', '명신관520', '전공', 0, 'CA020', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C013', 1, 'F003', '컴퓨터네트워크Ⅱ', 3, 50, '화,목', '10:30-11:45', '명신관302', '전공', 0, 'CA021', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C014', 1, 'F015', '프로그래밍개론', 3, 40, '화,목', '12:00-13:50', '명신관320', '전공', 0, 'CA022', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C015', 1, 'F010', '네트워크보안', 3, 60, '수,금', '13:30-14:45', '명신관322', '전공', 0, 'CA023', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C016', 1, 'F001', '데이터베이스설계와질의', 3, 70, '월,수', '10:30-11:45', '명신관701', '전공', 0, 'CA024', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C016', 2, 'F001', '데이터베이스설계와질의', 3, 70, '월,수', '13:30-14:45', '프라임관302', '전공', 0, 'CA025', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C016', 3, 'F001', '데이터베이스설계와질의', 3, 50, '화,목', '10:30-11:45', '명신관309', '전공', 0, 'CA026', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C017', 1, 'F002', '디지털논리회로', 3, 60, '화,목', '15:00-16:15', '명신관322', '전공', 0, 'CA027', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C017', 2, 'F002', '디지털논리회로', 3, 60, '화,목', '16:30-17:45', '명신관322', '전공', 0, 'CA028', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C018', 1, 'F004', '리눅스시스템', 3, 75, '월,수', '13:00-14:50', '프라임관203', '전공', 0, 'CA029', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C018', 2, 'F004', '리눅스시스템', 3, 75, '화,목', '10:00-11:50', '명신관701', '전공', 0, 'CA030', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C019', 1, 'F008', '머신러닝', 3, 90, '화,목', '15:00-16:15', '명신관520', '전공', 0, 'CA031', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C020', 1, 'F015', '모바일소프트웨어', 3, 40, '화,목', '12:00-13:15', '명신관305', '전공', 0, 'CA032', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C020', 2, 'F015', '모바일소프트웨어', 3, 40, '화,목', '13:30-14:45', '명신관305', '전공', 0, 'CA033', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C021', 1, 'F010', '알고리즘', 3, 60, '화,목', '09:00-10:15', '프라임관202', '전공', 0, 'CA034', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C021', 2, 'F010', '알고리즘', 3, 60, '화,목', '16:30-17:45', '프라임관202', '전공', 0, 'CA035', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C021', 3, 'F016', '알고리즘', 3, 50, '화,목', '10:30-11:45', '명신관313', '전공', 0, 'CA036', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C022', 1, 'F006', '자바프로그래밍', 3, 40, '월,수', '13:00-14:50', '명신관103', '전공', 0, 'CA037', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C022', 2, 'F006', '자바프로그래밍', 3, 40, '월,수', '15:00-16:50', '명신관103', '전공', 0, 'CA038', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C022', 3, 'F006', '자바프로그래밍', 3, 40, '화,목', '11:00-12:50', '명신관103', '전공', 0, 'CA039', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C022', 4, 'F006', '자바프로그래밍', 3, 40, '화,목', '13:00-14:50', '명신관103', '전공', 0, 'CA040', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C023', 1, 'F007', '컴퓨터그래픽스', 3, 70, '월,수', '10:30-11:45', '명신관423', '전공', 0, 'CA041', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C023', 2, 'F007', '컴퓨터그래픽스', 3, 70, '월,수', '13:30-14:45', '명신관423', '전공', 0, 'CA042', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C024', 1, 'F003', '컴퓨터네트워크Ⅰ', 3, 60, '월,수', '10:30-11:45', '명신관418', '전공', 0, 'CA043', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C024', 2, 'F003', '컴퓨터네트워크Ⅰ', 3, 60, '월,수', '12:00-13:15', '명신관701', '전공', 0, 'CA044', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C025', 1, 'F005', '컴퓨터수학', 3, 100, '화,목', '10:30-11:45', '명신관702', '전공', 0, 'CA045', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C025', 2, 'F005', '컴퓨터수학', 3, 100, '화,목', '15:00-16:15', '명신관418', '전공', 0, 'CA046', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C025', 3, 'F016', '컴퓨터수학', 3, 60, '화,목', '09:00-10:15', '명신관423', '전공', 0, 'CA047', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C026', 1, 'F008', '컴퓨터특강', 3, 50, '월,수', '15:00-16:15', '명신관313', '전공', 0, 'CA048', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C027', 1, 'F004', '프로그래밍언어론', 3, 70, '화,목', '10:30-11:45', '프라임관203', '전공', 0, 'CA049', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C027', 2, 'F004', '프로그래밍언어론', 3, 70, '월,수', '13:30-14:45', '프라임관204', '전공', 0, 'CA050', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C028', 1, 'F018', 'AI에관한윤리적이슈', 3, 30, '화,목', '10:45-12:00', '진리관234', '교양선택', 0, 'CA051', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C029', 1, 'F019', 'SM리더특강', 3, 40, '월,수', '09:00-10:30', '프라임관523', '교양선택', 0, 'CA052', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C029', 2, 'F019', 'SM리더특강', 3, 65, '금', '13:00-17:00', '사회관634', '교양선택', 0, 'CA053', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C030', 1, 'F020', '나를바꾸는나의습관', 3, 60, '화,목', '13:00-14:50', '프라임관123', '교양선택', 0, 'CA054', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C031', 1, 'F021', '문학과사랑의테마', 3, 40, '금', '10:30-14:45', '명신관236', '교양선택', 0, 'CA055', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C031', 2, 'F021', '문학과사랑의테마', 3, 70, '월,수', '13:30-14:45', '진리관647', '교양선택', 0, 'CA056', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C031', 3, 'F022', '문학과사랑의테마', 3, 60, '금', '13:00-17:00', '사회관334', '교양선택', 0, 'CA057', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C031', 4, 'F022', '문학과사랑의테마', 3, 30, '화,목', '09:00-10:30', '프라임관312', '교양선택', 0, 'CA058', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C032', 1, 'F023', '신화의이해', 2, 40, '금', '09:00-13:00', '사회관354', '교양선택', 0, 'CA059', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C032', 2, 'F024', '신화의이해', 2, 120, '월,수', '16:30-17:45', '프라임관425', '교양선택', 0, 'CA060', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C033', 1, 'F025', '철학개론', 2, 100, '월,수', '13:00-14:50', '명신관742', '교양선택', 0, 'CA061', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C034', 1, 'F026', '교양볼링', 2, 30, '화,목', '10:00-11:50', '진리관424', '교양선택', 0, 'CA062', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C035', 1, 'F028', '교양요가', 2, 90, '금', '13:30-14:45', '진리관412', '교양선택', 0, 'CA063', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C035', 2, 'F028', '교양요가', 2, 40, '월,수', '12:00-13:15', '사회관353', '교양선택', 0, 'CA064', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C035', 3, 'F029', '교양요가', 2, 80, '월,수', '09:00-10:30', '진리관231', '교양선택', 0, 'CA065', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C036', 1, 'F030', '교양풋살', 2, 40, '화,목', '09:00-10:15', '명신관553', '교양선택', 0, 'CA066', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C037', 1, 'F031', '웨이트트레이닝', 2, 150, '월,수', '16:30-17:45', '사회관563', '교양선택', 0, 'CA067', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C037', 2, 'F032', '웨이트트레이닝', 2, 120, '화,목', '09:00-10:30', '순헌관675', '교양선택', 0, 'CA068', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C038', 1, 'F033', '건축기행', 3, 30, '월,수', '13:30-14:45', '프라임관435', '교양선택', 0, 'CA069', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C039', 1, 'F034', '독일어권문화새롭게보기', 3, 40, '화,목', '09:00-10:30', '명신관713', '교양선택', 0, 'CA070', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C039', 2, 'F034', '독일어권문화새롭게보기', 3, 30, '월,수', '13:30-14:45', '순헌관412', '교양선택', 0, 'CA071', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C040', 1, 'F036', '법학개론', 3, 100, '월,수', '09:00-10:30', '사회관425', '교양선택', 0, 'CA072', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C041', 1, 'F035', '빅데이터윤리', 3, 40, '화,목', '12:00-13:15', '순헌관423', '교양선택', 0, 'CA073', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C042', 1, 'FO45', '수학개론', 3, 40, '화,목', '10:30-11:45', '프라임관513', '교양선택', 0, 'CA074', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C042', 2, 'FO45', '수학개론', 3, 50, '화,목', '10:45-12:00', '명신관741', '교양선택', 0, 'CA075', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C043', 1, 'F032', '발레의이해', 3, 30, '금', '09:00-12:00', '진리관313', '교양선택', 0, 'CA076', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C044', 1, 'FO44', '신화와놀이문화', 3, 45, '월,수', '16:30-17:45', '사회관252', '교양선택', 0, 'CA077', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C045', 1, 'FO48', '대학기초수학', 3, 40, '화,목', '15:00-16:30', '순헌관153', '교양선택', 0, 'CA078', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C045', 2, 'FO48', '대학기초수학', 3, 35, '월,수', '10:45-12:00', '프라임관532', '교양선택', 0, 'CA079', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C045', 3, 'FO48', '대학기초수학', 3, 70, '월,수', '09:00-10:30', '진리관153', '교양선택', 0, 'CA080', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C046', 1, 'F051', '경제학개론', 3, 30, '금', '13:00-17:00', '명신관613', '교양선택', 0, 'CA081', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C046', 2, 'F051', '경제학개론', 3, 40, '화,목', '15:00-16:30', '명신관521', '교양선택', 0, 'CA082', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C047', 1, 'F034', '뇌와행동', 3, 60, '월,수', '16:30-17:45', '진리관512', '교양선택', 0, 'CA083', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C048', 1, 'F036', '놀이의심리학', 3, 75, '화,목', '15:00-16:30', '명신관423', '교양선택', 0, 'CA084', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C049', 1, 'F035', '대화와심리', 3, 30, '월,수', '17:00-18:30', '프라임관542', '교양선택', 0, 'CA085', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C050', 1, 'F026', '커뮤니케이션과미디어', 3, 35, '화,목', '09:00-10:30', '진리관753', '교양선택', 0, 'CA086', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C051', 1, 'F029', '교양미술', 3, 55, '금', '10:00-12:00', '명신관244', '교양선택', 0, 'CA087', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C051', 2, 'F029', '교양미술', 3, 40, '화,목', '10:45-12:00', '프라임관862', '교양선택', 0, 'CA088', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C052', 1, 'F037', '실용한문', 3, 30, '월,수', '16:30-17:45', '명신관532', '교양선택', 0, 'CA089', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C053', 1, 'FO41', '아동심리학', 3, 50, '금', '13:00-17:00', '진리관642', '교양선택', 0, 'CA090', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C054', 1, 'FO45', '젠더로읽는여성', 3, 40, '화,목', '10:45-12:00', '프라임관111', '교양선택', 0, 'CA091', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C054', 2, 'FO45', '젠더로읽는여성', 3, 65, '화,목', '13:30-14:45', '명신관212', '교양선택', 0, 'CA092', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C055', 1, 'F049', '사랑과헌법', 3, 30, '화,목', '10:45-12:00', '진리관422', '교양선택', 0, 'CA093', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C055', 2, 'F049', '사랑과헌법', 3, 80, '화,목', '13:30-14:45', '진리관452', '교양선택', 0, 'CA094', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C055', 3, 'F049', '사랑과헌법', 3, 70, '월,수', '17:00-18:30', '명신관732', '교양선택', 0, 'CA095', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C056', 1, 'F052', '프랑스어', 3, 60, '월,수', '13:45-15:00', '순헌관532', '교양선택', 0, 'CA096', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C056', 2, 'F052', '프랑스어', 3, 50, '월,수', '13:30-14:45', '명신관512', '교양선택', 0, 'CA097', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C057', 1, 'F027', '한국미술사', 3, 30, '화,목', '14:00-15:15', '진리관312', '교양선택', 0, 'CA098', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C058', 1, 'F019', '현대미술의이해', 3, 30, '금', '13:00-17:00', '프라임관412', '교양선택', 0, 'CA099', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C059', 1, 'F006', '파이썬코딩', 3, 20, '월,수', '12:00-13:15', '명신관416', '교양선택', 0, 'CA100', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C060', 1, 'F022', '리더십', 3, 45, '화,목', '17:00-18:15', '사회관312', '교양선택', 0, 'CA101', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C061', 1, 'F037', '한국역사의이해', 3, 65, '월,수', '12:15-15:00', '명신관313', '교양선택', 0, 'CA102', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C062', 1, 'FO42', '일러스트레이션', 3, 85, '화,목', '15:45-16:50', '진리관314', '교양선택', 0, 'CA103', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C063', 1, 'FO45', '아두이노로배우는코딩', 3, 35, '월,수', '14:30-17:00', '진리관423', '교양선택', 0, 'CA104', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C063', 2, 'FO43', '아두이노로배우는코딩', 3, 60, '월,수', '18:00-19:00', '명신관534', '교양선택', 0, 'CA105', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C064', 1, 'FO47', '영화의이해', 3, 90, '화,목', '17:00-18:00', '명신관624', '교양선택', 0, 'CA106', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C064', 2, 'FO47', '영화의이해', 3, 100, '금', '13:00-17:00', '진리관143', '교양선택', 0, 'CA107', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C065', 1, 'FO48', '화학으로본세상이야기', 3, 25, '월,수', '10:45-12:00', '사회관743', '교양선택', 0, 'CA108', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C066', 1, 'F051', '호흡을통한웰빙무용', 3, 30, '화,목', '18:00-20:00', '명신관754', '교양선택', 0, 'CA109', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C067', 1, 'F050', '한국경제의이해', 3, 50, '화,목', '14:30-17:15', '순헌관851', '교양선택', 0, 'CA110', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C068', 1, 'F053', '패션과멀티콘텐츠', 3, 25, '월,수', '15:30-16:45', '명신관123', '교양선택', 0, 'CA111', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C069', 1, 'F052', '한국문화이해', 3, 50, '화,목', '10:00-11:15', '순헌관322', '교양선택', 0, 'CA112', 0);
INSERT INTO COURSE (COURSE_ID, COURSE_NO, FACULTY_ID, COURSE_NAME, COURSE_CREDIT, COURSE_CAP, COURSE_DAY, COURSE_TIME, COURSE_ROOM, COURSE_CATEGORY, COURSE_ENROLLED, IS_EXPANDED, IS_OPENED) VALUES ('C070', 1, 'F027', '종이접기공학', 3, 100, '금', '13:00-15:00', '프라임관310', '교양선택', 0, 'CA113', 0);