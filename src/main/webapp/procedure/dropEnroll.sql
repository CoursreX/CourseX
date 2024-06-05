create PROCEDURE DROP_ENROLL (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_id IN ENROLL.ENROLL_ID%TYPE
) IS
    v_course_id ENROLL.COURSE_ID%TYPE;
BEGIN
    SELECT COURSE_ID
    INTO v_course_id
    FROM ENROLL
    WHERE ENROLL_ID = v_enroll_id;

    UPDATE ENROLL
    SET
        ENROLL_CANCEL = SYSDATE,
        ENROLL_STAT = 2
    WHERE ENROLL_ID = v_enroll_id;
    UPDATE_CREDIT_LIMIT(v_student_id, v_course_id, 'DROP');
END;
/