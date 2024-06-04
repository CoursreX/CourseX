CREATE TABLE ENROLL_PERIOD (
    PERIOD_ID VARCHAR2(20),
    PERIOD_YEAR NUMBER(4),
    PERIOD_SEM NUMBER(1),
    PERIOD_START DATE,
    PERIOD_END DATE,
    CONSTRAINT PK_ENROLL_PERIOD PRIMARY KEY (PERIOD_ID)
);

INSERT INTO ENROLL_PERIOD (PERIOD_ID, PERIOD_YEAR, PERIOD_SEM, PERIOD_START, PERIOD_END) VALUES ('EP001', 2024, 1, DATE '2024-02-10', TIMESTAMP '2024-02-10 17:00:00');