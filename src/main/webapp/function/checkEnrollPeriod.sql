create OR REPLACE FUNCTION CHECK_ENROLL_PERIOD
RETURN NUMBER
IS
    v_period ENROLL_PERIOD%ROWTYPE;
BEGIN
SELECT PERIOD_START, PERIOD_END
INTO v_period.PERIOD_START, v_period.PERIOD_END
FROM ENROLL_PERIOD
WHERE PERIOD_YEAR = DATE_TO_ENROLL_YEAR() AND PERIOD_SEM = DATE_TO_ENROLL_SEMESTER();

IF SYSDATE BETWEEN v_period.PERIOD_START AND v_period.PERIOD_END THEN
        RETURN 1;
ELSE
        RETURN 0;
END IF;
END;
/