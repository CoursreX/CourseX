create OR REPLACE PROCEDURE SEARCH_ENROLL (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_year IN ENROLL.ENROLL_YEAR%TYPE,
    v_enroll_sem IN ENROLL.ENROLL_SEM%TYPE,
    enroll_cursor OUT SYS_REFCURSOR
) IS
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
    C.course_cap AS COURSE_CAP
FROM ENROLL E
         JOIN COURSE C ON E.course_id = C.course_id AND E.course_no = C.course_no
         JOIN FACULTY F ON C.faculty_id = F.faculty_id
WHERE E.student_id = v_student_id
  AND E.enroll_year = v_enroll_year
  AND E.enroll_sem = v_enroll_sem
  AND E.ENROLL_STAT = 1;
END;
/