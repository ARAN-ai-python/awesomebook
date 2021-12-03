# 前処理大全の設問では「sex_and_age」とあるのに40_manのような出力になっている...
SELECT 
    *,
    sex || "_" || CAST(FLOOR(age / 10) * 10 AS STRING) AS sex_and_age
FROM 
    `awesome-preprocessing.work.customer_tb`
    
# ついでにCONCAT関数を使ったやり方も実践してみた
SELECT 
    *,
    CONCAT(sex, CONCAT("_", CAST(FLOOR(age / 10) * 10 AS STRING))) AS sex_and_age

FROM 
    `awesome-preprocessing.work.customer_tb`
