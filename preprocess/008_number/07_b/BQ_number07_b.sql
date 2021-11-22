SELECT 
    type,
    length,
    COALESCE(thickness, 1.0) AS thickness,
    fault_flg
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`

/*
IFNULL関数, IF関数も使えそうかも

IFNULL関数を使って補完する場合
SELECT 
    type,
    length,
    IFNULL(thickness, 1.0) AS thickness,
    fault_flg
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
    
IF関数を使って補完する場合
SELECT 
    type,
    length,
    IF(thickness IS NULL, 1.0, thickness) AS thickness,
    fault_flg
FROM 
    `awesome-preprocessing.work.production_missing_num_tb`
*/
