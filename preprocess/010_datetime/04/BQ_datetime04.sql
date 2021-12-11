# 全部JSTに直す
WITH datetime_jst AS (
    SELECT 
        TIMESTAMP(reserve_datetime, "Asia/Tokyo") AS reserve_timestamp,
        DATETIME(TIMESTAMP(reserve_datetime, "Asia/Tokyo")) AS reserve_datetime,
        DATE(TIMESTAMP(reserve_datetime, "Asia/Tokyo")) AS reserve_date
    FROM 
        `awesome-preprocessing.work.reserve_tb`
)

SELECT 
    reserve_timestamp,
    reserve_datetime,
    reserve_date,

    # 日時型データに加算する際は、DATE/DATETIME/TIMESTAMP_ADD関数を用いる。(引き算は*_SUB)
    DATETIME_ADD(reserve_datetime, INTERVAL 1 YEAR) AS datetime_add_year,
    DATETIME_ADD(reserve_datetime, INTERVAL 1 MONTH) AS datetime_add_month,
    DATETIME_ADD(reserve_datetime, INTERVAL 1 DAY) AS datetime_add_day,
    DATETIME_ADD(reserve_datetime, INTERVAL 1 HOUR) AS datetime_add_hour,
    DATETIME_ADD(reserve_datetime, INTERVAL 1 MINUTE) AS datetime_add_minute,
    DATETIME_ADD(reserve_datetime, INTERVAL 1 SECOND) AS datetime_add_second
FROM
    datetime_jst
