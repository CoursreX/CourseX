-- createCourse_post.jsp

CREATE OR REPLACE FUNCTION CHECK_TIME(
    start_time IN VARCHAR2,
    end_time IN VARCHAR2
) RETURN NUMBER
AS
    v_time_diff NUMBER;
BEGIN
    SELECT ROUND((TO_DATE(end_time, 'HH24:MI') - TO_DATE(start_time, 'HH24:MI')) * 24, 3)
    INTO v_time_diff
    FROM DUAL;

    IF v_time_diff <= 0 THEN
        RETURN 0; -- 시작시간이 종료시간보다 늦을 때
    ELSE
        RETURN 1; -- 시작시간이 종료시간보다 빠를 때
    END IF;
END;
/