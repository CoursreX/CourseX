CREATE OR REPLACE PROCEDURE InsertEnroll(
    sStudentId IN VARCHAR2,
    sCourseId IN VARCHAR2,
    nCourseNo IN NUMBER
)
    IS
    too_many_sumCourseUnit EXCEPTION;
    too_many_courses EXCEPTION;
    too_many_students EXCEPTION;
    duplicate_time EXCEPTION;

    nYear NUMBER;
    nSemester NUMBER;
    nCourseCredit NUMBER;
    nCnt NUMBER;
    nCourseCap NUMBER;
    nCourseApplicant NUMBER;
    nCreditLimit NUMBER;
    sEnrollId VARCHAR2(20);
BEGIN
    DBMS_OUTPUT.PUT_LINE('#');
    DBMS_OUTPUT.PUT_LINE(sStudentId || ' 님이 과목번호 ' || sCourseId || ', 분반 ' || TO_CHAR(nCourseNo) || '의 수강 등록을 요청하였습니다.');

    /* 년도, 학기 알아내기 */
    nYear := EXTRACT(YEAR FROM SYSDATE);
    nSemester := CASE WHEN EXTRACT(MONTH FROM SYSDATE) BETWEEN 3 AND 8 THEN 1 ELSE 2 END;

    /* 에러처리1: 최대학점 초과여부 */
    SELECT CREDIT_LIMIT
    INTO nCreditLimit
    FROM STUDENT
    WHERE student_id = sStudentId;

    SELECT COURSE_CREDIT
    INTO nCourseCredit
    FROM COURSE
    WHERE course_id = sCourseId AND course_no = nCourseNo;

    IF (nCourseCredit > nCreditlimit) THEN
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
    SELECT COURSE_CAP, COURSE_ENROLLED
    INTO nCourseCap, nCourseApplicant
    FROM COURSE
    WHERE course_id = sCourseId AND course_no = nCourseNo;

    IF (nCourseApplicant >= nCourseCap) THEN
        RAISE too_many_students;
    END IF;

    /* 에러처리4: 신청한 과목들 시간 중복 여부 */
    SELECT COUNT(*)
    INTO nCnt
    FROM (
             SELECT 1
             FROM course c1
             WHERE c1.course_id = sCourseId AND c1.course_no = nCourseNo
               AND EXISTS (
                 SELECT 1
                 FROM course c2
                          JOIN enroll e ON e.course_id = c2.course_id AND e.course_no = c2.course_no
                 WHERE e.student_id = sStudentId AND e.enroll_year = nYear AND e.enroll_sem = nSemester
                   AND c1.course_day = c2.course_day
                   AND CHECK_OVERLAP(
                               SUBSTR(c1.course_time, 1, 5),
                               SUBSTR(c1.course_time, 7, 5),
                               SUBSTR(c2.course_time, 1, 5),
                               SUBSTR(c2.course_time, 7, 5)
                           ) = 1
             )
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
        enroll_sem,
        enroll_stat
    ) VALUES (
                 sEnrollId,
                 sStudentId,
                 sCourseId,
                 nCourseNo,
                 SYSDATE,
                 nYear,
                 nSemester,
                 1
             );
    UPDATE_CREDIT_LIMIT(sStudentId, sCourseId, 'ENROLL');
    UPDATE_COURSE_SEATS(sCourseId, nCourseNo, 'ENROLL');

EXCEPTION
    WHEN too_many_sumCourseUnit THEN
        RAISE_APPLICATION_ERROR(-20001, '최대학점을 초과하였습니다.');
    WHEN too_many_courses THEN
        RAISE_APPLICATION_ERROR(-20002, '이미 등록된 과목을 신청하였습니다.');
    WHEN too_many_students THEN
        RAISE_APPLICATION_ERROR(-20003, '수강신청 인원이 초과되어 등록이 불가능합니다.');
    WHEN duplicate_time THEN
        RAISE_APPLICATION_ERROR(-20004, '이미 등록된 과목 중 중복되는 시간이 존재합니다.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20005, '예상치 못한 오류가 발생했습니다.');
END;
/