CREATE OR REPLACE PROCEDURE UPDATE_COURSE_SEATS (
    v_course_id IN COURSE.COURSE_ID%TYPE,
    v_course_no IN COURSE.COURSE_NO%TYPE,
    v_action IN VARCHAR2 -- 'ENROLL', 'CANCEL', 'DROP'
) IS
    v_applicants COURSE.COURSE_ENROLLED%TYPE;
BEGIN
    SELECT COURSE_ENROLLED
    INTO v_applicants
    FROM COURSE
    WHERE COURSE_ID = v_course_id AND COURSE_NO = v_course_no;

    IF UPPER(v_action) = 'ENROLL' THEN
        UPDATE COURSE
        SET COURSE_ENROLLED = COURSE_ENROLLED + 1
        WHERE COURSE_ID = v_course_id AND COURSE_NO = v_course_no;
    ELSIF UPPER(v_action) IN ('CANCEL', 'DROP') THEN
        UPDATE COURSE
        SET COURSE_ENROLLED = COURSE_ENROLLED - 1
        WHERE COURSE_ID = v_course_id AND COURSE_NO = v_course_no;
    END IF;
END;
/