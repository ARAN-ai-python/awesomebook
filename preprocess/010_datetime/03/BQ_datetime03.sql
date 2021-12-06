# 全部JSTに直す
WITH datetime_jst AS (
    SELECT 
        DATETIME(TIMESTAMP(reserve_datetime, "Asia/Tokyo")) AS reserve_datetime,
        DATETIME(TIMESTAMP(checkin_date || ' ' || checkin_time, "Asia/Tokyo")) AS checkin_datetime
    FROM 
        `awesome-preprocessing.work.reserve_tb`
)

SELECT 
    reserve_datetime,
    checkin_datetime,

    # BQではDATEDIFFではなくDATE/DATETIME/TIMESTAMP_DIFFが使える
    # 指定した日時以下の日時要素は考慮しない(切り捨てられる)
    DATETIME_DIFF(checkin_datetime, reserve_datetime, YEAR) AS diff_year,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, MONTH) AS diff_month,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, WEEK) AS diff_week,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, DAY) AS diff_day,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, HOUR) AS diff_hour,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, MINUTE) AS diff_minute,
    DATETIME_DIFF(checkin_datetime, reserve_datetime, SECOND) AS diff_second,

    # ある単位で差分を計算する
    CAST(DATETIME_DIFF(checkin_datetime, reserve_datetime, SECOND) AS FLOAT64) / (60*60*24) AS diff_day2,
    CAST(DATETIME_DIFF(checkin_datetime, reserve_datetime, SECOND) AS FLOAT64) / (60*60) AS diff_hour2,
    CAST(DATETIME_DIFF(checkin_datetime, reserve_datetime, SECOND) AS FLOAT64) / 60 AS diff_minute2,
    CAST(DATETIME_DIFF(checkin_datetime, reserve_datetime, SECOND) AS FLOAT64) AS diff_second2,
FROM 
    datetime_jst
