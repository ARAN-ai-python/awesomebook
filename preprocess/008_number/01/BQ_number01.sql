SELECT 
    CAST((40000.0 / 3) AS INT64) AS v_int2, #INT2, INT4, INT8は無いらしい
    CAST((40000.0 / 3) AS INT) AS FLOAT64 #FLOAT4. FLOAT8は無いらしい
FROM 
    `awesome-preprocessing.work.reserve_tb`
LIMIT 1
