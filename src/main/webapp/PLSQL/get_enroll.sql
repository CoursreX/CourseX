-- 연도, 학기 파라미터 수강조회
CREATE FUNCTION GET_ENROLL_INFO (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_year IN ENROLL.ENROLL_YEAR%TYPE,
    v_enroll_sem IN ENROLL.ENROLL_SEM%TYPE
)
RETURN SYS_REFCURSOR IS
       enroll_cursor SYS_REFCURSOR;
BEGIN
    OPEN enroll_cursor FOR
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
            END AS COURSE_STAT
    FROM ENROLL E
             JOIN COURSE C ON E.course_id = C.course_id AND E.course_no = C.course_no
             JOIN FACULTY F ON C.faculty_id = F.faculty_id
    WHERE E.student_id = student_id
      AND E.enroll_year = v_enroll_year
      AND E.enroll_sem = v_enroll_sem;

    RETURN enroll_cursor;
END;
/