create OR REPLACE PROCEDURE CANCEL_ENROLL (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_id IN ENROLL.ENROLL_ID%TYPE
) IS
    v_course_id ENROLL.COURSE_ID%TYPE;
    v_course_no ENROLL.COURSE_NO%TYPE;
BEGIN
    SELECT COURSE_ID, COURSE_NO
    INTO v_course_id, v_course_no
    FROM ENROLL
    WHERE ENROLL_ID = v_enroll_id;

    SELECT COURSE_NO
    INTO v_course_no
    FROM ENROLL
    WHERE ENROLL_ID = v_enroll_id;

    DELETE FROM ENROLL WHERE ENROLL_ID = v_enroll_id;
    UPDATE_CREDIT_LIMIT(v_student_id, v_course_id, 'CANCEL');
    UPDATE_COURSE_SEATS(v_course_id, v_course_no, 'CANCEL');
END;
/