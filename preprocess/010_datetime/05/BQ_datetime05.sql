# 全部JSTに直す
WITH datetime_jst AS (
    SELECT 
        TIMESTAMP(reserve_datetime, "Asia/Tokyo") AS reserve_timestamp,
        EXTRACT(MONTH FROM TIMESTAMP(reserve_datetime, "Asia/Tokyo")) AS month
    FROM 
        `awesome-preprocessing.work.reserve_tb`
)

SELECT 
    reserve_timestamp,
    month,

    # CASE文で分ける
    CASE
        WHEN 3 <= month AND month <= 5 THEN "spring"
        WHEN 6 <= month AND month <= 8 THEN "summer"
        WHEN 9 <= month AND month <= 11 THEN "autumn"
        ELSE "winter"
    END AS season
FROM 
    datetime_jst
