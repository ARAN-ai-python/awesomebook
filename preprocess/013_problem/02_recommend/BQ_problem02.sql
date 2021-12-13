# 顧客カテゴリマスタの作成
CREATE TABLE work.customer_category_mst AS (
    SELECT 
        customer_id,
        ROW_NUMBER() OVER()-1 AS customer_category_no
    FROM 
        `awesome-preprocessing.work.customer_tb`
    GROUP BY 
        customer_id
)

# ホテルカテゴリマスタの作成
CREATE TABLE work.hotel_category_mst AS (
    SELECT 
        hotel_id,
        ROW_NUMBER() OVER()-1 AS hotel_category_no
    FROM 
        `awesome-preprocessing.work.hotel_tb`
)

# 宿泊予約数の計算
SELECT 
    c_mst.customer_category_no,
    h_mst.hotel_category_no,
    COUNT(rsv.reserve_id) AS rsv_cnt
FROM 
    `awesome-preprocessing.work.reserve_tb` AS rsv
    JOIN `awesome-preprocessing.work.customer_category_mst` AS c_mst
        ON c_mst.customer_id = rsv.customer_id
    JOIN `awesome-preprocessing.work.hotel_category_mst` AS h_mst
        ON h_mst.hotel_id = rsv.hotel_id
WHERE 
    rsv.checkin_date BETWEEN '2016-01-01' AND '2017-01-01'
GROUP BY 
    c_mst.customer_category_no, h_mst.hotel_category_no
