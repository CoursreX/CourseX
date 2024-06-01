-- 전체 수강조회 PL/SQL
DECLARE
    CURSOR enroll_cursor(v_student_id STUDENT.STUDENT_ID%TYPE) IS
        SELECT
            C.course_id AS COURSE_ID,
            C.course_name AS COURSE_NAME,
            C.course_no AS COURSE_NO,
            C.course_credit AS COURSE_CREDIT,
            F.faculty_name AS FACULTY_NAME,
            C.course_room AS COURSE_ROOM,
            C.course_day AS COURSE_DAY,
            C.course_time AS COURSE_TIME,
            C.course_cap AS COURSE_CAP,
            CASE
                WHEN E.enroll_stat = 1 THEN '신청완료'
                WHEN E.enroll_stat = 0 THEN '신청실패'
                ELSE ''
                END AS ENROLL_STAT
        FROM ENROLL E
                 JOIN COURSE C ON E.course_id = C.course_id AND E.course_no = C.course_no
                 JOIN FACULTY F ON C.faculty_id = F.faculty_id
        WHERE E.student_id = v_student_id;
BEGIN
    FOR enroll_row IN enroll_cursor('S001') LOOP
        DBMS_OUTPUT.PUT_LINE('과목번호: ' || enroll_row.COURSE_ID);
        DBMS_OUTPUT.PUT_LINE('과목명: ' || enroll_row.COURSE_NAME);
        DBMS_OUTPUT.PUT_LINE('분반: ' || enroll_row.COURSE_NO);
        DBMS_OUTPUT.PUT_LINE('학점: ' || enroll_row.COURSE_CREDIT);
        DBMS_OUTPUT.PUT_LINE('교수님: ' || enroll_row.FACULTY_NAME);
        DBMS_OUTPUT.PUT_LINE('강의실: ' || enroll_row.COURSE_ROOM);
        DBMS_OUTPUT.PUT_LINE('강의요일: ' || enroll_row.COURSE_DAY);
        DBMS_OUTPUT.PUT_LINE('강의시간: ' || enroll_row.COURSE_TIME);
        DBMS_OUTPUT.PUT_LINE('정원: ' || enroll_row.COURSE_CAP);
        DBMS_OUTPUT.PUT_LINE('신청결과: ' || enroll_row.ENROLL_STAT);
        DBMS_OUTPUT.PUT_LINE('========================================================');
    END LOOP;
END;
/