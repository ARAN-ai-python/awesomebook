WITH type_mst AS (
    SELECT 
        type,
        COUNT(*) AS record_cnt, # 製造数
        SUM(CASE WHEN fault_flg THEN 1 ELSE 0 END) AS fault_cnt # 障害数
    FROM 
        `awesome-preprocessing.work.production_tb`
    GROUP BY 
        type
)

SELECT 
    base.*,
    CAST(t_mst.fault_cnt - (CASE WHEN fault_flg THEN 1 ELSE 0 END) AS FLOAT64) / # FLOATではなくFLOAT64
    (t_mst.record_cnt - 1) AS type_fault_rate # 自身のレコードを除いて計算するために1を引いている
FROM 
    `awesome-preprocessing.work.production_tb` AS base
    INNER JOIN type_mst AS t_mst # 別にINNERって書かなくてもJOINだけでINNER JOINが指定される
        ON t_mst.type = base.type
