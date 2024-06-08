CREATE OR REPLACE FUNCTION CHECK_OVERLAP(
    start_time1 IN VARCHAR2,
    end_time1 IN VARCHAR2,
    start_time2 IN VARCHAR2,
    end_time2 IN VARCHAR2
) RETURN NUMBER
AS
    v_start_time1 DATE;
    v_end_time1 DATE;
    v_start_time2 DATE;
    v_end_time2 DATE;
BEGIN
    -- 시간 문자열을 DATE 형식으로 변환
    v_start_time1 := TO_DATE(start_time1, 'HH24:MI');
    v_end_time1 := TO_DATE(end_time1, 'HH24:MI');
    v_start_time2 := TO_DATE(start_time2, 'HH24:MI');
    v_end_time2 := TO_DATE(end_time2, 'HH24:MI');

    -- 시간 간격이 겹치는지 확인
    IF v_start_time1 < v_end_time2 AND v_start_time2 < v_end_time1 THEN
        RETURN 1; -- 시간이 겹침
    ELSE
        RETURN 0; -- 시간이 겹치지 않음
    END IF;
END;
/
