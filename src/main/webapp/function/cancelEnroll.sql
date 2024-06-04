create FUNCTION CANCEL_ENROLL (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_enroll_id IN ENROLL.ENROLL_ID%TYPE
) RETURN NUMBER IS
    v_course_id VARCHAR2(20);
    v_credit_limit NUMBER;
BEGIN
    SELECT COURSE_ID
    INTO v_course_id
    FROM ENROLL
    WHERE ENROLL_ID = v_enroll_id;

    DELETE FROM ENROLL WHERE ENROLL_ID = v_enroll_id;

    v_credit_limit := UPDATE_CREDIT_LIMIT(v_student_id, v_course_id, 'CANCEL');
    RETURN v_credit_limit;
END;
/