create PROCEDURE UPDATE_CREDIT_LIMIT (
    v_student_id IN STUDENT.STUDENT_ID%TYPE,
    v_course_id IN COURSE.COURSE_ID%TYPE,
    v_action IN VARCHAR2 -- 'ENROLL', 'CANCEL', 'DROP'
) IS
    v_credit COURSE.COURSE_CREDIT%TYPE;
BEGIN
    SELECT COURSE_CREDIT
    INTO v_credit
    FROM (
             SELECT COURSE_CREDIT, ROW_NUMBER() OVER (ORDER BY COURSE_CREDIT) AS rn
             FROM COURSE
             WHERE COURSE_ID = v_course_id
         )
    WHERE rn = 1;

    IF UPPER(v_action) = 'ENROLL' THEN
        UPDATE STUDENT
        SET CREDIT_LIMIT = CREDIT_LIMIT - v_credit
        WHERE STUDENT_ID = v_student_id;
    ELSIF UPPER(v_action) IN ('CANCEL', 'DROP') THEN
        UPDATE STUDENT
        SET CREDIT_LIMIT = CREDIT_LIMIT + v_credit
        WHERE STUDENT_ID = v_student_id;
    END IF;
END;
/