SELECT 
    type,
    length,
    COALESCE(thickness, 
            (SELECT AVG(thickness) FROM `awesome-preprocessing.work.production_missing_num_tb`)
            ) AS thickness,
    fault_flg
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
    
# 19.47038603649828が平均値としてNULL値に補完される
