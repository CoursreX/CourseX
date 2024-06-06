CREATE OR REPLACE PROCEDURE sumCredit (
    p_student_id IN STUDENT.STUDENT_ID%TYPE,
    p_enroll_year IN ENROLL.ENROLL_YEAR%TYPE,
    p_enroll_sem IN ENROLL.ENROLL_SEM%TYPE,
    p_total_credits OUT NUMBER, -- 총 학점 수
    p_has_results OUT NUMBER -- 조회 결과 여부
)
    IS
    -- 명시적 커서 선언
    CURSOR c_enroll_cursor( p_student_id IN STUDENT.STUDENT_ID%TYPE,
        p_enroll_year IN ENROLL.ENROLL_YEAR%TYPE,
        p_enroll_sem IN ENROLL.ENROLL_SEM%TYPE ) IS
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
                END AS ENROLL_STAT
        FROM ENROLL E
                 JOIN COURSE C ON E.course_id = C.course_id AND E.course_no = C.course_no
                 JOIN FACULTY F ON C.faculty_id = F.faculty_id
        WHERE E.student_id = p_student_id
          AND E.enroll_year = p_enroll_year
          AND E.enroll_sem = p_enroll_sem
          AND E.ENROLL_STAT = 1; -- 수강신청 완료된 과목만 가져옵니다.
BEGIN
    -- 총 학점을 초기화합니다.
    p_total_credits := 0;
    p_has_results := 0; -- 결과 여부 설정

    -- 커서를 사용하여 총 학점을 계산합니다.
    FOR enroll_record IN c_enroll_cursor( p_student_id,
                         p_enroll_year,
                         p_enroll_sem  ) LOOP
            p_total_credits := p_total_credits + enroll_record.COURSE_CREDIT;
            p_has_results := 1; -- 조회 결과가 있으면 1
        END LOOP;
END;
/