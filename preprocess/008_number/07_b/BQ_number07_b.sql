SELECT 
    type,
    length,
    IF(thickness!="None" , CAST(thickness AS FLOAT64), 1.0) AS thickness,
    fault_flg
FROM
    `awesome-preprocessing.work.production_missing_num_tb`

/*
thicknessの欠損値はNoneのため、COALESCE関数は使えない。
代わりにIF文でthicknessがNoneかどうか判定して処理できた。
IFNULL文も使えそうかも

COALESCE関数を使って補完する場合
COALESCE(thickness, 1.0) AS thickness

IFNULL関数を使って補完する場合
IFNULL(thickness, 1.0) AS thickness
*/
