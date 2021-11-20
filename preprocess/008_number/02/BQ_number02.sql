SELECT 
    *,
    LOG10(total_price / 1000 + 1) AS total_price_log #LOG関数だと底が自然対数で対数化してしまう。LOG10関数で底が10の対数化が出来る。
FROM 
    `awesome-preprocessing.work.reserve_tb`
