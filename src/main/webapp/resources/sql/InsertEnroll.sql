CREATE OR REPLACE PROCEDURE InsertEnroll(
    sStudentId IN VARCHAR2,
    sCourseId IN VARCHAR2,
    nCourseNo IN NUMBER,
    result OUT VARCHAR2
)
IS
    too_many_sumCourseUnit EXCEPTION;
    too_many_courses EXCEPTION;
    too_many_students EXCEPTION;
    duplicate_time EXCEPTION;

    nYear NUMBER;
    nSemester NUMBER;
    nSumCourseUnit NUMBER;
    nCourseUnit NUMBER;
    nCnt NUMBER;
    nTeachMax NUMBER;
    nCourseCap Number;
    sEnrollId VARCHAR2(20);
BEGIN
    result := '';

    DBMS_OUTPUT.PUT_LINE('#');
    DBMS_OUTPUT.PUT_LINE(sStudentId || ' 님이 과목번호 ' || sCourseId || ', 분반 ' || TO_CHAR(nCourseNo) || '의 수강 등록을 요청하였습니다.');

    /* 년도, 학기 알아내기 */
    nYear := EXTRACT(YEAR FROM SYSDATE);
    nSemester := CASE WHEN EXTRACT(MONTH FROM SYSDATE) BETWEEN 3 AND 8 THEN 1 ELSE 2 END;

    /* 에러처리1: 최대학점 초과여부 */
    SELECT SUM(c.course_credit)
    INTO nSumCourseUnit
    FROM course c
             JOIN enroll e ON e.course_id = c.course_id AND e.course_no = c.course_no
    WHERE e.student_id = sStudentId AND e.enroll_year = nYear AND e.enroll_sem = nSemester;

    SELECT course_credit
    INTO nCourseUnit
    FROM course
    WHERE course_id = sCourseId AND course_no = nCourseNo;

    IF (nSumCourseUnit + nCourseUnit > 18) THEN
        RAISE too_many_sumCourseUnit;
    END IF;

    /* 에러처리2: 동일한 과목 신청여부 */
    SELECT COUNT(*)
    INTO nCnt
    FROM enroll
    WHERE student_id = sStudentId AND course_id = sCourseId;

    IF (nCnt > 0) THEN
        RAISE too_many_courses;
    END IF;

    /* 에러처리3: 수강신청 인원초과여부 */
    SELECT c.course_cap
    INTO nCourseCap
    FROM course c
    WHERE c.course_id = sCourseId AND c.course_no = nCourseNo;

    SELECT COUNT(*)
    INTO nCnt
    FROM enroll e
    WHERE e.enroll_year = nYear AND e.enroll_sem = nSemester
      AND e.course_id = sCourseId AND e.course_no = nCourseNo;

    IF (nCnt >= nTeachMax) THEN
        RAISE too_many_students;
    END IF;

    /* 에러처리4: 신청한 과목들 시간 중복 여부 */
    SELECT COUNT(*)
    INTO nCnt
    FROM (
             SELECT c.course_day, c.course_time
             FROM course c
             WHERE c.course_id = sCourseId AND c.course_no = nCourseNo
             INTERSECT
             SELECT c.course_day, c.course_time
             FROM course c
                      JOIN enroll e ON e.course_id = c.course_id AND e.course_no = c.course_no
             WHERE e.student_id = sStudentId AND e.enroll_year = nYear AND e.enroll_sem = nSemester
         );

    IF (nCnt > 0) THEN
        RAISE duplicate_time;
    END IF;

    /* 수강신청등록 */
    /* enroll_id 생성로직: "E+년도+학기+해당학기수강신청순번 */
    SELECT 'E' || TO_CHAR(nYear, 'FM0000') || TO_CHAR(nSemester, 'FM00') ||
           LPAD(TO_CHAR(COUNT(*) + 1), 4, '0')
    INTO sEnrollId
    FROM enroll
    WHERE enroll_year = nYear AND enroll_sem = nSemester;

    INSERT INTO enroll (
        enroll_id,
        student_id,
        course_id,
        course_no,
        enroll_date,
        enroll_year,
        enroll_sem
    ) VALUES (
                 sEnrollId,
                 sStudentId,
                 sCourseId,
                 nCourseNo,
                 SYSDATE,
                 nYear,
                 nSemester
             );

    COMMIT;
    result := '수강신청 등록이 완료되었습니다.';

EXCEPTION
    WHEN too_many_sumCourseUnit THEN
        result := '최대학점을 초과하였습니다.';
    WHEN too_many_courses THEN
        result := '이미 등록된 과목을 신청하였습니다.';
    WHEN too_many_students THEN
        result := '수강신청 인원이 초과되어 등록이 불가능합니다.';
    WHEN duplicate_time THEN
        result := '이미 등록된 과목 중 중복되는 시간이 존재합니다.';
    WHEN OTHERS THEN
        ROLLBACK;
        result := SQLCODE;
END;
/