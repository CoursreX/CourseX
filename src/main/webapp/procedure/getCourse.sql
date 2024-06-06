CREATE OR REPLACE PROCEDURE GET_COURSE_INFO (
    v_search_type IN VARCHAR2,
    v_search_value IN VARCHAR2,
    course_cursor OUT SYS_REFCURSOR
) IS
BEGIN
    IF UPPER(v_search_type) = 'COURSE_ID' THEN
        OPEN course_cursor FOR
            SELECT
                C.course_id AS "COURSE_ID",
                C.course_name AS "COURSE_NAME",
                C.course_no AS "COURSE_NO",
                C.course_credit AS "COURSE_CREDIT",
                F.faculty_name AS "FACULTY_NAME",
                C.course_room AS "COURSE_ROOM",
                C.course_day AS "COURSE_DAY",
                C.course_time AS "COURSE_TIME",
                C.course_cap AS "COURSE_CAP",
                C.course_category AS "COURSE_CATEGORY",
                C.is_opened AS "IS_OPENED"
            FROM COURSE C
                     JOIN FACULTY F ON C.faculty_id = F.faculty_id
            WHERE C.course_id = v_search_value;

    ELSIF upper(v_search_type) = 'COURSE_NAME' THEN
        OPEN course_cursor FOR
            SELECT
                C.course_id AS "COURSE_ID",
                C.course_name AS "COURSE_NAME",
                C.course_no AS "COURSE_NO",
                C.course_credit AS "COURSE_CREDIT",
                F.faculty_name AS "FACULTY_NAME",
                C.course_room AS "COURSE_ROOM",
                C.course_day AS "COURSE_DAY",
                C.course_time AS "COURSE_TIME",
                C.course_cap AS "COURSE_CAP",
                C.course_category AS "COURSE_CATEGORY",
                C.is_opened AS "IS_OPENED"
            FROM COURSE C
                     JOIN FACULTY F ON C.faculty_id = F.faculty_id
            WHERE C.course_name = v_search_value;

    ELSIF upper(v_search_type) = 'COURSE_CATEGORY' THEN
        OPEN course_cursor FOR
            SELECT
                C.course_id AS "COURSE_ID",
                C.course_name AS "COURSE_NAME",
                C.course_no AS "COURSE_NO",
                C.course_credit AS "COURSE_CREDIT",
                F.faculty_name AS "FACULTY_NAME",
                C.course_room AS "COURSE_ROOM",
                C.course_day AS "COURSE_DAY",
                C.course_time AS "COURSE_TIME",
                C.course_cap AS "COURSE_CAP",
                C.course_category AS "COURSE_CATEGORY",
                C.is_opened AS "IS_OPENED"
            FROM COURSE C
                     JOIN FACULTY F ON C.faculty_id = F.faculty_id
            WHERE C.course_category = v_search_value;
    ELSE
        -- 검색 유형이 지원되지 않을 경우, 빈 결과 반환
        OPEN course_cursor FOR SELECT * FROM COURSE WHERE 1=0;
    END IF;
END;
/