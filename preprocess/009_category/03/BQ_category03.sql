# 問題文を見て、最初に思いついたmore awesomeコード
SELECT 
    *,
    CASE 
        WHEN age < 60 THEN CAST(FLOOR(age / 10) * 10 AS STRING) #BQにTEXT型は無い
        ELSE "60歳以上"
    END AS age_rank
FROM 
    `awesome-preprocessing.work.customer_tb`
