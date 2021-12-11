# 結合のため、jstに直さない
SELECT 
    reserve_tb.checkin_date,
    holiday_mst_tb.holidayday_flg,
    holiday_mst_tb.nextday_is_holiday_flg
FROM 
    `awesome-preprocessing.work.reserve_tb` AS reserve_tb
INNER JOIN # 別にJOINでも可
    `awesome-preprocessing.work.holiday_mst_tb` AS holiday_mst_tb
        ON holiday_mst_tb.target_day = reserve_tb.checkin_date
