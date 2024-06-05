create PROCEDURE CANCEL_ENROLL (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_id IN ENROLL.ENROLL_ID%TYPE
) IS
    v_course_id ENROLL.COURSE_ID%TYPE;
BEGIN
    SELECT COURSE_ID
    INTO v_course_id
    FROM ENROLL
    WHERE ENROLL_ID = v_enroll_id;

    DELETE FROM ENROLL WHERE ENROLL_ID = v_enroll_id;
    UPDATE_CREDIT_LIMIT(v_student_id, v_course_id, 'CANCEL');
END;
/