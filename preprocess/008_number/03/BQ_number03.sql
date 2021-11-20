SELECT 
    *,
    CAST(FLOOR(age / 10) * 10 AS INT64) AS age_rank #FLOOR関数で小数点以下を切り捨て、CASTで整数型に直す
FROM 
    `awesome-preprocessing.work.customer_tb`
