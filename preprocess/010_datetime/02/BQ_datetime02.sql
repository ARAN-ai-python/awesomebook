# 全部JSTに直す
WITH reserve_dates AS (
    SELECT 
        TIMESTAMP(reserve_datetime, 'Asia/Tokyo') AS reserve_timestamp,
        DATETIME(TIMESTAMP(reserve_datetime, 'Asia/Tokyo')) AS reserve_datetime,
        DATE(TIMESTAMP(reserve_datetime, 'Asia/Tokyo')) AS reserve_date
    FROM 
        `awesome-preprocessing.work.reserve_tb`
)

SELECT 
    *,

    # DATE_PART関数ではなく、EXTRACT関数がある
    EXTRACT(YEAR FROM reserve_timestamp) AS year,
    EXTRACT(MONTH FROM reserve_timestamp) AS month,
    EXTRACT(DAY FROM reserve_timestamp) AS day,
    EXTRACT(DAYOFWEEK FROM reserve_timestamp) AS day_of_week, # 日曜日=0、月曜日=1、...金曜日=6
    EXTRACT(HOUR FROM reserve_timestamp) AS hour,
    EXTRACT(MINUTE FROM reserve_timestamp) AS minute,
    EXTRACT(SECOND FROM reserve_timestamp) AS second,

    # TO_CHAR関数ではなく、STRING関数を用いる
    STRING(reserve_timestamp) AS reserve_timestamp_string
FROM 
    reserve_dates
